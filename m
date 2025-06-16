Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6521220E00B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750062334; cv=none; b=CwJvbqm/bJBP8w3iAn8azCHjxX9TAUWASAdGa0iTMMNceyLPUdlVVUt4HvLZ2UJE9Ws/zpn3aoPi6k186WnuyISsCrcgQys21hVLE1QNav1B8xC57LdEJnKDci8bQ3iAjc189O3iS/XlneHUT8AHa3I7RUuTJJjjLt58WoYyXww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750062334; c=relaxed/simple;
	bh=yk59vr5RLB1RScFT2EiC7kkHJEyAXkx7Rk6wmGXmEAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ATPAAByK7KNOfXAY6xSAzXSkI0HV/KZiRUJwbpVA+BS93Z3bWvU/qen8lOTQADNP8nXJfSrMJamID+73kXwZltQs2Jwunjf+xgCvHBexyAPqkmhW2cQJf/jieJT8QQqlY24aDpck6ga13c/3NQ5ZGXB5SRdLWqUHnPIxiF1kwOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UyWty9EX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UyWty9EX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750062331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ARUl9HRdCC74hdwvbgCBDHJ3gsOkqhi27NOZxm0AX2w=;
	b=UyWty9EXzKqir9siyALLM8xcfnI66jH05YeIevbJ9zmZLz3aS4B3vBi3aSnnLM25n03GuC
	QLLUUzfac1lDN++LAHC3d7HnjtMRUJmem6hTJqXvSFF6vguh5ZMKJqibm5mh/oPVbkaH7H
	0rJqSNP0ISoT0BDZkF0HZjKsOtnQUZM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-553-Mmt7RFPgOpmg2MUuJNTHMg-1; Mon,
 16 Jun 2025 04:25:26 -0400
X-MC-Unique: Mmt7RFPgOpmg2MUuJNTHMg-1
X-Mimecast-MFC-AGG-ID: Mmt7RFPgOpmg2MUuJNTHMg_1750062325
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9174B18002A1;
	Mon, 16 Jun 2025 08:25:25 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.72.112.72])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 09623180045B;
	Mon, 16 Jun 2025 08:25:21 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Cc: xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 00/19] virtio_ring in order support
Date: Mon, 16 Jun 2025 16:24:58 +0800
Message-ID: <20250616082518.10411-1-jasowang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Hello all:

This sereis tries to implement the VIRTIO_F_IN_ORDER to
virtio_ring. This is done by introducing virtqueue ops so we can
implement separate helpers for different virtqueue layout/features
then the in-order were implemented on top.

Tests shows 3%-5% imporvment with packed virtqueue PPS with KVM guest
testpmd on the host.

Changes since V2:

- Fix build warning when DEBUG is enabled

Changes since V1:

- use const global array of function pointers to avoid indirect
  branches to eliminate retpoline when mitigation is enabled
- fix used length calculation when processing used ids in a batch
- fix sparse warnings

Please review.

Thanks

Jason Wang (19):
  virtio_ring: rename virtqueue_reinit_xxx to virtqueue_reset_xxx()
  virtio_ring: switch to use vring_virtqueue in virtqueue_poll variants
  virtio_ring: unify logic of virtqueue_poll() and more_used()
  virtio_ring: switch to use vring_virtqueue for virtqueue resize
    variants
  virtio_ring: switch to use vring_virtqueue for virtqueue_kick_prepare
    variants
  virtio_ring: switch to use vring_virtqueue for virtqueue_add variants
  virtio: switch to use vring_virtqueue for virtqueue_add variants
  virtio_ring: switch to use vring_virtqueue for enable_cb_prepare
    variants
  virtio_ring: use vring_virtqueue for enable_cb_delayed variants
  virtio_ring: switch to use vring_virtqueue for disable_cb variants
  virtio_ring: switch to use vring_virtqueue for detach_unused_buf
    variants
  virtio_ring: use u16 for last_used_idx in virtqueue_poll_split()
  virtio_ring: introduce virtqueue ops
  virtio_ring: determine descriptor flags at one time
  virtio_ring: factor out core logic of buffer detaching
  virtio_ring: factor out core logic for updating last_used_idx
  virtio_ring: factor out split indirect detaching logic
  virtio_ring: factor out split detaching logic
  virtio_ring: add in order support

 drivers/virtio/virtio_ring.c | 896 ++++++++++++++++++++++++++---------
 1 file changed, 684 insertions(+), 212 deletions(-)

-- 
2.34.1

