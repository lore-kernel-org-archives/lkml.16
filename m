Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73BD276034
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747739138; cv=none; b=TCMOyTw5qybEvzcAX+gerNm2Bj9Itpy00DaAfFoEyNdTLUAIkfPIPt9a2WHk/Ax6pNBv+We7v4CybzJ7eqYr6MemRrhawvnhQEERzUy2dWkd4azjt2aT2Dn5ZnpkfnSZUBGMPDiYoabDSdGUc2Bt+DnM8j8WqVYDQ5xonfUgAD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747739138; c=relaxed/simple;
	bh=xuOr3teitA/HmJR6wATZWuqR1PVcmJ5/IJhao60skH4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=IZcxlo8CH49fX+DEY7b53CtlZXMLjYKEt25+1wxSJBMsWbu86dZFtjOPgkCNwG6k6WlToXHkcirBenjDsnAyAt9zoM/CY/TTwjUrWFcMD7VFOFQ0ZVcWyGODz0GmHUcDqHoWSIKo8OdD08R4Ve4o26m3YAVd1VAyg65OG9yu4ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TacPOtkw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TacPOtkw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747739135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Q9wFMTSCK+FQEgUkTaGZ9hU5dJnXkFS3SndlSsPEsbA=;
	b=TacPOtkw6lC0dwwBBWCza0R4IQruVlWM/PS/IzaojC9UzfIQTNLQX20hJqFRDpyl6jxJP+
	eaDc3A5zFafIMR2w+u/kp8PHWqSf2jOuUuteNOhlJFkDvEpB/9Uga20w6uFkOVYdYviXWG
	lxKxYsAJLKV+pcfuOcbGzeKnRK5zDBo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-269-bTz8G3OsOfCIdc35D5CcDw-1; Tue,
 20 May 2025 07:05:31 -0400
X-MC-Unique: bTz8G3OsOfCIdc35D5CcDw-1
X-Mimecast-MFC-AGG-ID: bTz8G3OsOfCIdc35D5CcDw_1747739130
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8EE521956080;
	Tue, 20 May 2025 11:05:30 +0000 (UTC)
Received: from lenovo-t14s.redhat.com (unknown [10.44.33.64])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4BE4F19560AB;
	Tue, 20 May 2025 11:05:28 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Jason Wang <jasowang@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: [PATCH 0/2] virtio: Fixes for TX ring sizing and resize error reporting
Date: Tue, 20 May 2025 13:05:24 +0200
Message-ID: <20250520110526.635507-1-lvivier@redhat.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

This patch series contains two fixes for the virtio subsystem.=0D
=0D
The first patch fixes an error reporting bug in virtio_ring's=0D
virtqueue_resize() function. Previously, errors from internal resize=0D
helpers could be masked if the subsequent re-enabling of the virtqueue=0D
succeeded. This patch restores the correct error propagation, ensuring that=
=0D
callers of virtqueue_resize() are properly informed of underlying resize=0D
failures.=0D
=0D
The second patch addresses a reliability issue in virtio_net where the TX=0D
ring size could be configured too small, potentially leading to=0D
persistently stopped queues and degraded performance. It enforces a=0D
minimum TX ring size to ensure there's always enough space for at least one=
=0D
maximally-fragmented packet plus an additional slot.=0D
=0D
Laurent Vivier (2):=0D
  virtio_ring: Fix error reporting in virtqueue_resize=0D
  virtio_net: Enforce minimum TX ring size for reliability=0D
=0D
 drivers/net/virtio_net.c     | 6 ++++++=0D
 drivers/virtio/virtio_ring.c | 8 ++++++--=0D
 2 files changed, 12 insertions(+), 2 deletions(-)=0D
=0D
-- =0D
2.49.0=0D
=0D

