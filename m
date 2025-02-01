Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956621C1F1F
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 16:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738427102; cv=none; b=KumFGB9RLtxVJsliOnJaJLikAYPNZg3M3LecezBHTcCv0T/fddUbDqLSgCkCdcrHKouR4EVMnTYEKu8v674ukwiSrSwXoWNiluYU32j/quMEdUQfLnBUEh/6+PMjD7Z5486yO96dFYvcfYBXtybR44e60AOdBlTPCEMe/32UZzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738427102; c=relaxed/simple;
	bh=TdK6/Jxn4qrb3BiXRzJDWokL5OeYhkjCuo7aLnFVdbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LcxrvjDu5kh2GXdteVjjM4mkFjY3z03DJyJDI7McdELE0VGL55SrRufg5ZKFTmSSl8yQw2yhJK7z3uM3iP6PtP4S4N0DQq8yrFcZNxQAvuAg+2jhN1Fw1NgEHUNyZLHR0S2Ds6gEewrPuu01vwueRRO//VNHBhnXZUX8RAG5S74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RAjn8LFe; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RAjn8LFe"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21680814d42so49403385ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 08:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738427100; x=1739031900; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7g3+xRMv7I8hoM/mUnFLrYDh9mXx+uu/SX2/MPa2/K4=;
        b=RAjn8LFedcNG6NIE5o/fVMV4wnJgowxJFLp9RE1SN/E9MIIWhXYCqu5nlRrKbSUJGo
         zohWp4l1qCVaMVGLFc9ZLgPmfJTczslRkkv5cI+1pPoQCORqyH8rl+kwk5/nIeiOP0/f
         PoxvMw48TUT0pm5IcSc6VsmZxRHYwERdP7oWnEljdxAPoBaTc8p+a2uhcn4fZmIMNCmq
         9mv/FfvSaF9EiTXG9bbyoM1O+cbkrkjnSzvsTHtmlQki8oirWO8GppaS3DLJfOdFb8kG
         yTxb24x0YLxGGeZt8MfzZanHE0Q9UrYiaaBHOEaYdhXxLAKGOFF4dGU1wIsoC5K1OBWH
         f+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738427100; x=1739031900;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7g3+xRMv7I8hoM/mUnFLrYDh9mXx+uu/SX2/MPa2/K4=;
        b=lAzn6XedhQtxD7ChQ7JMObcB1qdMoBXzOTvti3M225tCMQkkXO1+uZlyAu6wVuXqbf
         g5vOxmYhWbkKrQ214gFIuBd6rnucZJ23Gs9VJQ4lSKNPUcYlzGo2YtnU4Z4Iee9qiOdY
         Fa+eCLAKeQAx4+hAkqsb+D28l2mR+l2dhJ+Ysd9H3h3OdOxRSValr7YnOempTBox0txp
         angLRfhOSmMwam+KESINEdiI3+l5iZl/DvkuP2u/ISV24aTs/78lpEWLdamg5CcGkhsk
         m34DGg1sCFdPrvqmFKlutKGH8RziDBcYmme/yysB/8MsXv/dNDqqhQ07myDIdZpRGeb6
         eMeA==
X-Forwarded-Encrypted: i=1; AJvYcCVWSUxFNrVNrJQrZNMqpm972/c8AGj+helhI7TioOa7DtzcbXeP3W1npN0YkSnI6DvSXBMZGX9e3glr/rg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeGUsV3jM+hP8RAP/qtV9b8J5C1tT+vJ+QrbDcm/wTayCjj0HM
	Cmu2gm/bmPX3SHfN6qQfLHKuMuWD4JEeWvk4Df8jfXFB+eVbpA5msQxuqjSgwPymOG4Q2SBXiQk
	=
X-Gm-Gg: ASbGncuZ1UxxU6wDp+sMBQbfNkoeGN0WINhwLc+HGT6XkNGLKU7ZUz9KWs9y260zJq8
	H45flpFEfYYs6c0tBq/8b0T3d59JMz3UjOEjyad4SdbzAprapAaJfTJ9POA6nx/C6DeBky/NEdm
	KlAmfhM1FjMmjGuJW46T6N5QeneZqnSufkl4hQepW9bNiX7Lamf/WxaWibSNo5gAHDGJJqEthp3
	Ae58aeyupjvG06Ei9eq3KpzxYNK+D5ZAC/sPO2pfSt8Zl5KkgvBz8Fuu8OQKvsnkfCI18dKCfAg
	btiBxkwrsd7NDEr3fum3/HYW9DI=
X-Google-Smtp-Source: AGHT+IGTWHq/F06CpcrmFryngFoTcdvCxiBh6JdgpfJOZKD+GgbyyI6EvDWMGbH+eGJ1NmIPO9v+cA==
X-Received: by 2002:a17:902:f690:b0:216:501e:e314 with SMTP id d9443c01a7336-21dd7d74aedmr224666875ad.20.1738427099834;
        Sat, 01 Feb 2025 08:24:59 -0800 (PST)
Received: from thinkpad ([120.56.202.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f848976d1fsm6324512a91.3.2025.02.01.08.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 08:24:59 -0800 (PST)
Date: Sat, 1 Feb 2025 21:54:53 +0530
From: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: Jianjun Wang =?utf-8?B?KOeOi+W7uuWGmyk=?= <Jianjun.Wang@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <Ryder.Lee@mediatek.com>
Subject: Re: [PATCH] PCI: mediatek: Remove the usage of virt_to_phys
Message-ID: <20250201162453.rwnd7igaiwnngdlb@thinkpad>
References: <20250107052108.8643-1-jianjun.wang@mediatek.com>
 <20250115173156.a73ntoyyn3xy52ze@thinkpad>
 <9e629b1779c2cb9c6fa34347ac16f9b4e2241430.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e629b1779c2cb9c6fa34347ac16f9b4e2241430.camel@mediatek.com>

On Thu, Jan 23, 2025 at 08:11:19AM +0000, Jianjun Wang (王建军) wrote:
> On Wed, 2025-01-15 at 23:01 +0530, Manivannan Sadhasivam wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> > 
> > 
> > On Tue, Jan 07, 2025 at 01:20:58PM +0800, Jianjun Wang wrote:
> > > Remove the usage of virt_to_phys, as it will cause sparse warnings
> > > when
> > > building on some platforms.
> > > 
> > 
> > Strange. What are those warnings and platforms?
> 
> There are some warning messages when building tests with different
> configs on different platforms (e.g., allmodconfig.arm,
> allmodconfig.i386, allmodconfig.mips, etc.):
> 
> pcie-mediatek.c:399:40: sparse: warning: incorrect type in argument 1
> (different address spaces)
> pcie-mediatek.c:399:40: sparse:    expected void const volatile *x
> pcie-mediatek.c:399:40: sparse:    got void [noderef] __iomem *
> pcie-mediatek.c:515:44: sparse: warning: incorrect type in argument 1
> (different address spaces)
> pcie-mediatek.c:515:44: sparse:    expected void const volatile *x
> pcie-mediatek.c:515:44: sparse:    got void [noderef] __iomem *
> 

This need to be added to the patch description.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
