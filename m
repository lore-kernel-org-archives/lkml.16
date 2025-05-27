Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC5D1F1515;
	Tue, 27 May 2025 11:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748344543; cv=none; b=BWXDW00F5dFayhDWY3XAJqQs7/9UOlwUnp6TdtDHHCIQFY4MAw8Qk918m7m27Es60T2cydr18fuAyf+u4AzkZz2XHFCusTTXGQv3p0kb8GmBhznlX1n3i2wSlYFUptPL87oHU6OBcZLdKRAWApnmQGQnMP3CfwXBnnwV5cRAnmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748344543; c=relaxed/simple;
	bh=KqOpgvrrjPxv8J6EQmpTBxyOoxtVu4hispzm9kQegqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sK15d5PK0NLIQzjl8y6Lm3vVconyEdKsztxGMsIvz+VaWmjSWox3+5OoeEQXo9FVL/h+S7japQKlNHs7vjCgngtlviLPAr2IXP7kd/xJu2oJ5iYS/ZRxQlVV+VLxEKEGPXYUgAz0w/W3r8lWxMm/7IVm44M+NVqCQnvcq/vnasE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from localhost (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [27.18.99.37])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1691f3efc;
	Tue, 27 May 2025 19:15:37 +0800 (GMT+08:00)
Date: Tue, 27 May 2025 19:15:37 +0800
From: Ze Huang <huangze@whut.edu.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>, Ze Huang <huangze@whut.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: soc: spacemit: Add K1 MBUS controller
Message-ID: <aDWe2StmB-dhQNtv@jean.localdomain>
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
 <20250526-b4-k1-dwc3-v3-v4-2-63e4e525e5cb@whut.edu.cn>
 <20250527-friendly-armadillo-of-snow-5bec9e@kuoka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-friendly-armadillo-of-snow-5bec9e@kuoka>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHx5CVh5MGU5CGUhJH0kaHVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVITFlXWRYaDxIVHRRZQVlPS0hVSktISUxCS1VKS0tVSkJLS1
	kG
X-HM-Tid: 0a97117482bd03a1kunm64e0c64ea7480
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6KxQ6Cyo*VjEwFFZMKRYOTzRP
	CTcKCxZVSlVKTE9DSE9PTkhDTEhLVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVITFlXWQgBWUFJSUtKNwY+

On Tue, May 27, 2025 at 08:54:42AM +0200, Krzysztof Kozlowski wrote:
> On Mon, May 26, 2025 at 10:40:18PM GMT, Ze Huang wrote:
> > Some devices on the SpacemiT K1 SoC perform DMA through a memory bus
> > (MBUS) that is not their immediate parent in the device tree. This bus
> > uses a different address mapping than the CPU.
> > 
> > To express this topology properly, devices are expected to use the
> > interconnects with name "dma-mem" to reference the MBUS controller.
> > 
> > Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> > ---
> >  .../bindings/soc/spacemit/spacemit,k1-mbus.yaml    | 55 ++++++++++++++++++++++
> >  1 file changed, 55 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-mbus.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-mbus.yaml
> 
> Memory bus controllers go to /memory-controllers/ directory.
> 
> Best regards,
> Krzysztof

OK
