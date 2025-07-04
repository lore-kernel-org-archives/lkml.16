Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DFE1EEE6;
	Fri,  4 Jul 2025 03:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751599023; cv=none; b=Qz72Or8i4Bh1BfMpp/Ru2gkRCR97FeBue0uKVCZLJH2QTJFaw4Z2ls9BFRFJSmuCHe4B1YG1X0cfFeQzHdG7u00U6WxUqsEd2MqMBiQKYk0FsCMp2wOK6G/I4aJmGdm03t/gdl3YOANZtz2VWbYG7XAPOAzgG7bAN4fFU2r75sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751599023; c=relaxed/simple;
	bh=0tFcrfxkKL9ySeRCFB1ujQs+X0xxH4vdkOtO9MuupoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INK73hjvT5NDSJQG5CxSbyVhYxHWh2yCetONB0C7i8NLfKL26ZnzlfEME3JG/KW4MePjqd8rKbsp9ObhIdUouHw+FzPPPm/b28VHeRYpu7H31ZVVltrDO2AYFKUS6IvhOyztY95n14eabgIEO32SfALePL1w+S/zUKBlt0lIyeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from localhost (gy-adaptive-ssl-proxy-4-entmail-virt151.gy.ntes [114.94.8.21])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1adedd589;
	Fri, 4 Jul 2025 10:41:31 +0800 (GMT+08:00)
Date: Fri, 4 Jul 2025 10:41:31 +0800
From: Ze Huang <huangze@whut.edu.cn>
To: Frank Li <Frank.li@nxp.com>, Ze Huang <huangze@whut.edu.cn>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/4] usb: dwc3: add generic driver to support
 flattened DT
Message-ID: <aGc_W5Gfyiw8deYK@cse-cd03-lnx.ap.qualcomm.com>
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
 <20250526-b4-k1-dwc3-v3-v4-3-63e4e525e5cb@whut.edu.cn>
 <20250603012029.4agja77rdoneeyrl@synopsys.com>
 <aD5jL5DK6S8ii-DT@jean.localdomain>
 <aGc4EibLNTEj/H11@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGc4EibLNTEj/H11@lizhi-Precision-Tower-5810>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCS0hJVkhKH08YHk9JSx4YQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk9VQk9VQ1VJSllXWRYaDxIVHRRZQVlPS0hVSktJQk1LSlVKS0tVS1kG
X-HM-Tid: 0a97d34f7e8b03a1kunm074d1ad6206a3a
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6P0k6DQw5VjEyATkZFEMRMDwM
	LU0aCjBVSlVKTE5KTkJNQ0JISk1PVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlK
	Sk9VQk9VQ1VJSllXWQgBWUFJT01DNwY+

On Thu, Jul 03, 2025 at 10:10:26PM -0400, Frank Li wrote:
> On Tue, Jun 03, 2025 at 10:51:27AM +0800, Ze Huang wrote:
> > On Tue, Jun 03, 2025 at 01:20:35AM +0000, Thinh Nguyen wrote:
> > > On Mon, May 26, 2025, Ze Huang wrote:
> > > > To support flattened dwc3 dt model and drop the glue layer, introduce the
> > > > `dwc3-generic` driver. This enables direct binding of the DWC3 core driver
> > > > and offers an alternative to the existing glue driver `dwc3-of-simple`.
> > > >
> > > > Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> > > > ---
> 
> Any progress on this patch? If you have not time, I can continue work on
> this one.

Hi Frank,

I was planning to submit everything together for full functionality, but since
Alex's PHY work[1] is almost done, I'll send out the USB generic driver part
separately first.

Link: https://lore.kernel.org/all/5084a99a-9140-4c4f-9873-f5478f48a49d@ieee.org/ [1]

> 
> Frank Li
>

Thanks,
Ze
