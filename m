Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E61D29117E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513462; cv=none; b=BwZw6brrd5T+w37aaot49n4+pRO8MwA+V4hVyP7egxJma8V89arbkvk0LM2ncclyXhtKu+Nf+UyvCd58E+XxGYltxyqW7eKWX0RtLszHsx908J9sYTCp+A5SnlH3tPyuJ2M6Z6wFuyp9/+w0BFVDsWw+U1rcU0XxT1reDCK3+pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513462; c=relaxed/simple;
	bh=fd5h5226p9UGXVZ8th2FGoGfLL4oYW4m8ar1pRGrIsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b1dfX9xunYx84efIi8S48dqV0FrKDZuS9I4yy6spxiPt07nwnkBsxI2TkfGhMFa5Jo47rDj8CfmgKQGAiUQkk/hHxceB0Nq4fUDdIBtQ2bzneUtXtXePZbRCxuSkkGWksjaSJKiZgTDFEsfGdNZURDfQqsLZEmG4PpHUKCQnaQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=H12SC9K/; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="H12SC9K/"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2cc57330163so847061fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1745513460; x=1746118260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcndkTp5legK2dTJBdv4J/lSCNqmghjWhrBEL4ikoYE=;
        b=H12SC9K/nlinwYt0oa72461Mfleb7PUl4ha+Bs9o3Bc/doGaFcYCECopiW6It9c+lc
         G6geRpALjFniceUrbrzHMb0apkA5SN2vygAfWptkRGTz8A4jNqfTotwa+wPfcnrEKC9v
         EBDSG+ZIt2VocQ+uqzdbVaFj37QA0jJhhx71uGn+FNXnex9FgVohDa8AsRWP4WKt1aL3
         Vsr+eoqLAb3oL0kKUIGZMtew60RVmimxMPvIPVTNJ0w/sIFy6V+Gr701DvGOTwgiGdZf
         Kqek7cJH9ejIzxYA+RmBjY8nNeSkfWiJj04y24lyEGWi5zFaoQ1n7E4YOXPMVvA5xdcN
         TK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513460; x=1746118260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UcndkTp5legK2dTJBdv4J/lSCNqmghjWhrBEL4ikoYE=;
        b=A3kIbJEkgqU+3QPxKfJE0Y2b54offJgIGe6ETbQ9brOk0OP3WYrenXEN1ruLmnVZzP
         8yYv9D0217Z5eGWDkPHlZFCIkFfEGyu8hHCH/U4BMC0pQssC+SdmpezNuMHy+FdpvIe1
         uJYZWThrEtRrIsHvclKknTiWXovokYUdlEcOh99upAYuXV4vtqRR4/GoKNUMiD0DGscW
         K6EoggqPC8JU/EYtUtABMBP9xrZZYtzxhe7MhPqMoWKrOOPUom0D7s6PbBLx4ER+3rjO
         jSz7Ag1K3eobjF93VFcE866ytMd5Y6cV1au2p/+M7LmSXgrwLRc5TEiQ+lEx07vaNCG6
         p1bw==
X-Gm-Message-State: AOJu0YyP2A/0YSGby1m2PHISkiiC/MtbZVI7pxVBAwAkt7ls955EpTas
	VcISV80ClAHqt6k44jCI3Q5bGCv8+KKwDIrAM/3IOZ8CgZ9zPnuiCRK8tW6ku6GRhWblDOKO/Oz
	A
X-Gm-Gg: ASbGnctcUH0+LCAv2KSE+U3BKehVkhnQDAWLcHpYf8fo4k9DO+V1utVbErgmpkb6Lr6
	As9ogZ0ApFZtN4vby8rnj4hDbBEuB2hPlKc+BsIT0uXj2RrBqtdF9E/yjz5B7VYKeuFxZq4LfTd
	BlZPOBtU89v/KGFgxfw8lSoacnVBFgvSlp8FMioWM6J/n2u6z8de84ilKaqaJuJ4nAvuH7AbW7X
	whlB/MkYZ69pYFvHggq2uCRZ+68LsBUXIKOnQGxQzovOcU+GsnHjUe0VxnLk7/iNlj8Pw+SEKNd
	lT3kEAUn49Eg7q5RnAT0/qLIqcLnCXXvQ9U=
X-Google-Smtp-Source: AGHT+IHvH5g1pUsqssiBfm6bR7wtFuGkcmkXmOuTpra93Is/ODb7u30DjUeZOPANFp/MMlEBeADP7A==
X-Received: by 2002:a05:6870:70aa:b0:2c1:aed2:abd2 with SMTP id 586e51a60fabf-2d96e2ead17mr1943389fac.16.1745513459716;
        Thu, 24 Apr 2025 09:50:59 -0700 (PDT)
