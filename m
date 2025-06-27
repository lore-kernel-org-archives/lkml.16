Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408D22EA165
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039503; cv=none; b=rRtB1OD2vIxTDu7XnlJrfqNwSt67rRgMYgc7XmZToyDtFpopm5YEvCfnI9HjBdCxGoU9RrFxaO30mUdgefAo30SlUVZSOwy1aj2QIVP20l6/OWbVV8uBWrfJNO21rrHNiEDo6d8gGb5NDJ+fyg7NFZFWjnMvP9NEn+0ot/HVKbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039503; c=relaxed/simple;
	bh=rrpMQ1E4iwggRxxnDMouaI49aKRceYXQAlCbBGAsp6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AvaTb7Qk1vnYpfqNwnyqLsfO4CRk3xyjfxBX41nmUKvIuNU/TRriR5Ex8ViUXBTBw7jZuWT/mBvJXkOR8oK9dP4xJk7qQBXmh/lNBRtHcXCIsR8cBgrn5BBhWR+laFNXQqpCCuAaji7ZSiXNzMWtiyOokEsUBiHDQ9lVN599pJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZ3GhbRV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZ3GhbRV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBVSAV017816
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2vhRT9pyQld
	uYdOZGVvt9iYSzdMJUQQ042+Y51qekQ4=; b=FZ3GhbRVnAGalPJjAjSTRuBATrT
	6CyvNTaTRnkzs5dVGGDMmYrim10Cf2Vb1wYTbBKg4bDKPVVewOIiJKwcogBgWxJv
	1t8ZnEIr0G9el6ITG0qP2oC6eD11cO8nTggKYg1iYURZddtpSytPfzflzaXqN3b7
	56Ly5AOu++oS5hN5loE9ywW9rlPISqBI8U6dLTAY4SLjqMIozQO74J34okWjMAsw
	8KIZLdzOsJkP7CzvafGxE+LAv9OmP2wTKvZJ6MoeYWPcTxdKz+d/G1ZWifDRlZRa
	3Sd8t/W88Xm+/rA8jEWash2aycXYlCWp0HYjNF76MgCwH43NopH1XuiIgZQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx5p65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:51:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c790dc38b4so390386685a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039499; x=1751644299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vhRT9pyQlduYdOZGVvt9iYSzdMJUQQ042+Y51qekQ4=;
        b=dzsIRPpCZcXkAJmy3Hw4PsKKqR723Qet7Q9X8qkdEQQYLy/pCPFYdeVEQU05sq8Y2U
         8a3ol6fHvRf8k0gOLuz2QW/PL3gVDB3ZxrFvmAcqLIxI7IMunHbDwzra9jCMvvqF0L1E
         /o39l3MQZdL6C5Vg9HHzqz4S6DFLK/KHmTIUOoxFK22nY64EyXinzgm0PIHVXLP6/cqP
         yPIZLkmo2sqAqLdXaOeCgtkvCmWhfsL/MzAJaNZwhbkouAGcBmJJU7uaMG/Lgiwf37qP
         J2AZkKT4E3oeQAlNGbowvPJ/7QGY3GClUcS67sjCATPA6wuU2u6AqWah2xdnJ/JWx93j
         yTcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV61ifuHdoo8vp59wXp4romWIbHPyZsZaKAmPhsN6Spt0MsxVDSuSQzM1k4AyOqijuLJx3XGaUnrjQVo3c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Rt8GRQFE/Q/vkWBawvyVu9+YyJkwdPSgz92Eem+/RRxJNC1a
	VFzj3knmvrnrznWNtwwuBvJE9BoUivE0oQb6lLfTLL8p/Hu8cibpVbCmxm15f/RK5ylezohtCJZ
	N6YYzNStJTMLZ1+mUoAyxzZR9LLdkeZf1Vz4j3HK32pYuip4/YjPDYbBnS6Bghxtdc9I=
