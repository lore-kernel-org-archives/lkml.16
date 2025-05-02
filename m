Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2821D90DF;
	Fri,  2 May 2025 20:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746219340; cv=none; b=OzKdZUdhMOChqbQlQBrJpyb829+cWNI3MeTJxa9PnP/EZJIncCpWllWF8kJh+7vsuxcE/85mAu31yzJx0+ILRjSRcEovwDfASGOx6woNrUkIs8ybhInR5JFYXYn4EICZOLSID4twNk7oBSLNg2ecTQBcYPdj0Xj6lg3jzSsDK0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746219340; c=relaxed/simple;
	bh=PR3SQ2n/Joo4f0tjdIatGVPhytTBC5rTKfPKzKHMJpM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gbFPXUAEv1lnR1+GywRIpZqjOKPxQw/MeX4alckQn8pwifBuVfWfDx7oJrIRLSExSF4Q8kvXJBdn/ZaThH2Mr9AWCyCvvUhlKmro10miUmq3knBu2KFlnn9F5GTsKAjWZbfIl/GXgQa6U8E8mWPrIdKR5+/g0oY4AutFRKcw0qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mk8mjhKT; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mk8mjhKT"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so32232126d6.1;
        Fri, 02 May 2025 13:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746219338; x=1746824138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PR3SQ2n/Joo4f0tjdIatGVPhytTBC5rTKfPKzKHMJpM=;
        b=mk8mjhKTeZ0+IPc/IBqsJF67+RRHvU9xbDxrF3hZ3mrkx9FxZZJJRuGC7IncalH3Sl
         3XzULacOdg+89Xb014gGxk72/5sOO/xIsDNaGL7oExq3OiZ42WTwIu4MkuoSbNmLpAsy
         k34NM6gQbdC1Eb8MCiLLbbXGduzh7TES5SFDZGJ/5HstB4L1L/XmVT/D+bOo6Bd5OQCa
         o2w5Z821goO+9xShYvwZLdjdzoUr4mILbIr/YNq4tlKf6s8thud/jnFVv9zB31RBQNTd
         WUV5D2rT6QZyXt+llx0lotdoNzTWzXcDpv/FQxEd1HOfY8yv1cmKPjQxtqFtzr/2wrN9
         HaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746219338; x=1746824138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PR3SQ2n/Joo4f0tjdIatGVPhytTBC5rTKfPKzKHMJpM=;
        b=JHniWS025ILKuFF/w+vXmjc3nAap3yPBBGmywWMOHsowqKTj6KAYy3+uqbGJfr3z7n
         UZ+kmm8yoBTFJJgumMDPY8Ym5s5qAZkiEFr9Zb3YRpK9BUL/Mk0yLSZ4jRDHIJFTIP/2
         lfvQ/2/c6V7DeosxNwarxwci5rbGfGB9q9xCCQrsK5RnmJhNsHZQS/UGY4mtrR6bV5J+
         bSx/nXVlBKLc3p5XEKi6p4vtPJYjW0rnR7PlDkEhFTOIeb1BDYc+L8fmLEq5RnjlqjGe
         pUc9qpya+wil8XvjfUMl6GViOMy8Ct3lwv/HD7eSYGIn94wtmVQRNA2vU0AENaYJSoSn
         4alw==
X-Forwarded-Encrypted: i=1; AJvYcCUZEkFQ+wK+ZvFXACTpZQulH+mFQhgsE+Q20Suhke0Gh4PcYoQI8GbEyQgkMmB/8ku4BxnPg2KsLxVo@vger.kernel.org, AJvYcCUxABS7SVMps67s9qvU+VFrBJwz3X0d6D2+2jut2Fl/RZCOGxJmLgVRADdq81MIXtaYfisd/bnwrOB7W3a9@vger.kernel.org
X-Gm-Message-State: AOJu0YzRuPgswG5TsxgewTv4r5RtHlMbdCLWJ8Q1eGJ81zSTACjT6j2v
	RWXM+U5KGmOZY06q6NJD0J1vehORdAN8q/ecLA+lcP+eySl8J4hr
X-Gm-Gg: ASbGnct1Y5aQ8jg1uwPDbjm5fiU9OkS456Sod8Nc4dJOfri/iz+a78lAr2T191yFWd+
	B5Jq9W4gNNWnzAvsKJv4ufKMxXJFo+VnVB85YfXyxNqO2ZuQoLM1U78oS9ubD78N217PhGQAJxk
	tZgvcwXKezSeGhcaeTdPn96JKpsJpzXQKMUxrGMHK0Jc14m9NhRQMprbpn9LOMOYwx5E5hHLSt3
	Sgzjb3NMUSquMElsAsxddUgGC8yGEOx2lPVskU28fqmbXGV0iKS1TvyH1JMcGOIFF8POktaLMti
	sZwwA8RqP5UtTug3QDhjikJhqOr+SGlN/aDzGk4RdDJ8IUKyPBTs
X-Google-Smtp-Source: AGHT+IGhSrEvyii3iCaUEnI1ury80sSSWAUDqJmSFWGySZCyG+UuPVblXaYsIftJReV0Y5/BXthobg==
X-Received: by 2002:a05:6214:20e6:b0:6f5:dad:5a60 with SMTP id 6a1803df08f44-6f515264f21mr72860706d6.3.1746219337829;
        Fri, 02 May 2025 13:55:37 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f3d2844sm23129936d6.56.2025.05.02.13.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 13:55:37 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.frattaroli@collabora.com,
	detlev.casanova@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Clark <inindev@gmail.com>
Subject: [PATCH v1 0/3] Add Luckfox Omni3576 Carrier Board support for RK3576
Date: Fri,  2 May 2025 16:55:30 -0400
Message-Id: <20250502205533.51744-1-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds device tree support for the Luckfox Omni3576 Carrier Board
with Core3576 Module, developed by Shenzhen Luckfox Technology Co., Ltd., based
on the Rockchip RK3576 SoC. The board supports various peripherals, with this
initial implementation enabling essential functionality for booting Linux and
basic connectivity.

Supported and tested features (on Linux 6.15-rc4):
- UART: Serial console operational.
- SD card: Mounts and reads/writes successfully.
- PCIe: NVMe SSD detected via lspci.
- Ethernet 0: Functional with RGMII PHY.
- USB: Host ports detect devices.
- RTC: Timekeeping and wake-up tested.
- LED: Heartbeat trigger works.

Disabled features:
- eMMC: Not populated on the tested board; believed to be functional but disabled.
- HDMI: Disabled due to mainline driver maturity issues (basic 1080p output works; audio and 4K untested).
- Ethernet 1: Disabled as it does not come up, possibly due to PHY configuration or driver issues.

Patch 1: Add luckfox vendor prefix for Shenzhen Luckfox Technology Co., Ltd.
Patch 2: Add luckfox,omni3576 binding to rockchip.yaml
Patch 3: Add rk3576-luckfox-omni3576.dts and Makefile update

The new DTS is covered by the existing ROCKCHIP ARCHITECTURE entry in MAINTAINERS.

I am aware of ongoing RK3576 upstreaming efforts (e.g., by Collabora) and
welcome feedback or collaboration to align with mainline driver development.

Signed-off-by: John Clark <inindev@gmail.com>
