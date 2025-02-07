Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789226AA7
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 02:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738896653; cv=none; b=JmwNZPNghHHxUcsvdeWbzq6gpVOhpM50vEMtrMOFsr1gZofBfv6IBtbnZYeEqud43uqSX0LjvQ+wJx3jmi0IwYigP3WYTX3ZphkYKLrd1r9+iaMMY23+YrSgVh1vfP7bMmrKUyRG0A6TLE1foWqz+ZwyNOZxkj9PZDsUfp2Vm0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738896653; c=relaxed/simple;
	bh=1/3hMEZQXqwwD/qWm/PqtY2iFma3Cyp6l+SmVQ+V86Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ghc2TVtKCnefZKvqFuQQwllzQzsKXrofNFjlACxoesjCrx/vNB5UjNxSrWQpRkZ65Ar5r2ygeSVz3KmdmZ6/I7pLTnJdibFK+lqUWugQw3aW6ziZ15PzF/tf0f0dfaVM9S7dJ+hcrw3CtWbu4UwXe4HThUEjctKc/Mug+np//Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RSvbH9Wp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RSvbH9Wp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738896650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lSgV3BL74gNbeFl9iKEmyG8+Z3L9756kZ4NrKNCbbCQ=;
	b=RSvbH9WpJYZylSYx2SK23iqG4zVxW/1G6+IfEqmZoliOP1A5pHENdilUILIs4qKoFZt26s
	vRQjefRZmbm/NVKIF6M/q425r2bhB5PYV1evpQiBpbxLFvY1/htMHgU6jvh6Xj6b0Rhkbn
	bajXT3Jvmih9+NKxz89B5iRwA7Oxd/8=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-153-uIHSDNPlNPuaAtaJ3LBx8Q-1; Thu,
 06 Feb 2025 21:50:46 -0500
X-MC-Unique: uIHSDNPlNPuaAtaJ3LBx8Q-1
X-Mimecast-MFC-AGG-ID: uIHSDNPlNPuaAtaJ3LBx8Q
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 479D31955DD0;
	Fri,  7 Feb 2025 02:50:43 +0000 (UTC)
Received: from localhost (unknown [10.72.112.206])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DDB4D19560AE;
	Fri,  7 Feb 2025 02:50:41 +0000 (UTC)
Date: Fri, 7 Feb 2025 10:50:37 +0800
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, ryncsn@gmail.com,
	chrisl@kernel.org
Subject: [PATCH v2 06/12] mm/swapfile.c: update the code comment above
 swap_count_continued()
Message-ID: <Z6V0/UvG1fvkQ4t/@fedora>
References: <20250205092721.9395-1-bhe@redhat.com>
 <20250205092721.9395-7-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205092721.9395-7-bhe@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Now, swap_count_continued() has two callers, __swap_duplicate() and
__swap_entry_free_locked(), the relevant code comment is stale.
Update it to reflect the current situation.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
v1->v2:
- Update the code comment according to Kairui's comment.

 mm/swapfile.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index bf284ba16198..f6cc169f59d9 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3789,8 +3789,8 @@ int add_swap_count_continuation(swp_entry_t entry, gfp_t gfp_mask)
  * into, carry if so, or else fail until a new continuation page is allocated;
  * when the original swap_map count is decremented from 0 with continuation,
  * borrow from the continuation and report whether it still holds more.
- * Called while __swap_duplicate() or swap_entry_free() holds swap or cluster
- * lock.
+ * Called while __swap_duplicate() or caller of __swap_entry_free_locked()
+ * holds cluster lock.
  */
 static bool swap_count_continued(struct swap_info_struct *si,
 				 pgoff_t offset, unsigned char count)
-- 
2.41.0

