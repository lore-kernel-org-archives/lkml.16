Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085562192F5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 17:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743788799; cv=none; b=skUpavUv0hUJByvbReaJk4kT7MOwdLNEFcOnjcYKrWwarRpl/Y6mbJ3md4ncjcOvt9iqd8T01s6+6IZ67NbBsvf66hIxlFsgvUM8MC77Jt29b/UT8/Bc9CiVhKcRndc2JTibtY+VoXiNFui/zzF8KfBbW1ibIRpjzBUMhzqJdF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743788799; c=relaxed/simple;
	bh=VMQRvj8CO60hVIlMMgdkTE1dtBACF+fNeO1bhBVnQsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WbcH1FS+Z+lX3r4pFoFfxKk0xj9vwhLXZOp1VEfBg+dtu1mTgdC8FUqqSVKagPlrtH1vBs1G5RHQzzqE2paj1L+jkOEIhRvOYIsl58dcSi9dK8zSlO946sAzlXOYKMnkUj7K8ks+F1BLqMoqESvKu1Z2m6Cn1MRktH0UbdyuyZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZP/p8dXw; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZP/p8dXw"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c0dfba946so1509223f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 10:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743788795; x=1744393595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pxPRinaB0R9MRMHkqtzs6Jksu6ZEexxFz8Cu5WJ1Zw0=;
        b=ZP/p8dXw58qJXYdRhzm8N6Jb+79SD6nldnsyJ5wM4600xOtsQPalyW6vUM4J/OEaBc
         THc74vAgMrPMznB0emXJID/aQSQJqHFVS1bKXRYVoYYW8sMrTa+mDB/2yEYstgrbgCpi
         R6dWtiWZbQvJzECr7GTFO+OqEX5914DzXg4tQdqQJGTLWrJYd8XzRHFZBegfDE972i9w
         ZIS0yYRyArZXneXT3UtjKK5UQFrCsSw0chmzSE8NLg6oa3ALBEgqjlEQO/K5nmANdZcZ
         V4yalWGyw4TtbcSdV/9+EcsrAFwjMSdI57xOw8c7lD3i3rNLplS9NQhWDfueL2XKZVvl
         EgWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743788795; x=1744393595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pxPRinaB0R9MRMHkqtzs6Jksu6ZEexxFz8Cu5WJ1Zw0=;
        b=Jpeg0AhCTxUdmEJTfjtvF2fLT4EIdq8+2JjzXlP85bXPonTaHYHCQAHSY4L7/sel8G
         5exObBZxLCntmskAY0XA9RKnSxzC1MkwbDyakoUl/2P5SpH0qhTY9i6o0jSebS787UMa
         GVm8p+7Wsa+xsiNXl4sGAixez1n/GfbcxQwVpOa0IILpEKPUV6GW6ogKouykQFDPgDuG
         9B1IgDFZyS71CSWFycsveaKcGm1jemQSzEJMSRByeumLyagZwm/oyhT5Ugo3EdT6lrPC
         hqOtzyQWLyaFxNE02s+4VnywYtqHlTsmKF94Y8WXy4OO6iSYuNqKr1iLwmZwmXcWCLOC
         uAqw==
X-Forwarded-Encrypted: i=1; AJvYcCW4FXwUjzOZfGETKz2oczNcwq88biaJbqhtMyXT+/Mwt0+423/T4T4fSEmdShSOPDjYF2p+6K+wojSGlWY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvcz4tFwZb+UTzF0t5qlOUl3yB0CuAKEecR8cRjXJDACa2wdHL
	rkKELKpoOyFmLbanH+tMkkZ5h3+jmgX30vt/3yfuZk32pxLrk88bHYS+7Vi0B7Q=
X-Gm-Gg: ASbGncu7JzSsrsfoG/gZe3xLz6et+3oZyJGjHv/jP4NqOM62xEXNhTGp6LUH18a2I6n
	KlMsbBJG5rc9eUZlRoMjf+k6VoMYKhZxqbSz/Hz9Nw14eIMfKQTTPHALblaXPyQhR3bj63LNyUp
	LVbeXQ1MYchaH/vgC09OHwLSYokInOBMtodrE4NXPDGXch/3pqPtwEICJiM2Yk4j88IeFiMiYp+
	gtAh3nvLRF9PthmrzMd9QdSKhjEcoyZZMbfOn9y0YG4TndmXA65WpEKSSpTHHbC4kS4DCU7Kljo
	ApB/+MSNmvQ6mZfL4phPHjarrtOvJ8YeLZx6QuLX1P0ROzFjIdsP1vG92csBHY4QlBsL
X-Google-Smtp-Source: AGHT+IGJK67GjTDKDpj5bH038uXsv6Y5SZCtrTzwfFsjB58QOdWQqxfjOKhYa5MkwP/MU+TWVGqe2w==
X-Received: by 2002:a05:6000:270e:b0:39c:1257:c96c with SMTP id ffacd0b85a97d-39cba93f966mr3020079f8f.56.1743788795236;
        Fri, 04 Apr 2025 10:46:35 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:331:144d:74c3:a7a4])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c30226dfesm4939535f8f.97.2025.04.04.10.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 10:46:34 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 04 Apr 2025 19:46:22 +0200
Subject: [PATCH v2 3/3] PCI: endpoint: pci-epf-vntb: simplify ctrl/spad
 space allocation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-pci-ep-size-alignment-v2-3-c3a0db4cfc57@baylibre.com>
