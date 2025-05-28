Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE9E244678
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 07:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748417254; cv=none; b=q4CynzmaK747uUu8NrJWhNEGyo4HfDXLhGXf7vmY8BzmFQcRL+Nc9JCFX7CMhRXL2azGfkg+VQ0sTQX6m5yG5xlWPZzXeq/s7tturKWPjSFtifMa4YCRVE5D7D8yFQXByxYTt3RDNBpQqKWYLDF0sG/UY7dEefOh6gmuxKGYR7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748417254; c=relaxed/simple;
	bh=4d2Rvh5/049QiSFiG8HqsMtGYGDNAUWELzNpSKTOFQk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J+9oBtj9W9VqXBCGx9W90+vpJu7AKRpdRA/QgYhh4QOVb81ZOEqHfOG+kuDP7b8N75+JQgU5q8laMAuiBQkxMR1JOrwPasf7TWZ1ovMm4rRu0K516RVEbabodd+DE4xNC9Gq3+TKnAce8f+D5o0yukQEU8SPhwq9/kneYr/BkXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NgMFV30/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NgMFV30/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748417251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=u7w+oFgheV8aZ4x33cyzyZZ5cNI/GkUhBQCV4X7SdIs=;
	b=NgMFV30/1yH8ixTvy4g0k2Q4t+CtKTiArHN7iOChWbB8rmNAyoEVi0MBhiOq3abIso+LB2
	PFZvjlBLFTgEe0d36XyWSarAL1Z7AdkE1MDR+OkLebqnxHRvU9UFjmOlU58BOZ3DCjRB+g
	dLo4Z6i3eANTx6cwE2xxYaunZ6ShYx8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-76CT5VU1OiSZl71NvGIaEg-1; Wed, 28 May 2025 03:27:29 -0400
X-MC-Unique: 76CT5VU1OiSZl71NvGIaEg-1
X-Mimecast-MFC-AGG-ID: 76CT5VU1OiSZl71NvGIaEg_1748417248
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-442f90418b0so21983025e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 00:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748417248; x=1749022048;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u7w+oFgheV8aZ4x33cyzyZZ5cNI/GkUhBQCV4X7SdIs=;
        b=spkofylX6FepNBqVp2D0u7Ch7OMtpm+4dEHx7dMpmplJralsLJSeKKfxolvxPdQgWc
         QUbxJdm229H6VMGwbD5gVQmVeiIJ7Xl6XLQDk11SPF0W14+L9KHHPBsvMA1jWJreQy0l
         VMOSSY/RXvNJ2s6kYownKF5KTDfwS2MH9I5AnSfMSBKaLWSu3TKapiwVoCBT0MA9rlA6
         b80XheByBFchHOhY8UXLAfcg73CIk73IdFAwrQT273eE1iCI5ozfr4oV+hhLbpJwiDcw
         QRfsodjZwuUkcG3Z6CuKzQHAWBQwuHzloGvZ1aA0VtPe/C5BJwZfyoWZ+pSa0feEM9QS
         8e1g==
X-Forwarded-Encrypted: i=1; AJvYcCXpv1BvuARPRnLZoLMl2PCxAxYZ2FbvcM95mwjEEm6P38TFkCtjDabuVeAPGZEOip9JevUi7Q7sj0oePpA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1VOLuESEbJsmIVvwZ/FlgQC/v3oOLLIM1s8jYbDuFWUwvQ/Wo
	coXkg8BJzbF+SwUcnSMZ4j461eXg/V87WyGqtyouD0MfE4uWA9XqeWfLL2pw+72dqpOnYeVLHRh
	qq2GJRbrhZdEJb+HipkWMvOl5yrSBmpMKtCCe9B1oC5AigVXc69KyRKObDslqC/wz8A==
X-Gm-Gg: ASbGncu2FSIdF9JXWyfSI5400xeomvjh19V0trohk5R2HE3rnpovVXtLMMaoCz10hwJ
	6xpaM1DKEbvSi3pUgTr0zqE8m0FSCD/8KwXI6gsQuQKgQMpY38al1WB7/UEUGqaWzH/Wnk1k/WW
	tE7jwaHvHbPDYQvmzQi2GbZRt0+nxmD8PP5iB8wdc5Hl9WzluIG8DaDxxCclFJ21ArV845U7DAa
	BebkjqoOE2F0R0mbrIAROnEcWU426u/u0lUsokta9JGpUWp7FR8p98NbHzBkE2q9mMgPboaA+qE
	RDQYCQ==
