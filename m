Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22084267B92;
	Mon, 12 May 2025 12:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747052052; cv=none; b=nqGXayE7Y1N3ji0IrXzNmGOxRECtIwO+7QGSsfyqXCnOOK5aLV4iuVabhsQCRQM7YlbHZ8qwwccHnkLiG9o/tCvQf9wXBdkI3r8uT36axrj+srfMJ/jzeCCYCfrHa0rhQ6ADJBKlp6iWFVlhxnH9nebuXQpYOYR2DoGibYWA4d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747052052; c=relaxed/simple;
	bh=zUXcpTiNwVX79Zx15n1oeoDkLSOX/YrrhzcvuYhRDZs=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=OXfcY7M5Q2CCWQDzB0Q6c0xm+87XOhUA6dty1KxWx+fVWfoCybA4w7r0Xh2+2YBrqKowlbe8WiNfkJOzp81g+cHLH73Irx6YuQT7AaeTpYFTYsARQOcKItf2AugbnhBgvBBI5pgZOqZN+NwnBWSZMxvQD7Sp3EWYS17wtAPCdJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=woIls9se; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="woIls9se"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1747051736;
	bh=7CKmsvauDc0q8NWP+HLO/2UN2L/FIYQsPE5ctif+Wxg=;
	h=From:To:Cc:Subject:Date;
	b=woIls9se4oA0i7RAFYBh/8lHmi+kO68uKGIzRJhl2TjuxebBm32YSVLjuLdE34y8B
	 xq66cuRhI06oAeoontuFsh8Bdy+PS0RgwUi1Rh/uBbJMpM56mIjeyMm5u9J6RJ3X+m
	 JZiREGRsO5phBcLszOWdxweCyCnsv8wqzEhNKSk4=
Received: from localhost.localdomain ([116.249.112.84])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id 2359703F; Mon, 12 May 2025 20:08:53 +0800
X-QQ-mid: xmsmtpt1747051733tj987rezy
Message-ID: <tencent_5236EB88E1BF1243C286A768AC4B24391905@qq.com>
X-QQ-XMAILINFO: MmPNY57tR1XnXYXlfrFDWzpe97pRfIDW0PFyQw7LDr1JC8m5UvghYLPZRLn8OW
	 nJZEo4XDeN1rtphaQmE09D5/UWynH8zQczD0OaC/Tn/rnMIwMrjSaVk+03SYRXdcpaw0X5yWzoGQ
	 Oxs50Zpx4/5B7Hi/HHKeKU8J1VgjO9YL6kSk3wuAZEjNMuckHwTwCEhMSfE4XYeEMn1cgYks9O6o
	 qoB+1ORIkqEHv/pJIOc//xsqHm6nHzhtJxER0rNc7UIxqami6bkny9cYT+gkqN4eJgmRrP6L/9b5
	 9dg8wJW3/rmfuztfAC+Cel+p8lSty7PXlrgC0zMHgFfvwQ3KaudtuCNoFhVS9gmKLekyNo7uDQgC
	 K8w2i9jAvCmhbP0p9mv7plAmW6wetw49aoy+wbYMpR0Vj/o/yKuknhHMQXWzPbUQ8X5f11nzxNRt
	 wF8uZOhrA/wR3t0bu3BN0TNmkwMIWazahDS/OitozRc1nZ6r0fvbAW1eo9phW3iEaaGtOzH5FbTn
	 sm9u6bKyQL4HoSwJXkR5IB54ZofjcldGBi0L9XLN4LiQ2Hm8yB+0LuyBHPkbNxS6HLtgSiJ6CLug
	 DMgSfix6PrgjSaiHx9RiZ2nT5sxzPx4xvuCngvkOAcMdBmh2WobjKlcUX4ZkVlAgk+80eAtXazTA
	 tS38IxV5qX3+3pb1FM7QfbFDpLMG4G20SjVc1MtPROCzgROjmB23PQLif57hQh9oxVwVg+o9DeVk
	 RpEBY+lT7U9wLBYeT+1ENFJRULEFwycGu2qqCrwOmd+x12Tp+1OoBJFQ7aRN8J10nwUTdFO6SlxN
	 RmiTsKgM3OBu/uA4TfNOYUJ+l6ciXSlT/6oq/Ag//SR2mM66qdjgJdwuv+DL8VqyTvOu/LMDc1nu
	 zfGOMBEFu4LShLS7sHSVuIkTc7xJKFuTukWNehJxbOK4878QR0jBesHW/IcmFHZzqMyndknyIheZ
	 tf71rrnHCCZIAzFQ56ScjWiWd/hMPj+krdAR+y6DEv0QUR4DJJfU7qyTwHXVjI1eaXedXTJYyEvF
	 ZgguMeySC/I2bRv7DHZvYsCqOu0mc=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: chainsx@foxmail.com
To: f.blogs@napier.co.nz
Cc: chainsx@foxmail.com,
	conor+dt@kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sfr@canb.auug.org.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v1 1/2] dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
Date: Mon, 12 May 2025 20:08:49 +0800
X-OQ-MSGID: <20250512120849.312547-1-chainsx@foxmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hsun Lai <chainsx@foxmail.com>

This documents Firefly ROC-RK3588S-PC which is a SBC based on RK3588S SoC.

Link: https://wiki.t-firefly.com/en/Station-M3/index.html

Signed-off-by: Hsun Lai <chainsx@foxmail.com>
---

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 455fbb290..13d5dcbc7 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -258,6 +258,11 @@ properties:
           - const: firefly,rk3566-roc-pc
           - const: rockchip,rk3566
 
+      - description: Firefly Station M3
+        items:
+          - const: firefly,rk3588s-roc-pc
+          - const: rockchip,rk3588s
+
       - description: Firefly Station P2
         items:
           - const: firefly,rk3568-roc-pc
-- 
2.34.1

