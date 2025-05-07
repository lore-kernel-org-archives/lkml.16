Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593252144D8;
	Wed,  7 May 2025 06:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746601133; cv=none; b=hzNVhcdrVw6HijCYbs+JoPW3cSdmtOv8leGLa8G1tPpQH860hik1Z6OrB+hKmKjdenw/1tGcdQhssi9DpP7lFLmMBbJuftEN/d+5R1XEOJM2nVmA/Ibxz0uH3/tsmaPuIqJiydxw0P7aVPtEtuLIpzvHjKNLwJ4whPZKVRqnzNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746601133; c=relaxed/simple;
	bh=CJdFR5JtlDtikPD4OrMiZayMUaCskl6VAbLParxDykI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rFlECIfA14mHGnnz7waaZlCUeTXd8WBtQ2A2WtLZFTvzF7y3DgJKJEHKBm6hZHhvdkZ0MVISnCsozbclSr6qudZ/C+mUka7NFEuS9/YTBkZUDRmv4Q4CrQHIXby8072IGFTM33bYV7Vt4/1b4wNHWUZ5JhPlQPxgXBttrzfzgTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2ucT4cz; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2ucT4cz"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-476ab588f32so104331771cf.2;
        Tue, 06 May 2025 23:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746601131; x=1747205931; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jIOpltPILeInSwqFzp6wxXo2CyfMdnE8s6AQHz0yqWI=;
        b=U2ucT4czKJe9YtP/LYjtduMIjthktEJHZSyUhGPTfDITJE0b7qjBO9Bq261mRhTnAU
         KqevOKvr6D/Bfoc3UEo6fthkTeEgSYe8YNpLTiDE2rSSCckgBWL+thlEh+REqzUVbMx7
         L1NsgVMNQdQgVfwGhmJhBlotM6xot6+p2n1lXPzX5NgzgwkxXtlhtMDhTzDkm8QdG6P1
         r908njOW//LZ894nubXWYbZZKYDquMSn5qZRA3ddo17+vyzxddK4ZXOZknHNNMb4fj9C
         ufeQJqJ99fG8g9OR5xF5I6t83Zq60FIkwsMOmIkY2IRk2jYETwwDo51qeREhfFnmjEmK
         jATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746601131; x=1747205931;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jIOpltPILeInSwqFzp6wxXo2CyfMdnE8s6AQHz0yqWI=;
        b=mGbANwj71zGKXLazFs2VfxLl7vpQeI1Lo2CSmrmC1DWG9JRKWC/Wjw4AKAe3YOGbDi
         aZT4USJ4vIZor9wevnv0xiAOgo5jg4dr6I98Ueb5IY6FtEVQ5CAbxjEBnzBUnncC9t12
         /fcOm8bSw11DMLxf+bjoWBgaNKFzv3AQq0N5k+GGTCMmr8Q/JxQWZY/VjsLUpgqcM/cg
         iVVIAc9Aw1LXTcEA5ZV3hkaP/rKtRgQGF65mQnx8CGqFG2iyAp5XM1O5GNAbevZRSrPt
         D4xYA16hlLdYQOGvu2JaArrV9KoF0qyKhp0gSFiOadBQId4Wr9as7uZHBXRS41WlLvKi
         twCg==
X-Forwarded-Encrypted: i=1; AJvYcCU/a5AEHPEbPNW9RcQkgL/GGWnfBRqWdoOXImPbFZrzYnY7NmYcPkDRnkbtGskGKjPfe616oSk0L6XI@vger.kernel.org, AJvYcCURmdgHrI2mRh9vd4BOZs3E11iwUdmnI48/rfVzKWkgbuudzOCbxn3JW7QEUcLjwlrQDlByEH+hJ3l99Ws7@vger.kernel.org
X-Gm-Message-State: AOJu0YysMcQYKyTaesMixBePIWxJTqQLZ4gtwgql+/UVmxKVlohPiicI
	8tQTxu8EI1MlaQVUfogvh82BOyqV0lEzqyHZBulyCxH9N04bog+1/LwvZrCeLuUMwQ==
