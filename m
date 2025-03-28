Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312E82114
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743165730; cv=none; b=h0vYdJ1AYBBWJxysBY9+kcXVtMYOwTuQWSFwWTWfXQcZx1TBGQBJlv4wSQR7hcubtGyDEBzb97Q3Ndfu0cMutNRJoYfxpu6CvQX76yWOVOp2dyacEg24y3IBfWe0F/63/Cke0tCFmsVdtZU6IpPk4//w+1cr+40PvyJvVEgh0F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743165730; c=relaxed/simple;
	bh=tO0MmKx8+bkak/7Go/XIr7gg64RgCZgpPgb7W3zJlQ0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UZvMbNrS2kH0ZPMGNkqxydmYtmg6vgt4DmLyGKyALkudCm8OhWRgXxjS5gaSne/l9V2smtla70fk7GABJZbGKoG5GHc527EIeQVJ66M5MUiyxo4ptJ35CE9XY5mWr+2mxg5HZ1Oz7fRvdpeXKOIg7uasx64al5WivNANBh6Tbho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wt+IcwVQ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wt+IcwVQ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43690d4605dso14609685e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 05:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743165727; x=1743770527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1NPgjPSP1hsF4rd3gHtDF8BMuGktyi5LIa0kOSCKoU=;
        b=Wt+IcwVQaXOjBSXpl646v82a+IuG6AN3bjRBaxsSZqomNZHsKj2jxmaAepyVF6Grra
         i09OImmIszNCZMekdMwWg8tnWmoj5Iga+Lh2bCgdWkQ1GJkB1fsyIpZLUNKYuXsg6Skl
         Olbm7oKMC0Wj3N5etvyaUaBO1LiCUcgArDMzwIcumVgW/V+ufl/gEq5kuQG7qACBE5Ox
         qTshaVdlDI75gm+jt6MUwOwYx0YqpwtAE5jjqHMjADAUA2lnmHQHUiR9b4r0oEXt56u0
         axJVWjG6PdTowX2/YmILBy5u6gt4dJTALEcpL6zb9ADGKTahEe5DcNXimslMGJyDfwRd
         PUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743165727; x=1743770527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q1NPgjPSP1hsF4rd3gHtDF8BMuGktyi5LIa0kOSCKoU=;
        b=suY5W/oVDQUPqbPe2tvUUHPgSIaejM0BY9/DIdT9pEK15KdVw+d5C5AAiUjcgylPnk
         0IXFkuvqB+fzfQ2wuQI4eB0piwVdOhcwmMNP6xyzVPeAdYkf3rfeElFNaFlUAqWQ9qZw
         rI47+EzaSNb69i8d1/rbbrtemCHcWxamg2t8VsnpeyONoszvKnZ0qkTLp0HjppNyfiFL
         AqvKtrE2lEB4zk8Hamyto/lkSNo7BB1NjZ7pD3+4Y8PS0Xs489V//fpKzxR8vzq93md8
         DFEpQVphNeWxMkXeo+pkV9230pmlRHNhVqtClzviDFlsxyYtJwlLD2D1b2HeXdOoyxkX
         vemg==
X-Forwarded-Encrypted: i=1; AJvYcCVjBDHkxs0C/NQQ8NH5Wr5hGCazW/1wVaZ47Gxi4hqg+SXiBcSpBLeLJ60EB85YwbvdHsXa1baHSrow1lM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwWmpNUb4qcHrQFQwOifn+H3Mw72fpsA0EvQZR5/47tcpgOBj8
	utePrBsjcz9pQv5LHDQLMICU1AV1yPqix1rO/tdQ4DQ/9FWpYI/c
X-Gm-Gg: ASbGncvEpUC+cCm5FSKlHr4Je7H8abiMDpPngcofUPgyJdRvfQax5ls2Z9zH0AMnb0M
	CRL/fFlAmy9RXELhu80HRnbmIDPhe9KulLRWrrZpzSg909b5zRscKL4LVTBPpQ3qFdmoucC+IlF
	dsfMYwjrAdQDj6zEQy9Gn4t0ZptMjrmBFXJA+6isf3wxuNYJMyPi4N3DxSQTS5X2owPeM5ByicT
	SIsC9dVbAa2Y01EkEC4bVXQFFKV36fwobZIfo+j1NWOhbjv8Nw7S2yaXZJw/6hdwW+ranl1d9cE
	UiJ37ppoqAaMy0DH6VulPFwsvjpFoNUG6E1HzC3bwg9QEIib
X-Google-Smtp-Source: AGHT+IFHTVOHCUHe3uNUBfaGKjYLW4w/fKeyCR5Sm0RKUd5SZLXdqL+lpPe/hlv5+vCMxDsLSeWGGg==
X-Received: by 2002:a05:600c:3c98:b0:43d:7588:6699 with SMTP id 5b1f17b1804b1-43d850a61a4mr69496685e9.7.1743165727059;
        Fri, 28 Mar 2025 05:42:07 -0700 (PDT)
Received: from HP-650 ([105.112.193.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6589efsm2591204f8f.16.2025.03.28.05.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 05:42:06 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	julia.lawall@inria.fr,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH 0/5] staging: rtl8723bs: code cleanup patches
Date: Fri, 28 Mar 2025 13:39:37 +0100
Message-Id: <cover.1743163800.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch is created to address different checkpatch warnings and checks
for the staging/rtl8723bs module.
The patches are to be applied in sequence.

Abraham Samuel Adekunle (5):
  staging: rtl8723bs: correct coding style by preventing lines from
    ending with '('
  staging: rtl8723bs: align function return type and name on the same
    line
  staging: rtl8723bs: add spaces around binary and ternary operators
  staging: rtl8723bs: correct placement of braces around if-else block
  staging: rtl8723bs: modify variable names to comply with kernel naming
    convention

 drivers/staging/rtl8723bs/core/rtw_ap.c       | 232 +++++-------------
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  42 ++--
 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 117 +++------
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  77 +++---
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |   6 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  67 ++---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 153 ++++++------
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  21 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  36 +--
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  18 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |   8 +-
 11 files changed, 315 insertions(+), 462 deletions(-)

-- 
2.34.1

