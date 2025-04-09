Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48822211491
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231056; cv=none; b=HZSwBOxWNsEns9XlJY78rTFqRU7qitt0Rq9xbUY11bzEZFYDZLE0a1L/xVeMGCi2FtzAo+YRhESvtDbepxfXbbHOWkHn5TF96ADf/1+HWzYP2Arb8BHanX7rukgLJrV7wjaBl+NjnAEiQj/hIvvK7T8ulls1nBZqHXTSthDqUGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231056; c=relaxed/simple;
	bh=3e9/UfR1mJvZZf9g38Aa3kwt2igeAl1jk0oAMPkKz/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hHJfRTMf6izXiDz82KPcYMUtqXbqU1UP+C0I3MZ/sW6tUf887S4UerGEiV2mydyzyDBr3HNdVeqHxY4Ic8a2Olflbph6r9yoHGP7gKNwntdZ1rr/fTaa3Lm8EhQDCOL3Ojm1ncGOWwMtrWv23K74+lbYPVrvJwjr/wlP435fqp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Se5rR4KD; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Se5rR4KD"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso26349966b.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 13:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231051; x=1744835851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RLmgb19AbWrd/UJeKJUHWxq/eTD9hl5bKw4d7syAvGk=;
        b=Se5rR4KDuZ+RaRijeUzq96U19GGhw3U4QryetzbJxQrBmGlhP28oQgTEOkOkOGvt56
         7i9fvECyqyoDZ1DQDp7Dp6KWtky2tv7QruOhuzycCfvr2m5moBwu6KkB0ZC1oEixlitj
         AH8DZ5EOssP2uy9C2hD6hRibirf1RsB4D8LDyHE+W3bIk7wPyzTs/atdGwkmdwhdwC5N
         qKVgRLOjYJji8LuLu2jZkxBSf02/POEHeg43Hb19EmweSGKmLsS/2iMRwr6TJxkBneeR
         z19Z5dxHvcUvTJJIGE7X0p3o+V2aN5bBv85k5k9C+GJPLl5Td0FysZMbaI1pyCr+hpv5
         tpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231051; x=1744835851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RLmgb19AbWrd/UJeKJUHWxq/eTD9hl5bKw4d7syAvGk=;
        b=jTpoKytKvVGYIEOTXVUMcWPdwO9emyO0L23fA/YPuYgAR9j7TB8ZCA22pQ3kyzyRU1
         99iwl8qsWSaf+d0hmqYqF1fX7e0BX29jfhzjMzV2XH3RzAbffcV3mfyMToXFb8qxoBrs
         aK9+RbTpFNoF5U69wFtmxWDmxN40pUMoEmFaXvIR/n1KIzf75BNT5LCBbn1vxSt+wrDP
         FtbRfHq4Z2tafgxMBetARlTU45pFONQAxgbesTn2/COpOl+pkMcTHzmdix7PZgRGt8J7
         R+vD9LABEgVLKVrSjQ8HxW2ikvtuVJxbpzvc2G9MxlCXcxwlUqvqFztZTQRoapo5mAFd
         ylaw==
X-Forwarded-Encrypted: i=1; AJvYcCU7CuNVgxxQa45KiyrjZhcpz+1w32FG7+zk44OL0vUJ1ZnxVPGJqsvgx9cmrqR49Fewjcf+zXbomKoi+RA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWDgUJLQVpEE+HdUzAuH+yo/+CupOXcxr66FUQOOVc6Qey77FN
	lynFhApZKPZzyg/68LShckYgJl02H4myjvll3BoNvn7xKlz9jRxDfInWz+fZKL8=
X-Gm-Gg: ASbGnctV9GBCrnfe28pX9Fy3sAG2KsjVFSmln1sIyFbuABUfL+1lB+2YH9rs+zKDspY
	a/SpR0m+VAphTIioi0blZDPJITRJ+rweS7hmiQcdubxDvym2OzNAnborzp4KKQ4j8IDE0yFNp/d
	TE5VZ5dU4sMqhPkd25BbaoF8/l+ApGDmBhU/cj22Onz9ReFR4/NHmMDjVTbFb/QZavKQzatY/VZ
	Dt3IXAxlw/8idSVJp8tmTPTaIsn4QC9UJRA89dltebMwFuNWfsiFMdog9sWVb29PN2rkrPeehgo
	R4UtjPnVfx+M2VojK4iXnnqAlmi2JEGCwpvK6xx8bUKC6vo1PHPr8gakkpnIUHNiiwCVxSWnlwh
	VjQepW/bH+Vqutrxbrl3eGwOPi0g1wB3LE/5fIw==
X-Google-Smtp-Source: AGHT+IH0zvKNuRDAGqLs83RwWCcDR6aym1X5YrwLki7lH6aKqe66Jq6ZWK7rMjqREavabKtC1MlIlw==
X-Received: by 2002:a17:907:3d87:b0:ac3:c59a:413e with SMTP id a640c23a62f3a-acabd4dc96dmr8505266b.55.1744231051490;
        Wed, 09 Apr 2025 13:37:31 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:31 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:25 +0100
Subject: [PATCH v4 04/32] mfd: sec-core: Drop non-existing forward
 declarations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-4-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

sec_irq_resume() was removed in commit 6445b84abf91 ("mfd: Add s2mps11
irq driver") and sec_irq_exit() in commit 3dc6f4aaafbe ("mfd: sec: Use
devm_mfd_add_devices and devm_regmap_add_irq_chip") while the
prototypes were left. They should be removed.

Do so.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 include/linux/mfd/samsung/core.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index f35314458fd22e43fa13034439406bea17a155c9..b7008b50392ab857751b89e0a05d2c27f6306906 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -72,8 +72,6 @@ struct sec_pmic_dev {
 };
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic);
-void sec_irq_exit(struct sec_pmic_dev *sec_pmic);
-int sec_irq_resume(struct sec_pmic_dev *sec_pmic);
 
 struct sec_platform_data {
 	struct sec_regulator_data	*regulators;

-- 
2.49.0.604.gff1f9ca942-goog