X-Gm-Gg: ASbGncs+86y3VPg2tUg6x07+Y71ikIMMIPuF4qB57Cge646deQzH6XQ2fmuFNJti6cl
	uM0BI09i0Bdknk1NaYDRCRNlsdF35IjkzaZG7ibahGt2wSQEnjr4BBb39dMasVndPUJvfWj6Gwk
	crDELiQ+IZCkPiP/mH57OOf9VN1lOPjYz7lGYFmz8hK+qMb1lrzpgY9BKS0wopDnqJzKZ35ACM0
	6ageK/RDYo5QpTFtdLeDOyLQfroJABcWlRWo7Kp6KK8NKPKu8O9vc3AGZnIrMsoMk5YCLGnzJ7m
	W6hJVlk8ABrjIjszEIWuu6cs4K9p9M4Y33VpfZ4TTZOJYs8OY0L1kUg=
X-Received: by 2002:a05:620a:2846:b0:7d4:4a26:41f with SMTP id af79cd13be357-7d44a2605demr142906885a.1.1751039499039;
        Fri, 27 Jun 2025 08:51:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvaTcwAPq1YNRUVMbQaKWyHye8wAp4l3xvIwPgQOh7wtKWTPWLTcKoZ4P4hWbFXtRiRc2UAA==
X-Received: by 2002:a05:620a:2846:b0:7d4:4a26:41f with SMTP id af79cd13be357-7d44a2605demr142902985a.1.1751039498522;
        Fri, 27 Jun 2025 08:51:38 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f8absm3082663f8f.95.2025.06.27.08.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:51:38 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/4] ASoC: codecs: wcdxxxx: use of_sdw_find_device_by_node helper
Date: Fri, 27 Jun 2025 16:51:02 +0100
Message-ID: <20250627155103.441547-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Rplcox07T5K_VziaqXkk42K8zkL_ElO0
X-Proofpoint-ORIG-GUID: Rplcox07T5K_VziaqXkk42K8zkL_ElO0
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685ebe0c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=VO0QnzvMDvqADXZeruwA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyOSBTYWx0ZWRfXz3JlJvOf9quB
 Ai/kiTEs9IIfGviehsgOTkvKEMK2cmOJdlRCzTQAAUvEvQaZjY/84L6NH9Ljj5ro+y1D4VryQJX
 h+jOYgg7OTZ99u7+WGfFXs4CZVtMHw8yvgI8ib/cn45GLPiXSn3FE2hfJObr5NCWM6GGaZdCd9v
 Gu20vA86U6P0yrLxCIpDALiDQDF08dPmvOov+AUXo5ZE/n5nXMfKuf5tYUJbQ54Z3wzYRe+UJSF
 AVu7n0vuiKbdHX2Av7tGg4zlSZKvE/IefNg1OlfOEr6LVQb8vvRX/JgSRDIhkLDxf+gdaNNeWP2
 oui/ehQJGmEY0QFP3Gk1PDlKmNeEWy88CClSovvksjbPBWZzar2OU4iC5ina4Eb0QVF6Ei2UrGi
 Sp88IHC1MmDdYf7ymR3SrQfIo+7sgpqrRkCnjCFtOdg2aMpCU4iME/DbouHAJqRrXeeFouAU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270129

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

use of_sdw_find_device_by_node helper function, rather than duplicating
this function in every codec driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wcd937x-sdw.c | 6 ------
 sound/soc/codecs/wcd937x.c     | 4 ++--
 sound/soc/codecs/wcd937x.h     | 2 --
 sound/soc/codecs/wcd938x-sdw.c | 7 -------
 sound/soc/codecs/wcd938x.c     | 4 ++--
 sound/soc/codecs/wcd938x.h     | 6 ------
 sound/soc/codecs/wcd939x-sdw.c | 6 ------
 sound/soc/codecs/wcd939x.c     | 4 ++--
 sound/soc/codecs/wcd939x.h     | 6 ------
 9 files changed, 6 insertions(+), 39 deletions(-)

