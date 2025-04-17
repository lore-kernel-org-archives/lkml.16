Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1978201013
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849986; cv=none; b=D3YMv8mSkr/3HBLBsBc3UKrZjxz4huomf6wOZz+5JVDvIJ/O0KG/W8QcS5PrUFZgz8+aTETgMKl6Ebgc0lrJLxi7Ti/KIXfuPDGZ8axWCP/1KABXXJl86yTVaSGSdpt9G2V1Xbtg/ffH6ktW8IBwimBa8QaZ/Oqh5yVnCIlobaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849986; c=relaxed/simple;
	bh=daIUt5m30GbThrgpN2UiMbj827gJGKnXfrI3FUsQ42Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ee8fcTjSYtAJtYsayqu/b+c7hxp0AzVaNWMihaKv/6th7DdAM49jqK6YwDCzW7OoQcQ+nY6iC9rJeuk/l87hHruqIiWInX2bEdE5W4I0nhkAxRuFQCQIjJHrU71GnzLWat1ZhN0JPx9ozCYVnjJV7+lD5LYtpZSjwpp1C1M2+9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Zt570pRK; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Zt570pRK"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2295d78b45cso3744055ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849984; x=1745454784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHxSFc8bv3pUp3i2Yf563NFMSxUhbD3DiyJ7WfN7PZ8=;
        b=Zt570pRKpypYo/KaA6zE2VGh2c+u37YmzdAoTL9bJGMJV8JRiWbgfyxcCWcJTQqXCD
         VFyC8SJL7Lik4JGcwpdySU04fRjqQfgEwy8wm7bH6wapODSZOtR0fixv5Pfl64JT2UiS
         3yy8XkKIQ1PBkp6VwXEYAN9vRbyleWNxNXlTOEWgpb/vOjEyMekNVDiqFrZeNAukhsIL
         ojWaOvKfhA4t+OmcGknhyAIh6CCJRAFDoelmAIcq+Mx7qh7qktYq2Bf9yZckO3ymme8A
         qqdXXNpyQNjZoYgurncg/sZbIB2akGvK1rhLPfOEtqUfAmKjXtJrexp4e9t/2xmufM2z
         rfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849984; x=1745454784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FHxSFc8bv3pUp3i2Yf563NFMSxUhbD3DiyJ7WfN7PZ8=;
        b=tLP4Se+Pi6gcWwZBPpa6MO+oz7echrseHHSpHM//v75DCs0kHuGyzxI29evGmKVcn4
         VXSLsVMowT8qTv/9Sxt+g+lJI0CWLXaIj1uRlLkwsuBoyVvYtQwHiCUcf8PNjUUFZOWR
         dCiFaXnmDT4qbVFptMDgFDf3pLFY07/o9lM34BBIMagvXGnLP4Dx0uRRRZZno92Qnkad
         xxqTIkz0elxs9oL0aakzt6bfO40SR6Z9NINX3t2CZZSxgU+xgPdLCa1THWg8jjdnB90A
         5ylHLCVqwGLSMLxcopQwSp7TaSPmLyVZtLR9Qv+qQLZ5a8/OoGBf7fYcQxXMSKXJ1rTp
         19nA==
X-Forwarded-Encrypted: i=1; AJvYcCVkOnTYQol9HuK11k9DGrE/teEeaiJ7tHqZZhqevQOF/wKuQo9LZ/Yf9Atwu9/zhtgUJgMTiTdW5Iz4nug=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEO6RD7bcv8KcelLybjPq9nNqoPcCRN3guTpTLbxrsq9+KPqsE
	dKnNhxAesFYJq4aLtA2CXoJ3SakChf//3fa/mAazQOsdRcMSRRWqBtZB4N9Gzg==
X-Gm-Gg: ASbGncs3Ip/EMefP4z7EFEAOulTFvxJh6jMejwlMSeaWzRfRHNYcGK1UWikd49kG5Tg
	ymiwixZ9+L+fnah8Vx9FZz6juSY3hRnc/Ov9a05J5Kf92dRElu8r43jK+aNbXJ0Id3vuS+j29za
	x71DA/8s6WNhgPSntuQQZjOtLWCIw3XkKhQqT1uVUmhMFr7GxD4dH4HVfwoRTSxqOWHAOENyWXZ
	BCpDlX9UzIFXc67fOoGNLSUtLoC5rPybxnVVlu+ivVPp1LQ0fDmyx+OEpIF76gZqQ/1vmz3pu84
	9zJmFhvmwjqS6rB7cU8SoTNRv+MQRXjXkFoNPOWWsIoIGtKd33mU9uo08HOa4t2PicVvQQEcESQ
	C6lsnOQ4qqBqyKwCT
X-Google-Smtp-Source: AGHT+IE5J2dfQGuH+x3zeXEOqnTUrZZd8qUQtq7cXkVwrM2vWCpStLEsoHCoYf6uJID2hYkfseB/4A==
X-Received: by 2002:a17:903:2411:b0:21f:7a8b:d675 with SMTP id d9443c01a7336-22c358c5597mr64753925ad.4.1744849983910;
        Wed, 16 Apr 2025 17:33:03 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef11b1sm20910345ad.18.2025.04.16.17.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:33:03 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 13/18] staging: gpib: ines: struct gpib_interface
Date: Thu, 17 Apr 2025 00:32:41 +0000
Message-ID: <20250417003246.84445-14-matchstick@neverthere.org>
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
 drivers/staging/gpib/ines/ines_gpib.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 17a14cb66e63..6cac26a3ae0b 100644
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

