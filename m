Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B08221F30
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876404; cv=none; b=YpZB7NKeSUyxIqcKjIMddJGOopjwvIbVhT/7aRKckCWDgx37K93G9iew3pzz2EwsBKt+63pLBHWG3PnN4xWa1HAy18cv60JzjUrqlEGgD9Roe1pnFOipKbUg0UcPCCzUBzzA876XZ1w1enLuLQe9FDlmCKTSY7bZBnZsiSuvfrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876404; c=relaxed/simple;
	bh=pOcJBUPrO3IHcq4bNWfUkk9NpnjdVXjrL/ybQbsKrdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fHMVEyxJmRNR9DENyxFVGr0K9jQR76sT0wyGPA+6wCdydynbdXqA0AwEg44mLN6LeKDFrXASw3nKd82QXjYjPfaZSMjVTgBpfRBokBv7GRsxNyfQybpdJAa3EbrHOLb3MMiStdtsV1fF9wO5Hqa3Vynb6l1kvicp/6Ko74UQt1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pa2s6fQT; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pa2s6fQT"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e82396baaeso95381a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876401; x=1745481201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ldtjm18t2KR0i37dRzkUBtGT6ZljIzsaE7OH3uDOb4U=;
        b=pa2s6fQTLPjxHm58e8D2FvB8+0xZdkb9JDmjKuLZi7ftYF7DH/PnX6jxfckks8o3iJ
         nh1VZUJS7FzPsGOPrlj4lvcNOimg56QX0yxnokCGM+f9W5gkIri4a+KLh6/YYgn7uKrV
         VIQdLtSBaoFemjbdxzXMbMMlIFPe8qlkaq7AKAjAwOZKePUjHEiG70dNsWg2MT1QHmhO
         M7aZvLjLbnDQAjOPOHmGvatbsd8Uy646MuPP2c3fDq8Mtv+Q+o2jF8LlnqyG87QyHq0I
         VJ9CjeTbph/HBfn84cUZLegXctBvj2iGhQnjFQvPhXUjPh42+UoZewXIlnpPQczDHn9/
         Zxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876401; x=1745481201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ldtjm18t2KR0i37dRzkUBtGT6ZljIzsaE7OH3uDOb4U=;
        b=krXv4yxCxU/SQy2vqUA2O/uEX7305TaIU/YcwXnj94LWuxprU9G2anCZ/SKOhOUgi8
         kT/QSKv6OfpHi1TyvqIYdO6ugckr15BrKmY1r24iFQNRLSVp9ZG7bmUXMLOTkP6TL/OJ
         +k4YhMxyEMAei72S2Z3alt6rOtA/V6Fe9R+xJgQZE95BfUuZFdRUzEy6F/qkDLLUcUIu
         BrT7XDJGwPEae9YaAOjaQvP9ANyCd/Wy1M2YswWa6MOGgKL/aDmpA7AjikwFFupF4aKk
         uYeML7MLeWsAwglqk3pU/uMAy5dLUYaoBrHh83JXP+qD4vpYYnDknYpK21f1NqyCL9bz
         duzg==
X-Forwarded-Encrypted: i=1; AJvYcCVSojSdtr8lF8E5gCbCPJVkiO8gpZ6jiTsuOlggOIlHcz3t6efLf+1g59NNPam8SsFov5H98Wtl2UjAShw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAenznbxJDsSBrkgLS6TJZJV1kRTfr5JT0FAYaYtBHZ4VlWxcr
	04+xjViLI9EbrWsDhwJEPgeiWIhPjGKaPwl/5f+gpfsSgha6G9TCPodvKqkK5nvEX5gGzWBlHBZ
	k
X-Gm-Gg: ASbGncv18V/54HrKNRVcePkcinFGmUUcJamxjSF7diLY3FLXWNtRxlojvln7Vm8PZ/I
	iLyxvXXk/8YKlC0vKdwRlQI57xxAkx8I7Z/R0UMOw6tYdFrhxwf5ft8WI1fEtdNZvPPdIG93Lu/
	0CcujMuagq3uURYL6/fZw5ivW9E55pn2YNOR4qcShg4DSoWQdHJQn4Ec4HlKxyzHxo9RHeAZBc0
	iGPa+FXH2kPDmsBee7TVusQlQPQHo93iQiRWuwxmG9XlssgsmqSzmglcLoKBi3ozRUa4ce+8S51
	Zj1GHr8r5VRhI4X+rmTxux9XgfbI/OX5Ii19xFP00KjMFA1dU3uZLff5qxJiJ57oC1lwLr8X+Oe
	glv5obw==
X-Google-Smtp-Source: AGHT+IHuV0Ir2ulqdSy8+QnxiDUvWr3BWSdW2/52LujDrmAOVewyJjR5ucyVhKSbc9kdBrxbWkJOjg==
X-Received: by 2002:a5d:598e:0:b0:39e:cbe0:415f with SMTP id ffacd0b85a97d-39ee5baf496mr1500376f8f.14.1744876016114;
        Thu, 17 Apr 2025 00:46:56 -0700 (PDT)
Received: from kuoka.. (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9780a0sm19424565f8f.50.2025.04.17.00.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 00:46:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] mtd: Do not enable by default during compile testing
Date: Thu, 17 Apr 2025 09:46:52 +0200
Message-ID: <20250417074653.81593-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling the compile test should not cause automatic enabling of all
drivers, but only allow to choose to compile them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

For longer rationale:
https://lore.kernel.org/all/191543a8-2e2e-4ac4-9b2b-d253820a0c9f@app.fastmail.com/
---
 drivers/mtd/devices/Kconfig  | 2 +-
 drivers/mtd/nand/raw/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index ff2f9e55ef28..aed653ce8fa2 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -98,7 +98,7 @@ config MTD_MCHP48L640
 config MTD_SPEAR_SMI
 	tristate "SPEAR MTD NOR Support through SMI controller"
 	depends on PLAT_SPEAR || COMPILE_TEST
-	default y
+	default PLAT_SPEAR
 	help
 	  This enable SNOR support on SPEAR platforms using SMI controller
 
diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index b8035df8f732..421b6feec090 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -34,7 +34,7 @@ config MTD_NAND_DENALI_DT
 config MTD_NAND_AMS_DELTA
 	tristate "Amstrad E3 NAND controller"
 	depends on MACH_AMS_DELTA || COMPILE_TEST
-	default y
+	default MACH_AMS_DELTA
 	help
 	  Support for NAND flash on Amstrad E3 (Delta).
 
-- 
2.45.2

