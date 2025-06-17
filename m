Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028182ED14B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 17:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750182080; cv=none; b=BrSz227lmdGa1E7Yw3aDGKv8h6aNseKuvn3KxPpaLKE6BWgzgC2Odlj/Wsf8GAdWQNcfp0esj0JGiIj905xLpCihcZbofuD6aCIgPDNdopwZ9tMlByxIoe7TpkWCTdwEW0rIPycVPxFeSSks+sUmAGKJBDO/BiRZ3ljOTT3WhrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750182080; c=relaxed/simple;
	bh=kJNOz7TooDBzp/PLOeTk4CdDG2jJXihBazSW4X49KPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uoP7mduq1zrVKtC7EQL+vVJQoKIFrnDlDi06yCvMVAOw66oajA+ixznFnLSune0dxDAqxN5vZAmP6ou2BzZRqUeX7+XQlPnedB2IGD4LeWS/kXju656J7XtHGuwZW4tpugKXr151YkgEWBOF4Ac46EDVNAQVoLno7GA+ompg5uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nbmr5A2s; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nbmr5A2s"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7426c44e014so5052270b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 10:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750182077; x=1750786877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mgrGkqOxDNObLjLq6D7C6MTexdeVGeUMjxtSLbN+W2o=;
        b=Nbmr5A2spdQp9TaxmKc2vIlTXiaSNeiNXosM8sPQFgIi6bwENIObLKGDDhezX8iLTd
         dtGtr2fxY+kvp7h8eVDZXVVGWWEWdCtowflIOUgUQksdmVVUumGNw2hmiQyvghMQ3rKJ
         TYH1KzFuBS650wlhIfhdU35Ko15PiIiUlBQawgTpSMU7H1sOujN72mzhT8EVnrqc/btK
         2GRLWyQxEQOzAysxUfgnZL3OhRe0bxvW2R1W+XRv0PJXSBNM+fY7Cfs82FjBF2etYI3t
         Q8aCezftCVr4pNNXhYnp2QqVYobMBSn4ITE6C93kxZ1rABNyM/3fasrjsrRTWtfCcSiz
         sc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750182077; x=1750786877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mgrGkqOxDNObLjLq6D7C6MTexdeVGeUMjxtSLbN+W2o=;
        b=uncEPo3/ZLutetj8qbwjFqXKTR9NhD4z7wGfsLa2dA5T29rsfHY8emiQTJW6Ng1fSK
         8Eb7SQaYAbc8TP0ixfPnUcfV8GyYuTMxSyUU1Qhsp4T/8aXBlgiowvhQjuw0Y9jUPhWR
         gM/yEedpQT5wMOuM8VvUtnzPYodmzhbxV57WBmWSWlxrluEtflhTno37oRTUKy3yb/49
         kr6j36+YKLELP4dDTIw8sBlk6gJR4xhjRBPJ8Jj8Abp/1s75k+pgVDM0nclAkP/th//I
         Q8lx14m/aABRsvR4KM9C6iTY2WViDLNLf/Cs+Dg7R3oGBc6wYm45r1zu35y7I1kUyz6w
         3VCA==
X-Forwarded-Encrypted: i=1; AJvYcCVqGRHLGT1DwqIhsd2IfV2GdUEX6KGMg2IqHGTZiqbrpmIGThRFOJ6UdXsr1h/RcfHROQaoL4YmzeHkFZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhicnG3XkWzitbRtoGSBI7V5UuurRe1OEymwtC3H1O5zz+Q2p7
	T8+NdQ0ZDoJwnCGNmJ5j4qAk3hZGHk8lvx0t+P7Q6P35Q4ygb0CO3wCT