Received: from localhost ([2001:470:b8f6:1b:af2e:7abf:8abe:2726])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2d973b7889esm368087fac.31.2025.04.24.09.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:50:59 -0700 (PDT)
From: Corey Minyard <corey@minyard.net>
To: linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Rik van Riel <riel@surriel.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Corey Minyard <corey@minyard.net>,
	Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 18/23] ipmi:si: Rework startup of IPMI devices
Date: Thu, 24 Apr 2025 11:49:55 -0500
Message-ID: <20250424165020.627193-19-corey@minyard.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424165020.627193-1-corey@minyard.net>
References: <20250424165020.627193-1-corey@minyard.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is possible in some situations that IPMI devices won't get started up
properly.  This change makes it so all non-duplicate devices will get
started up.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/char/ipmi/ipmi_si_intf.c | 82 ++++++++++++++++++++++++--------
 1 file changed, 62 insertions(+), 20 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
index 062f92cace24..8837f85f2d77 100644
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@ -2095,9 +2095,18 @@ static int try_smi_init(struct smi_info *new_smi)
 	return rv;
 }
 
+/*
+ * Devices in the same address space at the same address are the same.
+ */
+static bool __init ipmi_smi_info_same(struct smi_info *e1, struct smi_info *e2)
+{
+	return (e1->io.addr_space == e2->io.addr_space &&
+		e1->io.addr_data == e2->io.addr_data);
+}
+
 static int __init init_ipmi_si(void)
 {
-	struct smi_info *e;
+	struct smi_info *e, *e2;
 	enum ipmi_addr_src type = SI_INVALID;
 
 	if (initialized)
@@ -2113,37 +2122,70 @@ static int __init init_ipmi_si(void)
 
 	ipmi_si_parisc_init();
 
-	/* We prefer devices with interrupts, but in the case of a machine
-	   with multiple BMCs we assume that there will be several instances
-	   of a given type so if we succeed in registering a type then also
-	   try to register everything else of the same type */
 	mutex_lock(&smi_infos_lock);
+
+	/*
+	 * Scan through all the devices.  We prefer devices with
+	 * interrupts, so go through those first in case there are any
+	 * duplicates that don't have the interrupt set.
+	 */
 	list_for_each_entry(e, &smi_infos, link) {
-		/* Try to register a device if it has an IRQ and we either
-		   haven't successfully registered a device yet or this
-		   device has the same type as one we successfully registered */
-		if (e->io.irq && (!type || e->io.addr_source == type)) {
-			if (!try_smi_init(e)) {
-				type = e->io.addr_source;
+		bool dup = false;
+
+		/* Register ones with interrupts first. */
+		if (!e->io.irq)
+			continue;
+
+		/*
+		 * Go through the ones we have already seen to see if this
+		 * is a dup.
+		 */
+		list_for_each_entry(e2, &smi_infos, link) {
+			if (e2 == e)
+				break;
+			if (e2->io.irq && ipmi_smi_info_same(e, e2)) {
+				dup = true;
+				break;
 			}
 		}
+		if (!dup)
+			try_smi_init(e);
 	}
 
-	/* type will only have been set if we successfully registered an si */
-	if (type)
-		goto skip_fallback_noirq;
+	/*
+	 * Now try devices without interrupts.
+	 */
+	list_for_each_entry(e, &smi_infos, link) {
+		bool dup = false;
 
-	/* Fall back to the preferred device */
+		if (e->io.irq)
+			continue;
 
-	list_for_each_entry(e, &smi_infos, link) {
-		if (!e->io.irq && (!type || e->io.addr_source == type)) {
-			if (!try_smi_init(e)) {
-				type = e->io.addr_source;
+		/*
+		 * Go through the ones we have already seen to see if
+		 * this is a dup.  We have already looked at the ones
+		 * with interrupts.
+		 */
+		list_for_each_entry(e2, &smi_infos, link) {
+			if (!e2->io.irq)
+				continue;
+			if (ipmi_smi_info_same(e, e2)) {
+				dup = true;
+				break;
+			}
+		}
+		list_for_each_entry(e2, &smi_infos, link) {
+			if (e2 == e)
+				break;
+			if (ipmi_smi_info_same(e, e2)) {
+				dup = true;
+				break;
 			}
 		}
+		if (!dup)
+			try_smi_init(e);
 	}
 
-skip_fallback_noirq:
 	initialized = true;
 	mutex_unlock(&smi_infos_lock);
 
-- 
2.43.0

