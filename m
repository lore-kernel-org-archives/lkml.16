Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933C82561D3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151116; cv=none; b=griF4JG6cKlUFoMP9elmdm88Ef5fP8aL7ZVn429ImVRWYugr+iLihe/O1knWld17DLSmxeXG2ONI0m3WWbm7/rT075Y6Km8PiP+qc3LJeDkBUQ+dDvUVz+XeQnHdHsrdH8pbPPKEiseS/SPkx434+E/9/WjwlBbi8V+JMo5JslU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151116; c=relaxed/simple;
	bh=O5+RhG5ge74kMkJH0h6KdnV7xnNERQlJFnrKnXJqKg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZfjgDkruDovQnEStQ0yOVlkCdS+62q+QFXOKY4F4bgCKpLttGmwowk9I2kCdh/EXM1liFBl/y+QdAq+5dnHqEWNmRBhOu6f0ttfC7yBXUgIsQDrB9jvl3SCFfKrjBpJYLZ+BgD7MGHL19aRZZHceT9YjsHfM4XZRR1b/s6Sp5ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=KMVRBd6f; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="KMVRBd6f"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2264aefc45dso78196175ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151114; x=1744755914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFx9w/yMhxB8IB6NL0DBl9+YzkxzqjDcwxAFXBMcOfU=;
        b=KMVRBd6fZyhdijuisOzaChdN5u8wpViRlHRh93OkSr2TWbI782aWxiV4sWDkkUXTLd
         GyMQ7HYtL2MaqH3vpDQWbAKtHTF8PYoxflgF95GmLTV95IKdxc6yd4NAatadn1XpbvvX
         XVAqb35+oyaRFy+6pGvzEOJT+5HWgbMahedAQZAxx/Vx+Exvv5wPAYE0e5+WbYGubl2+
         ay4focjr2IdJxRQ6V4UKqYuuCTnaf45tB0VWpCvWMUKxR69k6/DLASYcRJh1Bye5IKFf
         8I/tmcFMebsE67IBrVW/ftC2iA9LeAd/+g4HfHZ9fjU5HyMJdz4Ujasr/fVM/2ge9hWa
         z42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151114; x=1744755914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFx9w/yMhxB8IB6NL0DBl9+YzkxzqjDcwxAFXBMcOfU=;
        b=eySVxTqhxUWGNfp8K0ViJtsRbSud/I9RF0Ta/pplQPgD56guxJSEZz28iLgVS0SyDf
         pWkG8fK1n1hClne5oMycYKvPucGw/7EY1gswnyPyNILrRbsu9kcGjaP9DpGCdIrcZtYx
         XARaWD5nZi1EAYsIueSQhPbP8AUWdL3weefV17SP2C2bW8djo5hCxt5bTK3DGYN3/gsg
         y+6vK82GwCk6jJ6rKWs4yTMYTUCEzlGcYPJWEvWdhXKRipHzlk9xpWmSRW4hXj1Ub2QD
         AUoGbPevXH26e30HXF98sWVqFszIVRgTOQ5BaLpYvN17rj5RMtTrgom91hTM1YZ6pmxw
         9Yug==
X-Forwarded-Encrypted: i=1; AJvYcCWTA3Q4JDyIhdiWak63eGXSMs98YQ/HuPoSHfEmqpiaLrn/lzFtJaiq5EpPUh8Xg8PvlvrzZJLvUukcmHU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yycy4IqGFmN+bbDuXRxguMcM3Q6ClUTbqjsR96k7EXfEzDQVtco
	F+fOBoRM80ggV6Mcc14caDoZ/tJqTwTFdD3/jvP+zqzd/OZflSa73jYPyfTeLQ==
X-Gm-Gg: ASbGncvOb/O2uIdhdCB7zJJ3SJFxvOYVr0OS/4HRIoRSskVuKuGtLiPlMza+g70O2bV
	r72oNNQ7SAI0sV4Or3q8m0JmgTwdwYlQOzI73QZn46pGhXVz1AwSBrjOpMgMrNz9Qe8N/Vsmm84
	Q9uEFVLsnG1vXHXHqTNTKIhc+/trQZXTcU5h2TenseZ5vbDOYswjHFlzKX6oVreJJdc0Dv9gS0K
	Blk08XJp9Ys3x3JBP6+HEC56v3YSInO57KeqFIF9vmGZNxx+ksIRJKjJGnlsg5m6rDqctF7KqZ8
	n/9horrCMgc3qN9ONtuOK6k5xPH1VHiyQp61MstjzIY+HO4nqo36L6sKFtQUsqz5sPLoa/QYW4X
	yBFvaAL/arQ==
