Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9722D63F1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751534792; cv=none; b=gO63aZwmk7A0os2b4OdAYgRCo036uGWt5BquIHS1S4zcY6Xm/cx/HwdQ72m4Yzmv+hHsVg3KyY/JuIufgx0NCwofu7evNWh/n6x4devDWODT5o5dquOC2OkEGifHjK9e70+2uiBEhbVjXZA830LBmR8u52Ne5Q6Wx7EbovoFiuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751534792; c=relaxed/simple;
	bh=dXJfFfr2BawRbdZt7uXC560IiY/RJpXASjLPjwl9fsA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UarooeajeotaeARcy5ULQ51GItL4h/G+OPwR1jOqR9X0VhbaSNQRk0ectkMm2TCoSpZJd5enKoLG/08QAkEFtgFS8TQtJaXQLp0+yfp44cn9+ck5abfQBwCaP7Cqk0L3d0/F7yPW0H+KBF5b0PGyv+fawMnwbhMT3kzPdc0OkKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B383P8HX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B383P8HX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751534790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=BglLQcJl/SBLMmxhnpBc8HIRNbUjD0EW8Qi8lNaR8ik=;
	b=B383P8HX03JnnJA5zhmaLKTfGx8lG6/FNuVMCjoXQJY8QlWuthY7LZW4O0aKznLPaIYWbR
	zfKx5U6P4Q7oTCOTNuhHArJF+tudWQeF0ayKb7fOi3nV7qjMlkj24l3HXP0dpozyFvEFaR
	NdEV0nxWoxViqm6WxAZOxau6vHr36IA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-Z9M4JJjANO6dTtnIRG8SBw-1; Thu, 03 Jul 2025 05:26:29 -0400
X-MC-Unique: Z9M4JJjANO6dTtnIRG8SBw-1
X-Mimecast-MFC-AGG-ID: Z9M4JJjANO6dTtnIRG8SBw_1751534788
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3af3c860ed7so1533785f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 02:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751534787; x=1752139587;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BglLQcJl/SBLMmxhnpBc8HIRNbUjD0EW8Qi8lNaR8ik=;
        b=snIzMPafiVBV9DvJTBiraukheaQo2rko6aM4l9LiPbKEnBWtbDSkqqhLGvfePTXukI
         W4aUNDJYNopAIgdmKZ9+hhE6cMlGtO5PVVsA06vfvjFCycoE0RPQ/O6a7j54kb+GFEll
         HJ/PC8bKvqMkY/24inKj+/lxCER2kcbBZSI04Gup3mPTurdts3hD1Pp9nA5iqNukaNMB
         dVJEkY2rs670l4sYRI4VVW5n9HIAXleB11+mR+YR1zy2xamA2/HYV3CbQk9zILCstam4
         ibMpaDiS85CfgfwvoXZgXcFxPbKDn8AgDpLXqT4A7Zmor2J0DdPqD/sYp8eRD0ZSCpme
         oWxg==
X-Gm-Message-State: AOJu0Ywz0wwAfFe7KNNawfPzKsOwLtw9GjkSEzQVde2zESG0+XW6+UBs
	zoplFTKvAyKrlW7c8kBY8Ana9vpRHAXHmaYKrPta2liMGtmFZO3xOO4KryvQuSNLuHrSfRydO43
	XjWGmP3WMoBCptC8qW2YLwe6WU9FdtM6CTnKvp3q2RQsENTSI1xM6MQFBPOtmXbSHiE9DRlKiY4
	TX84nGAeMXDbSmCr2BF9tG/cBbQv0Oi3IVk8BbRsn7iLI=
X-Gm-Gg: ASbGncsEwQo05OfI3XEzXJyIyOWbHTHJs0Yqas8mn5jEci5akCyxsGdWGkBaHzzb60r
	dYuMboHBXayXEtDkzholf0Sip4tp0GJVzFt0TevMcaycx40JwwLXeNPld5OaVz6byyfTQYD92zI
	F6WWb1bQu8Qee/fpxIk3gR/rR6AT+ZlUO7VU8JtrK0b0VLe4sxw+8ToPBVwVxRypov06/WyWQ8a
	NpdXIxVdgziCVg0DaqdYG4iIjZglDKYguqmBfHGy6LkU934Lr/mZRbkUXxB1ZUuq5umdSE0MLMG
	EC0hTuWOMBaUta11
