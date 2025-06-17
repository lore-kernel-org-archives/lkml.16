Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D362DFF05
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175053; cv=none; b=oOSwrTNxBWkyHGXd1IaQIX12fwVElvyedy7S08xzm870Mn0Tew3HFqdm1kt4qfWfUzu7NGUvsyGM0O5gb5G46sqVlHm56flf4YU5r67+H243Ooc4ZBueatyTCJI+LkfiQCPRWbY5/7Pwg69KiOIIPcwUv67+C/kLEwjRwjhI4OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175053; c=relaxed/simple;
	bh=8LbU7WHsSEUDC9XyX0d6DQNa5JIUja8IK4JgIC3/fqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eAgBCu0f1bsqZ1vf1mWP5p3GNFKgV9EF7Fz0kEcIXPJfj7qn8iZUwUJOz04zVSZFhgtUh85vkiF/JW/ei+gA1S5I2WaEI+GLzv98qLcxmxyFAn7rUTDDZjjZgNbIaNkN9ZNrEADzRjUVph3xOjhNzjpwfQlQX1eeg+S/qRhOJGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eQZv2OlI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eQZv2OlI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750175051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VPSX3LBtUNEGTHSkguHJQ+rqsVYvGpTDP2rR8uKdQH8=;
	b=eQZv2OlIC1FKlMF7ram8GaWB464GI5OTZj9cu4zaY660Y0vAb8tPPv6t7BqxXcQnuLwGFe
	cVH/vOxOCqAigFNEHzLpPfs6hCEAJwKlyfhhnzWvQBO4MOp8jbI1b2fZg7Q8JiKnSTnKq3
	MO7ftmkzMDwUTAVbXOuUqKtLFU1pEV0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-_7AhdcPMPgWckoR3IWKGVw-1; Tue, 17 Jun 2025 11:44:10 -0400
X-MC-Unique: _7AhdcPMPgWckoR3IWKGVw-1
X-Mimecast-MFC-AGG-ID: _7AhdcPMPgWckoR3IWKGVw_1750175049
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f858bc5eso3623603f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175049; x=1750779849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VPSX3LBtUNEGTHSkguHJQ+rqsVYvGpTDP2rR8uKdQH8=;
        b=CIesRVM8c02lsKGBW3E4ZQgSFxbi5i8kNWhHH/4XXV1m3ayxijyoVUxOJm3M5Athb5
         PH1GWCcGZRhVDmbQdQ7SK4JueIwo2iBghEanR0KgzotObDaEcRhXGx15a1IDuP+D91Fg
         Hug+FPNEp8E+Ote4HjSn6kuJ2Iz1zVJfzc9ZhaaZkyMJkzLlOTiAuG2qMET6nem7xg2e
         dZQAkSmK2zMh/0qQUDw3kDlkwsD1UVlOrHkkngvgN7o/iGsbuO44oG3aqYSj/0s2PlNe
         3ghH/fcmDiDZB886tIrLzIVyUSiMdp6vEH3/QBwwxV2m0jZnNXfjwN2MV0Rkql0U+WsL
         nwjA==
X-Gm-Message-State: AOJu0YwuOCJ/KMBbMLpALLBO7AY+yyM+lHzb7AF6/AqNj9yZLmg4K52Y
	/6XHfVSbCCXRPgdBOjQEyer/6GOV11e8oMPR+ipoy7jDYLc6+YnR5y1ZG/TfIJktw/RIUNSKRgG
	t2Vt8ogmiL7y4it5TQnkpnp+RkS5wNl8Tl3jHHqePqJo5jyykW35MoQGj86chCXW3iAhSmx7ldp
	Br+dwBRaURpEYp2SViotUaVTFuHLctj7ggn3HG/JUG/iOq0jeZ
