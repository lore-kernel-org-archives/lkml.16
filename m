Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92ADF210F53
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 22:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744239088; cv=none; b=VvAnBgSR9DnPo7vKDrIXNaxYndZ1hXMOQDwj33fFFYMEL7jQfJ7exTRLtxs2y3GNzSu1tAAgX4g5TC2WOYzEP8eRHsH36fC32SGTMxUGr2tpBN2+W9JdACFFgRK6mMxZSTjwvfUEMQ32atjptV4tTTS2PFlnZojvYezYrXMIpcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744239088; c=relaxed/simple;
	bh=irv9BkjjyywVaEFvNdQUpuDFblPFtAc2Tq/QX75aPnM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Gb7YOEpg5eYyLywRj4g4+24YArTy/UdAOICf9yRM8Xl9oYROaUvK8mjvV3gpL52HtiiEgpcjOzVdqJMrH2rV4NriZqqOsiXq9q3KAac9jDPF3S1bRoWPBgDmC8nYNnJ0eN9QLjq1iwytyQNeVO38Xh+NdXlORO8xBK0nAkOnJhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v17FBMPC; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v17FBMPC"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7394772635dso101161b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 15:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744239074; x=1744843874; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QZ/B0L4XT9ckYcnWqWd+FYUUzdafyMad+IsfhzlV93I=;
        b=v17FBMPC6V9XoqDA8qhRR+2lqpplVTyTQoOt64MnF6KxeUQpNbOzBhP1AQUUvGKo0X
         0TVT3TTT4KcCLbrpNxMJtGO+Sx7BTwciH4CbwLJvTdB98Vqn2uM271qgjoIk1Ju12Bl2
         h/a4YN7SYfSOt/WmkuLxIwQFkvHszeONnrtVpnhNwkDZ0m9sLFRDvMhMxyF9zhsObPCF
         we8GTwcaiNNMCqtKBcqXNyjzv9dMN1yTro4VACSUxiC8YXGhQfqvjKRzkzZTmozjVlna
         5r2de8U5ezqa8HWUVB2QTInbC1DNlP/VNXZx5FBjUlm1Dc6jj6WySeaeKlpMSsq26AUm
         jo+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744239074; x=1744843874;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QZ/B0L4XT9ckYcnWqWd+FYUUzdafyMad+IsfhzlV93I=;
        b=F0llg3HDcRVtt4OIg3krKiIyYwhQz6edwss05aqNgNuXEpaD/Y50xrqjkm8okR5JR5
         YGcIt4kfNGkOnr35TFfR842hiJgpkSVku9CC9nekgopYAneu85O+F2I7hI4Q5i3DOM/w
         YVhpmxbp9scWqdjdOACPFp9Hb9LZijqXsBpcLXHZL8keGS8ns/3xfU3gN+lNIrdSLy/F
         oRt0TaueMGAPAP6wciTSczRdSvg8fST+N2N2/9WwIMwTbhnBSyuzB2dwTTaSfFahEYhB
         yP5uOIY2hPHPcVfyQ++yRWcgHgsNkZD6yjfl6IoNg7GfZ1OPfjDEU0N6/qEjzBVCruq4
         ZcRw==
X-Forwarded-Encrypted: i=1; AJvYcCVwoVm4XtuUdTC0GpKJp8/jW7vKQUiEtU2Ggs9+m0Wz7XWhA/gWafnQMZ+BWdAv4Y4HXaXcbMLrAtQ4bTk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM49CZWevrm/xYWOpKczGCPdT3+xxm4aMC3fGuxiI9C9cEtbyc
	5FVDthVxzhbci6F6Ljphb/zICT9yNAKsi+8A2v4qbbmX998Dqz7/wT9dUy0A+q6c35kn5Mg/xuZ
	C4+5QnTBsQWCVQg==
X-Google-Smtp-Source: AGHT+IF30TW5whnI4CSUwU1CGW/+/3jw3T0xQadcX1hhvsgA4bTndeNNWjh+nPIxuL0NprAJAPVI2q+EqQWyi1o=
X-Received: from pfblr31.prod.google.com ([2002:a05:6a00:739f:b0:739:9e9:feea])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3908:b0:725:96f2:9e63 with SMTP id d2e1a72fcca58-73bbef81e6emr885624b3a.24.1744239074384;
 Wed, 09 Apr 2025 15:51:14 -0700 (PDT)
Date: Wed,  9 Apr 2025 22:51:11 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250409225111.3770347-1-tjmercier@google.com>
Subject: [PATCH v2] alloc_tag: handle incomplete bulk allocations in vm_module_tags_populate
From: "T.J. Mercier" <tjmercier@google.com>
To: surenb@google.com, kent.overstreet@linux.dev, akpm@linux-foundation.org
Cc: janghyuck.kim@samsung.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"

alloc_pages_bulk_node may partially succeed and allocate fewer than the
requested nr_pages. There are several conditions under which this can
occur, but we have encountered the case where CONFIG_PAGE_OWNER is
enabled causing all bulk allocations to always fallback to single page
allocations due to commit 187ad460b841 ("mm/page_alloc: avoid page
allocator recursion with pagesets.lock held").

Currently vm_module_tags_populate immediately fails when
alloc_pages_bulk_node returns fewer than the requested number of pages.
When this happens memory allocation profiling gets disabled, for example

[   14.297583] [9:       modprobe:  465] Failed to allocate memory for allocation tags in the module scsc_wlan. Memory allocation profiling is disabled!
[   14.299339] [9:       modprobe:  465] modprobe: Failed to insmod '/vendor/lib/modules/scsc_wlan.ko' with args '': Out of memory

This patch causes vm_module_tags_populate to retry bulk allocations for
the remaining memory instead of failing immediately which will avoid the
disablement of memory allocation profiling.

Reported-by: Janghyuck Kim <janghyuck.kim@samsung.com>
Fixes: 0f9b685626da ("alloc_tag: populate memory for module tags as needed")
Signed-off-by: T.J. Mercier <tjmercier@google.com>
Acked-by: Suren Baghdasaryan <surenb@google.com>
---
 lib/alloc_tag.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index 1d893e313614..25ecc1334b67 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -422,11 +422,20 @@ static int vm_module_tags_populate(void)
 		unsigned long old_shadow_end = ALIGN(phys_end, MODULE_ALIGN);
 		unsigned long new_shadow_end = ALIGN(new_end, MODULE_ALIGN);
 		unsigned long more_pages;
-		unsigned long nr;
+		unsigned long nr = 0;
 
 		more_pages = ALIGN(new_end - phys_end, PAGE_SIZE) >> PAGE_SHIFT;
-		nr = alloc_pages_bulk_node(GFP_KERNEL | __GFP_NOWARN,
-					   NUMA_NO_NODE, more_pages, next_page);
+		while (nr < more_pages) {
+			unsigned long allocated;
+
+			allocated = alloc_pages_bulk_node(GFP_KERNEL | __GFP_NOWARN,
+				NUMA_NO_NODE, more_pages - nr, next_page + nr);
+
+			if (!allocated)
+				break;
+			nr += allocated;
+		}
+
 		if (nr < more_pages ||
 		    vmap_pages_range(phys_end, phys_end + (nr << PAGE_SHIFT), PAGE_KERNEL,
 				     next_page, PAGE_SHIFT) < 0) {
-- 
2.49.0.504.g3bcea36a83-goog

