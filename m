Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B402E3704;
	Sun,  6 Jul 2025 04:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751775851; cv=none; b=TwaXItlrCYNeJCyQQuURAnY4hHW1GaZnHFh9d1iEL5N/boqLEeyOSDyRvRVCrFT+lvL9pXBp3veoB1hxXp5Qb64Eaw56S25ICgiL90IxN1ufnF3B+Z9/vs9zwOpHTOzT8GhMazqvpA5TWCItpgqa913u+2IjDSJv3MXev0IIV44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751775851; c=relaxed/simple;
	bh=/5RuqiQYjAvwb56yYsbSd2AVE++MunCyxoihoFYEcFo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dgw+7eTP3xY0qHBBKccyCURhOXX83fGKm50gwhwXdWNj4+WeY1GB4rlwa1Qp64v6+qH5di2mRo21cYFnTboZwSZo9FtweEyyBg7ntURmoJBao94RYe3k0KpLqON6jGtY1osnY4Q4GFW4lXxUUBwlU0Omb5dD/4ydcbs4KHC+rHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqLPynf1; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqLPynf1"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-748e378ba4fso2667873b3a.1;
        Sat, 05 Jul 2025 21:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751775849; x=1752380649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uhSvoJH0XX/OfBAupLeB811heAkQkGDo05cZmoEr3E4=;
        b=aqLPynf19nMeAiM3n3Q9wDlGp3o3v9cjuCHx89yqNTFe+J32exQcG7iFbt+mtzjEyV
         JeOGQvcDwU9nxoux88+/O2WL6vTmmV4Sy/gHVDLTUw5GIBcj/oDl2rbq6KnUlfTBJ+kG
         XVEv1o2BCPms5H29QscyjvyQy0GPiNNaq1vfYvBGL6bjDnJOH2wzeRlT0x7NOEW2/elX
         k4bEO0KQ4UoKBtIGqgsxqfULAE9zZFnHcZ68uOdsRseDVfZSm6rbt1h4SrceUscYRNn6
         iFbNLRwr5EI3y6iIRtAVUwG7AQVxgu8VotvszdcBYHQNO0gJFlMqS3frgskBGey2CD3R
         CYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751775849; x=1752380649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uhSvoJH0XX/OfBAupLeB811heAkQkGDo05cZmoEr3E4=;
        b=sTbvb3M35FLBiiRgpOZJuhKjkykBRKX3sJv36rfYvkidaxslVYFDsJEkINcZmoUyAo
         33FtpAx2AuKIKt4TPHPwU6mMGHBcnc+li0qV2GSv1oxAimxxQzqkOa9TeXIEz2A3wqF2
         +HkjUP1ruGXfM/u8roMdhxLWMe5moplx2Jdj3wCodjjV+WuEp5y/ukcjCSxDr2pYXMW6
         TNOReqQwMkq98CiPO0Xpur3z0sGsPXlSAliqLPQb8sm+/tCR0to+TAHDkr+KZjMgFLp0
         m7Fulzb/tr4KivGU33kUCqCVhrGvWE3QXO/fcQ2vK+iTg+8/AYmwGxAD+gKTcdwE8vz9
         RANQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3JiHkAzO+CqE60RRgDo67p2Xr0sDDJDn7y/3MeVNUP7nc4XLRULnJwdNLm7E79ko4hIV/LUSTGttg@vger.kernel.org, AJvYcCV9rjIIrTXL/7lDmvfE9ZyluiS2Xx0Eg6m/NeYeKwSeTg6UM/Z0RD2Y7sbdAO7xger1WPyqJUGk7Mhn0pMM@vger.kernel.org
X-Gm-Message-State: AOJu0YwFq6cZ2SgkVvGxXN/QujAlX+dn9fZiplipBrfjK8USmjXpM9lO
	6oF4IU/S1WRqIiZWgrNfpNjzErdTfSlCPhWPKkXBvIAPnCkzPEueCRc6
