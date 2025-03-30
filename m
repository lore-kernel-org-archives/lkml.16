Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F1A19004B
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 12:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743337071; cv=none; b=pmvZgfLcDogbSkp5GKYNM1ER911zSXzUfl/16pT6pAMAxr/K/Jtr3YobxxQka+6LGIbSxuMdA7NGBzED8vG4F7UWmDL0dlnG80hXdnZIMIKTK1jfV4NVQLW8BdBcZHALLlga9UEN6O8KchEAESJO+Pr2r+eDSuAlEr5DHNQcmEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743337071; c=relaxed/simple;
	bh=8WbuReWn74hBEr1o+VvrMN/f//G44Uk2QZXGIXOHYww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=mpaI0f6nwF+hcnI0YVAPNkjvoByt4daLXYJoWDKCVx5Bo+2aLBgninMA7luC1awRk4ElUZhpxmwxZ0Jp4WMN+rNzrldELYZpem8HhlE6hFHFchlWCLZemppYLW6nNdIhCz5ZCj1CFTS9sYvgxUc/1r2SI0O1Zx8xwTYESTRvaAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G5F3o4FC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G5F3o4FC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743337068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7ECEhQdPvPexYB/Ok4Vzz5g2XDSSP0HaL/jTvOM1baE=;
	b=G5F3o4FCkwDUtQOV38YKkT08MXde0vvqMi2RvvbnyBqnW92bw7Bgvvzzx+EufaTb4bTOak
	L8BuyL7II0YwgM0OW3jadx68i1XlqjFyPYMbyykKiK2ioP9AmaNxHxIalhSwHri2gJjDmG
	H8ITzQacoXjbOzdTR8XPc56tClXKsk4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-541-SWtT2QNYNkS5LbpE4fkmHA-1; Sun,
 30 Mar 2025 08:17:46 -0400
X-MC-Unique: SWtT2QNYNkS5LbpE4fkmHA-1
X-Mimecast-MFC-AGG-ID: SWtT2QNYNkS5LbpE4fkmHA_1743337065
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A71F11809CA3;
	Sun, 30 Mar 2025 12:17:45 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.17])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0F745180094A;
	Sun, 30 Mar 2025 12:17:42 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 5/7] x86/mm: remove pgd_leaf definition in arch
Date: Sun, 30 Mar 2025 20:17:15 +0800
Message-ID: <20250330121718.175815-6-bhe@redhat.com>
In-Reply-To: <20250330121718.175815-1-bhe@redhat.com>
References: <20250330121718.175815-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

pgd huge page is not supported yet, let's use the generic definition
in linux/pgtable.h.

And also update the BUILD_BUG_ON() checking for pgd_leaf() in
pti_user_pagetable_walk_p4d() because pgd_leaf() returns boolean value.

Signed-off-by: Baoquan He <bhe@redhat.com>
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

