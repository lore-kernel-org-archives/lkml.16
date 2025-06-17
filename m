Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3326342A99;
	Tue, 17 Jun 2025 05:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750137729; cv=none; b=OwtRpqC3bS8sfHaZJAxb7N6MdFaDrR2ZeQuJZ1Jk3ZWLoM4ZeGGj1ApjMF470dFt9EjD/AvOXh0OHDL++spjoiznHpgtpk6hraRMWKrspUCd1OhPfIF9oqw9Igrd/FZyy5u0CFd0wVJWys62A56xBUnCD4WBuvYvsfxelD4CDI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750137729; c=relaxed/simple;
	bh=cRnTftsQUjF6W+K/7/X6ySP9QjlBwNHRD1tSe1u4PtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rxlR2Kn5BNL8SfBJYmn8x2x5XWAuM1LARU/W9xhKWBVs+QHBTetwvBTimA90SW5hEWofCl+Q1FHBvs4e5o4Sjzy5b45HQLytrTQUX+k4pokA4zrCxe7dkXHJMoj9q47CJw76CJrG1XJDIgcEdpiFyOjl1vHYsffxHSeXmE0ySWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [127.0.0.2] (unknown [210.73.43.2])
	by APP-01 (Coremail) with SMTP id qwCowAAXjNpn+1Bo4TccBw--.27922S2;
	Tue, 17 Jun 2025 13:21:44 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Tue, 17 Jun 2025 13:21:02 +0800
Subject: [PATCH RFC] riscv: dts: spacemit: Add DMA translation buses for K1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-k1-dma-buses-rfc-wip-v1-1-c8ec192fbf58@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAD37UGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0Mz3WxD3ZTcRN2k0uLUYt2itGTd8swCXeOkVPNEA8M0E/NkCyWg1oK
 i1LTMCrCx0UpBbs5KsbW1APFqdbdrAAAA
X-Change-ID: 20250616-k1-dma-buses-rfc-wip-3be7a01f47c8
To: Yixun Lan <dlan@gentoo.org>, Guodong Xu <guodong@riscstar.com>, 
 Ze Huang <huangze@whut.edu.cn>, spacemit@lists.linux.dev
Cc: Vivian Wang <uwu@dram.page>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-CM-TRANSID:qwCowAAXjNpn+1Bo4TccBw--.27922S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAFy3AFy3Xr4ktFyfKFyDJrb_yoWrCrWrpr
	WDAFs5KrWkJr17AwsxZrW2q3W8Ja1vkFWkGr1DGry5ArnYqF4Utr4Ut343WFyUJr1xXwnI
	qFsrAr1kKF1DA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9K14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GrWl42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUYku4DUUUU
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

The SpacemiT K1 has various static translations of DMA accesses. Add
these as simple-bus nodes. Devices actually using these translation will
be added in later patches.

The bus names are assigned according to consensus with SpacemiT [1].

[1] https://lore.kernel.org/all/CAH1PCMaC+imcMZCFYtRdmH6ge=dPgnANn_GqVfsGRS=+YhyJCw@mail.gmail.com/

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
This is my concrete proposal for representing DMA translations for
SpacemiT K1.

For context, memory on the SpacemiT K1 is split into two chunks:

- 0x0000_0000 to 0x8000_0000: First 2 GiB of memory
- 0x1_0000_0000 above: Rest of memory

DMA-capable devices on the K1 all have access to the lower 2G of memory
through an identity mapping. However, for the upper region of memory,
each device falls under one of six different mappings. The mappings are
provided in this patch as simple-bus nodes that device nodes should be
added to.

This patch is an RFC because it is not meant to be applied, or at least,
not certainly meant to be applied. Instead, this is an attempt to come
to a consensus on how these bus nodes should look like.

More specifically, I propose that the process proceeds as follows:

- Firstly, relevant parties agree on these bus nodes given here.
- After that, each time the first user of a bus appears, the series
  should include a patch to add the bus required for that driver.
- If a driver being submitted uses the same bus as another one that has
  been submitted but hasn't yet landed, it can depend on the bus patch
  from that previous series.

For conventions regarding coding style, I propose that:

- #address-cells and #size-cells are 2 for consistency
- These bus nodes are put at the end of /soc, inside /soc
- These bus nodes are sorted alphabetically, not in vendor's order
- Devices are added into *-bus nodes directly, not appended towards the
  end with a label reference
 
The K1 DMA translations are *not* interconnects, since they do not
provide any configuration capabilities.

These bus nodes names and properties are provided compliant with
"simple-bus" bindings, and should pass "make dtbs_check".

Remaining questions:

- Should storage-bus exist? Or should drivers under it simply specify
  32-bit DMA?
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 53 ++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index c0f8c5fca975d73b6ea6886da13fcf55289cb16c..efefed21b9fa1ab9c6ac3d24cd0cca8958b85184 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -562,5 +562,58 @@ sec_uart1: serial@f0612000 {
 			reg-io-width = <4>;
 			status = "reserved"; /* for TEE usage */
 		};
+
+		camera-bus {
+			compatible = "simple-bus";
+			ranges;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
+				     <0x0 0x80000000 0x1 0x00000000 0x1 0x80000000>;
+		};
+
+		dma-bus {
+			compatible = "simple-bus";
+			ranges;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
+				     <0x1 0x00000000 0x1 0x80000000 0x3 0x00000000>;
+		};
+
+		multimedia-bus {
+			compatible = "simple-bus";
+			ranges;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
+				     <0x0 0x80000000 0x1 0x00000000 0x3 0x80000000>;
+		};
+
+		network-bus {
+			compatible = "simple-bus";
+			ranges;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
+				     <0x0 0x80000000 0x1 0x00000000 0x0 0x80000000>;
+		};
+
+		pcie-bus {
+			compatible = "simple-bus";
+			ranges;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
+				     <0x0 0xb8000000 0x1 0x38000000 0x3 0x48000000>;
+		};
+
+		storage-bus {
+			compatible = "simple-bus";
+			ranges;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
+		};
 	};
 };

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250616-k1-dma-buses-rfc-wip-3be7a01f47c8

Best regards,
-- 
Vivian "dramforever" Wang

