Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB53220E328
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 18:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749494435; cv=none; b=eiQ8JkbYdnf8Q2BGVDyiLBFCi4WnZvrpBY7KhI4SUnCUNTAhdYV9qxraS4ZDAGjt0hv8Y3QQYQnHRV2lbV/quS9jBOX+fq37hSCx73zIr294q6G7QRaJgKPf2HNuqGTkE/AVRLBKh5dtgJLco+lMYsqZiY8cw9x4eqyujYWdw4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749494435; c=relaxed/simple;
	bh=/EbOyE74/+xw2Qe4YNOTD1aW+YnWxBSIZWc7XSYciJY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=WOO1Cb1rj0OpJidk+Wn3RLDAMt1W/bFillWUJCHku0Z2xxRe/yyspjZt1Aeeq1jc34N5Vnagyge8/5T9plATEFouVK2jjWq1NifhMqygB1zaevqEFvBdRJVVpbPYkWzOdhOfMj0K5TctpEp4RP3RZyk9M576edKDI3kxXVFWijs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gMGUj3rU; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gMGUj3rU"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-74858256d38so638884b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 11:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749494433; x=1750099233; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SgtR2Rm6au1768qjFPYDCyyBz8a8l6s1CM89uXuSWKg=;
        b=gMGUj3rUoh7I/a+VPuYDekq1PQ78cn3GUJWF8EsaviFFtEbCRDrPqwyz53zjlIMcej
         ifcQ17d2pzoMrwZAGhIe26Q3/EAE+9vGzN7psTIXkVzNzhyqakWD00gqEx1IK0ux1x1C
         mVpq8aA8cQb7IP3punapzduwEdr8Fpa6qmMhQQEoV77zMzLBhNTE0b9I/dW2erMsaKuv
         UYSeEpj8kxAbOgJPh8cesYNDH7fZ9Im1zutVaNsJ9WhoR6aZatT/+b26+Y8epq/cbo2O
         KvtnjeCKP/5ysCXPPin7yjyfdPIiz4xZW5eleoXtMgaSchdVi3RLOXDmjBJwb/KGpGEB
         y23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749494433; x=1750099233;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SgtR2Rm6au1768qjFPYDCyyBz8a8l6s1CM89uXuSWKg=;
        b=R8AiC1Xs3ZW4HCPnjm48ywckBomi7fF2j/YJQcGN1c2TgOgoKdhNde6v4k5HJqOvKg
         /gQ/o1+07rRd2umCSejmPGhmFVnXuXfaeuehecLRF1HjhM3ubqUm63MHGlRV8cFyh8Tw
         8Xga9rIvRdpXwa1Ij/9vrCoArV+JlM06hX69oGrYSmXWQx9ZDG0H6uHHAgivHHGyS8dT
         HXWlCw+QKprs2rkV2TMCLv3Z5dh4n2O8Y8tG8G9JmPvx4Ebsf6U/kpwqxNEYFnobeIsH
         DOs0Bswa5AeD6wk/gvDXnY0qKG7pbDfvxBz+2gzEpo61Ce1T2HVnQe1oxMWqVVj9srGB
         F4mg==
X-Forwarded-Encrypted: i=1; AJvYcCUosHS98XpT0YO/WBbn1YbZ7NevpI61MIporbnUQnX/i0pJOFYE9IFZWjMvAs6dpTYrqH0sz8/xNZFlwMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCpF3hauDtNSSutq5AOLw8b3LXgNxIMeyl5hJeUlxAN4aNA+iN
	o5Vlxpe3l93ARpkPsVkomKG6/aTvdAk2l1LxPUH6UD1OKFJGzM1tfLY+S95Gwx1oVp5Ttx6bfUz
	7Dny3p3MsJ4WJ0uiZ/lQADvvWzQ==
X-Google-Smtp-Source: AGHT+IFPskpgTl0cIwyUttrMFfUNbuj7x+gYDt0OPiPmqkyT4EZiUO0QJFiINDVHNpNFNNY/Q8gJNxnk3S0HzabBdg==
X-Received: from pfiv6.prod.google.com ([2002:aa7:99c6:0:b0:73c:6d5:ce4c])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:1604:b0:1f5:6b36:f57a with SMTP id adf61e73a8af0-21ee2618e34mr18363183637.39.1749494433253;
 Mon, 09 Jun 2025 11:40:33 -0700 (PDT)
Date: Mon,  9 Jun 2025 18:40:21 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250609184029.2634345-1-hramamurthy@google.com>
Subject: [PATCH net-next v4 0/8] gve: Add Rx HW timestamping support
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
 drivers/net/ethernet/google/gve/gve.h         |  29 ++++
 drivers/net/ethernet/google/gve/gve_adminq.c  |  98 +++++++++++--
 drivers/net/ethernet/google/gve/gve_adminq.h  |  28 ++++
 .../net/ethernet/google/gve/gve_desc_dqo.h    |   3 +-
 drivers/net/ethernet/google/gve/gve_ethtool.c |  23 ++-
 drivers/net/ethernet/google/gve/gve_main.c    |  47 ++++++
 drivers/net/ethernet/google/gve/gve_ptp.c     | 137 ++++++++++++++++++
 drivers/net/ethernet/google/gve/gve_rx_dqo.c  |  26 ++++
 10 files changed, 380 insertions(+), 16 deletions(-)
 create mode 100644 drivers/net/ethernet/google/gve/gve_ptp.c

-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

