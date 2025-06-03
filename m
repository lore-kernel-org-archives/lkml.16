Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA11F1A3172;
	Tue,  3 Jun 2025 17:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748970087; cv=none; b=NWqEZReUcb0lXAv3ToRVyy5o2RVM4mlD6UgdMABIIFUH2+6qMJ/OkMerDCCAmWWff8AD54le229jwK3KE24dhkYnzt7CkoY6pkXeMUt1QVr8Bk0UaWa16XBcBFR0adkeq6Pejo7HHHRqjB1zoRo4EIVtUzQch275khr0i2lHiHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748970087; c=relaxed/simple;
	bh=xZhFB3XJBfhELsJB6mdjiA7QVyCbILi3vpU1pgDpkPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XDL9IbN1qeCfX5jarCNuQCtQFCxORFh/2sjX6afjJq5S7QdnmjwZkJ8baV1H/oHgDSxGO2APl2avaasK3To0GwyCN56MMKOAjEJd/5zWoo25juvESgZuI7ojIdUrZZpe8Kq2/pMfETD97Axqlp/xS1HztMIGOXmHcNr+HrwesRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiC2gxPF; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiC2gxPF"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so65103295e9.1;
        Tue, 03 Jun 2025 10:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748970084; x=1749574884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GzatrJm2k4pmx/p4YJ36TGmLlfwt6dnfGgitEvcbd6c=;
        b=eiC2gxPFIwZeAFXbIXF1A1IssIn3ES3L2CGeBnCUN+NYS93Gr4c1mO6M4EIXtnPiL9
         zfXQXPg/NyCGQrSq8WZEK/2uiFL9o5wM5YXDOkb++5mavUxdQnLPNE1dAFFhvldsPJTe
         mgc2QIe3tvqM+myx0pA+/J04uwuUA3KXLhnY21t7pnZm3xIMKAGrEQveakpvO740w7cc
         40I087N6oDrkoqzsNif9g6NKzw1F6N4zXEgl90J/7feE9z/nG73Paol7GgnSJ0X8es3l
         xsIdKPMa/w9DZeizJ0YDdNUJQlA/DFb6FAW4mPYkaUBDs+e+3oINjyA4mf06/5YMyAI9
         TWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748970084; x=1749574884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GzatrJm2k4pmx/p4YJ36TGmLlfwt6dnfGgitEvcbd6c=;
        b=nMmgLVmV/HOIFX2B277x/+f5LmiPQlWfHRl3PKxkFHXJ10wIWHgFzn7QE6dpSOsePx
         TCBlpPnCwA9URRBuvpqoJKaancD1cZOm3xJJobVPpjtBK4YH3BwZ+Y4QhaIhM3dDV8KU
         ngl51fsqWVNI2Pp+kqCgzrSjzXWPAbKf/jDqhDAPH5uDBori/7RH/GdFWlvdpOqTt4Py
         PjsRDwZcaczNWRqmw/GaqdXQCd20JNBsd+ziM6S74cYfWD3uXYTp7hEb6Pp44tqtHyYP
         D+4GA+uT4eBWZA6tYgDiKmwNuRQpPjrf5RzFUFTiF7wbXcKDXQJmXAJ5S1J4GQcfacoF
         ybuA==
X-Forwarded-Encrypted: i=1; AJvYcCUVE4AklJdOMPdkmMblB0hmFi15YcnedLvhQc+7TvOv909+pST+l3P5ijSb9SeIpEGyb4/rJ7F2Emrz7lI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yye3YUW7MRlWKOEu9LwwGnwsZBTKJdmDp187nKhG34ABRTzxWzT
	p+9DIZqueaS8cK1BCKN+3vDNNxKPTust0bn+LzThz0Nm03CYaFXn3gP2dFFHPHkpJ8ZmMw==
X-Gm-Gg: ASbGncsPKCNTlrmWVP6avXiPzugIzrEY3PfQl4aRAIIETSr7RnknElpJ3d602woMCgj
	8OPETTzgNbdI4LCMQqtrDaJb4rCb3uXMjR+OO8I1SE8MiSI538YYZXd2NwZBc7hmpKb07eGELwt
	EHvaZUP6sBQJDJ9aUo/TCD5StXCJS0DsT1fbt5ZQrOsDU2mKmhp7Cnd5DUsAcmRsa2kVgZ1vHoZ
	k3IIw6cBpOZRAMpmYsgaE7VPqve2Fs7FzBrVl7wa+qpJgE79bqSli3JKDjqH51IQJ1vyzz6RrUl
	rK2C1sVNlTPvbksPBszWpTnOvK6Wm3+pEYSU1kCfia5AWvzCXB9VIAKGOfwfDi+qmjnk52CIwoV
	9yav+baSMUs3Jn06XUwRPvjOLIw==
X-Google-Smtp-Source: AGHT+IHoEUws7FMt1scFj0EhElYUfsczF2B30ANfKF4ODg60bbqP09s/Jx2WbI/R6GtA8zVRkMvZMQ==
X-Received: by 2002:a05:6000:4023:b0:3a4:edce:b2a6 with SMTP id ffacd0b85a97d-3a4f7aafdd0mr15909828f8f.53.1748970083324;
        Tue, 03 Jun 2025 10:01:23 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-92-99-174-93.alshamil.net.ae. [92.99.174.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b92bsm18574640f8f.9.2025.06.03.10.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:01:22 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 03 Jun 2025 21:01:13 +0400
Subject: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM
 Sige5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-sige5-updates-v1-1-717e8ce4ab77@gmail.com>
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
In-Reply-To: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748970076; l=1299;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=xZhFB3XJBfhELsJB6mdjiA7QVyCbILi3vpU1pgDpkPM=;
 b=+jI/3w0CBL9qHET5CqgpBOnomcQ5HATFqZswRhmf11d/FRSkfKI/SAfIFQJLB5P6wblGRB2zD
 YGS/bF5InOqAgXoiAg1/z69FxkSk5skk2djVuCfvWW/lrvw4TM4ZQxb
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

List both CPU supply regulators which drive the little and big CPU
clusters, respectively, so that cpufreq can pick them up.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index b09e789c75c47fec7cf7e9810ab0dcca32d9404a..d9c129be55a0d997e04e6d677cdc98fb50353418 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -207,6 +207,22 @@ vcc_3v3_ufs_s0: regulator-vcc-ufs-s0 {
 	};
 };
 
+&cpu_b0 {
+	cpu-supply = <&vdd_cpu_big_s0>;
+};
+
+&cpu_b1 {
+	cpu-supply = <&vdd_cpu_big_s0>;
+};
+
+&cpu_b2 {
+	cpu-supply = <&vdd_cpu_big_s0>;
+};
+
+&cpu_b3 {
+	cpu-supply = <&vdd_cpu_big_s0>;
+};
+
 &combphy0_ps {
 	status = "okay";
 };
@@ -215,6 +231,18 @@ &cpu_l0 {
 	cpu-supply = <&vdd_cpu_lit_s0>;
 };
 
+&cpu_l1 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l2 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l3 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
 &gmac0 {
 	phy-mode = "rgmii-id";
 	clock_in_out = "output";

-- 
2.49.0

