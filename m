Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898D225A2B3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151127; cv=none; b=YTt2zPmaXsK2mTqoXG6JRlXCCtN42jukKzMUI/4W16FWh4n46bmrMCpMeI08ec3o0U3odGE5W31xjWSsrNoEqlPGYZezdvgMOUcOL3twRdZWPr79UOAGHi4ELw6AME4pOcN1XlTfKOGUkXCFODt5SNkaFvQSf3KEwk81v6BQenM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151127; c=relaxed/simple;
	bh=mpMwcjyONGIh2W3fVzcXGp1Kfrhk7hvQoz9ErvoRi6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AF9vZKXqcCNWhFJtSYEaJkOSRX0LaxwW3Yq2Y+FIyqq2QOxODyc2VvhPXqoj2KNaFUYJLtU0QyGSwiWf9n54otdlgSJEbo9dj/N/AxesuqROaoZ6h6F/eXyhh5L++y/4D6tlWrKlApwsm75FXfjfQyR59YpEojP80C4c+YCNWdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=mMunDyRp; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="mMunDyRp"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736c062b1f5so5161318b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151125; x=1744755925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6YenbA8rChcDXkNNV4VK3Kvq4f7lRGg9TAK9we71Y8=;
        b=mMunDyRpRMl0SSik8PLIkOaVQQ+AYGeZnrTN8QzbOPF9BX7Y8BWQxFX7phcMsLkwgB
         6GHVNrTHUjzSMC6Ia9vWYeBkeiSxNjNZjqxXY9TD23ISCuAOYOoDFHxf800RMLHflXx4
         ehaYcGP1oOIL3lHNTzNVObsBK/VfNZlAo3A7BR8TVRiUWH324rPHt7bWYGJNT/0/gN44
         X+plYCBRfoYoXP2HXf7iG6G0Q2Jcig0lODyUbYNGa9asvW5e2/85gWMpofOncpYpCrCf
         lVjsdgXgwJ7I52SChYXso20m4hXSvoLhuBvf62xUbrHCrimGhQJ53j1EgErx/rD8mSQH
         NEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151125; x=1744755925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6YenbA8rChcDXkNNV4VK3Kvq4f7lRGg9TAK9we71Y8=;
        b=oFvV2FAjoJtD/n0thKWJQozy3AjxcdgUhlPmONnLNyvbyOQonvAVUO3K5UK3QjzFTV
         TdgQCAJCYckp/uIpHlhNlBOHWCBAsOvW/Bbm1uwo9BPu9PCVIF82+aEU2AEY55TNjdKJ
         hTcQaEofGyM8uT9geWQQePHQ/gXGg9NLDu0FR5LeeFBI/gm55wOBE3ba6XciScTXPHMM
         rsxmUKwzpJcnDnAGTqhYKMDj1wIOfLEaY8hkTeuFY0MBockGQ8Q38fg/6QHYZAtMyO1O
         ZZ4Gj8qQhetUMJttEqNBhtMIQlvCMpLyg/vXhzXbOJXF+t9jJvu1R2uu/5W/7mDrSWWj
         6otA==
X-Forwarded-Encrypted: i=1; AJvYcCUyqq/SecEmrFawWyXKUBkcojoZF1uFosRWWcfKyLSSNZA53a87oEdpyQx1lYjyM8KgVmyPeSODvqm0FuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPdyNbuxLFbEzYZhj9feRTMHozAM7MLM8lNJx4RTQ90DleKNVQ
	ZDjNLZbn0BZPW/XFnLKB6mIxR/WvSPq4ODtK93Ya+uQxMOVnjCymS04FtHGQDQ==
X-Gm-Gg: ASbGncsW1lRS4c2s693U/n+I9IXTDOyh4Pjw87+R2Y4+V2aqX96XxLlx3D2UKXPmvcI
	wHp4enSl6LEfLHiETJNekLNHAAQaHm1+dPcF7RBr4tx1k88NG8gJtFjMKpnKBCwaADEUnrMl0sZ
	IZLEojjSHJp6B2ByVyk5R486p1t50nbeUWta5XyJrFa3S0rDb5hKBacxrnV2WxQTYPF66qEivbj
	7uMAWrJfCfVRkvatT/GsYbuelKJaO8PmRn9ILeaJm1WcMC54n8nZwAkpWSxNoziiRto1wCnWh9W
	8a9/x+JR+SbnqSax05iFzO3iTBZasDZ7L6nJ8uMvls1Vd35nI61nOPQJ0RcX6b2p+ZJAqLmHjR+
	I38RceOZtnQ==
