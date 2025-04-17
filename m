Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAE220898C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849991; cv=none; b=G4ei90Py4dbqtWGymM8Nr2YqmfgV3SiRghZJO90LPl54NxzoyoyGF11HdWk4JC6OS0c+9dvku3sbW8S39AzEUnYyNEk82h+yC0KuI3S2sab/AuZkY1guXwxaFUUvq8hiGkP4kaFELLd9rk6WxWv8tfhn1ra8eK9F8NwIqhzhDFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849991; c=relaxed/simple;
	bh=1+tRRy/nL01MPl0+5FS05H/L2lfuD8Vmz0fi46Q1xuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kg3Y1ai0xiPimKUl17XKWeAoNg7T87oFlNX1MpyXV9YDjyg3pKbcU2JhRSg3cv1Jr7SsBQyfvyh74tuMjM6LlPR+c3P3IrnS785fZtWycxZhwsXUOns+qN6P/pPAfu2D2Dm0DV/EL4Ff9yGCCYffhsk7ZwnRm+7EP/K7WPtMi8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=hsWsdgd+; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="hsWsdgd+"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22c33e5013aso2961675ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849989; x=1745454789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjTAiMO1GxG/PObrFdD9u5YrnCsI7HGevSexjRmDxRA=;
        b=hsWsdgd+uvmhrRvfrppRU+0q6HLeRrNitTw/VR5PSENdr36945yO69xJSIO0F+nG/O
         DXf5AsN1NrhV0WcZl+cGBjWQht9qKV5etxXxNOdxu+Y/jTKKp3Po+JrxP3LP8NPCfTVT
         8ivkJUqkZZe52iuGtfohOQlitGEpIAtvh78HxSOFsTH23xMJQYPnasMQZrKbrsUt2JpE
         DDD7c/R5KRxXuhPBwbH5C3ogX+KEA5Jg3nSFc5ziMiXfbY07sDqbg7z4e3YlPP+mcnw7
         OJ1GOWScayZv3ctXML5GC7reFX2LL/6oHn/QlqkS17SABrNbqRXxMvedFR+MwEu920F+
         vY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849989; x=1745454789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjTAiMO1GxG/PObrFdD9u5YrnCsI7HGevSexjRmDxRA=;
        b=TEwXt4KSIRl5zU1pbNiYmWBRPcau0QMFWmLVfz3fT/c7zgKgnusRTgmKMDxIGhSwIn
         BxSijiRT4K6OI/uuGvGa0uEPVLqMFqUbmacWaZvF1mjQp+qaVR/sQjfR9N5NKXEXFkrP
         n+ghonFcRRUhAzZwgn7lQYJNukhdeFh3x3w4LuvGQ/yuFlj0p5zc2s6G8HeRtjo+xUDm
         kVRUV+Vb71JMFX1z2hJ0cVsHOFQpN+QoS+RW+KWLlj517yCSLhYlcKaPBCYfzcRPqC9m
         RRNFRPeMA4NbvpYX/x+LeVzrhZqlpgT2dHUtS00+GDSZs0XcR6GGcegKBzmtckFZOnuu
         cMBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXftC6K5M89p8gaA+l+VzNIMo1xyIxOxRFxDwwvlNxHIyW3QuLpOmZkqinfngQVqT6Uf+sLzpgrQGRFQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVcyZ+uW7+Zp42UwwFlENNZYZEIx1JpOzCfh3cPPYx6HHsIWdr
	/NKgGDtO8pC2ERdep6YJCKH9871y4Z61FZDpHBLwTETSImsmKH21x9/26MQ3XA==
X-Gm-Gg: ASbGncvcc0t3ac+DponFZXWypFQwtbArAnJ05vgz0SoFrTdWk2i5LfFVj6J0frfibML
	frsN8vbXtMpaWWHpUMSQgJSamzHxasprnFmqQ2VukdDMycWtvWxkiiY6XjLa2iSHYPI7AFV6zV9
	jbNL4uFPB9J1hU4yeguVcicXAYCoDeO/6QT87ffZtsznktHolGm4lwNsMTTj15juMBeNBEoDaED
	fJBya8OujxbHvzvaYgxQPcGAKGGT3owcgPQhfO1tm0hoprrv8DTQN0jkDoDh0WyAXq9zxF/Ghjw
	T5qyxUyZVD4zLGjfHbHaM/weDsXhkgWeOqR5iHIr3qIB5/YHmWscgmU9YUo/gF+jgKH3rLUIjie
	1wE/T9g==
