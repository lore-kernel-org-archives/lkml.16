Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E397442C;
	Fri, 16 May 2025 07:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747378888; cv=none; b=LUXcJAJz4TUvGoTXPKvMk72ZxTt7+fgcabV+QYU9en1Dw9U99F3PMf1cm+3kUor6wovAdSY1GONkRWKr+lIKseNfY9qVIxjUt++EKesiFDeO3OV1NOgQ7AcGpl1MqWU8hBpsFf6trulm3apdOChc5pYTaewqGKx4C2UWk0FgMzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747378888; c=relaxed/simple;
	bh=1N5jwTXEg+BGFZFpJAscn66ihhhPz8zD1yN3bMEpZaY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dNNRymFPZ8/hBeKUAV/aon13VNOSTmsB4QVwcKCNgsdTsWj2nznSjCWXuAafAU9le0MbBLwJLQqklxnaRq7wrf8ADtFaZwU+MhR27ChmGaTocywhkjqp6V8E+s0wtKIgjU8Rn7gwslS2dNRQdIIn8JtLS1Gc8GM8g+t/jNHBNTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [119.122.215.244])
	by smtp.qiye.163.com (Hmail) with ESMTP id 15416c95d;
	Fri, 16 May 2025 15:01:13 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: kever.yang@rock-chips.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	finley.xiao@rock-chips.com,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH v7 4/5] arm64: dts: rockchip: add core dtsi for RK3562 SoC
Date: Fri, 16 May 2025 15:01:06 +0800
Message-Id: <20250516070106.653870-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250509102308.761424-5-kever.yang@rock-chips.com>
References: <20250509102308.761424-5-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTR5NVh5KSh5DSkpOS09CTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKTlVJT09ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSEJVSktLVU
	pCS0tZBg++
X-HM-Tid: 0a96d7e5a5d103a2kunm15416c95d
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NRg6Pio5LTE9PjYhLzMYOgxL
	Tk5PChFVSlVKTE9MSExDQ0xPTUhIVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpOVUlPT1lXWQgBWUFJS0pJNwY+

Hi,

I posted to the wrong thread before, so I resent this.
Sorry for the noise.

> <snip>
> +		pcie2x1: pcie@ff500000 {
> +			compatible = "rockchip,rk3562-pcie", "rockchip,rk3568-pcie";
> +			bus-range = <0x0 0xff>;
> <snip>
> +			interrupt-names = "sys", "pmc", "msg", "legacy", "err", "msi";

I noticed that the bsp 5.10 kernel said that pcie only has 8 MSI vectors,
[1][2] but in the bsp 6.1 kernel it changed to 32 MSI vectors [3].

The rockchip documentation also says there are only 8 MSI vectors:

[4] Page37 8.8 "RK3528/RK3562/RK3576可分配的MSI或者MSI-X总数是8个"
Translate into English: "The total number of MSI or MSI-X that
can be allocated by RK3528/RK3562/RK3576 is 8"

We noticed this when supporting rk3528, so which one is correct?

[1] https://github.com/rockchip-linux/kernel/commit/4f0c9ccc79c373aa97084b3b1ab0651ca4248227
[2] https://github.com/rockchip-linux/kernel/commit/afb85c759cfadc4051c42a9703860071a9877f2e
[3] https://github.com/coolpi-george/coolpi-kernel/commit/522b94122ec797760dcd466851250cbdfafff50f
[4] https://github.com/ArmSoM/rk3506-rkr4.2-sdk/blob/main/docs/cn/Common/PCIe/Rockchip_Developer_Guide_PCIe_CN.pdf

Thanks,
Chukun

--
2.25.1

