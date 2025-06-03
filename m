Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACD22288CB
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 11:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748948685; cv=none; b=S9GLahG07+WFliNvrZfAmnFKW3yWgibr8fZOW1kpG+OODGaiIknzzlAH3/aRTaNM6+mlbfdaifquzQpL68Wrtg8tBO9FzQF783u7GXxXijXc0WqUseYDIf8zLBqM3G9TwSkPKaHKGGTH6F1hpBcgISRQ5PfP27A4gHvxvqGVoSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748948685; c=relaxed/simple;
	bh=vciOIrpauqDyVttsXWVpCiOb5EJRFHLLqbkYRgrmWsQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y8r8v1+PcD+TmSqyeh9oV6Gh6TdemcFxREE1Ybajb87iB51KKxpd3nguzh3dFRL2oyJ1oSdT2hS8g3Kh6ZbbThnTb7da6iW/3Y/olXEzewfI2tKrBJ8avWEQQWN61XI/ar8JUaOpSELqjrDfM0sdFUwhGx4QOHUcHM1zQW9ZLZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FoIfKUXF; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FoIfKUXF"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-311ef4fb549so4724009a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 04:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748948683; x=1749553483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=idmYvTEWz2RLwgsYx9BYDXWbh79TvtLie/Ok2WVW2lg=;
        b=FoIfKUXFOuZOcucM9evD2lxcprL3o/+lh8d2Mf2dBD7e6tcc38AXP3SNxLMVWN5FOv
         RjIxS6LTDv5WMvC2VNRoNUR9+9mIaQKmckjxMKDXUAb28NzW/b3Ck+J95Cpn8SUYP7Ma
         Nx1FVTwpBV5WDV+zYvjkv+l2uKPnmZ/MZH76VwyahtJH5m2TrLyxYXBXvi4bNGPy+mWS
         +CFrYl4hdGOvVguVzf7FCWKP/CNTUDOZcjMzP1sAEXUxcgNGSmIpExAGo4MzXgQEMGqI
         QDP2qZS70qiDu71WMK/WIWHJlcpKZaHD6Q6yFG5qxJNHzWKqYMIsGCqzi0D91XZH1adx
         +eRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748948683; x=1749553483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=idmYvTEWz2RLwgsYx9BYDXWbh79TvtLie/Ok2WVW2lg=;
        b=Vbg6NlCZt3gYbo0utaBMVW9z5iuG1sYjzFRKNPGGN54/+vslAK1o7Ez09QwbEPwqzB
         jloiG6myozq/YxJcafnusax0lZmdTVQcYaVMWhJqaKSk8eMmztrdRbP3cKguovqFVHKZ
         Gb077sM2eVcIEl+VtweL9pBIendBBTGS7oSMbrjSS4m/KLo8CaJmEq22AGk4GBbWyF9U
         qDD+7iSYt5J9UYIVfAlzqAOCAhgffEVN/xM+8YSvD0hqVZWjBsWOo5NmuvIsdOFIzZXe
         vLm2nylf3odQRqRWKiIlSLXXY23W/K0c7W3qdBJbWY+wiBm1bH+8YZjZgtaQzAw+TtAL
         5dSg==
X-Gm-Message-State: AOJu0YwsEp9HIXS8PVncpcI9yuNOMKmaYfoRScLsK9cFBdtDFkr6uRr7
	PD3dA1nZwVPtdse1DMp+4ODwG4gscK2hFv6Spbo4ZYFl/4wbry8EUkB3m1ivCQ==
X-Gm-Gg: ASbGncvT14QVmCt1oOWaKeO6TaMuwTnY7w7V/L9VREA5y7DoRd0Ek6vDICdpLEj7144
	1jLaQwfoHautDEXDz+Oii4vo0gGdup/QM5x/2ZNf6npQ2vk4f+hRkzRB8EqRFCyxv1eRmY3Qjy0
	0nK193qDB0qhBpw9YFl1basAIW0fp0o6bQkByZQxHi/7N4RUwXkKHbgNkEC26uE5Qu1hibjoJ/e
	Hlfs56uv/SQsWbOiozZzRAAPdJ8vHy/Z45Uhd3lmRaa98JNm/84wxKFvbSkFYSd/R5DkqTuhKpG
	W5N5VMZKpZTUv4qKWshR11ix9dT+5Bvo/TK2ejQT03x0dZb8/gtUSwlHeJIHNq6zftNzN+bCXb4
	HWXzZjWpqoPu2xGQQR5sDh9pvEi+eKGSu5z7g0HLQxw==
X-Google-Smtp-Source: AGHT+IH14unPF2xz1UBgNiKKP0srcBNPczk4gEwCEpBn/mWcYy1xNC6Rx4j+nceqs10p5ZV6PXz17Q==
X-Received: by 2002:a17:90b:1d90:b0:2ee:6d08:7936 with SMTP id 98e67ed59e1d1-31241736accmr25758503a91.20.1748948682564;
        Tue, 03 Jun 2025 04:04:42 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net (c-73-63-239-93.hsd1.ca.comcast.net. [73.63.239.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2c284dsm7034465a91.11.2025.06.03.04.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:04:41 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PULL 0/3] xtensa updates for v6.16
Date: Tue,  3 Jun 2025 04:03:51 -0700
Message-Id: <20250603110351.1583773-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

please pull the following updates for the Xtensa architecture.

The following changes since commit ffd294d346d185b70e28b1a28abe367bbfe53c04:

  Linux 6.13 (2025-01-19 15:51:45 -0800)

are available in the Git repository at:

  https://github.com/jcmvbkbc/linux-xtensa.git tags/xtensa-20250603

for you to fetch changes up to 3d6d238851dff53f49ff88d280ab9fc45eaec60a:

  arch: xtensa: defconfig: Drop obsolete CONFIG_NET_CLS_TCINDEX (2025-03-24 21:11:35 -0700)

----------------------------------------------------------------
Xtensa updates for v6.16

- migrate to the generic rule for built-in DTB
- cleanups in code and common_defconfig

----------------------------------------------------------------
Johan Korsnes (1):
      arch: xtensa: defconfig: Drop obsolete CONFIG_NET_CLS_TCINDEX

Masahiro Yamada (1):
      xtensa: migrate to the generic rule for built-in DTB

Thorsten Blum (1):
      xtensa: ptrace: Remove zero-length alignment array

 arch/xtensa/Kbuild                          | 2 +-
 arch/xtensa/Kconfig                         | 3 ++-
 arch/xtensa/boot/dts/Makefile               | 2 +-
 arch/xtensa/configs/audio_kc705_defconfig   | 2 +-
 arch/xtensa/configs/cadence_csp_defconfig   | 2 +-
 arch/xtensa/configs/common_defconfig        | 1 -
 arch/xtensa/configs/generic_kc705_defconfig | 2 +-
 arch/xtensa/configs/nommu_kc705_defconfig   | 2 +-
 arch/xtensa/configs/smp_lx200_defconfig     | 2 +-
 arch/xtensa/configs/virt_defconfig          | 2 +-
 arch/xtensa/configs/xip_kc705_defconfig     | 2 +-
 arch/xtensa/include/asm/ptrace.h            | 5 +----
 12 files changed, 12 insertions(+), 15 deletions(-)

-- 
Thanks.
-- Max