X-Received: by 2002:a05:6000:1786:b0:3a4:d0fe:42b2 with SMTP id ffacd0b85a97d-3b1fee672aamr4990753f8f.19.1751534787187;
        Thu, 03 Jul 2025 02:26:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVLKRMCm2HThh8pLYhO6+Aw29bJdAnwwp+9OCfLw05ZMXTQBKiqPcwpfOlyAzu0jASdPc6gw==
X-Received: by 2002:a05:6000:1786:b0:3a4:d0fe:42b2 with SMTP id ffacd0b85a97d-3b1fee672aamr4990704f8f.19.1751534786551;
        Thu, 03 Jul 2025 02:26:26 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152e:1400:856d:9957:3ec3:1ddc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c8013b3sm18166555f8f.39.2025.07.03.02.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 02:26:26 -0700 (PDT)
Date: Thu, 3 Jul 2025 05:26:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Lukas Wunner <lukas@wunner.de>, Keith Busch <kbusch@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Parav Pandit <parav@nvidia.com>, virtualization@lists.linux.dev,
	stefanha@redhat.com, alok.a.tiwari@oracle.com
Subject: [PATCH RFC v4 0/5] pci,virtio: report surprise removal event
Message-ID: <cover.1751534711.git.mst@redhat.com>
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


Lukas, Keith, Bjorn, others, would very much appreciate your comments
on whether the pci core changes are acceptable.


Parav, I expect this to be integrated into your work on fixing surprise
removal. As such, I am not queueing these patches yet - please include with your
other patches fixing these issues.

==========

This is an attempt to fix the following race in virtio:

when device removal is initiated by a user
action, such as driver unbind, it in turn initiates driver cleanup and
is then waiting for an interrupt from the device. If the device is now
surprise-removed, that interrupt never arrives and the remove callback hangs
forever.

For example, this was reported for virtio-blk:

        1. the graceful removal is ongoing in the remove() callback, where disk
           deletion del_gendisk() is ongoing, which waits for the requests +to
           complete,

        2. Now few requests are yet to complete, and surprise removal started.

        At this point, virtio block driver will not get notified by the driver
        core layer, because it is likely serializing remove() happening by
        +user/driver unload and PCI hotplug driver-initiated device removal.  So
        vblk driver doesn't know that device is removed, block layer is waiting
        for requests completions to arrive which it never gets.  So
        del_gendisk() gets stuck.

We could add timeouts to handle that, but given virtio blk devices are
implemented in userspace, this makes the device flaky.

Instead, this adds pci core infrastructure, and virtio core
infrastructure, for drivers to be notified of device disconnect.

Actual cleanup in virtio-blk is still TBD.
Compile-tested only.

==========

Notes on the design:

Care was taken to avoid re-introducing the bug fixed by

commit 74ff8864cc84 ("PCI: hotplug: Allow marking devices as disconnected during bind/unbind")

To avoid taking locks on removal path, and to avoid invoking callback
with unpredictable latency, the event is reported through a WQ.

Adding APIs to enable/disable the reporting on probe/remove, helps make
sure the driver won't go away in the middle of the handling, all
without taking any locks.

The benefit is that the resulting API is harder than a callback to
misuse, adding unpredictable latencies to unplug. The WQ can simply do
the cleanup directly, taking any locks it needs for that.  The cost is
several extra bytes per device, which seems modest.


Previous discussion:
https://lore.kernel.org/all/11cfcb55b5302999b0e58b94018f92a379196698.1751136072.git.mst@redhat.com

Changes from v3:
	added documentation to address comments by Parav
	support in virtio core
Changes from v2:
        v2 was corrupted, fat fingers :(
Changes from v1:
         switched to a WQ, with APIs to enable/disable
         added motivation

==========


Michael S. Tsirkin (5):
  pci: report surprise removal event
  virtio: fix comments, readability
  virtio: pack config changed flags
  virtio: allow transports to suppress config change
  virtio: support device disconnect

 drivers/pci/pci.h                  |  6 ++++
 drivers/virtio/virtio.c            | 23 +++++++++++++--
 drivers/virtio/virtio_pci_common.c | 45 ++++++++++++++++++++++++++++++
 drivers/virtio/virtio_pci_common.h |  3 ++
 drivers/virtio/virtio_pci_legacy.c |  2 ++
 drivers/virtio/virtio_pci_modern.c |  2 ++
 include/linux/pci.h                | 45 ++++++++++++++++++++++++++++++
 include/linux/virtio.h             | 11 ++++++--
 include/linux/virtio_config.h      | 32 +++++++++++++++++++++
 9 files changed, 163 insertions(+), 6 deletions(-)

-- 
MST

