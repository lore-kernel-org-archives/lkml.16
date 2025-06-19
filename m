Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9080E21C9E3
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750319927; cv=none; b=QyGgNVJhvSlHB2gtx5zWHo+T/oFSK6AvZKWihl8v+9RT81jd53QdM2i+LGau9z3WMpe36MUV75ssdYhRaOAJ0qWYb9GDsxOSDG5UsPpAJwK6XxWRr6B+eU3xM6CgwYipSF5t/x6YzPc5KvThpI2IqP88BYe9GiU1tWabP/tdDM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750319927; c=relaxed/simple;
	bh=crqk+zhdQ8Qr/k404DZSB2tQzBrmeeHuh9f0v8uhmTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xa5Sx+JhhxIG43t5y54q1laxCIzr2ZB6dFy42SEwtRnewgoeNXAKqSTruuza8QnTKejK6HS/SjmYauHZbbabmCG5uqKlgTj0fQzRZt+8DDRdgeMAUNVDWxHJ2CkHt0LCqD/A6Wfolqmw6AJMpHxVcq3AfpOB34cnxT+pIxs491w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Of2bD993; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Of2bD993"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=D8MldPwbwsdIkwE8tzK40xr/dxkO1GNTeWs2e/Byr+M=;
	b=Of2bD993b5NP6aOpy9wWGxOojcUgkQJnZVIcN9+oqdrChJ2XG4QVhla/HNkDCd
	C3bKt714JU+Eb9xNPq5SYdM3H/bRZ1LFkkJ3daNjQpeBDCvNIu/+ECK30uNhKhTo
	sjyBQX5rEsERgHseWn7ruNlyuj+O457Ei1oixj8dnZXeg=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDnfU8Bw1NoXtX_AA--.28682S3;
	Thu, 19 Jun 2025 15:57:55 +0800 (CST)
Date: Thu, 19 Jun 2025 15:57:53 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev
Subject: Re: [PATCH] arm64: defconfig: add S32G RTC module support
Message-ID: <aFPDAYCwA7I7yipt@dragon>
References: <20250526165041.2486330-1-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526165041.2486330-1-ciprianmarian.costea@oss.nxp.com>
X-CM-TRANSID:Mc8vCgDnfU8Bw1NoXtX_AA--.28682S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUO7KIDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAZxZWhTjfbDTwAAsa

On Mon, May 26, 2025 at 07:50:41PM +0300, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> The RTC hardware module present on S32G based SoCs tracks clock time
> during system suspend and it is used as a wakeup source on S32G2/S32G3
> architecture.
> 
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Applied, thanks!

