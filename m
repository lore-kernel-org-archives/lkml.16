Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD93C2C8
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 07:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743059562; cv=none; b=HmyEWDliT5xNEUSDE8guXwX1q7qMmeXh0sRCiftVlHHwxsiuX19AiPGoJcOtw0PfJTNXjDCOR8JhKDXOa1h4IP+jT29wB8DQNwcE5eLrRX1ZUnRetJnVH01qs55kUqUr4dTh+ScxSQiMzggrgVkOTLMT9Ihpec4NXVvJcjrcGoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743059562; c=relaxed/simple;
	bh=kWnkqGmb4g6Askmybg+1eKZXKnBANORnQqKnQWrsO64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IAFtLdbpZmQ48oAMHAO+RJUtXuDshJb3MUZjZuAq8lQjoIWnL58/XB+383sKG8ReqAtc06JUXQqOUNX5M+8XpbegO2TM0e2yZGR4X9tGOESzjKeCv7Jte2ujSuPJOonx/bCrV7hIkwNN1GnHkcrU3jB6qz7SWdYmz2Xn8rSx3Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cu4Lslcz; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cu4Lslcz"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-227aaa82fafso14168975ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 00:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743059560; x=1743664360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/xbdb3Q23KDbzMapeISquzFQrHEt5ZEKz4vyQX8oNvk=;
        b=cu4LslczJbA6SmpMkbdu/SaMdoBdg5ScIzcYHZiaCQwxd2TbYUxsjFi0Dz8MiDGA6D
         xUjZkLqfBxaBfN7Gc3n4hEkoBF7kvpAuxRxBOz0Uf9t3zgNWsHfTyvA1FZ2O/l91K16c
         T2XtU7eFoIl15kSnJpXuC+vgrhAhFg5UqKynncub1GGqnfc4tedefbauttwqPsDFfcHR
         jSdFTC4Hyvf0Qq3f4S0WldD6fq7WzKhLoBccD0pR7hlefGooo+KuQBqqcLos0PQTRTXT
         dZu2MNT7dOnRPg6a5dpW54cdxu8vHxdLohwAiyNG3wUgUzzalXE4IWPzHfYaCUgwP25u
         QCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743059560; x=1743664360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/xbdb3Q23KDbzMapeISquzFQrHEt5ZEKz4vyQX8oNvk=;
        b=tirlwebUsi5YhxRndTv8ENSXTxjkgL1hx1U2xzmnicDIMHcL4A8HUEFIPJoRMOnXlF
         TZWO7866G0Yf/0E0mMT1icHR5bBKC0JNvG/KQ7tGgTSSlbAg4NU4tlcn1HYEWAPbg0QZ
         CIXFUVMutQ0vePp0t4CpuEJtCyJwvOVU6euh1T5DEUAqRhmHM9Rq7wrJNa5d52UwQmRk
         KxjherTl39dADVRI8o+2sFJPV7QHM+B4Zn/O4P9+MnbymOZWiWNNbzmfcmCnnJItuVwG
         bbsy5udqINJEz+m1nCCL40Eza4fJ6/7cDra2wL+8H6jIOK+CRC5S2BMrhgzn+4b0I/Oq
         nCUQ==
X-Gm-Message-State: AOJu0YznzXvVo8BHcrhU3Osf07VirIpVe7e4Xw14d2opDKV063mRv7fL
	KWpR+mS6UrHCJDLQYD3pStU78LdPCiNAf+yHIEZul/GQd61BghBU
X-Gm-Gg: ASbGncu+3pgbvF89tyaIQzL801k/9gSQktavV+7BDnTxHg6R4hVwaJqOHcPhvXOsVRX
	b+s0H6nmXd/ZLKw/edCmZAh+Mzeu/h1fSV6g6+rson49HwWL0KnCsLWTYn+A725UFKgp23e50+I
	leSLcFWcWk9zwpgk6Vf87k+J1w+kayp1Pfnkz3vvXpW0FnhEW+hqCezej8LZCBa29BglWVT4PfE
	P4y4KFuNeyHrs5u38vl+Zy1PmeII/DAMU8bClCyK/q8LHptH9TBt7dIPUKv8F3zjL3LY66FIL/X
	2GjG+a+7Q7uwOUDZdbrDjto+W2m0YFE388sBzj7gYKjQKZQRnuhzbzPvHuJjY9XEO4VmW9fNAcH
	jk90ZmOiPXfB3HOHzw78TjixrJsDDYM5ovBrSNbhtAt/Wtg==
X-Google-Smtp-Source: AGHT+IFDp8VpQjWHlX3gp+6smleu2nKPG7xnbgHcyHRmfYtPjB7KEC9FFa7q7HitUa+EWY/gaVymHg==
X-Received: by 2002:a17:903:230c:b0:224:1eab:97b2 with SMTP id d9443c01a7336-22804950c59mr35976535ad.53.1743059559993;
        Thu, 27 Mar 2025 00:12:39 -0700 (PDT)
Received: from codespaces-3dd663.dxrpqgqhlb3ehogrxrezr215ye.rx.internal.cloudapp.net ([20.192.21.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811b7fdesm121580375ad.143.2025.03.27.00.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 00:12:39 -0700 (PDT)
From: adityagarg1208@gmail.com
X-Google-Original-From: gargaditya08@live.com
To: jikos@kernel.org,
	torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	Aditya Garg <gargaditya08@live.com>
Subject: [PATCH] HID: hid-appletb-kbd: Fix wrong date and kernel version in sysfs interface docs
Date: Thu, 27 Mar 2025 07:12:08 +0000
Message-ID: <20250327071233.12237-1-gargaditya08@live.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aditya Garg <gargaditya08@live.com>

The driver hid-appletb-kbd was upstreamed in kernel 6.15. But, due to an
oversight on my part, I didn't change the kernel version and expected
date while upstreaming the driver, thus it remained as 6.5, the original
kernel version when the driver was developed for downstream. This commit
should fix this.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd b/Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd
index 2a19584d0..8c9718d83 100644
--- a/Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd
+++ b/Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd
@@ -1,6 +1,6 @@
 What:		/sys/bus/hid/drivers/hid-appletb-kbd/<dev>/mode
-Date:		September, 2023
-KernelVersion:	6.5
+Date:		March, 2025
+KernelVersion:	6.15
 Contact:	linux-input@vger.kernel.org
 Description:
 		The set of keys displayed on the Touch Bar.
-- 
2.49.0