X-Received: by 2002:a05:600c:4e45:b0:442:f4a3:8c5c with SMTP id 5b1f17b1804b1-44c919e13ddmr185732445e9.10.1748417247873;
        Wed, 28 May 2025 00:27:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEltm4UmhdICUHUpMHmQNZNYzagk6xfrMPG1SMAdHiF25jVtOn4A91e8E91qUEsAR8QkJYhDQ==
X-Received: by 2002:a05:600c:4e45:b0:442:f4a3:8c5c with SMTP id 5b1f17b1804b1-44c919e13ddmr185732135e9.10.1748417247448;
        Wed, 28 May 2025 00:27:27 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064ae775sm12042235e9.22.2025.05.28.00.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 00:27:26 -0700 (PDT)
Date: Wed, 28 May 2025 03:27:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	alexandre.belloni@bootlin.com, dongli.zhang@oracle.com, hch@lst.de,
	israelr@nvidia.com, kees@kernel.org, leiyang@redhat.com,
	mst@redhat.com, phasta@kernel.org, quic_philber@quicinc.com,
	sami.md.ko@gmail.com, vattunuru@marvell.com
Subject: [GIT PULL] virtio, vhost: features, fixes
Message-ID: <20250528032724-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mutt-Fcc: =sent

Hi Linus,
There are several bugfixes I'm testing for post rc1 on top of this, but they
are pretty minor.


The following changes since commit a5806cd506af5a7c19bcd596e4708b5c464bfd21:

  Linux 6.15-rc7 (2025-05-18 13:57:29 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

for you to fetch changes up to 206cc44588f72b49ad4d7e21a7472ab2a72a83df:

  virtio: reject shm region if length is zero (2025-05-28 03:19:03 -0400)

----------------------------------------------------------------
virtio, vhost: features, fixes

A new virtio RTC driver.

vhost scsi now logs write descriptors so migration works.

Some hardening work in virtio core.

An old spec compliance issue fixed in vhost net.

A couple of cleanups, fixes in vringh, virtio-pci, vdpa.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Christoph Hellwig (1):
      vringh: use bvec_kmap_local

Dongli Zhang (5):
      vhost: modify vhost_log_write() for broader users
      vhost-scsi: adjust vhost_scsi_get_desc() to log vring descriptors
      vhost-scsi: log I/O queue write descriptors
      vhost-scsi: log control queue write descriptors
      vhost-scsi: log event queue write descriptors

Israel Rukshin (1):
      virtio-pci: Fix result size returned for the admin command completion

Kees Cook (1):
      vhost: vringh: Use matching allocation type in resize_iovec()

Peter Hilber (4):
      virtio_rtc: Add module and driver core
      virtio_rtc: Add PTP clocks
      virtio_rtc: Add Arm Generic Timer cross-timestamping
      virtio_rtc: Add RTC class driver

Philipp Stanner (1):
      vdpa/octeon_ep: Control PCI dev enabling manually

Sami Uddin (1):
      virtio: reject shm region if length is zero

 MAINTAINERS                              |    7 +
 drivers/vdpa/octeon_ep/octep_vdpa_main.c |   17 +-
 drivers/vhost/scsi.c                     |  190 +++-
 drivers/vhost/vhost.c                    |   28 +-
 drivers/vhost/vringh.c                   |   19 +-
 drivers/virtio/Kconfig                   |   64 ++
 drivers/virtio/Makefile                  |    5 +
 drivers/virtio/virtio_pci_modern.c       |   13 +-
 drivers/virtio/virtio_rtc_arm.c          |   23 +
 drivers/virtio/virtio_rtc_class.c        |  262 ++++++
 drivers/virtio/virtio_rtc_driver.c       | 1407 ++++++++++++++++++++++++++++++
 drivers/virtio/virtio_rtc_internal.h     |  122 +++
 drivers/virtio/virtio_rtc_ptp.c          |  347 ++++++++
 include/linux/virtio_config.h            |    2 +
 include/uapi/linux/virtio_rtc.h          |  237 +++++
 15 files changed, 2707 insertions(+), 36 deletions(-)
 create mode 100644 drivers/virtio/virtio_rtc_arm.c
 create mode 100644 drivers/virtio/virtio_rtc_class.c
 create mode 100644 drivers/virtio/virtio_rtc_driver.c
 create mode 100644 drivers/virtio/virtio_rtc_internal.h
 create mode 100644 drivers/virtio/virtio_rtc_ptp.c
 create mode 100644 include/uapi/linux/virtio_rtc.h

