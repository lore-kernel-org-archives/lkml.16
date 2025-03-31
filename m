Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73161D5AC0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743408843; cv=none; b=ocMAmv3wUCpcY0UqedhcvWn9LmvxayNicCdSNyTfOZKTy1LnlUa7bStjZOGDANU5plThArgSSVMpyxZhVjsJ3NlBooWr1kxmZ2ziz3Srwz8eXh0vRq+Bp0QNrgMG1EjpjE47ArDkxwfydFwuq7jEg+PtdP2KwZ41SosnvqTaMiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743408843; c=relaxed/simple;
	bh=vmpkGn5rjahnzOeZtKv2aLhN8RRqZzbgMwOA0k07LeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=rYdLbZg8z7MpfZFDwic2XeN5g0Z0BWMraCiwuhFqS94atLkPay8q8iTkWW95uN4OdeK9iStKhIbT640A7/Ubf0ipd0t+lAwvsZMJ669hmBwEwy1HWeOhMabz+s05EB3VfOCxGVO4VOJlFNkY+xAzslXAok1gsmPxTTVim898vg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g4KPGPZL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g4KPGPZL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743408840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PPZQrdeQpegE/jTUY4XQbbWwgsN0SFY5JA/aTu23ar8=;
	b=g4KPGPZLwX4z9g+tozztejwsG9UUNp9ft0p85v6ZtM3Z4quqjpYdM5/4ZjA6j30SMJH6ql
	VxEMfFQ21vM60LW8AYg99T/tl31zwNfgIlO1HTeSI+iUFPIZnQEKyu/zfcBkdZqL0I56JQ
	NebbUwBdScUB2c1RjFkrwFJKdW30eAQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-529-bLJlnPblMYyLaxsQv9gwtA-1; Mon,
 31 Mar 2025 04:13:57 -0400
X-MC-Unique: bLJlnPblMYyLaxsQv9gwtA-1
X-Mimecast-MFC-AGG-ID: bLJlnPblMYyLaxsQv9gwtA_1743408836
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C468019560B6;
	Mon, 31 Mar 2025 08:13:55 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.9])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4D8321955BF1;
	Mon, 31 Mar 2025 08:13:51 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	yanjun.zhu@linux.dev,
	Baoquan He <bhe@redhat.com>,
	x86@kernel.org
Subject: [PATCH v2 5/7] x86/mm: remove pgd_leaf definition in arch
Date: Mon, 31 Mar 2025 16:13:25 +0800
Message-ID: <20250331081327.256412-6-bhe@redhat.com>
In-Reply-To: <20250331081327.256412-1-bhe@redhat.com>
References: <20250331081327.256412-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

pgd huge page is not supported yet, let's use the generic definition
in linux/pgtable.h.

And also update the BUILD_BUG_ON() checking for pgd_leaf() in
pti_user_pagetable_walk_p4d() because pgd_leaf() returns boolean value.

Signed-off-by: Baoquan He <bhe@redhat.com>
Cc: x86@kernel.org
---
 arch/x86/include/asm/pgtable.h | 3 ---
 arch/x86/mm/pti.c              | 2 +-
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 7bd6bd6df4a1..5f4fcc0eea17 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1472,9 +1472,6 @@ static inline bool pgdp_maps_userspace(void *__ptr)
 	return (((ptr & ~PAGE_MASK) / sizeof(pgd_t)) < PGD_KERNEL_START);
 }
 
-#define pgd_leaf	pgd_leaf
-static inline bool pgd_leaf(pgd_t pgd) { return false; }
-
 #ifdef CONFIG_MITIGATION_PAGE_TABLE_ISOLATION
 /*
  * All top-level MITIGATION_PAGE_TABLE_ISOLATION page tables are order-1 pages
diff --git a/arch/x86/mm/pti.c b/arch/x86/mm/pti.c
index 5f0d579932c6..c2e1de40136f 100644
--- a/arch/x86/mm/pti.c
+++ b/arch/x86/mm/pti.c
@@ -185,7 +185,7 @@ static p4d_t *pti_user_pagetable_walk_p4d(unsigned long address)
 
 		set_pgd(pgd, __pgd(_KERNPG_TABLE | __pa(new_p4d_page)));
 	}
-	BUILD_BUG_ON(pgd_leaf(*pgd) != 0);
+	BUILD_BUG_ON(pgd_leaf(*pgd));
 
 	return p4d_offset(pgd, address);
 }
-- 
2.41.0

