Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5F77483;
	Fri, 25 Apr 2025 02:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745546890; cv=none; b=knOBZQa+8KYc3mlY70+41fbUvP7EjOZu5thKx1lZ7qLJKSX1X2dXf3jiVryh5AF77Aib+8GVGCmW83L9XmHdZegfuIArooGUCFJc9MAsK92xccKu5YIMHs4y8pJkD0zEZqI5yhe4VGMV7+xD38PGiotDlxW+Zu+OaTkj7dq+es8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745546890; c=relaxed/simple;
	bh=C0Onkw7Z6WQzYCDMpWTTwUoVEoCIysD7bDzMBGbjA+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEuRS/XXXocTZC/TqdK3AXJRzq4uLuHWJW5bnvAPzjY+hZoKsd16Lg2mchXI6c5RLDn0l26B+1HlIgRld5PHSvWtVHOwVPlpiPGLHbr+ZLKoqrWVb+TN1XFP+k+V60Ly7sxTW65UDSt+CoYwXi/h9LdwwAs09F/53zOyQSqWINw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=cOjiR3hp; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="cOjiR3hp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=eHzuw+bc0eV8DSy5e54/eajHTpo5TtF3m3H+/km2+yw=;
	b=cOjiR3hpGSq5JZGnS9/s2OQIiPq+SRuNJ5amBAFBfyGNvxgSvcUAuOcCBxk9vn
	t/8q5N3mwg9ZWGocNMeM/sfyAtdcbW/JeUpFJAux9YqMcpdc3JPLGNGld12Vmgk5
	hg58WmynrXNlqV9Qm4nDOzTckLTpfNZEcMT8mM1by4Kjg=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgB3KU1Z7gpoJI3SAw--.37105S3;
	Fri, 25 Apr 2025 10:07:23 +0800 (CST)
Date: Fri, 25 Apr 2025 10:07:21 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	Frank.li@nxp.com, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 01/10] arm64: dts: imx8mm-beacon: Fix RTC capacitive
 load
Message-ID: <aAruWUaXtM1O5Js3@dragon>
References: <20250416010141.1785841-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416010141.1785841-1-aford173@gmail.com>
X-CM-TRANSID:M88vCgB3KU1Z7gpoJI3SAw--.37105S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsmFCUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAo6ZWgK1S9vFAAAsy

On Tue, Apr 15, 2025 at 08:01:27PM -0500, Adam Ford wrote:
> Although not noticeable when used every day, the RTC appears to drift when
> left to sit over time.  This is due to the capacitive load not being
> properly set. Fix RTC drift by correcting the capacitive load setting
> from 7000 to 12500, which matches the actual hardware configuration.
> 
> Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini development kit")
> Signed-off-by: Adam Ford <aford173@gmail.com>

Applied all, thanks!

