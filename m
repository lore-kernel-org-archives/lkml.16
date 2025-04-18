Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33361E49F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 22:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745014380; cv=none; b=PA7LRB1oxjZrbU/pfCrMDUP6bkmK0wA26MjgiC+AXb6ocHAZuEIQQk4kS5Ks1wNbQplRyN1tAmnZ0O6fyGDI6zNq19WQvj3j0rPabB+HC2ycOnwN+CUu0eXl3utWg1i9frrsloBFnURvXt/zUJMFR2d7OrjYtErCDOZYjvWgkIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745014380; c=relaxed/simple;
	bh=OaB5clm2Fd55nvf9AoEoWbOeuMTD+ebuClMlN2bpD/4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=KL7Gm/QPyV+ft5J4RsYwLf8IOEmFMSYvswngdRK2Pc/jl/G6t8EHb2A1l+VymB8kCRWvndjLs03F7wJRCS6Ui0C8xxE9X1QxKFoXG+mNAEEpq7IovnI9c/Zip2mW0igAvLY5APdp/D++YhV+gaJqo2XN51RsWpHzSHy5VYmdE3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0C8iYHND; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--hramamurthy.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0C8iYHND"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736cb72efd5so1719394b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745014378; x=1745619178; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tzhfGtY+evoE9VxfviqLe5VC5CnC4BKePYDzdj0PjBk=;
        b=0C8iYHND4avrxkgCWpcGohmatfBYtjYOmfXZDiD/zr2Jktum0FcIpVeV1qBP/Byg1h
         7XYhH8RvPKnxiqwF088rxwoBxPoH3bpiG6Jk9gPHODkp/+9+lwzBWfFd5rx2YO1vUqQS
         D00Owftx4oS1duH3cKEpDSxY6pCnOJxlH9vNNVqA7VM90NcPILS6zAqR4fkhFdGcezs4
         sB/cDu9/XDyxivGAQjWxiG/uU8p+HOT44UiOTw18TRiOuwHSgMamgocxmRqrhaOl+t8B
         HEU12zh5WJVntpQgbs3dVUwOeVxoOQBa2ROAieT3NiGrY07mHcvuzXpU1AhhHIIxhV9v
         G+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745014378; x=1745619178;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tzhfGtY+evoE9VxfviqLe5VC5CnC4BKePYDzdj0PjBk=;
        b=PZJwXV1etUc9N2DXjf/nwJCvLlHEh3VF9l2WjsWYrewWRwufByuPq0FzCiTGh29MyQ
         d7vAt8E4XDgMZyjJNzNC018RjEthTjsHxArX3zkgxVhLdSIUKQgpxJgV23CND1oM92HR
         DcUVOFkqYdU4ydNUZ4aVP3BxPLtd5MLcl55nmn7OBpPFCMwBC2U84Hhf+06NgkwdrrJK
         E5egtsi0iAf1nCEk8SbMUNXprhAcdfOy9Ze04BT3Uza/QcI5VL4pf6Ft6PCI/361OkW2
         exYdR5wD1LhS/wlC0wUIuQ4efu6hBjYSiFaG6v5VsAvVpVGsXu8CnvcZBrYOYn6kuJyR
         92Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWCEqr4Iq9XHQBVzHTHbsWKm1ZebD4rdqp7egBOLKGPiOb/YfhPKgmE2b7Z/m0CjLtc4URf27LtTxpKoDE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+xkGttqK7aC6Quba60WahcWI7AvAoEJIHMfC5APDNwsuuVATA
	UVNau3lmaJ+ZY1uHp0AEoMwwZqKtoqS56wFdTLUo/wBg9s2zgxGMPxDr0vXYi2/sX2WK9/LbAkk
	wej8cplqoj+JG/fWJtr+F7A==
X-Google-Smtp-Source: AGHT+IFCgH6BBYC32pNbnQJa/WcTnXHZ2uCUfF0PiDlUPN0capH4EV5S2WQAQipAxHlB+1TR325seKlefI81vFED5Q==
X-Received: from pfbcw17.prod.google.com ([2002:a05:6a00:4511:b0:732:20df:303c])
 (user=hramamurthy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:e8f:b0:736:6ac4:d1ff with SMTP id d2e1a72fcca58-73dc14573f4mr6212653b3a.3.1745014377884;
 Fri, 18 Apr 2025 15:12:57 -0700 (PDT)
Date: Fri, 18 Apr 2025 22:12:48 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250418221254.112433-1-hramamurthy@google.com>
Subject: [PATCH net-next 0/6] gve: Add Rx HW timestamping support
From: Harshitha Ramamurthy <hramamurthy@google.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, jeroendb@google.com, hramamurthy@google.com, 
	andrew+netdev@lunn.ch, willemb@google.com, ziweixiao@google.com, 
	pkaligineedi@google.com, yyd@google.com, joshwash@google.com, 
	shailend@google.com, linux@treblig.org, thostet@google.com, 
	jfraker@google.com, horms@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ziwei Xiao <ziweixiao@google.com>

This patch series add the support of Rx HW timestamping, which sends
adminq commands periodically to the device for clock synchronization with
the nic.

John Fraker (5):
  gve: Add device option for nic clock synchronization
  gve: Add adminq command to report nic timestamp.
  gve: Add rx hardware timestamp expansion
  gve: Add support for SIOC[GS]HWTSTAMP IOCTLs
  gve: Advertise support for rx hardware timestamping

Kevin Yang (1):
  gve: Add initial gve_clock

 drivers/net/ethernet/google/gve/Makefile      |   2 +-
 drivers/net/ethernet/google/gve/gve.h         |  14 +++
 drivers/net/ethernet/google/gve/gve_adminq.c  |  51 ++++++++-
 drivers/net/ethernet/google/gve/gve_adminq.h  |  26 +++++
 drivers/net/ethernet/google/gve/gve_clock.c   | 103 ++++++++++++++++++
 .../net/ethernet/google/gve/gve_desc_dqo.h    |   3 +-
 drivers/net/ethernet/google/gve/gve_ethtool.c |  23 +++-
 drivers/net/ethernet/google/gve/gve_main.c    |  47 ++++++++
 drivers/net/ethernet/google/gve/gve_rx_dqo.c  |  26 +++++
 9 files changed, 290 insertions(+), 5 deletions(-)
 create mode 100644 drivers/net/ethernet/google/gve/gve_clock.c

-- 
2.49.0.805.g082f7c87e0-goog

