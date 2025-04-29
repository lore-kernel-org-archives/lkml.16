Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147FF297A40
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916720; cv=none; b=los/d06S7zW6k6hy3zhU2DLmGpQ0UBlLyeofAb2Igu1WwRXuIPLc7ooy0W1NJHpw199AGJccg1DWeXnghO+BQtq8ripMA41wbTpqVTFBJVtQHqKhfhxP2DIgnhF9uir80L6ZVKCZC9U/kjU5lzuUy2LUeFYZ92H2dfvFLPIQXOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916720; c=relaxed/simple;
	bh=J4NuNn/tXwp9sQqsV0iWm0NCqyaD25RTgEa4ZmPkOGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cJSmlpMJRzajQzV5EtmklYFt2WQhBWQceerrSNjiG9AYK9i2NnSL6Jie9iLSJTi++o49CZC+GRd0c1nFlNe1lasBQEZ9rURMe3u5fmcPQkBRK8inbDyd4keqPc1KgkIizMm940ViLuC8zhGL1ICVOTXmYqQhZc6zKOnxCEeK+Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ZzGgjUQY; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ZzGgjUQY"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso7732222b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745916718; x=1746521518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYS2eMiVk4Xt0bu0VrX3eSLEVjDrDZlAzYja2cax6VM=;
        b=ZzGgjUQY3y3vkvtk2HzH8Hr4ifpoWSqrrAZuOikmiTGWOYF5etJ59xWyUKvnp+7vUN
         jrgLgkecHgM/86ycXKNdwnxSarYT765PHV8jG10t4o/3RoqmPAIwg07b88EN7tIw4eq2
         MOpVyLv0ulJY7XKbsHN4KhZE9rKZJPMLAirz+uCZ3ohUSA+XBnfWAz6egRwjPQ0lbEJL
         JoSXLxYYI0Hgr8uLOdzO4XQxpcsn7N4f2CVq6dkr36PQfXBAadDuMQKZAp6ChwpL/NYd
         jmyoxVjCTrFha8Z4IGmUSku3Vt9NXYjA3OfHvjTNlci/4atLTZSTH7/KMSzjHXeyxkWC
         Tz+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916718; x=1746521518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYS2eMiVk4Xt0bu0VrX3eSLEVjDrDZlAzYja2cax6VM=;
        b=nsYe0qI6wtfi6bZa3b+0Pfmr3EU/YN4WljVYeSE/VjCUAFCI/fzSEvwN2L/8O0rjyQ
         0V1AoU+mtLSph6d/OUKI+x/1K75aoAN4H2qduvnuo988LWjqLDAA9+MplyiJqIPY+L12
         fOvx+PgO/m4g3pV3yqOa/ZWm8o3M9gV5BzuQ2+KCRKsTCESA5haRPci12EyhUJQwzSX7
         6vSltmemYXWBYuLzjq2VtPL/rATNQRO1zVyf4gRPzS7xci+h9iyBJvqyRP2lbHMyThFz
         P54D2BNFkZVoCIF/ERlmiVpt1AG1GyBwpmyq8tvVZqULaDzoDng6b920pc/oPX+JKdRM
         1ZBw==
X-Forwarded-Encrypted: i=1; AJvYcCUUkKbY0GbCpSrj5GDI/yvQ/qwOTWG3NVwhfgGYyroNMlq+BolIzvEtAlQeni4SOcL83NyvlStK2lA12+8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUN78mkNAdeXkwmMNfhj4H6Im0KRRyz0TL8grGGEOFlREEdtqr
	/69Ipxx6loZMnHeMCJjPyc6PaQ7ERJNAzNyQgSKsnni+9Q+eqHZKn5SSfjgFKFk=
X-Gm-Gg: ASbGnctm1TktWTKjbdbe1RJcMLvk8oyKy12JBaD62VTQACwrpBwV0X0lbS4MW4N/yz0
	YpuY6HdPDF83Fm4ydxHy1xORlM7tZi9rNasXDa5XfkfaZaCvKFyzXuhSmNXkia3MHnWH+nQLTLp
	p6XstGWZqmV1hxXP626EsRm7HMbZneUFDxsemz0H/qnl8vYhdLWskaKN8u4yYHMyne3eQnCFCyJ
	BlAGYc6NM4XD04jEUpln2M96JcPzpGcRVBEHW5rPtquoMY1gezmDrj+pJiIQQcsWmHDjCY6CNM6
	JyC0CIb0gje2kwlzcBECxPQWCdS1ZnaRCVwGmYtpgZR0elzTulD/VHmsOuRAjPwJWh8mLZf7WIo
	hj7qyglrtOV1T7KU=
X-Google-Smtp-Source: AGHT+IFY1/NJQY1EBeDwxCimqA2xJLyNhndajPdetd6CnjlEWVopEm9ixDmG0zsCZTOnJTyyL/yb/g==
X-Received: by 2002:a05:6a21:3a41:b0:1fa:995a:5004 with SMTP id adf61e73a8af0-2095aa9a073mr3324411637.26.1745916718351;
        Tue, 29 Apr 2025 01:51:58 -0700 (PDT)
Received: from localhost.localdomain (210-61-187-174.hinet-ip.hinet.net. [210.61.187.174])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597e0bsm8550119a12.44.2025.04.29.01.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:51:57 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr,
	heikki.krogerus@linux.intel.com
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v3 4/6] riscv: dts: spacemit: add pwm14_1 pinctrl setting
Date: Tue, 29 Apr 2025 16:50:46 +0800
Message-ID: <20250429085048.1310409-5-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429085048.1310409-1-guodong@riscstar.com>
References: <20250429085048.1310409-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds the option 1 (hence the name pwm14_1) pinctrl
configuration for PWM14 on the SpacemiT K1 SoC.

PWM14 option 1 is used for PWM-based backlight control on MIPI displays.
This configuration is present on all existing K1 development boards,
such as the Banana Pi BPI-F3 and the Milk-V Jupiter.

For reference, a more complete list of PWM0-PWM19 pinctrl configurations
including all options can be found in [1].

Note: Since the corresponding functionality for other pins is not yet
in use or ready for upstreaming, this patch includes only the pwm14_1
setting.

[1] https://lore.kernel.org/all/20250411131423.3802611-7-guodong@riscstar.com/

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: No change
v2: Discard pwm0-pwm19 pinctrl configurations, and adds only pwm14_1_cfg

 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 283663647a86..195eb8874f3c 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -20,4 +20,11 @@ uart0-2-pins {
 			drive-strength = <32>;
 		};
 	};
+	pwm14_1_cfg: pwm14-1-cfg {
+		pwm14-1-pins {
+			pinmux = <K1_PADCONF(44, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
 };
-- 
2.43.0

