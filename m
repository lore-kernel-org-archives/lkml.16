Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264A02D77F0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 12:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751631165; cv=none; b=TFRXGm6LhmLDQ0XfeKbROFDf6cBxpJ5sCwH6t5oKrf5u1HDmJ8n6+GAxuTb8783IBPJ9Egl5AnI3U2gaL2q8AVJJc41ma+8199oh5X3KR0XZ+cl6hCRMP94vg2OUhFJ9mYQw9vO9u1DTyjAFNysf2TUkFeMDIg+YyFlkV73IFMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751631165; c=relaxed/simple;
	bh=PcbfqiyUxEwZf8tEqhL5i8VnQjldetFluKwYbrgGgZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JR2wa6xt2hHE/DXcZFiP/YMwtJsjBENWxkIcG0dyD7BpFgOZp7j/9ECQd6lYthIENj+IiLq052GKXjNqJhmnvNqqzvePWUgJ42G31b0uz1zf4fa8G2bjXNJiqEUZ4pJuAnyfaqMYs+a2V8SBxbovEoWm717iTkZ2x/BP+4329P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TQp9dl66; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TQp9dl66"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5646US7a022178
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 12:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tDaEr5HJ73z
	Ver8qFn0D9NcPZgapsA83KNJlQT6UT4k=; b=TQp9dl66SzTG9b5ZrL5EBQZRtKc
	C9be+2/fgMC52K5ngBqsFrIiz2aOnjpZf5f43FYRlBlj3/FYy0RSEdhRX1PvjpAL
	ghcqUo5pMVQYspAle7Mgc8376NKAgwHPMq69uFPnMrE0FGTeCakuuedvr5H7fmA8
	KYfMmYLRu3amKrY2omoVXBSpv/A+8j4COtNy6WTkxGGCAqonoZyTkp2nVy9Ydn/G
	8OSwNllRSR5/f9o33tQXEhutMWygpQbJJCdRy5qNDr8WokTLhStswykqL4mCSyUm
	eG5yGzXm0cy2pZ+dO+wz0iBOaNwXpeNzT36ENP6eVgzXQKCxjOYnNXDEzQw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmkq7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 12:12:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d413a10b4cso136096385a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 05:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751631162; x=1752235962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDaEr5HJ73zVer8qFn0D9NcPZgapsA83KNJlQT6UT4k=;
        b=VcyWkIK/6IUConmXY5leD03O+/npW6OAW614J1Qtng3E4B+eU7+RVP+byIChsA6Ykw
         GRrLpx1IbOdllr0fhpOlz/AYuZRbRzZA3YPTqSgF+LCa8iQHM65tnGlk1+Q/oRgTcYte
         Ps+Meb9y2ERV/tPhvKqW3D3bbV8bTrdAACrwU4qSIdLMHPedo/UqQDJPuivekrO3+efC
         /p0nqopNpXM7Pf2dCeo8Si7sIkGXoBFjOaWMpXGEHtzfkbhsC58KE+n1Sp5fAa88YOHJ
         aDCNTrdrIT90FXXyF5N/UFvd93SasfiV47gIpH5z2sST7wXFsN1WD4uopTvEpw72moBh
         mAzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh6oKeAZeR19y+qBzKJ4u8SXdSDp4wp5cvREbegd1hUziN/1fDchpyH7ZQyNW3qkCkZ4OJAhal+eJeXIM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaQhyQfY6ZjwFg5auD6to1A+3eH1zhNn56vgqBzFqMtOCkfuRx
	JuIkh6Kt9nqPNeVvkCjapG1LoNUhIi9yCQJRYE8wAZFHAvAIolgKxFsDEy68x5SVxnV4tDPUhfa
	FyEoeiqSazs6KeJutlqFaRJFviesVgUoM3IG0/YHx/uy7A4b6vPR6v+FLiAeoG9iJIB0=
X-Gm-Gg: ASbGncu1phzkycaKxkKteG7l1pRV6HAHzfG48J4XjJiU3KvvmcvwaNk+oiERT9J1m8H
	c8B9CBYt0ofJ8gvUzLXg6dbhNdRd90Nu2EgqPNo0njit1OWngi5ZWZTT7gErRxe6fTWzEWIqZfV
	/x3XcLFZo5i4ocKXfKQ5/4kP1n5j93fgiVIy/hxoV7MubHo3aEkLt9MgiO0VJ1JZ+4opcu+GbmB
	n2Ff3TW06fjYGOCj59+HtFrwsgasTF+hW75MlkE0ekcRIQNq7oZxbpshgu2isPoaruHRO2XF88o
	HwkqXD6vvEZN+YdtLEswBzHm1HNfVwJuVPxNmJSe9HGs7kHiCXZ58FU=
X-Received: by 2002:a05:620a:1b9c:b0:7d3:f15c:ee33 with SMTP id af79cd13be357-7d5ddb32326mr268163185a.10.1751631161890;
        Fri, 04 Jul 2025 05:12:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtEBcpu43GmpwUkYOsPuU7nA6/okhLPVbExuC2SKjRUk1+q6SREj3BuKFcufebfAJ1Nm0SEQ==
