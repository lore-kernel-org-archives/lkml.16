Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627AD1FDA9E
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 23:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745709111; cv=none; b=Yqbsczc4O6+/G92ffvBUspAJotTiwb6Q160rFUY/FuEuNk4NEIcp3GE9ut25zdaYkgXDmadukZ67N10c6UcUFk7ejFzeM2EuDk550G3L98W30Ko4HSoIrrXypJqPUtIX6F7Ans96MuxS6N/ODAWXQnHvK2SsWi08AJBExDGsjCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745709111; c=relaxed/simple;
	bh=JSANf/ScvX3Uq8GbQH+CQs9vUfv+iD40hGemgQNE7O4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jEbae3q22bVH/Bt3pHENFo2SNgtE3i47dRXSZCPdJ07id3kdVIO2eh64CUGBzulw16aRhyqz3jxWuaNiFeg6MwCB+Rp4g2i4oVhZd+hzYqoKxzLzaSEXcJTNH/Q+knUJmxUH8ugE7hGKsPekEL2CtU5JQ0yykazTeDMJH42QmE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=simulevski.at; spf=pass smtp.mailfrom=simulevski.at; dkim=pass (2048-bit key) header.d=simulevski.at header.i=@simulevski.at header.b=ej3gwfBo; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=simulevski.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simulevski.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simulevski.at header.i=@simulevski.at header.b="ej3gwfBo"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-acacb8743a7so579535766b.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 16:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=simulevski.at; s=google; t=1745709108; x=1746313908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+0ils+A1DyFIjuTkRyJHSGr6AwB7PLZzZgPR+43TOG0=;
        b=ej3gwfBo5UrVAtQLiN2vLWHgLlgT+j3XXsyn0fcSFeXgFnYHOsXBtc8KA826z5LOYA
         /hN7+17+FSvampYl9T/13G5OxYIYpR2b+AlRl95oMWtUTlSJP1x7if3rUTNdVKKORG5q
         j7lAhD43a0ehPRKLv2ewCfBNITxfMG7mVvTfPJXcvcW3202BUOFoi8Z4RIbF5vHcXPLC
         bnefKlaWVVsrZj/PPDpQjbxbtssgZDgYFJ04ExDnzSOraJISFuMPR7X+0llyrCYBhPPp
         m+NwNSU0/P1lOfl8cvAJZUWmHabslRHMJzurDNvzuqv3PUF8Ol/1ITS6acJfHblfp52h
         PnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745709108; x=1746313908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+0ils+A1DyFIjuTkRyJHSGr6AwB7PLZzZgPR+43TOG0=;
        b=wRZ0UGk+nHMGFv9f8Kdo0IpguXzA6UgVztiv5nbWs7sP0X6HBTvOsbMIJsXlLQ9t6y
         ts4P96F/UZOvaqhmQMz45XcdQDM3JGXMKf7Yxd7lR8E1ecQKDoCsYgcjzr8QQHhzLIXe
         TK+BRhpTN3g6A2qT7oXwk1hOKla/nnUkybL/ee1zFh3YgWeOZ/RHrWr/7K1I0ZCbkEOa
         oKme6EzIx4hWFmrYSlkRDl96pyMW+GhNlDzdMrIDceuGpQbakqYfyTpYhl1S6hlT0/QR
         fxUS2iEWIcVTVn37f7bCcoNYFHrr7cGaxZSgle+BK0Nkp5xZk4t/mztDm/Lr5N72OV0+
         i3Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUqDUcoBnbv45k7Wx9dYC5sf9eS3uGBS/kfDg2VrNeyIajI4YAxJG6ESeo/n3HKVC/5ZQeDtLhS75yts9s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8RH1B18RI3dk2DnjDfLyiP2TUWkGO1fuA67lOR9ZYOOTRLtiD
	0xQQ5atEeyeCojFTpdqrM9VXXVnDZFYc8ItP+UN2RAbHXuoPLiRpf+mGT61X67ilvRV/e0IwbCo
	r/Dw=
X-Gm-Gg: ASbGncst1RfXKdFL4XxBSxpKjuLmNKu6q8J2S3BkdDJDLF9iMYd/RsRAXbSdOtkd+KX
	WyDpbsmX5WuzRsQiHHEZcWOK/+80H10haRAenPdz1dIytz6w979j2FCxxyXSh/EJDX10Kjhert/
	lP+v/Y5a3BCePWhMAqbZXUAjNsGmB95wY+tpo8WIVH8GgBYYXxCCJzlASJiCjuiQJvo4cAk283m
	qH4mOPLB8SZyan6kIKiL2QPg2N/X5gTiNTne4SobK4tl5sNbLGD/DsztQERAlVASvLr496CwVp0
	Ctx7MbFP6jksrm2kL+QX8PODJLkna5rG2rBd9NbUGM37w2mX7w5Q45rs
