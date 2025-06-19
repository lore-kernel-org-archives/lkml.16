Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788B824501D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 19:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750361282; cv=none; b=PfUC7vazWDj3nzp8looC6JfKhWzufO4e0Mv3cwexbVsOwpKdtKQrjH6FymsNiwvaTsb3qj/4v+ql55Lx13nwXK1Hsjzq8W1LCOwktY1aoMYraMBrguLNIXM73jAmYZR8v6GjXxLmkWszk0cI+/0UqTUUAa9KA3yP7nS/1ur4JnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750361282; c=relaxed/simple;
	bh=WAdMGPaNB/QCo15dUEuI4GjK/9ObZxnK/dP6No/A+ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZZ0DRydR90Cc7bmcUiyWbSWGY/41/TVEf8LlDci0m8pg3wEKmX6kvGeQwUg9HpxegLoBaxZ/oehZQbi5CAqxxn/XdWEqOE/JPmC9nQq6EbDVuZqo0bvEhmgYwit5R+3pHRY9332LoyCiXSKbG7GY7gL+cZo+alz+IkovWkhD6Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=MNDjIQjF; arc=none smtp.client-ip=209.85.214.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="MNDjIQjF"
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-234ae2bf851so1725755ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1750361278; x=1750966078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9mph6iqzfvkH6Em/eA5BqcG3h1FrFQ3qkFwr+Q5lfM=;
        b=MNDjIQjFblz/KRs7ykCkW19Y19OCwpXEZdxUPr8cG471PRjW/lIyD2YWT7cAX/9J4z
         pIBAy6mlCzPhvUe0WW19hN3HHG+el9F2oH2+ZGKCMJbTo4MgFKxroOzcylpsyfPMzqMt
         HzvC63U3PwJyZV64kHcM6cSoMwCXUH3vyT5PHygfgFXHIZ0u/qkWlU3+ru1OTNgV/4ie
         Huf1V7seOqa0njvTlTclzTS6ZYLt1j3QWCWuw2zWqjK5ZP9nD899AflltIkoFvI5yHPc
         joAt4827ApL7RH/4AnUr9O3C3dcNeXMuSqYLNuIB4mk3vZ6rpVNy3KghiAnuOE5I1t9d
         DU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750361278; x=1750966078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9mph6iqzfvkH6Em/eA5BqcG3h1FrFQ3qkFwr+Q5lfM=;
        b=o85HLvwfSJpcP1a/9q9TVuU6/huwRQxhWifGNaIUUPbU/6fqDFY8Auwx1w5JO6EjmU
         qUQ7Jy2o2orAGHFzh8fpJHuceEoi0aqQhBvFBFxr9pEJdVUyS+aVO4qwJVcGMLQ8OyH4
         F8dv4a6p4yNLPaDx1WnYw1aFkgYFOQYTncjoxRlCiTgMKRQqueNKdhXxyXfvXCg2BOuo
         eaeiW+GRg/X35Y6vpiB8Ee7BFheSIr6CEagV2ypVaMh9A6pmQVJh/56iYcQZtK2ZjPtT
         VLziy6xCypS+ytHxtNftudZv3zceR8qs9k/tBYqpVYtUPo+xBK9frKBiPPElnGJrfUtA
         OCwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0QkTBXXqT1ogOFpL50r5e6H2CWDMm29FZHyHArZ2nl+6GP9Y123/9lsvAQvMUxv0txkxrlJceOSBzZLw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHTBIKqTRP6J66Nnkbe2CDqb+0P8+XpnxvvZGK0DWvYwla2wDW
	li+2SWRHj0st8w6U5Hwx1XifK2EiHZS5EEO1cgjKaiILP53zr7AqKqe9SZqHJMq1bOsOUBJKn/E
	icdyVVmP2X2vW+oCaLuna04hzcz+7XjshGOVm
X-Gm-Gg: ASbGncueIgBjB3PlovGGIoe+7io/bwujJGNGIb87Mar9YvbPQen+w5QBv829wsmCb8z
	zOIKoMQnf82WCPgyHZjtK0jsz1PpLUOLL/8QFXe+jBWtcOd7jppxlOVNLvgG1PKad6xMEzvSsQX
	cRnkGf9u0CWalBYXOYKKgPnAGfJEHHUhrjViAUpVNpQAyXscPrSYKk5vO38YFW+AoFyuxpw6DYL
	Ux1emLkOheeVBN65BBUkcUGJ8SjFzYOYa9gRdHcJZInaDtwF5XTu6VPFLuUuCmZ9/hrmJgqm7WF
	qZ0TKX6lYS9rTfQh0XT7u122qRZJzbvAC+JahXuFJmSbg/NeVz3NK5U=
X-Google-Smtp-Source: AGHT+IGYwH/UnRloaxJSDbMCTU+OrSVFFK8LWCGEl/44Ty0QzPW7F7yR2nACYfTcFtaX1Uuy3m3j3z1yjWFt
X-Received: by 2002:a17:902:ea10:b0:234:ed31:fc97 with SMTP id d9443c01a7336-237d9abddcfmr46325ad.12.1750361278556;
        Thu, 19 Jun 2025 12:27:58 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-237d84f2724sm105245ad.66.2025.06.19.12.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 12:27:58 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id E768F34179F;
	Thu, 19 Jun 2025 13:27:57 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id E5315E4410B; Thu, 19 Jun 2025 13:27:57 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Chris Mason <clm@fb.com>,
	Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Mark Harmstone <maharmstone@fb.com>,
	linux-btrfs@vger.kernel.org,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 4/4] io_uring/cmd: remove struct io_uring_cmd_data
