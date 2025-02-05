Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493D422AE4E
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 09:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738747708; cv=none; b=iYp0kVbhIqhz9cNXiAbYRinUNWNXo1gek4YV9zLWfDR6pgQQxeKzZ9oVydfECVMZXsl2UnaisgiW/eB/X3mSnaLwgPa54DNOJG5FPv7dRXeHacp/K4CwUkbzPWAhs7kFAcB+zMMGGvyukApAoVzg4eYGsrSulrjoBjk0wr34OX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738747708; c=relaxed/simple;
	bh=COzovgz55oiFlywVeq1OO7mG8nLNBb5YtLKNQVd6/2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=nC2SNORRoYeV1dQG2FL2F/1Pole+CGXS/0ilv+lhVQSQigq4L/ug2zTNMNvPxlsnwb+UWOhpDqPiLmCAU8bjulwJMLRqC6q4nhBDLgr/BYnh6gNJhr3AqNtWuzR6bW2u2NwPRNQryTbskhQgP3U0XPb7OvEsgq3lBSc/e04fgbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DczsXbZD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DczsXbZD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738747706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v1QWMGz/t53y8nWqSpKCm2XX0aS+6vebfqdvYfQONWo=;
	b=DczsXbZDbwDCg7eQ6Y3idG5xc+LKZ/12Knh7E1JgkOiXiw8Ckz9TgnaZXOqz9bzWvjSuHq
	G8WLeBDtJNGqFBErgO52ux4Bxbi7AaEQ7IrQBmNlYBTpviUs1aPPkCbbA20aKlI2eqQJfC
	j9NcWnQ35wWKgygBWuRxQB4hIo69Ipg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-368-2cv8CABvMBWC8Bt0PVaXnw-1; Wed,
 05 Feb 2025 04:28:22 -0500
X-MC-Unique: 2cv8CABvMBWC8Bt0PVaXnw-1
X-Mimecast-MFC-AGG-ID: 2cv8CABvMBWC8Bt0PVaXnw
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EBDC8195608C;
	Wed,  5 Feb 2025 09:28:20 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.72.112.190])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 36D32300018D;
	Wed,  5 Feb 2025 09:28:16 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	ryncsn@gmail.com,
	chrisl@kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 11/12] mm/swapfile.c: remove the incorrect code comment
Date: Wed,  5 Feb 2025 17:27:20 +0800
Message-ID: <20250205092721.9395-12-bhe@redhat.com>
In-Reply-To: <20250205092721.9395-1-bhe@redhat.com>
References: <20250205092721.9395-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Since commit eb085574a752 ("mm, swap: fix race between swapoff and
some swap operations"), the non_swap_entry() checking has been taken
off from function __swap_duplicate(). Hence, in the kernel-doc comment,
the line 'swp_entry is migration entry -> EINVAL' is obsolete. Remove
that line to avoid misleading people.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/swapfile.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 93fd12c12bba..12bb7556c7f1 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3525,7 +3525,6 @@ void si_swapinfo(struct sysinfo *val)
  * Returns error code in following case.
  * - success -> 0
  * - swp_entry is invalid -> EINVAL
- * - swp_entry is migration entry -> EINVAL
  * - swap-cache reference is requested but there is already one. -> EEXIST
  * - swap-cache reference is requested but the entry is not used. -> ENOENT
  * - swap-mapped reference requested but needs continued swap count. -> ENOMEM
-- 
2.41.0

