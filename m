Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67337081D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750382718; cv=none; b=MqFS4sKICfx5oke8BwShpeHfgMCDiQbAnjAaBwEx8Jm8Qsc2DbL16Ys15zQjLD13sliceeqvwDJpF9ElEgwYN2ob2sLAQ36sB1WNH8rc0JnJOvcJBFEj+bYXo70Pu3gqJb0glK2uY2d6esmoePJ4w18qI/hmeh5L3g3OeTzY7SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750382718; c=relaxed/simple;
	bh=owMdNBEirTOUYDKZZnWe9phYEFPqEGWEX+HWk21JD8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZnZrR9Eiih8NDM8lq58pEo5+GQJg5AORYJyTFbPczJb98D6+d/Pl5D/sWnjNcn+iuK0p7H6ukOl52ywiolQoIj65vVnauSIvylSOsLgc67XsjOC49xnrDfun3ruSQANEMu/9eacRZ36crAFy9utpAGQXGAjUene/Z6qNsU0KqSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=pSHeIDDa; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="pSHeIDDa"
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JN8UAg025608
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 21:25:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pps01;
 bh=RWFS/O3+ZD+8YlNR9npeOHUHV0ZFbSZR8/b4rJdEjvc=;
 b=pSHeIDDaDLpTbx9GfugZnqnxexbWNlyWpWIgYnJQ+iMefdM4cfoStS/Yf9M8ndhEyEV3
 HsAhqlndiqjPke+GBVOx/JYOcCskEguq5faxBnVjdZYnqVW5oxA5mxlidO4KAKwIe/o2
 /3VrvFz7Y2ovUuHZcxEQRLPlHx1k1hS+lbIUCYEDPdSw6JvTTfGbkVSvXE6cnNtpSW+c
 q3pLbQO30FiL8pc2kHNSpnVBmaloaZIt5JEOdUOG8AL1paRpi/VV637YFLpvt7PzRce/
 9I82owaz7asPhvYpkaug5G+nA2PS/ksbbz96tZKb1cYTQNIGCfqWbxDHmdLhezQck0Sg 9g== 
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 479pqn795s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 21:25:15 -0400
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a6e9182fbaso19661011cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 18:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750382694; x=1750987494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RWFS/O3+ZD+8YlNR9npeOHUHV0ZFbSZR8/b4rJdEjvc=;
        b=epqMsDbrvHtYUuUyux/3QbVA+6PQgfB//l68K6jScTVnIYwJHc2LQuGrv5X/gUrqR+
         Tjg2LHeLRAYf1AlZ6TQVKtrf5knRm6NW1jg2bH25m+36CVH9CBRxamYPdS4suWNA2aNl
         6zwoHnnCEo00jipFei9TnoQC/LVJI2XI2/+JDXcdkn87cQGcjw0vIEUQnEIW+1Dv2ZlV
         0cWjfF11ZAu4H0Hrjs2b1VRQNyN2NIG68jt6DpwrgkqsRGnlwdRXkZrwm44BS7qC8WGH
         +swbXK75gm5eN7N0QYWsXueYp8itaLDYUCMXpmz9PQi5yWdzMftSn5S2Wp3dMfBEQH48
         A5jw==
X-Forwarded-Encrypted: i=1; AJvYcCVFtRMphEj4iiCGRCBdwHTtDOINHN/tdUpuIAVMPLN7JetsRsrmA9WvsEX7vZ67C6WS4hGw9vbvYKb7X90=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzlJll8z8JD/ct01saN93HBxltW3AYPQ+VMSyudJ2k+GKk4jlr
	fEifAbZRqnY53pvIc1chTw+OK9umDGei5cIlNsjfBHhbRPn7V18XucIvrP79dfgYysAZaENWTYx
	zN+r+rnCtmMOoB8bbB9TQneDNAE6I+kvKvpHM3B2xbmCf2TZI9p5c1aFyoT4hjw==
