Received: from mail-m49217.qiye.163.com (mail-m49217.qiye.163.com [45.254.49.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DCE149C69;
	Sat,  8 Feb 2025 02:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738980203; cv=none; b=VbnMLDIGbzrCkJ+Hbh0NAr+D+b3UU8OtMBaaAEobEeiJr7wgXpF7YHvbDZGHPY7aSfEWjZ5pJwwWH7+6gtP6NO05D3jE5eS2JcRwXbOPyiZE2DIvGoz61MWgZxPNlTboNanQJMUJ5W8fFwXSR0jXZYd4B+TTT53VSf/a10wBS10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738980203; c=relaxed/simple;
	bh=1zas1vnFMWfYN7wvGgIPeMuhnd3iQ7S0p8Da7SngJb8=;
	h=From:To:Cc:Subject:Date:Message-Id; b=uwRYQbm0k3VAO2WOQf/v5mTQ5vmoL2Zswr1Bv5kiwK2xmVHgKeZ3WteWBeN0IXUWoC/oWF6j/T2YwXTznUp3lxaETl4I2kS96HdhbwfgRIkEMmTllTbnNPlWl1SSISJzyM4RdBkZESYZdoZV6Z26+zCEMH61zS2XK3P7NC9wmh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=g+H12rE3; arc=none smtp.client-ip=45.254.49.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="g+H12rE3"
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id a75a6bca;
	Sat, 8 Feb 2025 09:58:02 +0800 (GMT+08:00)
From: Elaine Zhang <zhangqing@rock-chips.com>
To: jonas@kwiboo.se,
	kever.yang@rock-chips.com,
	zhangqing@rock-chips.com,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	huangtao@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/2] clk: rockchip: Fixed some incorrect commits
Date: Sat,  8 Feb 2025 09:57:55 +0800
Message-Id: <20250208015757.27594-1-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR5MSVZKQ0hNS0wZQkIYGE5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a94e347355903a3kunma75a6bca
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mwg6EAw6GjIRHgNKLRAeGT9K
	KEoaCTFVSlVKTEhDQkxCQ0NITktKVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQU5CSTcG
DKIM-Signature:a=rsa-sha256;
	b=g+H12rE3+HQu9boZikHJ4Z8fdR6vk/HoP1NJAscUPEdzCCMjnwvg6+k4EXCuUWlnC04YjkOnt0LMIP0mnXIVqr4UTteTBUEQ6ms985XwfmS9NVtFMpXp6DXbXb3L5c5hfhRXmOeOSxUijlkadfRJlOrWZ1f+wEEBjcDX7gZYxbw=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=dn9pDYsyJbkr20no7u/zLYqyL2QO1cYzwcIcxkc3Gn4=;
	h=date:mime-version:subject:message-id:from;
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Change in V3:
[PATCH v3 0/2]: As discussed in the email, assigned-clock-parents in DT.
[PATCH v3 1/2]: Merge patches into one. 

Change in V2:
[PATCH v2 0/3]: NO change
[PATCH v2 1/3]: Update commit message
[PATCH v2 2/3]: Update commit message

Elaine Zhang (2):
  ARM: dts: rockchip: assigned-clock-parents to SCLK_HDMI_PHY for
    DCLK_VOP
  arm64: dts: rockchip: Increase VOP clk rate on RK3328

 arch/arm/boot/dts/rockchip/rk322x.dtsi   |  2 ++
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 10 ++++++----
 2 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.17.1

