Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A1B1E0DCB;
	Tue, 20 May 2025 02:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747709314; cv=none; b=apSesBFJ8MGuedQHRoir2sz/SDTRS/n1b7vdmydiip4lpDptj8992p1p6nMjeV6qWJO+jFE3ApTmXzxZTSiDctnMZ3leAbfp8ezefwcjGUhBLtW7UAO58zBv+2VO485fdGXnoVHyMlNtenh5PqF+cc/tVeDleYggS4ZwOSx9CKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747709314; c=relaxed/simple;
	bh=vqGigXA8EmHjZv5xyB30aWNaNpthSwxwCcCPPSpr5jA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=lSBm8wFMYYaqGBP63lHnhXEZHm6jv/4gPPS4GZv21yOvmhc1Ma0hjHNv/caGg3Fc70RtsQlMGa2JgLZIYxc0/r+47SgY+5vxRQZmFBYFRHHLGBfpaZeAEd3Gn/R2netEuruVuD7hsR4OGcFrLFXQJcpzYkwqz6XUkvjecMK3gIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=mkM7xDda; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="mkM7xDda"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1747709275;
	bh=975XiWevg8IyB7+oWu6bLHHS0g5LCqgBcM0TSyV2q3I=;
	h=From:To:Subject:Date:Message-Id;
	b=mkM7xDdaH0y6I6R4g02anci2qkHgfa9eyRV2I05TN6eA+3ATjXyIYUA/cULtHj9En
	 odewUybff2ZpMQMDWaOPjp181x84xSh8NwFidYG+GYn8/Yus39tJ9NnSv53if0XNTk
	 h4+3BPAV397Un1dSHhu63IUfatmuNGJo7dnJAd3w=
X-QQ-mid: zesmtpgz1t1747709273t11c1660b
X-QQ-Originating-IP: j08/Knoc5sKowREV0R+oKB6ClVB4MQa1mQa6PVd9N1Y=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 20 May 2025 10:47:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12805088329180934383
From: Chaoyi Chen <kernel@airkyi.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] arm64: dts: rockchip: Improve coding style for rk3399 cdn_dp
Date: Tue, 20 May 2025 10:47:17 +0800
Message-Id: <20250520024718.142-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250520024718.142-1-kernel@airkyi.com>
References: <20250520024718.142-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: N2uXtyrSU4Fu6EA0u/l5EunOWvgacxe3CqKiCCUnZUkKMFDiM8Jo5TXe
	jne0o5DuF7ToyCNudnq3e1TzRvK51jkykvuKimQz4waQKMPBn4f5p+dW/dsKAK6Zb38nVay
	o00xIywXmVegfBap4fAo/5IBL99/bmz6blLeEAbc2vlp5WV7Q36XCkV2Tn0e4L4Ox2HAK78
	ngwK+E2mL7/rDPzKKqXEZ0xBHB8tmDp/k6e2auoCQTJCmcbBEDahcvfaHrAZPlNpgmpRtF2
	VfFrWBXjPRTmIK18fs6MjYX+mH6VaJpwljMygx/IwpvSZaKDfL7mRIWoJtb1j2JbsCHppHG
	fuHgvmzlDRaJQNXiFbo7BObbb6vDKEnFnITF6119J1Lhr7A2PEdGWirI8S8U5Nf89VCpVlQ
	y+YwvMJ4xrhK86zdCLQpB3nJTSSg71CwpFMmm2ELTPmfiM1cD0zHSWYC8aJYV3pIN0ETs2C
	h+QbxHN/B9OfHexaJFV2Vbg8y8C2gG+LbI7+pCF6LCRa3OdnsFTWktNigy0F5ZHrDCp9UNc
	NCBHhirAznsTWtfq7mLToH9XRq8VuQc6hpY4ziKiCfHGkGPdjXw078zF7CKH7owOGgAS31t
	Q1db3Yjy8xLnPesr7WE64NML35113ZlDgKcU0j3FMsJV1CCLNTrn74RgXYheAQbvUf68wtw
	/zZj8+yM89hu+vK1K5sXycW/0XXnnHWtKFUVmL9KiA3GPagk605Mru1NO6m5o3reggZWqpK
	7rfey/I8T64DV+DScif7LEJdW+R4xdhIMObRb/fltjuG5EPHr7bSFxx85jzMiwYr9klT7fR
	IoK7YSUPtPeVWGk9HIHWKrI0NgGxkq5w3ECjuNjNXJlT4QMuCEdrlnYiG2hXQQX8gLrLldc
	nYfrFc5iOcKQbYi/zS+FR/iEcKh0x8HowjbvhazYumeuTaYKFqJlhsmRtP7q/HDiBsujgWZ
	dt8tshEI2+sDviBt5BmDOtuzV9VIvp26R1i1l4Q1f5ooPtJieCfiks2GVxTC6ut5EWLsZeJ
	vST5sswg==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Let's make the ports nodes of cdn_dp in the same style as the other
display interface, and match the style of ports's yaml.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

(no changes since v1)

 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
index 9d5f5b083e3c..e340b6df7445 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
@@ -618,7 +618,11 @@ cdn_dp: dp@fec00000 {
 		status = "disabled";

 		ports {
-			dp_in: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			dp_in: port@0 {
+				reg = <0>;
 				#address-cells = <1>;
 				#size-cells = <0>;

@@ -632,6 +636,10 @@ dp_in_vopl: endpoint@1 {
 					remote-endpoint = <&vopl_out_dp>;
 				};
 			};
+
+			dp_out: port@1 {
+				reg = <1>;
+			};
 		};
 	};

--
2.49.0

