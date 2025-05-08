Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B5121ADA3;
	Thu,  8 May 2025 06:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746686665; cv=none; b=aZVF4Rbaae4Amf9HMehJQtsPfuYvZGzb/CKFmN9NoGxmzv7sTW6mHNRObZRdAqnBl/UWSsRGXwoJ6Jn2gwUzSVD8/sCiTNm6oXm36VOpW0G7KyPV5kTLtee0dP2ARaJKWbUzaLWVERP2mUsnK/M0eYG9BAQUegUwm6Nw6NvQYYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746686665; c=relaxed/simple;
	bh=/38mWXskPoVQglLcSXuOweYW8P002AnwffGmfoyHC+I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ruZax9bdj50oCUrytQN8b2h/m7YXKlpFC9DLzANc3QoHPJy5rt2p+e40ZIZgANDD4gyjs9yzAxSKAd7kxGLHSZjkIygRRP8t75He+7iquTPtDi/YnkETD1gDM3euWPjo5EIliGgFgiNJEUID4DlyQ9XubOA6z5o2vyPL4mVvWtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=EIBFFjXc; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="EIBFFjXc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1746686614;
	bh=QyDFhO8OtjpTCJbTfPuoHwFDRMlY45kLnroWzhMw0+o=;
	h=From:To:Subject:Date:Message-Id;
	b=EIBFFjXcS1XhvSE80uXG9ACdOd1Elnc6pazPCFetlfV1srzr2i5Pp2jHvYO85xQ2o
	 g2+Gn9I25Sv4trSTf4HSVZosb3BAY08/G5CXxC+71niwt3Vm9WS9Z82NMpiIi9GSDM
	 drJA8tOiWy0FQUUgG2XO3ss7g2Or8RoP3k0XRpck=
X-QQ-mid: esmtpsz18t1746686612te3481210
X-QQ-Originating-IP: zbzDiNl3M4Ey2lstqT3s4mpmSf/C2+GYcEOzllnANXk=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 May 2025 14:43:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 997468467344160860
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
Subject: [PATCH 1/2] arm64: dts: rockchip: Improve coding style for rk3399 cdn_dp
Date: Thu,  8 May 2025 14:43:03 +0800
Message-Id: <20250508064304.670-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250508064304.670-1-kernel@airkyi.com>
References: <20250508064304.670-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: N5B7MX/IRFYgEb1I4KmXo2Ziq6XRf69B3uXk7PnGoPxySQhlZvpv/XYE
	PtUfBYD1Sw3zPuLf0SqUHBr4OSnXsXjpuJI4nDCKI5KD+ekTPFhEqS8zhROeEgFSIrWHBCn
	Hv5qHWvicl13+yg4bho6pcYLQDx03ZmfOjJAzm3YplltTo14kPYrulaI/geBgidQCBkS7/R
	uJ+favHAQ0dkNG2jjlsMBRdsRax9SCRHsl8kamRgWTmqx26CAf/tzcFTUQ/1duJadj8JGM7
	n86D2A9CHnXOypQociLXJvY1/e9DtWv6Q/1//ipT67YSvs5/vBBVbVZW0zzBQgxnXSOZ6C4
	Woa06SkHPAWlRn2H4SYkTBNxB/DBXuJJSm13OksKSmfT0ovIKDlHbxtr/5ynL0RjZkEjTyT
	AyuFhvJYFD2bl+czpCvIg1RyO74YttGxn6UaV6eSG0Neh+ZOmcnFUkdgFD7r59IPPOBfPcO
	Im/nhqLEdDiOSVFCuN6naJ4i+/Ysar39tKpcJUHM2Cshb5PRPOOWnOxTwxKpZBngcN6GIRY
	ca/MRXvQiEQsEcRcs2y90fwIuCKxwpcCuFV0Ec+wQaEUzCi0Qn1RhyVFJo0J+/sgsDDUlSx
	55wFEIZa8lQbZaLlKvprxilt/R54VB+pxe9ai8pyD5pqEM4U7Pez7whjZb21HmkEe2p0TfQ
	8V/MQ7TrBdjQafWlZ8zhZCVduIv6mevtOJHWFeL4NFNFtUOMGnEPWOnaKtdgIB6LNza+AVo
	aZeyQfXfSGsfXHbMcnSgaZEFFUvDYMvn/fMJACE14647/dXpPUXcDb7kthc43ScJGN5ZjvX
	ytxSCGED2dYdPHlyGqsSrMRzFEg4gMB4DPEWfu5iSY8PuBCQ4tZzEh289R1Of1glFgQw833
	8bAuUfYzoQHpac5deERHHSjr4AoJV7Ufq6f2vkwAL6c0aOXeWSmywztSAWvh0rXhGU3ELxt
	MVDgLxklZMP/MUwy2i58XlL/4
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

