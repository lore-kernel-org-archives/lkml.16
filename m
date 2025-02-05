Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD1922ACDB
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 09:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738747664; cv=none; b=nBztgI2VXED9xNs1RP0vOVYKDh2gsH5LaN/jUjfNoiEkGqrFFTLAu2QFNmjNXOark/XVnFvoySIPWJxdS76mE7jXXpzgH/4xCFCObpTvKrzi7jMVXmif56T7xqrCSoIFI+GulTC2nnzQoq6dNr98NCd4PcSa1Gb2flgWEecWNiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738747664; c=relaxed/simple;
	bh=htxj+bWHENt32tzdhENMjig1Xiq7Vr7xxUAtVgbBj+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=ixp9VOiZ3uA3B8gNaU1B1hM+WpuXY0BfrCmBtmdVvA3JkR95wxWiUSDDh8GYZfiFGWTgwDkg5g/X+F6KuL9ZK2hU7McliLqAt1LDqu3Dy0FlFnnSuoJMuPsZxYfXiNKWA4yAnW6Y4XMM5WLJC+Zgaa3rZavfFCvk6O9BtOkGyBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AUm5kpmL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AUm5kpmL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738747661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PEv2tk/qqvPIGyGgURFAveF2/GO9Pp83Lj9RTkxNFck=;
	b=AUm5kpmLadP+EmKsRtd/OaTyC53H4X3NU/+cghB0qvfp5T6JxhmD5rPLpFv/A8N4YlGbTU
	dm54aCfXhIsN8F49//Aaf8LAYXjdglT4xTt+8yrocK4YrCci9XnTrGnWR7Nt9OeIqYLlDw
	vywjPHz7tMj8ZmB4xc3nKSs0wVzO1s4=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-502-U3GOdD5xNBmPUDlD5LmxzQ-1; Wed,
 05 Feb 2025 04:27:40 -0500
X-MC-Unique: U3GOdD5xNBmPUDlD5LmxzQ-1
X-Mimecast-MFC-AGG-ID: U3GOdD5xNBmPUDlD5LmxzQ
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DD8991956086;
	Wed,  5 Feb 2025 09:27:38 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.72.112.190])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 01736300018D;
	Wed,  5 Feb 2025 09:27:34 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	ryncsn@gmail.com,
	chrisl@kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 02/12] mm/swap_state.c: optimize the code in clear_shadow_from_swap_cache()
Date: Wed,  5 Feb 2025 17:27:11 +0800
Message-ID: <20250205092721.9395-3-bhe@redhat.com>
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

Use ALIGN to achieve the same effect and simplify the code.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/swap_state.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/swap_state.c b/mm/swap_state.c
index 59acb55174c8..d7cbf5bb2450 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -270,9 +270,7 @@ void clear_shadow_from_swap_cache(int type, unsigned long begin,
 		xa_unlock_irq(&address_space->i_pages);
 
 		/* search the next swapcache until we meet end */
-		curr >>= SWAP_ADDRESS_SPACE_SHIFT;
-		curr++;
-		curr <<= SWAP_ADDRESS_SPACE_SHIFT;
+		curr = ALIGN((curr + 1), SWAP_ADDRESS_SPACE_PAGES);
 		if (curr > end)
 			break;
 	}
-- 
2.41.0