X-Google-Smtp-Source: AGHT+IG+i9FqESkEDkmuuTUSiEQCuG7Ql/F71HjHIc2UYj78Q5uhMp68wFWb/XNYqyLoS71h+/Argg==
X-Received: by 2002:a05:6a00:4c94:b0:739:b288:13e7 with SMTP id d2e1a72fcca58-73bae527674mr835294b3a.15.1744151124687;
        Tue, 08 Apr 2025 15:25:24 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea09a5sm11572528b3a.107.2025.04.08.15.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:24 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 13/18] staging: gpib: ines: struct gpib_interface
Date: Tue,  8 Apr 2025 22:24:59 +0000
Message-ID: <20250408222504.186992-14-matchstick@neverthere.org>
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
 drivers/staging/gpib/ines/ines_gpib.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 93897088f6f2..7d53f6592845 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -539,7 +539,7 @@ void ines_return_to_local(struct gpib_board *board)
 	nec7210_return_to_local(board, &priv->nec7210_priv);
 }
 
-static gpib_interface_t ines_pci_unaccel_interface = {
+static struct gpib_interface ines_pci_unaccel_interface = {
 	.name = "ines_pci_unaccel",
 	.attach = ines_pci_attach,
 	.detach = ines_pci_detach,
@@ -567,7 +567,7 @@ static gpib_interface_t ines_pci_unaccel_interface = {
 	.return_to_local = ines_return_to_local,
 };
 
-static gpib_interface_t ines_pci_interface = {
+static struct gpib_interface ines_pci_interface = {
 	.name = "ines_pci",
 	.attach = ines_pci_accel_attach,
 	.detach = ines_pci_detach,
@@ -595,7 +595,7 @@ static gpib_interface_t ines_pci_interface = {
 	.return_to_local = ines_return_to_local,
 };
 
-static gpib_interface_t ines_pci_accel_interface = {
+static struct gpib_interface ines_pci_accel_interface = {
 	.name = "ines_pci_accel",
 	.attach = ines_pci_accel_attach,
 	.detach = ines_pci_detach,
@@ -623,7 +623,7 @@ static gpib_interface_t ines_pci_accel_interface = {
 	.return_to_local = ines_return_to_local,
 };
 
-static gpib_interface_t ines_isa_interface = {
+static struct gpib_interface ines_isa_interface = {
 	.name = "ines_isa",
 	.attach = ines_isa_attach,
 	.detach = ines_isa_detach,
@@ -1215,7 +1215,7 @@ void ines_pcmcia_cleanup_module(void)
 	pcmcia_unregister_driver(&ines_gpib_cs_driver);
 }
 
-static gpib_interface_t ines_pcmcia_unaccel_interface = {
+static struct gpib_interface ines_pcmcia_unaccel_interface = {
 	.name = "ines_pcmcia_unaccel",
 	.attach = ines_pcmcia_attach,
 	.detach = ines_pcmcia_detach,
@@ -1243,7 +1243,7 @@ static gpib_interface_t ines_pcmcia_unaccel_interface = {
 	.return_to_local = ines_return_to_local,
 };
 
-static gpib_interface_t ines_pcmcia_accel_interface = {
+static struct gpib_interface ines_pcmcia_accel_interface = {
 	.name = "ines_pcmcia_accel",
 	.attach = ines_pcmcia_accel_attach,
 	.detach = ines_pcmcia_detach,
@@ -1271,7 +1271,7 @@ static gpib_interface_t ines_pcmcia_accel_interface = {
 	.return_to_local = ines_return_to_local,
 };
 
-static gpib_interface_t ines_pcmcia_interface = {
+static struct gpib_interface ines_pcmcia_interface = {
 	.name = "ines_pcmcia",
 	.attach = ines_pcmcia_accel_attach,
 	.detach = ines_pcmcia_detach,
-- 
2.43.0

