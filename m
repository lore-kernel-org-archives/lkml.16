Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184D02EA163
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039232; cv=none; b=p5D2N1UmmpfalULFrwU4zk/9kkvVmX0gVNXDkpUx77ePJOZsmnUxy+23/J7pNSdvQ1h04JPnB1G0zWCJHe2Kq+lB6tjHRMVIINnWzX8ypIIbtlPzIg8v/SdnFOYef7/Qoap6ckECZo6w731pt2+kV7VeFNs/ckuJHC79H71YMVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039232; c=relaxed/simple;
	bh=9ZtPgZuS9uFslrXUQ1rcSbFCNR4aA6sb8TcVi4Z+HRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=igreh4fW2RCqMyUeAbLIk48TeqUfvXdQpCteynDoFbZy0skSe+G4kVpqpnlRTfrRxqanY83maDD0yenXOWyAdIG/xswSwgvVet3HuakqSZD591gZ0YzQCE6qH2QX7NizAIQ/o3gh+bwhGKMfq1dHEytUFcZ4b5zMWs4qzxa4G/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vk5KrW9I; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vk5KrW9I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751039230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2pTwEtrgahpBZLxew2/VEiH1EfjnhNlR4+CF1BwOTeU=;
	b=Vk5KrW9IEszFLTiZxAXai7oAwbnElfCrTXFJ33Jhz7MZosMQuobDurVZYQOP98AEjHRw8o
	XCbxM/+LDozMrawh73+IwpJvB7Ea/diXmt4pnMuKlm0DUjvCWwSZGZT/k49HmHLbVy2wtC
	Z81dq7H5fjuycmxw68GjDZAqkPZR6qg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-cSy7lidfP0uF3E5TnZgndw-1; Fri, 27 Jun 2025 11:47:07 -0400
X-MC-Unique: cSy7lidfP0uF3E5TnZgndw-1
X-Mimecast-MFC-AGG-ID: cSy7lidfP0uF3E5TnZgndw_1751039227
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fb1be925fbso35502866d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039227; x=1751644027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pTwEtrgahpBZLxew2/VEiH1EfjnhNlR4+CF1BwOTeU=;
        b=d0B+uaWExSAyaSioB8iMfkjSsk550GIbeJbF5UVDLNr2kWoC6uKv4QFXHh1UOZPGtH
         vzIPEtjrbQ8p8EsAC8QScEgn+j1tz8+J2cM4nVNruI55qzmPpmkpUdtSb9UM5eJpPFEK
         rbQBBgPDGLvWhsQK6mK7xtz3mdsBMUq5YS3+rdaT+q8PVsoeZRzN8BfG67d8nlXxxmOV
         xTnUd3DFPlGukEckrZinqDoqBULKhbQ8jCYOi6Dr8OizVAycGqsBOq7Z6pnIPNUA7UIQ
         DZlErQUtacvOhuBHojmYf46dJeLR0mpWF+6iZBKQlVJSo6IGdnXf/jjNCquebVTLGood
         BOdg==
X-Forwarded-Encrypted: i=1; AJvYcCW9ZMv4mWHThbFZajlfUApp1EZofg7+fkxEklgzG0JbV39FY7PFUrOrQjJUFm8amxvJIPkbyvas04YFbQI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd25UVDlTCaVlEZiUDw9P2WVWrvjumiScB4Q7Nyj4/0pRzwDjT
	cVuPIouxEgOUPKV7bB1p14ZQmiRQQ9QvFwBIaKXqfqyBPvP0zP9lPrWmDyXyDCW7DZORKrIUCac
	yzkD85GtCG8SMQguNB3vMbNdQJkiuLXEUkRvA+dibWrhuSJ3piCbvE3Qs+nsgz2QJjg==
