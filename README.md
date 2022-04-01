# Spanish Language Models 💃🏻

A repository part of the MarIA project.

## Corpora 📃

| Corpora | Number of documents | Number of tokens | Size (GB) |
|---------|---------------------|------------------|-----------|
| BNE     |         201,080,084 |  135,733,450,668 |     570GB |

## Models 🤖
- RoBERTa-base BNE: https://huggingface.co/PlanTL-GOB-ES/roberta-base-bne
- RoBERTa-large BNE: https://huggingface.co/PlanTL-GOB-ES/roberta-large-bne 
- GPT2-base BNE: https://huggingface.co/PlanTL-GOB-ES/gpt2-base-bne
- GPT2-large BNE: https://huggingface.co/PlanTL-GOB-ES/gpt2-large-bne 
- Other models: _(WIP)_

## Fine-tunned models 🧗🏼‍♀️🏇🏼🤽🏼‍♀️🏌🏼‍♂️🏄🏼‍♀️

- RoBERTa-base-BNE for Capitel-POS: https://huggingface.co/PlanTL-GOB-ES/roberta-base-bne-capitel-pos
- RoBERTa-large-BNE for Capitel-POS: https://huggingface.co/PlanTL-GOB-ES/roberta-large-bne-capitel-pos
- RoBERTa-base-BNE for Capitel-NER: https://huggingface.co/PlanTL-GOB-ES/roberta-base-bne-capitel-ner
- RoBERTa-base-BNE for Capitel-NER: https://huggingface.co/PlanTL-GOB-ES/roberta-base-bne-capitel-ner-plus (**very robust**)
- RoBERTa-large-BNE for Capitel-NER: https://huggingface.co/PlanTL-GOB-ES/roberta-large-bne-capitel-ner
- RoBERTa-base-BNE for SQAC: https://huggingface.co/PlanTL-GOB-ES/roberta-base-bne-sqac
- RoBERTa-large-BNE for SQAC: https://huggingface.co/PlanTL-GOB-ES/roberta-large-bne-sqac

## Word embeddings 🔤
Word embeddings trained with FastText for 300d:
- CBOW Word embeddings: https://zenodo.org/record/5044988
- Skip-gram Word embeddings: https://zenodo.org/record/5046525

## Datasets 🗂️

- Spanish Question Answering Corpus (SQAC)🦆: https://huggingface.co/datasets/PlanTL-GOB-ES/SQAC

