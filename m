Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6B34A1A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744684805; cv=none; b=amENPX/MbZIlmjtuzyzFIKIxWldm697ttcnGF4jqdUl8yPDuZQ1Sn+wR1/AXW5h9+d8MkMNh9vvMi4KtLRH+QY1QEOhbnz7WLFznleMwp18cb4MSzUSBpJDl02d03QH7NKfXXcvtk7SJQ8Cis8M+EqiMXSTYEcHfeO78BfVcalU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744684805; c=relaxed/simple;
	bh=zmyGW7nnE9IfqPiCVgIcudwREHpLxcXa/RdpJBCMmG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=X2U+BQSxhqTtNDYUJzNqV4bR6rSDi2/HqKaKUoXue27UM1dk+b51xi1ZG9m1tsjPGNnySEe2i/aBi5xUNYdrlo78Akc04buUHsO2uWZmjbSoxV+S94zYE2CbnN2a2zWu3xCrHqYbi5fmfSSmt3S9iNQU+A9HBtghpsJ8bFrCvaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WIAR5Hk+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WIAR5Hk+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744684803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KGnioOMmv6OyfbCTLY55/D6l/d/MCWL5kGiG+ELKw6E=;
	b=WIAR5Hk+5VoBzwFSCm/q5Ncbuc+WzzmsJ/dyqTqUxlxoXRYJTljmwLnL0v94KMjtR3GJ00
	Nk61SHzSZ29TAH2FiXfjPP94APz+RYKx1DYiIffwVarMeXeK8cMVOFTWNIgmzONCGuREYT
	Gc9cZJEUOBrZgRTOs88goFeqK7ZpcPQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-190-Z6xDKEfEMsi0QbvDThn5Yw-1; Mon,
 14 Apr 2025 22:40:01 -0400
X-MC-Unique: Z6xDKEfEMsi0QbvDThn5Yw-1
X-Mimecast-MFC-AGG-ID: Z6xDKEfEMsi0QbvDThn5Yw_1744684800
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A7FA419560B8;
	Tue, 15 Apr 2025 02:39:59 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.37])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BCC93180B487;
	Tue, 15 Apr 2025 02:39:56 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	urezki@gmail.com,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 0/5] mm/vmalloc.c: code cleanup and improvements
Date: Tue, 15 Apr 2025 10:39:47 +0800
Message-ID: <20250415023952.27850-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

These were made from code inspection in mm/vmalloc.c.

Baoquan He (5):
  mm/vmalloc.c: change purge_ndoes as local static variable
  mm/vmalloc.c: find the vmap of vmap_nodes in reverse order
  mm/vmalloc.c: optimize code in decay_va_pool_node() a little bit
  mm/vmalloc: optimize function vm_unmap_aliases()
  mm/vmalloc.c: return explicit error value in alloc_vmap_area()

 mm/vmalloc.c | 68 +++++++++++++++++++++++++---------------------------
 1 file changed, 32 insertions(+), 36 deletions(-)

-- 
2.41.0

