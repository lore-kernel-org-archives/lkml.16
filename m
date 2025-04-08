Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14B625333F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744152996; cv=none; b=WnftJPm8bl925/ra5wfJX07Zk6whnuN4WTAk1d/n3RniIHV4LL88PifFJXQkIMWZo7dF37D4MMwuVIp4BGVd6g4Fii8CkXCjMk/tTAVSfUT/kNyS+2rJn1o30MbXEvBCNArssgTpAwd5esIs/bAVG7g2yMN0k7PYLtLfzUgVVds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744152996; c=relaxed/simple;
	bh=64A1fL3icCqLfyIFzefIzkWUMnxUtIKnTUU/t0fgAxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=clAhoE/Lulhl242aMx304FLaYEfjGDfqS580XDSlgZLihZ6ewgE+VYNkAybwxoMbcYZWhAm3tqIZ3uQBHoTqpWeUMDCUb0/fOBuBJgRGAhRyD8A+JNWREjc81A8t+TQT7QTqQpKoj0ff1bSH6K7rzm1TLiq/zefgCSXNg51sgdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=AtgxXv25; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="AtgxXv25"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-af28bc68846so5396056a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744152994; x=1744757794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fm5AXhXZ7EO6Xz/bF1BEFBHOOg08llbrt+bodgHagxI=;
        b=AtgxXv25Egh0xUiz6YvaiBcvjElMMLLtnnw4uY1SpvizyZN5HLorYjDS+cT2QZnXJm
         dewxnDHVC6gjiqpGnYuCC0y3ylk9Es6uOvuSaViB9iv4tO+9vlR2+M9Re+ZE4X+fHqvh
         s9V0GeAGZyPqQ2iQvlzYIHex2hgBXTGVnql0OrPldUXRXiQFNGAi1MZd1blahVw4SdbK
         9M0MRkzD2sr4lf3OgCe9UY+zwuB5aiIiaowgIsLluZ+wr1T07tHiwb5bW93WwwyWPbFA
         RKwfUIAwI669jBnfpsZPhEx0qrkd05zauYlNW39imF581WNHbBb4eMKww9VXVge3PTo9
         go9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744152994; x=1744757794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fm5AXhXZ7EO6Xz/bF1BEFBHOOg08llbrt+bodgHagxI=;
        b=oRZizdlsS1MT5DjCiT3JzL2JfzKr4NxhgcT57GxVSGRKzBxmXpcYYl5MHQvdGiMtIN
         GKnLInQspA+7oX1eJHAP+Xgsn7BJRu2jfvmn7OdkOpCF5WTe2GCXMT0enfVmOPxtT3ue
         ZAbDS1nkQtyiCovuyQCJRVGBEDsDrXWHuaEYKlcxLPgDe0lgft8v28X7MIX6zp/J7JJp
         YWH5rKFKwki7eOo8yGpxwVSqMKpj25gGQY/7atE21USHlrxvqeIue+sNdQE+ybnNfnHF
         GPYjktkQOBNp8lUEHyrN6DD397eY4sbPpKdAYVLxlVXkCHug7vT0uj0LRokrPzpaTejL
         Clgw==
X-Forwarded-Encrypted: i=1; AJvYcCWzHd3jqJOVzHUrBuoo7RrbIGQtoncw4GTkGo9jbHAdXGDP9PIoOtU8E+TsNLCknq7semXXr5SN+4TBNik=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRsZ0qB39lIejhDAw68zz4SsjOLDlQko7PicdaqNthjQwZ0HDs
	Mpm3qm2w9utEIYSF86oSVXF6YrOYMtAeMjc0skIHTn+t9ZeOTXGIT6lj7AH38g==
X-Gm-Gg: ASbGnctou1diLSflrAiJEgKlhX1/Pd6lzPZrRxPfsBpkPc6La+pGG9Cp/1eqmoD7+AT
	Nuqv8p1vvxxgXm59NID9bID7r2BAAhclI4LWddozTP5ECdTK1s/GUdyEb7NfdrvEkUB9XBLYRa+
	Id6aa4L41XLEspowQFJXNHlczfEZp71sma7dS0ehOYZ9bE56sY0xax57sSh4bB///J1OxRq2LL7
	y3KcAyo9KJDux8nB30yEQs5MDLjFs8GRHKgr5cInHu2Qgi1bQlZUVYkRzWCn9qbL88NQiShQwYz
	5bzxY562+gg0kExv3VFeMtGIRq7r2qq+m+vpgeiCgq5qrQTL07DmGeTIpZ1FRphzJEXLtqgajH0
	AwvQMU7m0nA==
