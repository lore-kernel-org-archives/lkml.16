Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DD419A;
	Sat,  5 Apr 2025 00:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743812008; cv=none; b=Va5p1NsEEaebD8RiduEyZT+uikkVrnPMHPe2zrv3do04J85S9hAl4zxUEC/kPxl9b4f1GEnEq2Pnjzl19qqqKbZnx8areWBVY4yOJ92Z2KHK27OoeaIKYVrxcTL13ftPvAMkhvdhDL5ytbulKvrzr01krQePzdsMwiFesXxc1QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743812008; c=relaxed/simple;
	bh=f6jfQ/88AiYOjJM4FQA4xhqhbwINz9bzASTHENbgqmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kfWW/3gh62hAbhlcTyDbs4Q9Xkf2v3PTBI0Uig7goph18XQC2+kZKvgzZODi6azXIq8XN5Zz9iGkSYlyRC2lTB5G2xw22bFlj0VhfndGvR/sO0+MYxVGSIDrpLzsnSsjEcecZbUPfMcwHeST+WYbPqmk8xAi08Iu6JuXnXGgPj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nqr3nNyv; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nqr3nNyv"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-301d6cbbd5bso2473908a91.3;
        Fri, 04 Apr 2025 17:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743812005; x=1744416805; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NodibefyrwcdYV12iHxzgF1tA6aiaYOYVIR+A6BXYk=;
        b=Nqr3nNyvoAKn9lSwAXxix0WNpxWiqC3UFuTZE/DDPm2F4EHCd8a1nL0rUIO8htTVxq
         7TqsV47sgscqVsiyICVcsvFIPUAZe18bytOAUBLVAU+DT5naHCECWuNb3aabjByq7FLy
         ofcyNfiS+Pl6zPZaRrCC049lKzmFNzQxV/JTgk+sv9iyW1/zwrfgdtsTf2oQmcN/J3PT
         R+j/HBy4Ok5IgXRMOLAQmWwIn5GnZebhx2/UNNnUQqXFsUmA49OsyFBeXKsEuFWJ/+iS
         N3ByIyw3Si2oi1YJ4dUTQKAvHgetX/BjzPXpPbc5GaWKj2acSHmk0vPDO3Y6MKujMuIE
         S6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743812005; x=1744416805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3NodibefyrwcdYV12iHxzgF1tA6aiaYOYVIR+A6BXYk=;
        b=WOsfq0EFkDySrM9tABcxsO1iKdLzmnpLKIuzUkt6OYunmsiEZ8oRUBfzpqkUCoJY4n
         0tSsBc7tfw9Olk38zoEDKPRbMDUBag+96juY9UJR9EH9Ik45bOqa//I5/oWcGy3yBFTt
         gp1hQu94Gs9J3Z43NsNsFicCClJsG91Mo2xbnBXbSru8Dz2CnaCpdSjaOGcU/8vT8FZS
         ZoXi4sZluQB3/NizJfFfIEw4pFU4dYG7v1xuhwaVd1SSQQtbBB09z4fM5grx/iVqGOz+
         IPVjjMef4NzNIq26S5nHlYn4ltjnUdwVivueTIB0Ztc62CtXGAJtWoSEkmdYzrvaQTso
         3Ulg==
X-Forwarded-Encrypted: i=1; AJvYcCU3b/GkXJbXRwuOUFeWJ8H+72AbiayUEgiu2StnawE1X98GMFrnKjjI28yYG+/cUQiKwhE4yLnHBAaV@vger.kernel.org, AJvYcCU4chQRTUd1dmf5ao/Ni0RFhp3RCx/x+p1KAgKp/yMGceXMrQ1tFq0KT1uC34daC9B1Q0fYHzLqeEOAVk8=@vger.kernel.org, AJvYcCUPDg8ZZfa2Oh6WOHQBlYjAj8IDxnW4oVm2QkXLir/8taRAeVuGbjUE3DAETYh97q1+a8IGLH1myFncSns=@vger.kernel.org, AJvYcCVmNI1+MVo1crYbQ5FRV54dxEo2guH3sY2Qyed7+r6TPa+U8CN6h+ObNBiVH5qqk0ykfYojAV8mm7nBi+gG@vger.kernel.org
X-Gm-Message-State: AOJu0YwvEUgtr2w9M8qFYVf0orm7GclavrNASm8yJxeVGLrFZlZbSAx+
	Lun7tU9jqrjWyN8sI1hUqwWyL+TCESi8wA8k9XR7e/dGWzvlP8cIK4MWPasB