X-Gm-Gg: ASbGnct0uhrjjzkgFBraDICMWb3ZJHOEjdNMyFXYBHEFS6dEzSxA9vUszh0YX4BX8kd
	Zr0yFlxPT7oMeVaSuksBJ/cw3iaS5YFKTjBvLGHvO84m+CawUft8AWUD7BX9nBdL135sh1DnmQo
	5AVcrXp759qEhgqA1ey2SudN+Rh8yh0ICZ0Px30JQ7nBtadykzpfdIoomULZc2acHfiwZkzmsTO
	guWp8+O7ErFWce+qVJdYgednXsxxvJ0ZV/KKV9aJUksnvDCOs7jhGTHYgj8e4ij+4XlRY8VUscD
	YcdyFMDXkOIZqfMBoh1m5zgThRWFN80KlmkjCkKXPDoMyytRa8RPZ2GRz1kYT8s=
X-Google-Smtp-Source: AGHT+IEuH9gQXJVdRcbH2dTIbJ9oZxHTm9KD4cWN5untak0N55vRPUL7OXKYZ7KaeTcHEvqoW9uAlQ==
X-Received: by 2002:a17:90b:3945:b0:2f2:a664:df20 with SMTP id 98e67ed59e1d1-30aac179364mr3888974a91.7.1746601120438;
        Tue, 06 May 2025 23:58:40 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30aae525db4sm1315529a91.22.2025.05.06.23.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 23:58:40 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v2 0/4] clocksource/drivers/timer-vt8500: clean up and add
 watchdog function
Date: Wed, 07 May 2025 10:58:29 +0400
Message-Id: <20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJUEG2gC/22NywrCMBBFf6XM2pFpbBNx5X9IF7GZtgP2QRKDU
 vrvxoI7l+fAPXeFwF44wKVYwXOSIPOUQR0KaAc79YziMoMiVVNNGlM810QYZWSPz8XZyAGrypJ
 TqnVGEeTp4rmT1569NZkHCXH27/0llV/7C5r/wVQiob4b3ZnuVJHV13608ji28wjNtm0ftmOkx
 rgAAAA=
X-Change-ID: 20250506-vt8500-timer-updates-44a0d22cd720
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746601114; l=2013;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=CJdFR5JtlDtikPD4OrMiZayMUaCskl6VAbLParxDykI=;
 b=vn6WIN2+S1/nDLbOVRpn67Dhf7fJCqQf3bu10iaHHYgZ2sWifYO/4cVgZ8GSSBKZWPk7w8dAq
 hgW+lOK4owGBqom9MxYcnK3dDD12j+gr5i56ZVJq2sGzhAr4Fmoi2M7
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Add named defines for all registers and bits in timer-vt8500.
Move the system events timer from channel 0 to channel 1 when enough
information is provided by the device tree (i.e. more than one IRQ).
Use channel 0 for the system watchdog

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Changes in v2:
- Included the previously reviewed binding change that is directly related
  to this series as the first patch here (thanks Krzysztof)
- Created a separate config symbol for the watchdog function to let users
  build a kernel without forcing watchdog functionality upon them
  (thanks Krzysztof)
- Link to the previous binding submission: https://lore.kernel.org/all/20250506-via_vt8500_timer_binding-v3-1-88450907503f@gmail.com/
- Link to v1: https://lore.kernel.org/r/20250507-vt8500-timer-updates-v1-0-6b76f7f340a6@gmail.com

---
Alexey Charkov (4):
      dt-bindings: timer: via,vt8500-timer: Convert to YAML
      clocksource/drivers/timer-vt8500: Add defines for magic constants
      clocksource/drivers/timer-vt8500: Add watchdog functionality
      ARM: dts: vt8500: list all four timer interrupts

 .../devicetree/bindings/timer/via,vt8500-timer.txt |  15 ---
 .../bindings/timer/via,vt8500-timer.yaml           |  51 +++++++++
 MAINTAINERS                                        |   1 +
 arch/arm/boot/dts/vt8500/vt8500.dtsi               |   2 +-
 arch/arm/boot/dts/vt8500/wm8505.dtsi               |   2 +-
 arch/arm/boot/dts/vt8500/wm8650.dtsi               |   2 +-
 arch/arm/boot/dts/vt8500/wm8750.dtsi               |   2 +-
 arch/arm/boot/dts/vt8500/wm8850.dtsi               |   2 +-
 drivers/clocksource/Kconfig                        |  11 ++
 drivers/clocksource/timer-vt8500.c                 | 118 ++++++++++++++++-----
 10 files changed, 162 insertions(+), 44 deletions(-)
---
base-commit: 0a00723f4c2d0b273edd0737f236f103164a08eb
change-id: 20250506-vt8500-timer-updates-44a0d22cd720

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>

