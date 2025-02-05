Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD08621C187
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 23:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738797496; cv=none; b=NPhGBA+9lLCZAUD/r4U60RmM6KBp5LKf52Mc7VbiBCwcNfA4/rBDdxoAaDLMBZC41udfLZ+zOa41FFqPKl7uYVQuC/sVbbzzbKj6yhQb4cwf18fKeKHb3xpNobP73D3tHRwM19UcRAZBOlRqO74rE2h+NgQbqzb3sKu2brto9Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738797496; c=relaxed/simple;
	bh=kFcSzQugjI8f1XT2ZsNs4WHVykWp2kuPt9Rb3z6SNL0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KNnh+TBsb3tklwFHpwtd360BqAwriz5cR+CmAaeKhX016h+OFnGao17mC3afrDK0GO3/I2hDgm/E8PGTo9NIqDMp/gT8mN32ZPg391GI1hK/+SZU0MiAcbFyXVNfOVp7rv7e5klwJsu+L2V99/AxoQHXN8fC8TzDQVunbBNZX7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MEZhMhSZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MEZhMhSZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738797493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lxr7VZoBp9SRemPHjQq6QqkK5CRHvwkSMpiB9VkcVIg=;
	b=MEZhMhSZVARQNsVl4klM1abPs5b0oD2BnRsnwBremW5v93YuI60j0BN48hcHcIQK1hMBDV
	XXfH0Y0acAmgV/clzIwvZSVAdx7CpElmHEHhBwDxJ5sVAE+eLr/E4JGQJrzukRcVy9klMD
	0OqvNTtoC3bwPBlD3PsydPDlHPRrGr0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-655-wnlDHOwxOda7dsA9fSpD-g-1; Wed,
 05 Feb 2025 18:18:10 -0500
X-MC-Unique: wnlDHOwxOda7dsA9fSpD-g-1
X-Mimecast-MFC-AGG-ID: wnlDHOwxOda7dsA9fSpD-g
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EA90D1955E80;
	Wed,  5 Feb 2025 23:18:08 +0000 (UTC)
Received: from omen.home.shazbot.org (unknown [10.22.81.141])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6969B1800570;
	Wed,  5 Feb 2025 23:18:06 +0000 (UTC)
From: Alex Williamson <alex.williamson@redhat.com>
To: alex.williamson@redhat.com
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	peterx@redhat.com,
	mitchell.augustin@canonical.com,
	clg@redhat.com,
	akpm@linux-foundation.org,
	linux-mm@kvack.org
Subject: [PATCH 0/5] vfio: Improve DMA mapping performance for huge pfnmaps
Date: Wed,  5 Feb 2025 16:17:16 -0700
Message-ID: <20250205231728.2527186-1-alex.williamson@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

As GPU BAR sizes increase, the overhead of DMA mapping pfnmap ranges has
become a significant overhead for VMs making use of device assignment.
Not only does each mapping require upwards of a few seconds, but BARs
are mapped in and out of the VM address space multiple times during
guest boot.  Also factor in that multi-GPU configurations are
increasingly commonplace and BAR sizes are continuing to increase.
Configurations today can already be delayed minutes during guest boot.

We've taken steps to make Linux a better guest by batching PCI BAR
sizing operations[1], but it only provides and incremental improvement.

This series attempts to fully address the issue by leveraging the huge
pfnmap support added in v6.12.  When we insert pfnmaps using pud and pmd
mappings, we can later take advantage of the knowledge of the mapping
level page mask to iterate on the relevant mapping stride.  In the
commonly achieved optimal case, this results in a reduction of pfn
lookups by a factor of 256k.  For a local test system, an overhead of
~1s for DMA mapping a 32GB PCI BAR is reduced to sub-millisecond (8M
page sized operations reduced to 32 pud sized operations).

Please review, test, and provide feedback.  I hope that mm folks can
ack the trivial follow_pfnmap_args update to provide the mapping level
page mask.  Naming is hard, so any preference other than pgmask is
welcome.  Thanks,

Alex

[1]https://lore.kernel.org/all/20250120182202.1878581-1-alex.williamson@redhat.com/


Alex Williamson (5):
  vfio/type1: Catch zero from pin_user_pages_remote()
  vfio/type1: Convert all vaddr_get_pfns() callers to use vfio_batch
  vfio/type1: Use vfio_batch for vaddr_get_pfns()
  mm: Provide page mask in struct follow_pfnmap_args
  vfio/type1: Use mapping page mask for pfnmaps

 drivers/vfio/vfio_iommu_type1.c | 107 ++++++++++++++++++++------------
 include/linux/mm.h              |   2 +
 mm/memory.c                     |   1 +
 3 files changed, 72 insertions(+), 38 deletions(-)

-- 
2.47.1