## Evaluation ✅
| Dataset      | Metric   | [**RoBERTa-b**](https://huggingface.co/PlanTL-GOB-ES/roberta-base-bne)   | [RoBERTa-l](https://huggingface.co/PlanTL-GOB-ES/roberta-large-bne) | [BETO](https://huggingface.co/dccuchile/bert-base-spanish-wwm-cased)*   | [mBERT](https://huggingface.co/bert-base-multilingual-cased)  | [BERTIN](https://huggingface.co/bertin-project/bertin-roberta-base-spanish/tree/v1-512)** | [Electricidad](https://huggingface.co/mrm8488/electricidad-base-generator)*** |
|--------------|----------|------------|------------|------------|--------|--------|---------|
| MLDoc        | F1       |     0.9664 |     0.9702 | **0.9714**🔥 | 0.9617 | 0.9668 |  0.9565 |
| CoNLL-NERC   | F1       | **0.8851**🔥 |     0.8823 |     0.8759 | 0.8691 | 0.8835 |  0.7954 |
| CAPITEL-NERC | F1       |     0.8960 | **0.9051**🔥 |     0.8772 | 0.8810 | 0.8856 |  0.8035 |
| PAWS-X       | F1       |     0.9020 | **0.9150**🔥 |     0.8930 | 0.9000 | 0.8965 |  0.9045 |
| UD-POS       | F1       | **0.9907**🔥 |     0.9904 |     0.9900 | 0.9886 | 0.9898 |  0.9818 |
| CAPITEL-POS  | F1       |     0.9846 | **0.9856**🔥 |     0.9836 | 0.9839 | 0.9847 |  0.9816 |
| SQAC         | F1       |     0.7923 | **0.8202**🔥 |     0.7923 | 0.7562 | 0.7678 |  0.7383 |
| STS          | Combined |     **0.8533**🔥 |     0.8411 |     0.8159 | 0.8164 | 0.7945 |  0.8063 |
| XNLI         | Accuracy |     0.8016 | **0.8263**🔥 |     0.8130 | 0.7876 | 0.7890 |  0.7878 |

_* A model based on BERT architecture._

_** A model based on RoBERTa architecture._

_*** A model based on Electra architecture._


## Usage example ⚗️
For the RoBERTa-base
```python
from transformers import AutoModelForMaskedLM
from transformers import AutoTokenizer, FillMaskPipeline
from pprint import pprint
tokenizer_hf = AutoTokenizer.from_pretrained('PlanTL-GOB-ES/roberta-base-bne')
model = AutoModelForMaskedLM.from_pretrained('PlanTL-GOB-ES/roberta-base-bne')
model.eval()
pipeline = FillMaskPipeline(model, tokenizer_hf)
text = f"¡Hola <mask>!"
res_hf = pipeline(text)
pprint([r['token_str'] for r in res_hf])
```

For the RoBERTa-large
```python
from transformers import AutoModelForMaskedLM
from transformers import AutoTokenizer, FillMaskPipeline
from pprint import pprint
tokenizer_hf = AutoTokenizer.from_pretrained('PlanTL-GOB-ES/roberta-large-bne')
model = AutoModelForMaskedLM.from_pretrained('PlanTL-GOB-ES/roberta-large-bne')
model.eval()
pipeline = FillMaskPipeline(model, tokenizer_hf)
text = f"¡Hola <mask>!"
res_hf = pipeline(text)
pprint([r['token_str'] for r in res_hf])
```

## Other Spanish Language Models 👩‍👧‍👦
We are developing domain-specific language models:

- ⚖️ [Legal Language Model](https://github.com/PlanTL-GOB-ES/lm-legal-es)
- ⚕️ [Biomedical and Clinical Language Models](https://github.com/PlanTL-GOB-ES/lm-biomedical-clinical-es) 

## Cite 📣
```
@article{PLN6405,
	author = {Asier Gutiérrez-Fandiño y Jordi Armengol-Estapé y Marc Pàmies y Joan Llop-Palao y Joaquin Silveira-Ocampo y Casimiro Pio Carrino y Carme Armentano-Oller y Carlos Rodriguez-Penagos y Aitor Gonzalez-Agirre y Marta Villegas},
	title = {MarIA: Modelos del Lenguaje en Español},
	journal = {Procesamiento del Lenguaje Natural},
	volume = {68},
	number = {0},
	year = {2022},
	keywords = {},
	abstract = {This work presents MarIA, a family of Spanish language models and associated resources made available to the industry and the research community. Currently, MarIA includes RoBERTa-base, RoBERTa-large, GPT2 and GPT2-large Spanish language models, which can arguably be presented as the largest and most proficient language models in Spanish. The models were pretrained using a massive corpus of 570GB of clean and deduplicated texts with 135 billion words extracted from the Spanish Web Archive crawled by the National Library of Spain between 2009 and 2019. We assessed the performance of the models with nine existing evaluation datasets and with a novel extractive Question Answering dataset created ex novo. Overall, MarIA models outperform the existing Spanish models across a variety of NLU tasks and training settings.},
	issn = {1989-7553},
	url = {http://journal.sepln.org/sepln/ojs/ojs/index.php/pln/article/view/6405},
	pages = {39--60}
}
```

## Contact 📧
📋 We are interested in (1) extending our corpora to make larger models (2) train/evaluate the model in other tasks.

For questions regarding this work, contact Asier Gutiérrez-Fandiño (<plantl-gob-es@bsc.es>)
