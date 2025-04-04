Received: from mx2.securetransport.de (mx2.securetransport.de [188.68.39.254])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF1B45BE3;
	Fri,  4 Apr 2025 13:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.39.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743774660; cv=none; b=jxfX89GIBwdM1iDoXOR3ovoKS3SvrGc265vU6t+K93eX/T4E5rOOj54PcSu6gKYXG8bgRicv0sMxCY0bTUqRFvi+AdMaWdsox088bD6qbIkZY7DhKwxu+ziFDn2YzOkG6s/1abnpq6EMsbeAshElJuO2NBCNrqeWtCe3YCoDOmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743774660; c=relaxed/simple;
	bh=hVT2gV81WiynqyAvgJ80N/NPNcWm4WWWhENk0ztWwec=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mJMfDlhgweJT7GIMxGNx6P4LyN992Aggv9P8Z8QwiRkxmwbY6nG/54+qDigpYPGkvE244DWuB39cUBUPbdSwYNq0YGkHyf9pyjJJz8697q5RhAX1C2pBnhVET25GL07HJ9aPuES5dtYO82W8/iWPyxBud+pRwdAelYHHvp+HSf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com; spf=pass smtp.mailfrom=dh-electronics.com; dkim=pass (2048-bit key) header.d=dh-electronics.com header.i=@dh-electronics.com header.b=P3LwILsi; arc=none smtp.client-ip=188.68.39.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dh-electronics.com header.i=@dh-electronics.com header.b="P3LwILsi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1743774094;
	bh=usivlFTDzVIZfDa9MfqJrFI4XYUeFJ4i6p8YAeHPhkk=;
	h=From:To:CC:Subject:Date:From;
	b=P3LwILsiZqNvMupxtz5Mz9q72WqqosIkuHeEcv/x417tnXy5wQh1SiIjqMaXVZYmW
	 tEUwCl94gPPfWaXdHwjcuABHY/GnvekOQOePrxuMkG1JDOzPJdgAy8hq9HE2pHids2
	 OPMOAYBDMeybjyM6GryWVX4ZG+EXcwA4iFHXJlzOWg5q1PkyG4UeKtLgQu789XK3Q8
	 +tO6jf4+xcpfa6pUHQHFP6HOWsgpEztYaYMVy5mvg8v2VGObMIijmufevsXliuyB0z
	 9eFyjICb/kkdRXbwMs3Xmpi81RKzj0l/wuaZSk2YJ55FJyEpe6Wlkp/kz2tJ4IFgI4
	 Ccws/xAz5mjxA==
From: Johann Neuhauser <jneuhauser@dh-electronics.com>
To: <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: Johann Neuhauser <jneuhauser@dh-electronics.com>, Jonathan Corbet
	<corbet@lwn.net>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>
Subject: [PATCH 0/3] regulator: userspace-consumer: Add regulator event uevents
Date: Fri, 4 Apr 2025 15:40:06 +0200
Message-ID: <20250404134009.2610460-1-jneuhauser@dh-electronics.com>
X-klartext: yes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This series adds support for regulator event reporting via uevents to the
userspace-consumer regulator driver. The goal is to provide userspace with
a straightforward mechanism to monitor and respond to important regulator
events such as overcurrent conditions, voltage changes, and enable/disable
transitions.

Signed-off-by: Johann Neuhauser <jneuhauser@dh-electronics.com>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>
---
Johann Neuhauser (3):
  regulator: userspace-consumer: Add uevent reporting for regulator
    events
  ABI: sysfs-platform: Document uevent ABI for reg-userspace-consumer
  docs: regulator: userspace-consumer: Add uevent-based regulator event
    reporting

 ...ysfs-platform-regulator-userspace-consumer | 23 +++++
 .../regulator/userspace-consumer.rst          | 92 +++++++++++++++++++
 drivers/regulator/userspace-consumer.c        | 74 ++++++++++++++-
 3 files changed, 188 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-regulator-userspace-consumer
 create mode 100644 Documentation/driver-api/regulator/userspace-consumer.rst

-- 
2.39.5
