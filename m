Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD1B238D5B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836134; cv=none; b=N+nLECuSdNHxpIacaS7hNJ4l1lDiZsWLVQUWbNE0dY7t1xTQVgOUZ3+sVKNL1wYwu6hBUbbxZm8gWhPsvK4EDLmPkBnRvXSFKvOGtmfr1E3oo9s/CQYg6LUXNEqLvodVbHB2uq28heSy7wnCb1+WicnS/tX7YTSPCth7sf+/S5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836134; c=relaxed/simple;
	bh=pZUC4ylofhNxwo4hjzJ3ORj5g9m8tUYOPnTEG2mtgeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NSUit58RygWE8jzQdBoLhwOQuUk4KVKup+xD5YuHjL7DtDvAu4Sdl/SQWfSDEpZWKGUdb8b6a0x/xX0l13uoVcGuQqBH3yWr91a/3TtPjr0yfl7UcoqAkEuxWlGvx8IdvMIQtTgyem+C8ApbTBQcIY+Ggt1m3/Fy80FEOi200xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=PHelqR9x; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="PHelqR9x"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22c33e5013aso1357325ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836132; x=1745440932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4oZK0xozCaFDbvJQEqimY0ELWSNsTb2XtNTRfDwp9c0=;
        b=PHelqR9xOVYEYIec6QOpi3ZOekQhqDGqVv28D34BfQHOX6+mPOAPFWLzT1kn0J7YUl
         peVV/GL1v7ebVZIMFohJqBS/Ff1XHZSLwNWeEil6uVpfV90uiZ4+D7juXmmUgtDK+b5f
         RhsOmh8qWSirGq28Eax0PY6R7vahoNcY0mLv0SAiBhwacFKlR/DDn62kziNaQAxL1L20
         H4Z2ApFDRiw+baapBjfZF/HBHrOqeeoku6IcAZfR4Uh/H+I5w2K5JOpRA2sGc+AjMBHU
         rUBkUeImDmRfRXV9f/yCkde0c5O50ATKfmfEqnjXEcBS4MD2Zo3m6D4CMm6QhZur7Uqa
         Tl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836132; x=1745440932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4oZK0xozCaFDbvJQEqimY0ELWSNsTb2XtNTRfDwp9c0=;
        b=Lxt/gwzabGodABjIldRza10Z/Tsdjw8wlZ/XdiF+TkNSfWPJXa9zIlVe7CEULyMvf9
         sHvsu2GTzZ//qH5Yk8Kk1dn7+KRfjP1cf91lLvxOsiKrINJ5v/jgdlpCwWJxUo6H9LdE
         +14efsZhWUlJranKDSyk8HK1zW4Dg8XRXHxbtXKf+kQ7uZ7zoaAJNCCMLPMeUkUeCf8I
         4iseYHbC0tTGYroHdTuH0CtVov4ht2g1fHMbqpF3KeK+kdnwXjrsHc7Oar8DFYK4xD4m
         wio4EpoercheUnvysEC9jEF3vPmiirDzapGlSBkEWcWwEWm0Qj7v+1yj++eOGiTZjL75
         hRYw==
X-Forwarded-Encrypted: i=1; AJvYcCXVwyQLLyW7Sx/uZGRgtzWAw0DQtQ3r8yQiVHb8tjx7qfgUT0pKvGzRKZ7BCiBGqesHmZr1JOpLRP4dA4s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzywLwbbeV41lFVsikN1tRaOTt3ZQKWstqJPzxDrePLGH34qYLv
	+QDCVw8vEF/st6sjYt6wy/3MnMjMRRC9cDs/I/1JsFzbHSera2eqOCrHMhj4IA==
X-Gm-Gg: ASbGncsfLMm9qx/lpYzeV0Rv3IgtiEAKGsulKLwW9WbYiErwB/J32aF4ezWW3oKrOgg
	mHcNYJex97xmMuhqPKXUnCr6UKVuWNY24AcrJSgTEBm1AvHlZCpZUWqKbrAbY3EI5Ds6nYBbYUR
	xjykgQp4Lp5jlWOIqpxhsnNQxqIBt/FlwFwYCa7auzsb8vD1KPye4L3LBPNKXU/TQ6nWJC6xNp2
	T8fRZWLDdgdBaN89MupBmghzi+leQxpm4V9i3ztcwUE+Hy3HSxLNv+SGN2bgKxmONzkO9azuF5b
	4jh1aYoEgw5H/z90GQ9IFC1DVbFsnju9POHVTl6m2AJRxZEqnN+t623AiOk6Ddpg+ax+fJ0QEfD
	qrXn8lQ==
X-Google-Smtp-Source: AGHT+IH2QjEiF8BA9vRwv8cVExSmGxjUbazbC7L/d/yd17lt7vit8Gv45ZGPWCg39eE4HwM6SNwDSQ==
X-Received: by 2002:a17:903:3202:b0:21f:988d:5756 with SMTP id d9443c01a7336-22c3596b8d1mr54714755ad.42.1744836132166;
        Wed, 16 Apr 2025 13:42:12 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fe6894sm18836745ad.215.2025.04.16.13.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:11 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 04/18] staging: gpib: cb7210: struct gpib_interface
Date: Wed, 16 Apr 2025 20:41:50 +0000
Message-ID: <20250416204204.8009-5-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416204204.8009-1-matchstick@neverthere.org>
References: <20250416204204.8009-1-matchstick@neverthere.org>
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
index b15ffc777c39..54c037aabc26 100644
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
@@ -1334,7 +1334,7 @@ static void cb_pcmcia_cleanup_module(void)
 	pcmcia_unregister_driver(&cb_gpib_cs_driver);
 }
 
-static gpib_interface_t cb_pcmcia_unaccel_interface = {
+static struct gpib_interface cb_pcmcia_unaccel_interface = {
 	.name = "cbi_pcmcia_unaccel",
 	.attach = cb_pcmcia_attach,
 	.detach = cb_pcmcia_detach,
@@ -1362,7 +1362,7 @@ static gpib_interface_t cb_pcmcia_unaccel_interface = {
 	.return_to_local = cb7210_return_to_local,
 };
 
-static gpib_interface_t cb_pcmcia_interface = {
+static struct gpib_interface cb_pcmcia_interface = {
 	.name = "cbi_pcmcia",
 	.attach = cb_pcmcia_attach,
 	.detach = cb_pcmcia_detach,
@@ -1390,7 +1390,7 @@ static gpib_interface_t cb_pcmcia_interface = {
 	.return_to_local = cb7210_return_to_local,
 };
 
-static gpib_interface_t cb_pcmcia_accel_interface = {
+static struct gpib_interface cb_pcmcia_accel_interface = {
 	.name = "cbi_pcmcia_accel",
 	.attach = cb_pcmcia_attach,
 	.detach = cb_pcmcia_detach,
-- 
2.43.0

