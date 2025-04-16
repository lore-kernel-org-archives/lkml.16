Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C32F24C098
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836145; cv=none; b=Cg/egEXBpUhhCOMoWiUpVNLfqDMtQKfumkQsXDzt92XaPM+IJ6Cff2tVNmjH4/bhkgiLpTBpPPHjuVx9hG2PVUkWFcwo5fOGAe61ZBBxGt48/3Q8ZAw++W5u32WfvOD6KpbqPP6NA8cRdTt3EfFnOXEOPwEXGwWs930je4Bx2N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836145; c=relaxed/simple;
	bh=Dsmp5RsheRWvvCg8XuqH/IOyChdJsfIjOoakpD6hyQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e/MlNuVleIwRPaADSla6lAY1+CYyfsjjKGhoNNbSYZvkmvrVXjmZ0ePfrxIU9Ege2N1KpkPWHq9Xv8CK5bJJuiACBPQrCHFsGFrYZm97PSdBKPGWD2zPRHgxO2Z80YoZd71j5X63ZnOA4C4Ka2HmgNyl6uL8jvg5ksiA7XUu18I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=E6ixjvP3; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="E6ixjvP3"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-af50f56b862so40146a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836143; x=1745440943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41DhzRK3ONBBmT2sJGJwKrMcn46yaTakFIeFswWFnds=;
        b=E6ixjvP34Qys8o+5y8IJKVebJb3mnDGIAVa74h0DvDPUZteWT5s9Wqibwir8QwL4Qt
         bR9ZBUro2Evu24pPaft5dd8nZ/tfuFSym+O0AhzWDAcJczkGxqWHQFVcKG6BjDMDJWyH
         yKzx2pE8sPsbZDBF1d4L7/Tw6azkyyrYZ2RlRaBy4KmfTeHR4Sz2Q1r8rWg8pSAAfdx+
         54+r+7AmfGAfKVffc87JDsQ7qCh0ytfZSR4S1GQamziylv8m9R294Z5XdPzpFo7UwNwg
         V75EfoYoyu4toVvZhXtRsQMR64fX9ZSHos6Q55WCtsvuw9FS8eDJ1o0xrIjECKIvFtsr
         GA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836143; x=1745440943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41DhzRK3ONBBmT2sJGJwKrMcn46yaTakFIeFswWFnds=;
        b=M8Q6kdTXUkH34Fa/ZV3GLIl3ufL6PlqW6U6/6p74x2IrF3X6nOfd4BFOla4CKmtlvZ
         Fq8nDCwSHLm50CIGQ6KMqFnNcn3trbuRJca2vj/AOiUZIHJXaKPGDdx9tTATtOYpA/yI
         XexQJaFZtgR5M2R/jCOZEZ80b2LzIfTrmVUbmbfYnSBwQZbA0TrFUFGgGy+Jc4Lxe8Wa
         0PPiGL/LjL8ISLAlnvvPW6gCaC1xCHaXpq0m5Olmm0yeScywCuaVhZvP6f+Z6FAx9B/u
         ktqg0VOrrwmxPC637nOaLDUH5c517su/gxuCJy72oZ+AAuDs+rR0NvuYtOQmTAuGhp4k
         J4RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqU89k7YCRBzfPnacqOXXPUj7PZ2icaVPlFAhASFaymbUqdRUMR66b2769Ul0icVZtDG389PPsCcIlKrY=@vger.kernel.org
X-Gm-Message-State: AOJu0YymtbZnshceJK+1iwUmMj1+wBge8BKAqJUWvY4+/tjmtFAAZzGT
	mSSF5T5KEgKhzxeCj+6cte8UmnuALTNiG0lHIcL4gYlEizeANy0VrQSyJujTdQ==
X-Gm-Gg: ASbGnct5N4sQWsjOo+pyd1Lx2bthw4zd4Yp0PlPARR9l6lKsbvXA1SS4GqfCYwRlYNj
	5v+JVmGmvaoe0uCJc+5s80R6xst/jSFUPauhyGTZhbepgyfLfRBh86Bf1BROg+n1Rs+Jvy05vKM
	RpopDpZgXAtixz3pEcHaPG+D1fHsJhrMA3bXu+1nUHcsVb7NlwjFJ65rLQR0kgi8s3vTddBaFN4
	gsMWvQb0ZRt8t+7GhtK18RFm7jtnFa0HaVZdfEYL3+YQx9lUQKdmXTNbZrr/SqrsfeowB0nm/nH
	NccPeTnDuxdy0LaS6LDXH+gpA96R2KyXNR9tOnQDhjbnO5WTkvnd1KiQXcC2pGFdBHM1aS7yKpY
	Qgb267w==
X-Google-Smtp-Source: AGHT+IFXDX7qzzgAc+ruTnxmUO6FrKtnEQRt0vgqXwdJF79eAqjrLA9y3UAj94msFcZ2u+zXUxCwNw==
X-Received: by 2002:a17:90b:514c:b0:301:cba1:7ada with SMTP id 98e67ed59e1d1-30863d257f2mr5314960a91.1.1744836142895;
        Wed, 16 Apr 2025 13:42:22 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308613b2ff9sm2093453a91.30.2025.04.16.13.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:22 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 13/18] staging: gpib: ines: struct gpib_interface
Date: Wed, 16 Apr 2025 20:41:59 +0000
Message-ID: <20250416204204.8009-14-matchstick@neverthere.org>
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
 drivers/staging/gpib/ines/ines_gpib.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 2d98c571a4b1..bf830defcad3 100644
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
@@ -1218,7 +1218,7 @@ void ines_pcmcia_cleanup_module(void)
 	pcmcia_unregister_driver(&ines_gpib_cs_driver);
 }
 
-static gpib_interface_t ines_pcmcia_unaccel_interface = {
+static struct gpib_interface ines_pcmcia_unaccel_interface = {
 	.name = "ines_pcmcia_unaccel",
 	.attach = ines_pcmcia_attach,
 	.detach = ines_pcmcia_detach,
@@ -1246,7 +1246,7 @@ static gpib_interface_t ines_pcmcia_unaccel_interface = {
 	.return_to_local = ines_return_to_local,
 };
 
-static gpib_interface_t ines_pcmcia_accel_interface = {
+static struct gpib_interface ines_pcmcia_accel_interface = {
 	.name = "ines_pcmcia_accel",
 	.attach = ines_pcmcia_accel_attach,
 	.detach = ines_pcmcia_detach,
@@ -1274,7 +1274,7 @@ static gpib_interface_t ines_pcmcia_accel_interface = {
 	.return_to_local = ines_return_to_local,
 };
 
-static gpib_interface_t ines_pcmcia_interface = {
+static struct gpib_interface ines_pcmcia_interface = {
 	.name = "ines_pcmcia",
 	.attach = ines_pcmcia_accel_attach,
 	.detach = ines_pcmcia_detach,
-- 
2.43.0

