Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0621FBCB0
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 10:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749723511; cv=none; b=itBCdK+ENdMFSOZH/9LLKIPfhmDcM/mcxSASGs6mYJvcbWa7FvtGSsw2FFZIo5wHfxf+02Z/PjxX5JNOZvlLRhn04p9NTYYxCDsBGjXT+2/nn8fMjoJDV2tmK7Ix9CpVTWc057NHPCJ1Qyq88e3CO1xZkz1gPWXNC/W7XAErcH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749723511; c=relaxed/simple;
	bh=sd0poDvnGY6HHEWeCGXSXd5sL+dUXrSF/1Dfjnl0Qi0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=eTRmm2v5ACOdg8r7aUdzA1nLhgOTpv/C+rnJuwBwF/PtdefwtMY6aFRXvx7arzYWgA5DYzQlfrcoCeKwCoIHyqzeYn0O1pGWwChi4D7sMzrGMiFEt0grp8ffnzRiEnBqS6Yq1v28KKm21GhC/gu+pRuIPrgqmDI4ZZB6GLNXee4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ishitatsuyuki.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pC6APzYg; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ishitatsuyuki.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pC6APzYg"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-310e7c24158so852178a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 03:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749723509; x=1750328309; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=20a6VXdSyZR3J7DOvNrBbIXfn2ygPO/nSrCWCnB/1y0=;
        b=pC6APzYgWgX88kdWKRG7RLcOEBhdOWz3dPdidMOo6YDYBBJpWhjL/e97Sc3JcGO05G
         8dzcStFymVw9GLCibprapHEpMgP3i2MNeSCf43ogxhXNTM6QJfsb1Rxkm4fIvF01GVPR
         m2iDjfrFQBJmAqJCNsLHJn2tnMtvxtbg9ZcAnjScMUUK6K7J+QIcm10QTTDu5u8AfxRe
         Uqfn5EPI5pkVGdvp78cm65o05vZ5mCgeTTWHJwGs4KUQcxsZY7EqSVPiISQGZhZ79Nze
         CP8ZyPjaLRUM65AmIXGXC/UuMdwutFUtvJBlp97C5tpF/6TZG2n2+aUbj82sH76vnJgt
         GBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749723509; x=1750328309;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=20a6VXdSyZR3J7DOvNrBbIXfn2ygPO/nSrCWCnB/1y0=;
        b=nmt7nVj1nKUiAWu07RVN/+FNdLVg820mnmwQnngnWxtKXMQYjnB67AiHDhqxb6odTC
         vlQ43PXy13DSlP8ZEitqj2LautpeT2j0dOUnIxSpGdIWh5k34zS+XKzl+F8jobSv4trA
         4sGOredwVh1WY70bZdXPE34yJuIoKrLzXuQxcx6Cp28Oct3idXTiENgLIiYgc+cF/3t7
         zmXgF8mPFK1WImkmg6C9J+8/YPARKazuwQZTRqp+JUDFcLiSBxRs+UtViQgoW8y2+gYY
         h10n4utmdWvpJuabDUtWWf9yYl+9Q23emfFluSTnYfc26s2UcuYkzfy22zQmOC09wc7A
         dlug==
X-Forwarded-Encrypted: i=1; AJvYcCWygO8ilw+IUWF5G7xU+EPGTnsIrC2Zgut7WU4FofxWxei8l7t/P+hdZpFFKlmRIr+q4Vp2uuojnZoXXkE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVD+arc0u5/Nz3IQY9XmUDxY00qFiYL08Rvh2af3ZCUj8guR5I
	kx4niwzuFm/pMf3d8soK8gKUg7OOLTrb59wh9bnLslQT3m/QSHq/qYXi12JjOy7/4w6lidlhaoz
	gyE05lSedReA5XeZVJcMYpRQFNTU4VfYSUw==
