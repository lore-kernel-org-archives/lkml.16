Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F3E1EA7CC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 09:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743499712; cv=none; b=Jz1na5NbjV30ExgBetLUEbKj9ZdDZwKz2PRIflgz2FTePMtgfJK4C/Gv8ZGYkP+pCHX9IIlwJPiM7KD7VPHJQv3BY06H3nxqt/4tHNIUXHtLVaM0F2yYRnozIVs4hOfZw5/xnsgfj/c6uf8CaSiS6C3jEWE4MPpXtBI606rRscw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743499712; c=relaxed/simple;
	bh=544eZHKsXae6Y6rhCh1hXH8ERSQGUzvVjAB22Wono2o=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=CY8W1wDq/FQiHPvWscfPF97Ers3mYeU+8HFRkhiglysuIo+yRCzjo1aZzOGhszZt2BIw9MuB6sF9t/9FTYe0oT2dM3c4qfBRFgxfQeMbH6tGiFgARmcoVO3bYCb1j9rpxKBhLP5NS4miunR7rG0nq4nz1uN9HtPwRwzh4hbaPck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=gzvIZiOZ; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="gzvIZiOZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743499699; bh=dlneKC/ndU61i/vPL9mVRRu3chChSKIVHzfvKbs7t8A=;
	h=From:To:Cc:Subject:Date;
	b=gzvIZiOZLsYZ3s1yIkkMIMi43w5IC+41uxFAQm55YLSa8PFcM5n60+2oNSHvax/iY
	 W8JXfwUs2Y7x0F9UxlSALJhNSjMGGdK6Bmm/Tt4GZt8T0Ti71PUSR+ySlwWYRfZOUV
	 9T9vZdtsweVWboHZIOMrsL4CghzVlCJEDyLKvq7A=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszb20-0.qq.com (NewEsmtp) with SMTP
	id 58789A4C; Tue, 01 Apr 2025 17:22:07 +0800
X-QQ-mid: xmsmtpt1743499327ta9d3odcd
Message-ID: <tencent_4612952C8C5109058CD8E688D81276A2FD0A@qq.com>
X-QQ-XMAILINFO: OATpkVjS499uBTf0thpdaQtwQw+psHU6CMRV3bJoz671wedWm4NBKI0+89TFUP
	 34w0fHIr4V4aypPuB/y1i3lhRi1vq4jDnBbi9wYMGyu+MV/tlO2VPSLHJuNwgwpCZcz+e4MF5Lw5
	 0VlAUMba7YjDAnk0qBHOYh0GQx2kPtBsfbCX4RbisjJk5WVGrHIDJFjwkIQTgLXb11t2qsFQ9qzF
	 iYehbgdhi2mb2Tyo+PsAIy5wHYXcpON10vJb/ZzEIvdsdiDNjk8h4lDRDPQdSHD0+R5uvcbEkgz4
	 Hf8JEcS0GJEIBHXGEXCQKfgajE7v+bWXgA+3oIQflxmPK/qGcQ7PplAnjbGEuO1yeEV3S0bdFPHr
	 TlXIomiEvPmhF0mDso84izHEuqchxLR2C4O/oDEwM3V6o2Q8YfgrvoRUjhuhm4W+qRGiDxYkkoy6
	 tOxvXYPatkxvPg2XKis9i0jV+rLv1HOqEJXpHO7v+QOOWS56bjY4XIeW8cxxFTfSe/HOa2yTvEFq
	 qmM7lRgCGvSjsmD/NRKBjSch6HMxx9ml296sU1vq/VptZhaTcDR47EOO0QbMqaUI7NqljYfNemuS
	 RKbvNCOw76K2yWxfM6XYe6zgRSUiPTPe7MOOyHmEwlavoGvdGPOVaWauwc48jfM4jKXdPgBdpYbb
	 VQBBf/ZH5F6xjth0zHboXRCgp1bmDAcKQjeNmjS639Zi/dFmTT0yG3y46fZJkNSFgKr71HRP5keV
	 PhLfUNcHhMvHesEYy1kVwg/fL/ZTeygO0FaB9Uytr9qPaIgROys99Lb1ksyRiO7ar9uOxAsIY3/p
	 y0juuugnpAK6oks0BaEBZQS1I1bgbUTcEtqEquB/lAUsv4nE3xcfeaPwvW3Mw6Gj5+6C/VIy1y/r
	 q1MhLCNyS/nkW66LV4ul51nczaR6d1VfOYi6ISgNrysjoTwfG9cY1g8WGspB9lL5uCX8yh4t48CM
	 uyLvuH+LiKg9rj3w2NLhmmygIETImS7qdDV43xhGM=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: Yaxiong Tian <iambestgod@qq.com>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	chaitanyak@nvidia.com
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaxiong Tian <tianyaxiong@kylinos.cn>
Subject: [PATCH v3 0/3] nvme: Add sysfs interface for APST configuration management
Date: Tue,  1 Apr 2025 17:22:06 +0800
X-OQ-MSGID: <20250401092206.1542479-1-iambestgod@qq.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yaxiong Tian <tianyaxiong@kylinos.cn>

This series enhances NVMe APST (Autonomous Power State Transition) support by:
1. Adding warnings for PST table allocation failures
2. Exposing APST tables via sysfs for runtime inspection
3. Providing per-controller sysfs interface for APST configuration

The changes allow better visibility and control of power management settings
through userspace tools while maintaining the existing functionality.

Yaxiong Tian (3):
  nvme: Add warning for PST table memory allocation failure in
    nvme_configure_apst
  nvme: add sysfs interface for APST table updates
  nvme: add per-controller sysfs interface for APST configuration

Changes in v2

Add mutex_lock in nvme_set_latency_tolerance() for Potential competition 
between nvme_set_latency_tolerance() and apst_update_store().

Changes in v3
In  PACH nvme: add sysfs interface for APST table updates,Add why dynamic APST 
updates are needed in the commit message, fix code formatting issues. 

 drivers/nvme/host/core.c  | 24 ++++++++++------
 drivers/nvme/host/nvme.h  |  6 ++++
 drivers/nvme/host/sysfs.c | 59 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 81 insertions(+), 8 deletions(-)

-- 
2.25.1

