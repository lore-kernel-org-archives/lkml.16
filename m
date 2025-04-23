Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830E2266F00
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745390568; cv=none; b=aFBs5FM490eorE9U+BA1uVvXpFlAv4zybtBdTY6/Y1w5fCbzwQ8hOth7McyqM4s/2RACVT62m4Rmwh5kXewfuRh8Ru8N3igcY6x0HKqxcr/0RCUt6qd6omTTDce0DY1sHC0UNp81qy+0Qcdx8IkQDmy1PeE/vcQ73fgBiGvKXAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745390568; c=relaxed/simple;
	bh=1z9o8ll4AHzFt/k/hmidvON8KqNqYeHpKakhn28WR60=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AFygNxmVZw5964nUxMYq1Zs5iaIQgMHTIveS60rLUKAXQTJ2RgBZlazxsc6nKLkNJ8oeuHnOAFFca3zrokHu22h8vmbpx4JCE4sAp70Yy4et+QXFgwWxQQC85cRr9fFI++uvFc78Vf7QzEJsuOL6y0niG6y639TtOo7djRG4pUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GKUoYKrM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GKUoYKrM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745390565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=A+IIFd1CyCLzYQbKkS9qdqGwkTTadepQIc+Dm7g0mP0=;
	b=GKUoYKrM+xf0vIhjWHd2I9iDmIixmuYNAntbcJq87GWTQvkUD7sZTcz20aLEAWF5vskZVi
	w5svPeTVxetcijgLvvhjant5Zb8hJW2TzRHKYHq5EQKsL+7Da80mx7kL+rPiPaBYfPgTa3
	9cdmwKqHferq+tuPoQrCzUY2B7dR5Ug=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-VYV_tdGcNvqnP3qzadmipg-1; Wed, 23 Apr 2025 02:42:44 -0400
X-MC-Unique: VYV_tdGcNvqnP3qzadmipg-1
X-Mimecast-MFC-AGG-ID: VYV_tdGcNvqnP3qzadmipg_1745390563
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3912539665cso212928f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:42:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745390563; x=1745995363;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A+IIFd1CyCLzYQbKkS9qdqGwkTTadepQIc+Dm7g0mP0=;
        b=k2yvjdzNY7yypQTT067ncDRb7xT1y9DCUTVYfVZMXImbXcTsicjSnq+felcFIc6hJt
         iqfHIPt+u/r9d2oa7WmmmQZ9AQUcFELcDJaBfcFF5d/jNcxCcPjMbDEp72bTHPX8Ohuv
         ytmqTZpZElJpXk1uBdTpATXgSy4oKbF55hR7JQ3XmWd7D42LtZc/3mQo2u9lA+qTFZz6
         wJBeK1ljfi4jzAKP4kjeaAZEiVyzGp6b/p7MMkpJEfucjGogUOTNZM06gRWMW+6yj14c
         GZIBr/VX1JyPfIlRTBEc8OfN5m4ufW7n5CH5g1nOfbgw6VNZv16K+osBVenh1D+R8lAd
         Ps+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlzlNQHAUR7KlITKzyFmt4t6X8ymoOCNWE6RQHjcQTNtok+ecuR6xxtNkQYvYtRQArb8UDrYAMmdHW38w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdevKB7jdzsof11vXVjn51Zzof3vm5Ar1iZMwfOuvJmcLuOfkE
	82h3tOZhk/6epywN7xEHT/MPW8DPd7MquhueNsMRkfPopBz4jQphDygKvQxP0wnRumvm+pcjZBz
	p1G/gWbVV5FZC34hqpLY7BsMiKi1lYr02hh8f12lVDQpqpT7kThsjRxNvjY6MDg==
X-Gm-Gg: ASbGnct1rlgjF3EQn4084OnDdxnffPnckt7bO1dZCijsm2ppJsp66pPgg6Fbhhao1/g
	aHhc5EHZiRfnMKunceiVRYotH+AA07URvqt0JOZSwpIjeklKGiu//IN70QMORpyUxSRYDZ5SSxc
	MEiELXhq7BKWs97lAAyCDKaUZ+1EWAmJSxvI+ev/suxe2TAK6EJT266TdUcZvcYigXq6T0TT5YV
	t9j+RQpKuA6FEGWfseaOFFn1TtqLnfWwRxuDE79RlUumD2pOaJpEhiymZXBJRFICjC28gX3Obpt
	SWPlmg==