References: <20250404-pci-ep-size-alignment-v2-0-c3a0db4cfc57@baylibre.com>
In-Reply-To: <20250404-pci-ep-size-alignment-v2-0-c3a0db4cfc57@baylibre.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Jon Mason <jdmason@kudzu.us>, 
 Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ntb@lists.linux.dev, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2649; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=VMQRvj8CO60hVIlMMgdkTE1dtBACF+fNeO1bhBVnQsU=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBn8Br21+RpEyu7VflBJ+7DQPDTHDsNR/iu152/c
 AfIb7ODPZ2JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ/Aa9gAKCRDm/A8cN/La
 haVOD/94gKh4Rwrb9XZS7wgvtm4xpuUyG+eCwYuUMEyNfOou0meG7+SOlSJhtvZ1NsV6kD7V4HB
 ngGvBJwsU0P8WC5cRU9CLVrc8i3A61jPsLvNnhVrJ77uvSg2C0HRqgHw15xyRsvIZArIb8CU040
 A5JupzLwaZDYkREjQjLEBNqAuUVCwD1MT3sm61cZFKdXJoxqRr67QoUoZ10GzQTv/X28JQL5WeD
 1IAy6A3fkHtphYdtl1vFCY5PDeijD0KzoIycqy3dDl0gFiMFKYCVBCIsOXI8ms25+GlwwlR7jmr
 KmXHh8zMIoCtoVTRXR5zeCq1lqvi/V4m7MFSpW7uC9iaTFfFYEmPDFxK2xDemp8L4++PHROmJ5u
 7CPXSakNhZVd9WGCVQEZkifF5j1ciFeaeBmWbCoBFtVHjzioGu0Ss+9cTluMndT1YxZwhHJF9cr
 oHScr42ldiZkUIDW1DkshspaPEpv3+Y1TSIsPrvN+hztJzk+OcKTp9RlR3Y4X6f2JlAk7gBPUml
 wkrZh30XKCKDfZAQ8DYmIRGV34JTkX7GOPSSsQrfp5SOLZJ7XvcIEqTbdf+kX/GD6lHLtTfiTzN
 ZmBFc5ZcRokYQuO2ciUIO9fsoRZpg+CGU25E0E+08pGb9b45MlAvo8mc3JWcE6ql2TykQ9kl+PZ
 G6+yE31B/oorRXg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

When allocating the shared ctrl/spad space, epf_ntb_config_spad_bar_alloc()
should not try to handle the size quirks for underlying BAR, whether it is
fixed size or alignment. This is already handled by pci_epf_alloc_space().

Also, when handling the alignment, this allocate more space than necessary.
For example, with a spad size of 1024B and a ctrl size of 308B, the space
necessary is 1332B. If the alignment is 1MB,
epf_ntb_config_spad_bar_alloc() tries to allocate 2MB where 1MB would have
been more than enough.

Drop the handling of the BAR size quirks and let
pci_epf_alloc_space() handle that. Just make sure the 32bits SPAD register
are aligned on 32bits.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/pci/endpoint/functions/pci-epf-vntb.c | 26 +++-----------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-vntb.c b/drivers/pci/endpoint/functions/pci-epf-vntb.c
index 8f59a5b9b7adec2c05eebae71c6a246bc5a8e88c..bc4a9c7c4338db6cc89fa47de89dc704d0a03806 100644
--- a/drivers/pci/endpoint/functions/pci-epf-vntb.c
+++ b/drivers/pci/endpoint/functions/pci-epf-vntb.c
@@ -413,11 +413,9 @@ static void epf_ntb_config_spad_bar_free(struct epf_ntb *ntb)
  */
 static int epf_ntb_config_spad_bar_alloc(struct epf_ntb *ntb)
 {
-	size_t align;
 	enum pci_barno barno;
 	struct epf_ntb_ctrl *ctrl;
 	u32 spad_size, ctrl_size;
-	u64 size;
 	struct pci_epf *epf = ntb->epf;
 	struct device *dev = &epf->dev;
 	u32 spad_count;
@@ -427,31 +425,13 @@ static int epf_ntb_config_spad_bar_alloc(struct epf_ntb *ntb)
 								epf->func_no,
 								epf->vfunc_no);
 	barno = ntb->epf_ntb_bar[BAR_CONFIG];
-	size = epc_features->bar[barno].fixed_size;
-	align = epc_features->align;
-
-	if ((!IS_ALIGNED(size, align)))
-		return -EINVAL;
-
 	spad_count = ntb->spad_count;
 
-	ctrl_size = sizeof(struct epf_ntb_ctrl);
+	ctrl_size = ALIGN(sizeof(struct epf_ntb_ctrl), sizeof(u32));
 	spad_size = 2 * spad_count * sizeof(u32);
 
-	if (!align) {
-		ctrl_size = roundup_pow_of_two(ctrl_size);
-		spad_size = roundup_pow_of_two(spad_size);
-	} else {
-		ctrl_size = ALIGN(ctrl_size, align);
-		spad_size = ALIGN(spad_size, align);
-	}
-
-	if (!size)
-		size = ctrl_size + spad_size;
-	else if (size < ctrl_size + spad_size)
-		return -EINVAL;
-
-	base = pci_epf_alloc_space(epf, size, barno, epc_features, 0);
+	base = pci_epf_alloc_space(epf, ctrl_size + spad_size,
+				   barno, epc_features, 0);
 	if (!base) {
 		dev_err(dev, "Config/Status/SPAD alloc region fail\n");
 		return -ENOMEM;

-- 
2.47.2

