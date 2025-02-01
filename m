Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EFE1CACF6
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 17:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738430959; cv=none; b=utgH4uIOmfPAjDSi04d/qqFBgINEulXSdct2AD4df2a3srk71nxwMctSkh+2sL/9C5iMQ6I6SPRg3lt3k2aHhl43X2RiRbQ6o0bBN9/p55SBy/8kNvYhalMHozaC1H3j104u8yMEwIPsCLI+RiuT7E2RqCUqWxABb2trx0qtjik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738430959; c=relaxed/simple;
	bh=XL7ng8U88IdS02LpqkHkwAED27Q7ZWUI6j1I8zn2UOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p3ke4usg75HCAqoZHwe7GPXunjyIkQHUqFebQ8J8Vssuu9yh1925f3mk/FaoViEy3RCdaFbGeIynuXq6V/m8mylxviD4odPtXPbKl58GhArZBqm7vJh2gqklN38+A+xlXUMGfl5lhDt1MbAXy5VPfxjQtEwtxas0lfiws/NkKJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KfHwvFmB; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KfHwvFmB"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30229d5b21cso22303361fa.1
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 09:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738430955; x=1739035755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0uDfHhxafnqOPaFWheOWVq1hqVSH+SO7a7CETbeXIaY=;
        b=KfHwvFmBZyLa2PSSusFUe30jY6VCcqpEH06RwFDkfRoCLpv0VUvd2s2/DuUq9KEYjh
         8YzE4kmn5e3I5uAzjdoOSt2pttJp3K6TeHq77vQYwjbqR28ujLGBgtIzEDD4JmWszZYc
         bq3iAREoPL1aitzvK1ZMOciiY8DZKTHWKBK1Zxcu2gaLimhG2VXltOdK14yggJtqZxA9
         fx8Ivtoy/L7Ct7CY9VopzPehhRGRGzdb2orqvtYAxOOo6S6fii4gUqZ2KroeeeuoX80I
         EJ4f3P6ZhtxJe9efoZEzcxhuV1x4Vmi+qwQavvqTm162yvWTuiPYlYEiPGbxlQBAYoV8
         36yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738430955; x=1739035755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0uDfHhxafnqOPaFWheOWVq1hqVSH+SO7a7CETbeXIaY=;
        b=lpW44tZ+n6CXW1n39IcTVthZCOa2mtkMdNfloCg14scym2MVg4Gf8L5QgEFVstSQAU
         PNcolX8sRotYRELy7gJo410su6F6c5W30Up1AVsVN/lPneZ3IIsvto/mDhngRpPS/XiQ
         LDta88Ukyr3xJfUt7sVPkZ2UPyYfOu2DclEB6a0TLMs056r1Gf3IGdRSP5wjQ9/SWBU7
         ufvboj//ldi5+wlpkEDuhDNmzvvWs76YJCvQeRckEMcDdm+OV9vOJkely3fvZRWvBrWI
         GjhL/K81koH4QPy6/0RY3Ke8bsE1NSm3o+hUzSCB9PdaECJo7w8LTCUAkP/WbOL1lQ+q
         cmig==
X-Forwarded-Encrypted: i=1; AJvYcCXI0byknsh2jvQ2eqz/JCX9zJVYnClQGdCBT4ssGvkbbMS1mt7L2QGs5H9NyHxaw/lkeEZsY6cgGJM9Uq4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDyJr8WcQAH3cmxG9cast8SPVvlA5R2mqcmwWzrRgYtLBMf7KQ
	J/b9R673bGu7e1MAIxoU8vhrsaOUeimheVssUjocqnphWu+itnbasmb1jTM9yJY=
X-Gm-Gg: ASbGncuuD48BGlkGBQh39D0ABLE6JtrDudMub1zf4ZHanrqKqmAtFOojUf5weUDvNPp
	jvsjbnuGQeuri91SW97OUYkoTmAMbmRcm5TgbtPc1y7RZ9wBTkv9KooUpcWVbl1R1K0dwNfOmvh
	SPMD1e0tqUZpxr8ym9G5NSAlm9W9aRr70eFOb/79ZxczXN+FZuDX2QrWjGbDNrF53U91u0d9ucZ
	j4KWeUfKGnbkWaGMX6uRTZAPNEQJn78avYcdF0KIHH8EZKS11hmbEzpVtE99i1+80padCVa4/HB
	G3/dTVqbAI6gechIOjH1w8M=
