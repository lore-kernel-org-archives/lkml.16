Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816F5171C9
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039225; cv=none; b=RSoJYam6/AxTtfhXKsNCxmolcqbP/WwpP+Mv/7HcIuw1U8q+s1SwuOYiQrgSC2/grWXILnBj4nYGpTxUs4wh2OPUvodV/5gm82WQJBl72Nc3cVrSdXODY70dneN2iGBHb4bH00ujT6cFKPyR+S5VEbgKyAsLetkbZPXXPDQ1SW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039225; c=relaxed/simple;
	bh=5aBX8gOxGjJ04X+BmJBKe8spRL4893ZqmJXJooA8jNE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=I6vl0q9BkHEPc/OEURfbF8yxI6scXvCPRww33A3alROF9CbcEgsjxQHw5VNlqVFXsvVWjOcKw82TR3yNsI2UdwE1RRuFTZKtlnCW27s55WHjU7HIrvvvTXrEesFnHCA/jvmUVRskwf6OnmyRi9JOOvx6DNuA/1Ta4inYOUcYmbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UgSHixmw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UgSHixmw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751039222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0bdFHs9p3a9DLGABFFRxwJzNp5SY4wkEnyk5Yb2CJC0=;
	b=UgSHixmwA4DrbNE2ynV+vnNU6tYrU+TK04PSOxoS3vvCvxkpbQg143trJOYZN0QJC4nTxH
	zyIQ/VAUv5JO6jIniypbj4YqKmPKOJAmmW1rtNtBhSBWkavDftXjRaRaloCSQly+04nlWI
	JRczW6LQ/zFl0Qa2evk8Vwq+Ci2/d/8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-AWsUpHzwNiuAlnHgBu_mIA-1; Fri, 27 Jun 2025 11:47:00 -0400
X-MC-Unique: AWsUpHzwNiuAlnHgBu_mIA-1
X-Mimecast-MFC-AGG-ID: AWsUpHzwNiuAlnHgBu_mIA_1751039220
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fe182a48acso36509496d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039220; x=1751644020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0bdFHs9p3a9DLGABFFRxwJzNp5SY4wkEnyk5Yb2CJC0=;
        b=FvJyuLPBvyezl8Uvtt7ybCXU0zijE4DVLd1x1uih1lHpfefk2kX/xP0tKTRoWDPhcn
         S1NCynbfDs/rphJ3Uyfh4ZLqA0f2IPrB1IoBPk2+x5lzAW+VDDVLduHB3gUhiMqI4ua1
         hpgjBKOzCxtRsBnJ7jAQmFNU9ikOeCceMJFQmQLU3H1xAxaRyNt07voE1dRQZ7GLCFIU
         JvctP66bwRgyOntie+VX8jrARLlp4QRLIbf2KDjJd0CiNSRyl109bekR82dpWyyzGGgS
         0JcSXre/oFaAwKa6hOGps1uehkTeiHuusRvJ3wvnJume9L+EIIs+1sicdvgVciHDQY0m
         a4fA==
X-Forwarded-Encrypted: i=1; AJvYcCXUze/EOjZY/ZyZJ3AVsAeOlp8T4OI7wlgMCcX9idS2/UEX4skntbIkiaAeXv34phsT2Xy/6JmcuWeGyj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrO+NipdUuxIGY7VC/xi1BgH+lJskrVHyuD9WWEq003VlFwhFH
	+EKk9nYQOnhiy6CbBzKvVqZP/i65t51d8QFYFsSfn13ffs7Nq5IW0bKIJ53umYbcqHofvxwAJ2c
	IgwKZkSoj4oe2DW5vNYasLeUo8xQu0mSBJNYqW55ejTHgW/E6uBCBf93BQXjmRNX25g==
X-Gm-Gg: ASbGncsGuqLGIyNQGmHnvEiu6gUZDDw0gEjkbKkyfZkI/VC3jfJs9fBeYoSubmqZtBS
	78Ht7Fbu9VNTshamljBJ2knJWUw0twcK04uh4AhaxwyhkkI7/DYOJ7xJIT16+pAyFNoAYNa4hvZ
	TFUaiwCMZwzWh26qDnoSlV9uZyR3F0E0OP6A8uR5fcGPT5+fvf4sXSJJutSjY2F/qmpJU0rgVXT
	IhMLXlL59ib4rQ7NvKqXaDdBvtI8Y4Hx1GszywvoUFkIY91vaOJTx6stfIRYbKpwWklYNbV/cbn
	ft6hhH+PzsA=
X-Received: by 2002:a05:6214:5e02:b0:6f8:c773:26e with SMTP id 6a1803df08f44-6fd753ef035mr119155216d6.18.1751039220257;
        Fri, 27 Jun 2025 08:47:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG44eVw4vUj2kFFXrMBgV5/0Vh4Tk1pXdy+4X+Wqxm96LVr3x614NuzYADZbznjUe20Rx+BZw==
X-Received: by 2002:a05:6214:5e02:b0:6f8:c773:26e with SMTP id 6a1803df08f44-6fd753ef035mr119154796d6.18.1751039219759;
        Fri, 27 Jun 2025 08:46:59 -0700 (PDT)
Received: from x1.com ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772e4fddsm22296066d6.65.2025.06.27.08.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:46:59 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Muchun Song <muchun.song@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Houghton <jthoughton@google.com>,
	peterx@redhat.com,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Michal Hocko <mhocko@suse.com>,
	David Hildenbrand <david@redhat.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: [PATCH v2 0/4] mm/userfaultfd: modulize memory types
Date: Fri, 27 Jun 2025 11:46:51 -0400
Message-ID: <20250627154655.2085903-1-peterx@redhat.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[based on latest akpm/mm-new of June 27th, commit 9be7387ae43f]

v2 changelog:
- Patch 1
  - update English in commit log [David]
  - move vm_uffd_ops definition to userfaultfd_k.h [Mike]
- Patch 4
  - fix sparse warning on bitwise type conversions [syzbot]
  - Commit message updates on explanation of vma_can_userfault check [James]

v1: https://lore.kernel.org/r/20250620190342.1780170-1-peterx@redhat.com

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

 include/linux/mm.h            |   9 +++
 include/linux/shmem_fs.h      |  14 -----
 include/linux/userfaultfd_k.h |  98 +++++++++++++++++++----------
 mm/hugetlb.c                  |  19 ++++++
 mm/shmem.c                    |  28 ++++++++-
 mm/userfaultfd.c              | 115 +++++++++++++++++++++++++---------
 6 files changed, 207 insertions(+), 76 deletions(-)

-- 
2.49.0

