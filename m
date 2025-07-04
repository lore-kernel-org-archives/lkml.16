Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE72148830
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.180.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643340; cv=none; b=CEuUCZ6PiJCVPjHEzBTemt9QFEI06aBPIwFSetOnvd6X4n0/5fDvVzMwFuN0Mu3O2anVk62XwZFC0gjvaT4u5Ys0l8VkzDCnHf7JAKEuwcC9rpC9ukgfqojGRP37u04+ToggPF2dyHJ1JDhyOOUC97o53Sha5is14kLTbq5xZ/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643340; c=relaxed/simple;
	bh=SUYcXSzBWGdNNz9o/+UtQEG7BQ3lY74Lpl9Cdx1xB5s=;
	h=From:To:CC:In-Reply-To:References:Subject:Message-ID:Date:
	 MIME-Version:Content-Type; b=mtzTihIjnWJfLXHXbPsGKtQKQ2nyNhCgl3niaY+5049np8YRFJNAdMHkp00X7rssgIRC74uWwvtSYCpIQPSt9/JpIu1nNL3247wDCC0lnAE1c1tAJoR1XDlSxdhuGMUpWy1BdGMNf6L56lDHuGIi/f4PXgXpWj8zwxbVHEHPc8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=okGCi0zX; arc=none smtp.client-ip=185.132.180.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="okGCi0zX"
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5648IYGi172034;
	Fri, 4 Jul 2025 16:35:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=dk201812; bh=i
	c4dCORjyUvIUluNdB6Hv8sLxo7aFOVTQQMZZh4ItpY=; b=okGCi0zXLFdWJ15MR
	LHKKZLE0JRbUuCkUuzKJjHXBS+X/haRD1jjNDZdjFhqg0aCmVA5osQE0Efrk5eds
	dxgJD+uTbs07RhfE8+F43At4Kw2oAiMl9uFlFAMERG7wy3FhNYXAH3dBzkrx0GbR
	kRH07RiUcVdL793kyuWnCHPlCn00laVE+lSaGaQVUN9Pjo/q7BpXLF07/Vy3ee+B
	eNR/AxnP/Itdg0h7wHyjXnQ97/EBQpnpIsao0Djr+OTM85qpTgQnIkXkp6kUSXiL
	JuarBF6Aa7x2oQD5p/khqCaLHm1ri/ir3YEHZIVyuhJ3bUqwUDAfyxxsqzdQroxN
	C9Qdw==
Received: from hhmail05.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 47j8ftcxep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 04 Jul 2025 16:35:10 +0100 (BST)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.7.125) by HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 4 Jul 2025 16:35:08 +0100
From: Matt Coster <matt.coster@imgtec.com>
To: Frank Binns <frank.binns@imgtec.com>,
        Alexandru Dadu
	<alexandru.dadu@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Alessio Belle <alessio.belle@imgtec.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20250624-fix-kernel-crash-gpu-hard-reset-v1-1-6d24810d72a6@imgtec.com>
References: <20250624-fix-kernel-crash-gpu-hard-reset-v1-1-6d24810d72a6@imgtec.com>
Subject: Re: [PATCH] drm/imagination: Fix kernel crash when hard resetting
 the GPU
Message-ID: <175164330873.70322.8845862980956103647.b4-ty@imgtec.com>
Date: Fri, 4 Jul 2025 16:35:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAyNiBTYWx0ZWRfX5Gs7zLjaetpy
 VqUtRFg6YPs9FkUBve99ajWSgqxlSNPybyzcqzaLmL6kAikZL7tbnovI74FHmXtt59+C6iK9i0m
 AGmKMzmVHUNjJiTv4buna52i35SYEpVPiuyVVZ/94f3C9DSgE2auhm0bvFKgdDXxVFgFI06PNCK
 /iPv3XIxQIOiJ6y0FwFxXqfPFbEFPYNRvK6KCzBndvVwD7Kg8MLM3f9qRdAuEPUra+KJ0ahLAyd
 5jEWspJpeP6kwAH7aCDeLnqpO3BVVHMFBFJ9SnNxTrR4LCRrZS+4adb2Wmzt8DR30we7OMJwj7Z
 L5UXKfXWNJHTfobG7N6HIFlVzA00tqiG1VoCnxqyj6ota4d1k6Xyz4IglBJbwTCIC5rEGM1UZJm
 mYQMZnDR
X-Proofpoint-ORIG-GUID: JKLeiVrMa3mQVAY2PDaW3BOGxbFwL4kL
X-Authority-Analysis: v=2.4 cv=LpiSymdc c=1 sm=1 tr=0 ts=6867f4ae cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=fFtJDOQOLN4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=r_1tXGB3AAAA:8
 a=_LgECFMNShmt_M_GEIUA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: JKLeiVrMa3mQVAY2PDaW3BOGxbFwL4kL


On Tue, 24 Jun 2025 15:22:08 +0100, Alessio Belle wrote:
> The GPU hard reset sequence calls pm_runtime_force_suspend() and
> pm_runtime_force_resume(), which according to their documentation should
> only be used during system-wide PM transitions to sleep states.
> 
> The main issue though is that depending on some internal runtime PM
> state as seen by pm_runtime_force_suspend() (whether the usage count is
> <= 1), pm_runtime_force_resume() might not resume the device unless
> needed. If that happens, the runtime PM resume callback
> pvr_power_device_resume() is not called, the GPU clocks are not
> re-enabled, and the kernel crashes on the next attempt to access GPU
> registers as part of the power-on sequence.
> 
> [...]

Applied, thanks!

[1/1] drm/imagination: Fix kernel crash when hard resetting the GPU
      commit: d38376b3ee48d073c64e75e150510d7e6b4b04f7

Best regards,
-- 
Matt Coster <matt.coster@imgtec.com>