X-Gm-Gg: ASbGncsLdn1b5BEL+ezD+J5C2Y5WpeCfDEDW+fkB3J3Peixn949C49C87WXE+JTPzJk
	mdum8mAT8QELQYBCDvznlspNZ4YpJ1Z05rRAi5UZu9oei8kuQuoUAaUYPztRIB48pZ1XGmX/f9m
	5LHGMF/Xt4w6vDPMPVagC14jMCxtzSVRV9LJQ8/5insrw/GahRMhlfrpgVg/aqLFlarTNrwMauw
	ef9SaXu1TkHzjFindODbcSIrwJ6lRFUFdohJInmtrXtiAcqvZy17nYUZL+RZ4zJSg/QB5rvLAo/
	1MIahcoGVJu9E0s8ZLvHgpCaILfJSlptfrHG0NgSLEE0hVyYAJgXDjXjO4YeWGyDOWFRqjYapCn
	qVsOSSQ==
X-Received: by 2002:a5d:64c5:0:b0:3a5:2670:e220 with SMTP id ffacd0b85a97d-3a572e6b9ffmr8898823f8f.32.1750175049144;
        Tue, 17 Jun 2025 08:44:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHM5m+wJRDUa8DrC/K/257QBXTR6G19KsTYyK8OpbCkrMRqwW7zfUBGXG+Jg5gfXSGV5z4C0A==
X-Received: by 2002:a5d:64c5:0:b0:3a5:2670:e220 with SMTP id ffacd0b85a97d-3a572e6b9ffmr8898776f8f.32.1750175048645;
        Tue, 17 Jun 2025 08:44:08 -0700 (PDT)
Received: from localhost (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b1eb9bsm14491105f8f.69.2025.06.17.08.44.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 08:44:08 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	nvdimm@lists.linux.dev,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Alistair Popple <apopple@nvidia.com>,
	Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>
Subject: [PATCH RFC 09/14] mm/memory: introduce is_huge_zero_pfn() and use it in vm_normal_page_pmd()
Date: Tue, 17 Jun 2025 17:43:40 +0200
Message-ID: <20250617154345.2494405-10-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617154345.2494405-1-david@redhat.com>
References: <20250617154345.2494405-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's avoid working with the PMD when not required. If
vm_normal_page_pmd() would be called on something that is not a present
pmd, it would already be a bug (pfn possibly garbage).

While at it, let's support passing in any pfn covered by the huge zero
folio by masking off PFN bits -- which should be rather cheap.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/huge_mm.h | 12 +++++++++++-
 mm/memory.c             |  2 +-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 35e34e6a98a27..b260f9a1fd3f2 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -483,9 +483,14 @@ static inline bool is_huge_zero_folio(const struct folio *folio)
 	return READ_ONCE(huge_zero_folio) == folio;
 }
 
+static inline bool is_huge_zero_pfn(unsigned long pfn)
+{
+	return READ_ONCE(huge_zero_pfn) == (pfn & ~(HPAGE_PMD_NR - 1));
+}
+
 static inline bool is_huge_zero_pmd(pmd_t pmd)
 {
-	return pmd_present(pmd) && READ_ONCE(huge_zero_pfn) == pmd_pfn(pmd);
+	return pmd_present(pmd) && is_huge_zero_pfn(pmd_pfn(pmd));
 }
 
 struct folio *mm_get_huge_zero_folio(struct mm_struct *mm);
@@ -633,6 +638,11 @@ static inline bool is_huge_zero_folio(const struct folio *folio)
 	return false;
 }
 
+static inline bool is_huge_zero_pfn(unsigned long pfn)
+{
+	return false;
+}
+
 static inline bool is_huge_zero_pmd(pmd_t pmd)
 {
 	return false;
diff --git a/mm/memory.c b/mm/memory.c
index ef277dab69e33..b6c069f4ad11f 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -669,7 +669,7 @@ struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
 		}
 	}
 
-	if (is_huge_zero_pmd(pmd))
+	if (is_huge_zero_pfn(pfn))
 		return NULL;
 
 	/*
-- 
2.49.0

