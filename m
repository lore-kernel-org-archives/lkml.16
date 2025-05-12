Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C22B255E39;
	Mon, 12 May 2025 07:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747033226; cv=none; b=Vmep4TxwArO8aTHqVwCfG+zLmV4TwAfScGCwlB95E8BPi4CyZXGBklBn75Wg4yGBD7t+AZ5Wii0VNWGKg0OE/M6avusmgz+hCN5pGxKNFicdx7lRR5OzMknQj9vMnpfj4gswlsJ1nNpe0EC+fULnwvCTIguvhCZ/3SI+7sS001U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747033226; c=relaxed/simple;
	bh=/8mUMEKY+320EmFxybGlI+uJJOEXNwZXDzQvFhzS7co=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W/UJ5eyxhVlzJhvmG0AI4Fzka36n3A2HODE0NzRFh0RKExYT8bNyAw6/JHSXbSwrLa5MgOV2nnAxFUzasm/+I1E+DyIXts9ODnAkUQaFNqVBiHtIAXlYYNtMbW/b1DSWcYZY7fQZolw7B8AccuJ1z1iKyLmgzPsTcdh/VgLki7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c03:9b0:a65:40ce:ae50:9398])
	by smtp.qiye.163.com (Hmail) with ESMTP id 14b61caf7;
	Mon, 12 May 2025 15:00:11 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: didi.debian@cknow.org
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dsimic@manjaro.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 0/1] arm64: dts: rockchip: rk3568: Move PCIe3 MSI to use GIC ITS
Date: Mon, 12 May 2025 15:00:09 +0800
Message-Id: <20250512070009.336989-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <D9RSA5K547DD.1LYPIZZM4XALS@cknow.org>
References: <D9RSA5K547DD.1LYPIZZM4XALS@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTRkfVkJLHkJCGB4YHk0fH1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtIQUIZS0EaTU5BT0sYHkEaHk5LQUJIQkNZV1kWGg8SFR
	0UWUFZT0tIVUpLSEpOTE5VSktLVUpCS0tZBg++
X-HM-Tid: 0a96c34b42d603a2kunm14b61caf7
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MRg6Tzo5IjJMCU8#OApPLBhL
	HykKCRBVSlVKTE9MS0hISUpJQ05PVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0hBQhlLQRpNTkFPSxgeQRoeTktBQkhCQ1lXWQgBWUFJSENJNwY+

Hi,

> > With this patch I get the following kernel warnings:
> >
> > pci 0001:10:00.0: Primary bus is hard wired to 0
> > pci 0002:20:00.0: Primary bus is hard wired to 0
> >
> > If I 'unapply' this patch, I don't see those warnings.

> I was pretty sure I had seen those messages before, but couldn't find
> them before. But now I have: on my rk3588-rock-5b.

Thanks for the reminder, I didn't notice this before.
The BSP kernel also has this warning.

Before this patch:
[    2.997725] pci_bus 0001:01: busn_res: can not insert [bus 01-ff] under [bus 00-0f] (conflicts with (null) [bus 00-0f])
[    3.009990] pci 0001:00:00.0: BAR 6: assigned [mem 0xf2200000-0xf220ffff pref]
[    3.018100] pci 0001:00:00.0: PCI bridge to [bus 01-ff]
...
[    3.401416] pci_bus 0002:01: busn_res: can not insert [bus 01-ff] under [bus 00-0f] (conflicts with (null) [bus 00-0f])
...
[    3.545459] pci 0002:00:00.0: PCI bridge to [bus 01-ff]

After this patch:
[    3.037779] pci 0001:10:00.0: Primary bus is hard wired to 0
[    3.044120] pci 0001:10:00.0: bridge configuration invalid ([bus 01-ff]), reconfiguring
[    3.053362] pci_bus 0001:11: busn_res: [bus 11-1f] end is updated to 11
[    3.068920] pci 0001:10:00.0: PCI bridge to [bus 11]
...
[    3.451429] pci 0002:20:00.0: Primary bus is hard wired to 0
[    3.457793] pci 0002:20:00.0: bridge configuration invalid ([bus 01-ff]), reconfiguring
...
[    3.535794] pci_bus 0002:21: busn_res: [bus 21-2f] end is updated to 21
...
[    3.612893] pci 0002:20:00.0: PCI bridge to [bus 21]

Looks like a harmless warning.

Thanks,
Chukun

--
2.25.1

