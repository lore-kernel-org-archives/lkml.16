Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAF3125B9;
	Mon,  3 Feb 2025 01:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738546918; cv=none; b=qyQu3+bmaF7zssMgDyqPmYYviqZDUOUl+OUINTh5/hH4c8yXEwNVnWhDBBErVmIh7NMUV/vd7do3JsfbSf4bqfFjE562y0K/TQCEytflpSyR3BRptKtQXIpiaESe0KTqXdpQwLYtK35eandZuQhfUfaosLNGXRWn6dLfDxvArXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738546918; c=relaxed/simple;
	bh=Sc7c6qJOjXxAYf/tJ+9IkLJQzazqGIURjYV6lVI36aw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ghAb64UOxyU+/K4DoIn9U5ndSWHtRrWYwls52KQeR0ZD5swX7G8ihi1ZOyyzHE6XVd5WSW/IByrqX8ma1ia+iV9WJfFddCui3kBTHsKSYmVjaeG6xVRrWIl8ON3KjD0HsMpn4h+bkLg1iOWyDDz3eBOgN6c9TuQiQEne5K5/NWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Received: from hay.lan. (unknown [IPv6:2605:59c0:20f3:a400:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 23BB1B2255A6;
	Mon,  3 Feb 2025 02:41:48 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	E Shattow <e@freeshell.de>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v2 2/5] riscv: dts: starfive: jh7110-common: qspi flash setting read-delay 2 cycles max 100MHz
Date: Sun,  2 Feb 2025 17:37:08 -0800
Message-ID: <20250203013730.269558-3-e@freeshell.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250203013730.269558-1-e@freeshell.de>
References: <20250203013730.269558-1-e@freeshell.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sync qspi flash setting to read-delay=2 and spi-max-frequency 100MHz for
better compatibility with operating system and downstream boot loader SPL
secondary program loader.

Signed-off-by: E Shattow <e@freeshell.de>
Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index a5661b677687..8a59c3001339 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -317,8 +317,8 @@ &qspi {
 	nor_flash: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
-		cdns,read-delay = <5>;
-		spi-max-frequency = <12000000>;
+		cdns,read-delay = <2>;
+		spi-max-frequency = <100000000>;
 		cdns,tshsl-ns = <1>;
 		cdns,tsd2d-ns = <1>;
 		cdns,tchsh-ns = <1>;
-- 
2.47.2

