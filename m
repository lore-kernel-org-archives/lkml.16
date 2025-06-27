Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FBE2E92CA
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751040467; cv=none; b=Ht5cXht7OEAtFU2KdNoOsFpZ/I+7R1nzZ/x+WtVXwMYufjQ5W8fZ2L2m3gXLqXAVu15powCMMNtmQ3UuBrAwHXUVcVQXfY6MDSB6Ee9cjAV4IsWeSxgc4aVLIHs2c8nZuQ5pcpQ9F1JOHcWrzFv7SmQxbKkV9K9S28PbtgqyOq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751040467; c=relaxed/simple;
	bh=+jiBJ6+Cv73iKOrkU0LDOvCkv4bSR888HUljFXWo4BQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sOFoaxhK3u+8Lo4Ose2NqBFnVw42JFiBMPOGzM+Gv+/FqB4Zr2Sb9bjrdxGxc8wtiC5i7xA8X7sJhaI4Sovr+ZfjLePXrijrd6lDPCdHS76GZ7cE9ezB9i1vMLKpRDxFLhs4b2H29YbKSyuFDMEtT2FTzAbyHpCWvuKZfZgW/MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J3PsB4XM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J3PsB4XM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751040465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7Q+PeekvDh59KWGPbCvR5ACQ5LCiB4fdpxjRPrkbiCQ=;
	b=J3PsB4XMvn1Q+sQDLUlZy+tkZZ9BK/x9Dqh0SSqva+ClsiMAsmUdAM4Tp8fqPZKit/YH1w
	TCE4SN/SidOoaO6jhjkRV1CQJwchFS7bweMe3LofqxPV+rOa5gaioxEkpCOIzFxWNTDArA
	s1rFzHKeCtyT3Vxws55FBbioXZpIizM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-JBafAUaePGmfuP_j5Tp9vA-1; Fri, 27 Jun 2025 12:07:44 -0400
X-MC-Unique: JBafAUaePGmfuP_j5Tp9vA-1
X-Mimecast-MFC-AGG-ID: JBafAUaePGmfuP_j5Tp9vA_1751040463
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fad29c1b72so32287086d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751040463; x=1751645263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Q+PeekvDh59KWGPbCvR5ACQ5LCiB4fdpxjRPrkbiCQ=;
        b=k1ql2EtjJjsqyuzHurT2NxK4fLdezkc9VQHqMIntg6MS+IhYZrKbO5J/1COjQiyAF8
         T+KF7XIXegVyh1ijuIn/Z/c54aSzCPZNMR7UZB8DJo/38ay3s3MLssS4ssxJXzcMcpXq
         QlqCZPfyuy7Fyw3Ps1sXc4IBHE7ZhwfEt09uhisSepn1Yfvf0UTSVEYU6E744TAW2kGO
         yMHFNfeS/93w3z9zMZQkdtoJ2PlVkKpdwRZC4tiSEJwJMIsBWBmuSgQ3KrcJ558bBMZS
         PY51noXEuEWu6jO7F1gtJGQ1yNafxd2bvaijJ2C9ZftVa/gjg/Wx7C6jr6WZSSgJMhjE
         tYlg==
X-Gm-Message-State: AOJu0Yx22DhuLYNCQpqdar8jB3yRheaWGqF+ENrzAOaWSnhfKwkTlYxs
	sqbdX7DIR0cXrGqscsr5XBrF83id0vcjIJfsKvWtt3K2oFu7SgOjp7mxC/Jw74vlw9DJznouEaZ
	wl28UrUq47cqkl6T3++LwOZ6WYuMsLaPSP19uKAGui8y+9peP410WWE8yvzo64MaXgWPfMCMduR
	rZlZyQfUF2CslW8PwNq5ZR6gFZYWtdIWm/j91A/l2JoKWll/Y=
X-Gm-Gg: ASbGncsN+z3os4ISFe4BTG7VvOKUm4leG5Ns0/FXxX9ha5NlJRVuTNvcWb5BxAeZ+w2
	StnEEYKNOf+OJYrNu6P9HASb8TOROcP2nNhiiHi+aqfHtEwbSyW4DwW34aoeKefhIt6RCEko2kk
	ZN8GCCGM3C9RFSzB2nfu3mxD8bWGDMtu/MainsDijTpaKyBsaC4DNl4+v1iUl4GzozKUCSbTbAy
	ASSkaLAP51sOeJQQEGmx4z4UTHj3um2Fn6yQUVm3MLACc62nwY2Vt2Xf94jRurPvGKIDdNDrRzr
	OU1YHaHDEF4=
X-Received: by 2002:a05:6214:4283:b0:6fa:c99a:cdba with SMTP id 6a1803df08f44-7000165810bmr69878856d6.14.1751040462854;
        Fri, 27 Jun 2025 09:07:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR2WENa4pYauFQQfbF5bBH3hvcc36vwCQwdDDeTnXz1xb/qyr6ptUTGRahCVjdqIEJh3+U1Q==
X-Received: by 2002:a05:6214:4283:b0:6fa:c99a:cdba with SMTP id 6a1803df08f44-7000165810bmr69878186d6.14.1751040462239;
        Fri, 27 Jun 2025 09:07:42 -0700 (PDT)
Received: from x1.com ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7734122bsm22551026d6.57.2025.06.27.09.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 09:07:41 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: peterx@redhat.com,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Oscar Salvador <osalvador@suse.de>,
	Zi Yan <ziy@nvidia.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH] mm: Deduplicate mm_get_unmapped_area()
Date: Fri, 27 Jun 2025 12:07:39 -0400
Message-ID: <20250627160739.2124768-1-peterx@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Essentially it sets vm_flags==0 for mm_get_unmapped_area_vmflags().  Use
the helper instead to dedup the lines.

Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Jann Horn <jannh@google.com>
Cc: Pedro Falcato <pfalcato@suse.de>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Pedro Falcato <pfalcato@suse.de>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/mmap.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index 8f92cf10b656..74072369e8fd 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -871,9 +871,8 @@ mm_get_unmapped_area(struct mm_struct *mm, struct file *file,
 		     unsigned long addr, unsigned long len,
 		     unsigned long pgoff, unsigned long flags)
 {
-	if (test_bit(MMF_TOPDOWN, &mm->flags))
-		return arch_get_unmapped_area_topdown(file, addr, len, pgoff, flags, 0);
-	return arch_get_unmapped_area(file, addr, len, pgoff, flags, 0);
+	return mm_get_unmapped_area_vmflags(mm, file, addr, len,
+					    pgoff, flags, 0);
 }
 EXPORT_SYMBOL(mm_get_unmapped_area);
 
-- 
2.49.0

