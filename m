Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD16218E99;
	Mon,  7 Jul 2025 09:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751879290; cv=none; b=Mv7bwoiNlFEPZZnXqzKAtg+R4Ka/mmQMW0A2rqFRhPoIVeWQaZazt0+e7POgWhyGakuSWMys+Q3+KJMFUGi6yMehEAx+L1OvAXlQ5VpBjLmq6lsZuEHpa1lPHF23PwofPj/Ggwg3H506Jv8jdvGJvAdxPT7uh0bvcktqQEt0uJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751879290; c=relaxed/simple;
	bh=UFYXKaMLVyriQemDuJE4SUe2kDsvSWIBgnTajNtVXp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Stp1jPDykRw7NEI2FDhWIaKKL4U9i3QP0HU2L8FI49ghUElvVhMVxHwlZzl8sTGgLvOvfK0GE/EcLJl+xxqrISKoaa6hpKpdT+D+M4FtP3DnWIStgYivijXZ1niuNdaO39u5fPdQ1fIWzn+iy/Bhjyy1VK53ZMe6al0CisLmXIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=AurRTncD; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="AurRTncD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=4MOiwSNMYf6g66eBoNmB+RtKMVO+a3roUbWBwjk9v4w=;
	b=AurRTncD139Z5haFbm6bjf2iTepE3+2gT+0dSgaDAowVz86yfCCT24uLKZjKc4
	3lLJ7PUl1z8UMDd+CS/c4FtSixbJpSGvmb6cITZJkMv1683sRUxSW7vHwTVJVHl8
	8fRPhtNOjjQFnQ4o3HIya3M+UYyEH2Okb8PQarksV/BL0=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDXL3s7jmtoDg89AA--.26376S3;
	Mon, 07 Jul 2025 17:07:09 +0800 (CST)
Date: Mon, 7 Jul 2025 17:07:07 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@karo-electronics.de>
Subject: Re: [PATCH v2] ARM: dts: imx6-karo: Replace license text comment
 with SPDX identifier
Message-ID: <aGuOO36kkTWtM2yy@dragon>
References: <20250703-karo-dts-lic-v2-1-329f4c55913e@prolan.hu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703-karo-dts-lic-v2-1-329f4c55913e@prolan.hu>
X-CM-TRANSID:M88vCgDXL3s7jmtoDg89AA--.26376S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JryDAF1rtF47GF45GF1rWFg_yoW3ZrXE93
	y0gw1DAw13KF4I9rWfCF1avasrKFWjvF17XwsYvFy7AF98GrZ8WFnYqrn0vrn5GayfJrnr
	CFy5X347CwnrujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb9NVDUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNB2nDWhrjj0DhwAA33

On Thu, Jul 03, 2025 at 11:09:24AM +0200, Bence CsÛk·s wrote:
> Replace verbatim license text with a `SPDX-License-Identifier`
> 
> The comment header mis-attributes this license to be "X11", but the
> license text does not include the last line "Except as contained in this
> notice, the name of the X Consortium shall not be used in advertising or
> otherwise to promote the sale, use or other dealings in this Software
> without prior written authorization from the X Consortium.". Therefore,
> this license is actually equivalent to the SPDX "MIT" license (confirmed
> by text diffing).
> 
> Cc: Lothar Waﬂmann <LW@KARO-electronics.de>
> Acked-By: Lothar Waﬂmann <LW@KARO-electronics.de>
> Signed-off-by: Bence CsÛk·s <csokas.bence@prolan.hu>

Applied this v2 instead, thanks!

