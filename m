Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E7F1B0412
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744722166; cv=none; b=dhGVwMajeuGKhbbdRSH0y42AZFfuvJ2wtXNhYck+LcPpcxVA/t2bohJa7bJdlsB/W+TeW72ZeMUi/pHWp5q5oeKIukZZdTCjVZ5d+Wd1sz0ODOxAXYdKW/JtMI86pnrjWyYFOkHa1IL2WyhLoVCBwVIe62BS2UhyksiuB0CyLj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744722166; c=relaxed/simple;
	bh=dqSohRqnaX3T4biyEYTa91cwEJw2TNovypV/CEmubvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D+LtO/5SPYT3dSIZ0WGl6QMwLaVtzQBXBAJbH69BOHSxoU65ZUYDvGSz3qY7oHMzKXO1x395Twu9LVzkZH/COd8/5W8FQ0Jgi2DkLOzuYEx7hVsIFWl4/zhHG5/kuBI8ukCUsMgevO4BEucs/Vblav+iA6NmO1ggjHvSqdvupwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=N/RvFUb7; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="N/RvFUb7"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1744722151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wNwI1U/mwji86+rRMoS5QnuPV7UL2iA5v/M6rqOfDNw=;
	b=N/RvFUb7IyayfB4EWy4lnoG3LdalNJuwYoFSvx2lgGz1dvoqYlTKQyKDRmXjTTA7C6/AVr
	JMJjpD1L5SH0Fz9eT8LqlZcGBfJ+FiNhM153kzNP4uJ2+Nbu33X9n1dAM90nYx2R3gegeM
	czN+83wuFoAyxIjBT6MKzD6KODWLRMLDOvIoa69H0iqwlnj9QD3tL3+jnIpBnny847Jmk7
	4LkeY/X3MQY9DHYSWylgzb+AO8e0t0e9dw+yM8QqPS878Bc0+KaFxPpDzWrrm9aNVw1ln5
	10kH4e3hZoB85p9/nBIMfVSS9nO+w/J8HC9Ph6NKHg/N3GO20tVY1H8H5u+V0w==
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Caleb Connolly <caleb@connolly.tech>,
	Dang Huynh <danct12@riseup.net>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: [PATCH] arm64: dts: qcom: sdm660-xiaomi-lavender: Add missing SD card detect GPIO
Date: Tue, 15 Apr 2025 16:01:01 +0300
Message-ID: <20250415130101.1429281-1-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

During initial porting these cd-gpios were missed. Having card detect is
beneficial because driver does not need to do polling every second and it
can just use IRQ. SD card detection in U-Boot is also fixed by this.

Fixes: cf85e9aee210 ("arm64: dts: qcom: sdm660-xiaomi-lavender: Add eMMC and SD")

Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
index 7167f75bced3..0b4d71c14a77 100644
--- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
@@ -404,6 +404,8 @@ &sdhc_1 {
 &sdhc_2 {
 	status = "okay";
 
+	cd-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>;
+
 	vmmc-supply = <&vreg_l5b_2p95>;
 	vqmmc-supply = <&vreg_l2b_2p95>;
 };
-- 
2.49.0