X-Google-Smtp-Source: AGHT+IE8Hr0IX1pCMwiAV7uh2gFAGtFlcOaMwnAab/6lNNmleqqSsFzR5DBmNYTKJ5CEK4pnv3A0/w==
X-Received: by 2002:a2e:a883:0:b0:307:95de:e3ed with SMTP id 38308e7fff4ca-3079695147bmr48071951fa.29.1738430955520;
        Sat, 01 Feb 2025 09:29:15 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a3099ec4sm8852161fa.48.2025.02.01.09.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 09:29:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 01 Feb 2025 19:29:08 +0200
Subject: [PATCH v2 2/6] Bluetooth: qca: simplify WCN399x NVM loading
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250201-rb1-bt-v2-2-fd44011749bb@linaro.org>
References: <20250201-rb1-bt-v2-0-fd44011749bb@linaro.org>
In-Reply-To: <20250201-rb1-bt-v2-0-fd44011749bb@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1590;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=XL7ng8U88IdS02LpqkHkwAED27Q7ZWUI6j1I8zn2UOs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnnlnlKDKbhsJaGXbR4PVQjNYuqdjhhv6ocj8q7
 i/6BfARIcOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ55Z5QAKCRCLPIo+Aiko
 1fYtB/41pLaxBJKwD+/915Gb2NS7XQyQthMPAb770YCfU+7esQ1bltInu1iz1OdsV1kglAk5BCj
 W6KEuaGZWEm2z0Gv/zn5v0tsRF00jBbs/Ve6Mw8tXVpq26884M8wuDbwOirVy6ZGprjRIKlkAQv
 wWAOtdyA81ML/lJqiv9Uub3AVIK6AyquLi3LZiq+eCd1wHObd6BNBaR77gBdpm7aAKgt03bliZp
 1AvX/WghLA+7XA8cl7LVmUeRZXOI57r1fUZ6Hm4aVAM6GPjVUy6+R7kKSqqo9TdmezMOYbXkLvG
 ahiheDRCGEiY/6KPled/jtQXFsx4W7U2n7bZvLMTP8FLjZKC
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The WCN399x code has two separate cases for loading the NVM data. In
preparation to adding support for WCN3950, which also requires similar
quirk, split the "variant" to be specified explicitly and merge two
snprintfs into a single one.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/bluetooth/btqca.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index cdf09d9a9ad27c080f27c5fe8d61d76085e1fd2c..7d6b02fe2040ff16d9d62de683571e1e1900fe85 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -785,6 +785,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		   const char *firmware_name, const char *rampatch_name)
 {
 	struct qca_fw_config config = {};
+	const char *variant = "";
 	int err;
 	u8 rom_ver = 0;
 	u32 soc_ver;
@@ -883,13 +884,11 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
 		case QCA_WCN3990:
 		case QCA_WCN3991:
 		case QCA_WCN3998:
-			if (le32_to_cpu(ver.soc_id) == QCA_WCN3991_SOC_ID) {
-				snprintf(config.fwname, sizeof(config.fwname),
-					 "qca/crnv%02xu.bin", rom_ver);
-			} else {
-				snprintf(config.fwname, sizeof(config.fwname),
-					 "qca/crnv%02x.bin", rom_ver);
-			}
+			if (le32_to_cpu(ver.soc_id) == QCA_WCN3991_SOC_ID)
+				variant = "u";
+
+			snprintf(config.fwname, sizeof(config.fwname),
+				 "qca/crnv%02x%s.bin", rom_ver, variant);
 			break;
 		case QCA_WCN3988:
 			snprintf(config.fwname, sizeof(config.fwname),

-- 
2.39.5

