Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857FB218EBE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 19:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743447961; cv=none; b=L7Stw7321bJg/X3mhzmlFlspHhZHTS/CbzI/XQysQqJdw9uYim+L341I0wM5pj1yC+0I0LrmsySW3pCiZ0H9OVyOOXKZX5e6TBByxFwRiF12A827FWyXreKOqnFAfu//PiDdEwtbbCD3oqPkttS/doUilQ3t0fLXfZgPM3Mo1AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743447961; c=relaxed/simple;
	bh=ymtz3LKXQelnMrMnB1EtIZhse9Mr3gBZyo+pb7yu+nI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GCiLMQY/gFUAM5UzbJOyhMzwTZTDHa8MwVk3zzA+wQGq796P3U/Fb2DqEQJMF5iDS1cMET0+Ne/IRPOzUshJhn5EZ1VmW+7vFcxeeBRiFer7oFNwLXheZAPUqfmCeITTsL7vxLdspPD/Sd1nncqI1pMNxjKS5sM48kDUp6W8Tys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZldkI6CD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZldkI6CD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743447958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uzKnw77swTeh7HXFgYoBa2NfI5F2/BsDtkjgKan+l0U=;
	b=ZldkI6CDx9gDDRLRMeeoUBGlZ+c+bw9e5EGwpOnBmxRaOoA63OcmA745BrU7TkQi7Cj+0p
	+l90blBPAy3xaZy99ICx7sJj74GlWk9AnBhTOKktOawmvvF4tnWJ3fQ+LeOBTD4Zj8gvGO
	1QLQLmbAa/2klck6JlVdY3qE15gsyKk=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-Gd2I49WLNXamVOseeTb39Q-1; Mon, 31 Mar 2025 15:05:56 -0400
X-MC-Unique: Gd2I49WLNXamVOseeTb39Q-1
X-Mimecast-MFC-AGG-ID: Gd2I49WLNXamVOseeTb39Q_1743447956
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-603f3a4c58dso13714eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:05:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743447956; x=1744052756;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uzKnw77swTeh7HXFgYoBa2NfI5F2/BsDtkjgKan+l0U=;
        b=TVtT0IV+V7dhZie+exneW1eZZp3G1jN0mYFgc8ghnn6nqoZj7hxRF9aI+saSkTr5n5
         +Z/mUG6SR56DKPGNyU7vQ8XKQDgWuXomtroG4c6olTWeuhd01Z+BOMk+DFGV4tmKBPNs
         rx7n8qsJk5QFuR4u9TcdcK3uzdJxL2UAVEPwUfVfHEyP5HKKScWfHvVaImZLKRptdljb
         qdgRvlvRmAA4fetXG/wIgQElCQE9f08aaZ4zcy/edMhFZnhbt3YfFsCb1oko5YN7VTKt
         AG0IZsxpg+5ExW5xxlWU/NtIGJUDZqr1Jg50xjDSOUDqe4bipKLbuur+FLVkDVkV40kQ
         v1iA==
X-Gm-Message-State: AOJu0YyewXVU3y9lZ1PgEkmU+yAHCMH3V3iEvJLqzWU0obvGGLFdVCed
	haOuYfyrr/PaB9iSRZ+zLW315lPQ74ZDAN/JGSWnDJ394zJ6WIvlOxAakBHk2BFMrTQ63Y7AuCQ
	a/JsN7dBbTkt3mR+sStmTiTGeMEM27dCh5QTq42I231cm8V4pMlUmQgC8TTYy7A==
X-Gm-Gg: ASbGncsdEMTASZH8EobzVuMBENrNt6zhmgLduwvtUP9On7EeErqZful1DYYpER8+0gM
	Td86snDRR41WO072uHvh5caJcFQoS3ZIkfwVGzg0egi/sKJiFd5Y5112traI0fdiuI6uJ2fthAD
	F/WxS1NGHl0m2Es7kKhGTSk8IT4Yl4qt8tEqPJm//UBi8w+iiwcqj1mCu1PyIzibbVIx6Znbxe1
	gTk4pCjPVhr17E3nK6T4kz6+cRfNDLTw4Qd6rAiln/wqxCYwWrLqIxNDVNiUVvIj1Muevr6Aku/
	kEqfiuZf1M+iCNV0wJM=
