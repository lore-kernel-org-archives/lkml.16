Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142E921FF35
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489626; cv=none; b=tO5pGk+9m65sGwmRZyNCEoWT+KBzR3Fb4MPxiLGbvYFD0o4MKEspg/0rMAfYtIgIuDs+Dcn0zzNKcAwXU8T+GjycTn/6t7s4lbhT8LR349J5NZyI7tG/TzJoTa/PjGqJ5ThQddNlRJ8XoIXH5i+Bj+fiT5ZqdmgehqldmYDtgf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489626; c=relaxed/simple;
	bh=mQOnoRKz3ewUyTvrc8g10hDJrI/T3maFf6ujpEhy6+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LA1atGhBuVKtYVKNzayswqrqqgtY277/HMdz3/4xfxgGYThxkqPyQxeNx6QRqXs4Ywcj9+7ikjbMRg1d/OU2ij8n52DGADS1nf5eZlh/RVvYP3R39Nx7efIMUiwSjyzZVYROXxypJR63t16HjwJOWYTt+kn9XEMMGSdu9/GcVQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OdR7vT1M; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OdR7vT1M"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22c33677183so7821485ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 03:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745489622; x=1746094422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yBFB54Gn3nNDRE8EXoYgsgvdZtnUB689hFaMicMZtaA=;
        b=OdR7vT1M7+KS2IVLDVl00bHRXbhYpuKNq/viO2cvIKApH6olXLz0MoXYOX0rc98Gjn
         4ZMKbBKF4nKsgDvLWSlmocUczKvIYh6vb6du3H+UJfBzUFibqmmgZhja5dhMItv5VeKs
         rNn8Mf1P9wKuX7lES7312zRO5EC+WV/8UUdfgBcuCKsUPUXMu6zUT4TsPEke4kl5nnsm
         w3EnrHEtZTeLNXNdTOuH6sVaNdn9D1bsXQsOSMLfTS5EE1vwaj59hpoABYI5j7F1ZBfQ
         4ft7gSVR49NtGwFcX5H11Q2VAoL5n02zYo0xUUKVth2PEiKG08HjL76vw8Ox5v/7L30e
         Kcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745489622; x=1746094422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yBFB54Gn3nNDRE8EXoYgsgvdZtnUB689hFaMicMZtaA=;
        b=TOaNMTpBz0JdF8AV46jXwBZKoh6wNyVwCl44g2Ltxv1Tk3mYTsv3AHA7l9ob/aBTda
         IhvKedwsTjnDgFFTIEVtAvK8J0olHh1k0IWJWqEYPTUsvNjoS+FIpyq/FULyasRo8xLh
         pFnjByAs706cAlraVVvb7HHYhRhMwkVDgbMJsa/BoH4jRlSHCpXcTLDjIsVFx5ERl+8l
         O2vkbMTF6JVFxfpQ625LocwPqInkxEJc81enWBhDU5G2fAiEUlojfvDU5YMqSndzOUIx
         vEDXlcUccS2oPexupbKpSDMXcy1ptv0O2armAgUnrguP2f+Yf1QkAzyA3+dQ5k9ujXVg
         G+JA==
X-Gm-Message-State: AOJu0Yx5yqoA13gDJbOYq3hf10t3uol+Y1AtCXvBph95BUGGQb3o3Mn6
	Og60LJNv/VmfvZywrGlVJhEoS6RyT/QtrQcdJLkBtD5dK692unNX
X-Gm-Gg: ASbGncur/aJwZGsGJ/tB4wLvlxgPWUEEk4LBHpqBhq+4/S5lun43z0QGsig0yYD+MCK
	fI+HHzQ1Kgt/B1o/vL6NJ1d5ATvlKkTVfmNwZ84Pt5704p4hhd7m0pnRVfC03ahOub5MjK6EEf3
	BULhX7ULopPmPim0ezLxGu33EBbz7HyEHXASzYhTiTwCjEFA+4srNF/bXH6BN6dGamgmBpBaFA9
	uff6m7FIRMm8bVGvY5gj8xf3ONrJ5ssgbjn7SPc542WOAG54rxoPkWKyShX+gEUA8RACJcawFCP
	DfYZtvJoH2ZMJt6m+O81N3JGGehdPPMaclrm476mD+tEooox7Lzrs0hZEt99umHfkpVfoJ5FFJQ
	QIMD6FRXyVQwPah1Tfwmg3YnLpWVu+CCfTcr4iXqKif+Hkg==
X-Google-Smtp-Source: AGHT+IFATTwWVJ/AfelUjlOp/xcFig/uKd002TvXRDkZi6STfYNX0b3cQIwXiO9DEaSO8LylPiJ1MQ==
X-Received: by 2002:a17:902:eccf:b0:223:4c09:20b8 with SMTP id d9443c01a7336-22db3d78552mr26499625ad.37.1745489622144;
        Thu, 24 Apr 2025 03:13:42 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dc75besm9536275ad.61.2025.04.24.03.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:13:41 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com,
	linux-nvme@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	hare@suse.de,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] nvme-tcp: select tls config when tcp tls is enabled
Date: Thu, 24 Apr 2025 20:13:33 +1000
Message-ID: <20250424101333.2908504-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure that TLS support is enabled in the kernel when
NVME_TARGET_TCP_TLS is enabled. This allows TLS secure channels to be
used out of the box.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 drivers/nvme/target/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvme/target/Kconfig b/drivers/nvme/target/Kconfig
index fb7446d6d682..4c253b433bf7 100644
--- a/drivers/nvme/target/Kconfig
+++ b/drivers/nvme/target/Kconfig
@@ -98,6 +98,7 @@ config NVME_TARGET_TCP_TLS
 	bool "NVMe over Fabrics TCP target TLS encryption support"
 	depends on NVME_TARGET_TCP
 	select NET_HANDSHAKE
+	select TLS
 	help
 	  Enables TLS encryption for the NVMe TCP target using the netlink handshake API.
 
-- 
2.49.0

