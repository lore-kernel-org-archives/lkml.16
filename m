Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA612231CAE;
	Wed, 16 Apr 2025 06:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744786507; cv=none; b=gm1RXtUSbCDeGglA5aCE5JmXWMbTjeeICijZCkK1kPCmmUGgaehzhF/IH1BqtrDEuFSNgYNMKEDLdUPoeqDdtzLfEHHtaFW6PjSigBeEHxcGqN1sDG/3OKqDUzRPmGe+Tu8/gzeesfR/3omjXwjh3hKE1t31cMRI2iZdHM/BsxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744786507; c=relaxed/simple;
	bh=5Aw7PZlPRNIq1ZdW/H4hJQMsd7p/xyc2yDa2BP5+vrk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RX5EZmiz51beC2R/mRArAa/18w6IR0wXPXCjshmByMTp3iiV/OV6TfZ2wQ1mwPUyLo14iUo9G4WzgZ6pNA34o6mtImc2xH1ebvMRQOO7/+nR+vTnRftYmT56D6FX8lOTd0TAAxx47pbTNtlPA3MOck952mvUPQ7ZW8ovRJVOLno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=oQTc5NQF; arc=none smtp.client-ip=185.125.188.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="oQTc5NQF"
Received: from 2001-b400-e2a9-54f6-6e67-7778-9cb9-7043.emome-ip6.hinet.net (unknown [10.101.200.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 2731F3FF14;
	Wed, 16 Apr 2025 06:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744786015;
	bh=ETroOFXahmn2t5VaBTxI4L8slF1VXmL7ifUOmTK6emQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc;
	b=oQTc5NQFdHYUVVI4hxcmFWo+lKqjy2nxSjk/z69S9TmJwpcYcDWe/czHnUrfMpMdF
	 9t766T+UAJFqvzUfkTRVLhl0o/Gh7MvPw+/nqviKISnh1ju89mOqQhMQNy0d9OT28f
	 tZTRgkd8z3yEVb6106N+Ft8As12eIna6BvMngR0b+rKratIz5j2L2VT3kxODZ4T75Y
	 yy4MXLngx4YqahhZg6rJyfaTSmn2QhQwkoTWM0WaX7IeMZFTH2VHOYxz95wGqzKOFJ
	 wpbJo7oIYUQQmem1dx5SxjS2WmGC+bmpSsxUBWrllq6hazfNeS0m4X8B/oFCbHsXhM
	 bjSe79LeZ36Eg==
From: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>
Subject: [PATCH 0/2] hwmon: (spd5118) adjust sensor behaviors under SPD
 write protection
Date: Wed, 16 Apr 2025 14:46:25 +0800
Message-Id: <20250416-for-upstream-spd5118-spd-write-prot-detect-v1-0-8b3bcafe9dad@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEFS/2cC/x2NMQ7CMAwAv1J5xlKTUlr4CmIIiQseaCLb0EpV/
 05gOt1yt4GSMClcmg2EPqyc5yru0EB8hvlByKk6+Nb37dGdcMqC76ImFF6oJfXOjT/iImyERbJ
 hIqNoGAbq7qE7+2GMUINFaOL1P7ve9v0L8zDwh3wAAAA=
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Yo-Jung Lin (Leo)" <leo.lin@canonical.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1380; i=leo.lin@canonical.com;
 h=from:subject:message-id; bh=5Aw7PZlPRNIq1ZdW/H4hJQMsd7p/xyc2yDa2BP5+vrk=;
 b=owEBbQKS/ZANAwAKAV8XsZZKKe6GAcsmYgBn/1JWLAwAKHbyy+9+Z8YexEPaFUs4n/3akN+oH
 fIbX2PE77+JAjMEAAEKAB0WIQQzqV4kW+yguuqHrw5fF7GWSinuhgUCZ/9SVgAKCRBfF7GWSinu
 hvteD/0e7R6YeZFa7jAZ0N9I53PZ0u3o+CIxTGha978uofrnLXWDCQ1XAq4OAXCNY3bJgiqnZab
 AxMT3JVwLcOx7MBv3Glx92xxjpGn+9f+4yKfvYb4lIqDunxhW0FjPsBUxtNOScoD+niIKOcT7uI
 3tFEdYsymrhrvfO7apeyEA33G3GtmHParyj+aVLcI32tyrBZRV8kpX/KPIwpJFpvnYEyr9LpOk4
 yb8SssmLoTxTMreX9M9joKshsQBAAjs/Iu7GMUEO7gn1kIFMp+noHJYMEpsLYDTWv2oelVSlfH9
 Y7c3gpUy0TTGiu/M1jCMj+CXQJfsGNuY8OaL/GD2T1M5yFKtkSmH4j/4kd1nznLnd9k7i8VAqjg
 eC6OcIyE4gOfsSHPKsmeF4K87H4ao1j4bRTlYtVkBMvD4wbOw1tumQTvcxQkHM9F+z1sfoBjPQ3
 fjLFlKAjBc0xOlslrH9JFRRvvDqbJMTQiLzx19qR5lkFk0PdQdhjmzGaZuX6VwRlyO0rieR22nK
 LkXdqFl50xlfFrfMDri9/7cki4eSU4GgBRPMu7u++n/RwCSAF2JOv1/ngLcrR5YWHtzwsb0nj5e
 36s7h+nP7Q2SXTAMCTv+7t/4QUwTLJHZo4V7xahFK2oKgynNMOsb1VD6GWLJ9MiXGqOBOL2Nw3W
 y1lUdcS4A7yx8Qw==
X-Developer-Key: i=leo.lin@canonical.com; a=openpgp;
 fpr=33A95E245BECA0BAEA87AF0E5F17B1964A29EE86

On some PC platforms, BIOS may enable SPD Write Protection and forbids
writes to certain SMBus addresses. For i801 family those addresses are
0x50 to 0x57 [1], where the spd5118 sensors usually get probed.

One implication is that the driver is not able to sync back values to
the sensor registers cache during resume, leading to resume failure.
Also, sensor functions related to writes are not functional in those
cases. This has been observed on multiple existing PC platforms from
Dell and HP.

This patchset introduces basic mechanism similar to what was done in the
spd5118_init() to detect this, and bypass sensor functions that might
involve writes if this is detected.

[1] 18.1.16 HOSTC—Host Configuration Register (SMBus—D31:F3),
    Intel 8 Series/C220 Series Chipset Family Platform Controller Hub(PCH)

Signed-off-by: Yo-Jung Lin (Leo) <leo.lin@canonical.com>
---
Yo-Jung (Leo) Lin (2):
      hwmon: (spd5118) pass spd5118_data to hwmon callbacks
      hwmon: (spd5118) restrict writes under SPD write protection

 drivers/hwmon/spd5118.c | 41 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)
---
base-commit: a6d89461ace59cf66bbfecddfdf3433f626ecd7a
change-id: 20250416-for-upstream-spd5118-spd-write-prot-detect-a7e3ba39278c

Best regards,
-- 
Yo-Jung (Leo) Lin <leo.lin@canonical.com>

