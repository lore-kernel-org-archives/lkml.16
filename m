Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1158C283FEE;
	Fri, 20 Jun 2025 10:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750413628; cv=none; b=AuTQ0XWoKuNF9gvt2EBNvkFywSnjX/kyOWbyNXtBvOO7uqWcnpDsbOptEPwdrOGxBZtHX/atEulUOsH8H1sLfTg3b5rNPnlrDydIGN0qKCe31kfKhfqcHq7Y1yb9NL79lWo722/g3kK6Amsu8TTLPazfwWV60CTymTJQ8hkzOqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750413628; c=relaxed/simple;
	bh=r+xjHdFFRce4YZzMF3pWuBF+VcyjHZmtTpciBTvr0Sw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MJFGhsA9DMgT2oJ5mBRWvNe7tjxu/nXccxBYW8/WlBRsdGspG8OseJE3ZqrpLeJPErLbaYnpcvabzCyv2bhfT2qxfGYr9yVnpm32nVMFatbcu9zKm8rpcV5GXMPNs/gyu9dzCyeRKdH4WH0jtomZ+qBoTJJ1nVo2CS42Oopp3HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c02:2eb0:2d06:fb3f:ec9:50ac])
	by smtp.qiye.163.com (Hmail) with ESMTP id 195ff8215;
	Fri, 20 Jun 2025 18:00:14 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Yao Zi <ziyao@disroot.org>,
	Rob Herring <robh@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Jonas Karlman <jonas@kwiboo.se>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/1] arm64: dts: rockchip: rk3528: Add CPU frequency scaling support
Date: Fri, 20 Jun 2025 18:00:09 +0800
Message-Id: <20250620100010.1291658-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTU5NVhodHUlOTBpMGE5PHlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtJQUkeGUtBSR9LTUEdGUgdQR4YQkFOSxoYWVdZFhoPEh
	UdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQktLWQY+
X-HM-Tid: 0a978cc81ec403a2kunm2902750c11af60
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NRA6Igw*IzE*TyotFzAaCz4#
	VlEwChFVSlVKTE5LT0pITUpOTU1MVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0lBSR4ZS0FJH0tNQR0ZSB1BHhhCQU5LGhhZV1kIAVlBSUhOTjcG

By default, the CPUs on RK3528 operates at 1.5GHz. Add CPU frequency and
voltage mapping to the device tree to enable dynamic scaling via cpufreq.

The OPP values come from downstream 5.10 kernel. Both 408MHz and 600MHz
frequencies use the normal PLL, so use the corresponding highest voltage.

The voltage used for other frequencies can't be less than above (875mV).
Therefore, 816MHz to 1200MHz also uses the corresponding highest voltage.

The remaining 1416MHz to 2016MHz use a voltage close to actual frequency.

If we want the actual frequency to reach 2016MHz, the voltage
needs to reach 1.13V (+0.03V), not sure if it is safe.
The maximum opp-table voltage of downstream kernel is 1.1V.

Here are the test results using mhz [1] on Radxa E20C:

--------------------------------------
display frequency |  actual frequency
      408MHz      |       395MHz
      600MHz      |       593MHz
      816MHz      |       956MHz
     1008MHz      |      1152MHz
     1200MHz      |      1366MHz
     1416MHz      |      1430MHz
     1608MHz      |      1640MHz
     1800MHz      |      1802MHz
     2016MHz      |      1946MHz
--------------------------------------

[1] https://github.com/wtarreau/mhz.git

Chukun Pan (1):
  arm64: dts: rockchip: rk3528: Add CPU frequency scaling support

 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 64 ++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

Changed from v2:
  Rename label opp-table-0 to opp-table-cpu
  Adjust the voltage used for 408MHz to 1200MHz

-- 
2.25.1

