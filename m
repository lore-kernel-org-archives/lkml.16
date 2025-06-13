Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DA7279DDE
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 09:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749806830; cv=none; b=i98DxHtH1Gv58Zc5TGPbekovXtzx6x6lhl3ay+FuQQ4Y7xsXWv6kCPSpvgcW0ncZgjPAV3jwoKRprRMXEjo7LTa58gqYwNDHkLk84dvTxAO6iIQ7oR8tcnMo6tUL7c617Rx7OYkJTsD7F7fu+Uws7D7eDUcvtmZyvAhSssKxsa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749806830; c=relaxed/simple;
	bh=mhgTTIZZsefj8mnYxT3QFETIlhACxk/HMINCBYR2EQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pbkfEefDRaNbb8xLJwC4yx29qqvuMnXl5G1TlE4rq94iJpFRIFQMiAt9uUJeiypN3HrgKms+CH3BNKFGnX/M7Vyp8M+LsYbOPVnS1uweyVijEuGeXT6HGbpzjCujjcg8iTSwuNg81iL2PW1OC1kK32J79cU6mjw7mT0Tb9oy0+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mg/GtxPT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mg/GtxPT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749806828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eA9hGBugFKNk6aXi/MtXxZpnAai7SGsOuKl0QrS3BOQ=;
	b=Mg/GtxPTsl5cND2KFhWSqcEDCa3hQA7EkVtwBe6JRrJ1MIWcfyHWho44MoYTHjp3SbfXVo
	kbzdmyi3VxavJBbFFqQqRS+NovD4d9D2EHxDC9lAfjz6HtQeA2GoAGqy5+urHJ5POqJAqD
	f8HpjM6YW4KNYWEjaR+rK1ecedhd8QQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-jm9Ng9NePHuGaAgsutKziA-1; Fri, 13 Jun 2025 05:27:05 -0400
X-MC-Unique: jm9Ng9NePHuGaAgsutKziA-1
X-Mimecast-MFC-AGG-ID: jm9Ng9NePHuGaAgsutKziA_1749806824
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-451d5600a54so16869375e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 02:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749806824; x=1750411624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eA9hGBugFKNk6aXi/MtXxZpnAai7SGsOuKl0QrS3BOQ=;
        b=Z2rzO+jdRbx3nN2mOcBP9geysrB9rxQEWkkKUd9Apoo7jaJvtJUAHQzufkSWnGNJjv
         NVVTj1Cny7L4Mrkyi5DEbqoVd30Xg6WH8pVJt7/pnOLZbu0WCsjJznUQtjpag83bmMgH
         rx5oMitT1sXme11DKeZ3kB2YLwbT8QdMFHWOGNcfXmLf11Ge9xdZpCv9Lmvib3a4oZ9X
         ZumACDeNVuTNnashmCL+b8OGziY8c7PKUtejnxwMhJUfzx0wVMMkzGDSAxlhVqlOsdv7
         c7Abvm6VZi940VO0QH4RC6j7h5OfuNxO7tHnoMa/AHDMUtlWqpFdAEGMw35IHxj97ZVy
         CrvA==
X-Gm-Message-State: AOJu0Yy4jdp9J/hPXoUXczedTl8ISAllGlOQ48txxTe0zFGaS7c9yj/6
	/Pe4mV76BJntPxZTDlv3B04AMrF1SH94NqkJOEqPmIqYdiQMQdzqKK+DUpeIhgujQRg7RYtHGMp
	AzEN9w60tYdLXK8iJoFXjQU3DSMArzVrRDblWoG7xROL6j7IBk/aU5NBcrWWQ6AUCzUrTnxHwR/
	sGUjU2DBx7UMtoZHPPxvUK2d5InvBb7UJxl+lkbaK029pfFyy4
X-Gm-Gg: ASbGncsQdO6BXEEKEfcfDRYZp1cHsKfW0O92URj/L05DHOIDYT4Lybjuh/4wZC2wwo6
	AeG0jIkj4M904m0o99cJoHt95iTO85hNz6LRw8TRugrRRFFymx4Sn38jn/KJzuFkSyDhzq6lGTD
	vQYcBzgUCeCj9aXfwaMUQ3CLa8UD/bt8T5HgCFE1d+RqAUk4VdtzicOACr6NmbiVv7h5VNEl1aI
	2mf8FIAqWu9BYuLg+yFCiNI775GdR/9aTYinn2ZwmfMh1f3J/KJqZjzcIsuOlmmS0FDfLAeY4ej
	WWOPxJdbsC2YwrEROChipJl6SSwc5cAxjwg4Hj8ZwQz6P0ZolZPTh05c9fHTXnYciIMKIZ5iL/B
	V8oqsjpk=
X-Received: by 2002:a05:600c:1c19:b0:442:e9eb:cba2 with SMTP id 5b1f17b1804b1-4533499edc7mr24668215e9.0.1749806824406;
        Fri, 13 Jun 2025 02:27:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGERaE8MR+6/dmyK3cZQ7xtwJhWFU3zCcnVAfTUdbkGjRrz6rE1iR9ahL+Nyc7gnKqK2+FRCw==
X-Received: by 2002:a05:600c:1c19:b0:442:e9eb:cba2 with SMTP id 5b1f17b1804b1-4533499edc7mr24667655e9.0.1749806823907;
        Fri, 13 Jun 2025 02:27:03 -0700 (PDT)
Received: from localhost (p200300d82f1a37002982b5f7a04e4cb4.dip0.t-ipconnect.de. [2003:d8:2f1a:3700:2982:b5f7:a04e:4cb4])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568a73a7bsm1822993f8f.36.2025.06.13.02.27.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:27:03 -0700 (PDT)
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
	Dan Williams <dan.j.williams@intel.com>,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v3 0/3] mm/huge_memory: vmf_insert_folio_*() and vmf_insert_pfn_pud() fixes
Date: Fri, 13 Jun 2025 11:26:59 +0200
Message-ID: <20250613092702.1943533-1-david@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Based on mm/mm-unstable.

While working on improving vm_normal_page() and friends, I stumbled
over this issues: refcounted "normal" folios must not be marked
using pmd_special() / pud_special(). Otherwise, we're effectively telling
the system that these folios are no "normal", violating the rules we
documented for vm_normal_page().

Fortunately, there are not many pmd_special()/pud_special() users yet.
So far there doesn't seem to be serious damage.

Tested using the ndctl tests ("ndctl:dax" suite).

v2 -> v3:
* Added tags (thanks for all the review!)
* Smaller fixups (add empty lines) and patch description improvements

v1 -> v2:
* "mm/huge_memory: don't ignore queried cachemode in vmf_insert_pfn_pud()"
 -> Added after stumbling over that
* Modified the other tests to reuse the existing function by passing a
  new struct
* Renamed the patches to talk about "folios" instead of pages and adjusted
  the patch descriptions
* Dropped RB/TB from Dan and Oscar due to the changes

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
Cc: Oscar Salvador <osalvador@suse.de>

David Hildenbrand (3):
  mm/huge_memory: don't ignore queried cachemode in vmf_insert_pfn_pud()
  mm/huge_memory: don't mark refcounted folios special in
    vmf_insert_folio_pmd()
  mm/huge_memory: don't mark refcounted folios special in
    vmf_insert_folio_pud()

 include/linux/mm.h |  19 +++++++-
 mm/huge_memory.c   | 112 ++++++++++++++++++++++++++++-----------------
 2 files changed, 87 insertions(+), 44 deletions(-)

-- 
2.49.0

