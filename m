Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CED629B239
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842800; cv=none; b=M/ibm6BDzjVyP+mwGY/SQvsY1eDyd4JdMBflvkMldqXzn6BBnYhW2z59LidHgeKtNfaJQubkkLDWg0EVjiAQIcmT/0OLRzW7ToJO9RWClB2z5TWIB5/yyWdXEG+B9Ag7ppHULbGAk0VaA/AJ026UZcA8keN1tsXrTBK4niTJ/xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842800; c=relaxed/simple;
	bh=JQ9w+7Zgo2FXC2Mpy+jdIS6f5XEOUQezkej2dK+ZYxE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bGg/TfV3/Hq9z1ummhPAfOpg6sPV5qEHEnOVAVki9kPgO2DtMRsJnJPMsS77iE2aiZ+btA3lRuVXyoV7AwGsDmderMepG6B3vfycKfz4Ips6QJ/UJiDFYGZzWlksNuov79giukfxNTKpbMr95O3yckbj9iqNXnLkS5vuyJpi1wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=qJ0NtXLG; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="qJ0NtXLG"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ade58ef47c0so144790366b.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842796; x=1751447596; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tMsHQKFydEWBAR4xJazzqmW53CI/637ZYZWhjeBquso=;
        b=qJ0NtXLGcOG9oFu62I93iwjHzg7UCklJqP+J5BRR38tcEJ6xCLV+BI04j7mcDRT7Sn
         ihotnq5jj1X5vnD3fSpw3I3z3VcR/Wzkssnx2IVqpg+3KCtLwcY+1UILNJtSbsyatcQ3
         Lqqlp+0bVuPFqVrdJehX8EO0W2HlU8H8B2FtacSvfB2kDFXR6xax3bb4NkPSSB+IYlRE
         IxEqWP004DfjgXiA6LFHIeajL28iGmextz8/ifrtfc2sRdQqSMTjN4GPLkpI0W6cDCLW
         a4HT8NkxZXmBAE0562UDrdhsFFibnBesDtQw3Lz9an1LVRphbBDdWbUGxJZCetRdV6Ir
         9gng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842796; x=1751447596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMsHQKFydEWBAR4xJazzqmW53CI/637ZYZWhjeBquso=;
        b=oXHb197Tey2U9oX3niZP4yqOWOuSTmt7TxGEnCyAVjeKswZ7ZA4TlCu2iipWvjBMc9
         XN8+/hUOMRuiqdzAXiVaZcmn1/B/awEww+5ocsm0BBoLkbp90vR3OVJvTxOGYgvZcZdp
         FjUmIju/wXBhhuVQ0SLgBP/zJzgPCM/FRcuL6ur1d90Mjsfdvvx9aYYLApgnUVNHX4BQ
         NIpd2PGQCpOErSygfSbRaM4iXH+F2n9iQPwQKIgyh1kj5QPzhT8sHlTxb3vlFIG9h6Uh
         pzluTOl3z5r1H1Ngbs3mUOqeCE+4rtfjVbwRgWZGHHE+zN1VsTF9uikpYCwilN6bBn6v
         kl6A==
X-Forwarded-Encrypted: i=1; AJvYcCW//fFOpAnWSG7DFgacHrlxLx5R5HC744CE22qdFlWk0b54vIa/Vly0r5SmZArqva/O3OaE3hGdRQTIpvo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+tVXraygPMRMiOX2R1v5yRCoWq++wBv3ntW++GMpE+v254KkR
	ZKPlBi2KTLDrJRxD+PXawI9gVU9DXraRKLdTa3PdZFyI0Nik+xVkd2a6MEf8YZYo3EJuyzZ3P2q
	6UY2a
