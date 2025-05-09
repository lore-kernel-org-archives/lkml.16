Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2128023A6;
	Fri,  9 May 2025 14:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746802216; cv=none; b=I6J/MMPNvgT86pXdsas9Mccyub9vGMlSWiQ/Ixp1aK7A+jRcqaSn+ScRnQeCpdc99U236yXhLJSOInx2HhzpD/ZbRJtx7rZC2/MCBhsgMJQ8Lyo7fUCgYW7jlXa9Y+2KgPqsB5qcmzJbBzWFcrsnaobZrniSfbkpetfvtV72nb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746802216; c=relaxed/simple;
	bh=aFiukFtu4i+F/1eg7Cg9rkmZ16PPBLIO7y7QaxznsV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2gbdEYI8SKiLpAE14B63ErGTjVSSvQVn/RDpjU2QUqAcLUilI6GUFc2UsWujEEha6kBfU7V3g8dyM1QYpKBOOLyIEF5IG+JPjgmgIrdoufu+feVdCE14+gMwUbpsegQGA3JcMeLHEgEc/hmDzz1G4Dx9ogTUKvz5hw+kmfyhxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=nlZ1ey9r; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="nlZ1ey9r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=8W4x/SOfsK5KukV+9m2Wm8bOWGZZSROVtNjLW9SKw4k=;
	b=nlZ1ey9rhYWL6MQoeMZvKJ82l7lMwUfcl4SMECr6vhmuhYlzbO0cjPQ09gA1JP
	StjMYyYrWNnXXMOBviGbhJsMasN1x2YBCDSMHJE4Y3kn5dFBsv9MoqWXLSwLoqX+
	85821j/DVP1Ck5AwgZjnFKG2lqZjeIwkYwbQEWpGmegGU=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBnL_HwFR5oMpOoAA--.26367S3;
	Fri, 09 May 2025 22:49:21 +0800 (CST)
Date: Fri, 9 May 2025 22:49:19 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: shawnguo@kernel.org, tarang.raval@siliconsignals.io,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: imx8mp-var-som: Fix LDO5 shutdown causing
 SD card timeout
Message-ID: <aB4V76XU9Cyl48pl@dragon>
References: <20250505055828.4160-1-himanshu.bhavani@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505055828.4160-1-himanshu.bhavani@siliconsignals.io>
X-CM-TRANSID:M88vCgBnL_HwFR5oMpOoAA--.26367S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7WryUKw4kJw48Ww47trW8WFg_yoW3Xrb_Wa
	18tanru3y3Ar9avr1rt3WxKrWSqw4qv3W7J3yUWrWqyFy2vay5JwsI93yrAw4rt39xtF1q
	q343Xw4UWF1a9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjOVy7UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAQVIZWgd+-h1qQABsC

On Mon, May 05, 2025 at 11:28:27AM +0530, Himanshu Bhavani wrote:
> Fix SD card timeout issue caused by LDO5 regulator getting disabled
> after boot.
> 
> The kernel log shows LDO5 being disabled, which leads to a timeout
> on USDHC2:
> [   33.760561] LDO5: disabling
> [   81.119861] mmc1: Timeout waiting for hardware interrupt.
> 
> To prevent this, set regulator-boot-on and regulator-always-on for
> LDO5. Also add the vqmmc regulator to properly support 1.8V/3.3V
> signaling for USDHC2 using a GPIO-controlled regulator.
> 
> Fixes: 6c2a1f4f71258 ("arm64: dts: imx8mp-var-som-symphony: Add Variscite Symphony board and VAR-SOM-MX8MP SoM")
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>

Applied, thanks!