X-Google-Smtp-Source: AGHT+IG9MR2SuFSzKZgWA0YQQQQgsFeVnjAS9ApDfDEl5sU6JXYo/aqTjv0GcbwrVoAVUpr1Cw8h6otWmq1nzp26ZPVf
X-Received: from pjbst13.prod.google.com ([2002:a17:90b:1fcd:b0:312:1c59:43a6])
 (user=ishitatsuyuki job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1c09:b0:312:e8ed:758 with SMTP id 98e67ed59e1d1-313bfb677c7mr4388239a91.13.1749723509379;
 Thu, 12 Jun 2025 03:18:29 -0700 (PDT)
Date: Thu, 12 Jun 2025 19:18:25 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHCpSmgC/x3MMQqAMAxA0atIZgMatKBXEYdao2awlUREEO9uc
 XzD/w8Yq7BBXzygfIlJihl1WUDYfFwZZc4GqqitXE04NciaFkPZD1ZL0Z+MswvUkQutCx5yeig vcv/bYXzfD5Bjg8tmAAAA
X-Change-Id: 20250612-b4-erofs-impersonate-d6c2926c56ca
X-Mailer: b4 0.14.2
Message-ID: <20250612-b4-erofs-impersonate-v1-1-8ea7d6f65171@google.com>
Subject: [PATCH] erofs: impersonate the opener's credentials when accessing
 backing file
From: Tatsuyuki Ishi <ishitatsuyuki@google.com>
To: Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
	Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep Dhavale <dhavale@google.com>, 
	Hongbo Li <lihongbo22@huawei.com>
Cc: linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	shengyong1@xiaomi.com, wangshuai12@xiaomi.com, 
	Tatsuyuki Ishi <ishitatsuyuki@google.com>
Content-Type: text/plain; charset="utf-8"

Previously, file operations on a file-backed mount used the current
process' credentials to access the backing FD. Attempting to do so on
Android lead to SELinux denials, as ACL rules on the backing file (e.g.
/system/apex/foo.apex) is restricted to a small set of process.
Arguably, this error is redundant and leaking implementation details, as
access to files on a mount is already ACL'ed by path.

Instead, override to use the opener's cred when accessing the backing
file. This makes the behavior similar to a loop-backed mount, which
uses kworker cred when accessing the backing file and does not cause
SELinux denials.

Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@google.com>
---
 fs/erofs/fileio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/erofs/fileio.c b/fs/erofs/fileio.c
index 7d81f504bff08f3d5c5d44d131460df5c3e7847d..df5cc63f2c01eb5e7ec4afab9e054ea12cea7175 100644
--- a/fs/erofs/fileio.c
+++ b/fs/erofs/fileio.c
@@ -47,6 +47,7 @@ static void erofs_fileio_ki_complete(struct kiocb *iocb, long ret)
 
 static void erofs_fileio_rq_submit(struct erofs_fileio_rq *rq)
 {
+	const struct cred *old_cred;
 	struct iov_iter iter;
 	int ret;
 
@@ -60,7 +61,9 @@ static void erofs_fileio_rq_submit(struct erofs_fileio_rq *rq)
 		rq->iocb.ki_flags = IOCB_DIRECT;
 	iov_iter_bvec(&iter, ITER_DEST, rq->bvecs, rq->bio.bi_vcnt,
 		      rq->bio.bi_iter.bi_size);
+	old_cred = override_creds(rq->iocb.ki_filp->f_cred);
 	ret = vfs_iocb_iter_read(rq->iocb.ki_filp, &rq->iocb, &iter);
+	revert_creds(old_cred);
 	if (ret != -EIOCBQUEUED)
 		erofs_fileio_ki_complete(&rq->iocb, ret);
 }

---
base-commit: cd2e103d57e5615f9bb027d772f93b9efd567224
change-id: 20250612-b4-erofs-impersonate-d6c2926c56ca

Best regards,
-- 
Tatsuyuki Ishi <ishitatsuyuki@google.com>

