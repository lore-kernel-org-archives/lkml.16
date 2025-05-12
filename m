Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EDB230BF0
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747065529; cv=none; b=I68GFB3B7BQXtTk84ofyJbn7wgYZvSTAgu3H2nLFOiqthuKGdIiA9EhSVmlhyng6BRToLX7OeMRr0UT3VTS9EWXSR1zpkYMCkJBDr6hHChfMrCMK8dvGmD0FBn0xFQDwCWUJX9VOLYroQACh/nNzqf92grB88UDQSiLYBv9lfFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747065529; c=relaxed/simple;
	bh=A3ahCfYOg9c4vhNKFthL+eNQD5btTaya2/ZEueElAqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=POTUVvMuXrUMQxzqNxXjzNd7AAaLgVlAbcxJx5YVz/CLIBpnSgGjmITPKhSO7T0TEDQrgo78hLD31CeX2TxPcEL9HQn4lp750tpVfd6Gz61iSPsbr/hBZFXEoIHIsSb54NC8unE8bbpNVcY2YvuGWa0GPDZimaHYcf+vy6/WjBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jfGq7OcO; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jfGq7OcO"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-30c7306890dso2650448a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 08:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747065527; x=1747670327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wZE8+DjyTLO7TLFbxnIsnDodFYjNxVTS/NkXdPfmGUI=;
        b=jfGq7OcOd5xnAqU7ejdiiirq642zZ9Z6iBwNrFpnqC7dwV9gmiXqq5qSi9nk9IhQrH
         GOoSXv+jGVEE/5Lex7G/Mzl1sNurSq7jDYzUhn9cGe142v2M+PVv3qZUyGG2V+hEjhsc
         R1VpCuLvEue3730G3U/1APmYvoncEF1nQsvtmFEQVSk1NT6WVPsFe5JT831Y+IKpY5hy
         D7eqYj8OezqTczrHkNLbRdl2TLTXR/7++kolzKvqwU3R4TcX9P8IKYXCjDN2v6GalBcX
         nX/2nr7D03kG1eQJkNG+Gz32uD8uAc6WjrraKIE+AJ+fvPcws7nxqqPFJWwjbgUB5EDO
         mLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747065527; x=1747670327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZE8+DjyTLO7TLFbxnIsnDodFYjNxVTS/NkXdPfmGUI=;
        b=UtdZKqpLdPK7B1fpfYKgPBH99tMruRtJKP++Pg49qXgZp0SzRtPt01/OJbGm12dkmG
         Mca8wNvlm/venXzK7LEPCDg3L8yenk40616Taux4ShxTreFPzUcxH9PB64QuAPmG2x4G
         IS0NKug5DFnUKh+Bs+vbmU/lpyhoWnGd23rvr2DVkjFnYVWS9r6YH5b2OJ7SC8ZIu1Dd
         e0sY6VjTopWfcMggWOFcsCVqsh4Muc8ba7wbcVAfvqz1Z0NlfIGsCkdAG5At3Udbv51P
         /QgCVyDMpYV+msJgugBj2HXEm+5rfrV4wfVLsaOtPx5lpmUEGSmFV4+G/Bb3GSYJYwL4
         BqVA==
X-Gm-Message-State: AOJu0YwU4evSAmaGGwIAqm37wiyV3EdinGGL13p/l3TnIjNHy0K4DFuB
	uRnU5FScKUowtVpeT6PBpuGDMnqgqLZRMq4hW+tPrYW3l4cSngi7tUEfjibl
X-Gm-Gg: ASbGncvkO5E15YKWQRZYayF8bEEQ25RjOfJD11SPp06a5RJ20xm3l/Pfr6IUBl3IuGd
	Q/Nfpex3g4KSzAzxrxMGob3QNEtJ2d4rwuMNgtOpE/HJwpHj4Zvq8Qr0rscrxQe1+pNt3nntWuM
	6pvS00bxBKh+8D20WjA8iCEhLOMtmFKbVDw2MlzncuXiWi95y8/TQ/RK2jnWQf6X3juTxHkFn0Q
	0IOvmroPEio+2jAVnUDAjdsAxfos8yx7Mu0MUgocCUovFZDA6MUa5mbq1J8guqNY8ictKoBMXca
	HwIijtu8h/OvCY/z3smVDfEqrRSgxaYnex3bzkmp0l8I5iJ69Vz578agbuxkTrZPrEucsqWKejD
	pqqAo
X-Google-Smtp-Source: AGHT+IFTWYg215dY/qwepEacEj9BV6KeNJZihiUrpaLWcct80Z0AimmPqMYF9PCRJ00kiNv7CiE6TA==
X-Received: by 2002:a17:90b:1d81:b0:30a:4f0d:a6e7 with SMTP id 98e67ed59e1d1-30c3d0eac82mr24220054a91.14.1747065527214;
        Mon, 12 May 2025 08:58:47 -0700 (PDT)
Received: from localhost.localdomain ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39e76062sm6785193a91.44.2025.05.12.08.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 08:58:46 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: syzbot+de24c3fe3c4091051710@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [ext4?] general protection fault in jbd2_journal_dirty_metadata
Date: Tue, 13 May 2025 00:58:43 +0900
Message-ID: <20250512155843.20034-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <680de902.050a0220.3b8549.0081.GAE@google.com>
References: <680de902.050a0220.3b8549.0081.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

---
 fs/jbd2/transaction.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/jbd2/transaction.c b/fs/jbd2/transaction.c
index cbc4785462f5..834fe30b79ff 100644
--- a/fs/jbd2/transaction.c
+++ b/fs/jbd2/transaction.c
@@ -1528,7 +1528,6 @@ int jbd2_journal_dirty_metadata(handle_t *handle, struct buffer_head *bh)
 		goto out;
 	}
 
-	journal = transaction->t_journal;
 	spin_lock(&jh->b_state_lock);
 
 	if (is_handle_aborted(handle)) {
@@ -1543,6 +1542,8 @@ int jbd2_journal_dirty_metadata(handle_t *handle, struct buffer_head *bh)
 		goto out_unlock_bh;
 	}
 
+	journal = transaction->t_journal;
+
 	if (jh->b_modified == 0) {
 		/*
 		 * This buffer's got modified and becoming part
--
