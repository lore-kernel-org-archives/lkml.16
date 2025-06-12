Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48E4A944
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 00:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749689693; cv=none; b=PxfK1xco0bo6Rfmggdtr5nYiC09lh6W3LD1qFr/EE/SIILIzTVSIbTAbVrdLYNj12g7zxRSTlJwd+7uk8UWK/GhJDU+qMNnnotpWI2LzaAsRwzoILDT/If9yUA7JOEpeXeDB+RuJI0dLEpytzzutN/vQogEL5gsR9n9zoQotIdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749689693; c=relaxed/simple;
	bh=2VzaAVlX3a2JRfB1zcgJaXGKGONF5JA11nPAvAauC78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n/qFUqKkrePd1eglE+87u8FK5zed2EZ3VWHx6BuXk3SOCwT+j4ghq5G9gt1XcFozewTG1PEfg/gJRCRHhYVuwPLLvP9yV4iumqIP7XiIDZ+de6CvWMaDd/gNC0OgyUIqtgfEpYabwXLnDPxJinOhYcUjgq13NDMFIUhvMopiNyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDdq3vbC; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDdq3vbC"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-710fe491842so2877647b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 17:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749689691; x=1750294491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2fUUqs/XpYTeiuvaMR/iruzFVVmJmbYnkY1yHeBufYc=;
        b=HDdq3vbCmSU0IrZtCS/wMAHwdk3R5bBRsxG48Ou+QT29y+3tItjOxswKc4QlubEXwS
         iv/ZjYfYW3gdUYiF+Zw/64otg8Ph9wTPbkJ/X5VFqQnUSYFa6XnB3vkS8Ftt/hLcxk1q
         GywqazL6T3WrHdbaZ8M4JqsKxSw9fHJyrYlI64Pj5NHqPJ13STkXr+aimWzfr+ERXILN
         acq0Pd8ncoXHxk3CWQj5Wq/Isncpu5Sr1wo3NUTMXzOY/JiTctFyax+IG5xdPIXK2d2t
         WHolcsTTadYc6uZmTGzlWKgpx9bE4dEoHfzc/iW8OiE0v3x5RCpYjvMWz1OD0npQC0MM
         OyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749689691; x=1750294491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2fUUqs/XpYTeiuvaMR/iruzFVVmJmbYnkY1yHeBufYc=;
        b=Q5o9O9XEQgugw5y68RcCgSuaaNuXClASs6dpiC0sB5OHfE/3/S/0GDuWLHpYamxOMf
         5T6QqHi4L+fTQqECxH7YRbIr9OYP1y0MVbF53CXqlwGc1ZO3LlaijhFu/b6rQQ63A88K
         n3jE16iNuv0Sc4A6ZHO/Cwqb4CaINFqHS1c8srU5BD87GKoWLjNHm1O+fnWdd+f6BVtm
         rRCPKf11mUqjpI3iCg1E0AoNHnd2DIlEsX/8/FH86/GzlhByt5iRxIpYDFULXsHIDVun
         KsYxYVLXktJJO/9B7LGa9pJo5kzg0H8Xe/A1GMlyKyyMCEhAKvWoBZpWvL09DN1QjfQQ
         O6qg==
X-Forwarded-Encrypted: i=1; AJvYcCWMwxJoRB/b1Uf/611Akd6QDTfJrF6UklOT24BxgTvi/is1NKCvjs24hXR7BYuTsExvBcx5FZid1eLNlbw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwTS/ee2jBX0chyGC3vSwnjE60Hlt+62Id/bYHFWjVH26a5uph
	6qYiWR4Gs5jmieCgI6rEj4hsJU0LkjFv4fl+rhIqbYbY4R8bjiNgdL2Hf0Cwbg==
X-Gm-Gg: ASbGncvu6mWcqRlgpZI9JCP3AlQ+gjRwLX7C8gsnanDsQjQbLUXFcibgNoEdN61Cpya
	qG4J3NPXiosM9Aa71NzfBdAQr5GekczD275saTD81aJdULGIcS0yVNIcOBBtKBWg4eJMYuOWOXO
	Wh5dhZvVYVCThJC2ykZt6/o7MiD+r4P1jTOlvXclznawfKoFtqZM+dnqwUMep4iZlcdgD5ZinH+
	322/94GJP4yn3MueT7aLNir0l2PmDZo4tAw9p8y/fGON8jFIy62oAbmIJ7UJxoN/qN0u2O8sDfN
	lXmNplG//xl6fChfWTTHh6OHyB/3LaZV60XpxpSWE85UYx0pDjUG0lkBQujg1g==
