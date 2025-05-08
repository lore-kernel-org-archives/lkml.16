Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B613920D509;
	Thu,  8 May 2025 03:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746676484; cv=none; b=hRPfElMq5kIvYDto9WvlhgEGyO3ekP62JHrwY8EsC0AQOZeVyb80txqVt8pS4FK0arVr6ImX8tIrPN3CGs1t0MemK8/RUBwIxvM7TNGx52VE8E3OPTb+DfYkPgjIdgxot6BDGWYpOVftdekGLzbrOyVICW7wXcQX5HvOVu/zQko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746676484; c=relaxed/simple;
	bh=L+amYCo7f0kskSlXYKmJxzYlRQ+SWixbKLSI0Uo/hV8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eWyOBQSIykU2wXQ5avkglvCp1Ikm0UEvtWBs+mR4Da3IWYToCsmxTlQmWjN1Rot6CgQP4nE/QyEAxehcdWwEmrY2gNSNNeGFvfSyj7LoLqo0qIGc1BbYYbKkbL/EoCvrL7oDoLuYZyFM09mLdbuvj7u5xvpDMKXgj+yD5ABC6ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=AC/xI81U; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="AC/xI81U"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id CE2F825F87;
	Thu,  8 May 2025 05:54:38 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7sHD2bTBtF5k; Thu,  8 May 2025 05:54:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746676478; bh=L+amYCo7f0kskSlXYKmJxzYlRQ+SWixbKLSI0Uo/hV8=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=AC/xI81U/Fj1kxLUUFCdd5yLvQzysoo5ktQCJKnXNmuyuAbfUc4oqMk/vh/0cmDHU
	 HQSMiGWnyERYw93CPzVlR6j8bHZKP+An6hRvDeVEi8l55XLYYhdYdwYfjCZaJUePY7
	 QzbEkfN3cMRX7oFQoUet9vZ8DAc0RJHEAlq3Ybntafurkv5UjtXzlIB+fxXxItyAf7
	 CFM0VCc3Rpyddqbcv2hdxeKCOinDl3V4efN7XQ5lzI+OMaBxL2L1v4meeJGbmHncRU
	 4u0+F5ib3G3t1wSBEZP/50SAdNz+O+IxD1PscG7iro5WNOSbBqEg/OotnnzbEaBZtO
	 tl1XJXuRS9ifA==
Date: Thu, 8 May 2025 03:54:23 +0000
From: Yao Zi <ziyao@disroot.org>
To: Yanteng Si <si.yanteng@linux.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>
Subject: Re: [PATCH 0/4] Initial support for CTCISZ Ninenine Pi
Message-ID: <aBwq7_WSDxd4W82N@pie.lan>
References: <20250501044239.9404-2-ziyao@disroot.org>
 <d0575ec1-1901-4534-875c-fa9375e54e3d@linux.dev>
 <2f2c5e56-35b1-4d23-be52-0266bcb1ca98@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f2c5e56-35b1-4d23-be52-0266bcb1ca98@linux.dev>

On Thu, May 08, 2025 at 10:49:25AM +0800, Yanteng Si wrote:
> 
> 
> 在 5/7/25 6:08 PM, Yanteng Si 写道:
> > 在 5/1/25 12:42 PM, Yao Zi 写道:
> > > This series adds support for CTCISZ Ninenine Pi, which ships an Loongson
> > > 2K0300 SoC and various peripherals. The vendor prefix and the board are
> > > documented and basic SoC/board devicetrees are added.
> > > 
> > > I've successfully booted into console with vendor U-Boot, a bootlog
> > > could be obtained here[1]. DTB and initramfs must be built into the
> > > kernel as the vendor bootloader cannot pass them and upstream U-Boot
> > > support for LoongArch is still WIP.
> > > 
> > > Thanks for your time and review.
> > > 
> > > [1]: https://gist.github.com/ziyao233/7fd2c8b3b51ef9b30fe5c17faae1bc4e
> > > 
> > > Yao Zi (4):
> > >    dt-bindings: vendor-prefixes: Add CTCISZ Technology Co., LTD.
> > >    dt-bindings: LoongArch: Add CTCISZ Ninenine Pi
> > >    LoongArch: dts: Add initial SoC devicetree for Loongson 2K0300
> > >    LoongArch: dts: Add initial devicetree for CTCISZ Ninenine Pi
> > > 
> > >   .../bindings/loongarch/loongson.yaml          |   5 +
> > >   .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
> > >   arch/loongarch/boot/dts/Makefile              |   1 +
> > >   arch/loongarch/boot/dts/loongson-2k0300.dtsi  | 197 ++++++++++++++++++
> > >   .../boot/dts/ls2k0300-ctcisz-nineninepi.dts   |  41 ++++
> > >   5 files changed, 246 insertions(+)
> > >   create mode 100644 arch/loongarch/boot/dts/loongson-2k0300.dtsi
> > >   create mode 100644 arch/loongarch/boot/dts/ls2k0300-ctcisz-
> > > nineninepi.dts
> > 
> > For all the patch sets:
> > 
> > Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
> I'm sorry. As there is no consensus yet on the name
> of the development board, could you please refrain
> from picking my R_B until this discussion is completed?
> Thank you so much for your understanding and cooperation!

Sure. Anyway, thanks for your time and review!

> Thanks,
> Yanteng

Best regards,
Yao Zi

> > 
> > Thanks,
> > Yanteng
> > > 
> > 
> 
> 
