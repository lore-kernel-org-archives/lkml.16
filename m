Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E5010F2
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 00:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749859681; cv=none; b=tr9S9sf0w0XRr4yyy1QqtYaaAWJd7zlATFaHL6r0FJ05ahayogvoZ+67Nkm40mSB9puBI+5S7MdFS6dbhYE0+1GLBCK5EqsTiar/gcdiY+fMSaCX50zRx9wwnYYAmr2Yqnda5wghFc7wHqdn9uzRxmnx4pebW42DA4+I/cGAFZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749859681; c=relaxed/simple;
	bh=u6Wwj2JrD1CSaXYTMcPrahKnTuDnLOLwD5Z2r1esUAE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XMyAIRXxj+tAR6LL+Z3afjeaXE3zwcw2dSB+CMtteCvOzAcnmLeoMxKqZz/ItQzT1Y1LG7QMJiPtFVC0DrPUG/tfMJ06eBXelx2Ej0d2gQ5J4Gvoc9X97Gyf4dXSbBP6cT9InlnVbMKOYJGGpeuREeOKrO2SHVe/sTaAKHX+gog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nr3RSDqV; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nr3RSDqV"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b115fb801bcso2701814a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 17:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749859677; x=1750464477; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4vcr762WDbQ0QddIFaRoGKd26pOHCsd0x4SxrXrcg7k=;
        b=nr3RSDqV4K6tXcnX0RNBpsv4DUgV2b3gHgVQzv8OwXQOz/vLKg65SYl2KsRzMMKQ2N
         Dorbrs0fGXjRs/cKIg+RiKOPMa5omTdd7CQgq1O1sGywekFZV3NVH41alqvd2uRzXbeA
         G5oFSr3QxVr1Cih4NXlANqJ2EzA1W/l23daEE2pv8uXZYH73stSnsKapoIvgzrD9lUzt
         vT6iMQph9z/fKFpYrTROci93uDAclzQtfbde2N8VL+xtiDrowJL7XVNpUGW/xMmaMs/A
         lS5dhArNqlubL934heE7OsfhuOYYzPmKQyIvvvpRunKS4Ldjihn3ihSxLWc+LpwXgcMf
         QARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749859677; x=1750464477;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4vcr762WDbQ0QddIFaRoGKd26pOHCsd0x4SxrXrcg7k=;
        b=Krh4R0pWdLfQGeXg8w8sTivupRrCxhA0VtFqpGEiLtjAu/MSAe54QGcBpSpbzkE2OW
         D+Tl28R5ybv2BB3nVQoN96fz8lUC9kQkzEBtvQdUtwXmpcDDSapl8fGMOatxgTsEyC5p
         D89FA/m4o3n1Uf9VnslnqJnAgOhFN1QdKxEK+lB4IQOF8LqUQN9iK6SKTHiMtA33B42D
         XYfyWpIdBsYx0vfXEJMDtbA+tOCXPSo5e3hPCoKYWko//OuULV9lwQ4a/sCxtis5Ng36
         AuHKzRlYVhx81H5AcvU9YTsIjPdEvb3osEmv8vrWGyRrPQBjTXaMRDKzvQHNgTlDPH0T
         HWaA==
X-Forwarded-Encrypted: i=1; AJvYcCX+PvpoHFz+N5vOLaVkzExwsVSMkVskzUEgNf+JzrskOh9tb+vR9OwMPxEZmnrEnhcW3gkSQ4eE7+F8fKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbzeknZTrHvyDp6AfdWnBUf8+vtE9sQXOnYgvfzaQXYb+gldQ0
	3rnyBA6+MV63b+MK2dZrdIvJjblEuXlGiHgPw4YCfj7bzplA7QtJqfE9nSTgKEZhS6I/7vueqtM
	OJs2Z6nhhceA5gLAg+bdhRM2YNg==
X-Google-Smtp-Source: AGHT+IFRYaranCcE6ufQrSNi60jc40HksifDXkGaYHchGn0qT+3VPnWQFV4JY9HULJlA54H/6IvlzoNjnB5oAyCmRg==
X-Received: from pgbbo11.prod.google.com ([2002:a05:6a02:38b:b0:b2f:6681:1f1e])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:4392:b0:21c:faa4:9abb with SMTP id adf61e73a8af0-21fbd5568a4mr1757891637.20.1749859677580;
 Fri, 13 Jun 2025 17:07:57 -0700 (PDT)
Date: Sat, 14 Jun 2025 00:07:46 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250614000754.164827-1-hramamurthy@google.com>
Subject: [PATCH net-next v5 0/8] gve: Add Rx HW timestamping support
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
the NIC.

The ability to read the PHC from user space will be added in the
future patch series when adding the actual PTP support. For this patch
series, it's adding the initial ptp to utilize the ptp_schedule_worker
to schedule the work of syncing the NIC clock.

Changes:
v5:
  - Change to register PTP when initializing the driver and keep it
    alive until destroying the driver. (Jakub Kicinski)
  - Utilize ptp_cancel_worker_sync instead of unregistering the PHC
    every time when rx timestamping is disabled. (Jakub Kicinski)
  - Add gve_clock_nic_ts_read before the ptp_schedule_worker to do
    the first refresh. (Jakub Kicinski)
  - Add the phc_index info into the gve_get_ts_info. (Jakub Kicinski)
v4:
  - release the ptp in the error path of gve_init_clock (Jakub Kicinski)
  - add two more reserved fields in gve_nic_ts_report, anticipating
    upcoming use, to align size expectations with the device from the
    start (team internal review, Shachar Raindel)
v3:
  - change the last_read to be u64 on patch 6/8 (Vadim Fedorenko)
  - update the title and commit message of patch 7/8 to show it's adding
    support for ndo functions instead of ioctls (Jakub Kicinski)
  - Utilize extack for error logging instead of dev_err (Jakub Kicinski)
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
  gve: Implement ndo_hwtstamp_get/set for RX timestamping
  gve: Advertise support for rx hardware timestamping

Kevin Yang (1):
  gve: Add support to query the nic clock

Ziwei Xiao (1):
  gve: Add adminq lock for queues creation and destruction

 drivers/net/ethernet/google/Kconfig           |   1 +
 drivers/net/ethernet/google/gve/Makefile      |   4 +-
 drivers/net/ethernet/google/gve/gve.h         |  35 +++++
 drivers/net/ethernet/google/gve/gve_adminq.c  |  98 ++++++++++--
 drivers/net/ethernet/google/gve/gve_adminq.h  |  28 ++++
 .../net/ethernet/google/gve/gve_desc_dqo.h    |   3 +-
 drivers/net/ethernet/google/gve/gve_ethtool.c |  26 +++-
 drivers/net/ethernet/google/gve/gve_main.c    |  53 ++++++-
 drivers/net/ethernet/google/gve/gve_ptp.c     | 139 ++++++++++++++++++
 drivers/net/ethernet/google/gve/gve_rx_dqo.c  |  26 ++++
 10 files changed, 396 insertions(+), 17 deletions(-)
 create mode 100644 drivers/net/ethernet/google/gve/gve_ptp.c

-- 
2.50.0.rc1.591.g9c95f17f64-goog

