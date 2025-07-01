Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4900925FA29;
	Tue,  1 Jul 2025 08:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751357825; cv=none; b=gYm/e3WbtANCLCRo4V8Zd6aCSGrwp9dtOsw3d9IoYEk2Q57+Xrss2DN3KyYkvmA4TPWn7HDYYOZOcP+pB/Eh8h+QQp6Hz+IxuidpYfZyX3qwdYjfPLL2G4Lkp7bgoFuS614n2RX++r64+nQIyJ4478Qk4QVH1S46brpPEQRkpS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751357825; c=relaxed/simple;
	bh=TOL2X9im/y9spEcMCpYD89jPvVrX4Y7g4or3AMsmH0c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=j+djC9r5vzlNp4SI7Mb7B3KrYdQJygRdfTjT0Oq1TsOtDDW9bf49xwDUp07LxubbTZtybMMVPY9MnePBYnEqf5B7dOnC9hrt7QEaiySrQb/JmKWu5Qy905El0UE2IuRtT6q8vvvH7J0A82wpLd0bjZR/tr/hOCYhGCDvAwH7UnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=BWm8ZG3m; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="BWm8ZG3m"
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id AA5611F8F7;
	Tue,  1 Jul 2025 10:16:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1751357813;
	bh=egH8dl43nAY1tV9JJ+xwdkgzAbvvOZ1BwKT3m3Erp24=; h=From:To:Subject;
	b=BWm8ZG3mr2YJaTJ3Nwd0dnFoF2mHEWu/QtTzMKuQFza0MOPWwbc4win3l9EMORyac
	 vpwp2QbsteZnQrRn/AnvjUKKJvElaceyMiZNpG9YjmKp7xcLyiPJlYINhNfUM8mofg
	 BrQZ6h+tI9YeBFe45ivpzxzRxev6YzmqZKqsvnV4+rKjMhJRmFXXBpzdCnk7hrOPlt
	 ZdobBw1pYng4KC3/PzjpDqCSUgRPj9cQ3eKVQDY/Gyz0IS2VwwoiJZeutMZZcAtFku
	 QLs6jforESiRk00UiHyk+wwuztc6W0w6o+lAm2qwU/zazx9Hgbtc0istIe/UwsS2IL
	 /0f9R/czBT3fw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: ti: k3-am62p-verdin: add SD_1 CD pull-up
Date: Tue,  1 Jul 2025 10:16:43 +0200
Message-Id: <20250701081643.71406-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add internal pull-up to the SD_1 card detect signal, without this the CD
signal is floating and spurious detects events can happen.

Fixes: 87f95ea316ac ("arm64: dts: ti: Add Toradex Verdin AM62P")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index d90d13287076..85c001aef7e3 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -433,7 +433,7 @@ AM62PX_IOPAD(0x01b8, PIN_OUTPUT, 7) /* (E20) SPI0_CS1.GPIO1_16 */ /* SODIMM 19 *
 	/* Verdin SD_1_CD# */
 	pinctrl_sd1_cd: main-gpio1-48-default-pins {
 		pinctrl-single,pins = <
-			AM62PX_IOPAD(0x0240, PIN_INPUT, 7) /* (D23) MMC1_SDCD.GPIO1_48 */ /* SODIMM 84 */
+			AM62PX_IOPAD(0x0240, PIN_INPUT_PULLUP, 7) /* (D23) MMC1_SDCD.GPIO1_48 */ /* SODIMM 84 */
 		>;
 	};
 
-- 
2.39.5