X-Gm-Gg: ASbGncuSL1MCZlOr+z4j/C0YAnIE7bQMhgjUVu2vvnG65fuiwz0GIakOHACJYspeqRQ
	uHbKNM7HdNmzDPNIy7/xV3b8zclZaihQhG9WFevXjR6jXEgdPW4NZ7iP+FJYL2K8l6CUc4iQGr9
	i7zIIZjKzicm/YjAAFSThsd1AZmKqGtYyf2LjA2Lv/YowfH1BfGUAV+Xq9/O03FBXpZENN0Dz9e
	gILUpBU/P3AVyervniBSG0DnprnBM2COz/nckG7v5xe7sue4zPeDQhErGmI212lWVQvPJ6ocmZq
	I1wEKj2/KkHTqN5lfdUzjIoTpF+Iq/tQc5nzU2/vOsIc18X+wsHe0/pW3G7GW1UZz6Bp
X-Received: by 2002:ac8:7d91:0:b0:4a7:8af:3372 with SMTP id d75a77b69052e-4a77c2d5a16mr6375801cf.1.1750382693799;
        Thu, 19 Jun 2025 18:24:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxSBk/DrFdt6HyevBLvxZyXoVmuiIlMGpXyLYAA+lHLIJsHLNL10gZmy4gTm6BrPCle8DH6w==
X-Received: by 2002:ac8:7d91:0:b0:4a7:8af:3372 with SMTP id d75a77b69052e-4a77c2d5a16mr6375341cf.1.1750382692318;
        Thu, 19 Jun 2025 18:24:52 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779e79c12sm3794321cf.53.2025.06.19.18.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 18:24:51 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 19 Jun 2025 21:24:25 -0400
Subject: [PATCH v3 3/4] userfaultfd: remove (VM_)BUG_ON()s
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-uffd-fixes-v3-3-a7274d3bd5e4@columbia.edu>
References: <20250619-uffd-fixes-v3-0-a7274d3bd5e4@columbia.edu>
In-Reply-To: <20250619-uffd-fixes-v3-0-a7274d3bd5e4@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        David Hildenbrand <david@redhat.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        Andrea Arcangeli <aarcange@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.14.3-dev-d7477
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750382688; l=13816;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=owMdNBEirTOUYDKZZnWe9phYEFPqEGWEX+HWk21JD8Q=;
 b=1td6e7UCiOGMwEkYkMVCA0HLRM6tRyR/78GTYKhDrmwZH2WvlwjaVlh/MrbACG2gDu1MGQkz+
 RX31tKbOES0APmpnf+37BCJMSX26cru2Fd6gXWzVi7Omd8r5UHX6wod
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDAwOSBTYWx0ZWRfX77FAEwoKYOLq jxKQalxH4pO3Iu9P6GvBXR+Z0VAHNGz9YgOwnHXe7aOu6+z4qko2eKjXvwVIx8ir7jDRb9QU5Lc gDEM5drc3H194AjFIfLb5wFpdk4gbX5wlvZD1eA/2z58D7CbdZBuhmSyRQBNkIIVFz4CY9GRUp+
 vPLCuDzgufMjYzQN74398vX83OyoFhFVOalxyNVgP7fAZZYCncXFjHNuvani+G12lL1oLPpyAqK zeAl+Y69erlS0J4LMQ0bbYJ1ZBEUtqY7cnxR+VBrhPIvydE0Jusxa2NkktaIjCKdyc5o51gdNGn jIbrK8lcJHXE9Sp0pMV21BNj8Xa1NA2b3RbW9LDnjdT4mWfwmiyxzww+8T+cdx8I/Gtk5YMraTm 6IHU0lRO
X-Proofpoint-GUID: UbF9qaeJF9CLpKAcQiykXECmsmFwoESg
X-Proofpoint-ORIG-GUID: UbF9qaeJF9CLpKAcQiykXECmsmFwoESg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_08,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=10
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 bulkscore=10 priorityscore=1501 phishscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506200009

BUG_ON() is deprecated [1]. Convert all the BUG_ON()s and VM_BUG_ON()s
to use VM_WARN_ON_ONCE().

There are a few additional cases that are converted or modified:

- Convert the printk(KERN_WARNING ...) in handle_userfault() to use
  pr_warn().

- Convert the WARN_ON_ONCE()s in move_pages() to use VM_WARN_ON_ONCE(),
  as the relevant conditions are already checked in validate_range() in
  move_pages()'s caller.

- Convert the VM_WARN_ON()'s in move_pages() to VM_WARN_ON_ONCE(). These
  cases should never happen and are similar to those in mfill_atomic()
  and mfill_atomic_hugetlb(), which were previously BUG_ON()s.
  move_pages() was added later than those functions and makes use of
  VM_WARN_ON() as a replacement for the deprecated BUG_ON(), but.
  VM_WARN_ON_ONCE() is likely a better direct replacement.

- Convert the WARN_ON() for !VM_MAYWRITE in userfaultfd_unregister() and
  userfaultfd_register_range() to VM_WARN_ON_ONCE(). This condition is
  enforced in userfaultfd_register() so it should never happen, and can
  be converted to a debug check.

[1] https://www.kernel.org/doc/html/v6.15/process/coding-style.html#use-warn-rather-than-bug

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/userfaultfd.c | 59 ++++++++++++++++++++++++------------------------
 mm/userfaultfd.c | 68 +++++++++++++++++++++++++++-----------------------------
 2 files changed, 62 insertions(+), 65 deletions(-)

diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
index 8e7fb2a7a6aa..771e81ea4ef6 100644
--- a/fs/userfaultfd.c
+++ b/fs/userfaultfd.c
@@ -165,14 +165,14 @@ static void userfaultfd_ctx_get(struct userfaultfd_ctx *ctx)
 static void userfaultfd_ctx_put(struct userfaultfd_ctx *ctx)
 {
 	if (refcount_dec_and_test(&ctx->refcount)) {
-		VM_BUG_ON(spin_is_locked(&ctx->fault_pending_wqh.lock));
-		VM_BUG_ON(waitqueue_active(&ctx->fault_pending_wqh));
-		VM_BUG_ON(spin_is_locked(&ctx->fault_wqh.lock));
-		VM_BUG_ON(waitqueue_active(&ctx->fault_wqh));
-		VM_BUG_ON(spin_is_locked(&ctx->event_wqh.lock));
-		VM_BUG_ON(waitqueue_active(&ctx->event_wqh));
-		VM_BUG_ON(spin_is_locked(&ctx->fd_wqh.lock));
-		VM_BUG_ON(waitqueue_active(&ctx->fd_wqh));
+		VM_WARN_ON_ONCE(spin_is_locked(&ctx->fault_pending_wqh.lock));
+		VM_WARN_ON_ONCE(waitqueue_active(&ctx->fault_pending_wqh));
+		VM_WARN_ON_ONCE(spin_is_locked(&ctx->fault_wqh.lock));
+		VM_WARN_ON_ONCE(waitqueue_active(&ctx->fault_wqh));
+		VM_WARN_ON_ONCE(spin_is_locked(&ctx->event_wqh.lock));
+		VM_WARN_ON_ONCE(waitqueue_active(&ctx->event_wqh));
+		VM_WARN_ON_ONCE(spin_is_locked(&ctx->fd_wqh.lock));
+		VM_WARN_ON_ONCE(waitqueue_active(&ctx->fd_wqh));
 		mmdrop(ctx->mm);
 		kmem_cache_free(userfaultfd_ctx_cachep, ctx);
 	}
@@ -383,12 +383,12 @@ vm_fault_t handle_userfault(struct vm_fault *vmf, unsigned long reason)
 	if (!ctx)
 		goto out;
 
-	BUG_ON(ctx->mm != mm);
+	VM_WARN_ON_ONCE(ctx->mm != mm);
 
 	/* Any unrecognized flag is a bug. */
-	VM_BUG_ON(reason & ~__VM_UFFD_FLAGS);
+	VM_WARN_ON_ONCE(reason & ~__VM_UFFD_FLAGS);
 	/* 0 or > 1 flags set is a bug; we expect exactly 1. */
-	VM_BUG_ON(!reason || (reason & (reason - 1)));
+	VM_WARN_ON_ONCE(!reason || (reason & (reason - 1)));
 
 	if (ctx->features & UFFD_FEATURE_SIGBUS)
 		goto out;
@@ -411,12 +411,11 @@ vm_fault_t handle_userfault(struct vm_fault *vmf, unsigned long reason)
 		 * to be sure not to return SIGBUS erroneously on
 		 * nowait invocations.
 		 */
-		BUG_ON(vmf->flags & FAULT_FLAG_RETRY_NOWAIT);
+		VM_WARN_ON_ONCE(vmf->flags & FAULT_FLAG_RETRY_NOWAIT);
 #ifdef CONFIG_DEBUG_VM
 		if (printk_ratelimit()) {
-			printk(KERN_WARNING
-			       "FAULT_FLAG_ALLOW_RETRY missing %x\n",
-			       vmf->flags);
+			pr_warn("FAULT_FLAG_ALLOW_RETRY missing %x\n",
+				vmf->flags);
 			dump_stack();
 		}
 #endif
@@ -602,7 +601,7 @@ static void userfaultfd_event_wait_completion(struct userfaultfd_ctx *ctx,
 	 */
 out:
 	atomic_dec(&ctx->mmap_changing);
-	VM_BUG_ON(atomic_read(&ctx->mmap_changing) < 0);
+	VM_WARN_ON_ONCE(atomic_read(&ctx->mmap_changing) < 0);
 	userfaultfd_ctx_put(ctx);
 }
 
@@ -710,7 +709,7 @@ void dup_userfaultfd_fail(struct list_head *fcs)
 		struct userfaultfd_ctx *ctx = fctx->new;
 
 		atomic_dec(&octx->mmap_changing);
-		VM_BUG_ON(atomic_read(&octx->mmap_changing) < 0);
+		VM_WARN_ON_ONCE(atomic_read(&octx->mmap_changing) < 0);
 		userfaultfd_ctx_put(octx);
 		userfaultfd_ctx_put(ctx);
 
@@ -1317,8 +1316,8 @@ static int userfaultfd_register(struct userfaultfd_ctx *ctx,
 	do {
 		cond_resched();
 
-		BUG_ON(!!cur->vm_userfaultfd_ctx.ctx ^
-		       !!(cur->vm_flags & __VM_UFFD_FLAGS));
+		VM_WARN_ON_ONCE(!!cur->vm_userfaultfd_ctx.ctx ^
+				!!(cur->vm_flags & __VM_UFFD_FLAGS));
 
 		/* check not compatible vmas */
 		ret = -EINVAL;
@@ -1372,7 +1371,7 @@ static int userfaultfd_register(struct userfaultfd_ctx *ctx,
 
 		found = true;
 	} for_each_vma_range(vmi, cur, end);
-	BUG_ON(!found);
+	VM_WARN_ON_ONCE(!found);
 
 	ret = userfaultfd_register_range(ctx, vma, vm_flags, start, end,
 					 wp_async);
@@ -1464,8 +1463,8 @@ static int userfaultfd_unregister(struct userfaultfd_ctx *ctx,
 	do {
 		cond_resched();
 
-		BUG_ON(!!cur->vm_userfaultfd_ctx.ctx ^
-		       !!(cur->vm_flags & __VM_UFFD_FLAGS));
+		VM_WARN_ON_ONCE(!!cur->vm_userfaultfd_ctx.ctx ^
+				!!(cur->vm_flags & __VM_UFFD_FLAGS));
 
 		/*
 		 * Prevent unregistering through a different userfaultfd than
@@ -1487,7 +1486,7 @@ static int userfaultfd_unregister(struct userfaultfd_ctx *ctx,
 
 		found = true;
 	} for_each_vma_range(vmi, cur, end);
-	BUG_ON(!found);
+	VM_WARN_ON_ONCE(!found);
 
 	vma_iter_set(&vmi, start);
 	prev = vma_prev(&vmi);
@@ -1504,7 +1503,7 @@ static int userfaultfd_unregister(struct userfaultfd_ctx *ctx,
 
 		VM_WARN_ON_ONCE(vma->vm_userfaultfd_ctx.ctx != ctx);
 		VM_WARN_ON_ONCE(!vma_can_userfault(vma, vma->vm_flags, wp_async));
-		WARN_ON(!(vma->vm_flags & VM_MAYWRITE));
+		VM_WARN_ON_ONCE(!(vma->vm_flags & VM_MAYWRITE));
 
 		if (vma->vm_start > start)
 			start = vma->vm_start;
@@ -1569,7 +1568,7 @@ static int userfaultfd_wake(struct userfaultfd_ctx *ctx,
 	 * len == 0 means wake all and we don't want to wake all here,
 	 * so check it again to be sure.
 	 */
-	VM_BUG_ON(!range.len);
+	VM_WARN_ON_ONCE(!range.len);
 
 	wake_userfault(ctx, &range);
 	ret = 0;
@@ -1626,7 +1625,7 @@ static int userfaultfd_copy(struct userfaultfd_ctx *ctx,
 		return -EFAULT;
 	if (ret < 0)
 		goto out;
-	BUG_ON(!ret);
+	VM_WARN_ON_ONCE(!ret);
 	/* len == 0 would wake all */
 	range.len = ret;
 	if (!(uffdio_copy.mode & UFFDIO_COPY_MODE_DONTWAKE)) {
@@ -1681,7 +1680,7 @@ static int userfaultfd_zeropage(struct userfaultfd_ctx *ctx,
 	if (ret < 0)
 		goto out;
 	/* len == 0 would wake all */
-	BUG_ON(!ret);
+	VM_WARN_ON_ONCE(!ret);
 	range.len = ret;
 	if (!(uffdio_zeropage.mode & UFFDIO_ZEROPAGE_MODE_DONTWAKE)) {
 		range.start = uffdio_zeropage.range.start;
@@ -1793,7 +1792,7 @@ static int userfaultfd_continue(struct userfaultfd_ctx *ctx, unsigned long arg)
 		goto out;
 
 	/* len == 0 would wake all */
-	BUG_ON(!ret);
+	VM_WARN_ON_ONCE(!ret);
 	range.len = ret;
 	if (!(uffdio_continue.mode & UFFDIO_CONTINUE_MODE_DONTWAKE)) {
 		range.start = uffdio_continue.range.start;
@@ -1850,7 +1849,7 @@ static inline int userfaultfd_poison(struct userfaultfd_ctx *ctx, unsigned long
 		goto out;
 
 	/* len == 0 would wake all */
-	BUG_ON(!ret);
+	VM_WARN_ON_ONCE(!ret);
 	range.len = ret;
 	if (!(uffdio_poison.mode & UFFDIO_POISON_MODE_DONTWAKE)) {
 		range.start = uffdio_poison.range.start;
@@ -2111,7 +2110,7 @@ static int new_userfaultfd(int flags)
 	struct file *file;
 	int fd;
 
-	BUG_ON(!current->mm);
+	VM_WARN_ON_ONCE(!current->mm);
 
 	/* Check the UFFD_* constants for consistency.  */
 	BUILD_BUG_ON(UFFD_USER_MODE_ONLY & UFFD_SHARED_FCNTL_FLAGS);
diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index bc473ad21202..240578bed181 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -561,7 +561,7 @@ static __always_inline ssize_t mfill_atomic_hugetlb(
 	}
 
 	while (src_addr < src_start + len) {
-		BUG_ON(dst_addr >= dst_start + len);
+		VM_WARN_ON_ONCE(dst_addr >= dst_start + len);
 
 		/*
 		 * Serialize via vma_lock and hugetlb_fault_mutex.
@@ -602,7 +602,7 @@ static __always_inline ssize_t mfill_atomic_hugetlb(
 		if (unlikely(err == -ENOENT)) {
 			up_read(&ctx->map_changing_lock);
 			uffd_mfill_unlock(dst_vma);
-			BUG_ON(!folio);
+			VM_WARN_ON_ONCE(!folio);
 
 			err = copy_folio_from_user(folio,
 						   (const void __user *)src_addr, true);
@@ -614,7 +614,7 @@ static __always_inline ssize_t mfill_atomic_hugetlb(
 			dst_vma = NULL;
 			goto retry;
 		} else
-			BUG_ON(folio);
+			VM_WARN_ON_ONCE(folio);
 
 		if (!err) {
 			dst_addr += vma_hpagesize;
@@ -635,9 +635,9 @@ static __always_inline ssize_t mfill_atomic_hugetlb(
 out:
 	if (folio)
 		folio_put(folio);
-	BUG_ON(copied < 0);
-	BUG_ON(err > 0);
-	BUG_ON(!copied && !err);
+	VM_WARN_ON_ONCE(copied < 0);
+	VM_WARN_ON_ONCE(err > 0);
+	VM_WARN_ON_ONCE(!copied && !err);
 	return copied ? copied : err;
 }
 #else /* !CONFIG_HUGETLB_PAGE */
@@ -711,12 +711,12 @@ static __always_inline ssize_t mfill_atomic(struct userfaultfd_ctx *ctx,
 	/*
 	 * Sanitize the command parameters:
 	 */
-	BUG_ON(dst_start & ~PAGE_MASK);
-	BUG_ON(len & ~PAGE_MASK);
+	VM_WARN_ON_ONCE(dst_start & ~PAGE_MASK);
+	VM_WARN_ON_ONCE(len & ~PAGE_MASK);
 
 	/* Does the address range wrap, or is the span zero-sized? */
-	BUG_ON(src_start + len <= src_start);
-	BUG_ON(dst_start + len <= dst_start);
+	VM_WARN_ON_ONCE(src_start + len <= src_start);
+	VM_WARN_ON_ONCE(dst_start + len <= dst_start);
 
 	src_addr = src_start;
 	dst_addr = dst_start;
@@ -775,7 +775,7 @@ static __always_inline ssize_t mfill_atomic(struct userfaultfd_ctx *ctx,
 	while (src_addr < src_start + len) {
 		pmd_t dst_pmdval;
 
-		BUG_ON(dst_addr >= dst_start + len);
+		VM_WARN_ON_ONCE(dst_addr >= dst_start + len);
 
 		dst_pmd = mm_alloc_pmd(dst_mm, dst_addr);
 		if (unlikely(!dst_pmd)) {
@@ -818,7 +818,7 @@ static __always_inline ssize_t mfill_atomic(struct userfaultfd_ctx *ctx,
 
 			up_read(&ctx->map_changing_lock);
 			uffd_mfill_unlock(dst_vma);
-			BUG_ON(!folio);
+			VM_WARN_ON_ONCE(!folio);
 
 			kaddr = kmap_local_folio(folio, 0);
 			err = copy_from_user(kaddr,
@@ -832,7 +832,7 @@ static __always_inline ssize_t mfill_atomic(struct userfaultfd_ctx *ctx,
 			flush_dcache_folio(folio);
 			goto retry;
 		} else
-			BUG_ON(folio);
+			VM_WARN_ON_ONCE(folio);
 
 		if (!err) {
 			dst_addr += PAGE_SIZE;
@@ -852,9 +852,9 @@ static __always_inline ssize_t mfill_atomic(struct userfaultfd_ctx *ctx,
 out:
 	if (folio)
 		folio_put(folio);
-	BUG_ON(copied < 0);
-	BUG_ON(err > 0);
-	BUG_ON(!copied && !err);
+	VM_WARN_ON_ONCE(copied < 0);
+	VM_WARN_ON_ONCE(err > 0);
+	VM_WARN_ON_ONCE(!copied && !err);
 	return copied ? copied : err;
 }
 
@@ -940,11 +940,11 @@ int mwriteprotect_range(struct userfaultfd_ctx *ctx, unsigned long start,
 	/*
 	 * Sanitize the command parameters:
 	 */
-	BUG_ON(start & ~PAGE_MASK);
-	BUG_ON(len & ~PAGE_MASK);
+	VM_WARN_ON_ONCE(start & ~PAGE_MASK);
+	VM_WARN_ON_ONCE(len & ~PAGE_MASK);
 
 	/* Does the address range wrap, or is the span zero-sized? */
-	BUG_ON(start + len <= start);
+	VM_WARN_ON_ONCE(start + len <= start);
 
 	mmap_read_lock(dst_mm);
 
@@ -1709,15 +1709,13 @@ ssize_t move_pages(struct userfaultfd_ctx *ctx, unsigned long dst_start,
 	ssize_t moved = 0;
 
 	/* Sanitize the command parameters. */
-	if (WARN_ON_ONCE(src_start & ~PAGE_MASK) ||
-	    WARN_ON_ONCE(dst_start & ~PAGE_MASK) ||
-	    WARN_ON_ONCE(len & ~PAGE_MASK))
-		goto out;
+	VM_WARN_ON_ONCE(src_start & ~PAGE_MASK);
+	VM_WARN_ON_ONCE(dst_start & ~PAGE_MASK);
+	VM_WARN_ON_ONCE(len & ~PAGE_MASK);
 
 	/* Does the address range wrap, or is the span zero-sized? */
-	if (WARN_ON_ONCE(src_start + len <= src_start) ||
-	    WARN_ON_ONCE(dst_start + len <= dst_start))
-		goto out;
+	VM_WARN_ON_ONCE(src_start + len < src_start);
+	VM_WARN_ON_ONCE(dst_start + len < dst_start);
 
 	err = uffd_move_lock(mm, dst_start, src_start, &dst_vma, &src_vma);
 	if (err)
@@ -1867,9 +1865,9 @@ ssize_t move_pages(struct userfaultfd_ctx *ctx, unsigned long dst_start,
 	up_read(&ctx->map_changing_lock);
 	uffd_move_unlock(dst_vma, src_vma);
 out:
-	VM_WARN_ON(moved < 0);
-	VM_WARN_ON(err > 0);
-	VM_WARN_ON(!moved && !err);
+	VM_WARN_ON_ONCE(moved < 0);
+	VM_WARN_ON_ONCE(err > 0);
+	VM_WARN_ON_ONCE(!moved && !err);
 	return moved ? moved : err;
 }
 
@@ -1956,10 +1954,10 @@ int userfaultfd_register_range(struct userfaultfd_ctx *ctx,
 	for_each_vma_range(vmi, vma, end) {
 		cond_resched();
 
-		BUG_ON(!vma_can_userfault(vma, vm_flags, wp_async));
-		BUG_ON(vma->vm_userfaultfd_ctx.ctx &&
-		       vma->vm_userfaultfd_ctx.ctx != ctx);
-		WARN_ON(!(vma->vm_flags & VM_MAYWRITE));
+		VM_WARN_ON_ONCE(!vma_can_userfault(vma, vm_flags, wp_async));
+		VM_WARN_ON_ONCE(vma->vm_userfaultfd_ctx.ctx &&
+				vma->vm_userfaultfd_ctx.ctx != ctx);
+		VM_WARN_ON_ONCE(!(vma->vm_flags & VM_MAYWRITE));
 
 		/*
 		 * Nothing to do: this vma is already registered into this
@@ -2035,8 +2033,8 @@ void userfaultfd_release_all(struct mm_struct *mm,
 	prev = NULL;
 	for_each_vma(vmi, vma) {
 		cond_resched();
-		BUG_ON(!!vma->vm_userfaultfd_ctx.ctx ^
-		       !!(vma->vm_flags & __VM_UFFD_FLAGS));
+		VM_WARN_ON_ONCE(!!vma->vm_userfaultfd_ctx.ctx ^
+				!!(vma->vm_flags & __VM_UFFD_FLAGS));
 		if (vma->vm_userfaultfd_ctx.ctx != ctx) {
 			prev = vma;
 			continue;

-- 
2.39.5

