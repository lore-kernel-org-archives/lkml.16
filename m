Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A723E1DA21;
	Tue,  3 Jun 2025 17:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748970085; cv=none; b=Tuizoitq8qVXL3xRfdjAm6MIyCz11tCX9dVo+bT9GO3ao1gQZRNhz0eB3uFFN6GCi11wc4om1OAlBR/naDNEhtjUjmog06haFgN3Qa+QnwHWUn3TyLncwr17SxmptUfVegFPCNp3E9wuE9wafyFj1Lh5AFz6jQsxkH+Hh1pQT/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748970085; c=relaxed/simple;
	bh=I02Vlr73sM+rN6jjjm7Dd7get1VU85/AhuEx5Fpndmg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DHghEU9m+KplyS9Xqx2ODULuazun2ZQQLOzaTvDeJ+qivP/EH7D5a5VZzwCgdHsZDrIOTr7KZZT+jVdL3tDYz+PWEKG2tn0lxS3hjMZvKWbGqpYmBgWVcov5LM37ZepH0xdxTRafJuu9HYrWeP/7p2oAwEpKA9HHOwW/r1pSvgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NATxriGT; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NATxriGT"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a36e090102so3418833f8f.2;
        Tue, 03 Jun 2025 10:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748970082; x=1749574882; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ciLKL0oNaTcGqmqIOmbZomzL3RZyKAIBEpvy5et0b1w=;
        b=NATxriGTQEJRWN+LPmpchumfltfjpci/6emEFwud4R4EA5iejKyLCzHj9CApOx0LRU
         mMjjwGmX45uLDMxpQI0AXrh6rPLVCY5uitrwvJf0Leiorxz1gkgdFMAtMlZ2wgv5nDpn
         sM/s8RQ7e7XP+Aff3B/WkqJcYsm7h+NdcdMirONXJoRiKRD8bEqLXrSSDq4CZdfHE3r2
         oWKMUoVunVPEp/iVJKYxrcuTXhE98wXqqDlfcpL4fwgZCL1DaSLiUKrE1xXt0CcBPSkC
         s96uHvnUmgl3w1izSrIW7LK4/dGCm8vH/pe9VyriX1K4TYWST8dwl1B5QxekfiiGlfl9
         nmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748970082; x=1749574882;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ciLKL0oNaTcGqmqIOmbZomzL3RZyKAIBEpvy5et0b1w=;
        b=At0D0haMjyF/xSYhTcwC60FDVg1JXV8m3Rq7JduZSIylGGTaFdkWdeNwWaaFi8R7hw
         iaPf7ubNK9pyZLo1oQOQ/eOFHD1JFhwj2KVU/WlcfRbTRY0dp8Gprk0O3fKAio905rmO
         8ACqenFwBG9/rSBX7PD23bG3Cjmcrxgdi1W/tBwX6tjxMT5PwyRiy3OHn4PKgc73Urxg
         i6HCPJ4+L07/K4NW1usBHB2Y+3sV+/iySQ054RSVhSwhEW8dhB4bvn+oGBMh0tyDWNIZ
         qyZCuuiMlGqtRrXVtpVKbDiclI14bu4J6mp13m5RXrjOolCL7ocgRFqwTkmsW5cWFpVV
         RuAg==
X-Forwarded-Encrypted: i=1; AJvYcCXuuYNN2ieGCs5t0UpTjkDdqNfjBvr37fPk2BVUh9SjU4wAKdiFQIf4cNlkTf89JYTGaoCokjCwP3CVs14=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH96z0d/t1hMSPCmeq3B78sQSGcra0XZN46OHVWCAHBFl3duda
	9PBI74RZVgHt57ytTub4V4Y16sHJvH4ycwe8f+N4PhNJGXgdHR81k56OAWLLcA3+3lIXKA==
X-Gm-Gg: ASbGncsolEfaOREnEccx97JTnYL2igaXqrOI9bxXB09sBHMkRGgpZtOqcauvsnjvc16
	DsfocRGwO1XXzvWDAVrCZ5qSDoZzMv2m/+MaWhlUNEyBrh52uEq9hdSaWZzVQyTVzYCwim5EwO6
	yZe2ifOTaOEF5JSQgF00b/km8YTjz9ElZic2nhY5HXBsTTtihoSFlvszaLOYmG26qxEkcEvpo3o
	h/mqpaCyJjfNrcHnfGWBnA2HYeVQBJ5AJVPnSkn1O1h75UIV669u/VxiiBbqP6GjReH8cBHoQkP
	Gyjw3NQ8f95s9ubzVqml/feY0U4axUrrMNb6wl5m5LIyyX9XU/sd1As+NDv8ebPy9dKO3FqIhPo
	qug8Z5S2Pj0MBvHFNu4CLJJZymw==
X-Google-Smtp-Source: AGHT+IHfcVfMVKXiAN2N/C9X+Ipnx2mNMy/BaYIgLXf2ajWTXyjeI/MYVV1vFjJZEyxZ2B1igc6u1A==
X-Received: by 2002:a05:6000:2c12:b0:3a4:d64a:3df0 with SMTP id ffacd0b85a97d-3a4f7a025bdmr14716348f8f.4.1748970081226;
        Tue, 03 Jun 2025 10:01:21 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-92-99-174-93.alshamil.net.ae. [92.99.174.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b92bsm18574640f8f.9.2025.06.03.10.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:01:20 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH 0/4] arm64: dts: rockchip: enable further peripherals on
 ArmSoM Sige5
Date: Tue, 03 Jun 2025 21:01:12 +0400
Message-Id: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFgqP2gC/x3MQQqAIBBA0avErBMcQRddJVpoTjYbE6ciCO+et
 HyL/18QqkwC0/BCpZuFj9yB4wDr7nMixbEbjDZWO22UcCKrrhL9SaI8OhOsRo8BoTel0sbP/5u
 X1j68vxPhXwAAAA==
X-Change-ID: 20250602-sige5-updates-a162b501a1b1
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748970076; l=1451;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=I02Vlr73sM+rN6jjjm7Dd7get1VU85/AhuEx5Fpndmg=;
 b=VT4GHoLJKWU5AaJj8JZJB66ttYh5p4rDf2CqdTIJXtZD1qVq5vL7nkleI9J5KaCO9xegTgX9R
 3gPRGqEW/LnCMEK9xv2lkAp5KTnYDLqAhhQ5W6tYfpSncCx4QswdlzH
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Add support for the two USB type A ports, link up the CPU regulators for
DVFS, enable WiFi and Bluetooth.

The bluetooth part might warrant some discussion and thoughts from the
list, given that it's connected over UART and thus not discoverable. At
the same time, there are two revisions of the board which have different
Bluetooth chips soldered on: Realtek based on v1.1 and Broadcom based on
v1.2. I'm not sure if there is any way to determine board version from
software. Mine is v1.2, so the respective patch deals with the Broadcom
case only, but maybe it's better to move it into a .dtso and thus kick
the can down the road (i.e. make the user deal with board identification
and loading of the right overlay)? Thoughts welcome.

Best regards,
Alexey

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Alexey Charkov (4):
      arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
      arm64: dts: rockchip: enable USB A ports on ArmSoM Sige5
      arm64: dts: rockchip: enable wifi on ArmSoM Sige5
      arm64: dts: rockchip: enable bluetooth on ArmSoM Sige5

 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 135 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  16 +++
 2 files changed, 151 insertions(+)
---
base-commit: 546b1c9e93c2bb8cf5ed24e0be1c86bb089b3253
change-id: 20250602-sige5-updates-a162b501a1b1

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>

