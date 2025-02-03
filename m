Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D754B225D6
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 04:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738558574; cv=none; b=bUN7Ihv6jSHTWjlaVN/hcMz6ygToA2Zz/rwBSjV/Mt6Qy+5tY/N6t1WodlL5X+7CSGkCTS2RfDgpUVX2ptXrR583RfaHs0NQNpvlL1dz2viWai+FdFd0cE1rvKESEmashjtw3nWlvM8bAH/ziAg1BrPD5Q2IfMwmj/NjbMoItdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738558574; c=relaxed/simple;
	bh=3DzX/MTq9BYYX3m2khppuon+siQVHJJYBYOwjA0cB04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubHBjIty1DBECvlm1kDcJdFrk7n/lvZk+dpQ2cfCiDNCyQ7Z0UBnqgsRsEiEDqDa5Rs+Y35ahGbyLdBWyodvtKAwjLNfW6j1FstyCUM47+Q7r6h7lng9ov0EaleB4dJ61Jti+Ul8wzCKLFZBdsU9FkcafodAtKscY+P7YIVDQDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hhxfiZ89; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hhxfiZ89"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2161eb94cceso45376895ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 20:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738558572; x=1739163372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=35fagRI7YvF5z/POmptafe9Ah+8/A/NMEesi8PxvIoY=;
        b=hhxfiZ89JlZDPSF2o/LXw97U8+ZfxFiT2fRrQUlIBmqVBnqNIEIDUlDuULckNIe5rJ
         f7KNEa9di7ywzoCteZh1bALc9fTB9+GdA/n3IlfkkV1Y/iR7edG2yolINL0TkqEW6zIH
         zTzfGVloLnSjXudLHUpzC0ft8pKg4Ye6GMYUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738558572; x=1739163372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35fagRI7YvF5z/POmptafe9Ah+8/A/NMEesi8PxvIoY=;
        b=rIE+Rr9obnp0+lMb2mdH5LWhl3WiSsqPYIpxE9HoAtLt8+owR0QJc3ygWZnzQH8IeI
         Xk656wa5k6TyuWYJIRbc/FHgDffn23bvyTuXZhK76R37F2IncRGsyHGUgfyJTFNYi6a/
         ibD87WnDi+Bvlt67MNfXDPP+pCmnM3uMVQKh6r4elz/vVf5JPdkHCIGtIDxJXZqijE7y
         8zo9UnNeCafMyCaSSjk3JU3TMVjfImnghC/sesLUxWS7J1bhgnPg2ZVtBzat07LKULro
         9onS3G2cJlT4k66vmWME48hOAnIsyeKfgYN0rT/2pdfLjfkzR3UzH1SWeNms7BDMCbUs
         K0jA==
X-Forwarded-Encrypted: i=1; AJvYcCVYjIieiYQGk4k1xhm29ve93S9XIjnxljvKM9oUA1hdkph3SGU+9VVPxrjCYzWHELfxPh0Gt77MEKwMXs8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJVBhnFk7vUjUz4BQqh6uwm/k03szLptw5M0CWFFumI8Ye6XHE
	028NGdkqfDL1YnFGEkImqCLrtKrRNj9aqvpZNAkn2gE0YZWA7/PyO7UMcVyQYw==
X-Gm-Gg: ASbGnctsaT3Ni6WhjRGY/lrqxk1sEQFIkELutIxV1hTJ5OgtbfUkKwPMdMItN+bOObY
	tJEjQkKRItWbwFQCIEP6zVJ26zTI4G5cyj4aw8BgXbv3YNs7b/8dFDogxnHg6WFs9nFLjnOS5zL
	FpyWUrBHzfzOnsJ2WkGXm+eAOF758NKA+rVTJQ3Nrwvdq5OJQCAto8ElsSsQ25nRIDoW4NX7qx7
	wtrmJUwzAlDvtntRweXegSJVQLwk4JPbvbwMGnCd36vtsuBhN9mU6stX5BF/2XMog8qgwrWDRKM
	5TjgiONmDdFhIawm
