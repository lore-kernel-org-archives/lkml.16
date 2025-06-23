Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7658F23BF80;
	Mon, 23 Jun 2025 10:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750673087; cv=none; b=sWC5DeOl8L5JpiNN15L6oCoaivDHV1VuScJOcR+xFfyJx3UK3i/CVwIGtxm45t0Urw2rh49SA5Ma8rcIou/r/ppgvkHqaQR2k3zvlHW2aKJL4YI3IgcWZ529jdbAqaCIQ/K/R7Fd454KhrzR9S9ERQvBCJrohXGgRzZ3X7Lzwrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750673087; c=relaxed/simple;
	bh=vipnkNgUoh8epWZYj8+rXAcynGvmE/NRgqg8z9mtprA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fJF09lQ6b0mQuEsog/wD5Lw6kn29+AjmeRga3J7mFpYwuZ0WZ0mi2jHkFzJYb/W3ljXBOYAC+q8MlVO5D88CIpUMnfDMv47JKNyteUEGEAOM18yjzfD6yp+6CaJZiTojBAT9kQxaKbpp3rM7+LFCz5vFiQsKDuieDgHurfObzQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [127.0.0.2] (unknown [210.73.43.2])
	by APP-01 (Coremail) with SMTP id qwCowAD3ptWtJlloxg+rCA--.29805S2;
	Mon, 23 Jun 2025 18:04:30 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Subject: [PATCH 0/3] riscv: dts: spacemit: Add DMA translation buses for K1
Date: Mon, 23 Jun 2025 18:04:15 +0800
Message-Id: <20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ8mWWgC/23PTW6DMBAF4KsgrzsIO/wFVVXuUWVhxmMYVeDUQ
 2irKHevAXXX5RvJ73t+KKHIJKrLHirSysJhTkG/ZApHOw8E7FJWpjBVUesaPjS4yUJ/FxKIHuG
 Lb3DqqbGF9mWDrUpPb5E8f++179eUR5YlxJ9dWfV2/Sts/i9cNWjAllCfje991V5Y0EpuMcdZX
 Z+HEenznhYvB6R6KwQYpomXLlvrPK2NqLc9E4nY/S9d9rrLlTmBMRsubkQ+wJoK65zzTXkuLwP
 NSwh5iMNbAp+/R12YhioBAAA=
X-Change-ID: 20250616-k1-dma-buses-rfc-wip-3be7a01f47c8
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
X-CM-TRANSID:qwCowAD3ptWtJlloxg+rCA--.29805S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr1DWF4UAFyfXFyUWw1ftFb_yoW8Ww1kpF
	WfursxArW3trWIkFs2k3y2vr1rKrsYgF4UWrnrKwn5JFsrZF4qvrWI9r4xCryDXryru342
	vr1vqr1kWF42ywUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9E14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK67AK6r4DMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUUnXo7UUUUU==
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

The SpacemiT K1 has various static translations of DMA accesses. This
series adds all the DMA translation bus nodes and also moves existing
nodes as necessary.

According to SpacemiT DT maintainer Yixun Lan [1], it's preferable from
a SoC DT maintainer's perspective to have this done at once instead of
spreading these changes into various driver series. Once this is merged,
life will be easier for future users of the buses.

This series contains no bindings changes.

Patch 3 moves the eMMC node added in [1].

These patches can also be pulled from:

https://github.com/dramforever/linux/tree/k1/dma-ranges/v1

[1]: https://lore.kernel.org/r/20250623070147-GYA193822@gentoo
[2]: https://lore.kernel.org/r/20250523-22-k1-sdhci-v1-1-6e0adddf7494@gentoo.org

---
Changes since RFC
- Reworded patch messages
- Also moved existing nodes under relevant buses
- Link to RFC: https://lore.kernel.org/r/20250617-k1-dma-buses-rfc-wip-v1-1-c8ec192fbf58@iscas.ac.cn

---
Vivian Wang (3):
      riscv: dts: spacemit: Add DMA translation buses for K1
      riscv: dts: spacemit: Move UARTs under dma-bus for K1
      riscv: dts: spacemit: Move eMMC under storage-bus for K1

 arch/riscv/boot/dts/spacemit/k1.dtsi | 314 +++++++++++++++++++++--------------
 1 file changed, 189 insertions(+), 125 deletions(-)
---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250616-k1-dma-buses-rfc-wip-3be7a01f47c8
prerequisite-message-id: <20250523-22-k1-sdhci-v1-1-6e0adddf7494@gentoo.org>
prerequisite-patch-id: 53fc23b06e26ab0ebb2c52ee09f4b2cffab889e2

Best regards,
-- 
Vivian "dramforever" Wang