X-Gm-Gg: ASbGncs4SsmPgCymmWJHO6h7rigWhiJqd6lTKVG73HcmE9DDhQ8K8DJPyE2iHIuuh+v
	1ZUAh6nKUOVlJcY72TOJN9O4XBMMbkiqBCXor3M9fh+ImdOYFtw/OhlqsTLaG83DZwygXWTZCW5
	oM32/pwhHa2fv6fSESTWBAtlh6ok7gN1ZWL2hHctjiwF/RKNNbLWcUlLWZVNoXJKKN/fmagUb0E
	IwBOjcEdNxzrJtdxSkhf5PwHdxs6NtZGkRa1cUrfGoKsWFnDU2Ol9px7I8faAHx8SSEOvfL6l7W
	LpDGC/mN658UKETQGRm7FCX6+0q/yG9CB2E4D6C22XgITpGw9HJPpJxNMh5cDNmvkkZSRVtxvlE
	TJYH5E99FvF88+5kdxoWhzut7XizPL1n6NYA0k5zCXPsmBKUsyg==
X-Google-Smtp-Source: AGHT+IHhYRLWPbHit70b6szW6jPN57D9CZB9OEYkJ2U08WfRInETE/q6qPTaQ+Gi9IAC8oOPoD0FLg==
X-Received: by 2002:a17:90b:5744:b0:2ee:ad18:b309 with SMTP id 98e67ed59e1d1-306a47c2e08mr6716477a91.3.1743812005436;
        Fri, 04 Apr 2025 17:13:25 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5d665sm4327855a91.30.2025.04.04.17.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 17:13:25 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 05 Apr 2025 10:12:40 +1000
Subject: [PATCH v4 03/10] ASoC: tas2770: Set the SDOUT polarity correctly
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250405-apple-codec-changes-v4-3-d007e46ce4a2@gmail.com>
References: <20250405-apple-codec-changes-v4-0-d007e46ce4a2@gmail.com>
In-Reply-To: <20250405-apple-codec-changes-v4-0-d007e46ce4a2@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-hwmon@vger.kernel.org, 
 Neal Gompa <neal@gompa.dev>, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1794;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=IV6wUgfUMxyD6pt+5eKhp5GW9w/s3PRc7V37XTxa8ZU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfSluP+AQec+5hab1cU6a6OaDOOuGR9OOW70yGik/7f
 bMmpl3vKGVhEONikBVTZNnQJOQx24jtZr9I5V6YOaxMIEMYuDgFYCJPqxgZDlpkWvxoaP9oz+Fg
 Mc15xs4m0fofrgHWUof/e0ZMWzbdm5Fh5v1DCyp+Hdi8sEi75lHgpNkz+TRu2NTyPpr+I7rd9Ox
 OBgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

TX launch polarity needs to be the opposite of RX capture polarity, to
generate the right bit slot alignment.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 55e4723044044338bd941763240d24ccfef6e8f3..806ad36397977c3fd350ba437b70f6bfcd814d29 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -351,7 +351,7 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	struct snd_soc_component *component = dai->component;
 	struct tas2770_priv *tas2770 =
 			snd_soc_component_get_drvdata(component);
-	u8 tdm_rx_start_slot = 0, invert_fpol = 0, fpol_preinv = 0, asi_cfg_1 = 0;
+	u8 tdm_rx_start_slot = 0, invert_fpol = 0, fpol_preinv = 0, asi_cfg_1 = 0, asi_cfg_4 = 0;
 	int ret;
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
@@ -368,6 +368,7 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		fallthrough;
 	case SND_SOC_DAIFMT_NB_NF:
 		asi_cfg_1 |= TAS2770_TDM_CFG_REG1_RX_RSING;
+		asi_cfg_4 |= TAS2770_TDM_CFG_REG4_TX_EDGE_FALLING;
 		break;
 	case SND_SOC_DAIFMT_IB_IF:
 		invert_fpol = 1;
@@ -386,6 +387,12 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	if (ret < 0)
 		return ret;
 
+	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
+					    TAS2770_TDM_CFG_REG4_TX_EDGE_FALLING,
+					    asi_cfg_4);
+	if (ret < 0)
+		return ret;
+
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
 		tdm_rx_start_slot = 1;

-- 
2.49.0

