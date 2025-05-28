Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9460B188006;
	Wed, 28 May 2025 23:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748476419; cv=none; b=PsTgY8/tRe6Cx7Dw5AXdrJay6TnsvxNtfoQRTREmOrZTLtPoS5nOp7u03PuYydm3wyKdF6fEr4nwjKfPlv/0bjpLFdXys47/tzr/pqOpNi4B+bBaTw713p2aiHivzX+vfO5P7y4ygvDiPtOHeEZD3IrKrqemIjLFvamwGg8E8pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748476419; c=relaxed/simple;
	bh=KP7CAby1iz8rXB04zsn9FKsUJMmeiuGP+msDRFkyZ5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MTqhsCFwsDYtOS9C/41N6HCgMbQ0BCnszWT9CUzPk/hRvjz1s0hPcaA3ecCNEi7k7FQyB2KWcJDE1CvlWIVCNXm8g3AiNe6AGHdeG8U0giWsP/5iFKBspx+zW82knoJuxc1hZaSP1KxkvazESx4ClaL+Bq6K6bJO2VIWszRA1kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TXBngv/1; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TXBngv/1"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad572ba1347so44870766b.1;
        Wed, 28 May 2025 16:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748476416; x=1749081216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fcZmpzXS9vr1PSL41aNxHZ22YQ1WSLqCFIureeqm19A=;
        b=TXBngv/1Zug/qyZakR4UH8RTRLQHEhj1os9ruP3I2FyVQAn8okq9SjeeRhTJZzCzOs
         ECozck1FvDif8VjkPEoUBl6XHzCwKh54v/WcIbkBxatKnd/hQfbZvy61LYOM05SCZlEs
         FUcPq0865Je0S2fcAe7t+HEI0TSOBABCHWQ535pKzm5mnyGfWM/DOchCcEOsBCwPke4y
         1h31G1mw68zipm1zO7LhuHGgFyeMRP9w3DTp3lrj3k+ZCKTq9uPychAq8cHNymSWf49b
         89LzuvAPhWcmFhcGFbV7ng652rJunnkuGEW0/wJ6nOWrt7r82uXLGonMBLAzl8l6NaO3
         3Cdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748476416; x=1749081216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fcZmpzXS9vr1PSL41aNxHZ22YQ1WSLqCFIureeqm19A=;
        b=kRzeiEVXqKmZk8pSS14fqnUKURmcSjQnoj9/euT6YtupuotutG42pQOPVAO8/0KRa8
         UsDhf3hcepSk9w+FwO83sHoKpf2WJ73Mr/ZjZRffkDVhabrDKhCXEYRX9WCW22Nl1GIK
         gyGiXPQYNyId91iUEnHg/k0XYn5HrnEwl5Hjw57XjLk1mpSo9j/iOU9NUZqajEjfLj2y
         5PGFbNtMlMg2Phx9vw3K8fCjNx9CBGsfcKctXp1cl5///SBWj9xx3Nwh3x6besUAL9vZ
         HJNItroXHiIT1HASgu6pGji+JigqWT3iJZ9hNXBJYdczKUhwJ4zCZQmfdMO0dL27EWwj
         NX8g==
X-Forwarded-Encrypted: i=1; AJvYcCVQoDH0Z4ZR/6Yx7hJOQanCh9ZqyeeKUrxj1KnYbDzpdB5qfcV7sIwvylfcFsYPdnT02v+vVDdvF7cvqOI=@vger.kernel.org, AJvYcCXKr7uzhgPjAHrJg5clvnU6UJYAcyiskgAKema+xe0/2lha8zFTRXTuS9I+Jcm/1UWcPc+bMSY0tHtfT2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YysLFCtLIX2rHKjFWP0ZvrYNjePwLPt8S/NbOVw7eN1eDJGvulR
	aBeHBb2Q9MasY19fLRp2scFEM4TxKVcojZLg2BnrS8kBJy+5hze4Cxyo
X-Gm-Gg: ASbGncsFn8W/O6+6U5q10FyQiN6EZ+/v7RxQCZrf54YaD6eP0A5k7+m0huAotJO5a8X
	FA60j6OmcrsDuSGBQqP2t3phCftc7vjGoNbqvsbX1Frfowv1pCjY+vtH3uWNWQ37FBwbWshiYbx
	zP4Z04ce6monlfvUS5GmmdUw3xMQkYRBrIm5ZbGCbpAR+GPXbwnbI6cHgWjggdhau9DWJRTxsCe
	7NrzGiThzAg5AgUkHF4wLoGDJPFm4fhjA0xenan1EbF0H8KlrHFdB+JWUBFPZsSvB4FsBxPHxjX
	H5AjiBG2WVyvCJDt6h+m51ONjSVHftkIe8kMDa/BbuvIkLrCx82elgFe9/+Xez1x89UyQD8=
X-Google-Smtp-Source: AGHT+IErKBHm/gvm+nX3ZF6Mcc79iKwbFEakxyoQXNJEVzJOq/8bcy5V1OznpgdUueOVr7wQGwVFCQ==
X-Received: by 2002:a17:907:d8d:b0:ad5:5067:6bb9 with SMTP id a640c23a62f3a-ad85b1de2e2mr1646305066b.47.1748476415494;
        Wed, 28 May 2025 16:53:35 -0700 (PDT)
Received: from archlinux.lan ([2001:b07:2eb:e808:4809:a7e0:3d2b:a46e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7fef72sm26118566b.34.2025.05.28.16.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:53:35 -0700 (PDT)
From: Gabriel Santese <santesegabriel@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: mario.limonciello@amd.com,
	venkataprasad.potturu@amd.com,
	talhah.peerbhai@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gabriel Santese <santesegabriel@gmail.com>
Subject: [PATCH] mfd: Add quirk for MSI Bravo 17 D7VF internal mic
Date: Thu, 29 May 2025 01:53:31 +0200
Message-ID: <20250528235331.67800-1-santesegabriel@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MSI Bravo 17 (D7VF), like other laptops from the family,
has broken ACPI tables and needs a quirk for internal mic
to work properly.
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 3d9da93d22ee..fed150002041 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -444,6 +444,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Bravo 17 D7VEK"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Bravo 17 D7VF"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.49.0

