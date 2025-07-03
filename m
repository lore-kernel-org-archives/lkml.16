Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4234B155326
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 13:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751548937; cv=none; b=Qr74yKtxu8VCeje3voLlE1H67uzFG+i9Jcl7vvjHn8okJrxNw48wqaept7gLMYLegt5/36REQtgxvrvAv4LWwXmjGmkaLvdBFJ2pnyRNrpXWKFNqKX86ejsDh3Qk/T5uOxnm/NkHpoSalm0CFlVCHAkR5KluEoyWeUlHdjBWjTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751548937; c=relaxed/simple;
	bh=WatsLhEqxxRQO2BKB/QaLjbLLm8Bmi7hxVyA8S1HxSc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QXExTRF1tP5p94GEXk9vuAhF3lF0ye0ga28Sj04haNlDYzCT6E3iTzEZi/XmeDcWssxr33ohZ3PPtLnk6rfriCqYl8Sw91RJq5lfCWcV0jesJU9mzL2RPGXo9lxL8o+NVj00/ShCKwUFmN+/cbX12fTleshHU7nASRog5l/dG5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ReSw3I6r; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ReSw3I6r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751548933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dMZQdR9FvwcYqCFm9P+KhO+sujNaYy5P5Nd+l/eOb9g=;
	b=ReSw3I6rLVZDaG9POZFiOKZOP8hJhnZFcFoWSGslx2lbIEJnO0er0tkZ/y/294/MVPgucR
	TptrZk7pd3ode+eyzTQW1avuFb1flCZFE+FNLWRPeUF9Jyn68zB6fZh9Q72o81EM6897sw
	eW4D+pEAu/uknsg7hpO1HgHRVtE4yqw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-613-AhybN3tsMp6_hfxw-mtIhQ-1; Thu,
 03 Jul 2025 09:22:07 -0400
X-MC-Unique: AhybN3tsMp6_hfxw-mtIhQ-1
X-Mimecast-MFC-AGG-ID: AhybN3tsMp6_hfxw-mtIhQ_1751548926
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 901D7180034E;
	Thu,  3 Jul 2025 13:22:06 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.44.33.20])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7B543195608F;
	Thu,  3 Jul 2025 13:22:04 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: torvalds@linux-foundation.org
Cc: kuba@kernel.org,
	davem@davemloft.net,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Networking for v6.16-rc5
Date: Thu,  3 Jul 2025 15:21:58 +0200
Message-ID: <20250703132158.33888-1-pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Hi Linus!

The following changes since commit e34a79b96ab9d49ed8b605fee11099cf3efbb428:

  Merge tag 'net-6.16-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2025-06-26 09:13:27 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git net-6.16-rc5

for you to fetch changes up to 223e2288f4b8c262a864e2c03964ffac91744cd5:

  vsock/vmci: Clear the vmci transport packet properly when initializing it (2025-07-03 12:52:52 +0200)

----------------------------------------------------------------
Including fixes from Bluetooth.

Current release - new code bugs:

  - eth: txgbe: fix the issue of TX failure

  - eth: ngbe: specify IRQ vector when the number of VFs is 7

Previous releases - regressions:

  - sched: always pass notifications when child class becomes empty

  - ipv4: fix stat increase when udp early demux drops the packet

  - bluetooth: prevent unintended pause by checking if advertising is active

  - virtio: fix error reporting in virtqueue_resize

  - eth: virtio-net:
    - ensure the received length does not exceed allocated size
    - fix the xsk frame's length check

  - eth: lan78xx: fix WARN in __netif_napi_del_locked on disconnect

Previous releases - always broken:

  - bluetooth: mesh: check instances prior disabling advertising

  - eth: idpf: convert control queue mutex to a spinlock

  - eth: dpaa2: fix xdp_rxq_info leak

  - eth: amd-xgbe: align CL37 AN sequence as per databook

Signed-off-by: Paolo Abeni <pabeni@redhat.com>

----------------------------------------------------------------
Ahmed Zaki (1):
      idpf: convert control queue mutex to a spinlock

Alok Tiwari (1):
      enic: fix incorrect MTU comparison in enic_change_mtu()

Antoine Tenart (1):
      net: ipv4: fix stat increase when udp early demux drops the packet

Bui Quang Minh (4):
      virtio-net: ensure the received length does not exceed allocated size
      virtio-net: remove redundant truesize check with PAGE_SIZE
      virtio-net: use the check_mergeable_len helper
      virtio-net: xsk: rx: fix the frame's length check

Christian Eggers (4):
      Bluetooth: hci_sync: revert some mesh modifications
      Bluetooth: MGMT: set_mesh: update LE scan interval and window
      Bluetooth: MGMT: mesh_send: check instances prior disabling advertising
      Bluetooth: HCI: Set extended advertising data synchronously

Dan Carpenter (1):
      lib: test_objagg: Set error message in check_expect_hints_stats()

Fushuai Wang (1):
      dpaa2-eth: fix xdp_rxq_info leak

HarshaVardhana S A (1):
      vsock/vmci: Clear the vmci transport packet properly when initializing it

Jakub Kicinski (3):
      docs: netdev: correct the heading level for co-posting selftests
      Merge tag 'for-net-2025-06-27' of git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth
      Merge branch '200GbE' of git://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue

