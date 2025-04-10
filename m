Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3D11F0E50
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744257455; cv=none; b=Wk0zektqQ1cjXThBOBg26eauTPZVAZ0Mnhf+/GTKqdUz4NNssnGckvdt28WOJZ75nRT/XuGWpmCLH/ch0sZFtTa8F4SojBCgPdw+mGakjMQV2ZkYUOmWFmndq2MQaCbFNaSHb0I9d8cX5YeXhFTLNjKkOnmWI25zhkBDMwEGeZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744257455; c=relaxed/simple;
	bh=TcK/ayql5qsEQJrTT+bKZBARW/uQyunG9m296qUtNEs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=DASwnjU1dVsYlecmE8zM8Jb0xl1+gIOD8lDrHJF4L6vYMnGl3m5DsIfy62PIyXT+M7oLVeSnup7SaTq8g+MnAjj+qYvbLkXgziYydmAGnjzy6/LQJAoMUjw2M411DLdIDH9k4n6600VCmhgKiOI5OJLOxthubzQVOzzIPBw8+Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c+4S1w4h; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c+4S1w4h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744257452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CiT2WlYj/3fGyAtdbQzd4KFmS0fPVbTqImfcUooLUaU=;
	b=c+4S1w4hzMb2hR5okMh9+AohTOzuoGdvTSH8f+fTkl91M/ne76pYA9R3tthRY25jffbQVF
	1UzSvMZ7yr4g8ebuLVkJab+6r/mDLij2zMsOxUTq+LlQSs/g4u3V0nDdMk7WVAIikUVl82
	QZPZOrXntXwzI4F/81KG7TZTcX88tT0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-599-vLY6ecL0NHSZsop-igExNw-1; Wed,
 09 Apr 2025 23:57:27 -0400
X-MC-Unique: vLY6ecL0NHSZsop-igExNw-1
X-Mimecast-MFC-AGG-ID: vLY6ecL0NHSZsop-igExNw_1744257446
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B711F1801A12;
	Thu, 10 Apr 2025 03:57:25 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.38])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3FDF519560AD;
	Thu, 10 Apr 2025 03:57:20 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	david@redhat.com,
	osalvador@suse.de,
	yanjun.zhu@linux.dev,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v4 0/4] mm/gup: Minor fix, cleanup and improvements
Date: Thu, 10 Apr 2025 11:57:13 +0800
Message-ID: <20250410035717.473207-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

These were made from code inspection in mm/gup.c.

v3->v4:
========
- Make patch 1 to fix the code bug in fault_in_safe_writeable();
- Add patch 4 to do the code optimization to make fault_in_xxx()
  functions own the consistent code style;
- Add reviewing tags from David and Oscar for patch 2;

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

Baoquan He (4):
  mm/gup: fix wrongly calculated returned value in
    fault_in_safe_writeable()
  mm/gup: remove unneeded checking in follow_page_pte()
  mm/gup: remove gup_fast_pgd_leaf() and clean up the relevant codes
  mm/gup: clean up codes in fault_in_xxx() functions

 mm/gup.c | 125 +++++++++++++++----------------------------------------
 1 file changed, 34 insertions(+), 91 deletions(-)

-- 
2.41.0

