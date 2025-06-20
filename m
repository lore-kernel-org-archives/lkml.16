Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07691CBEB9
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 19:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750446233; cv=none; b=YyznmdvPfzLhg5nhDWwS6XtEGKle76ZQHhXDukd7smhxe582zKqpNGN3V2jKqCznNkgVQT03+gsuoyDspN08NtIMMn41qazog0KAaCjVMJPLyQEwTCAjbvu96Nbpypl9R0qwOpjJUucNtYaUMm60NUrbju7xgogLZICzpy/V1o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750446233; c=relaxed/simple;
	bh=tm2Jtsr3mu6AhBzbEmc7bjfiTss5Qy0vup2pm/AFT8w=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=eJTHxHltjpqLkHYNu3eoN1fsN7dzfntpGWPsD6+OZr1ww3Ly98WYWq6VXRyj/sSSci76jys8wzSEQG+kZ5MMID9HIKjjbX3eQA5MARCEutR9SSEk/O6w9DF3xVLoo38Khc3fefgrt5swRFep6i2IQmoIp+v63djfkuAKm1VUWbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NA2XLuqB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NA2XLuqB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750446230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dUGtP2n8cbKQ5lAX7UXKt00TyIe26nbilcTxEZNSxWI=;
	b=NA2XLuqBYVO/WcxQzxzBCTBlYomljKWdC0RQzAONm3b+xcPK3ajXXEZ+qkQ9kaIEhYq8Z3
	yeUaDv6wWAXFN/dFgkmZnvKC6ih6FQ5MSAcBRazOhQx+I8sr6ssEEpITWefX3kX1DtOBjP
	9QMYLAqtOjZB2Xsu+u5g9+SyGWxGRnY=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-7h2VatphPjOeTRReU1f7IQ-1; Fri, 20 Jun 2025 15:03:49 -0400
X-MC-Unique: 7h2VatphPjOeTRReU1f7IQ-1
X-Mimecast-MFC-AGG-ID: 7h2VatphPjOeTRReU1f7IQ_1750446229
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-234b133b428so16716895ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 12:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750446228; x=1751051028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dUGtP2n8cbKQ5lAX7UXKt00TyIe26nbilcTxEZNSxWI=;
        b=Xu9ymyD3p6sF6hHE26x5G8jzoeKu9UpcwEbrntJXY8jVHHmH98Ve1ZDbv8/tdsmJif
         f3snnQlFEN5j4V2nb92EJAuv8oknQJtvqzs5QLpM66cLWm5IwuvfCaLfus1x9qJX381p
         Ewf42AAfmHVdazzvhuFpMZfbHaMWkUI4tjuFc0j0DE6gHSPP7Iz0imci4RagvRBaa9fR
         BSBsnoY8RXCBTqlrrx/Wop0dBNo1Gr0++9t6fa0tDml8Nlzua7aYnGEKqkTZOrISXzpG
         BeaKkiLR3KDwxAGXdcLDl3rmCYT3sfU21bzNcWe7f+owbw8zekm7xs11RAn7qdTsSGWg
         s4sA==
X-Forwarded-Encrypted: i=1; AJvYcCV1EfcLQ96thw+YHXO7hWCwZhXfM6sJINJi5KyMTyer8zF+GJyhccH5TqYY4qzDGKvAXeNv2gdRK+WMPyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDD2+ddpbT1rHadiQ8ssyYKarkqyPIm1FhuZKgRjvqG+xsAvdn
	De8lYJFd/iHaXYYh5wdAVndxPE2LbmifioDXDGW+ToBfdcyFUwDHNet77hr0fMQfOkgpb3+2P6b
	K1a72DoUEEu01dV3ZeXlAODe/sugGh0Qq/di5whwxNli0tcnkab7YCzpZ6W3lJkzkmA==
X-Gm-Gg: ASbGncuUnBPifzwbh2x8Il5VRiLl3H/Uqv3WOThLxvzTW8rxMwn4nzY7dAPV/JL1J1n
	03KtgFcDH8pzgV6yzXzmMN60LmMxHY3UOMu4LWACbE38BmBzbBSMLy6T+l9AXkSbFB1jGj+9U5F
	lKqtQbS/698UQbKfAgGH3NHlU01j+ZdBEkTR8QkYanUPLk0RxvdXnDkX6IPwMck/J1OZIAVJNqH
	2uyTvEHYzAMfoBHSAxW44vtwJgC2k2EnwaIIgRUtFBDSx9+ZrQ7PFTs99xMbcxRWcbQR6n+7ESa
	O9nJHgIccm8=
