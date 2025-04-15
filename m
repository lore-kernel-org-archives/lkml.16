Received: from mail-m32109.qiye.163.com (mail-m32109.qiye.163.com [220.197.32.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F884297A43;
	Tue, 15 Apr 2025 10:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744714050; cv=none; b=TK1rcb1Lb0fYBJi/i4oY6htymemZ766Oof3yordgrdFhnxvoU6bKMBkYJQrNSuTIUtS9DcC8c7s91KEmPOz4Xlx+SLTLNRvQOepCPEf3X9UUpPyBtqTjccMfcpTFcg2wCIAVrVNelsAgX6iqyvYUF6cc7yccyBzBH9cTg6/JMxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744714050; c=relaxed/simple;
	bh=aaQUjMGk42jHXjNNVpVtEuV975jxk1/5cvsq42UaQMM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u2yp+dP69WvFTtJj7Z9ulspTlw1YvFbIZwaJ1yXaq4VF7o6BFCb2NeXf5Xp9a7AJAlOE4/m5QspQG3nyFNulU4FAvnVfWoQLqLkRh3DXfvDFvCAjZUoAmmTcZ8SaUr5xy2oM83USdz4VrhWww3cfS2q93QUP3p5Z8kCqc8z6+Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=gN8ATPk/; arc=none smtp.client-ip=220.197.32.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="gN8ATPk/"
Received: from localhost.localdomain (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11f2f6006;
	Tue, 15 Apr 2025 18:32:05 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/3] rockchip,otp: Add support for rk3562 and rk3568
Date: Tue, 15 Apr 2025 18:32:00 +0800
Message-Id: <20250415103203.82972-1-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCS05LVh1MQhlNTE9OQ01KHVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a9639018e8903afkunm11f2f6006
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mk06ETo*CzJPChgwFBgfIh0a
	KgkKCUNVSlVKTE9PTEpISklMS09IVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQUpNQk43Bg++
DKIM-Signature:a=rsa-sha256;
	b=gN8ATPk/Qk7NuJZSb99RyAosTa0SNhsPLVPDO94KcjR0p67UdnUyCcw5Um9Fqb/ifZjh0wuVLrfTv8PF/mtZpFC+OcHh5GeVtjnstvopOHtdSx2RFvbz7ZkEs5R53swR9diw6dFjV6FpD+SNdgh73OM7kSEmDNi3qLDqvYijvGw=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Z8C3TOj5YRTsNIZ01Pq49wCWG7FBy3BSOQXn7JlMxQ8=;
	h=date:mime-version:subject:message-id:from;


Rockchip rk3562 and rk3568 has the same otp controller, which is
different with those already support in the driver, add support for it.

This patch set depends on Jonas's change[1].

[1] https://lore.kernel.org/r/20250316191900.1858944-1-jonas@kwiboo.se

Changes in v3:
- update the clock name from "usr" to "otp" and re-order to sync with
 other soc.
- rebase on rk3576 and rk3528, changes suggest by Jonas
- Use rk3568 data structure for rk3562

Changes in v2:
- Update the commit message and add maxItems in schema.

Finley Xiao (2):
  nvmem: rockchip-otp: Add support for rk3568-otp
  nvmem: rockchip-otp: Add support for rk3562

Kever Yang (1):
  dt-bindings: nvmem: rockchip,otp: Add support for rk3562 and rk3568

 .../bindings/nvmem/rockchip,otp.yaml          | 53 ++++++++++++--
 drivers/nvmem/rockchip-otp.c                  | 73 +++++++++++++++++++
 2 files changed, 119 insertions(+), 7 deletions(-)

-- 
2.25.1

