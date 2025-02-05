Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CA322A4E8
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 09:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738747659; cv=none; b=WUQKQIo8bsPHYW1BCC00YRWkOAIs2d/zIQyTZlN6+MatFgg0gTTR9dQTK1IbQKkj5uNbJ6cUZdNaDCFyujQKBwXmFxKsQ2GtV6PuUU4yvP/4Xfg5/S0jSVF9JxvjoMNoknXcUAmPOcWzphTue1ER9i4acF0VaiLRrxlaKkYcHC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738747659; c=relaxed/simple;
	bh=4sqPBBU3PDIva/oCstaXY/fnwWrNCL0z3X+VcxGyXxI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=iwqaVq5YlvQqaTjV1/JflLNaiIgNS0qnOZoa8P7FG1wcjS55blJJcirUOZcG6p7IDYLcgV7jLUQ/OMaecXAkes+Zr/0fyf0YoY2K3AO6AZnGxSpnduEBqRKG7flJE3n6LVwaIvvQ3kXYaSO/3bZ6U4/o3vAgNxbMAZr6ngur90E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FKM7FCHi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FKM7FCHi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738747656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=udG9+laK+uUZMD8jN8ijQhsqCJJoP5nWkg2HggZb944=;
	b=FKM7FCHi4483iCHC1bLfRYqVeHtCV+pDFExNBbsKB+9xEKtkKkTLwmpA4JyLdQw1I/vQik
	JukzXCXl1rfAj90IAagORHcS3akprEnp/QsZnPfWqDSmzaU5P5m8mrmFlcgpC8T/W4MoNf
	YruNz+G9cfxV8asDYCS0ymGdVnDJRxM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-471-imkvH1m4NIOwrfCPN_g60w-1; Wed,
 05 Feb 2025 04:27:30 -0500
X-MC-Unique: imkvH1m4NIOwrfCPN_g60w-1
X-Mimecast-MFC-AGG-ID: imkvH1m4NIOwrfCPN_g60w
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5B62A1800570;
	Wed,  5 Feb 2025 09:27:29 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.72.112.190])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 74309300018D;
	Wed,  5 Feb 2025 09:27:25 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	ryncsn@gmail.com,
	chrisl@kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 00/12] Tiny cleanup and improvements about SWAP code
Date: Wed,  5 Feb 2025 17:27:09 +0800
Message-ID: <20250205092721.9395-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

These are all made during reviewing and learning below patchset from
Kairui.

[PATCH v3 00/13] mm, swap: rework of swap allocator locks

Baoquan He (12):
  mm/swap_state.c: fix the obsolete code comment
  mm/swap_state.c: optimize the code in clear_shadow_from_swap_cache()
  mm/swap: remove SWAP_FLAG_PRIO_SHIFT
  mm/swap: skip scanning cluster range if it's empty cluster
  mm/swap: rename swap_is_has_cache() to swap_only_has_cache()
  mm/swapfile.c: update the code comment above swap_count_continued()
  mm/swapfile.c: optimize code in setup_clusters()
  mm/swap_state.c: remove the meaningless code comment
  mm/swapfile.c: remove the unneeded checking
  mm/swap: rename swap_swapcount() to swap_entry_swapped()
  mm/swapfile.c: remove the incorrect code comment
  mm/swapfile.c: open code cluster_alloc_swap()

 include/linux/swap.h |  7 ++--
 mm/swap_state.c      | 12 ++-----
 mm/swapfile.c        | 83 +++++++++++++++++---------------------------
 3 files changed, 37 insertions(+), 65 deletions(-)

-- 
2.41.0