X-Received: by 2002:a17:903:988:b0:234:cc7c:d2e2 with SMTP id d9443c01a7336-237d97c89d0mr55547585ad.1.1750446228439;
        Fri, 20 Jun 2025 12:03:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIprR2hIy8ljR+9gmTCa6DaaTxi47lCYb0fcSWA4gJP+7N78JTWg2K1+N08CEwxd3l9Bfi8Q==
X-Received: by 2002:a17:903:988:b0:234:cc7c:d2e2 with SMTP id d9443c01a7336-237d97c89d0mr55547145ad.1.1750446228011;
        Fri, 20 Jun 2025 12:03:48 -0700 (PDT)
Received: from x1.com ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8609968sm24235535ad.136.2025.06.20.12.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 12:03:47 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Nikita Kalyazin <kalyazin@amazon.com>,
	peterx@redhat.com,
	Hugh Dickins <hughd@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	David Hildenbrand <david@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	James Houghton <jthoughton@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: [PATCH 0/4] mm/userfaultfd: modulize memory types
Date: Fri, 20 Jun 2025 15:03:38 -0400
Message-ID: <20250620190342.1780170-1-peterx@redhat.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[based on akpm/mm-new]

This series is an alternative proposal of what Nikita proposed here on the
initial three patches:

  https://lore.kernel.org/r/20250404154352.23078-1-kalyazin@amazon.com

This is not yet relevant to any guest-memfd support, but paving way for it.
Here, the major goal is to make kernel modules be able to opt-in with any
form of userfaultfd supports, like guest-memfd.  This alternative option
should hopefully be cleaner, and avoid leaking userfault details into
vm_ops.fault().

It also means this series does not depend on anything.  It's a pure
refactoring of userfaultfd internals to provide a generic API, so that
other types of files, especially RAM based, can support userfaultfd without
touching mm/ at all.

To achieve it, this series introduced a file operation called vm_uffd_ops.
The ops needs to be provided when a file type supports any of userfaultfd.

With that, I moved both hugetlbfs and shmem over.

Hugetlbfs is still very special that it will only use partial of the
vm_uffd_ops API, due to similar reason why hugetlb_vm_op_fault() has a
BUG() and so far hard-coded into core mm.  But this should still be better,
because at least hugetlbfs is still always involved in feature probing
(e.g. where it used to not support ZEROPAGE and we have a hard-coded line
to fail that, and some more).  Meanwhile after this series, shmem will be
completely converted to the new vm_uffd_ops API; the final vm_uffd_ops for
shmem looks like this:

static const vm_uffd_ops shmem_uffd_ops = {
	.uffd_features	= 	__VM_UFFD_FLAGS,
	.uffd_ioctls	= 	BIT(_UFFDIO_COPY) |
				BIT(_UFFDIO_ZEROPAGE) |
				BIT(_UFFDIO_WRITEPROTECT) |
				BIT(_UFFDIO_CONTINUE) |
				BIT(_UFFDIO_POISON),
	.uffd_get_folio	=	shmem_uffd_get_folio,
	.uffd_copy	=	shmem_mfill_atomic_pte,
};

As I mentioned in one of my reply to Nikita, I don't like the current
interface of uffd_copy(), but this will be the minimum change version of
such API to support complete extrenal-module-ready userfaultfd.  Here, very
minimal change will be needed from shmem side to support that.

Meanwhile, the vm_uffd_ops is also not the only place one will need to
provide to support userfaultfd.  Normally vm_ops.fault() will also need to
be updated, but that's a generic function and it'll play together with the
new vm_uffd_ops to make everything fly.

No functional change expected at all after the whole series applied.  There
might be some slightly stricter check on uffd ops here and there in the
last patch, but that really shouldn't stand out anywhere to anyone.

For testing: besides the cross-compilation tests, I did also try with
uffd-stress in a VM to measure any perf difference before/after the change;
The static call becomes a pointer now.  I really cannot measure anything
different, which is more or less expected.

Comments welcomed, thanks.

Peter Xu (4):
  mm: Introduce vm_uffd_ops API
  mm/shmem: Support vm_uffd_ops API
  mm/hugetlb: Support vm_uffd_ops API
  mm: Apply vm_uffd_ops API to core mm

 include/linux/mm.h            |  71 +++++++++++++++++++++
 include/linux/shmem_fs.h      |  14 -----
 include/linux/userfaultfd_k.h |  58 ++++-------------
 mm/hugetlb.c                  |  19 ++++++
 mm/shmem.c                    |  28 ++++++++-
 mm/userfaultfd.c              | 115 +++++++++++++++++++++++++---------
 6 files changed, 217 insertions(+), 88 deletions(-)

-- 
2.49.0