X-Google-Smtp-Source: AGHT+IGF7q6Y/O1AMqtv/2FTw0V6Nej7VHeWZTipaKNqnypUptBFQ62R9Y8XdpuSKQiMrtPIB8ucwg==
X-Received: by 2002:a17:907:3e05:b0:acb:3acd:2845 with SMTP id a640c23a62f3a-ace5a482bb3mr781313366b.25.1745709107533;
        Sat, 26 Apr 2025 16:11:47 -0700 (PDT)
Received: from fedora.home.simulevski.at ([91.65.134.65])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecfa8f7sm358018366b.105.2025.04.26.16.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 16:11:47 -0700 (PDT)
From: Ariel Simulevski <ariel@simulevski.at>
To: mika.westerberg@linux.intel.com,
	andy@kernel.org,
	linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ariel Simulevski <ariel@simulevski.at>,
	Guido Trentalancia <guido2022@trentalancia.com>
Subject: [PATCH] pinctrl: alderlake: Add missing I2C2/I2C3/I2C4 pin definitions
Date: Sun, 27 Apr 2025 01:11:27 +0200
Message-ID: <20250426231127.190090-1-ariel@simulevski.at>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PixArt I2C touchpad (PIXA3848) found on several Alder Lake
laptops is not detected unless the Tiger Lake pinctrl driver is used.

This patch adds missing I2C2, I2C3, and I2C4 pin definitions
to the Alder Lake pinctrl driver, based on Tiger Lake mappings,
with corrected pin numbering and proper community assignment.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220056
Co-developed-by: Guido Trentalancia <guido2022@trentalancia.com>
Signed-off-by: Ariel Simulevski <ariel@simulevski.at>
Signed-off-by: Guido Trentalancia <guido2022@trentalancia.com>
---
 drivers/pinctrl/intel/pinctrl-alderlake.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-alderlake.c b/drivers/pinctrl/intel/pinctrl-alderlake.c
index 108eac205aa9..bf0d910a7c2a 100644
--- a/drivers/pinctrl/intel/pinctrl-alderlake.c
+++ b/drivers/pinctrl/intel/pinctrl-alderlake.c
@@ -677,6 +677,14 @@ static const struct pinctrl_pin_desc adls_pins[] = {
 	PINCTRL_PIN(301, "JTAG_TCK"),
 	PINCTRL_PIN(302, "DBG_PMODE"),
 	PINCTRL_PIN(303, "CPU_TRSTB"),
+
+	/* Missing I2C buses based on TigerLake: fixes #220056 */
+	PINCTRL_PIN(79, "I2C2_SDA"),
+	PINCTRL_PIN(80, "I2C2_SCL"),
+	PINCTRL_PIN(81, "I2C3_SDA"),
+	PINCTRL_PIN(82, "I2C3_SCL"),
+	PINCTRL_PIN(83, "I2C4_SDA"),
+	PINCTRL_PIN(84, "I2C4_SCL"),
 };
 
 static const struct intel_padgroup adls_community0_gpps[] = {
@@ -709,6 +717,7 @@ static const struct intel_padgroup adls_community4_gpps[] = {
 static const struct intel_padgroup adls_community5_gpps[] = {
 	ADL_GPP(0, 270, 294, 448),			/* GPP_D */
 	ADL_GPP(1, 295, 303, INTEL_GPIO_BASE_NOMAP),	/* JTAG */
+	ADL_GPP(2, 304, 309, INTEL_GPIO_BASE_NOMAP),	/* I2C fix #220056 */
 };
 
 static const struct intel_community adls_communities[] = {
@@ -716,7 +725,7 @@ static const struct intel_community adls_communities[] = {
 	ADL_S_COMMUNITY(1, 95, 150, adls_community1_gpps),
 	ADL_S_COMMUNITY(2, 151, 199, adls_community3_gpps),
 	ADL_S_COMMUNITY(3, 200, 269, adls_community4_gpps),
-	ADL_S_COMMUNITY(4, 270, 303, adls_community5_gpps),
+	ADL_S_COMMUNITY(4, 270, 309, adls_community5_gpps),
 };
 
 static const struct intel_pinctrl_soc_data adls_soc_data = {
-- 
2.49.0