X-Google-Smtp-Source: AGHT+IElehfyIl0r0zeTt9UhM4egRdW6riZZbqG0ru6iTcAMiIFgnmcTLnpSR4MMUzyWeJzzxOVE7Q==
X-Received: by 2002:a05:6a20:c88a:b0:1e1:ce4d:a144 with SMTP id adf61e73a8af0-1ed7a403083mr35610931637.0.1738558572110;
        Sun, 02 Feb 2025 20:56:12 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:f3c0:b0:250f:9437])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acebe85656bsm5840918a12.36.2025.02.02.20.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 20:56:11 -0800 (PST)
Date: Mon, 3 Feb 2025 13:56:05 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 14/17] zsmalloc: make zspage lock preemptible
Message-ID: <c5bpvju3ulaylrhkqieqljezke6xejv6ycrkgarn2ufrnzelzm@4rs2r6qm6xmm>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-15-senozhatsky@chromium.org>
 <Z5zxlRkdseEJntFk@google.com>
 <ecuos7w7m35fvzz7xvmvdvfxn7adzdahuulwn2j42mvjoqmlwi@ucel4kqetxg6>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecuos7w7m35fvzz7xvmvdvfxn7adzdahuulwn2j42mvjoqmlwi@ucel4kqetxg6>

On (25/02/03 12:13), Sergey Senozhatsky wrote:
> > Just my 2c.
> 
> Perhaps we can sprinkle some lockdep on it.

I forgot to rwsem_release() in zspage_write_unlock() and that
has triggered lockdep :)

---
 mm/zsmalloc.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 956445f4d554..1d4700e457d4 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -308,6 +308,10 @@ struct zspage {
 	struct list_head list; /* fullness list */
 	struct zs_pool *pool;
 	atomic_t lock;
+
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+	struct lockdep_map lockdep_map;
+#endif
 };
 
 struct mapping_area {
@@ -319,6 +323,12 @@ struct mapping_area {
 
 static void zspage_lock_init(struct zspage *zspage)
 {
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+	static struct lock_class_key key;
+
+	lockdep_init_map(&zspage->lockdep_map, "zsmalloc-page", &key, 0);
+#endif
+
 	atomic_set(&zspage->lock, ZS_PAGE_UNLOCKED);
 }
 
@@ -344,11 +354,19 @@ static void zspage_read_lock(struct zspage *zspage)
 			continue;
 		}
 	} while (!atomic_try_cmpxchg(lock, &old, old + 1));
+
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+	rwsem_acquire_read(&zspage->lockdep_map, 0, 0, _RET_IP_);
+#endif
 }
 
 static void zspage_read_unlock(struct zspage *zspage)
 {
 	atomic_dec(&zspage->lock);
+
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+	rwsem_release(&zspage->lockdep_map, _RET_IP_);
+#endif
 }
 
 static bool zspage_try_write_lock(struct zspage *zspage)
@@ -357,8 +375,12 @@ static bool zspage_try_write_lock(struct zspage *zspage)
 	int old = ZS_PAGE_UNLOCKED;
 
 	preempt_disable();
-	if (atomic_try_cmpxchg(lock, &old, ZS_PAGE_WRLOCKED))
+	if (atomic_try_cmpxchg(lock, &old, ZS_PAGE_WRLOCKED)) {
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+		rwsem_acquire(&zspage->lockdep_map, 0, 0, _RET_IP_);
+#endif
 		return true;
+	}
 
 	preempt_enable();
 	return false;
@@ -367,6 +389,9 @@ static bool zspage_try_write_lock(struct zspage *zspage)
 static void zspage_write_unlock(struct zspage *zspage)
 {
 	atomic_set(&zspage->lock, ZS_PAGE_UNLOCKED);
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+	rwsem_release(&zspage->lockdep_map, _RET_IP_);
+#endif
 	preempt_enable();
 }
 
-- 
2.48.1.362.g079036d154-goog

