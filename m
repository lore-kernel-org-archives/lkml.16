Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AA92D8DBD
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.180.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750774968; cv=none; b=bTilprssr3lQrlGRuohC8C+PdmxH4nSpWrMg6ismNjc9thfpGXcbBPNJb7pww2q9SzoFiWaqtEuSf5Vy/VUUk/TGb9MXBAKjjWDI0cs40RAHgXihy2qKv233ZB2wxVXhQl3xegUy1wuOLkl1XQQCey7jjnL66+rrlks/O0MezqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750774968; c=relaxed/simple;
	bh=bry5S7hxwXABiSQaKo2xdGKh9EMWmjoNPbtp/YKpMI0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=UZbBLFs2FRj+PhUcuRk/EjUybkfljqrV4dBKZAdFJjyQxAYG1OU4GYZB+9oZrAEQvZtFYbwYf7DIpj/Xp6/qf9hkXzXqPx7HOC57dfYrVXNr1dlomEDK3k1r2EeDqePpeIhLcmrpy+1Mm3FPpYSuYxNtN+RXcfxO8yoc5g17kuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=IbGtn0RA; arc=none smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="IbGtn0RA"
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 55O4P2mx2842470;
	Tue, 24 Jun 2025 15:22:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=dk201812; bh=Kv9ukiUS3t18WIC1v/EImP2
	5RSOrbieqrc4D+mE1qO4=; b=IbGtn0RAIYWEzSyQZGydn+0ipDe4qdgkYX/CzNy
	ipzqoKo/es4cGHw5hcEPyMU9dQoLW1bevSlo8NbBbKpRzfcKoP0K/9FxIUUCfS9l
	/jo8mGc7TeHn4mQyvmkG+coFz8QqjAHKsKbolg/OTAxidpCk4GVaXs5tAh7/M9uy
	ZFn5dBqOsMljVlICqR45Bz5A8f2LQf+Mtb3bCqxLZFy5H6kcj1BoWyKULlCNF8N+
	HBaCHudWbkLLP2omn2AzKSJvPjCPxmplBybDgmkcLRBRhaopFn0KbgfVlQe9KLG5
	i/8rSoNRyfzJl8nyBtIlyZ33o8cBBzlEfxnwUvGX3azyKvQ==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 47dmtt2c9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 24 Jun 2025 15:22:29 +0100 (BST)
Received: from NP-A-BELLE.kl.imgtec.org (172.25.4.175) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 24 Jun 2025 15:22:28 +0100
From: Alessio Belle <alessio.belle@imgtec.com>
Date: Tue, 24 Jun 2025 15:22:08 +0100
Subject: [PATCH] drm/imagination: Fix kernel crash when hard resetting the
 GPU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250624-fix-kernel-crash-gpu-hard-reset-v1-1-6d24810d72a6@imgtec.com>
X-B4-Tracking: v=1; b=H4sIAI+0WmgC/x2NwQqDQAwFf0VybsBYWtRfkR6W3acbWlZJbCmI/
 96lxznMzEEOUziNzUGGj7qupYJcGoo5lAWsqTJ1bXdr7zLwrF9+wgpeHC145mV7cw6W2ODYWZC
 uMvQy9zFRrWyGqvwP0+M8f/T0wyhxAAAA
X-Change-ID: 20250619-fix-kernel-crash-gpu-hard-reset-1ed31981f8cd
To: Frank Binns <frank.binns@imgtec.com>,
        Matt Coster
	<matt.coster@imgtec.com>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>,
        "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        "Alessio Belle" <alessio.belle@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750774948; l=2265;
 i=alessio.belle@imgtec.com; s=20250219; h=from:subject:message-id;
 bh=bry5S7hxwXABiSQaKo2xdGKh9EMWmjoNPbtp/YKpMI0=;
 b=VbJ7qRFJXRv3ChSMbWpIKS+k9zyhGuO3GYTOc40WsT11hy6cteWgHZ3L4lqKSjIuL86Oixx0+
 7b5zjterM27AYFdAXSUTafIIyrtm0Ue9o+ON2sWkyUWf447h1QwIlXW
