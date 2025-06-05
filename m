Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC4E2F5B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 08:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749110664; cv=none; b=hbpNDPzdTv9VIoio1vn21zLgn3AqupaFKxOaHdsB9x5e9UEZU+pyLKDplQAev0NIkmimqFdrCPswB5bvglXyxgOo0q6JeArQaC29BrtNvluG62SS/zRAslrLyYHGymKG2qD1NR8ToBLS7hDOBXn7KOvOiu3YRuppNCkPZR+jNC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749110664; c=relaxed/simple;
	bh=LMzH/Bm2279A9lP/xsA0N2uSX2GikuVibB/mft22fs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:In-Reply-To:
	 Content-Type:References; b=sZTrOwwvyy//YXDbh6akdFitJ0cD1ErDApCfjrgjLtX+BVLKKI66ebYZdpGuu6WCEEmr7X3viEiE7hUiOOQ8n4SurL/fyBxFyxByh6lNUK8DuEoVwpFq6H1XmZbHvF+32fSJtTGqki+JIRpXHWd7gpOk9no303peJSftEItT/9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Rvmi3wBo; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Rvmi3wBo"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250605080419euoutp02692f6c38b123bdd1186dc469ef15ca1a~GFuC7rHIs1212512125euoutp02n
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 08:04:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250605080419euoutp02692f6c38b123bdd1186dc469ef15ca1a~GFuC7rHIs1212512125euoutp02n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749110659;
	bh=Zg2vFiDx8CLX/mdtIR7HKEpZZXyINdX/0zaUIkLHpyY=;
	h=Date:Subject:To:From:In-Reply-To:References:From;
	b=Rvmi3wBoxe3CjmYCAbux+kdSq+wRynDdHKPpwYThxDYXTyCzUEzPZQYAvvCtX/UBU
	 oJwQDtYGpF+so6MhP3ncSa6ttez12mLTS3/KQw5TcByFphEYqr+vn5I1ythhFDBMOY
	 RpDP+gcCW4zJRDbScdmV7zBbJB/wXvVwyMMcjXvY=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250605080419eucas1p2a3ceb2a6638ecf161295ac365bdeb33f~GFuCyHZaS1597115971eucas1p2N;
	Thu,  5 Jun 2025 08:04:19 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250605080419eusmtip29b6aea360f101e67bba3f51bc79273e7~GFuCZpf261330113301eusmtip2Z;
	Thu,  5 Jun 2025 08:04:19 +0000 (GMT)
Message-ID: <2793e943-0297-47cd-bb65-b680a308a700@samsung.com>
Date: Thu, 5 Jun 2025 10:04:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: defconfig: Enable TH1520 aon, mbox and reset
 support
To: Drew Fustini <drew@pdp7.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20250605071940.348873-3-drew@pdp7.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250605080419eucas1p2a3ceb2a6638ecf161295ac365bdeb33f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250605073400eucas1p181cb06c580c775a0205881cd1b54cc6e
X-EPHeader: CA
X-CMS-RootMailID: 20250605073400eucas1p181cb06c580c775a0205881cd1b54cc6e
References: <CGME20250605073400eucas1p181cb06c580c775a0205881cd1b54cc6e@eucas1p1.samsung.com>
	<20250605071940.348873-3-drew@pdp7.com>



On 6/5/25 09:17, Drew Fustini wrote:
> Enable TH1520 Always-On (AON) firmware protocol, TH1520 Mailbox and
> TH1520 reset controller.
> 
> Signed-off-by: Drew Fustini <drew@pdp7.com>
> ---
>  arch/riscv/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index fe8bd8afb418..86b13177f27b 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -178,6 +178,7 @@ CONFIG_REGULATOR=y
>  CONFIG_REGULATOR_FIXED_VOLTAGE=y
>  CONFIG_REGULATOR_AXP20X=y
>  CONFIG_REGULATOR_GPIO=y
> +CONFIG_RESET_TH1520=m
>  CONFIG_MEDIA_SUPPORT=m
>  CONFIG_MEDIA_PLATFORM_SUPPORT=y
>  CONFIG_VIDEO_CADENCE_CSI2RX=m
> @@ -258,7 +259,9 @@ CONFIG_RPMSG_CTRL=y
>  CONFIG_RPMSG_VIRTIO=y
>  CONFIG_PM_DEVFREQ=y
>  CONFIG_IIO=y
> +CONFIG_TH1520_AON_PROTOCOL=m
>  CONFIG_THEAD_C900_ACLINT_SSWI=y
> +CONFIG_THEAD_TH1520_MBOX=m
>  CONFIG_PHY_SUN4I_USB=m
>  CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
>  CONFIG_PHY_STARFIVE_JH7110_PCIE=m

Thanks !
Reviewed-by: Michal Wilczynski <m.wilczynski@samsung.com>

