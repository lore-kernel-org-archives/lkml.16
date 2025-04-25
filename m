Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09BB1EF1D;
	Fri, 25 Apr 2025 01:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745544894; cv=none; b=gH0FWQWZrG6Jpi8X8MEjXr7pcYBDSGyPZ//y+dDB9qP1iDTzLhRj5U/0TE1G+/4n+ctoSkIejr/D44jq02xSDRNvxXyag743/1QnHRcaMw2vHavOs58CSB0HsVpz5RN/gcEc6RhQchh2052pRbjCWO8xB29lIsEzRRG+HRh8D1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745544894; c=relaxed/simple;
	bh=5DiN1ZvIjVQ7Cke0PXaB5fu2p8d4wAal+u2HVOLymYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3/76DNBuIDX/mkgk48wkTpiaJbw1biltvFMI3uslJuTiko22anMhTs6DnY3nZObaCi5rGnDcO+0JnZFDk57OLkrAi2YRiwq8j6QLypEXJXnUQBpTYunvh7StbgaTG27JAcDE5VxVJ7ifhe7D6gzH0a326FQawCY7qpRBlUa/Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=GKav9YMo; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="GKav9YMo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=t/khsHseSeDANI9AcueSC1NZqa7+XUI5LWtmaVCfors=;
	b=GKav9YMoJ9UN/xtBHSp3Yq3Il18fFedslGx6oMATvbGcqSkvC4ivNBUcPbDi6d
	5POOg03+oOu2ONAFo/iiJ1wvOhMS/kdO2TfN/KlBiWp4eZyBYvFSsQaNQ8SDTidr
	TXwxcDINek60tmyQQWXtXJpnxZHUOZ6aLA+972+2Hc364=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCXBEBy5gpoBQ_sAw--.17829S3;
	Fri, 25 Apr 2025 09:33:40 +0800 (CST)
Date: Fri, 25 Apr 2025 09:33:38 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, s32@nxp.com, imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2] arm64: dts: s32gxxxa-rdb: Add PCA85073A RTC module
 over I2C0
Message-ID: <aArmcsTXLZvRrg1E@dragon>
References: <20250410144826.73651-1-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410144826.73651-1-ciprianmarian.costea@oss.nxp.com>
X-CM-TRANSID:Ms8vCgCXBEBy5gpoBQ_sAw--.17829S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVaZXUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAQw6ZWgK0Y1WOAAAsC

On Thu, Apr 10, 2025 at 05:48:26PM +0300, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Add support for the PCA85073A RTC module connected via I2C0 on
> S32G274A-RDB2 and S32G399A-RDB3 boards.
> 
> Note that the PCA85073A RTC module is not battery backed.
> 
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

