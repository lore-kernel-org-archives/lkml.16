Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BC010E0
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 00:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747440681; cv=none; b=Es7lilpsbK+D1KI4529k+SRuzodsiA1rCmzAooY4izIJGUtxYT+PIKVtFY6KwEny5zZL5FK9qsjNc0HjmhcDyYePjYBveJVis+sSPkHmy6qAXrl0vRqf8YWl46Lth2VCLH03sozQPzRCMMunjohsC9iijC5ho+oEeCk8WxI/qwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747440681; c=relaxed/simple;
	bh=1RFUOast+R3cv/fy13QpOewKb0K6kDlwUPWBD6mAkV0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=r/b5BwxCzTiiX2B5Uuma7peFdYucXaSwUt+U/ICJK36AEUtFoXYAN20N+3SlgUytrUfHyyWmiooHLgr23uexU9qio112ZNFdsD8RwhaXJXKoaFw8P5WlQ8a1XbpJg/kNEVrNOOA8SwFZqj59proZp8q4V8esaCs+ViLA1sR4YIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hW9hNQQV; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hW9hNQQV"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b1442e039eeso1618495a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 17:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747440679; x=1748045479; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VVYJbfVpyDKzFCTr5wd6WD4Y02rO0zmMsUqgsnkrKzM=;
        b=hW9hNQQVXkvQOLWm9mNHpQIQg5Ss+UzTP2yeW8iilMl+FHRBOzTAWC08cHex7wwDJJ
         bBWakn+eDTTkl6v4Imt4zD6t67EXqoYJPf52vw8ud6BAmG9DxCihwh9FC7lIesL0n5nd
         e2Xj2pO36EPkHQk/8TyXKQyUncgX1J2Zc2b6ZTnx4NroGqESyK241veJ4xQmh8/t+jhN
         ESjU9CaHs8AF5ejUfqLJ3BtsmJ+cQ1LnmB9lVedEMhoE/yIAjYLIynXC3TsQHW4niYBE
         s99F6tlQQeiyPxee2hhldoQ5ntGnghVavayy8gyRz8GGBxMJpZmkI2Acd5A9sJ8UpEiB
         chew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747440679; x=1748045479;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VVYJbfVpyDKzFCTr5wd6WD4Y02rO0zmMsUqgsnkrKzM=;
        b=exLqQ6vMR02T5/3NPAY6E1U28UBN2lWJrJzfifnUaNxLVm4jQ98zEumqmQSMIA9sTM
         YaheFuCK6+FPR43J/IRmPA97IzdUwW5f75Zshq4MUxcJtVi0TJqvYhbL2sc278fAvO7T
         TH0mGOjvQ1euBZq7S55ezj31qBXW5MujE1j+9PvTmBrHP4CPLwTlDbOlVSg7OPlO+Kwy
         KYvYrJ8JxLHgzo9KqZiQjJ+Y7Nmsn0kYJHlLUignkiwTIH7p+31UU6PIY1/WZ6JLVjrp
         NjM9XbXQSrJywXfdH5dVW71rooiTfMLiM4AWlrx6c3gEqGOx49U+/FlFxgR4jhwUeYiH
         8/2w==
X-Forwarded-Encrypted: i=1; AJvYcCVfZBLdaJPCy3E3CilTu8MzQKyyrr029RASHqJD7eZsVJo07Q5+dbd2mxD3D21huvr/lsLL66PEig4GkLU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLqZbk+WioQfw0kOg934jCL3Mip1KD3/gInBckDIDOGUmMeeEJ
	rWvMRhGWgymnXBCR4vF5Ir35CZyde4sqC2I4pHw/6IqEPiDQwjghwxnJlsF3jz6nFRtUtX72BNg
	eZ/6KDlH4iTrutMItJMVbSvoFRQ==
X-Google-Smtp-Source: AGHT+IE6P/4q+EAWyk4SLxkpbBjM99VYUZwbRdfI+NCSxau1KzLvi2tKfaROimcPlJAc2WWg5XSBSznoEcavVQc0qg==
X-Received: from pffv23.prod.google.com ([2002:aa7:8097:0:b0:742:a335:1e37])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:2d4b:b0:215:e818:9fda with SMTP id adf61e73a8af0-216219d3991mr7936600637.27.1747440679548;
 Fri, 16 May 2025 17:11:19 -0700 (PDT)
Date: Sat, 17 May 2025 00:11:02 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250517001110.183077-1-hramamurthy@google.com>
Subject: [PATCH net-next v2 0/8] gve: Add Rx HW timestamping support
From: Harshitha Ramamurthy <hramamurthy@google.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, jeroendb@google.com, hramamurthy@google.com, 
	andrew+netdev@lunn.ch, willemb@google.com, ziweixiao@google.com, 
	pkaligineedi@google.com, yyd@google.com, joshwash@google.com, 
	shailend@google.com, linux@treblig.org, thostet@google.com, 
	jfraker@google.com, richardcochran@gmail.com, jdamato@fastly.com, 
	vadim.fedorenko@linux.dev, horms@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ziwei Xiao <ziweixiao@google.com>

This patch series add the support of Rx HW timestamping, which sends
adminq commands periodically to the device for clock synchronization with
the nic.

Changes:
v2:
  - add initial PTP device support to utilize the ptp's aux_work to
    schedule sending adminq commands periodically (Jakub Kicinski,
    Vadim Fedorenko)
  - add adminq lock patch into this patch series instead of sending out
    to net since it's only needed to resolve the conflicts between the
    upcoming PTP aux_work and the queue creation/destruction adminq
    commands (Jakub Kicinski)
  - add the missing READ_ONCE (Joe Damato)

Harshitha Ramamurthy (1):
  gve: Add initial PTP device support

John Fraker (5):
  gve: Add device option for nic clock synchronization
  gve: Add adminq command to report nic timestamp
  gve: Add rx hardware timestamp expansion
  gve: Add support for SIOC[GS]HWTSTAMP IOCTLs
  gve: Advertise support for rx hardware timestamping

Kevin Yang (1):
  gve: Add support to query the nic clock

Ziwei Xiao (1):
  gve: Add adminq lock for queues creation and destruction

 drivers/net/ethernet/google/Kconfig           |   1 +
 drivers/net/ethernet/google/gve/Makefile      |   4 +-
 drivers/net/ethernet/google/gve/gve.h         |  29 ++++
 drivers/net/ethernet/google/gve/gve_adminq.c  |  98 +++++++++++--
 drivers/net/ethernet/google/gve/gve_adminq.h  |  26 ++++
 .../net/ethernet/google/gve/gve_desc_dqo.h    |   3 +-
 drivers/net/ethernet/google/gve/gve_ethtool.c |  23 ++-
 drivers/net/ethernet/google/gve/gve_main.c    |  47 +++++++
 drivers/net/ethernet/google/gve/gve_ptp.c     | 132 ++++++++++++++++++
 drivers/net/ethernet/google/gve/gve_rx_dqo.c  |  26 ++++
 10 files changed, 373 insertions(+), 16 deletions(-)
 create mode 100644 drivers/net/ethernet/google/gve/gve_ptp.c

-- 
2.49.0.1112.g889b7c5bd8-goog