Date: Thu, 19 Jun 2025 13:27:48 -0600
Message-ID: <20250619192748.3602122-5-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250619192748.3602122-1-csander@purestorage.com>
References: <20250619192748.3602122-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no more users of struct io_uring_cmd_data and its op_data
field. Remove it to shave 8 bytes from struct io_async_cmd and eliminate
a store and load for every uring_cmd.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 include/linux/io_uring/cmd.h |  9 ---------
 io_uring/uring_cmd.c         | 12 +-----------
 io_uring/uring_cmd.h         |  1 -
 3 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/include/linux/io_uring/cmd.h b/include/linux/io_uring/cmd.h
index 29892f54e0ac..cfa6d0c0c322 100644
--- a/include/linux/io_uring/cmd.h
+++ b/include/linux/io_uring/cmd.h
@@ -19,14 +19,10 @@ struct io_uring_cmd {
 	u32		cmd_op;
 	u32		flags;
 	u8		pdu[32]; /* available inline for free use */
 };
 
-struct io_uring_cmd_data {
-	void			*op_data;
-};
-
 static inline const void *io_uring_sqe_cmd(const struct io_uring_sqe *sqe)
 {
 	return sqe->cmd;
 }
 
@@ -135,15 +131,10 @@ static inline void io_uring_cmd_complete_in_task(struct io_uring_cmd *ioucmd,
 static inline struct task_struct *io_uring_cmd_get_task(struct io_uring_cmd *cmd)
 {
 	return cmd_to_io_kiocb(cmd)->tctx->task;
 }
 
-static inline struct io_uring_cmd_data *io_uring_cmd_get_async_data(struct io_uring_cmd *cmd)
-{
-	return cmd_to_io_kiocb(cmd)->async_data;
-}
-
 /*
  * Return uring_cmd's context reference as its context handle for driver to
  * track per-context resource, such as registered kernel IO buffer
  */
 static inline void *io_uring_cmd_ctx_handle(struct io_uring_cmd *cmd)
diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
index 7cddc4c1c554..376404ffb3f9 100644
--- a/io_uring/uring_cmd.c
+++ b/io_uring/uring_cmd.c
@@ -23,25 +23,19 @@ void io_cmd_cache_free(const void *entry)
 
 static void io_req_uring_cleanup(struct io_kiocb *req, unsigned int issue_flags)
 {
 	struct io_uring_cmd *ioucmd = io_kiocb_to_cmd(req, struct io_uring_cmd);
 	struct io_async_cmd *ac = req->async_data;
-	struct io_uring_cmd_data *cache = &ac->data;
-
-	if (cache->op_data) {
-		kfree(cache->op_data);
-		cache->op_data = NULL;
-	}
 
 	if (issue_flags & IO_URING_F_UNLOCKED)
 		return;
 
 	io_alloc_cache_vec_kasan(&ac->vec);
 	if (ac->vec.nr > IO_VEC_CACHE_SOFT_CAP)
 		io_vec_free(&ac->vec);
 
-	if (io_alloc_cache_put(&req->ctx->cmd_cache, cache)) {
+	if (io_alloc_cache_put(&req->ctx->cmd_cache, ac)) {
 		ioucmd->sqe = NULL;
 		req->async_data = NULL;
 		req->flags &= ~(REQ_F_ASYNC_DATA|REQ_F_NEED_CLEANUP);
 	}
 }
@@ -185,17 +179,13 @@ static int io_uring_cmd_prep_setup(struct io_kiocb *req,
 				   const struct io_uring_sqe *sqe)
 {
 	struct io_uring_cmd *ioucmd = io_kiocb_to_cmd(req, struct io_uring_cmd);
 	struct io_async_cmd *ac;
 
-	/* see io_uring_cmd_get_async_data() */
-	BUILD_BUG_ON(offsetof(struct io_async_cmd, data) != 0);
-
 	ac = io_uring_alloc_async_data(&req->ctx->cmd_cache, req);
 	if (!ac)
 		return -ENOMEM;
-	ac->data.op_data = NULL;
 
 	/*
 	 * Unconditionally cache the SQE for now - this is only needed for
 	 * requests that go async, but prep handlers must ensure that any
 	 * sqe data is stable beyond prep. Since uring_cmd is special in
diff --git a/io_uring/uring_cmd.h b/io_uring/uring_cmd.h
index e6a5142c890e..351c58c26679 100644
--- a/io_uring/uring_cmd.h
+++ b/io_uring/uring_cmd.h
@@ -2,11 +2,10 @@
 
 #include <linux/io_uring/cmd.h>
 #include <linux/io_uring_types.h>
 
 struct io_async_cmd {
-	struct io_uring_cmd_data	data;
 	struct iou_vec			vec;
 	struct io_uring_sqe		sqes[2];
 };
 
 int io_uring_cmd(struct io_kiocb *req, unsigned int issue_flags);
-- 
2.45.2