X-Google-Smtp-Source: AGHT+IHMrbGlBdlcelE02MMVEgm0kvLnYsiD8ZRzKlv7S7zsxd3sFgnnnfkO0DUDWMP68U3E3qjqzg==
X-Received: by 2002:a05:6a21:a34b:b0:1f6:2d39:8713 with SMTP id adf61e73a8af0-201591c9103mr1018919637.19.1744152994244;
        Tue, 08 Apr 2025 15:56:34 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b4869sm11504349b3a.138.2025.04.08.15.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:56:33 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 1/1] staging: gpib: agilent_82357a uses completion
Date: Tue,  8 Apr 2025 22:56:28 +0000
Message-ID: <20250408225628.187316-2-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408225628.187316-1-matchstick@neverthere.org>
References: <20250408225628.187316-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

agilent_82357a_send_bulk_msg is a oneshot event where a semphore is meant for
synchronizing over counting events.

Recommendation is to use a completion instead.

Reported by checkpatch.

WARNING: consider using a completion

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 12 ++++++------
 drivers/staging/gpib/agilent_82357a/agilent_82357a.h |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index baa8f149024c..97e7caefe35b 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -34,7 +34,7 @@ static void agilent_82357a_bulk_complete(struct urb *urb)
 {
 	struct agilent_82357a_urb_ctx *context = urb->context;
 
-	up(&context->complete);
+	complete(&context->complete);
 }
 
 static void agilent_82357a_timeout_handler(struct timer_list *t)
@@ -43,7 +43,7 @@ static void agilent_82357a_timeout_handler(struct timer_list *t)
 	struct agilent_82357a_urb_ctx *context = &a_priv->context;
 
 	context->timed_out = 1;
-	up(&context->complete);
+	complete(&context->complete);
 }
 
 static int agilent_82357a_send_bulk_msg(struct agilent_82357a_priv *a_priv, void *data,
@@ -74,7 +74,7 @@ static int agilent_82357a_send_bulk_msg(struct agilent_82357a_priv *a_priv, void
 	}
 	usb_dev = interface_to_usbdev(a_priv->bus_interface);
 	out_pipe = usb_sndbulkpipe(usb_dev, a_priv->bulk_out_endpoint);
-	sema_init(&context->complete, 0);
+	init_completion(&context->complete);
 	context->timed_out = 0;
 	usb_fill_bulk_urb(a_priv->bulk_urb, usb_dev, out_pipe, data, data_length,
 			  &agilent_82357a_bulk_complete, context);
@@ -89,7 +89,7 @@ static int agilent_82357a_send_bulk_msg(struct agilent_82357a_priv *a_priv, void
 		goto cleanup;
 	}
 	mutex_unlock(&a_priv->bulk_alloc_lock);
-	if (down_interruptible(&context->complete)) {
+	if (wait_for_completion_interruptible(&context->complete)) {
 		retval = -ERESTARTSYS;
 		goto cleanup;
 	}
@@ -142,7 +142,7 @@ static int agilent_82357a_receive_bulk_msg(struct agilent_82357a_priv *a_priv, v
 	}
 	usb_dev = interface_to_usbdev(a_priv->bus_interface);
 	in_pipe = usb_rcvbulkpipe(usb_dev, AGILENT_82357_BULK_IN_ENDPOINT);
-	sema_init(&context->complete, 0);
+	init_completion(&context->complete);
 	context->timed_out = 0;
 	usb_fill_bulk_urb(a_priv->bulk_urb, usb_dev, in_pipe, data, data_length,
 			  &agilent_82357a_bulk_complete, context);
@@ -157,7 +157,7 @@ static int agilent_82357a_receive_bulk_msg(struct agilent_82357a_priv *a_priv, v
 		goto cleanup;
 	}
 	mutex_unlock(&a_priv->bulk_alloc_lock);
-	if (down_interruptible(&context->complete)) {
+	if (wait_for_completion_interruptible(&context->complete)) {
 		retval = -ERESTARTSYS;
 		goto cleanup;
 	}
diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.h b/drivers/staging/gpib/agilent_82357a/agilent_82357a.h
index cdbc3ec5d8bd..23aa4799eb86 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.h
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.h
@@ -6,7 +6,7 @@
 
 #include <linux/kernel.h>
 #include <linux/mutex.h>
-#include <linux/semaphore.h>
+#include <linux/completion.h>
 #include <linux/usb.h>
 #include <linux/timer.h>
 #include <linux/compiler_attributes.h>
@@ -115,7 +115,7 @@ enum xfer_abort_type {
 #define INTERRUPT_BUF_LEN 8
 
 struct agilent_82357a_urb_ctx {
-	struct semaphore complete;
+	struct completion complete;
 	unsigned timed_out : 1;
 };
 
-- 
2.43.0

