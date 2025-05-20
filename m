Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E936F280019;
	Tue, 20 May 2025 18:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747767048; cv=pass; b=r8pxRsb84EbyVGwZjmlCZDiRr67qYCazSnetgVfsKv/irfXAlx+WJ5pwifrcPZfyPcFM23mYukGv2KkeSpJIrNfjclReiCrXalkJey8lh0Yrmp7bA2AOVneM48yPnofxAU7QQyogVQNuPhTygWFjDuIwww+FZ+/oSg+t/BSHuYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747767048; c=relaxed/simple;
	bh=6OZF0cjy4yhPOXHQQY90kKFYXM8Ee6E952OcJpUWUyo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AGaUfrqLK2+Gt1hAd9Vo+YDlIN4xOYfA+4znevsBc9uLzYy+toMpNILBBro9Vy6G/losTQMqC360DL0CpiCJbR0hPhnlwA7KMAwZs42E3gzbDkjfUTeuSXw8pZJ0MCSsZqqXAc3+fv7FavpUQE8Y0+XRqlN1qpqcG2D0fyrYKcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=P9tEhswE; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="P9tEhswE"
ARC-Seal: i=1; a=rsa-sha256; t=1747767030; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RZHMuFbLYVdXFAdqh7I9mO5z2aF7/PXx1ydnwNwCKLbDTo59Nl/Utqqv93POAcy/vDaTb3q1VMZ3PIJvemVpd2ewerH+A9aZfSpfKXYkT+I7Z17BmIbRx24pk/OhycR+KKF/8xyR6XPcW401zqsExYSXDCq9f/IYrkWA3rQ7SIs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747767030; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aZ7rTiXXLivcGcvKEg3er+WVZop8MAHDSdLfwPnGQgE=; 
	b=VmW635RQoyS2ZqwC8Y35RyBwrecvIWe5dgpWykjY669XmGCMom6tP/Z+pQbI8zxOVEBm+G9jirRyLH/4EiBCL9nLPqp4tgDtn5cvqydZDSUjgxrsxpcwCZlxflD1ReZGe+nHj7Cm4/4LfNDXdJVINqdckCGDhf2xJbJjxVdkPso=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747767030;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=aZ7rTiXXLivcGcvKEg3er+WVZop8MAHDSdLfwPnGQgE=;
	b=P9tEhswExxYVfVE9wxZz0/2jloIk4qigob07HEpG1THWjZ+yqxLNW+SVNz3/M7pz
	VWOhAkMxO/Yd9L68izGwRQuRwFl2WIUnchHIqjE6bl+QNO1XcP3dJvEWb7f0etfrxZI
	+jULTPYbEjaH6piPEuKNe/7ejl8xNoWRxJC9LyGE=
Received: by mx.zohomail.com with SMTPS id 1747767028966420.67137646323636;
	Tue, 20 May 2025 11:50:28 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 20 May 2025 20:50:08 +0200
Subject: [PATCH v2 1/4] dt-bindings: arm: rockchip: add RADXA ROCK 5T
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-add-rock5t-v2-1-1f1971850a20@collabora.com>
References: <20250520-add-rock5t-v2-0-1f1971850a20@collabora.com>
In-Reply-To: <20250520-add-rock5t-v2-0-1f1971850a20@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

The RADXA ROCK 5T is a single board computer aimed at industrial use.
Its design is similar to the ROCK 5B+, but it does away with one of the
USB-C PD inputs, and uses one combination USB3/SATA/PCIe PHY for an
additional second 2.5G PCIe network card instead of USB3.

Link: https://radxa.com/products/rock5/5t/
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 5772d905f390e53b44f9093d32b869a7e0655db6..e97da6df420331b2c402f84ce06d325c71964ed1 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -961,6 +961,11 @@ properties:
           - const: radxa,rock-s0
           - const: rockchip,rk3308
 
+      - description: Radxa ROCK 5T
+        items:
+          - const: radxa,rock-5t
+          - const: rockchip,rk3588
+
       - description: Radxa ZERO 3W/3E
         items:
           - enum:

-- 
2.49.0

