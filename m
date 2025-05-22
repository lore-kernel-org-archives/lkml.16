Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0CD24DCE8
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 23:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747958262; cv=none; b=NBQcHKIf1FG2K/Z5LduP63W2cNIqmVG0VIuKGQa0cezleCBG7lmBlT06oEvEYYIs177X/Ga4/7WNkNtS6QJsHElpbBBMUgtr5XsXQN198pfMo/YOvRJmlq/Knah90gv2RgIx3MnB2Puraz69XyQ30TgieGCuPI/5kQbHTssAtWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747958262; c=relaxed/simple;
	bh=+N4Q7/Fx9GrtcgTHahPABpkNsBT9qTCA29g7DhXDB24=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=lnvyrS245L6NaoVmbMl/gZKlgh5u1k2q6NmMtNTq8K0f15E8WycMPL1EQAz3Or5qH3sXmaSHGlKB+Xf77XIvOqMbKtR9xk6+BgeVOLW13U5qounvA3Io/+QAfjGCkwOGwmHErf3xJTUv0mFKVfXTwD44FZPhml+d3C8ZcZUihkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=biWmSEGo; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="biWmSEGo"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7394792f83cso6845072b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747958260; x=1748563060; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E695lb6mnZG2Azxgeb2zoRXaKZzc2rWePmDYZ8LrO3g=;
        b=biWmSEGohXjQKBEX5gwhK+yhULX3GpIBm2VjGqN1gIpBWk+nS6rUk0rROw27hdDeFa
         7Hfjfpq4kAL926spm5Qk3sbxshkGzkoRlhvfD+mFDf8Bfd0WrOdbjujVLn/P2FdPe8BE
         7ic/b8m4hlOdYsHWKt6M0UeiH1ecQ7wJdZxUlj3jFQpJrJzlKkLkjGRdfzHRGH9e/H3Z
         6J8bQlV9re7oFXq+1e7PSgdBYpGe9ADcIbbgmYooeNNgeJoQyJzyZjl0KZGDVQnEOttf
         Je92tnVVBkA1G6yxG8F6sD8Ra2iuHU6eLA/qskmtifsQaVh2oc3qcQ/uP02k0FsVxyOf
         AGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747958260; x=1748563060;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E695lb6mnZG2Azxgeb2zoRXaKZzc2rWePmDYZ8LrO3g=;
        b=U1TUeZMH8NooRfEC1O5lhmmo9YzmR14A+q6Kprv8D6Y6n5kX8D7TkPDQeiw8tXK71c
         h5TPTQTP0b9ZHtQroninZy9iEA2iVyfMkVHuh7zR5pr2sXVLi/rqfh1cC3WSu8TksN/c
         Ram+z2fmpygFTRbCBbovLeFktGusSu4M+8SeFHFEKVbQIWjoziRTX/4Enb8n/CXDhCUb
         +O/spfNO72evyClfDUtqzWxbuy/+IeAGg7JunVW9RL2uUQo6U5lAyhPnUQxLhz5NFO6N
         qf990cwQBJatlNN9b7O4V/DIvrXuqK6D8yrfamSrZ7ktHD8w/AdWrUHArU6i/Y2O1vGW
         Jhig==
X-Forwarded-Encrypted: i=1; AJvYcCVlevQ+iGPPHDpUz7HhP/POM8UmzFNpY2ooZKqhdKrlP8H0gSwojBkb+zxPmAS2+ECCqJ2JQs0KtnSq5dc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoD6AvsgIQQOBuMBIwg1aJxLt4vKGBIZPbp8i97AwmTshrUNn2
	EovXVL5Xi0Ym1nn1sEdlD8k/pqF4NsZtu4jNF8WNKGGw325HMcfuBIOuvItHh2UOq3+CHb8Y+cr
	E+dM8mxlxhI/lW5cMhattAMhcvw==
X-Google-Smtp-Source: AGHT+IFg3AqzfCowzRgk/1BxZBoVCFnad1BcDRGhv6GqoVuBPz9n6dzqgqi1FQGJMI89AZX695orPjg9TaHpIpsWUg==
X-Received: from pfbic8.prod.google.com ([2002:a05:6a00:8a08:b0:736:86e0:8dee])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:9455:b0:73d:ff02:8d83 with SMTP id d2e1a72fcca58-742a9786a85mr39674567b3a.3.1747958260570;
 Thu, 22 May 2025 16:57:40 -0700 (PDT)
Date: Thu, 22 May 2025 23:57:29 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235737.1925605-1-hramamurthy@google.com>
Subject: [PATCH net-next v3 0/8] gve: Add Rx HW timestamping support
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
 drivers/net/ethernet/google/gve/gve_adminq.h  |  26 ++++
 .../net/ethernet/google/gve/gve_desc_dqo.h    |   3 +-
 drivers/net/ethernet/google/gve/gve_ethtool.c |  23 ++-
 drivers/net/ethernet/google/gve/gve_main.c    |  47 +++++++
 drivers/net/ethernet/google/gve/gve_ptp.c     | 132 ++++++++++++++++++
 drivers/net/ethernet/google/gve/gve_rx_dqo.c  |  26 ++++
 10 files changed, 373 insertions(+), 16 deletions(-)
 create mode 100644 drivers/net/ethernet/google/gve/gve_ptp.c

-- 
2.49.0.1143.g0be31eac6b-goog