diff --git a/sound/soc/codecs/wcd937x-sdw.c b/sound/soc/codecs/wcd937x-sdw.c
index 1bfe7383b311..e7cc699bd8bc 100644
--- a/sound/soc/codecs/wcd937x-sdw.c
+++ b/sound/soc/codecs/wcd937x-sdw.c
@@ -78,12 +78,6 @@ static struct sdw_dpn_prop wcd937x_dpn_prop[WCD937X_MAX_SWR_PORTS] = {
 	}
 };
 
-struct device *wcd937x_sdw_device_get(struct device_node *np)
-{
-	return bus_find_device_by_of_node(&sdw_bus_type, np);
-}
-EXPORT_SYMBOL_GPL(wcd937x_sdw_device_get);
-
 int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 3b1a1518e764..ad1ec0a2b38d 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2789,7 +2789,7 @@ static int wcd937x_bind(struct device *dev)
 		return ret;
 	}
 
-	wcd937x->rxdev = wcd937x_sdw_device_get(wcd937x->rxnode);
+	wcd937x->rxdev = of_sdw_find_device_by_node(wcd937x->rxnode);
 	if (!wcd937x->rxdev) {
 		dev_err(dev, "could not find slave with matching of node\n");
 		return -EINVAL;
@@ -2798,7 +2798,7 @@ static int wcd937x_bind(struct device *dev)
 	wcd937x->sdw_priv[AIF1_PB] = dev_get_drvdata(wcd937x->rxdev);
 	wcd937x->sdw_priv[AIF1_PB]->wcd937x = wcd937x;
 
-	wcd937x->txdev = wcd937x_sdw_device_get(wcd937x->txnode);
+	wcd937x->txdev = of_sdw_find_device_by_node(wcd937x->txnode);
 	if (!wcd937x->txdev) {
 		dev_err(dev, "could not find txslave with matching of node\n");
 		return -EINVAL;
diff --git a/sound/soc/codecs/wcd937x.h b/sound/soc/codecs/wcd937x.h
index 4ef57c496c37..09b87984cecc 100644
--- a/sound/soc/codecs/wcd937x.h
+++ b/sound/soc/codecs/wcd937x.h
@@ -550,8 +550,6 @@ int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai);
 
-struct device *wcd937x_sdw_device_get(struct device_node *np);
-
 #else
 int wcd937x_sdw_free(struct wcd937x_sdw_priv *wcd,
 		     struct snd_pcm_substream *substream,
diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index cabddadc90ef..b4a0b66b34df 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -82,13 +82,6 @@ static struct sdw_dpn_prop wcd938x_dpn_prop[WCD938X_MAX_SWR_PORTS] = {
 	}
 };
 
-struct device *wcd938x_sdw_device_get(struct device_node *np)
-{
-	return bus_find_device_by_of_node(&sdw_bus_type, np);
-
-}
-EXPORT_SYMBOL_GPL(wcd938x_sdw_device_get);
-
 int wcd938x_swr_get_current_bank(struct sdw_slave *sdev)
 {
 	int bank;
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 8c9f67dedb83..7c345217298d 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3412,7 +3412,7 @@ static int wcd938x_bind(struct device *dev)
 		return ret;
 	}
 
-	wcd938x->rxdev = wcd938x_sdw_device_get(wcd938x->rxnode);
+	wcd938x->rxdev = of_sdw_find_device_by_node(wcd938x->rxnode);
 	if (!wcd938x->rxdev) {
 		dev_err(dev, "could not find slave with matching of node\n");
 		ret = -EINVAL;
@@ -3421,7 +3421,7 @@ static int wcd938x_bind(struct device *dev)
 	wcd938x->sdw_priv[AIF1_PB] = dev_get_drvdata(wcd938x->rxdev);
 	wcd938x->sdw_priv[AIF1_PB]->wcd938x = wcd938x;
 
-	wcd938x->txdev = wcd938x_sdw_device_get(wcd938x->txnode);
+	wcd938x->txdev = of_sdw_find_device_by_node(wcd938x->txnode);
 	if (!wcd938x->txdev) {
 		dev_err(dev, "could not find txslave with matching of node\n");
 		ret = -EINVAL;
diff --git a/sound/soc/codecs/wcd938x.h b/sound/soc/codecs/wcd938x.h
index fb6a0e4ef337..dbafcae247f4 100644
--- a/sound/soc/codecs/wcd938x.h
+++ b/sound/soc/codecs/wcd938x.h
@@ -670,7 +670,6 @@ int wcd938x_sdw_hw_params(struct wcd938x_sdw_priv *wcd,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai);
 
-struct device *wcd938x_sdw_device_get(struct device_node *np);
 int wcd938x_swr_get_current_bank(struct sdw_slave *sdev);
 
 #else
@@ -697,11 +696,6 @@ static inline int wcd938x_sdw_hw_params(struct wcd938x_sdw_priv *wcd,
 	return -EOPNOTSUPP;
 }
 
-static inline struct device *wcd938x_sdw_device_get(struct device_node *np)
-{
-	return NULL;
-}
-
 static inline int wcd938x_swr_get_current_bank(struct sdw_slave *sdev)
 {
 	return 0;
diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
index f7a9323a9fea..e487a1bb0194 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -128,12 +128,6 @@ static struct sdw_dpn_prop wcd939x_tx_dpn_prop[WCD939X_MAX_TX_SWR_PORTS] = {
 	}
 };
 
-struct device *wcd939x_sdw_device_get(struct device_node *np)
-{
-	return bus_find_device_by_of_node(&sdw_bus_type, np);
-}
-EXPORT_SYMBOL_GPL(wcd939x_sdw_device_get);
-
 unsigned int wcd939x_swr_get_current_bank(struct sdw_slave *sdev)
 {
 	return FIELD_GET(SDW_SCP_STAT_CURR_BANK,
diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 16c670e00aa8..0727af4789cb 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -3390,7 +3390,7 @@ static int wcd939x_bind(struct device *dev)
 		goto err_put_typec_switch;
 	}
 
-	wcd939x->rxdev = wcd939x_sdw_device_get(wcd939x->rxnode);
+	wcd939x->rxdev = of_sdw_find_device_by_node(wcd939x->rxnode);
 	if (!wcd939x->rxdev) {
 		dev_err(dev, "could not find slave with matching of node\n");
 		ret = -EINVAL;
@@ -3399,7 +3399,7 @@ static int wcd939x_bind(struct device *dev)
 	wcd939x->sdw_priv[AIF1_PB] = dev_get_drvdata(wcd939x->rxdev);
 	wcd939x->sdw_priv[AIF1_PB]->wcd939x = wcd939x;
 
-	wcd939x->txdev = wcd939x_sdw_device_get(wcd939x->txnode);
+	wcd939x->txdev = of_sdw_find_device_by_node(wcd939x->txnode);
 	if (!wcd939x->txdev) {
 		dev_err(dev, "could not find txslave with matching of node\n");
 		ret = -EINVAL;
diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
index 3204fb10b58d..3f189e5cafd5 100644
--- a/sound/soc/codecs/wcd939x.h
+++ b/sound/soc/codecs/wcd939x.h
@@ -930,7 +930,6 @@ int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai);
 
-struct device *wcd939x_sdw_device_get(struct device_node *np);
 unsigned int wcd939x_swr_get_current_bank(struct sdw_slave *sdev);
 
 struct regmap *wcd939x_swr_get_regmap(struct wcd939x_sdw_priv *wcd);
@@ -958,11 +957,6 @@ static inline int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
 	return -EOPNOTSUPP;
 }
 
-static inline struct device *wcd939x_sdw_device_get(struct device_node *np)
-{
-	return NULL;
-}
-
 static inline unsigned int wcd939x_swr_get_current_bank(struct sdw_slave *sdev)
 {
 	return 0;
-- 
2.49.0