X-Received: by 2002:a05:6871:4f12:b0:2cc:36b1:8c19 with SMTP id 586e51a60fabf-2cc36b1dd66mr41789fac.0.1743447955852;
        Mon, 31 Mar 2025 12:05:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI7UGahoFOzLlam2TphSYmw3If0g3Dxd3FZsZxKkq/Qcp8nUCuQBdZUJ41G/+wxHja5olD4Q==
X-Received: by 2002:a05:6871:4f12:b0:2cc:36b1:8c19 with SMTP id 586e51a60fabf-2cc36b1dd66mr41781fac.0.1743447955518;
        Mon, 31 Mar 2025 12:05:55 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c86a90e132sm1970717fac.45.2025.03.31.12.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 12:05:54 -0700 (PDT)
Date: Mon, 31 Mar 2025 13:05:50 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>
Subject: [GIT PULL] VFIO updates for v6.15-rc1
Message-ID: <20250331130550.2f9ba79e.alex.williamson@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Linus,

The following changes since commit d082ecbc71e9e0bf49883ee4afd435a77a5101b6:

  Linux 6.14-rc4 (2025-02-23 12:32:57 -0800)

are available in the Git repository at:

  https://github.com/awilliam/linux-vfio.git tags/vfio-v6.15-rc1

for you to fetch changes up to 860be250fc32de9cb24154bf21b4e36f40925707:

  vfio/pci: Handle INTx IRQ_NOTCONNECTED (2025-03-17 15:15:17 -0600)

----------------------------------------------------------------
VFIO updates for v6.15-rc1

 - Relax IGD support code to match display class device rather than
   specifically requiring a VGA device. (Tomita Moeko)

 - Accelerate DMA mapping of device MMIO by iterating at PMD and PUD
   levels to take advantage of huge pfnmap support added in v6.12.
   (Alex Williamson)

 - Extend virtio vfio-pci variant driver to include migration support
   for block devices where enabled by the PF. (Yishai Hadas)

 - Virtualize INTx PIN register for devices where the platform does
   not route legacy PCI interrupts for the device and the interrupt
   is reported as IRQ_NOTCONNECTED. (Alex Williamson)

----------------------------------------------------------------
Alex Williamson (7):
      vfio/type1: Catch zero from pin_user_pages_remote()
      vfio/type1: Convert all vaddr_get_pfns() callers to use vfio_batch
      vfio/type1: Use vfio_batch for vaddr_get_pfns()
      vfio/type1: Use consistent types for page counts
      mm: Provide address mask in struct follow_pfnmap_args
      vfio/type1: Use mapping page mask for pfnmaps
      vfio/pci: Handle INTx IRQ_NOTCONNECTED

Tomita Moeko (1):
      vfio/pci: match IGD devices in display controller class

Yishai Hadas (1):
      vfio/virtio: Enable support for virtio-block live migration

 drivers/vfio/pci/vfio_pci.c         |   4 +-
 drivers/vfio/pci/vfio_pci_config.c  |   3 +-
 drivers/vfio/pci/vfio_pci_core.c    |  10 +--
 drivers/vfio/pci/vfio_pci_igd.c     |   6 ++
 drivers/vfio/pci/vfio_pci_intrs.c   |   2 +-
 drivers/vfio/pci/vfio_pci_priv.h    |   6 ++
 drivers/vfio/pci/virtio/Kconfig     |   6 +-
 drivers/vfio/pci/virtio/legacy_io.c |   4 +-
 drivers/vfio/pci/virtio/main.c      |   5 +-
 drivers/vfio/vfio_iommu_type1.c     | 123 ++++++++++++++++++++++--------------
 include/linux/mm.h                  |   2 +
 mm/memory.c                         |   1 +
 12 files changed, 106 insertions(+), 66 deletions(-)

