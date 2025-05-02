Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733956EB79;
	Fri,  2 May 2025 10:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746181899; cv=none; b=NDy4Ap+BwAY1XrSYYOSjho3jk8MwOZqSaN9LhOhLtA14U9EsQJOUgTSu6kr54/G7xrnUqF6m6RD9jg3bsnpOqEi15UT5+VNHv4Jya7n0EPiwI405eTLMdrN90cS+vQW65IQ2N1Fdh29yoO7HU3BpMe8a/xkn5Pd8LuSjOnqIpXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746181899; c=relaxed/simple;
	bh=4R/V+WDBlUWjaD4BRPN42KnrSEsFCMSdx2YVwe6OCjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KRBi5cuKFXDaeutPlAGi+zWcl0y6isrs5ZlIFfSq4M5f14/91+z3/DFyobjUHlSI8Xd7Uo6Xx1zhHZPQjJTIbWKesQ2SdPDPOoN3IqhlPHF/2Xd0p5ykBdACQtCjUAq3OnizT4Ma0Wt1plIXT5/C1FwLpUCCdirvBLoBuDvloaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Received: from hay.lan. (unknown [IPv6:2605:59c0:20f3:a400:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 7CFCFB4C23FD;
	Fri,  2 May 2025 12:31:30 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	E Shattow <e@freeshell.de>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v3 2/4] riscv: dts: starfive: jh7110-common: qspi flash setting read-delay 2 cycles max 100MHz
Date: Fri,  2 May 2025 03:30:42 -0700
Message-ID: <20250502103101.957016-3-e@freeshell.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502103101.957016-1-e@freeshell.de>
References: <20250502103101.957016-1-e@freeshell.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use qspi flash read-delay and spi-max-frequency settings compatible with
U-Boot bootloader.

Observations from testing on Pine64 Star64 hardware within U-Boot bootloader
and read-delay=2 are spi-max-frequency less than 49.8MHz fails to write,
corrupt data writes at 25MHz to 49.799999MHz, and valid data writes at
49.8MHz to 100MHz (not tested above 100MHz). No valid spi-max-frequency
was found for 1<read-delay<=3 and corrupt data with read-delay=3.

Looking around the Linux codebase it is common to see read-delay 2 cycles
with spi-max-frequency 100MHz and testing confirms this to work in both
U-Boot and Linux.

Signed-off-by: E Shattow <e@freeshell.de>
Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index f1489e9bb83e..5c525686c043 100644
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
2.49.0

