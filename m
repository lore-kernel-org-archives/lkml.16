Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4FE54652;
	Fri, 30 May 2025 22:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748643445; cv=none; b=IX1TylvxVByOIpdHamzlW/8YBU4WmZnTicv/yyaKw1A0n63FNFsrymz/b5NPpTlTD31OFA5oUumdJK9qqz1eFYWaR2pi4XZfTSTjE1ouERN0G1eJBy5YeQh61YEDmeN2EJ3cXr8PQjunhafsfozoLPdUrgoFc+bWiHZ7bwbVwm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748643445; c=relaxed/simple;
	bh=GmwDqseqzIm7MqhZ3/gzJXHApPchMAUBELR9XKOYZJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qQkvcVLy+CXms+5tUpfdgi/6Ch+xqbu32Yf9swUWzwzEiKjXGTN4fTNOHrMuYRNAVjZ3DI4gLwbweUl/oGWETbJ0Oz1OSQ8cHQV7Y3Bmfuzy0cuzg/kzR4Wzy2Y1LipdwTZMx64GAo3YTiWEWe4GpzkQH465gXy6KtnVsKhN+mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+fyihTW; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+fyihTW"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6f0ad74483fso25772326d6.1;
        Fri, 30 May 2025 15:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748643442; x=1749248242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zhv6lhB1mI/CkQWC95/D7LVSSPw+u5fXWeWxikhuaZA=;
        b=Z+fyihTW+h4yeeqpwlZHgAxRWRpau4UA9cwGHyzcwV4/wwFzJswuaZ7VDXO9XbxR2g
         0tAi9YjxZrldxHzBiPAfFLZNdH2DCy5oreveFVPVnJ7c4dDlgPyVkvvSTjM6ySsObVFU
         yCAA7VA7hLrVmNuNGj1wohKViGshuYUIBI50r8hEGin27xVjvrorT/cx9F2fmYGZ/uzx
         LWeeWig96tHdm+tlKsbpqXszI4/QBbJBZtYgG8ib+E6qndhVB/CVv7jXbxRT2XulGPfD
         bhJokE8c5oRVdsuMGLMCy0QD083roHDzylJpHZXd8qOeJjz4XuGFOghufdQVbs6lRUWz
         2YQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748643442; x=1749248242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zhv6lhB1mI/CkQWC95/D7LVSSPw+u5fXWeWxikhuaZA=;
        b=YwDrCm9fWiJxdEnUBXF4M6DWMNMYBbt3lHNfTF/21HD5IwrrMhH5vycYqOLt4vAonU
         p+mWBxFcce7pqTbtiFEp2M765B07PwJd5U1ILg1DBX/LyJeyPiu3dNfP7kgqD6sDWjGA
         ZWiW0lz5E3NJ4xAr6UfEuHDHiP8WgPL3UqPedFumw1hMpQC5sAUkwiSOoOnNTdDDlXoK
         mJBLtgTWZSzZWTqVQp3YQGpqXTtYTnAqBQDPCagTBpm16bYg1CL2YNV3IOJMpCg2eT6l
         EFH0PAWiDARKFzAJ2Nppjq06NrOk3svj58PciPeWXEn5OEya4FdV+48lNwaHXS5S73xN
         CbAw==
X-Forwarded-Encrypted: i=1; AJvYcCUl6dnaschWngslXomJbvscn5KBTK5ip3ZBFIE96K6kYE1kyJx4F3tKqSVwcuRwO86OUOg0/m+KUUw+@vger.kernel.org, AJvYcCVeGfIQMSN01kBxn5MeVqh/hvTWhO74KapbdyBLbbUwkSrwJKHE5Qc41HTWO103D2F2bxlqkWkolNIlNbOA@vger.kernel.org
X-Gm-Message-State: AOJu0YxZGeJjdPePmT7AEp8Gn+b8VtwZCtJVMu1qR0xui4atXygJYR62
	RYLPWm4iknSEMjMqR0p0iHxEWqQDhe/XI0ugkERAOoiPSZJueD2nPqbs
X-Gm-Gg: ASbGncv/+D36GU0Og7a8NXc1Tn6H+lkgTM2SGq3NiB6DlOSA5N2MU2uRK8mlvgogFi2
	vgBpOqz5Tu+3KkA7TR8eu72v/VgtWDEWTXzGwLPajwuYvOP7BG1/oSZLpnAHKlYWnYRbO/XNfp6
	mZFm7DsNuEyYTLN3tw8IWKcoOael670ydxERHtnXxiZ2kAWfeV7W26L9eHH3Qp5EY5F/jHwVyJy
	Qw+ut3N39VGSxQ7dvZuRkMYFSNCfD0Budvumn6HByCwAdp7wb1UQKobOK/BwtMb86G1S86M7Z4P
	FLsa5A6vJk4UWJwPmnVMdqbeA1P6EL5aSzd8e598MQrARCuAnuhnhXngf6nNNerZG/DW9SL9CZ7
	CbTnkjUiXMTvrf1OSuwvqdft/lA==
X-Google-Smtp-Source: AGHT+IGfTe2JaWKrTjR3it8MKEgzScIlOWAy/yBQKV2n97iFtrmSF6lgii4Qq4047HuVxPTbgYBp2A==
X-Received: by 2002:ad4:5aa9:0:b0:6fa:c697:97b5 with SMTP id 6a1803df08f44-6facebe6d29mr76790656d6.20.1748643442404;
        Fri, 30 May 2025 15:17:22 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d4d0cesm29986866d6.35.2025.05.30.15.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 15:17:21 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	m.felsch@pengutronix.de,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Increase i.MX8MP VPU
Date: Fri, 30 May 2025 17:17:07 -0500
Message-ID: <20250530221713.54804-1-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the VPU clocks are under rated, even for nominal ratings.
Fix the nominial VPU clocks and clock parents, then introduce
the overdrive clock rates.  The fluster scores don't decrease,
but they do go faster.

This series was adapted from an RFC from Marco Felsch which
was setup to introduce the VC8000E encoder and extacted the
parts that affect the existing infrastructure.

Adam Ford (2):
  arm64: dts: imx8mp-nominal: Explicitly configure nominal VPU clocks
  arm64: dts: imx8mp: Configure VPU clocks for overdrive

Marco Felsch (2):
  arm64: dts: imx8mp: drop gpcv2 vpu power-domains and clocks
  arm64: dts: imx8mp: fix VPU_BUS clock setting

 .../boot/dts/freescale/imx8mp-nominal.dtsi    | 18 ++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     | 21 +++++++------------
 2 files changed, 25 insertions(+), 14 deletions(-)

-- 
2.48.1

