Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA451FBEB9
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750414088; cv=none; b=Zy4IpdJBnHiVLG+V/rLu2UmVOH+acrEhXNjgmsP0zykcoEG0TUPAIPFDQben5rMubR2KU3lb8J1OdI1sWJBJ2KYgPsAlHPLNY0GrNceqd+OmRFFPfyfUdRXtUuwytm395fuFGncpol2m+HII0XgPr1Fwx2/63HbhpZEd87zttnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750414088; c=relaxed/simple;
	bh=XY36gJsAaxDXpLuaSGFXNIXxl3b5SC3ehYUOY4xNNHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gEDn6aq6fbiC7CIEDMctIds/rXya2sbgUJWgSBODcADuZPLaC4gSvhQrVGr9anUOACF4pJk75FX+72X0pTaMRr5CIMXAsSMQugQZBD8rbAPutJcm6OY6CDZ90avoum1ocY4KLV4yGU1hiIZguya1cYI+1VHfPvS0fovouStq0xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFXQrroo; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFXQrroo"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b2c2c762a89so1297123a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 03:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750414086; x=1751018886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N5IA6x+u4DmQUuB45wrZXuVzs1GUU+hrDbxsqjQ68lw=;
        b=PFXQrroodDybYeiNsG31g6mnB+FgXH6SfFUb4oDBQL3ayZvUWEULcL6SuAHbnnioqP
         ZFqCULLAS7OaxUrwjRNCLp/n0Hgr7DirJ4UsrAovu7qln4g1P9+umFLXGlGyLTjXQSjS
         MBeg/19PPGq55nr86iMe0bOjk+XoXyDJlPmi20Y0mEXGEIbGpWcS8LhirOwp3QTBxnHf
         O2YAJ+l0kTXBttcuiQs+sd84wgWQt2prHo6WzAfgtIVbkoccEI2a8PZjbYI4Y+Z425SQ
         5phHOdvjjlyAAIYTFhGZdNXWrVLbbQ/3lu1IdJTso8goxlQlevV8eks4a/3gGN5iTnzH
         ifzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750414086; x=1751018886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5IA6x+u4DmQUuB45wrZXuVzs1GUU+hrDbxsqjQ68lw=;
        b=TFIfsoKeiEmU4HlVm99DhWqXPAqb4G0BX22fHmHqyYXJWoWKYz6ap00kBVrME0Bhmq
         Sa/wpzNGlkGzf+6G20jrZCfGMq8pUeTzUNjNUDRE+fIqVKYwc/YCNdCDIH69GFT7Xtxb
         yQ9zJDxEKJoRBT7WTxqycu8ipVsyvAF+LbA30L5En5TcnH6SZVdoINCqhD3hNlhOrM86
         5UKnNJbrkSa6aGDAdhO91/mbLpcA4qXEg6MUx8liO/ZXXs7fhOf21hvTrX5Y3G7eqIqB
         Z8yXT/vEaNK5pZS2zKAXNG3LAHAb1sH5WSwGI7Ca3l6p4VSNlFbpQvN6lfL+BRkuzrr4
         lJDA==
X-Forwarded-Encrypted: i=1; AJvYcCUXhR+kja6AwHBD7EWBA7hmlyLXQkkSovds1mNbOWbnLCUVXgys9CGGt8YLDE8AssgiYOa1G9xPe3Bsqe8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAFblLnZCMsjxbb28DNWOwoJ4YsKLEUhPXcAtXHhO+3ARTjJ2/
	FvU7+JMhBPFy+xPlzkn0Nu0/ZANIZZtDJOzuWxbmwlQ+vA+5bkPkA7qf
X-Gm-Gg: ASbGncvvl/uwndl8Hxxu95Yte4IWf6xD3VFt4nR/cW2H65RhgHwYeUcR+cRV6Vo4fAZ
	koQ0x3iNwfh6yhplD3kuioj+K4fscF7lmi5PWlzYFMmBeLtIS1TyBvMdpGlkpDMtDhTo/0IEgsE
	YFd6F/h3FM7EAvRiYhEki0Au9Oy/6wangfjXYwA95SaZCEn2/MLcg3FKMLh7RhJeyM+HFimanSw
	qoEywWdvmB8V5MV0tQbEmioqmLT/ISTYGbmImA2gJg78fXffDuC33ZRsCFZR1N2VcFkp/9mKLIf
	lQC7YJyn5iuotQQs4Js12ykBbbzhOsNUAwVO2HPrxg7jCRvYbPOCeR7t+Sp3ih5zQ/RHSWw=
X-Google-Smtp-Source: AGHT+IEv1rhyUYa88QjjgSF1FGS7CGtwVqmjMOwj0bRiFKgksOqCgonmHtvy7aEefOi/ZO5fyU9KsQ==
X-Received: by 2002:a17:90b:38c6:b0:313:27e5:7ff1 with SMTP id 98e67ed59e1d1-3159d628b64mr3541299a91.1.1750414086447;
        Fri, 20 Jun 2025 03:08:06 -0700 (PDT)
Received: from localhost ([202.43.239.100])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a318733sm3842921a91.38.2025.06.20.03.08.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jun 2025 03:08:06 -0700 (PDT)
From: Jiazi Li <jqqlijiazi@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Eric W . Biederman" <ebiederm@xmission.com>
Cc: Jiazi Li <jqqlijiazi@gmail.com>,
	linux-kernel@vger.kernel.org,
	"mingzhu.wang" <mingzhu.wang@transsion.com>
Subject: [PATCH v2] kthread: update comment for __to_kthread
Date: Fri, 20 Jun 2025 18:07:56 +0800
Message-ID: <20250620100801.23185-1-jqqlijiazi@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With commit 343f4c49f243 ("kthread: Don't allocate kthread_struct
for init and umh") and commit 753550eb0ce1 ("fork: Explicitly set
PF_KTHREAD"), umh task no longer have struct kthread and PF_KTHREAD flag.

Update the comment to describe what the current rules are to detect
is something is a kthread.

Suggested-by Eric W . Biederman <ebiederm@xmission.com>
Signed-off-by: Jiazi Li <jqqlijiazi@gmail.com>
Signed-off-by: mingzhu.wang <mingzhu.wang@transsion.com>

---
Changes in v2:
- describe current rules for detect
---
---
 kernel/kthread.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index 85fc068f0083..0e98b228a8ef 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -88,13 +88,12 @@ static inline struct kthread *to_kthread(struct task_struct *k)
 /*
  * Variant of to_kthread() that doesn't assume @p is a kthread.
  *
- * Per construction; when:
+ * When "(p->flags & PF_KTHREAD)" is set the task is a kthread and will
+ * always remain a kthread.  For kthreads p->worker_private always
+ * points to a struct kthread.  For tasks that are not kthreads
+ * p->worker_private is used to point to other things.
  *
- *   (p->flags & PF_KTHREAD) && p->worker_private
- *
- * the task is both a kthread and struct kthread is persistent. However
- * PF_KTHREAD on it's own is not, kernel_thread() can exec() (See umh.c and
- * begin_new_exec()).
+ * Return NULL for any task that is not a kthread.
  */
 static inline struct kthread *__to_kthread(struct task_struct *p)
 {
-- 
2.49.0