X-Google-Smtp-Source: AGHT+IHybuhz2+2wE/bIEAPIYc3Trj44vmkOCDCJUldt1nC/a5V165jljjhXhyKbx8BpNV7FK79R+A==
X-Received: by 2002:a17:903:2ecb:b0:223:faf3:b9c2 with SMTP id d9443c01a7336-22ac29b051cmr13402905ad.27.1744151113816;
        Tue, 08 Apr 2025 15:25:13 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea09a5sm11572355b3a.107.2025.04.08.15.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:13 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 04/18] staging: gpib: cb7210: struct gpib_interface
Date: Tue,  8 Apr 2025 22:24:50 +0000
Message-ID: <20250408222504.186992-5-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222504.186992-1-matchstick@neverthere.org>
References: <20250408222504.186992-1-matchstick@neverthere.org>
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
 drivers/staging/gpib/cb7210/cb7210.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 6b22a33a8c4f..20cea66d6557 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -686,7 +686,7 @@ static void cb7210_return_to_local(struct gpib_board *board)
 	write_byte(nec_priv, AUX_RTL, AUXMR);
 }
 
-static gpib_interface_t cb_pci_unaccel_interface = {
+static struct gpib_interface cb_pci_unaccel_interface = {
 	.name = "cbi_pci_unaccel",
 	.attach = cb_pci_attach,
 	.detach = cb_pci_detach,
@@ -714,7 +714,7 @@ static gpib_interface_t cb_pci_unaccel_interface = {
 	.return_to_local = cb7210_return_to_local,
 };
 
-static gpib_interface_t cb_pci_accel_interface = {
+static struct gpib_interface cb_pci_accel_interface = {
 	.name = "cbi_pci_accel",
 	.attach = cb_pci_attach,
 	.detach = cb_pci_detach,
@@ -742,7 +742,7 @@ static gpib_interface_t cb_pci_accel_interface = {
 	.return_to_local = cb7210_return_to_local,
 };
 
-static gpib_interface_t cb_pci_interface = {
+static struct gpib_interface cb_pci_interface = {
 	.name = "cbi_pci",
 	.attach = cb_pci_attach,
 	.detach = cb_pci_detach,
@@ -769,7 +769,7 @@ static gpib_interface_t cb_pci_interface = {
 	.return_to_local = cb7210_return_to_local,
 };
 
-static gpib_interface_t cb_isa_unaccel_interface = {
+static struct gpib_interface cb_isa_unaccel_interface = {
 	.name = "cbi_isa_unaccel",
 	.attach = cb_isa_attach,
 	.detach = cb_isa_detach,
@@ -797,7 +797,7 @@ static gpib_interface_t cb_isa_unaccel_interface = {
 	.return_to_local = cb7210_return_to_local,
 };
 
-static gpib_interface_t cb_isa_interface = {
+static struct gpib_interface cb_isa_interface = {
 	.name = "cbi_isa",
 	.attach = cb_isa_attach,
 	.detach = cb_isa_detach,
@@ -824,7 +824,7 @@ static gpib_interface_t cb_isa_interface = {
 	.return_to_local = cb7210_return_to_local,
 };
 
-static gpib_interface_t cb_isa_accel_interface = {
+static struct gpib_interface cb_isa_accel_interface = {
 	.name = "cbi_isa_accel",
 	.attach = cb_isa_attach,
 	.detach = cb_isa_detach,
@@ -1333,7 +1333,7 @@ static void cb_pcmcia_cleanup_module(void)
 	pcmcia_unregister_driver(&cb_gpib_cs_driver);
 }
 
-static gpib_interface_t cb_pcmcia_unaccel_interface = {
+static struct gpib_interface cb_pcmcia_unaccel_interface = {
 	.name = "cbi_pcmcia_unaccel",
 	.attach = cb_pcmcia_attach,
 	.detach = cb_pcmcia_detach,
@@ -1361,7 +1361,7 @@ static gpib_interface_t cb_pcmcia_unaccel_interface = {
 	.return_to_local = cb7210_return_to_local,
 };
 
-static gpib_interface_t cb_pcmcia_interface = {
+static struct gpib_interface cb_pcmcia_interface = {
 	.name = "cbi_pcmcia",
 	.attach = cb_pcmcia_attach,
 	.detach = cb_pcmcia_detach,
@@ -1389,7 +1389,7 @@ static gpib_interface_t cb_pcmcia_interface = {
 	.return_to_local = cb7210_return_to_local,
 };
 
-static gpib_interface_t cb_pcmcia_accel_interface = {
+static struct gpib_interface cb_pcmcia_accel_interface = {
 	.name = "cbi_pcmcia_accel",
 	.attach = cb_pcmcia_attach,
 	.detach = cb_pcmcia_detach,
-- 
2.43.0

