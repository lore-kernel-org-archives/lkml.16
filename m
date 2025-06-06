Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3FD20330;
	Fri,  6 Jun 2025 11:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749210226; cv=none; b=qMHhcsVapKcoJJp13p9LSvNi/uWWNLIUrEAIFxYfzMf7vMbuO+ueq5tT0FlrBQDkRcPx7Imsr8aGvzmuzwKBLR131/tw/cyr7Uvh50FgQ2rzxVkPmQGzlKq+m28cK1+sZkofVe4svENzd+XlSBYKiYaiva2gM/DF39jkYYTjU8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749210226; c=relaxed/simple;
	bh=/Af4YCmRpDYeBf586N1KH8WQtJcvshKud41TMzf13FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mvp2rEaLIUzhA3n4vwthPGO/sXlZg3jbvE4PKAn6oQPYLow4jjGMHf42IIHD6Q2FATWaGhM77QQ6cKwypT49whOm3uSous/W+8Vx0adE9kiItloqfS+Sy73r2HvcumOSf0i4IJvIx40f8yQQHidlYoux+lXzTtbsxcmGNGSlarc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from localhost (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.17.176.245])
	by smtp.qiye.163.com (Hmail) with ESMTP id 17c6f2803;
	Fri, 6 Jun 2025 19:43:38 +0800 (GMT+08:00)
Date: Fri, 6 Jun 2025 19:43:38 +0800
From: Ze Huang <huangze@whut.edu.cn>
To: Yixun Lan <dlan@gentoo.org>, Ze Huang <huangze@whut.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] usb: dwc3: add generic driver to support
 flattened DT
Message-ID: <aELUajmfzmb7w3W9@jean.localdomain>
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
 <20250526-b4-k1-dwc3-v3-v4-3-63e4e525e5cb@whut.edu.cn>
 <20250605213443.17a7aa26b@smtp.qiye.163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605213443.17a7aa26b@smtp.qiye.163.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSkkfVkoeTU4ZH0xDGEweQ1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKTFVKTE1VSU9OWVdZFhoPEhUdFFlBWU9LSFVKS0lIQkhCVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a97450dc07b03a1kunmea2195ced05ae
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ogg6Phw5ODE1SBgyIwoTFiMq
	CjcaCkpVSlVKTE9CSUpLSUpCTUlPVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKTFVKTE1VSU9OWVdZCAFZQUpCTE83Bg++

On Thu, Jun 05, 2025 at 01:34:27PM +0000, Yixun Lan wrote:
> Hi Ze,
> 
> On 22:40 Mon 26 May     , Ze Huang wrote:
> > To support flattened dwc3 dt model and drop the glue layer, introduce the
> > `dwc3-generic` driver. This enables direct binding of the DWC3 core driver
> > and offers an alternative to the existing glue driver `dwc3-of-simple`.
> > 
> > Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> > ---
...
> > +	ret = reset_control_deassert(dwc3->resets);
> > +	if (ret) {
> > +		dev_err(dev, "failed to deassert reset\n");
> > +		goto reset_assert;
> > +	}
> > +
> > +	ret = clk_bulk_get_all(dwc3->dev, &dwc3->clks);
> can you check if able to use devres api for reset/clock here?
> (functions start devm_ prefix)
> 

OK, will do
