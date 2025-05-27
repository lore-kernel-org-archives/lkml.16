Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988902798F0
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748356048; cv=none; b=SjaqasYm+FoYTE1ncjQj0/Pk6JVaGw1djarV5w3BhE7iVpmAz6551SJmuZIfz44LI9QgHTdLc0DsHEo9OGnelxY7HAkwo2eh196F/9Ph4QFcspOhkcyCxVPj7ak12QnGQVlXpLcYUaVvPA56C3A19xHswBrog8txS4wpP+isdS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748356048; c=relaxed/simple;
	bh=JzQItSNVv23zDd1t1/2QMHHi4DVBx9+mJ/ig56B2iEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YyOMkQ8lzBDKyKYdygdfi8TIbBHnTFvmejrNqxolpYCg5vEOVDHtdPulwojxkG9rqhPfpmFhOMFcn4AHQr3VyrvMKbbdWyuavCabgpLkhHzfDPTpXXz1b4aEJecbpfNHSjkhhpskSElL+01HsNzJUtJnWzE5UgANUotLg7CJHMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HteH1A9X; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HteH1A9X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748356045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=loG0I+Dl2oQWj8aB672jQJbZ1XRhgLNEO/t73xTMpm8=;
	b=HteH1A9XB2ZcOVbCWxu3Mt3CiwSbbJxjbpxpO4ehm3txgJLevmsr3KzqiPXpV+4WRavLoo
	DfV0P0tLTZTlkjVfFvbLYWGIVQ/xvb+TUUyAJ5s7V4nhPU7RSaiTUhzVB7maMjg4XiDLSc
	TfIN/v54BMJmZvQutw2T+z6WwAKKa9E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-ppQl0yRUPJ-oeS_aVCfTsw-1; Tue, 27 May 2025 10:27:24 -0400
X-MC-Unique: ppQl0yRUPJ-oeS_aVCfTsw-1
X-Mimecast-MFC-AGG-ID: ppQl0yRUPJ-oeS_aVCfTsw_1748356043
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-442dc702850so22234775e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 07:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748356042; x=1748960842;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=loG0I+Dl2oQWj8aB672jQJbZ1XRhgLNEO/t73xTMpm8=;
        b=j4k9mzBM3XF81SVn9YpCiaW7hYXkcnKdIOVsAFoOgN4IKTrqxnxDyIdggvZ2IzT8em
         pl0tkBZkIB+KCpC6zRPpYt5QFdi+o/l6iEEi3xyHEzHHDkehsWKcg5t9oeb76lqdCINJ
         9UIjo2Fnsc44mPrLFvrPkT7dUBk/PLSu56McZwQdvEWlE2E/1+SavrKvN663wBmEg0Lm
         xEK6E55ow/Cls8CA6GuBmq6XZzCexW5mhZ07OTpXO5GD+L6U6njrdcR7wIRPUnhji3zF
         V0g2R0o37OKZwMtGW9IDNqnOmHDf5C+j6IXx3gQRk+UVdc7LxYV8+8ysz4ePSTbL5N9c
         w6mg==
X-Gm-Message-State: AOJu0Yyv+JcvjmbzeqVkMx76HtYmhP4sDo7Z7mxZkAEZ9t+PvnO1YSND
	zCR8tuiisLnk9KhW0IQlJFQJC0JpfcUzBv+Wuk4fL/aGHoLfceEFyDKPmCvsInWPznrWNFiycZl
	QTj83YNahxaIlHUtKN/tJtovfcbfYUFqbElVkQn+b5cAtwNRBQZ1gd2ZIURTos7XdsAbZVwiNpt
	xmgYacy1yX9+PVCV6hREz33GwGPKm4KfOP+DkVyhmG8g0=
X-Gm-Gg: ASbGncsS4RVXMR1ggaqTMs6YyFhC8DlOuryG5Sd4g6J61QTT8lFa85rtqe7utprXNz3
	YEcZbYxTfP207V8EZ9eFIrWhQ1l0cLNBGjy7sVfivtbq5AzB46p7tQAWgA84h1SpsUm/rhhSq0F
	/vRB1DM9i3wunjkOi51RIHLKF3vrVvfjIuLIcuzyXDJDht9y7qkQCIKdTOxwF5oYdGG6om4pl7V
	JhiXlOnwBw0P7BZMxPAh1/nP8YXR7JxrG/gHUw4Sy1qXJzeXON7HS00thECW66QAni0lxOCKcaJ
	9VvdVw==
X-Received: by 2002:a05:600c:1d99:b0:43c:fb95:c76f with SMTP id 5b1f17b1804b1-44c91cc3e83mr126110415e9.9.1748356042533;
        Tue, 27 May 2025 07:27:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbK8SlBZJYpkjFZFAqyV31vx7Hq1g5B/8buxgeL4/qwgmibcMk2FtXwnmTaXHM3QP5L/O9lg==
X-Received: by 2002:a05:600c:1d99:b0:43c:fb95:c76f with SMTP id 5b1f17b1804b1-44c91cc3e83mr126110045e9.9.1748356042110;
        Tue, 27 May 2025 07:27:22 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d4a3csm277186565e9.22.2025.05.27.07.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 07:27:21 -0700 (PDT)
Date: Tue, 27 May 2025 10:27:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev
Subject: [PATCH] virtio: document ENOSPC
Message-ID: <2e6ec46b8d5e6755be291cec8e2ec57ef286e97b.1748356035.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent

drivers handle ENOSPC specially since it's an error one can
get from a working VQ. Document the semantics.

Reported-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/virtio/virtio_ring.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index b784aab66867..97ab0cce527d 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -2296,6 +2296,10 @@ static inline int virtqueue_add(struct virtqueue *_vq,
  * at the same time (except where noted).
  *
  * Returns zero or a negative error (ie. ENOSPC, ENOMEM, EIO).
+ *
+ * NB: ENOSPC is a special code that is only returned on an attempt to add a
+ * buffer to a full VQ. It indicates that some buffers are outstanding and that
+ * the operation can be retried after some buffers have been used.
  */
 int virtqueue_add_sgs(struct virtqueue *_vq,
 		      struct scatterlist *sgs[],
-- 
MST