X-Gm-Gg: ASbGncsm+XGTdTCqj5rCV7SO8dlB9d/aPFLfWpA9l9esdiBaalCjVJxyOYh9bBD4Ztm
	/6PAnmkoqPTPrwXp+PyCIFb4mnYhnjAHJeU55XF718ygNrPdvNNTmcVrt2mg4obAQrePSyKxGZ1
	S1K6N2RTU2fC1+4P7ZwDCIwNt/yviw1fTLfI9yiy1JswrcCp5ys917xTzognI3CImdD/KhYdKZ/
	ouHgPHVAIpDYGRI4bZoSYkM3j+i/sPJ6mXxwUvazRZ8XhublAtvgHgmCicOFj+UN2Ll91YhGWBh
	jvQXwEZcAVlJYafhaAvuVWhqrqvkNAG+FRQ4zHry2pe+yYWspQSHNIOs1DJHilFqZjJN4pyT19w
	yKbcUF/GiSU7Q5pfRzX4Ar5boBxCvS63r
X-Google-Smtp-Source: AGHT+IHqLUpjRRz2U5DvTK05gprNPcYkyY3qhvchJTvyKUvPYxRBNt7uhs3K836HbEKah1PslU0D8g==
X-Received: by 2002:a17:907:3e12:b0:adf:3cb9:e3b9 with SMTP id a640c23a62f3a-ae0c0621f50mr209003966b.3.1750842796305;
        Wed, 25 Jun 2025 02:13:16 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0a93f5e96sm272499466b.74.2025.06.25.02.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:13:15 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:12:50 +0200
Subject: [PATCH 4/4] clk: qcom: tcsrcc-sm8650: Add support for SM7635 SoC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-clocks-misc-v1-4-45fea645d39b@fairphone.com>
References: <20250625-sm7635-clocks-misc-v1-0-45fea645d39b@fairphone.com>
In-Reply-To: <20250625-sm7635-clocks-misc-v1-0-45fea645d39b@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842791; l=1383;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=JQ9w+7Zgo2FXC2Mpy+jdIS6f5XEOUQezkej2dK+ZYxE=;
 b=KYBHO9BrDI6wTp1yOWF8kGKqlw+3vOeKLlAUHZSfG+X/jL2hFROuM7mUcVR/4G/1cZmTk7/R2
 97m5sCBTseTBJy1sJfmDq+2JF8PFyvuLgz3qKPCRLGU1vJg9CqhMElp
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The SM7635 has a very similar tcsrcc block, only TCSR_UFS_CLKREF_EN uses
different regs, and both TCSR_USB2_CLKREF_EN and TCSR_USB3_CLKREF_EN are
not present.

Modify these resources at probe if we're probing for sm7635.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/tcsrcc-sm8650.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/qcom/tcsrcc-sm8650.c b/drivers/clk/qcom/tcsrcc-sm8650.c
index 11c7d6df48c7b39f661cc4c2df30387836d2ca60..3829d4b283480b96cd0ec0d4bfa78777359730d9 100644
--- a/drivers/clk/qcom/tcsrcc-sm8650.c
+++ b/drivers/clk/qcom/tcsrcc-sm8650.c
@@ -148,6 +148,7 @@ static const struct qcom_cc_desc tcsr_cc_sm8650_desc = {
 };
 
 static const struct of_device_id tcsr_cc_sm8650_match_table[] = {
+	{ .compatible = "qcom,sm7635-tcsr" },
 	{ .compatible = "qcom,sm8650-tcsr" },
 	{ }
 };
@@ -155,6 +156,13 @@ MODULE_DEVICE_TABLE(of, tcsr_cc_sm8650_match_table);
 
 static int tcsr_cc_sm8650_probe(struct platform_device *pdev)
 {
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm7635-tcsr")) {
+		tcsr_ufs_clkref_en.halt_reg = 0x31118;
+		tcsr_ufs_clkref_en.clkr.enable_reg = 0x31118;
+		tcsr_cc_sm8650_clocks[TCSR_USB2_CLKREF_EN] = NULL;
+		tcsr_cc_sm8650_clocks[TCSR_USB3_CLKREF_EN] = NULL;
+	}
+
 	return qcom_cc_probe(pdev, &tcsr_cc_sm8650_desc);
 }
 

-- 
2.50.0

