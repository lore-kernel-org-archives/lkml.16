Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91F94A35
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 12:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743337053; cv=none; b=KVV/t0PU8HNgBF2VUM/PCilTfsEchr+xFZVBZfrRTWqdPCu8jK+R7NMXmdYsNvYjCda5tyiEZ2pe8O8qWfcoB8A7ZtbjBuJQBaj84/g8s5jJleu5PgVlmQ/t8QLGKzzGY/WcsS0GMB9IbRnOyn28WQDxYjfoxqMUdlRinptzxHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743337053; c=relaxed/simple;
	bh=LwPEQUPjOufCUvhfrHQY5uE3dHLLdMQnaZ/KvrLFTN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=MT0LstfqyLua5EZEPCJm//FkBKaj699uxbzT+gSj+8yB6AmzP546zoJ9ykSBT0trb6Gj/YVOiwULfPupQtsXe23YNkrTHDCwW173MDz+UjbmKpFNXEV5iIRrYS6ZVNq5Sa1z2cvWX2WWOO9LwTVUSA0bNMmn4isY3ulTauVJWjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aoGAMlws; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aoGAMlws"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743337050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j9Az519uIMSeoStYIonjRx1sA8hIlGX8qqLitI4z8DQ=;
	b=aoGAMlwsVYgqaNDMO9plQbGxu5DkcCwdTVNO4nP8tEDG/Rlh95x1gBqL7vukTH16EosLSJ
	BOw1EXnO/2WpHXPIniQe5+YRA2gbWdFW/BPjzX8X2kkzxQDbSU3NXRDMmAJpp2Nm1qa6ec
	TCOHKGBeF1c6xjUQ7zecCOw7DbaR9BA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-104-2U7PYASaNbGWFfX6E_s7eg-1; Sun,
 30 Mar 2025 08:17:26 -0400
X-MC-Unique: 2U7PYASaNbGWFfX6E_s7eg-1
X-Mimecast-MFC-AGG-ID: 2U7PYASaNbGWFfX6E_s7eg_1743337046
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9D9A61800257;
	Sun, 30 Mar 2025 12:17:25 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.17])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B07581801750;
	Sun, 30 Mar 2025 12:17:21 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 0/7] mm/gup: Minor fix, cleanup and improvements
Date: Sun, 30 Mar 2025 20:17:10 +0800
Message-ID: <20250330121718.175815-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

These are made when I explore codes in mm/gup.c.

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

