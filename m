Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605CE23C9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 03:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743995016; cv=none; b=jhLiYAUYfvRsbmqb+onced43OJioNSprSRgeufzJLb4Im9wbfVaHPxQqbBcA4u2FKH9zyHYmedRi0rXlBTeEBWdl5ppNNQ2yW8fJaj5tMnqKY3i7Tl/anXOv+ZZteBpU6HP1K8PnC5wK4ucbdeMMoppRWu7SSp1Zb/5zcODtlEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743995016; c=relaxed/simple;
	bh=fTlu5zMIWiov9oXR9pR1NkZa+LkJW7kkYEzDph2DPuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=qq6UY35/6WQc6G4vpMHdL/kkPYjYLLIyKxkR+E+TeerhGjtaalfKtzRtbp7JEMY4FNpP88Sec7otbI0kDtO6YpXXwAI3lkgjIdjzUZ/HmbZNSLRh1suPZuTeSFsRjYmoteSzasdE+FpZc66m4WR1kjND0SgvDt5Lq+/ajOQF6GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GqhfPtA1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GqhfPtA1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743995013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EP0dZBjz3bW8z+EH39QEGB1MxdOta1QFrqvD6gDN79U=;
	b=GqhfPtA1Cmc3zTy/MMef8fbBLwduBmZYF29abuoEb9oRtkyeSIfPVII4HYvqRw0h1xVpV1
	tjwfvzqv3L7/+y3A4fA6PuYRypkCn0997+NSkRJctgiE0d6tZiaJ1jmeYzqCidgcxjmBQ/
	uWGcZ6jBoAGltQFtNwh6sUINoOPqdJk=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-127-o_2yWg37M9-P3nYTSprhoA-1; Sun,
 06 Apr 2025 23:03:30 -0400
X-MC-Unique: o_2yWg37M9-P3nYTSprhoA-1
X-Mimecast-MFC-AGG-ID: o_2yWg37M9-P3nYTSprhoA_1743995008
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3A4521956048;
	Mon,  7 Apr 2025 03:03:28 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.15])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7294E180094A;
	Mon,  7 Apr 2025 03:03:20 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	osalvador@suse.de,
	david@redhat.com,
	mingo@kernel.org,
	yanjun.zhu@linux.dev,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v3 0/3] mm/gup: Minor fix, cleanup and improvements
Date: Mon,  7 Apr 2025 11:03:03 +0800
Message-ID: <20250407030306.411977-1-bhe@redhat.com>
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

v2->v3:
=========
- In patch 1, change to use local variable 'start' as a loop cursor
  in fault_in_readable() and fault_in_writeable() so that they have the
  consistent code style with fault_in_safe_writeable(). Doing this can
  avoid ugly long line caused by kinds of type cast (const char __user *). 
  Thanks to David who suggested two ways including this one, I found this
  is better when changing code.

- In patch2, changes to add VM_WARN_ON_ONCE() for both below chekcing
  because all external users of __get_user_pages() have done the
  checking in is_valid_gup_args() before calling __get_user_pages().
  Just adding these VM_WARN_ON_ONCE() in case, e.g internal setting
  wrong flags in kernel code. Thanks to David for suggesting this.

   - (gup_flags & (FOLL_PIN | FOLL_GET)) == (FOLL_PIN | FOLL_GET))
   - !!pages != !!(gup_flags & (FOLL_GET | FOLL_PIN))

- Drop
      - the old patch 3 of v2 because it's from misunderstanding;
      - the old patch 4, 5 of v2 because they have been merged into x86
        tip tree by Ingo;
      - the old patch 7 of v2 because it has been coverred in another
        thread. Thanks to David for telling the thread link.

- In patch 3, add reviewing tags from Oscar and David.

v1->v2:
==========
- In patch 1, I carelessly copied the fault_in_readable() as
  fault_in_writeable(). Thanks to Yanjun for pointing it out.

- In patch 2, I copied the code in follow_page_pte() to
  __get_user_pages() directly w/o adjustment which is done but not
  merged to patch. That failed testing taken by lkp test robot, thanks
  for reporting.

Baoquan He (3):
  mm/gup: fix wrongly calculated returned value in
    fault_in_safe_writeable()
  mm/gup: remove unneeded checking in follow_page_pte()
  mm/gup: remove gup_fast_pgd_leaf() and clean up the relevant codes

 mm/gup.c | 100 ++++++++++++++++---------------------------------------
 1 file changed, 28 insertions(+), 72 deletions(-)

-- 
2.41.0

