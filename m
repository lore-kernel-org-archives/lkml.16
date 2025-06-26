Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BA32580F3;
	Thu, 26 Jun 2025 14:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750946692; cv=none; b=Pcghls31ClaozYndomRfbGhzykOQxGUGg6rH9bA/MscfDPF8Gs30koLILt+HxUHa+1YYtUeK/Y38vZU2SymMfWgXNwXX4uICnfILAdExy2FcDW/y2iqdn/XTpvyZoTjZwNCK5muVKK+JAUrssNR7d0g2mhqns4MWB2abyV2Ao+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750946692; c=relaxed/simple;
	bh=Uv9jTOf8On1qgjDNbZ7SA+r4wRv5zCdvydQoA27GjSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YCJpxFY1okcQJbAMaddiPzSHEfLsiETH/ZhRcIr4zHj8wupxymtcb6513+N53afClZbPt+E4vZZMVdIMDljQxSWZxzl009Hgv4prgjOAK7HlzMcOrDfHtAdDR3SDqzCwfKwCC3VECfqNpVTd/FzRiMH0T32LFjErQqJf6+fwCLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVn8NzQz; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVn8NzQz"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-607b59b447bso1663794a12.1;
        Thu, 26 Jun 2025 07:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750946689; x=1751551489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7wrnpvlRo7ZrS4SCXZw5XRzZPMOW57pJM9b/u98SiOg=;
        b=nVn8NzQz8BkAlcQutto1B0wKWcrFc/5RByMH6TUD4aOEN/ggijt+OWai0bK0lH32oh
         Hn9GSa/vDrEC9OauifmKYkg/vtF763IyEhliT/Hi61VHgI1k5IBN4qFmsHJDHdXvVD9v
         kOg3MJKDWasTYj0IlzFLW385DzDiPMijH6MdNkUvQ7LkIOtTh2i2rY1+DGCQmSnWtxfp
         Pwh535sqkHzByYTxc0vCogJyDMyoN80duDpKtvthSe1o2qVLhAZiiVRsryh/Z2PsIB6V
         eaQXY39ZLRPUe+tN0qp4hTB3F5Lhg/6f5/02rSims/jqxFp4yWztzzGhM+1KIG5lnKbM
         jy/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750946689; x=1751551489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7wrnpvlRo7ZrS4SCXZw5XRzZPMOW57pJM9b/u98SiOg=;
        b=ZFayp8+G2zA9CWYAl+WJYtkUq8TYhIcZcTOq2mVOnqPKA79LsNkghsvQ0F4tjEusbo
         zyiWyZdu79QTDk/zSMGAfIPdTIHhFVH0dD1nwMIGuk9iQfn2Cp5ktWWzYQj1nC/HN+ry
         7COVIAhxJTsC0vRHU51++39vamc26LIks8Z5i+cicyfDUOgtnJlkyKUh/1XTlSDdU20G
         kEuSIMAplI78op7MJF/rP9MbZFvp9SdD4Z6T5oGyjzQ6Kc4sVygLnTLul9Ntrt9Cc7ji
         U1Ci5cW9ZKXWBLNKxwVG2Trblt7riZLAyz7dKuy+ghxBhAVxLQa1i/YaaUW/piu61+XE
         Qnvg==
X-Forwarded-Encrypted: i=1; AJvYcCVpUaDXLTbES+5lATOXWDiAzTPrYwsI6CcFmGia/PD/mJDeXyIB2cSJ3IGvpUX1tx1tGwjtVhLt4MhqET8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUDfIkQxPuJ6ImF9BpB0gPbhskhJuV+twygh2lDeYgpTRBb+8A
	Ljn70YlXKWarLwNpFfsZecMrg7zqbSfWzhte7F6d1zCd7/RR47mX1Ktg
X-Gm-Gg: ASbGnctmh3WQafC+HfAoyDoI9Sd+7pJpphcQeemvtIFInHrBGkmSGugxCzsTgp8XjLw
	YFJZM7jWROOfmVubzsTXNKtZL/RLvn/B1uWgOXt8YjD3WsKBjpHi6Ws96h06KE/bo5sJ67RJJL4
	h3si7tU0c4fOnwSB35GnpNgg9nTVuuDK3ZvBLLj51yx2dHCFUCcUU9l5hRnIAiZyem3vqKsZd5U
	sk52W8bNu9Gqt9L2/6laHsxXTxBzCmiCj6yAkC0QV62vjzZ/86ckzYiHXcDUT90JIx2vCEbdpXh
	5vwBHpYC/vzUgTKZub5qJCCT/1foxOFxd6Ul9LOhUIoF0qx+8ncy5LHoUeWslDRI20OcjEZTDxY
	aMRbmPP4JVoGVS5cmq/OtSg==
X-Google-Smtp-Source: AGHT+IHgNpaXb9XxhY9t9BM84ENlKwWGN7WwcauV0meDMTnYk2b4LuOUVV7KJXeM9LLAWq4Jo/qbgA==
X-Received: by 2002:a17:906:478d:b0:add:f0a2:d5d8 with SMTP id a640c23a62f3a-ae0be7fc1bemr729925366b.11.1750946688831;
        Thu, 26 Jun 2025 07:04:48 -0700 (PDT)
Received: from localhost.localdomain ([176.227.88.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae2143d928dsm3958266b.107.2025.06.26.07.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:04:48 -0700 (PDT)
From: muhammed.efecetin.67@gmail.com
X-Google-Original-From: muhammed.efecetin67@gmail.com
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	heiko@sntech.de,
	neil.armstrong@linaro.org,
	lee@kernel.org,
	rafael@kernel.org,
	efectn@protonmail.com,
	daniel.lezcano@linaro.org
Subject: [PATCH 0/5] Add Khadas MCU and fan control support for Khadas Edge 2
Date: Thu, 26 Jun 2025 17:04:27 +0300
Message-ID: <cover.1746518265.git.efectn@protonmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Muhammed Efe Cetin <efectn@protonmail.com>

This patch series adds support for the Khadas MCU and fan control for Khadas Edge 2 board.

The first patch updates devicetree bindings for new cooling-levels property.
The second mfd patch removes unused nvmem code.
The third patch adds the Khadas Edge 2 registers to the mfd driver.
The fourth patch adds support for Khadas Edge 2's new fan control registers to MCU thermal driver and the last one adds the Khadas Edge 2 device tree node for the MCU and fan control.
And the final patch adds the Khadas Edge 2 device tree node for the MCU and fan control.

Muhammed Efe Cetin (5):
  dt-bindings: mfd: khadas-mcu: add cooling-levels property
  mfd: khadas-mcu: drop unused nvmem code
  mfd: khadas-mcu: add Khadas Edge 2 registers
  thermal: khadas_mcu_fan: add support for Khadas Edge 2
  arm64: dts: rockchip: add Khadas MCU and fan control nodes

 .../devicetree/bindings/mfd/khadas,mcu.yaml   |  9 ++-
 .../dts/rockchip/rk3588s-khadas-edge2.dts     | 59 ++++++++++++++
 drivers/mfd/khadas-mcu.c                      | 19 ++---
 drivers/thermal/khadas_mcu_fan.c              | 76 ++++++++++++++++++-
 include/linux/mfd/khadas-mcu.h                | 25 ++++++
 5 files changed, 170 insertions(+), 18 deletions(-)

-- 
2.49.0