X-Developer-Key: i=alessio.belle@imgtec.com; a=ed25519;
 pk=461lRgRg6AriUFORrCd1maNrcZ+FQJK9D+lWwEPvRPk=
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=SeD3duRu c=1 sm=1 tr=0 ts=685ab4a5 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=vQ5Q824bo0gA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=r_1tXGB3AAAA:8
 a=f8HQL1Yn0BBEiHFqfS8A:9 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: 25DICL3I7sUVX3gbdncNxgZe4grrhv6x
X-Proofpoint-GUID: 25DICL3I7sUVX3gbdncNxgZe4grrhv6x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDAxNiBTYWx0ZWRfXwykY97eTWUlU
 6dbpZ3mEaDDQGhoM8mV444HodQu59YWeZPW2dEURrsgLd+Q4/+JCoLUz1mD+zY+aR0dc1Btjz9v
 mPT0Ttff9rnUTq8PBoAJtjePU5YZKNu/I3I/0V/dD1tew621d+/kpeWyDKZWkNb8F25ZrWLi1EU
 oENiXcnfLmBk+9ebBRpg76CjafbHTopWOlDBtfTCZs7QCQP/lKMuw1DX3gqUqB5zd7OV0eP/k2s
 0SoEeaSxcurUKSIoyjtSHO0F09zFGTXgqAGGqUi6s+1da+lDtP6LQROJW4t01gs4Fzb52e7Xl76
 Q7DUnQCtpGuChlaWNPFA+C62wD9pEHWtEOqZkGj/zPMl3hqlEpM4ChFdojqabjijnK6RS0lKTyn
 feP2FMSx

The GPU hard reset sequence calls pm_runtime_force_suspend() and
pm_runtime_force_resume(), which according to their documentation should
only be used during system-wide PM transitions to sleep states.

The main issue though is that depending on some internal runtime PM
state as seen by pm_runtime_force_suspend() (whether the usage count is
<= 1), pm_runtime_force_resume() might not resume the device unless
needed. If that happens, the runtime PM resume callback
pvr_power_device_resume() is not called, the GPU clocks are not
re-enabled, and the kernel crashes on the next attempt to access GPU
registers as part of the power-on sequence.

Replace calls to pm_runtime_force_suspend() and
pm_runtime_force_resume() with direct calls to the driver's runtime PM
callbacks, pvr_power_device_suspend() and pvr_power_device_resume(),
to ensure clocks are re-enabled and avoid the kernel crash.

Fixes: cc1aeedb98ad ("drm/imagination: Implement firmware infrastructure and META FW support")

Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_power.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
index 41f5d89e78b854cf6993838868a4416a220b490a..3e349d039fc0c4176b5c4baf009ffa005a2b28d1 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -386,13 +386,13 @@ pvr_power_reset(struct pvr_device *pvr_dev, bool hard_reset)
 		if (!err) {
 			if (hard_reset) {
 				pvr_dev->fw_dev.booted = false;
-				WARN_ON(pm_runtime_force_suspend(from_pvr_device(pvr_dev)->dev));
+				WARN_ON(pvr_power_device_suspend(from_pvr_device(pvr_dev)->dev));
 
 				err = pvr_fw_hard_reset(pvr_dev);
 				if (err)
 					goto err_device_lost;
 
-				err = pm_runtime_force_resume(from_pvr_device(pvr_dev)->dev);
+				err = pvr_power_device_resume(from_pvr_device(pvr_dev)->dev);
 				pvr_dev->fw_dev.booted = true;
 				if (err)
 					goto err_device_lost;

---
base-commit: 1a45ef022f0364186d4fb2f4e5255dcae1ff638a
change-id: 20250619-fix-kernel-crash-gpu-hard-reset-1ed31981f8cd

Best regards,
-- 
Alessio Belle <alessio.belle@imgtec.com>