X-Google-Smtp-Source: AGHT+IG5NLQFvPtZw/QWvMDoBBWNPKGwX6hYI+y6Hv1yv8CtXApA4KCOUhXbnZyc0GUJi+Y74mRIAg==
X-Received: by 2002:a05:690c:7406:b0:6fb:b8a1:d3bb with SMTP id 00721157ae682-71140ad37f4mr79746807b3.17.1749689690726;
        Wed, 11 Jun 2025 17:54:50 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:43::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7115208a300sm976267b3.34.2025.06.11.17.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 17:54:50 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: mawupeng1@huawei.com,
	akpm@linux-foundation.org,
	mike.kravetz@oracle.com,
	david@redhat.com,
	muchun.song@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [RFC PATCH] mm: hugetlb: Fix incorrect fallback for subpool
Date: Wed, 11 Jun 2025 17:54:41 -0700
Message-ID: <20250612005448.571615-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <diqz7c1iw9vx.fsf@ackerleytng-ctop.c.googlers.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 11 Jun 2025 08:55:30 -0700 Ackerley Tng <ackerleytng@google.com> wrote:

> Joshua Hahn <joshua.hahnjy@gmail.com> writes:
> 
> > On Tue, 25 Mar 2025 14:16:34 +0800 Wupeng Ma <mawupeng1@huawei.com> wrote:
> >
> >> During our testing with hugetlb subpool enabled, we observe that
> >> hstate->resv_huge_pages may underflow into negative values. Root cause
> >> analysis reveals a race condition in subpool reservation fallback handling
> >> as follow:
> >> 
> >> hugetlb_reserve_pages()
> >>     /* Attempt subpool reservation */
> >>     gbl_reserve = hugepage_subpool_get_pages(spool, chg);
> >> 
> >>     /* Global reservation may fail after subpool allocation */
> >>     if (hugetlb_acct_memory(h, gbl_reserve) < 0)
> >>         goto out_put_pages;
> >> 
> >> out_put_pages:
> >>     /* This incorrectly restores reservation to subpool */
> >>     hugepage_subpool_put_pages(spool, chg);
> >> 
> >> When hugetlb_acct_memory() fails after subpool allocation, the current
> >> implementation over-commits subpool reservations by returning the full
> >> 'chg' value instead of the actual allocated 'gbl_reserve' amount. This
> >> discrepancy propagates to global reservations during subsequent releases,
> >> eventually causing resv_huge_pages underflow.
> >> 
> >> This problem can be trigger easily with the following steps:
> >> 1. reverse hugepage for hugeltb allocation
> >> 2. mount hugetlbfs with min_size to enable hugetlb subpool
> >> 3. alloc hugepages with two task(make sure the second will fail due to
> >>    insufficient amount of hugepages)
> >> 4. with for a few seconds and repeat step 3 which will make
> >>    hstate->resv_huge_pages to go below zero.
> >> 
> >> To fix this problem, return corrent amount of pages to subpool during the
> >> fallback after hugepage_subpool_get_pages is called.
> >> 
> >> Fixes: 1c5ecae3a93f ("hugetlbfs: add minimum size accounting to subpools")
> >> Signed-off-by: Wupeng Ma <mawupeng1@huawei.com>
> >
> > Hi Wupeng,
> > Thank you for the fix! This is a problem that we've also seen happen in
> > our fleet at Meta. I was able to recreate the issue that you mentioned -- to
> > explicitly lay down the steps I used:
> >
> > 1. echo 1 > /proc/sys/vm/nr_hugepages
> > 2. mkdir /mnt/hugetlb-pool
> > 3.mount -t hugetlbfs -o min_size=2M none /mnt/hugetlb-pool
> > 4. (./get_hugepage &) && (./get_hugepage &)
> >     # get_hugepage just opens a file in /mnt/hugetlb-pool and mmaps 2M into it.
> 
> Hi Joshua,
> 
> Would you be able to share the source for ./get_hugepage? I'm trying to
> reproduce this too.
> 
> Does ./get_hugepage just mmap and then spin in an infinite loop?
> 
> Do you have to somehow limit allocation of surplus HugeTLB pages from
> the buddy allocator?
> 
> Thanks!

Hi Ackerley,

The script I used for get_hugepage is very simple : -) No need to even spin
infinitely! I just make a file descriptor, ftruncate it to 2M, and mmap
into it. For good measure I set addr[0] = '.', sleep for 1 second, and then
munmap the area afterwards.

Here is a simplified version of the script (no error handling):
int fd = open("/mnt/hugetlb-pool/hugetlb_file", O_RDWR | O_CREAT, 0666);
ftruncate(fd, 2*1024*1024);
char *addr = mmap(NULL, 2*1024*1024, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0);
addr[0] = '.';
sleep(1);
munmap(addr, 2*1024*1024);
close(fd);

Hope this helps! Please let me know if it doesn't work, I would be happy
to investigate this with you. Have a great day!
Joshua

Sent using hkml (https://github.com/sjp38/hackermail)
