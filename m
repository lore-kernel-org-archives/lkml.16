Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A85207669;
	Tue, 15 Apr 2025 01:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.154.54.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744682144; cv=none; b=SLZxwnaIIUdJ8OxAMthHDdlHxj3HutGEAbZVZqWYqOl5A4WSxXnpbU1IBl3IGg/NCnde9eGgQCVhEQukS+vUMFS74qv4dVa5MCU76AyjBzVIJyRr3s4wTpRXfKmVYKh8Kz31E3kne6AHh4Yq+VAAFj4KlbjRluN9HvfDTpPRukY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744682144; c=relaxed/simple;
	bh=ltjCxE0D7wgOv6JlDPUtzIkIrGN7CYEuMJVCjeq8YW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FDRv1krm/+yGKSr2bLnSG7T0lNGtoCXamyyVe3xVX+wt8bs1xSEwXlHmaCRhCiA+awSD+7tDnkLUqpb+X1KthKv2T39AOX6eYJ1ePCAvzA4wtIyd8n9TTnhDB58eg0BC7y77Ziuz/xOmyivglwQznSJdTMV1YPuUjWoplv171o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=AyVKt6uJ; arc=none smtp.client-ip=43.154.54.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="AyVKt6uJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1744682093;
	bh=i6D1yBJk9DHmlyAcbJooHq3G/IGyUc8sMEwvJ4y5HFg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=AyVKt6uJkGqRoop84r0s0vfM+3eoeaozZI1Vzxsf27XoZEVF7KxxUoBoIsFVGwayB
	 xZIxe/aLs+GCWgZowEvXRGRRjbpn5Y5tmZxT9TdV55zHf9pJ0FaQmLodtThcY3W3p4
	 keKbE4FewMhkMwWvHoDWgS3fHxa31tyhB41ykZbo=
X-QQ-mid: izesmtp87t1744682090t65b4e76b
X-QQ-Originating-IP: zJXrdrbIL3JMAAlLItEVYCPOAmq76asgM54TxVAkvzQ=
Received: from localhost.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 15 Apr 2025 09:54:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9498136726395687059
EX-QQ-RecipientCnt: 20
From: Chaoyi Chen <kernel@airkyi.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add rk3588 evb2 board
Date: Tue, 15 Apr 2025 01:54:40 +0000
Message-ID: <AD40AC968D12DF48+20250415015441.371214-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415015441.371214-1-kernel@airkyi.com>
References: <20250415015441.371214-1-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: izesmtp:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: Nn4C0BO3efGsrn/zBmOV6M2KypRxscQXJhULNPNBlraR5u9HWuPOfHZA
	TgfEGKHIx7/1UqO+mlVEvkJE0jNlQcCIAECNEYRAF4kAZDX5F1FsQ0+FeEqVNVSmidlas++
	c6sxv6nWYTHXZr/5wbjROoTzXvEQwkOPyhopEs7N3RAzOpNxCdrii/yCEbFJFOVDS0TFcho
	/nppdzyXjKrI3cBZliI50EwTVQ2ZD7utz1E3VLamvwlMVZ/schh9xNnJ550eI6gESYsEJ71
	6fFvEW8mPWEqVxBx3pVa58XnctM2YCXK3iacAun2r6tTbJWs6KXfP81bCkaX++5O7AhGP5Z
	sR0d1HgRN3TFpnpMTCtIAEiwgo7Aix8aadactxXfrr8hc9DI9dgqpShyNWbYJFDr59LtMbu
	dxdvvEB4GBrG8UeVq0VpK84S+P1PPGXMK8JmDYowfT7AoSZG8ZA5PqqHDxDI98otCKOtSfe
	MNBmLo5RA1xihSewoj4p841Ap+qehzio4X5m3V41E9KYEn9x2AiLuQbMEK579qRonxUzJHt
	pc/b2EHKaRZdGl5UeTLk9ksqNFbVjeklBAPBhsikVkfEKU7e2uBc0VwQu/9UhmDnTnIiReQ
	xuAiStwHBFHnVrjqGxahOf/z628gEGW9SB4kfgbE0tV7er9Lgfp1CK+oT6yTfeg9kDW91WO
	ihcVFsebMmcsPb6Q4B4lNberMrfHMj1fNaz6D++NFoPBTTGn75HOlboddrQ3UOzwUlcaXhL
	Z8mq/q+iMOaeKAGNL4fQj0njaFV4LeNd9osp4ynK59pw0H1i/hmLDQeETnhIE/hLf+HphSS
	ZTPukC1CSEFO/CTtV7Vc3oUg1HurHPG68b0YAtSJNRe4sNXTKeFse0sx06GE5lD7NpB05o3
	0NWKshNhuZn38GHye+BrtgEH2rlJZRCcuaRyLkQcLLtUlfzNFpLfG0yaXdOmdMLbKoilv+m
	RHfOmklr+vkcLoLONG8g2Fd8vqOOsKc8CuNUtHAtYJRTIlOHgz9M7aRryGgg7yi8p454vlJ
	vFnyfBsU1NTTF1iIcz
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Add devicetree binding for the rk3588 evb2 board.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 650fb833d96e..1ec2b74c0ed7 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1074,7 +1074,9 @@ properties:
 
       - description: Rockchip RK3588 Evaluation board
         items:
-          - const: rockchip,rk3588-evb1-v10
+          - enum:
+            - rockchip,rk3588-evb1-v10
+            - rockchip,rk3588-evb2-v10
           - const: rockchip,rk3588
 
       - description: Rockchip RK3588S Evaluation board
-- 
2.49.0

