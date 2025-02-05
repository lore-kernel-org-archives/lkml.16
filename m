Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111ED22B8B1
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 09:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738747696; cv=none; b=FV/dc9/VA1FEjPJni2BjNL06CIjiGYt5+ANtSqPD6AGV8/QfwSiwjwUTIUCfs8VYJAms6TEmKq7co6l+8pYxyC90BIWASA2ISQ6UVhepBUoXvqIvYTQF1V8eb1dv4nhN56LDwrwawucDQ04yJt7TiLViS9DhCU7PzN/AUdRLgOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738747696; c=relaxed/simple;
	bh=2tr8cmcSyVR5q821duRqH1xcWSdZ38okRoTKi/rzdlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=ElzyjvSHuH66Ax9EFJ8ZCjoKx2UXbyUfvFwsdmvFNeSY3kRe76r1IBMeBW7ST7HKVaRxQjPYfEHUNu4/3gMXHVhEeXBf7O2RCIbZueiQWTA30z3g7QXS4Bx4o6HMuvpdtnIMxwjd8yF4StOhDTNHCFt0q8SEelAAPYBxG0rmaMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Stcs3UkU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Stcs3UkU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738747694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/m9fIb5RUGdXyEtpozVsgbTSVCO5CREUbIcsYzkG8Js=;
	b=Stcs3UkU65NhpfXVPryNll/whe7m9R91K4cktzI+kAxmQXeHQF7tSfTQ808EJGoz9z7BRP
	tofFEQyq8JzfUqJNFJqg9UXAPRqsQAzVlpAbJXEeM4476C1i1ZcpTaAi8u57P4Z/Wiq05d
	tp0kKxQQsc6Fa3FbCGC/jNss5mH0gtI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-461-ipAmL9EeOJ-YRtbTyRkJew-1; Wed,
 05 Feb 2025 04:28:12 -0500
X-MC-Unique: ipAmL9EeOJ-YRtbTyRkJew-1
X-Mimecast-MFC-AGG-ID: ipAmL9EeOJ-YRtbTyRkJew
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B3CBF1800871;
	Wed,  5 Feb 2025 09:28:11 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.72.112.190])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 000243000197;
	Wed,  5 Feb 2025 09:28:07 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	ryncsn@gmail.com,
	chrisl@kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 09/12] mm/swapfile.c: remove the unneeded checking
Date: Wed,  5 Feb 2025 17:27:18 +0800
Message-ID: <20250205092721.9395-10-bhe@redhat.com>
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

In free_swap_and_cache_nr(), invocation of get_swap_device() has done
the checking if it's a swap entry. So remove the redundant checking
here.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/swapfile.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 78b7329ad2c7..2a25ff5f31c8 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1784,9 +1784,6 @@ void free_swap_and_cache_nr(swp_entry_t entry, int nr)
 	bool any_only_cache = false;
 	unsigned long offset;
 
-	if (non_swap_entry(entry))
-		return;
-
 	si = get_swap_device(entry);
 	if (!si)
 		return;
-- 
2.41.0