Jan Karcher (1):
      MAINTAINERS: update smc section

Jiawen Wu (5):
      net: txgbe: fix the issue of TX failure
      net: libwx: fix the incorrect display of the queue number
      net: txgbe: request MISC IRQ in ndo_open
      net: wangxun: revert the adjustment of the IRQ vector sequence
      net: ngbe: specify IRQ vector when the number of VFs is 7

Kohei Enju (1):
      rose: fix dangling neighbour pointers in rose_rt_device_down()

Krzysztof Kozlowski (1):
      dt-bindings: net: sophgo,sg2044-dwmac: Drop status from the example

Laurent Vivier (3):
      virtio_ring: Fix error reporting in virtqueue_resize
      virtio_net: Cleanup '2+MAX_SKB_FRAGS'
      virtio_net: Enforce minimum TX ring size for reliability

Lion Ackermann (1):
      net/sched: Always pass notifications when child class becomes empty

Lukas Bulwahn (1):
      MAINTAINERS: adjust file entry after renaming rzv2h-gbeth dtb

Mark Bloch (1):
      MAINTAINERS: Add myself as mlx5 core and mlx5e co-maintainer

Michal Swiatkowski (1):
      idpf: return 0 size for RSS key if not supported

Oleksij Rempel (1):
      net: usb: lan78xx: fix WARN in __netif_napi_del_locked on disconnect

Paolo Abeni (3):
      Merge branch 'virtio-net-fixes-for-mergeable-xdp-receive-path'
      Merge branch 'virtio-fixes-for-tx-ring-sizing-and-resize-error-reporting'
      Merge branch 'fix-irq-vectors'

Raju Rangoju (2):
      amd-xgbe: align CL37 AN sequence as per databook
      amd-xgbe: do not double read link status

Thomas Fourier (2):
      ethernet: atl1: Add missing DMA mapping error checks and count errors
      nui: Fix dma_mapping_error() check

Ulrich Weber (1):
      doc: tls: socket needs to be established to enable ulp

Vitaly Lifshits (1):
      igc: disable L1.2 PCI-E link substate to avoid performance issue

Yang Li (1):
      Bluetooth: Prevent unintended pause by checking if advertising is active

 .../bindings/net/sophgo,sg2044-dwmac.yaml          |   3 +-
 Documentation/networking/tls.rst                   |   4 +-
 Documentation/process/maintainer-netdev.rst        |   2 +-
 MAINTAINERS                                        |  10 +-
 drivers/net/ethernet/amd/xgbe/xgbe-common.h        |   2 +
 drivers/net/ethernet/amd/xgbe/xgbe-mdio.c          |  13 ++
 drivers/net/ethernet/amd/xgbe/xgbe-phy-v2.c        |  24 ++-
 drivers/net/ethernet/amd/xgbe/xgbe.h               |   4 +-
 drivers/net/ethernet/atheros/atlx/atl1.c           |  79 +++++--
 drivers/net/ethernet/cisco/enic/enic_main.c        |   4 +-
 drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c   |  26 ++-
 drivers/net/ethernet/intel/idpf/idpf_controlq.c    |  23 +--
 .../net/ethernet/intel/idpf/idpf_controlq_api.h    |   2 +-
 drivers/net/ethernet/intel/idpf/idpf_ethtool.c     |   4 +-
 drivers/net/ethernet/intel/idpf/idpf_lib.c         |  12 +-
 drivers/net/ethernet/intel/igc/igc_main.c          |  10 +
 drivers/net/ethernet/sun/niu.c                     |  31 ++-
 drivers/net/ethernet/sun/niu.h                     |   4 +
 drivers/net/ethernet/wangxun/libwx/wx_lib.c        |  27 ++-
 drivers/net/ethernet/wangxun/libwx/wx_sriov.c      |   4 +
 drivers/net/ethernet/wangxun/libwx/wx_type.h       |   3 +-
 drivers/net/ethernet/wangxun/ngbe/ngbe_main.c      |   4 +-
 drivers/net/ethernet/wangxun/ngbe/ngbe_type.h      |   2 +-
 drivers/net/ethernet/wangxun/txgbe/txgbe_aml.c     |   1 +
 drivers/net/ethernet/wangxun/txgbe/txgbe_irq.c     |   8 +-
 drivers/net/ethernet/wangxun/txgbe/txgbe_main.c    |  22 +-
 drivers/net/ethernet/wangxun/txgbe/txgbe_type.h    |   4 +-
 drivers/net/usb/lan78xx.c                          |   2 -
 drivers/net/virtio_net.c                           | 111 ++++++----
 drivers/virtio/virtio_ring.c                       |   8 +-
 lib/test_objagg.c                                  |   4 +-
 net/bluetooth/hci_event.c                          |  36 ----
 net/bluetooth/hci_sync.c                           | 227 +++++++++++++--------
 net/bluetooth/mgmt.c                               |  25 ++-
 net/ipv4/ip_input.c                                |   7 +-
 net/rose/rose_route.c                              |  15 +-
 net/sched/sch_api.c                                |  19 +-
 net/vmw_vsock/vmci_transport.c                     |   4 +-
 38 files changed, 494 insertions(+), 296 deletions(-)

