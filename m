Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EE41A3178;
	Mon, 28 Apr 2025 07:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745825914; cv=none; b=QeQFi9v+uonKPJ+L+Ccgx6GRi8J2MzOFk45Yfs2epsDrG4HRA/k7p4nK3YmKMypwCfjavNrnXJfocl9h6PZ/4X7IJATi/5HWPwVq4u3VZpD/NcHCrKU2PtRkl+BHwBDOkmeknx+wU+uW/U2GDsbExO58WfXfvZ+67eKBODQz5k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745825914; c=relaxed/simple;
	bh=Xoz688GosEvH/cH2tKOpL/P96ikpFzwOy40NGEpmPj0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kseM1F7207EL7JtJsxV5gMnUfCPJfHHvraO2Ozx9fdkaVzsfRcXtFUrib8s34PI7fXExAgqJFh+gU3j3+MGv5r7yidq673IXTzw5nJHpPTm3yDQWTgJ1SUGAjG0PRMWsuyKyvEAxXeCuFm9klCv4Bwn7P2OLEKT4GFXCDLgIQAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-4-entmail-virt151.gy.ntes [27.18.99.221])
	by smtp.qiye.163.com (Hmail) with ESMTP id 135f5a5ac;
	Mon, 28 Apr 2025 15:38:17 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Subject: [PATCH 0/2] Add SpacemiT K1 USB3.0 host controller support
Date: Mon, 28 Apr 2025 15:38:10 +0800
Message-Id: <20250428-b4-k1-dwc3-v2-v1-0-7cb061abd619@whut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGIwD2gC/3WOTU+DQBCG/wrZs0vYDzZI1IA1xoNiJenBmqZZl
 pFuykfdRaQ2/e+ucDReJnkm87zvnJAFo8Gi2DshA4O2umsdkAsPqZ1sK8C6dIxoQMOA0wgXHO8
 JLr8UwwPFIbmEiEtSUFUg5xwMvOtxynvbzGzg49PF9vMSFdICVl3T6D72BuGTEBtFft0GrJVTY
 exdzX1EEBbywF0JGnFM8A6ONbTymPCS+p2pbv4TI8KdSHwqAiZ45FSoSzCJ0VbZXhrfvfBXXqS
 L/LAv1yINxuc8f7lts2x5r7KHio2P1yu2HVMFy0beZWy7fn36tjJNGqlrv5rmlLk5n38AU/IvQ
 lYBAAA=
X-Change-ID: 20250428-b4-k1-dwc3-v2-519e84a1b2cb
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huangze@whut.edu.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745825898; l=3098;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=Xoz688GosEvH/cH2tKOpL/P96ikpFzwOy40NGEpmPj0=;
 b=8MMhjAex2KAUzW/ISYn7XtMeCGzs2LM18w8pHYrHurFCLFaF34nu+c03QZLw71T/hYll5IFAr
 2IBfL8HZym3DjlfKKUVZSDQ43/6tFqIC22XsMxCbROOO3Bl7cPh+quQ
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGBkaVk9ITRoeGRgdS0pIT1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVJSUpZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVUpCS0
	tZBg++
X-HM-Tid: 0a967b551e6203a1kunm135f5a5ac
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PRw6SSo*DDJLFTVMNSEpAU0S
	PjYKFDZVSlVKTE9OQ0lOQktITUNLVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVJSUpZV1kIAVlBT0NISTcG

This patchset adds initial support for the USB 3.0 Dual-Role Device (DRD)
controller[1] found in the SpacemiT K1 SoC. The controller is based on Synopsys
DesignWare Core USB 3 (DWC3) IP, which already has mainline driver support.

The DWC3 controller on SpacemiT K1 supports both Host and Device modes for
USB 3.0 and USB 2.0, including High-Speed, Full-Speed, and Low-Speed operations.

The PHY interfaces required for the K1 USB subsystem, PIPE3 (for USB 3.0)
and UTMI+ (for USB 2.0) have already been supported in a previous patchset[2].

This patchset is based on 6.15-rc1. Tested on BananaPi and Jupiter board.

Link: https://developer.spacemit.com/documentation?token=AjHDwrW78igAAEkiHracBI9HnTb [1]
Link: https://lore.kernel.org/linux-riscv/20250418-b4-k1-usb3-phy-v2-v2-0-b69e02da84eb@whut.edu.cn [2]

Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
Changes in v2:
- dt-bindings:
  - add missing 'maxItems'
  - remove 'status' property in exmaple
  - fold dwc3 node into parent
- drop dwc3 glue driver and use snps,dwc3 driver directly
- rename dts nodes and reorder properties to fit coding style

---
Ze Huang (2):
      dt-bindings: usb: dwc3: add support for SpacemiT K1
      riscv: dts: spacemit: add usb3.0 support for K1

 .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  | 95 ++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    | 52 ++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 56 +++++++++++++
 3 files changed, 203 insertions(+)
---
base-commit: 64e9fdfc89a76fed38d8ddeed72d42ec71957ed9
change-id: 20250428-b4-k1-dwc3-v2-519e84a1b2cb
prerequisite-message-id: <20250416135406.16284-1-heylenay@4d2.org>
prerequisite-patch-id: 19b7f061557b184b9565e10ccfc0aab5754dfa73
prerequisite-patch-id: a56183c8b71a141ca6f5d401b67a5456f40d4a9c
prerequisite-patch-id: a4a3c44d4c3e44f5209bff2b2bd0b49cd5a9eebe
prerequisite-patch-id: 471fe02daa5297e85e9cee8dfef873375a348e9f
prerequisite-patch-id: 717bc3d50f0924f7697312cb78280b15a029ce2c
prerequisite-patch-id: 585a2a9ce37a5e2a036f7351ff8ff4ed859bbe3e
prerequisite-message-id: <20250418145401.2603648-1-elder@riscstar.com>
prerequisite-patch-id: a7769b6451bfd80d5e5366013753c5fc870b2255
prerequisite-patch-id: 8a8d0eefd0b4423d87f3c093b451a0fa60622ec4
prerequisite-patch-id: 30f92f93e5b3577bde61424303f21c709a715ec5
prerequisite-patch-id: d774b8281b5c6a822445365ee94925e1ab6c7a93
prerequisite-patch-id: 54a4f5d065eb9f212fd99efec6e7e06abbb9bad8
prerequisite-patch-id: 93962be60d1b58a98d947edf51b4af9edf513785
prerequisite-patch-id: 5f53f8bf16fb067628092daebc4831293261aa01
prerequisite-message-id: <CACRpkdZ6A0xORRQBnNNPFcNHg3xL=U3_xAcePmaDN3_ZYMzsaA@mail.gmail.com>
prerequisite-patch-id: a5d0181eb076c06b2147fb44a2400706bcad1ee3
prerequisite-patch-id: 59a37da7d2319858de1779e1b60e5362a102cf24
prerequisite-patch-id: a2fbaeda08eabbafcde1c9893dc82eddaef8f1b2
prerequisite-patch-id: f44247679d46a51c242703eca370ce0e3db2e61f
prerequisite-patch-id: 9d4cd8be42a37798815d0aaae21d3c022f815414

Best regards,
-- 
Ze Huang <huangze@whut.edu.cn>

