Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF02610C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743408824; cv=none; b=Y8da/sAqZqQLlhdAWbi8OJSGzlRDIK9at7zsCeh+OSqZZavIcYKPfZQlF8yc/MpZO/rl9BiA7F+YYoYxUrsUKy94m1r4E7Fekgk1JCfiy0Od+8kERS4PkdksCHPLDuNqejaek32gLUUQw9JiQ5+r2mrjLnOCj1cfH9bV5HhJgsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743408824; c=relaxed/simple;
	bh=2JiYrpBVl6XdvWKj7WaOEE8WJ6+5V+5El6+IWhvBs+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=dVD+Q4pTeMladquJkR16FvJdqD/yz99pdeRCxeAG6f7OZGZFjWQ2yIK4b6Gp2L4g5pw5EgbVXtYaJSodNHrqDHZ1Yq2XkjbUPn+tWYrHD4VMiiXy4Uem/WssjGZeAlFu/r2iZ9CcvFrvuZZExnQEL6TfkmAAnYW39QnAp5OuV0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Th8CXlfU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Th8CXlfU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743408820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=U1L4z4A5qQuRlFgaFIiqebIixA+hbv9JLJ45IqQcZKE=;
	b=Th8CXlfUqAy8+cx9ZmtRIUhTQ4xZ+c1ViFNayr8Bod0WGqH/RPY9EtyxUL3lDGuWcZ7LZ4
	90FZ+kIHAumoSB1bE0Rjyr4554kz65TGwIqa5wIxrW5215ktPHpGebVs5jz9HHjasOZOn6
	eXgGsrYxdY7lxK9lZZAIN6tyVVTk8wM=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-335-pGbmkiK7OkygVN7Kj_WL9g-1; Mon,
 31 Mar 2025 04:13:36 -0400
X-MC-Unique: pGbmkiK7OkygVN7Kj_WL9g-1
X-Mimecast-MFC-AGG-ID: pGbmkiK7OkygVN7Kj_WL9g_1743408815
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2008C1955DAC;
	Mon, 31 Mar 2025 08:13:34 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.9])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8A3141955BEF;
	Mon, 31 Mar 2025 08:13:30 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	yanjun.zhu@linux.dev,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v2 0/7] mm/gup: Minor fix, cleanup and improvements
Date: Mon, 31 Mar 2025 16:13:20 +0800
Message-ID: <20250331081327.256412-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

These are made when I explore codes in mm/gup.c.

v1->v2:
- In patch 1, I carelessly copied the fault_in_readable() as
  fault_in_writeable(). Thanks to Yanjun for pointing it out.

- In patch 2, I copied the code in follow_page_pte() to
  __get_user_pages() directly w/o adjustment which is done but not
  merged to patch. That failed testing taken by lkp test robot, thanks
  for reporting. 

Baoquan He (7):
  mm/gup: fix wrongly calculated returned value in
    fault_in_safe_writeable()
  mm/gup: check if both GUP_GET and GUP_PIN are set in
    __get_user_pages() earlier
  mm/gup: Fix the outdated code comments above get_user_pages_unlocked()
  mm/gup: remove gup_fast_pgd_leaf() and clean up the relevant codes
  x86/mm: remove pgd_leaf definition in arch
  x86/mm: remove p4d_leaf definition
  mm/pgtable: remove unneeded pgd_devmap()

 arch/arm64/include/asm/pgtable.h             |  5 --
 arch/loongarch/include/asm/pgtable.h         |  1 -
 arch/powerpc/include/asm/book3s/64/pgtable.h |  5 --
 arch/riscv/include/asm/pgtable-64.h          |  5 --
 arch/x86/include/asm/pgtable.h               | 15 ----
 arch/x86/mm/pti.c                            |  4 +-
 include/linux/pgtable.h                      |  4 -
 mm/gup.c                                     | 79 ++++----------------
 8 files changed, 15 insertions(+), 103 deletions(-)

-- 
2.41.0

