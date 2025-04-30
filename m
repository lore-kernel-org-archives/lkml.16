Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C6F2D0AC7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 21:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746046813; cv=none; b=CVfsg4rgCiHx8di65RK45CQ2FPMAau+xjh5pvj0pc91Y4+ZYmlRiDQjFtdLmmXm7PlmKGYgwtGXqZQSZMpWmbpNy5L2N1hPGy4TFK/edDIFm1ngt7k1UAKnrVAMWPHYaAYq12HWuwyOKNOa5ueU7Y1JyEvg4JZpL7dj2OzIhr0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746046813; c=relaxed/simple;
	bh=uk2xviyq+Ect0iFU3c5Sru9bdCE3/joS1xAdgG559AI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZuUjJC7lktZRA7LhKWpxx5jnSXJ3cRBN3ecBY8iUHIZ6Nn5S89zhbjGuHA6iGqOgTrB3MyEzOv8hU1gRxwye0z38GpEoBuETo/tS+c6SZvDGOTegO2pt6es66gt+3Q3Mbav02B4Q4S/AmFwSia4GzQEanT5iDi6bsDuaqVWhHAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TixXlsv0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TixXlsv0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746046810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0eS5EzPLPDf4NOmbcZOp9LkboVWEGMgOO+wOKHpyiNY=;
	b=TixXlsv0keFJSD04rDmecLG55KydcMnqXPr7k6brtP+TS9qBv/XgQNBdGLWvqEeM+WzU+G
	0bDH+0kH/8ioOinwmpcCdoY/5KthXp0XOAnExTF1qDO04r0II7DjPcVgz0cZiGyGMSRRpB
	t0YeEAxnq1Ke5vP53/diHAGEZ2CFrfI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-638-GaM4EZG4PoiVhFdgGwTi9g-1; Wed,
 30 Apr 2025 17:00:05 -0400
X-MC-Unique: GaM4EZG4PoiVhFdgGwTi9g-1
X-Mimecast-MFC-AGG-ID: GaM4EZG4PoiVhFdgGwTi9g_1746046804
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8218B1801A1F;
	Wed, 30 Apr 2025 21:00:04 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.88.112])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1AFF91800365;
	Wed, 30 Apr 2025 21:00:02 +0000 (UTC)
From: Luiz Capitulino <luizcap@redhat.com>
To: catalin.marinas@arm.com
Cc: lcapitulino@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	david@redhat.com
Subject: [PATCH 3/3] mm: kmemleak: mark variables as __read_mostly
Date: Wed, 30 Apr 2025 16:59:47 -0400
Message-ID: <4016090e857e8c4c2ade4b20df312f7f38325c15.1746046744.git.luizcap@redhat.com>
In-Reply-To: <cover.1746046744.git.luizcap@redhat.com>
References: <cover.1746046744.git.luizcap@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

The variables kmemleak_enabled and kmemleak_free_enabled are read in the
kmemleak alloc and free path respectively, but are only written to if/when
kmemleak is disabled.

Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
---
 mm/kmemleak.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 06baa3475252..da9cee34ee1b 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -210,9 +210,9 @@ static struct kmem_cache *object_cache;
 static struct kmem_cache *scan_area_cache;
 
 /* set if tracing memory operations is enabled */
-static int kmemleak_enabled = 1;
+static int kmemleak_enabled __read_mostly = 1;
 /* same as above but only for the kmemleak_free() callback */
-static int kmemleak_free_enabled = 1;
+static int kmemleak_free_enabled __read_mostly = 1;
 /* set in the late_initcall if there were no errors */
 static int kmemleak_late_initialized;
 /* set if a fatal kmemleak error has occurred */
-- 
2.49.0