X-Gm-Gg: ASbGnctQ/TO7G6gQxPNbzdde4BEShUwp8bFJGN50U3/8tHv4Pgvl3PciMRpk2Sz7mgS
	M/Py3RMjrJDg/yW3xApZ26Up5Jf4avgs/vLq8Xmb3Homd7hCAFrgI0uOk2u1o3LwWeB1ZKbgzC8
	VJMa1yV3jWrX0qdcX+uxiWPbo27TPd+FJUukC/GNddFR6IqT0V9BRGYvRUyk9H2mXmi6WB0fEbZ
	gU2yoCgm+U5WdORVqDgDJ/NtbjJzALOdz8IiW+uIyPYD2VlVo+9S5A4b2DGkh69ZYDvIOGIyYCT
	axYr0cL1UHE=
X-Received: by 2002:ad4:5ae3:0:b0:6f8:b73e:8ea5 with SMTP id 6a1803df08f44-7000233c759mr59425796d6.26.1751039226956;
        Fri, 27 Jun 2025 08:47:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1K53WVc8+zg900RTkXeBD9NJqIkartaxwzghCXbibLJ+g6fNpxQUnaJNDNiONSfRZ42vUYQ==
X-Received: by 2002:ad4:5ae3:0:b0:6f8:b73e:8ea5 with SMTP id 6a1803df08f44-7000233c759mr59425426d6.26.1751039226435;
        Fri, 27 Jun 2025 08:47:06 -0700 (PDT)
Received: from x1.com ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772e4fddsm22296066d6.65.2025.06.27.08.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:47:05 -0700 (PDT)
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
Subject: [PATCH v2 3/4] mm/hugetlb: Support vm_uffd_ops API
Date: Fri, 27 Jun 2025 11:46:54 -0400
Message-ID: <20250627154655.2085903-4-peterx@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627154655.2085903-1-peterx@redhat.com>
References: <20250627154655.2085903-1-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the new vm_uffd_ops API for hugetlb.  Note that this only
introduces the support, the API is not yet used by core mm.

Due to legacy reasons, it's still not trivial to move hugetlb completely to
the API (like shmem).  But it will still use uffd_features and uffd_ioctls
properly on the API because that's pretty general.

Cc: Muchun Song <muchun.song@linux.dev>
Cc: Oscar Salvador <osalvador@suse.de>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/hugetlb.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 11d5668ff6e7..ccd2be152d36 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5457,6 +5457,22 @@ static vm_fault_t hugetlb_vm_op_fault(struct vm_fault *vmf)
 	return 0;
 }
 
+#ifdef CONFIG_USERFAULTFD
+static const vm_uffd_ops hugetlb_uffd_ops = {
+	.uffd_features	= 	__VM_UFFD_FLAGS,
+	/* _UFFDIO_ZEROPAGE not supported */
+	.uffd_ioctls	= 	BIT(_UFFDIO_COPY) |
+				BIT(_UFFDIO_WRITEPROTECT) |
+				BIT(_UFFDIO_CONTINUE) |
+				BIT(_UFFDIO_POISON),
+	/*
+	 * Hugetlbfs still has its own hard-coded handler in userfaultfd,
+	 * due to limitations similar to vm_operations_struct.fault().
+	 * TODO: generalize it to use the API functions.
+	 */
+};
+#endif
+
 /*
  * When a new function is introduced to vm_operations_struct and added
  * to hugetlb_vm_ops, please consider adding the function to shm_vm_ops.
@@ -5470,6 +5486,9 @@ const struct vm_operations_struct hugetlb_vm_ops = {
 	.close = hugetlb_vm_op_close,
 	.may_split = hugetlb_vm_op_split,
 	.pagesize = hugetlb_vm_op_pagesize,
+#ifdef CONFIG_USERFAULTFD
+	.userfaultfd_ops = &hugetlb_uffd_ops,
+#endif
 };
 
 static pte_t make_huge_pte(struct vm_area_struct *vma, struct folio *folio,
-- 
2.49.0

