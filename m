Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56199221F04;
	Mon,  9 Jun 2025 20:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749501449; cv=none; b=MKglEMbcA2AEBnoKfJeRQho6cXvZIeh9xzov0WguoMQ0BlnJXbh9SXzozEFAniwGTIHLJWmIp/8eEHTToD8cPKX+Q6JP862X1oNWnY9RNej4rcEB/h3p4SdBR5IJB/86FyiiZeB9GfZqzCbs8vNNy0pU6OJbSq15Mi0fYW+rZsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749501449; c=relaxed/simple;
	bh=sMl+KyYXZN1gPkv5OuQg53B/7jDSHwN6BgQLgKD+IxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jurVvH8M/9CiJcVPCyUq+AY6pHl2RpbZPq2dMo2gb5mlkjb6tD1JH7SfaywQvz8KkZZcoztUwBKEL/FeyafAffSEQq67lkjM256RBEOOMgZ82CXT2qcOVzvqO7JW5Rd0w865HH25TXeT5UgBS7OAO85iup658tl1Wp69qbPPJms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jw23jC3n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jw23jC3n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC63C4CEEB;
	Mon,  9 Jun 2025 20:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749501449;
	bh=sMl+KyYXZN1gPkv5OuQg53B/7jDSHwN6BgQLgKD+IxA=;
	h=From:To:Cc:Subject:Date:From;
	b=jw23jC3nhoKN0TYG+a57rDYpE/1cm/4nfOjPtoByAwZJBCNKcK+DQfbXC411IX0EI
	 EIeV2q0pCjzJgN2D4387yn4EUFepGm0SgXBt7DA2rpg2BjN6VZpTSBf9oc2FaJhcFz
	 vyW65ouc3e2yMA/tP1pqRPHGiIHJsaJsfnkqrvGIMJygXR5RQU8XFb6IAjFLZAaZY3
	 Gl3nLXqFg9qCWj3X74nrQY4hwQaqV7dHF6lYS7ZtBDvAJRq8Zxy3QYqM99xyVmZotL
	 SrEh/TMt3kOTnLGFtSjdc9M0aywBO3JfOTugkSbXTGQtMVjmA4GfdyoE6mzXu+M/aq
	 77G0Hbi/3PQ/A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: nuvoton: npcm8xx: Drop the GIC "ppi-partitions" node
Date: Mon,  9 Jun 2025 15:37:20 -0500
Message-ID: <20250609203721.2852879-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Arm GIC "ppi-partitions" node is only relevant to GICv3 and makes no
sense for GICv2 implementations which the GIC-400 is. PPIs in GICv2 have
no CPU affinity.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index fead4dde590d..acd3137d2464 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -32,11 +32,6 @@ gic: interrupt-controller@dfff9000 {
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			#address-cells = <0>;
-			ppi-partitions {
-				ppi_cluster0: interrupt-partition-0 {
-					affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
-				};
-			};
 		};
 	};
 
-- 
2.47.2

