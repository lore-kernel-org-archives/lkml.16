Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D8428DF2C;
	Fri,  9 May 2025 09:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746784722; cv=none; b=oBPqU7rDGkV4D+sNBVbx6tej67k/cigGJGDQJt353Tgav8sZwfMrnH8fPlwLbLk6qk8cz8ROdc2Cpl0O97t17aX6K26H7kc0WHaiceEonxbWs73V0kyZSAkUHgcSJzgNH4o3I4s+x9qqsOm4iL46zlko3yD8uUZN7U7Tv2Ih93k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746784722; c=relaxed/simple;
	bh=/1nUlecFxPkXb5UBTWdjvjhl+OV1lK0qu0WlzJbESDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9drcw/lO5ymqjvII0RjeA4bWeDUb2q8+SPXci8U7OY/t7uZmV2olb/7+DJQeGNnELUHFuSjIrqkTTrkc4AgArdrVgO8Kpe2blDEEemVNnX6fpj/YQzaMjaOEGog1Rjzl9IB8275h6isQDr6zG7bK8N52ld7O9aecb11sVYvtY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=AA6tle6T; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="AA6tle6T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ztpen9DuNRABAlryqI4gdvEyhar1spaRR9YZP2KvAT4=;
	b=AA6tle6TmM7PdJ4gi8I9yRrcBcdwBcfjsw+8LLrbPNdMruSNojxEqqbLzyrZHS
	In63wY6UU9QQENgkE8pG+WDACIZiOUlg1EMVCfDSJUkGVcXafB4L/F1mwqi4Y7Ul
	0AAtRIzN4Eowa/wGUvyGf/Z4+2zsvNFYYpl7maGgPYNh4=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBHD_Fg0R1o046lAA--.20888S3;
	Fri, 09 May 2025 17:56:50 +0800 (CST)
Date: Fri, 9 May 2025 17:56:48 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp: use 800MHz NoC OPP for nominal drive
 mode
Message-ID: <aB3RYMONiB4RQdjk@dragon>
References: <20250422-imx8m-nominal-noc-v1-1-889592ff65a5@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422-imx8m-nominal-noc-v1-1-889592ff65a5@pengutronix.de>
X-CM-TRANSID:M88vCgBHD_Fg0R1o046lAA--.20888S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrCF1fGr45uF4DZw1UXw4kCrg_yoWxXrc_ur
	W8WwnrAw1kWr17u34qk3y5Za4fWw4UCF1SgasxXan2qFyfXrZ3Z3s7X3s5XF1UGrWjqwsr
	AF1DXw48JFy2kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbzVbPUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiARxIZWgduGdhEQAAsq

On Tue, Apr 22, 2025 at 09:12:35AM +0200, Ahmad Fatoum wrote:
> When running in nominal drive mode, the maximum allowed frequency for
> the NoC is 800MHz, but the OPP table for the i.MX8MP interconnect device
> listed the 1GHz operating point for the NoC, regardless of the active
> mode.
> 
> The newly introduced imx8mp-nominal.dtsi header reconfigures the clock
> controller to observe nominal drive mode limits, so have it modify the
> maximum NoC OPP as well.
> 
> Fixes: 255fbd9eabe7 ("arm64: dts: imx8mp: Add optional nominal drive mode DTSI")
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Applied, thanks!

