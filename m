Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C351F4E57;
	Thu, 12 Jun 2025 09:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749721214; cv=none; b=DgGNdcAC9RXFNXcwiV40d2+UYMK4zCEFvaJGoiuQQKpAt+c48tYioxSIbfWGG2eZCwI4Vtwzky5J/KHTus7WtNCnS07eKOjprQ5vIddHgR7o4ObKbhOvexkwwcf3J6A1ahRuC0eqSz/EPUjBSOujixJ0stWM2iPXAoZuIORFwn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749721214; c=relaxed/simple;
	bh=X0WyNzqdNdMYgNmtykgr5YdK/wDKDI9dptgfeOw9HhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mz+6OLLdx5dR4NsEYfEuOOYMjeGFBTBMmc4NOLCarPgNdWIsKJ5dqetjaGjxchCtq7KHkXqr5SHM2HbmJDkbaGOGrmP+3QK5DIS/6ZMHdhtegLU/MBFQZh2EEtLXa18T9dJEygd5TdYpD+WxdpJZS2wuGqHrbz3AwcSLQcL+deE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=gCgCKhQb; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="gCgCKhQb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=PWsK6/4szkHoVXHrnAm4LALSER2jQ1ghC7Ix2DLbky0=;
	b=gCgCKhQbohyOe0xUCPsJ3o4Ew/mFa7zLgMkmqU0BS9KZaD06obYbyN0WtRyCXQ
	RdKxtQYtBavGjIlWxi3tSqzVWp0Tb1ZBRikMCHdkTfX0e9JdZegrO4h+PgwDcLLC
	vEc/cl7bkv8Y6lRYN4tOAocJ4iuR0/3xVKMRC2NKkkiVI=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD31+0yoEpo1rB_AA--.16809S3;
	Thu, 12 Jun 2025 17:39:00 +0800 (CST)
Date: Thu, 12 Jun 2025 17:38:57 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v17 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Message-ID: <aEqgMVHl0C07/dPz@dragon>
References: <20250426-imx-se-if-v17-0-0c85155a50d1@nxp.com>
 <20250426-imx-se-if-v17-1-0c85155a50d1@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426-imx-se-if-v17-1-0c85155a50d1@nxp.com>
X-CM-TRANSID:Ms8vCgD31+0yoEpo1rB_AA--.16809S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYJPEUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAR5qZWhKmz8VvgAAs9

On Sat, Apr 26, 2025 at 12:31:32AM +0530, Pankaj Gupta wrote:
> Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
> that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
> - NXP EdgeLock Enclave on i.MX93 & i.MX8ULP
> 
> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>

No one cared to give a Reviewed-by on this one?

Shawn

