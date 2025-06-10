Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71D921883F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 04:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749531226; cv=none; b=Rgb79W5gSrbVwtJfR1Bllov6aN3KXEXpxBpqZ0rJxYNFJjtk8gbvHtxY4hkErT4uMscsZ2j9XjvHqB9Ghky0fDQPwzxUV1dGm2B8vXNaoESxl6cgiTcQP/C7JAMRFNKm8Oa7ZE6AhR6sgNWNKmj6i8z++qLv0ppeQZcKVNxx9p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749531226; c=relaxed/simple;
	bh=BAIK4gLfSCOCgE6FOu9d61iFaIsT75YShx3NjXBV3TM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GaxQcjZZ0OSE/u5X4/O64dngk0hryBc5m6F5drcw1IhXFUO+50IACIpPOyvtjNbOXjT64tB0MBIxUqCnvH4rb3lDgKDlVcPN6UkhGCoyp0LeDThB9EbYpRKPVcVGOpL3m3Cpzz4rX5sMg+vrC2oLBrpk+lHqsr+fqmKTK7P8LK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JueVux5l; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JueVux5l"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2363497cc4dso6972515ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 21:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749531224; x=1750136024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCrHt0jmkPdPRc1pbvWWh9+e8CniQlzw0sMkjj1a23k=;
        b=JueVux5lWHsfERhYfE6OH4IwyIeQ1WOvgszMpryvfInNyN4rM+FBGef0IArq23XrKP
         9ek6bnCd3cYLoPyMvwQp69dQ7j4mNv1KDwTBNmtlFlCXgUvdQkx/0qPrNlF5d33KkOrv
         G/6dioFOFfDNU9HA9BETJsijMkmTO8VUALmW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749531224; x=1750136024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCrHt0jmkPdPRc1pbvWWh9+e8CniQlzw0sMkjj1a23k=;
        b=t9h/AMCir9ipDbwHQ/8bfULtl09Dj261+P+o0SpIwzmqLJQ1qDbTLuN3zo9Tk+lZm+
         zGb3rOZH1xiV1haSTUmxIhh7jX00r/UIWYm1A54fKdtlv2mCuZYcYpk5MFxBIwSkyXl+
         R5lCsPRMmCxklLsoYJIMRw5dk2+4Ay7YrGhSLsTq9yPNAMKUfpMt4yLZ1Bp0MHyxqE/S
         Bq+T3W+aTSEl+aafluekQ/er1Ao1dfYF4LLYUC/uo4qEjNv/1Mi5AMxvbeIq0cRv5aVt
         iU+6evGih2Zw9azoaet0NI94Tcx+rQD1VFC4AySnWIpDKdy4YisL5/jHkMWMWWdqA53P
         VFhA==
X-Forwarded-Encrypted: i=1; AJvYcCUPAPsEerKYpS/lBOAh6YTVxbgKEwoex2DQ7m64o3o6PBoBsV/5oD4/4PiDB4jIn3djkTHoA1CU/I03dJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPBvCmIPAzHIlUNx7SDDVpnqYSn2b2F8kcITiiB55Z597fqhVw
	RbH/5tQowHhNX0NoToniG3w1WvAAsUt2oRwje7XosHrUUtBJY3CHtgE+0htWQPX2fQ==
X-Gm-Gg: ASbGncsCb3tIZ4b6gI6Z2A8cr1iqePK+Xl7UYkA6ZMWyU/TAMfjuMYc5yooQEP2JepZ
	N3TatbbxvQ2tkqnWy13oqdCvgxWkCjB+SUxCyN+1RyANn7gXOdeJNT+yH/IXM361z3nts695g+t
	H/Aa2+Q4EelGWuilipFLu9hhtDqZNbNy0G9Xv7EwLCCX7XDh3BBpLvZxB+MIbznZx9YR4TdG3sQ
	jupIV9CuNgLN9x3As5yC3uc5sNk9jjyb2wcfyshRq/c3ZynGldMOwSZ4BpcaYU3101O59UFet3b
	jP09O7jS6oyDfQdqCZRNBdUsxbFCSm6RCB2pdck+fDWgzE/j+e/+LH6MH+CzJ15cqREwrrbWp4p
	R9Qw1U0+ty6fC
X-Google-Smtp-Source: AGHT+IFuIpfgmRzYGxIkmcslCdrgVmuNEuyiU+CgCGp4XHTI0jidjTL/fhHH4/qIj2axhRU65+QaZA==
X-Received: by 2002:a17:903:3ac8:b0:234:a033:b711 with SMTP id d9443c01a7336-23601dc017emr192516525ad.50.1749531223792;
        Mon, 09 Jun 2025 21:53:43 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:ca42:1883:8c66:702e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23611fde09fsm47634705ad.187.2025.06.09.21.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 21:53:43 -0700 (PDT)
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
Subject: [PATCHv2 2/2] fuse: use freezable wait in fuse_get_req()
Date: Tue, 10 Jun 2025 13:52:29 +0900
Message-ID: <20250610045321.4030262-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250610045321.4030262-1-senozhatsky@chromium.org>
References: <20250610045321.4030262-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use freezable wait in fuse_get_req() so that it won't block
the system from entering suspend:

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

v2: use wait_event_state_exclusive()

 fs/fuse/dev.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index e80cd8f2c049..a0fd319ab216 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -207,8 +207,9 @@ static struct fuse_req *fuse_get_req(struct mnt_idmap *idmap,
 
 	if (fuse_block_alloc(fc, for_background)) {
 		err = -EINTR;
-		if (wait_event_killable_exclusive(fc->blocked_waitq,
-				!fuse_block_alloc(fc, for_background)))
+		if (wait_event_state_exclusive(fc->blocked_waitq,
+				!fuse_block_alloc(fc, for_background),
+				(TASK_KILLABLE | TASK_FREEZABLE)))
 			goto out;
 	}
 	/* Matches smp_wmb() in fuse_set_initialized() */
-- 
2.50.0.rc1.591.g9c95f17f64-goog

