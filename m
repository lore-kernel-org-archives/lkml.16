Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68E2248F5B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 03:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749438556; cv=none; b=X0oqZa2pgKpPzUQadTR3t1G6dnA3YX1vIlcYr1NbWG64JAptmFKKO/jt71FDTx5oFoUkZymN79BVDpv7xp0/7oYDh+fOsY8mJKxtvpwbidoyuLhcRBWg7WxLd9CLooekhvByRzroj3lrlG9b4DYaRiOEIGIt8ymfgyVa3QeAAJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749438556; c=relaxed/simple;
	bh=+aCBd2ghwW/klUL9zxXGFrDo3NyzpBmQuv2HbBfHcbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lr1n3K5+QDCaEwKeT6xJ+BrbW+Fy+Spsp3VgarUD3kizjbQPOIfXJhfxLTdpPQKTt6iFM4ImbRfYTzIDMwDBCMBAnC7DUtHzm1YrjCPQ0a20upIzM0+qDQb0u9QK/A6bJMXvLHS1R7jTtLbL/xUO4aHA4VuF6KoYGE4vXBWX+CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iIs9s9nS; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iIs9s9nS"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-231e8553248so38018425ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 20:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749438554; x=1750043354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7CXEUIqwkwbaC9WL4kfbAYO9r9qnWAQ32Tn1bWOs0k=;
        b=iIs9s9nS4Eya2LU6cU9CgPrVN7L97Ys7O2xg+SJJPoySvOIkSVVuWeTLsdXTt7sAqi
         DLXA3shE1t9BYZDCDYZY7lz+JfJ3yBLZmeyTpwH9LluEJTeaAZIaZKBmrTorUZ2eJCm3
         CteWo6POVViKTNuTZBoXxMTh4fWO+pK6kdKM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749438554; x=1750043354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7CXEUIqwkwbaC9WL4kfbAYO9r9qnWAQ32Tn1bWOs0k=;
        b=mqB9HWpJhoSVV3Lbc7SVVfaeLynlpydWaXFfNUcZuTV1XSjl9SNg9igYjKrFvKs6MG
         09uJwWxjbEQc87KCLsQyqh6u7sSTJPrfDFqbup/kik0gjzf7JN2kE8j1m3VqUhLdLseu
         ChmUpWcoMzyV0mwsXtn8RNe0A9V3xLuxeifWI0qFbpKvPQ7bNqbMOuNM5F6VcfPwrGlT
         CT4vHnjlcphQHbGyBcTHXwArhfcNB+KvSCqq8x9SkxY8IID6wIACBwcaCLYr0xjtlV3m
         ItshfoDT7T1LxhgtwOuvlHpXHjFbyYBCVPnuV4VvPAbzjPyMbUF71nS2G3NIkAX7QN1V
         55gw==
X-Forwarded-Encrypted: i=1; AJvYcCU77No2NI2QkhGH1KlztKMriH/iJmmJbRxKbLkfDjEJpnioj41kMb+qpdEBSYN6bJkrddnzTZeLCmVVD9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFoh5tAQ4sNwLqIX+gfYYnPikoQoZhg9kzF9IkL8LwgPeMVd34
	NbtVnSdPOVMbMLBlZ3BZ9Gn8HSzN3rxi2VFinhr/vdxxxoUUHtTyJ43p1u3Cdb09PA==
X-Gm-Gg: ASbGnctkIo+JlbbERJ5qAIPVKcge+lzdGfuomlTXdSf/BChW4YsyiepL7xpdhGcvWN0
	2QBA3hjGvdTyuUlwhkA13RoyV+Uq19C8NmLdlLlTwCo2emp83HfQ+IX7n2AUTEp3/dHBad5tBvJ
	NtBM7b/dGrtH79fdMf/tQEsgIaqwoEhIz89v9rXWAvfdzmdUSd9LQF0YRMqDqOSK+cAQh1+YSCK
	58RJRGBNbWWmuKpUk1ti0/PQevzMRs528bOvFqygb461bpPeLGC4AvEnrxhy4tyvb1B54ySF1Ns
	+Lbk2PRn9h4dp06OxbAfLlo8Z+4070upKVYLYtTIPMctgJP6HvIOBE1f80mYi56Sx55QDHhd8NG
	DtaUztncisc9X
X-Google-Smtp-Source: AGHT+IF9SqoM0enwHHeEeJDm6HNEPI1J9jfQ2jOvh5ECV8YfsU6gawfWVryQ79XsWdg7P2+sC2CUgA==
X-Received: by 2002:a17:902:d48d:b0:234:a139:120d with SMTP id d9443c01a7336-23601cf1e13mr147061665ad.7.1749438554311;
        Sun, 08 Jun 2025 20:09:14 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:eb64:2cdb:5573:f6f1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603410716sm44649645ad.199.2025.06.08.20.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 20:09:13 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Tomasz Figa <tfiga@chromium.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH 2/2] fuse: use freezable wait in fuse_get_req()
Date: Mon,  9 Jun 2025 12:07:39 +0900
Message-ID: <20250609030759.3576335-4-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250609030759.3576335-1-senozhatsky@chromium.org>
References: <20250609030759.3576335-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use freezable wait in fuse_get_req() so that it won't block
the system from entering suspend in some situations:

 Freezing user space processes failed after 20.009 seconds
 Call trace:
  __switch_to+0xcc/0x168
  schedule+0x57c/0x1138
  fuse_get_req+0xd0/0x2b0
  fuse_simple_request+0x120/0x620
  fuse_getxattr+0xe4/0x158
  fuse_xattr_get+0x2c/0x48
  __vfs_getxattr+0x160/0x1d8
  get_vfs_caps_from_disk+0x74/0x1a8
  __audit_inode+0x244/0x4d8
  user_path_at_empty+0x2e0/0x390
  __arm64_sys_faccessat+0xdc/0x260

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 fs/fuse/dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index e80cd8f2c049..3792ca26c42f 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -207,7 +207,7 @@ static struct fuse_req *fuse_get_req(struct mnt_idmap *idmap,
 
 	if (fuse_block_alloc(fc, for_background)) {
 		err = -EINTR;
-		if (wait_event_killable_exclusive(fc->blocked_waitq,
+		if (wait_event_freezable_killable_exclusive(fc->blocked_waitq,
 				!fuse_block_alloc(fc, for_background)))
 			goto out;
 	}
-- 
2.50.0.rc1.591.g9c95f17f64-goog

