Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F5322C190;
	Sat, 19 Apr 2025 12:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745064856; cv=none; b=gJBFgdCc7InTUpMYMYh2bAe1TPY2kzXwO2lr/b+AJSS208pslOhJ/3XBANkGWRHGfRZzLNb2RKZLwNn4zAwNDnPDH2yY2RI0yMzQ2bSgtgn4KyNyr5knWfYolPcwR+5exb7ThB6hkVBZSzkYxeWbR/Lsmy6lPUS9m8BXiPVNnU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745064856; c=relaxed/simple;
	bh=nriaQ9Zzx+KJlvmVnMMvquNXemLAsvNiY/36A4ElpDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bMz+gJhsbwBlVMpAth7p6yFnzXB6ACLerIcwiyv7HeecRXJvqAoxcBlCKJQTedtjevQedDBu27W8X6IveY002eeIHu+zrrYqWvDRFhebL8HT4Sdc00uxAZUjl0oefSs1uQIOgsAvbwceodPT8OrFBM7oi818TnE1l30m/RGdYH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Y3UdCjWJ; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Y3UdCjWJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=teQTK
	m+rcwhjm2Bk78ja69kS52/A0csVlkW7wMTfnQk=; b=Y3UdCjWJuUtFsvrK9Xzqt
	3mC2KAPycB6Q6QJDc/4J/C+4sP48dQARc/BT5UEk9nfoc5s5K3OyKP9l2IaxuTQP
	jKCQALgS8zWumbX+3Oo7UwoE/WUA8ERysK3mRmFBzmL0JzlOA3Ybwnh/OA0S2Jvx
	6HlTwx8GfJbvW79qnCVZJg=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wBn3XtnkwNoWWZ+BA--.31074S2;
	Sat, 19 Apr 2025 20:13:31 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	inux-rockchip@lists.infradead.org,
	Andy Yan <andyshrk@163.com>
Subject: [PATCH 1/3] arm64: dts: rockchip: Rename hdmi-con to hdmi0-con for Cool Pi CM5 EVB
Date: Sat, 19 Apr 2025 20:13:16 +0800
Message-ID: <20250419121326.388298-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBn3XtnkwNoWWZ+BA--.31074S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xryrur1fKF18KrW5KrWrGrg_yoWkGwcEya
	4Ig3WrCF4fAFyDu3srJa15Gwn2g39I9F1xKFyYqF1xAF98A39rJF45tan2qwnrCF4a9F4f
	AwsrAF1fAw1jkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_g4ftUUUUU==
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0h80XmgDkx0IOgAAsw

There are two hdmi connector on Cool Pi CM5 EVB, the current supported
is hdmi0, assign corresponding index to it. It will be convenient for
us to add support for another one.

Signed-off-by: Andy Yan <andyshrk@163.com>
---

 arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
index 86744c53801f2..3beeb0616455e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
@@ -23,12 +23,12 @@ backlight: backlight {
 		pwms = <&pwm2 0 25000 0>;
 	};
 
-	hdmi-con {
+	hdmi0-con {
 		compatible = "hdmi-connector";
 		type = "a";
 
 		port {
-			hdmi_con_in: endpoint {
+			hdmi0_con_in: endpoint {
 				remote-endpoint = <&hdmi0_out_con>;
 			};
 		};
@@ -129,7 +129,7 @@ hdmi0_in_vp0: endpoint {
 
 &hdmi0_out {
 	hdmi0_out_con: endpoint {
-		remote-endpoint = <&hdmi_con_in>;
+		remote-endpoint = <&hdmi0_con_in>;
 	};
 };
 
-- 
2.43.0

