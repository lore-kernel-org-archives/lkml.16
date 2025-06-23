Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F6D23BD0F;
	Mon, 23 Jun 2025 10:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750673088; cv=none; b=ESGm7539JSKzNxSr4DGmmglPOPK2UHK3LbrXjQgwk2f372H4w9IdI+0oBLV/EiEufBfCm6OTGK43wp9AfGoLddf+GlFUe/U0D9eZlrJ3KzS6RpTrPfolG5jgadkKqzBBIwmUvSSeGiQdaOIAwY5ZKZ2CIaabXdrCzu/kAW5jSCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750673088; c=relaxed/simple;
	bh=bXmCnr9T6aBc3USTUb76kIZUoHlN7k9TMoPzlD9mi3c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cBWJr3xkTHtaJNhyLx96twHfNAHAOyO7txDEquZL1EmaEzon9JU309gK1ysgPIx/OvT6x16BdFBDkP7hWAXXHGHCR93SSWNq4A3DnuRjwamvlJezskSumhZLz9NMnfS66JHMKE6j0YEg6zxqYpILIA90wRAt4MZSxpTnFJV2l00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [127.0.0.2] (unknown [210.73.43.2])
	by APP-01 (Coremail) with SMTP id qwCowAD3ptWtJlloxg+rCA--.29805S5;
	Mon, 23 Jun 2025 18:04:30 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Mon, 23 Jun 2025 18:04:18 +0800
Subject: [PATCH 3/3] riscv: dts: spacemit: Move eMMC under storage-bus for
 K1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-k1-dma-buses-rfc-wip-v1-3-c0144082061f@iscas.ac.cn>
References: <20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn>
In-Reply-To: <20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn>
To: Yixun Lan <dlan@gentoo.org>, Guodong Xu <guodong@riscstar.com>, 
 Ze Huang <huangze@whut.edu.cn>, Alex Elder <elder@riscstar.com>, 
 spacemit@lists.linux.dev, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Vivian Wang <uwu@dram.page>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-CM-TRANSID:qwCowAD3ptWtJlloxg+rCA--.29805S5
X-Coremail-Antispam: 1UD129KBjvJXoW7tw48Ar48Xw1ruF18Ar1kXwb_yoW8XryUp3
	9rCrZ3CrWIvF4Fkw4aqrZrWr4kGFZYkFs5Jw1DCryrJws8XFWjqr48Jw1fJFyUXryfA3sF
	gF1kXr1UKr1UAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r106r15McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK67AK6r4DMxAIw28IcxkI7VAKI48JMxC2
	0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
	0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
	14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUUXdbUUUUU
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

SDHCI devices in Spacemit K1 use storage-bus translations. Move the node
emmc under storage-bus to reflect this fact.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 0d41694699851e672a833601b62c2b2ad3daae79..2d40360994d87edfbdaefc364ae706712022ba09 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -403,15 +403,6 @@ pll: clock-controller@d4090000 {
 			#clock-cells = <1>;
 		};
 
-		emmc: mmc@d4281000 {
-			compatible = "spacemit,k1-sdhci";
-			reg = <0x0 0xd4281000 0x0 0x200>;
-			clocks = <&syscon_apmu CLK_SDH_AXI>, <&syscon_apmu CLK_SDH2>;
-			clock-names = "core", "io";
-			interrupts = <101>;
-			status = "disabled";
-		};
-
 		syscon_apmu: system-controller@d4282800 {
 			compatible = "spacemit,k1-syscon-apmu";
 			reg = <0x0 0xd4282800 0x0 0x400>;
@@ -633,6 +624,16 @@ storage-bus {
 			#address-cells = <2>;
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
+
+			emmc: mmc@d4281000 {
+				compatible = "spacemit,k1-sdhci";
+				reg = <0x0 0xd4281000 0x0 0x200>;
+				clocks = <&syscon_apmu CLK_SDH_AXI>,
+					 <&syscon_apmu CLK_SDH2>;
+				clock-names = "core", "io";
+				interrupts = <101>;
+				status = "disabled";
+			};
 		};
 	};
 };

-- 
2.49.0

