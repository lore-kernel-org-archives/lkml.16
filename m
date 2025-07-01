Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0B82BCF5;
	Tue,  1 Jul 2025 10:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751364930; cv=none; b=SnkVOtgWEODsXSBYCqS/bLBF1NuUQ3UXhBR7WQB+0SJiJ34DCFWXizxHWuFonyEe++99eFCGkQFz7A+lnm9+XSdWGmPeGYhYeVCxuJuDeOfNHMM+Jx68pDIP9OSQK5Cc6Kfao6/8SSi4/3aPpHHWvB2ma5AaL2ox48OY99hrmQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751364930; c=relaxed/simple;
	bh=9e0fCyfdADe/SKw8OMdyHDk6H4mExtyPbhv0yMYCEiM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sg0h7qONcqVhTVZ1Y2b40cLp6OpCsfmfbFwQZKO9lkhDrczP2LbdPNuWhkvNAB19LL24K7bbTlIp9wpg4DZOK7v/6GBd0PpXG/OjfVTqqcmgW/lNlsP2XxAqnTJrZIAczVGlX8+EK80FDYPbisQ3HRrmXlJGzE/MfW1THTaugLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.94.38])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1a8790b0d;
	Tue, 1 Jul 2025 18:00:05 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Johan Hovold <johan@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v2 0/1] USB: serial: option: add GosunCn GM800 series
Date: Tue,  1 Jul 2025 18:00:01 +0800
Message-Id: <20250701100002.798372-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGEpPVkgYGUMfGk5MGE0eSlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSENZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0tVSktLVUtZBg
	++
X-HM-Tid: 0a97c56deeff03a2kunma1c93f4987309
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PC46Lww5LjE6Q0sWS08eCUMT
	IhoKCgFVSlVKTE5KSE1PS0tMSUlJVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	TVVJTlVCT1VIQ1lXWQgBWUFCS0w3Bg++

Changed from v2:
  Only match option drivers for AT and MODEM ports
  Add MBIM/ECM/RNDIS mode (ID is the same as GM500)

GM500 commit (ports look the same):
https://github.com/torvalds/linux/commit/08d4ef5cc9203a113702f24725f6cf4db476c958

Chukun Pan (1):
  USB: serial: option: add GosunCn GM800 series

 drivers/usb/serial/option.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

-- 
2.25.1

