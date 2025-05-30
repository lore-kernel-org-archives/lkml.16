Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD7023537B
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 20:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748635407; cv=none; b=gst/EXcaJmZc0Sria3PdWUIJvc22c86WLYBVgMmAQ4xkf2e8Ic/EcLxQvn6aCjmGLJsMiN3n6q0/GEkcLK65qsuHRxmpWMFLPJMjUH/gRbU7TqsXKDGytx7fSz5rZQkrD0GDiJrop3OzTwgcYcBKYVIxWFeMNN3Ffo7ggYvqIiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748635407; c=relaxed/simple;
	bh=EfYSBScFnFipbETF/a5CzEhGbuLtTIqUtrtJF9pOzaI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E6zSbRt3pbD16jJI7NnjCWb0Cl9XvOdkXr6/7XgbFInZZHu4hdBHeN4CqrY+dGyTRSwjQp1c1BkPjTMPgkYm4givSYNvLQOpqcM+QpDfd+1wophEBKKLTO71dlw6NyoEoF3ga1HrSEIkTlluJ8LSmazntQ5qS4EtDAaIVjbNsT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fIlcanM2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fIlcanM2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748635404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VjB9kKueaDN32RzEl4yQFlUZIp0WyC7fZD96f4yh/FE=;
	b=fIlcanM2Wtsp2wk5G2bOwC+WPSbn3rteyCxVZN+SY9mCL+cyPaHK+yk3BgWHor5mz00Vmc
	Uhk5seuDVxXcFujjNN9UfZGs7IIF7JD4WL/Qz9xxgpskwYel0yi2E9+xslANfA3HpdxOdg
	2Bq9PQjgH7qGZb84gIpXTtBwbeesemE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-553-ddk17eKkODi7i1Jnfnl2AQ-1; Fri,
 30 May 2025 16:03:19 -0400
X-MC-Unique: ddk17eKkODi7i1Jnfnl2AQ-1
X-Mimecast-MFC-AGG-ID: ddk17eKkODi7i1Jnfnl2AQ_1748635398
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 788F21956086;
	Fri, 30 May 2025 20:03:18 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.64.162])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4BEE91954193;
	Fri, 30 May 2025 20:03:17 +0000 (UTC)
From: Joel Savitz <jsavitz@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Joel Savitz <jsavitz@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 0/3] kernel/nsproxy: Minor nsproxy code simplification
Date: Fri, 30 May 2025 16:03:03 -0400
Message-ID: <20250530200305.85319-2-jsavitz@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The first patch removes an unnecessary guard by the same logic as
commit 5caa2d89b7f1 ("kernel/nsproxy: remove unnecessary guards").

The second patch fixes the total ordering of resource acquisition
in validate_nsset().

The third patch implements usage of the cleanup helper added by commit
d057c108155a ("nsproxy: add a cleanup helper for nsproxy").

Joel Savitz (3):
  kernel/nsproxy: remove unnecessary guard in validate_nsset()
  kernel/nsproxy: fix put_*() call ordering in validate_nsset()
  kernel/nsproxy: utilize cleanup helper for nsproxy references

 kernel/nsproxy.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

-- 
2.45.2

