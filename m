Received: from wp725.webpack.hosteurope.de (wp725.webpack.hosteurope.de [80.237.130.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CA226AD9;
	Fri, 11 Apr 2025 14:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744381232; cv=none; b=neD/Gddux5lZOoU3QLgv1TOX/FFvoE0lSqgIrrcKTbNq1xorrXLpGCMBeUiB+4w/6+Uc/0H+rkhPiHwV/1e413hu2HESccyk43tt5CG0Y/Qubj5Jq3M4mPNuUMCt4wE1Rka6Rq3bMBfZDY1AkYO2PosrlyG5OoCMob+/rxAj74g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744381232; c=relaxed/simple;
	bh=vvgbcZDknI5NuRuQtUf87K9ENMUNvdauYZFfVSl+3Jc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CiQqxBAM6eENDH21nCCCmVPKuUSz8A+lYLxBpL6+2mAl2hCznJFJIOJDD0FCmqs5CP6QhmyE5HArGeyODpwEfOJDYW1IIWZAkao2GURtBJFhTGc2YX3BK0rsQXzdQrMTzIKsCB4L5dsD83Ma5cuSKSfT259mGAyqsBCBKNwX700=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fivetechno.de; spf=pass smtp.mailfrom=fivetechno.de; dkim=pass (2048-bit key) header.d=fivetechno.de header.i=@fivetechno.de header.b=jX3dDLhw; arc=none smtp.client-ip=80.237.130.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fivetechno.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fivetechno.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fivetechno.de header.i=@fivetechno.de header.b="jX3dDLhw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fivetechno.de; s=he121032; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:From:Sender:Reply-To:Subject:Date:
	Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=3EN09kEXG7OMqR0uy2B4D2/5Ob0p4yVnh/cBhdXyJbw=; t=1744381230; x=1744813230; 
	b=jX3dDLhwIMGOQtuQWwnYcrnbhChGW7Q/COmuqGlc9BKeF0zURu4SG5oWoAFehD5ASRDOSSZqQQP
	odNjF4KhcfWUz2TGJfLFNqPo5yJ59rS0G7e+rVHdF7EVzRI5XI5G5/FFBK/ks/4nuQHZZI3jzZrzX
	Xstz67ew45rvogLcQg799z54VR/qtlpuvbPSsbVhGdCd+IkJ2oPhczoVR6dMki6CFyyl7/4yaQqpW
	9oABZTF950E6K74RlacMSidSYabYNryTYegLHFL+mbSwLBWder5xyRizZppcdXk9FAl8kxDdo79ig
	gaqBLdsVOTSUminH1rjiGVrWTDZh9L03dakA==;
Received: from p5098d998.dip0.t-ipconnect.de ([80.152.217.152] helo=hermes.fivetechno.de); authenticated
	by wp725.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	id 1u3Exs-001YA2-25;
	Fri, 11 Apr 2025 16:02:40 +0200
X-Virus-Scanned: by amavisd-new 2.12.1 using newest ClamAV at
	linuxbbg.five-lan.de
Received: from roc-pc (p5b125997.dip0.t-ipconnect.de [91.18.89.151])
	(authenticated bits=0)
	by hermes.fivetechno.de (8.15.2/8.15.2/SUSE Linux 0.8) with ESMTPSA id 53BE2dPh013976
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 11 Apr 2025 16:02:39 +0200
From: Markus Reichl <m.reichl@fivetechno.de>
To: linux-rockchip@lists.infradead.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Markus Reichl <m.reichl@fivetechno.de>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Add vcc supply to spi flash on rk3399-roc-pc.
Date: Fri, 11 Apr 2025 16:02:21 +0200
Message-Id: <20250411140223.1069-1-m.reichl@fivetechno.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;m.reichl@fivetechno.de;1744381230;bb283ab1;
X-HE-SMSGID: 1u3Exs-001YA2-25

Add vcc supply to the spi-nor flash chip on rk3399-roc-pc boards
according to the board schematics ROC-3399-PC-V10-A-20180804 to avoid
warnings in dmesg output.

Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
---
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi
index 0393da25cdfb..fc9279627ef6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi
@@ -736,6 +736,7 @@ flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <30000000>;
+		vcc-supply = <&vcc3v3_sys>;
 	};
 };
 
-- 
2.39.5

