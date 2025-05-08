Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FA315748F;
	Thu,  8 May 2025 08:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746691402; cv=none; b=a4RkKpRnH5BBpc+d3bDaAp+iLed7n0swlX/HgBvXu4OS5xMADfvQsoKNlG4e3+gqNOwuaRBHH9OCGHNBro1xAnrkINnugndJFtwL+fc73q9T81Gx0IqX1NhxyElGymO3Te4cPh8CLV58e8LdDKr/NmsL8fxbAdVuk3FSDNX0pEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746691402; c=relaxed/simple;
	bh=GQNLb2VdeLymYHoIB35Mr/oeulXdUxcFGm3o+sGKWKo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GYLN8V79kDlw5vz1yhMKrlSm25Ghkw4ilp69EwjekyTrOQ5Nxe/XiWfor/xaSQvuQITFZcVLF8hhj2QOCrKr9W7WgUhYqnKDLR/TziMP5G9zVuwVs9M4ihGNE5e623f21BlbB2JIwpWdsjeIcyCRoVRk9MbWTTKmAfVcdYKQgzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [119.122.215.106])
	by smtp.qiye.163.com (Hmail) with ESMTP id 145c271ec;
	Thu, 8 May 2025 16:03:07 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: lkp@intel.com
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dsimic@manjaro.org,
	heiko@sntech.de,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: rk3568: Move PCIe3 MSI to use GIC ITS
Date: Thu,  8 May 2025 16:02:00 +0800
Message-Id: <20250508080200.13940-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202503221203.7E0Oa0zG-lkp@intel.com>
References: <202503221203.7E0Oa0zG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHh8eVk8ZH0lCQx1NSh1JH1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVKS01ZV1kWGg8SFR0UWUFZT0tIVUpLSEpMTElVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a96aeeb71cc03a2kunm145c271ec
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ORg6IRw5GTIDAQ9ONBRIASIQ
	A04KCypVSlVKTE9NTUJKSENDTE9JVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpOVUpLTVlXWQgBWUFKSUNJNwY+

Hi,

> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on rockchip/for-next]
> [also build test ERROR on linus/master v6.14-rc7]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]

commit f15be3d4a0a5 ("arm64: dts: rockchip: rk356x: Add MSI controller node")
is already included in rockchip/for-next. Do I need to resend this patch?

Thanks,
Chukun

--
2.25.1

