Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D304225785
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 21:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748985402; cv=none; b=nrgh0xxxOClXtNEQFOPP+SS0SnRFTY3SsRzZc6LX+t7Pa5zKCo5l9CmeQDQR9XGgjW9fooMovr+x5ifuWORN8Xhpp2zaUvNYflXGmKlgzvq1I0e9thiMxe5siO2tuox57FMvLOd0PGMnNKJjfkr7nqE06242sDSJg9rfBAni2K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748985402; c=relaxed/simple;
	bh=XoGH0h2IJWjwbQWxYS/rtN7yH92g+3vhD4JjuLqqPnw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fzkniwDvaLaHHuix82ib1IBF03//QQX565iswAR7+XQ11fHYG/ytrYiyeqJgPz2kp413Q2+CXar8F44TUBlnqGv/mZ+U4eO2CA+1f973XrsRkM38O7cZuzIvRm5xebpQVKK5PlnbWRnQlJKgHQME/u8ruIyHnj6pU8K2l1Km4lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h0b1My0/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h0b1My0/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748985399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=314MrEBwr4k+CUpKTmx4sCu/ScFWOUTeM6rdnwbV6hM=;
	b=h0b1My0/45QqcOKotHon+lMgJMjAWyt2g37J4BOUJjRSPO0Fn+R31iTgd8z59UQ7/9PXFb
	soccq/haFbZEJoIcImsfKZ5fwh0n+AoGm9/ZaEZuOJG2y82a1WbBE6+fRbDDuysBPNnMMH
	ycd2zTZQD7MRG/tJnMzdPt2/0vzfBlw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-qa_kDW3SNFCvNHllxD9bMw-1; Tue, 03 Jun 2025 17:16:38 -0400
X-MC-Unique: qa_kDW3SNFCvNHllxD9bMw-1
X-Mimecast-MFC-AGG-ID: qa_kDW3SNFCvNHllxD9bMw_1748985397
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450eaae2934so28310245e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 14:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748985397; x=1749590197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=314MrEBwr4k+CUpKTmx4sCu/ScFWOUTeM6rdnwbV6hM=;
        b=t2FYdSnjqi1aFGUhtCCMh+85dplF1cAaGtiavfVGHM5FgmMWVujFQc7nvcAmFGwdYg
         jFb+oalAWKREVj/6UgrO7lWgHiq3TpT6q9YIvn3VDxhe1ZN5yuisImtDDx1M82mCZojK
         2UKYBDpD79919oT3zfGlkK58iAVs/RnhX5XHnxBU7qsb1JTYa7B43bdXUYLfVDOcYZGF
         VPhvvyKqWmYkkQw+hYMXyw+dpGoT5BqZw5yhJMsIwZCP+u3A4gLpV0JVB9PpC9IhiD49
         ofv5W2gkJqsf9/HqzotsdrZaOAO6RjI8wdcXAuM0x3IqFoHmjkUGtYsZFT9WXHJ0P9sV
         wQRQ==
X-Gm-Message-State: AOJu0YxoCibTwa3Q6jdGCohMMDYakf0GB2UUwEPnGUADtBXESAE1FBOF
	ikVKFw9aniIb1fLONKU8QRtbOJVZKrvToVOcH17FG7Q3/0mt3Awc88g3a9+LPD64pVUHerdTIw4
	PzdIPYUTw8mGRzKWoEp2DNZPg46zfGCicLIA0v38pjh26pEU9kAhR16BhZ7nAC/cQovXBGMOCEO
	49ajB151GRP+lfX7kBi76GFLkmt9Y2GvCbgJPCVRa3eIf1O20HPUI=
X-Gm-Gg: ASbGnctcAl5EVFl6uB3NDnfTpwHOJFjmBbYGgRhwAaZ7hw0iXfDQb5kK885aGe84b+q
	ReRZy2jvp3l7vz4lgAMJRIW//WB5Di02KOhaOhtnE4JGljIcWppaGMNwdXs66yUoagXxYabF/yF
	QYO2z/4TayNVjcK8Q/TWM7ieB1b/brWILcdRgQA0JXsP9Kg9dCtRgU47PRYOGqfU0NrWWlwb2vi
	Ete/Z2N8CvKld91HcjtCVJdwpaqZSjuPlXzZEy1zQDO+uvfLIuA8u2UGZUp7Hv/nvQ6vxus4ziq
	hkGklC5BqIcG2qWqUTeM0O01/EDMmtGkCKYwHXrRxEIVGVYCnjgUFqzV3H1afGy0xs+24E5xRjJ
	MuGENlx8=
X-Received: by 2002:a05:6000:1a8a:b0:3a4:f379:65c4 with SMTP id ffacd0b85a97d-3a51d96b480mr197104f8f.45.1748985397195;
        Tue, 03 Jun 2025 14:16:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8kkzJnQJD0YMtEENpld5wUwUCJ3Dmqv/cCnKp6Z6c5loiuHX+OBpCRrySLipJK13BBXeN7A==
X-Received: by 2002:a05:6000:1a8a:b0:3a4:f379:65c4 with SMTP id ffacd0b85a97d-3a51d96b480mr197074f8f.45.1748985396684;
        Tue, 03 Jun 2025 14:16:36 -0700 (PDT)
Received: from localhost (p200300d82f0df000eec92b8d4913f32a.dip0.t-ipconnect.de. [2003:d8:2f0d:f000:eec9:2b8d:4913:f32a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4f009fd7csm19308738f8f.88.2025.06.03.14.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 14:16:36 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alistair Popple <apopple@nvidia.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH v1 0/2] mm/huge_memory: don't mark refcounted pages special in vmf_insert_folio_*()
Date: Tue,  3 Jun 2025 23:16:32 +0200
Message-ID: <20250603211634.2925015-1-david@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Based on Linus' master.

While working on improving vm_normal_page() and friends, I stumbled
over this issues: refcounted "normal" pages must not be marked
using pmd_special() / pud_special().

Fortunately, so far there doesn't seem to be serious damage.

This is only compile-tested so far. Still looking for an easy way to test
PMD/PUD mappings with DAX. Any tests I can easily run?

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Nico Pache <npache@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Dan Williams <dan.j.williams@intel.com>

David Hildenbrand (2):
  mm/huge_memory: don't mark refcounted pages special in
    vmf_insert_folio_pmd()
  mm/huge_memory: don't mark refcounted pages special in
    vmf_insert_folio_pud()

 include/linux/mm.h | 15 ++++++++++
 mm/huge_memory.c   | 72 +++++++++++++++++++++++++++++++++++-----------
 2 files changed, 70 insertions(+), 17 deletions(-)


base-commit: a9dfb7db96f7bc1f30feae673aab7fdbfbc94e9c
-- 
2.49.0