X-Google-Smtp-Source: AGHT+IGtattHZ09c4gb6nvSUWNpyqJF6hIUIld7H8Mz7/Cjzoa1xoA2Pz5AmbuZO8KzC1cpc2DXyyg==
X-Received: by 2002:a17:902:e743:b0:21b:d2b6:ca7f with SMTP id d9443c01a7336-22c3596bbc6mr54055505ad.32.1744849988737;
        Wed, 16 Apr 2025 17:33:08 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef0fbasm20797095ad.19.2025.04.16.17.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:33:08 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 17/18] staging: gpib: tnt4882: struct gpib_interface
Date: Thu, 17 Apr 2025 00:32:45 +0000
Message-ID: <20250417003246.84445-18-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417003246.84445-1-matchstick@neverthere.org>
References: <20250417003246.84445-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 24 ++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index da13d11c20bd..d26a388912c9 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -1122,7 +1122,7 @@ static int tnt4882_pci_probe(struct pci_dev *dev, const struct pci_device_id *id
 	return 0;
 }
 
-static gpib_interface_t ni_pci_interface = {
+static struct gpib_interface ni_pci_interface = {
 	.name = "ni_pci",
 	.attach = ni_pci_attach,
 	.detach = ni_pci_detach,
@@ -1150,7 +1150,7 @@ static gpib_interface_t ni_pci_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_pci_accel_interface = {
+static struct gpib_interface ni_pci_accel_interface = {
 	.name = "ni_pci_accel",
 	.attach = ni_pci_attach,
 	.detach = ni_pci_detach,
@@ -1178,7 +1178,7 @@ static gpib_interface_t ni_pci_accel_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_isa_interface = {
+static struct gpib_interface ni_isa_interface = {
 	.name = "ni_isa",
 	.attach = ni_tnt_isa_attach,
 	.detach = ni_isa_detach,
@@ -1206,7 +1206,7 @@ static gpib_interface_t ni_isa_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_nat4882_isa_interface = {
+static struct gpib_interface ni_nat4882_isa_interface = {
 	.name = "ni_nat4882_isa",
 	.attach = ni_nat4882_isa_attach,
 	.detach = ni_isa_detach,
@@ -1234,7 +1234,7 @@ static gpib_interface_t ni_nat4882_isa_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_nec_isa_interface = {
+static struct gpib_interface ni_nec_isa_interface = {
 	.name = "ni_nec_isa",
 	.attach = ni_nec_isa_attach,
 	.detach = ni_isa_detach,
@@ -1262,7 +1262,7 @@ static gpib_interface_t ni_nec_isa_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_isa_accel_interface = {
+static struct gpib_interface ni_isa_accel_interface = {
 	.name = "ni_isa_accel",
 	.attach = ni_tnt_isa_attach,
 	.detach = ni_isa_detach,
@@ -1290,7 +1290,7 @@ static gpib_interface_t ni_isa_accel_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_nat4882_isa_accel_interface = {
+static struct gpib_interface ni_nat4882_isa_accel_interface = {
 	.name = "ni_nat4882_isa_accel",
 	.attach = ni_nat4882_isa_attach,
 	.detach = ni_isa_detach,
@@ -1318,7 +1318,7 @@ static gpib_interface_t ni_nat4882_isa_accel_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_nec_isa_accel_interface = {
+static struct gpib_interface ni_nec_isa_accel_interface = {
 	.name = "ni_nec_isa_accel",
 	.attach = ni_nec_isa_attach,
 	.detach = ni_isa_detach,
@@ -1377,8 +1377,8 @@ MODULE_DEVICE_TABLE(pnp, tnt4882_pnp_table);
 #endif
 
 #ifdef CONFIG_GPIB_PCMCIA
-static gpib_interface_t ni_pcmcia_interface;
-static gpib_interface_t ni_pcmcia_accel_interface;
+static struct gpib_interface ni_pcmcia_interface;
+static struct gpib_interface ni_pcmcia_accel_interface;
 static int __init init_ni_gpib_cs(void);
 static void __exit exit_ni_gpib_cs(void);
 #endif
@@ -1775,7 +1775,7 @@ static void ni_pcmcia_detach(struct gpib_board *board)
 	tnt4882_free_private(board);
 }
 
-static gpib_interface_t ni_pcmcia_interface = {
+static struct gpib_interface ni_pcmcia_interface = {
 	.name = "ni_pcmcia",
 	.attach = ni_pcmcia_attach,
 	.detach = ni_pcmcia_detach,
@@ -1803,7 +1803,7 @@ static gpib_interface_t ni_pcmcia_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_pcmcia_accel_interface = {
+static struct gpib_interface ni_pcmcia_accel_interface = {
 	.name = "ni_pcmcia_accel",
 	.attach = ni_pcmcia_attach,
 	.detach = ni_pcmcia_detach,
-- 
2.43.0

