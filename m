Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1A913E02A;
	Tue, 13 May 2025 01:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747099281; cv=none; b=O2eBGkojn8ifXd88E+x/Y16TaNpzEYAsTwLXk4xCfxBIExH8YjImptPKJZOhh4Z8zUT4gH29BmaTdEKytjIehaAtJSM3lVQjbhXqnnOR4p7aqk8jtaO5S2MFahUtynfxetTSNYDuoSUjH0SU+/FlhL/2HOYHRtD3VCl+2PiGPfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747099281; c=relaxed/simple;
	bh=vqGigXA8EmHjZv5xyB30aWNaNpthSwxwCcCPPSpr5jA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Ekp/NltFPWttpM4wJ0XQ7M4m8XRH6dFoY0QwLvXrfIeObJ4qD8/bmMexU1Xp00DqcrQ7n7fTl9cas+xge6q/mriP5dtOv3vrXQjR9qcxkRgxLUPCWXsRoJOP0Ql4dX0VrowcsmdgsZQ4xJaUK9ywezUec7K7qLBzhkdg40x8p08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=QNaS7GC/; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="QNaS7GC/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1747099217;
	bh=975XiWevg8IyB7+oWu6bLHHS0g5LCqgBcM0TSyV2q3I=;
	h=From:To:Subject:Date:Message-Id;
	b=QNaS7GC/PsSBWhvDyVSDDuCwdGPrDRtWyP92G4EpAvPqHuwzDvzcS5SlcgYwzUYXw
	 5J9dbP9YMOTf4cr9CDPKbSHiXFVYlnLqc+0XvMHLxo5f2er/33YX8EbgYA81U5jQRq
	 dNLnz+HiC1mhIL63IGp8ylubkpaqL3DDwX5tQO8Q=
X-QQ-mid: zesmtpgz8t1747099216t17baa3c6
X-QQ-Originating-IP: ogzTGvVk3wO9+hitY6L5I6pPS+CPHubTZFIWMmaa6Gw=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 13 May 2025 09:20:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8353147344841585000
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
Subject: [PATCH v3 1/2] arm64: dts: rockchip: Improve coding style for rk3399 cdn_dp
Date: Tue, 13 May 2025 09:19:03 +0800
Message-Id: <20250513011904.102-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250513011904.102-1-kernel@airkyi.com>
References: <20250513011904.102-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NcfXIs+Ms1qHkJBy+DkuIZkVL0euOXaCO/4/GEZg9K3G9TUtaH4bww1S
	t4W96OadWm3FMZzE8kYqtC2Vd3iooXRS/woQfl9HBfJ+q7GN4alYWq3YcJppHkZv+9rE7oy
	fxRSJKeyXejwTM9GemkGFqDGsEiG33nhKi38s3hHJp79cNZXXZDOMT+gqnK/WrcPfgK+h7O
	N+h7AFTgTNo4jqO7FSFWKHM9w8b7zSl5t6Es642F8ggzb3D8VyCCFq68rrwd8dnKEOsdcid
	cUM+Mh9CUshyx1Muh5Ed1Y+RJCRF9LDv3Le4EpHCiPCNdLGu+9Bpbnlm9LkMo/JXczOIlne
	QDLc34/khxV45CtI+Z790xcXylAY1I9jxBIaTxi0aUAex/WNwi2zJNmO5GvdHGUMgMbd48y
	k+RdFA/TX/bAOF5CkMXWQoW9uxUycylwGovB4SgG+gxsewXGYD9miAjfvGsuLN8nAIUMQDL
	inDrVp/g4q/igHjBgK7CQ4PTAFer2f1kBZyp8SETB14Ff7TUvsFxq2QerNtLruuRYLtJ70K
	EbaUYvpsxNjtTkSlF1yajP6TBqWRwm0trIH+f60X2Ku4+nC5c1KlT7Bd+6yQ9MJgZ2Ozq0/
	dK8Y2rp9QXbD5kiei0w4tn+mW170Jr0ViCjNw5bZIXqUkZje3Zkqvur/9h6acrUyTahSk6E
	zsv5hCXn4iP189oH1MGiF5uKbOcByO9sz7DGB/1WLRInnkHFOZR0+obF6p/9QpUNQBPK7T+
	ebKnf7hHysBpx/slizbQzSJOkyw/k6oY2ejMRaXECFn+fT2+KWT7t2+gZzlz3ctERmeMKNH
	vOkE1m1ILIrERXcWk7u54R8OsthvRzeMNWhf7QDsKxq4Fi4neq42BfBTcdxs6HIhjopAWTn
	MmNGZDiOCzHsiDy/A9jCauUXVxjjBzzxVq2nvIQK1KOtZIJvuBYW/vO59HbJoxYoh8CaHbq
	x+apups8lsbLS8IpccxM7d3GN
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
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

