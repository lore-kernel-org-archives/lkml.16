Received: from mailgate01.uberspace.is (mailgate01.uberspace.is [95.143.172.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E94846F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 00:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.143.172.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743555313; cv=none; b=eTSMLqo0FnqQSgjJ895CVxv/p8OhCBADrcPScd9N5/adO95DhA5i9ZQWti/T9L9VpbnfGE2i8W8bWAZ/glB33vQ4CWmSvKwzohzXldMsvkGnYiXfs1/yp7ChiQ/gaaRSyYQ5J7wqQZg3mIQCxT2mYotVga5GCSeKh8GCRYuxibY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743555313; c=relaxed/simple;
	bh=vcbb/N719SqerjnEgmY492MYanRbJNvTR7pgs9UQi2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AxZXF4m+g7uzoR2fgLl0UfkysQnS3hF+mr18W11oJkGSK/wexq1QhRTV0b5KX2SJ5iVjdVGP8LsB+SSxtsncgwVC14SqJun82bpriwdGmntUiXdPCNAfRy6kD2BzMM/XdtT9la1Z89i3Dnc+Cb3nNdOgLH/uxKv51t2BLYLOl/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=david-bauer.net; spf=pass smtp.mailfrom=david-bauer.net; dkim=pass (4096-bit key) header.d=david-bauer.net header.i=@david-bauer.net header.b=xY361tET; arc=none smtp.client-ip=95.143.172.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=david-bauer.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=david-bauer.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=david-bauer.net header.i=@david-bauer.net header.b="xY361tET"
Received: from perseus.uberspace.de (perseus.uberspace.de [95.143.172.134])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id 25CED60A33
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 02:46:23 +0200 (CEST)
Received: (qmail 23180 invoked by uid 988); 2 Apr 2025 00:46:23 -0000
Authentication-Results: perseus.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by perseus.uberspace.de (Haraka/3.0.1) with ESMTPSA; Wed, 02 Apr 2025 02:46:22 +0200
From: David Bauer <mail@david-bauer.net>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/3] mt7915: mcu: increase command timeout
Date: Wed,  2 Apr 2025 02:45:26 +0200
Message-ID: <20250402004528.1036715-2-mail@david-bauer.net>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250402004528.1036715-1-mail@david-bauer.net>
References: <20250402004528.1036715-1-mail@david-bauer.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: /
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-3) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -0.1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=david-bauer.net; s=uberspace;
	h=from:to:cc:subject:date;
	bh=vcbb/N719SqerjnEgmY492MYanRbJNvTR7pgs9UQi2g=;
	b=xY361tET6zI12Oo5cMJrqCzaecMWF2wZfEmGKrdaOiWA8pN9bBNW+E/WtSlYfWcFnfL0U/Dcjc
	82GaoEQnAgqrDaheMTPlOfAQDeomqdZ0bOieFeWmb5h0gECxR+XWDZ3j18cq1QaCOhrcBy6mb8O2
	ZpJ7/7CjAhb8qeuOBB2BJ1Mi5aWmrVJFO/HbIWbBcxbQ3uyAccltFSBBOJoIYcbKeaCTIyR+jRL7
	YJ8hhVzgmy+BXshHqgTyAYBmU0Er3bniumqQ6aak6TNJWUdmoXncgDdf6ttFr+6wp1h+a/DdI/zT
	JBtmFU5H2XMEBiqBt03RTZ96XYYOsyOjwxbbe8iXs25Ff9aFeMkote9NxIwSjoCymmx9/27oCJXy
	dJF6dnRZT3fsEOdVleSI/XR8kyC8I/WBqGk+DOUjesS5lVYrgRhlZ6rw6ASpo9G4JUF2Ha9ZFWIW
	OtIUFikYak9Q6tj1RL9cfcem+/+Ka0+/NOjdv8t9ekhLZKNaxg9V2Vw8SnZ5cC7lo6NnQXHu2joN
	Wbe8/Elp/yi4sqTtXiZHhNmovvmSQZ8DJ01p3IPG0oUpItV/hMQ7TY7O6vjmmQWLslkgJ97Sz9v6
	OM06VRh5E/UhzSR2VO4cwZLF9aj2tML4p70zeb3FbawG41p+rCUO/5ELJWZA7wda9u+SpfyQze1G
	c=

Increase the timeout for MCU_EXT_CMD_EFUSE_BUFFER_MODE command.

Regular retries upon hardware-recovery have been observed. Increasing
the timeout slightly remedies this problem.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index c1c5afed571f..d93a72d0a78a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -210,6 +210,9 @@ mt7915_mcu_set_timeout(struct mt76_dev *mdev, int cmd)
 	case MCU_EXT_CMD_BSS_INFO_UPDATE:
 		mdev->mcu.timeout = 2 * HZ;
 		return;
+	case MCU_EXT_CMD_EFUSE_BUFFER_MODE:
+		mdev->mcu.timeout = 10 * HZ;
+		return;
 	default:
 		break;
 	}
-- 
2.47.2