X-Received: by 2002:a05:620a:1b9c:b0:7d3:f15c:ee33 with SMTP id af79cd13be357-7d5ddb32326mr268157985a.10.1751631161272;
        Fri, 04 Jul 2025 05:12:41 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a997de2asm53656745e9.12.2025.07.04.05.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 05:12:40 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 3/4] ASoC: codecs: wcdxxxx: use of_sdw_find_device_by_node helper
Date: Fri,  4 Jul 2025 13:12:17 +0100
Message-ID: <20250704121218.1225806-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704121218.1225806-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250704121218.1225806-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6867c53a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VO0QnzvMDvqADXZeruwA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Y2aizWXJoQ4TSPuP-XTWcR1ayhqhMEpg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA5MyBTYWx0ZWRfXwJ6gQhbHiKcl
 DM9HBT8j8oM1IZjvp8uVEXHAy70sIjOmr8PBZdwBOEcY9XYOIJlJri6Kk6rnqcvSdXoYZ1eh6RK
 zUSd+7cqbem41/Ikq00P+Y/3u8DWswPKm6Rg/aCCdCLdvr9aghlhk0X7ZgMAU1EBijc3491dpBr
 iB0kGfiZeNLZptYuau1fXvzcLEmuyOZMQaePcc0DM4MZvCOXti46z5LiCb1IG7TweMQMGGwQDKV
 6xlJIrPdEwhdT8krC8KuUGmokch3bUZXJfU1MsNsp4p5yFToQwx87pzDTZThjy6qGLPhZ6eeGGL
 pbKlXqkM4RlkczeKxkDwPbcpS8o+6bqmZdGVmOLCAivf2E1Td8wmYqXM3xkJD4hF+WiBHu2p9Qa
 DofXFEjR5IUl8LioHUOIubTQbKelmaqc00ZBFluT+/u7ZbzAxfClO4tv6Asa5x7Gz0b+Wq4E
X-Proofpoint-GUID: Y2aizWXJoQ4TSPuP-XTWcR1ayhqhMEpg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040093

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

use of_sdw_find_device_by_node helper function, rather than duplicating
this function in every codec driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
index 3b0a8cc314e0..ccd542033967 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2788,7 +2788,7 @@ static int wcd937x_bind(struct device *dev)
 		return ret;
 	}
 
-	wcd937x->rxdev = wcd937x_sdw_device_get(wcd937x->rxnode);
+	wcd937x->rxdev = of_sdw_find_device_by_node(wcd937x->rxnode);
 	if (!wcd937x->rxdev) {
 		dev_err(dev, "could not find slave with matching of node\n");
 		return -EINVAL;
@@ -2797,7 +2797,7 @@ static int wcd937x_bind(struct device *dev)
 	wcd937x->sdw_priv[AIF1_PB] = dev_get_drvdata(wcd937x->rxdev);
 	wcd937x->sdw_priv[AIF1_PB]->wcd937x = wcd937x;
 
-	wcd937x->txdev = wcd937x_sdw_device_get(wcd937x->txnode);
+	wcd937x->txdev = of_sdw_find_device_by_node(wcd937x->txnode);
 	if (!wcd937x->txdev) {
 		dev_err(dev, "could not find txslave with matching of node\n");
 		return -EINVAL;
diff --git a/sound/soc/codecs/wcd937x.h b/sound/soc/codecs/wcd937x.h
index 3ab21bb5846e..49e5dce6f8c9 100644
--- a/sound/soc/codecs/wcd937x.h
+++ b/sound/soc/codecs/wcd937x.h
@@ -549,8 +549,6 @@ int wcd937x_sdw_hw_params(struct wcd937x_sdw_priv *wcd,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai);
 
-struct device *wcd937x_sdw_device_get(struct device_node *np);
-
 #else
 int wcd937x_sdw_free(struct wcd937x_sdw_priv *wcd,
 		     struct snd_pcm_substream *substream,
diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index e822cc145250..a7514d716086 100644
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
index 711f373ece24..e2cb0758bca7 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3400,7 +3400,7 @@ static int wcd938x_bind(struct device *dev)
 		return ret;
 	}
 
-	wcd938x->rxdev = wcd938x_sdw_device_get(wcd938x->rxnode);
+	wcd938x->rxdev = of_sdw_find_device_by_node(wcd938x->rxnode);
 	if (!wcd938x->rxdev) {
 		dev_err(dev, "could not find slave with matching of node\n");
 		ret = -EINVAL;
@@ -3409,7 +3409,7 @@ static int wcd938x_bind(struct device *dev)
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
index 64f082e474c1..5a56c79a8922 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -3383,7 +3383,7 @@ static int wcd939x_bind(struct device *dev)
 		goto err_put_typec_switch;
 	}
 
-	wcd939x->rxdev = wcd939x_sdw_device_get(wcd939x->rxnode);
+	wcd939x->rxdev = of_sdw_find_device_by_node(wcd939x->rxnode);
 	if (!wcd939x->rxdev) {
 		dev_err(dev, "could not find slave with matching of node\n");
 		ret = -EINVAL;
@@ -3392,7 +3392,7 @@ static int wcd939x_bind(struct device *dev)
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

