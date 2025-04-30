Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9452B288DA;
	Wed, 30 Apr 2025 16:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746032135; cv=none; b=tmyZ2b2CLClC0fji5bUA89UXnliiqrEFKx6nNJqt1fDBanN8YPdJuU7h6RbAmqYV5VBaFBjdpqLHcy+itlQACE2pMRCxBtbERGiVClPskX8CzMHRyECwKcQT0y3Biva0oG5o6+mTC7BNvnzVpgfhNsqIqcQ6vAODDyegS/dBxpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746032135; c=relaxed/simple;
	bh=rVksQDg6Z8GlPNURTfzz1H+/qW7Eh5iG5adUA84Vs58=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ATaEgo/hadCXXjQL1M/FhA+JmxJupAh9YtSf9xzD9U6o1iBDeZoiV1Shb7qpIIc+p0TZ2o3BqpN+L/Vodh0m1O7fajRirh9rFpOAaJqrZ6vlJui4RwhrPm8WkSaCUoltMKd+0mozXsrszaNhsalloc+umiFHabwXPsHGywiMnLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=NCfYOGMz; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="NCfYOGMz"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UCaS5U026622;
	Wed, 30 Apr 2025 18:55:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=MhBfo7eW4dxLckU5s8+ke5
	Fpqegf0jPSqbK3MOKU29Q=; b=NCfYOGMz5X9nMwLbWjzVS31qOr8Z2+1AdGQR6q
	h7up/wVVu1XxDn9u/a+LRSuX4yjqorb3uh0ZJyvn/2VekCCkt6/DhVyoi8gVU7sj
	1U13FXL9vsQX7nc2SYo7g2HSBjMmA26P0+4tyLNQ9X7WCCXUP7O9T3kVQy4fNUji
	e6uualePudYLvZLmhf6mutWzVgd1yI4q20s3heD71CRHeqw45c0QLmUIJI2QmGBE
	/UQ1ZjXU+PP7dV02Eo1ykAfttcnURxRiRn0YNEWw+NAtS2sGg9aWWBfo5S8cFC7L
	nZBzV4AQWCUkh8MwiG1W7uYvx9QZwjF+P0hcxBwKKtov5eWg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46b6tmv84t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 18:55:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BB1B04004B;
	Wed, 30 Apr 2025 18:54:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E99FDA476FE;
	Wed, 30 Apr 2025 18:53:28 +0200 (CEST)
Received: from localhost (10.252.20.195) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 18:53:28 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>
CC: <linux-sound@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] ASoC: stm32: sai: fix kernel rate configuration
Date: Wed, 30 Apr 2025 18:52:07 +0200
Message-ID: <20250430165210.321273-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_05,2025-04-24_02,2025-02-21_01

This patchset adds some checks on kernel minimum rate requirements.
This avoids potential clock rate misconfiguration, when setting the
kernel frequency on STM32MP2 SoCs.

Olivier Moysan (2):
  ASoC: stm32: sai: skip useless iterations on kernel rate loop
  ASoC: stm32: sai: add a check on minimal kernel frequency

 sound/soc/stm/stm32_sai_sub.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)


base-commit: a9bfaf85aaf2dabf541eb7a4895db025d6d8eb1c
-- 
2.25.1