X-Gm-Gg: ASbGncvOlwCnBF8Mqnqr/Fc5phspE494zChC9H481oA4ynZACllo+zxZXQA9wzafE3k
	jnZ0U2Ca+MJxH4/fyzpRdo4Vn/eg7gD/7x0XsqlJwp5TrzQbX6uxJAX/48hWkqV4LI6fzusQpGS
	4XHXhUTyNGxMVGMCqvEeZdQ+2fqhwQDQxAvMSbuTkCBK4FENxx5/s1VBIFYkf8T7AdJCdCEut72
	G32k+wjA2IHVu7oDfXnLS7BJV8swQoYIUu7e7ppfZg0AsryVIAF9yZNzLb05dp/lR3/B2hoDGqd
	knTFe8v8h5gH1PWuSzU1E16q0Uxh+/b1DxLMvByMdl+EXEN6jato8BJag5y/bHCValShjFQrLRh
	06crxKg==
X-Google-Smtp-Source: AGHT+IG8uYkJ0nlmr7+LvuiKbnGE6RpbM0HNHS45nKFtm9jDCdWQmNQSRmkk3m6DxI7dLLyvTk/vmw==
X-Received: by 2002:a05:6a00:230d:b0:742:a7e3:7c84 with SMTP id d2e1a72fcca58-7489cf97bf8mr18115909b3a.13.1750182077189;
        Tue, 17 Jun 2025 10:41:17 -0700 (PDT)
Received: from deb-101020-bm01.dtc.local ([149.97.161.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d29a2sm9417592b3a.175.2025.06.17.10.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 10:41:16 -0700 (PDT)
From: Swarna Prabhu <sw.prabhu6@gmail.com>
X-Google-Original-From: Swarna Prabhu <s.prabhu@samsung.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Cc: mcgrof@kernel.org,
	Swarna Prabhu <s.prabhu@samsung.com>
Subject: [PATCH] f2fs: Fix the typos in comments
Date: Tue, 17 Jun 2025 17:40:47 +0000
Message-ID: <20250617174047.1511951-1-s.prabhu@samsung.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes minor typos in comments in f2fs.

Signed-off-by: Swarna Prabhu <s.prabhu@samsung.com>
---
 fs/f2fs/f2fs.h  | 6 +++---
 fs/f2fs/node.h  | 2 +-
 fs/f2fs/super.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9333a22b9a01..fdf69330582b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -386,7 +386,7 @@ struct discard_cmd {
 	struct rb_node rb_node;		/* rb node located in rb-tree */
 	struct discard_info di;		/* discard info */
 	struct list_head list;		/* command list */
-	struct completion wait;		/* compleation */
+	struct completion wait;		/* completion */
 	struct block_device *bdev;	/* bdev */
 	unsigned short ref;		/* reference count */
 	unsigned char state;		/* state */
@@ -1427,7 +1427,7 @@ enum {
 
 enum {
 	MEMORY_MODE_NORMAL,	/* memory mode for normal devices */
-	MEMORY_MODE_LOW,	/* memory mode for low memry devices */
+	MEMORY_MODE_LOW,	/* memory mode for low memory devices */
 };
 
 enum errors_option {
@@ -1491,7 +1491,7 @@ enum compress_flag {
 #define COMPRESS_DATA_RESERVED_SIZE		4
 struct compress_data {
 	__le32 clen;			/* compressed data size */
-	__le32 chksum;			/* compressed data chksum */
+	__le32 chksum;			/* compressed data checksum */
 	__le32 reserved[COMPRESS_DATA_RESERVED_SIZE];	/* reserved */
 	u8 cdata[];			/* compressed data */
 };
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 1446c433b3ec..b5218d642545 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -31,7 +31,7 @@
 /* control total # of nats */
 #define DEF_NAT_CACHE_THRESHOLD			100000
 
-/* control total # of node writes used for roll-fowrad recovery */
+/* control total # of node writes used for roll-forward recovery */
 #define DEF_RF_NODE_BLOCKS			0
 
 /* vector size for gang look-up from nat cache that consists of radix tree */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index bbf1dad6843f..b4f2b5a85d58 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2569,7 +2569,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 			!test_opt(sbi, MERGE_CHECKPOINT)) {
 		f2fs_stop_ckpt_thread(sbi);
 	} else {
-		/* Flush if the prevous checkpoint, if exists. */
+		/* Flush if the previous checkpoint, if exists. */
 		f2fs_flush_ckpt_thread(sbi);
 
 		err = f2fs_start_ckpt_thread(sbi);
-- 
2.47.2

