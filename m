Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABE8274FE8;
	Mon, 19 May 2025 09:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747647802; cv=none; b=Rl4uU/RF9rQSmi6HCpGXOC2oFhyjrkrvaub7NmqPUiEJXa43wZ0ckdrDG9xu29Uu85CMUhEgyt+9LGMXMeIYjAHR0rSfuK2kfJXkQGB5yivcI6jxhyPYV72WW4RxQFFfxvj6taLqyK1/eUEZYhaerot7lRwLj7pjsgZ4sTLouGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747647802; c=relaxed/simple;
	bh=DdT+pVsKJRe+Ut1elxuENYBzb9NXl2inPubgVgp3/fU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l1soMjvfK1HML7ONHyZCLltQ/+IcXsdAVj7gSthCE9ZcY9xh3Brwxj0qa7Ee3cTVM7TxPLAQTwWuD6Tpet9fdNSs7xXASSs969D4JV16uakfQh6XWgWmr9mhY+aoFPlXB2DX+8wMWrU5EmiOV+Nq93UErm2lTUblQqaPvzBMhD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=HcUS+Zli; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="HcUS+Zli"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 333B426051;
	Mon, 19 May 2025 11:43:13 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id geiFRPnWWcd2; Mon, 19 May 2025 11:43:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1747647792; bh=DdT+pVsKJRe+Ut1elxuENYBzb9NXl2inPubgVgp3/fU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HcUS+ZliQhs4/LUkq8lNwee1BlLGJSs/TFroOxZeTRbi4BMi4nFPFJL78heLxTxG0
	 dk9absrcsBOYO10LCFmKk9hVJRMnT2jUlWrbWYWtppUkuq6Y4nEVAGwO+dZSLdSkJj
	 2SK345RzcW2sAdIu7Qz/CkWopqkl7TQeq1JYVHelgh03+wPffR06IJkOyVzIOc+Q1T
	 JSTgFaXTfmiYgifd2rXi8YGfhII7wU9+lDW6JecGBuNF8WKw7lKw7MRYnwHgC9ERQR
	 mvzYkGiaB8baBn6F2eG6faF+kIKsNZF6TXqk1fQ7l+O/MFV1JY++W3YfgrK4NOKitb
	 iELlrSYyYETYg==
Date: Mon, 19 May 2025 09:42:59 +0000
From: Yao Zi <ziyao@disroot.org>
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Subject: Re: [PATCH v2 4/4] LoongArch: dts: Add initial devicetree for CTCISZ
 Forever Pi
Message-ID: <aCr86zZWBu8yofdD@pie.lan>
References: <20250518080356.43885-1-ziyao@disroot.org>
 <20250518080356.43885-5-ziyao@disroot.org>
 <CAMpQs4+GiZpLfSHx9k_QfWjXtyrNS4LS4dOuCKLbS-F8OhpoWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpQs4+GiZpLfSHx9k_QfWjXtyrNS4LS4dOuCKLbS-F8OhpoWg@mail.gmail.com>

On Mon, May 19, 2025 at 03:58:29PM +0800, Binbin Zhou wrote:
> Hi Yao:
> 
> On Sun, May 18, 2025 at 4:05 PM Yao Zi <ziyao@disroot.org> wrote:
> >
> > Enable UART0 as it's the boot UART used by firmware.
> >
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  arch/loongarch/boot/dts/Makefile              |  1 +
> >  .../boot/dts/ls2k0300-ctcisz-forever-pi.dts   | 45 +++++++++++++++++++
> 
> A minor suggestion:
> As we can see, the existing dtsi/dts files are prefixed with
> “loongosn-2k”, would it be possible to keep the filenames consistent?

It's abbreviated since loongson-2k0300-ctcisz-forever-pi.dts seems a
little too long for me, and naming devicetree files in form of
<abbreviated-SoC-name>-<vendor>-<model> is common on other
architectures.

I won't insist and will change it if you consider consistency really
matters.

> >  2 files changed, 46 insertions(+)
> >  create mode 100644 arch/loongarch/boot/dts/ls2k0300-ctcisz-forever-pi.dts

...

> -- 
> Thanks.
> Binbin

Best regards,
Yao Zi
