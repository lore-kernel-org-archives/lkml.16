Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538E6194AD5
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 18:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750961841; cv=none; b=mPEzHRzkA8zeyV8NydiJiOzEjDcmp63kytlp91XwlhQo50cGUVqQGXxfoa/i/9t8nOF7MfJ02RBuOLPpSpjpKs1G3O9kLMfrtQYrvEJlyNJogDAwkwEWfDYaFxRNjz2vDvc+64eeOxTmgy1qJkwx0OhTYpWY1iL4niLgn7K3FSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750961841; c=relaxed/simple;
	bh=iOmxvFnEFFGhlD+5wY32EGkkPUSZLlM06+79Svozo3o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EaeHu5KMlMW6LdGaI+Yx38TguheCAmVjEHTVbvVzVDU9swNbfoWEpGt9koM1DmHw+dJgodjl3rpzpcV2Z7LN2zyeb/sVeAmgceQp++zXHqZFhgeMHaSE4sZHUZJ3J1Shlef68R1jgRBfEGsP7iyO/F+jWhFcsnkD8W/YTeN9RVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JOg2h26J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JOg2h26J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750961838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jniFdNQO494F+zvVO/jVUG0YDZpnfkeojlpbeN+g9xU=;
	b=JOg2h26JAJlGwyLvxFEryEKA1a3Ohsgv8S+aVa2qCW+LI2Wj4tCBK9Au4dg7AAo2E3+EAK
	H19+zR/2QHLR7UwN1+M3YhgrlPp3k0faneHsQjmNiKMUk5EDQVhsaWY3H8FDcxyk4ni26o
	0i1LXswGPQBfSLCQIpTmmfY4PNMAPIw=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-44-4EhFUjdSMAOaRkKT-_rf4g-1; Thu,
 26 Jun 2025 14:17:14 -0400
X-MC-Unique: 4EhFUjdSMAOaRkKT-_rf4g-1
X-Mimecast-MFC-AGG-ID: 4EhFUjdSMAOaRkKT-_rf4g_1750961833
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A1D7F19560B9;
	Thu, 26 Jun 2025 18:17:12 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.64.64])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C2DC218003FC;
	Thu, 26 Jun 2025 18:17:10 +0000 (UTC)
From: Luiz Capitulino <luizcap@redhat.com>
To: david@redhat.com,
	willy@infradead.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lcapitulino@gmail.com,
	shivankg@amd.com
Subject: [PATCH 0/3] mm: introduce snapshot_page()
Date: Thu, 26 Jun 2025 14:16:50 -0400
Message-ID: <cover.1750961812.git.luizcap@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Hi,

This series introduces snapshot_page(), a helper function that can be used
to create a snapshot of a struct page and its associated struct folio.

This function is intended to help callers with a consistent view of a
a folio while reducing the chance of encountering partially updated or
inconsistent state, such as during folio splitting which could lead to
crashes and BUG_ON()s being triggered.

This series is on top of latest Linus tree (c4dce0c094a8).

Changelog
=========

RFC -> v1
  - Include <linux/page_idle.h> to avoid build error on sh arch

Luiz Capitulino (3):
  mm: introduce snapshot_page()
  proc: kpagecount: use snapshot_page()
  fs: stable_page_flags(): use snapshot_page()

 fs/proc/page.c     | 46 +++++++++++++++++++----------
 include/linux/mm.h | 20 +++++++++++++
 mm/debug.c         | 42 +++------------------------
 mm/util.c          | 72 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 127 insertions(+), 53 deletions(-)

-- 
2.49.0

