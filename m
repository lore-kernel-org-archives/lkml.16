Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DE7248F72;
	Fri,  2 May 2025 12:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746189807; cv=none; b=Up0D92swr0ZA6tqMPsK3HK029SUHvjcfk102avLqOpMrxx5hX75nWPreUXYTF5EDzNFs1e+K6nskDeEV9FYllbxwrABLEgd66ZEa4hx+FiDgPqD+aUQ6uiqL3XFIjFjg1gS4MkINzj8UkHNH0NLgNUtU2qVmqj2cq2V9cF3VoIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746189807; c=relaxed/simple;
	bh=miKYsAgcz+q2XvZ4Cs30fspOBVQgxjgsR9aXuexv4qs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RoZssINvg5avtI/sLJAcdY2o4LAIHRIt8EnBqmid4SqWQaFXVRihl7iy+Rz0sUIyXN2KysIKszzqvtpaAy+0DsZ5bIhskYUdpz9IUkRDakp63iGDdyxFlWdAzErpSBvvpz3grEiv1rejX7/YmJG+k+LWCR5w/R9SxRgsxZa/XJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kiwMpLqN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kiwMpLqN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746189804;
	bh=miKYsAgcz+q2XvZ4Cs30fspOBVQgxjgsR9aXuexv4qs=;
	h=From:Date:Subject:To:Cc:From;
	b=kiwMpLqNuk97bJJM3h4OAExIQos7f7C/MfrlltGlrWZgXq4KxwP/9OayX3xzTGSYA
	 p3FCIG9n+CCE4LYnV2rJnU3sFuDD43RNyJ9mQL3qtJ9+AdL94KgdXJbi1JFWiOIPLZ
	 pGWl7V6+T5+sC6CJ6vltJXy1yIAs/WzmC6gjEynYUHFxh/5sdgyM8T0mbPTlEVcxnv
	 ePbls8y6vG7h7v4AYTNtLKbc9XihGNVCQfcT1GvUyHl9JJLpR7HG/7osrDKBcwZ/Us
	 mnn6NDC5uJe3c3s05+6XFmQ4hnQpeMxIA7jnOKHuDA6BRiXZZm4D5h80oUkkA5iFfD
	 0nbAUak3+JrGg==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5531F17E0649;
	Fri,  2 May 2025 14:43:22 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 02 May 2025 08:42:56 -0400
Subject: [PATCH] arm64: dts: mediatek: mt8395-genio-1200-evk: Disable
 unused backlight
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250502-genio-1200-disable-backlight-lcd1-v1-1-c021d2c9e48e@collabora.com>
X-B4-Tracking: v=1; b=H4sIAM+9FGgC/x3NPQrDMAxA4asEzRVIIl56ldDBP4ojYpxil1IIu
 XtMx29574SuzbTDczqh6de6HXWAHxPEzdesaGkYhMSRI8Gs1Q5kIcJk3YeiGHzci+XtgyUmxsC
 kK80ye8cwOu+mq/3+j+V1XTfUTrmfcwAAAA==
X-Change-ID: 20250502-genio-1200-disable-backlight-lcd1-b10ef0424a51
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2

The builtin panel on the Genio 1200 EVK board uses the backlight_lcm0
node for its backlight. Though the backlight_lcd1 is currently left
enabled, it is unused, and its pwm input, disp_pwm1, is disabled, so it
fails probe. Disable this unused node.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
index dc884e2e95c70309407798e6a51b595e441e6369..be5e5f339e811728e91b1ffec45ada25f9b0208b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
@@ -106,6 +106,7 @@ backlight_lcd1: backlight-lcd1 {
 		brightness-levels = <0 1023>;
 		num-interpolated-steps = <1023>;
 		default-brightness-level = <576>;
+		status = "disabled";
 	};
 
 	can_clk: can-clk {

---
base-commit: 37ff6e9a2ce321b7932d3987701757fb4d87b0e6
change-id: 20250502-genio-1200-disable-backlight-lcd1-b10ef0424a51

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>

