Received: from mail-m32110.qiye.163.com (mail-m32110.qiye.163.com [220.197.32.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DE5282FA
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 13:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738761305; cv=none; b=moSQ3MmjWozU+D3kpr0BwT+9Wy9Csjbui/nGTDdLI1AociRS5brxfou542Xnt0FMW4js0Ncber/Q/S8aN2GIkugu8vIIBht+VArM9PZJkBCtzffNNZnxGHozijH8+X2c0HjxKRyg73cHBbrmpCIs8qxCIZ9Qt7NFIAhe88/xF3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738761305; c=relaxed/simple;
	bh=nOg7TjfRkPMPdlgIO+t3QILCrQUjs6iWyYU4gbZheQA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D3ITQxede9F8R7kP08nWuDgYLcIg28l0Q2oN0ZeaGGeOnKKhV8ZY8mIwHnPG3uObQ+VNbXK3o0bzguHxiVmMnzFpABwAWPVaWTlQxTPPMlV6IfFILteqsvtwopS8itU/JO5dpihJ0EZRNCm6zxQ2j/7YS9lrVOxjn5pXKhkdU4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=RomRGpG+; arc=none smtp.client-ip=220.197.32.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="RomRGpG+"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id a3bebb86;
	Wed, 5 Feb 2025 18:52:37 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	heiko@sntech.de
Cc: dmitry.baryshkov@linaro.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v7 0/4] Add eDP mode support for Rockchip Samsung HDPTX PHY
Date: Wed,  5 Feb 2025 18:51:53 +0800
Message-Id: <20250205105157.580060-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUMaS1YdT0waSktMQktNHU9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a94d5bd8d9303a3kunma3bebb86
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PjY6MDo6OTIcGgooKU0wGVEw
	VjBPFENVSlVKTEhDTE5JTE5DSUNKVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFOQ043Bg++
DKIM-Signature:a=rsa-sha256;
	b=RomRGpG+LCJxroNoekk7sxsYuibHOPkb/0htR/AggEX+9cB9Ymz94sHmCVn8R0btf1BHhrPFZVKi1UWFzDExpV15V/dtguD6WzsNRwXOOSy/CDTJP2d2JBdUStYswJgN/GDjM7CNcuKKsjVIqQRT1v0qPJBDulFRtTLMmYlM/Rc=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=L+vOatpZt2GVGYajNHMkGxcUV73J/Px0Fed6/vB10gw=;
	h=date:mime-version:subject:message-id:from;

Picked from:
https://patchwork.kernel.org/project/linux-rockchip/list/?series=927102

Damon Ding (4):
  phy: phy-rockchip-samsung-hdptx: Swap the definitions of LCPLL_REF and
    ROPLL_REF
  phy: phy-rockchip-samsung-hdptx: Supplement some register names with
    their full version
  phy: phy-rockchip-samsung-hdptx: Add the '_MASK' suffix to all
    registers
  phy: phy-rockchip-samsung-hdptx: Add eDP mode support for RK3588

 .../phy/rockchip/phy-rockchip-samsung-hdptx.c | 971 +++++++++++++++++-
 1 file changed, 915 insertions(+), 56 deletions(-)

-- 
2.34.1

