Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0441C6FF2;
	Mon, 12 May 2025 12:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747052123; cv=none; b=FzX6i5Is+01/GGhWLnPhFpNoDgHN+suWD51U2LeamHDAdIctnjWbJoDaKQRMaz9O8dIHZTdSOOy0cl0y485WDnvLXCN047fBjYwVWUOjgjEnEkPkrjD+UcL+/6sE3Xjd4FDxpB6Hhl4tE+EbZT4Q7uYHdrZEJJifV91WRis4k2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747052123; c=relaxed/simple;
	bh=AYku5jN+0OmBk98j9JNh57LME0Csb8yr4YA+DR9zGzA=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=dtsrDeYIli7Vsm3krPJUO7w4MkB8TZIdl2p9LKmAUI/gIr47xFneBIqxMrGW/4R0Y5rDrJoSda/dqhO0gIcw/iC8Dg8qZxsB62xO4+U2oPJwJhHQANsPqadRwMmTdgxxC+AEuKZvJ/6dY0wTJ1Cjn9nO/IpOrrmDRK1tYOkkJm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=PApiyJZR; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="PApiyJZR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1747051808;
	bh=XiZXeriwtNmD0C5rumTsjv/pcxn0w65lxRr71QDYu34=;
	h=From:To:Cc:Subject:Date;
	b=PApiyJZRB8CZCN9ZHGCu5twt/oV7dpXe2osv3wXCXaAmg0etAW/ny7KtAkVDy+uvw
	 DSrPyFCQ+LVF8QmChApI8vxEFFXLbCN133lead5wVo6PoXGNB6Vnm1cnTfUnd3176F
	 G7kHDmISKxOep04LzrDLmHfvwT4FE9r8/2HkDkZI=
Received: from localhost.localdomain ([116.249.112.84])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id EEBE0F2; Mon, 12 May 2025 20:03:46 +0800
X-QQ-mid: xmsmtpt1747051426tikm1o32c
Message-ID: <tencent_198C6C928AA0BA4E932560238E0CFE073109@qq.com>
X-QQ-XMAILINFO: NEW4AM7T0EBsyYRwy7F7xKNKE1tnYRdimiWvJz02wiuzbc88/Xz92wEqnUEoHa
	 nIY6Ml9xgBjxjzxhhUdxFN7WCcXupbz+XRQpb7ndOCxVymXXJCIbRxj327K6hdVmFgzhRVCdDAkU
	 0QI0Np7STwTCSSgwveSGyq2MlOn9IC2omOFI6yk4CiqMBdUCHTMdaSV1S65Qk7X1J61MVrqFzqs3
	 Z7rnB0RDahifL9Az9ffD0ss79ar04QQoE70VWKT5CerDeVBxZhUqv6jTRs1gZZMwejXOWcLWx6sg
	 k+n1v0fWNwXwnW/2zXUK6UIQQpzwMipLYRelYDwBikFm+UfaePgwAmSbmRf5HEqYVxhUTQXCwksZ
	 CXN8b7OuDU92wMJl0lIHvq69FLSS6+2Q4MGqp/N14YW2dTv5rXDVLrY0u7Bn674VyCUy7XN4Nslj
	 3pEVQpyunv5+MvtPSwN/YhU3cFRSXVf6rczJ08UMrxqkpVvsmj9CkL1Uf9sQSQybzKOc+1b6gp3B
	 gDpjLTZ9GhMT8A4zLO2OaUcB4PNH2IFmOcrNNgdVYaLZkVDhDP8PNUGDF7bpelQ/B5eojg/Qw22S
	 0J3j1PkUPzSk+Az6qz/Q1+iAwGooXy57mK4NiLof+20NxiROMu4pCs2Q59afTtQbU+/gmjLperVu
	 l1JQIzPb0hZarYDCJOgJbrdyqmNO8xH879VkygZJb2jpEqSTnpodwuAm4tgLAL9/8CE3BV0eEHx2
	 ta/V+7qBJ/DezSLCCf49r/LAs+bAYKgP1RYN4T+V6bLHzpWzXE51ZLsp/WTK23MNpbVmaMZAhu1W
	 1Y56yqzzeGlCoz5yQ4UP7P1JjZqzeaBtwn885tHjdukuz9TVYdygd5SD+r+IAS78chJbnD0TeToJ
	 dFNsJ5f9KKg1dOhZRFiLWiS47P4+cACDrzX5fzSR02VdFmeQH6AIwROJlXJ5qZ66oj8fkdrZj4me
	 gVz+KgFVgOIe1ZGfCT+TSgttlYgxvZfNTOo9nbO/x2/Qh3aH5bt8DPf0d3pHsVKNE7X0ynjvPvQu
	 2zDwWqxAUMlU6aUrmJ3ebUEP3Mz1l7y4OfE1CyP4QXm/1A79utCHUwFpyXSCzIn+Ir1FU3YvKlBQ
	 n3T9cR
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: chainsx@foxmail.com
To: Fred Bloggs <f.blogs@napier.co.nz>
Cc: Hsun Lai <chainsx@foxmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v1 0/2] Add support for Firefly Station-M3/ROC-RK3588S-PC
Date: Mon, 12 May 2025 20:03:36 +0800
X-OQ-MSGID: <20250512120338.312496-1-chainsx@foxmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hsun Lai <chainsx@foxmail.com>

This series add support for Firefly Station-M3/ROC-RK3588S-PC.

Info of device can be found at:
https://wiki.t-firefly.com/en/Station-M3/index.html

Changes in v1:
- Add support for Firefly ROC-RK3588S-PC

Hsun Lai (2):
  dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
  arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3588s-roc-pc.dts      | 911 ++++++++++++++++++
 3 files changed, 917 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts

-- 
2.34.1

