Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E9624E4A9
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836150; cv=none; b=cUkcs4MTDLYnwhjdcqFft59+KmqDWvvFnXdHl574xY0MhvmJQYAKjvs68cwJPdlHYLXqssqTOv0jv5RCX7drNLoej3MTICzPk5j16oXLYlXbA9C178U1FouMShqw/+zX4Kpv981MgI7koPubmGYFKorpz8gGodEVbHye8Qmhwmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836150; c=relaxed/simple;
	bh=1+tRRy/nL01MPl0+5FS05H/L2lfuD8Vmz0fi46Q1xuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gnFL40LeHqK9R4bs4Wfkr9DmfQtTyiWAjVRZYohLB/L+s+RGHgi7t54aZhuS46oQzmIAiFKOPd8ekr2pYCJovfyK5xR7iUV85JgSJweGlTUSuPYbxOSdcNrGoh0zKlXE4fIXt8KrUf6c1jYOeblikGM0k6ehuKHthsXmM4qEY84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Ap9GVbsW; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Ap9GVbsW"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso33631b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836148; x=1745440948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjTAiMO1GxG/PObrFdD9u5YrnCsI7HGevSexjRmDxRA=;
        b=Ap9GVbsWVbEwMm0Sgi8qI6MEiKXrdUUqyX+t2M8HmHTD93+khDB9pi9FtkycY+X4+m
         PwY9c4GzGBuS2X7kkmUapSK01zLGyDXgVlIpWjqlGM9a3FttFWfq/5hXUTuYONXGuBGi
         VDLh2tfthNrFZtzqdPB6BrKUR8WyWcvImrHeT2RecTv7Lc2IKUpHAyUjE2f8DnRq4TEy
         mia5mh+0TlvdkxI+K5knujm+CVw93UaOAFu6mULPf/vvjNel4cxG7MGWv134iKovPxgp
         7kynVG3fcKQ0ReGXvKS/gooXrws72eAgSCsR0JKNg9l/NIBvYHzovReFJrI1mut+euIt
         dqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836148; x=1745440948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjTAiMO1GxG/PObrFdD9u5YrnCsI7HGevSexjRmDxRA=;
        b=RS559CUH+s8t3MftRRRH4OOGVcqEsNkphHWNg49Dntz5kjxZKcX/0Ztb2mWGx5jrqf
         /xGJQpou2sawQdeFfoKmJUf03LRakXyWpSgTBurd0SgMS+DPm+o7SBFuoVJRF+ncLCc2
         xbIzWeoJ28JibpHyX+/YxMcuz8mhUWToLOR1EXjujXnIY+I6iynZfePboWkAIEgBPS7o
         P7hBpXKL6HBILCO5FQKdrZAjQ2Fg4WEmXG5YLJJ8J5orladtBDUWEKOX0t9s2DhiZAbr
         qMr/UWdrzvymIFkN3Rs+5k/UqJJDKTl3SD6XuSXCIKxUzTbGFgtrq3N8rp2VCBj2lVLI
         X21g==
X-Forwarded-Encrypted: i=1; AJvYcCU2wIODyVwyFRFe2F5K2oQtpJTimLCX4XBltSHjZivcuA3yGoHc2z+y58Q/c6hc5Ygcjw2rpCAqB79TbcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAIa33or4rUUGGtI0BnsTXXSF0O+Z+z0n4gpHc33MABuOsXcuT
	JGfj/gI8shfQDgvQm8oJCTs1dZiG4dnGjml0t4sbs5tu4SFHRqLedfiVduIwNg==
X-Gm-Gg: ASbGncsRCzVru64pF4b9XqwvNtkslzNEIp3th1tw04jrMBQe0SCZzos/U2ECUDg+A01
	GDo6eAfTkEK5KGw0Lvh0z/kl+7uI8ZzYqFFY5IjmzpQAqawE51peNxrGAAbHJ3ibKc/sVPRgcBW
	uHdnpwFqkg4NvZsk0t2KoV+jycYkU7rUDyc9dYnIFt2JzmDwb7vMne6/l0usZfJDYqRSrwzuDOL
	tPYyB1fMSl299fyQG6ovdO4DVt5T876+sLEEyxcP63Jt82mil21jcdVtCyAyuFQtXHuyXzmUExb
	m9ooS/BEXYpuBXg1WkFGIxD5fHGnu07J+xLLGEmkRqc0gFQY7bml+ja8rl0XGZge+WnfiNZi4/u
	49ZikWC+ii8UaNWC5
X-Google-Smtp-Source: AGHT+IHpNWh/TvCbMhLIoPioSeKOQ3n/NrD1YbIxs/DRLH0xJAqpSQFycneeGM0Ao3h91UMlT6xyXg==
X-Received: by 2002:a05:6a00:3920:b0:736:3c77:31fd with SMTP id d2e1a72fcca58-73c267ecd0bmr4332352b3a.23.1744836147688;
        Wed, 16 Apr 2025 13:42:27 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c2119sm10778264b3a.40.2025.04.16.13.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:27 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 17/18] staging: gpib: tnt4882: struct gpib_interface
Date: Wed, 16 Apr 2025 20:42:03 +0000
Message-ID: <20250416204204.8009-18-matchstick@neverthere.org>
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