X-Received: by 2002:a5d:64a4:0:b0:38d:ba8e:7327 with SMTP id ffacd0b85a97d-3a06723c38cmr1327894f8f.8.1745390562742;
        Tue, 22 Apr 2025 23:42:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfqF3/DnXpz0jT/bVyus2YqORUpTFcY/LdcHG+U6sJT+ZpWhfo0iR0WXLgcAAw16VAtx6A4g==
X-Received: by 2002:a5d:64a4:0:b0:38d:ba8e:7327 with SMTP id ffacd0b85a97d-3a06723c38cmr1327865f8f.8.1745390562360;
        Tue, 22 Apr 2025 23:42:42 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4930f1sm17830202f8f.61.2025.04.22.23.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:42:41 -0700 (PDT)
Date: Wed, 23 Apr 2025 02:42:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	danielj@nvidia.com, dongli.zhang@oracle.com, eauger@redhat.com,
	eric.auger@redhat.com, jasowang@redhat.com, jfalempe@redhat.com,
	maxbr@linux.ibm.com, mst@redhat.com, pasic@linux.ibm.com,
	quic_zhonhan@quicinc.com, sgarzare@redhat.com,
	syzbot+efe683d57990864b8c8e@syzkaller.appspotmail.com
Subject: [GIT PULL] virtio, vhost: fixes
Message-ID: <20250423024239-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mutt-Fcc: =sent

The following changes since commit 8ffd015db85fea3e15a77027fda6c02ced4d2444:

  Linux 6.15-rc2 (2025-04-13 11:54:49 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

for you to fetch changes up to 58465d86071b61415e25fb054201f61e83d21465:

  vhost-scsi: Fix vhost_scsi_send_status() (2025-04-18 10:08:11 -0400)

----------------------------------------------------------------
virtio, vhost: fixes

A small number of fixes.

virtgpu is exempt from reset shutdown fow now -
	 a more complete fix is in the works
spec compliance fixes in:
	virtio-pci cap commands
	vhost_scsi_send_bad_target
	virtio console resize
missing locking fix in vhost-scsi
virtio ring - a KCSAN false positive fix
VHOST_*_OWNER documentation fix

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Daniel Jurgens (1):
      virtio_pci: Use self group type for cap commands

Dongli Zhang (3):
      vhost-scsi: protect vq->log_used with vq->mutex
      vhost-scsi: Fix vhost_scsi_send_bad_target()
      vhost-scsi: Fix vhost_scsi_send_status()

Halil Pasic (1):
      virtio_console: fix missing byte order handling for cols and rows

Maximilian Immanuel Brandtner (1):
      virtio_console: fix order of fields cols and rows

Michael S. Tsirkin (1):
      virtgpu: don't reset on shutdown

Stefano Garzarella (2):
      vhost: fix VHOST_*_OWNER documentation
      vhost_task: fix vhost_task_create() documentation

Zhongqiu Han (1):
      virtio_ring: Fix data race by tagging event_triggered as racy for KCSAN

 drivers/char/virtio_console.c        |  7 ++--
 drivers/gpu/drm/virtio/virtgpu_drv.c |  9 +++++
 drivers/vhost/scsi.c                 | 74 +++++++++++++++++++++++++++---------
 drivers/virtio/virtio.c              |  6 +++
 drivers/virtio/virtio_pci_modern.c   |  4 +-
 drivers/virtio/virtio_ring.c         |  2 +-
 include/linux/virtio.h               |  3 ++
 include/uapi/linux/vhost.h           |  4 +-
 include/uapi/linux/virtio_pci.h      |  1 +
 kernel/vhost_task.c                  |  2 +-
 10 files changed, 85 insertions(+), 27 deletions(-)

