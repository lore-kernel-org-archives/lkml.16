Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D521189915
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744835092; cv=none; b=BY07tTYEWLCjyuzCzin7trCOMhP87A+3jmKsqZ6fOctLyp6otXi4j6X+PLNSxLW7XFE9JR4nqWtLoM1RUQhNeRKh2fVmgiB4eJDKIuvqSZynWzLkbtaPBwAAEGWQus2Ma/BWrqLySi5wQjbzU7H2M6nejDRtAzxc7EL75keXTXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744835092; c=relaxed/simple;
	bh=UoVArrvvhwt6nCyqZeqrxlVsp4O86V4QRNxYAeGzaV4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SgE0iH+4NpXKXPWDfX4fbn9vfj5IXOlR+oRg8lwWLPRASCBiUJgnsqMLlxb0y+JR4LZ0dIHgz0Bf8ddSbgeIXzU7ipJxYAi3CtVgIsvCNkHf5KSsxUvzhk/66e3hl8fDxSXtkxhhfZTqH1RV6Yq21UDfuNnqGIxthaJZq7GKQjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Sx1/0BHX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sx1/0BHX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744835089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ju14Dd13F13ROmOuZTdiY+l+wLgVYj/IyRazcIBWaZc=;
	b=Sx1/0BHXavDhIKRE4NEmBkEcn8ooZEl5Vkk+m47AJjLiz/btO4yp+cKr9XJBm/TNJXKKNn
	+YbggsrHvbfpOlcKNcGXFITcx4voaau5O0KFW1A2hwTugspRsSuAIVlYhK+CUrEORwwke4
	QFmbfqgJBjfGRgkGhPv5tpnn6ikUmRY=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-424-_emr5mBXOv-MMGo6lEAlDg-1; Wed,
 16 Apr 2025 16:24:48 -0400
X-MC-Unique: _emr5mBXOv-MMGo6lEAlDg-1
X-Mimecast-MFC-AGG-ID: _emr5mBXOv-MMGo6lEAlDg_1744835086
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A0BC11955DCE;
	Wed, 16 Apr 2025 20:24:46 +0000 (UTC)
Received: from omen.home.shazbot.org (unknown [10.22.88.22])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F3D6D1800965;
	Wed, 16 Apr 2025 20:24:44 +0000 (UTC)
From: Alex Williamson <alex.williamson@redhat.com>
To: 
Cc: Alex Williamson <alex.williamson@redhat.com>,
	Salvatore Bonaccorso <carnil@debian.org>,
	Milan Broz <gmazyland@gmail.com>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH stable 6.1] mm: Fix is_zero_page() usage in try_grab_page()
Date: Wed, 16 Apr 2025 14:24:39 -0600
Message-ID: <20250416202441.3911142-1-alex.williamson@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

The backport of upstream commit c8070b787519 ("mm: Don't pin ZERO_PAGE
in pin_user_pages()") into v6.1.130 noted below in Fixes does not
account for commit 0f0892356fa1 ("mm: allow multiple error returns in
try_grab_page()"), which changed the return value of try_grab_page()
from bool to int.  Therefore returning 0, success in the upstream
version, becomes an error here.  Fix the return value.

Fixes: 476c1dfefab8 ("mm: Don't pin ZERO_PAGE in pin_user_pages()")
Link: https://lore.kernel.org/all/Z_6uhLQjJ7SSzI13@eldamar.lan
Reported-by: Salvatore Bonaccorso <carnil@debian.org>
Reported-by: Milan Broz <gmazyland@gmail.com>
Cc: stable@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: Sasha Levin <sashal@kernel.org>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 mm/gup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/gup.c b/mm/gup.c
index b1daaa9d89aa..76a2b0943e2d 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -232,7 +232,7 @@ bool __must_check try_grab_page(struct page *page, unsigned int flags)
 		 * and it is used in a *lot* of places.
 		 */
 		if (is_zero_page(page))
-			return 0;
+			return true;
 
 		/*
 		 * Similar to try_grab_folio(): be sure to *also*
-- 
2.48.1