X-Gm-Gg: ASbGncsiF3uARbr3VeqHzA+Fryw2YNgUDtlbQOP39x+nO5mpoG9hupwMdepKcTvs+Uc
	7tEYzetO3gsogeAhvdoU948pwLsVYS2lST3TI4w+toUd2As3l1LLJEjKfS6GB8zVFPX5lLpYYc0
	g482scdEaspwuwNZpBjccJazKmfQAlr7fGa1+FqFJS5C3pLD6oO0Pxs3AtM5hYrEezmjZP4sZCM
	Is2NqI/xocs8oYTraFimVv/Ss24BrV6FqVh8FI9e1V7U1sDgcm0lfNoOpzAaXASf+OVEdjpO93a
	HdCo1Eal5iyGI9Vz88FxAYXf4Twpw2BarLUF3PoFtvC7Y9JhLwAFaZARnG4iK7YVdRoafO8Z5/i
	1L7ngjXR624q5S/zZvxZmLaolLRGwk64378jRjl8=
X-Google-Smtp-Source: AGHT+IGtzwJ3JG9jDZq93UShLC20pA1tuJ1i6r+Xx5nA8auWyQabjh+hUgo+LzZaEIr56LDORbmPzw==
X-Received: by 2002:a05:6a00:2315:b0:736:6043:69f9 with SMTP id d2e1a72fcca58-74cf6fb8a8emr6019500b3a.19.1751775849273;
        Sat, 05 Jul 2025 21:24:09 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417f206sm5287067b3a.76.2025.07.05.21.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 21:24:08 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v2 0/9] ARM: dts: aspeed: Add Meta Darwin dts
Date: Sat,  5 Jul 2025 21:23:50 -0700
Message-ID: <20250706042404.138128-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Ren <rentao.bupt@gmail.com>

The patch series introduces the initial device tree for Meta/Facebook
Darwin AST2600 BMC.

Patches #1, #2 and #3 fixes the DTB warnings in wedge400/fuji dts and
ast2600-facebook-netbmc-common.dtsi.

Patches #4, #5 and #6 introduces a new BMC flash layout to be used by
wedge400 and fuji (and later more Meta Network BMC platforms).

Patch #7 moves eMMC entries from ast2600-facebook-netbmc-common.dtsi to
each BMC platform because eMMC was removed from future Meta Network BMC
platforms.

Patches #8 and #9 adds Meta Darwin BMC and updates devicetree bindings.

Tao Ren (9):
  ARM: dts: aspeed: wedge400: Fix DTB warnings
  ARM: dts: aspeed: fuji: Fix DTB warnings
  ARM: dts: aspeed: Fix DTB warnings in
    ast2600-facebook-netbmc-common.dtsi
  ARM: dts: aspeed: Add facebook-bmc-flash-layout-128-data64.dtsi
  ARM: dts: aspeed: wedge400: Extend data0 partition to 64MB
  ARM: dts: aspeed: Move flash layout out of Facebook netbmc-common.dtsi
  ARM: dts: aspeed: Move eMMC out of ast2600-facebook-netbmc-common.dtsi
  dt-bindings: arm: aspeed: add Facebook Darwin board
  ARM: dts: aspeed: Add Facebook Darwin (AST2600) BMC

 .../bindings/arm/aspeed/aspeed.yaml           |  1 +
 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../dts/aspeed/aspeed-bmc-facebook-darwin.dts | 78 +++++++++++++++++++
 .../dts/aspeed/aspeed-bmc-facebook-elbert.dts | 18 +++++
 .../dts/aspeed/aspeed-bmc-facebook-fuji.dts   | 24 ++++--
 .../aspeed/aspeed-bmc-facebook-wedge400.dts   |  8 +-
 .../ast2600-facebook-netbmc-common.dtsi       | 24 ++----
 .../facebook-bmc-flash-layout-128-data64.dtsi | 60 ++++++++++++++
 8 files changed, 187 insertions(+), 27 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts
 create mode 100644 arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128-data64.dtsi

-- 
2.47.1

