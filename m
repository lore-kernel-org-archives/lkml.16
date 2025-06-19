Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6731AA782;
	Thu, 19 Jun 2025 14:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750344114; cv=none; b=q/3PP2Mt46X0uCP/JIY6RhOXVaIckSPP1rrDfE/eQ9CQ79JgzUm2r7ntH1nm03D9R6CU3L+nOuDHnQgAN0Mkt/BwC/AZCtKWjEWqi2lfffcHTuksHRyLLWvtjoj0634p3ekYy5MNIwPJPQYH3uvBPyGFY+sOmprRX72eZRePUVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750344114; c=relaxed/simple;
	bh=9FjL7jXN7+I+9siWGEmJXJzuW18Q3lpA7eWXzplUB2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FVKs0/RfQY9rCn4iHjRxFJUmAMlDvcjnyByVpUC2l1ZJApt4gCioV6Xb0NHnKRjcrQGmPM90JovvW276Z6F/LUeu/NsY7NpQHctu5iKjZf0Gwi+9i7poJYJLne10tAqstQaunruU8sF2FRLTP/z/JTh69apkpKz2jitygtcqzoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivAw6wtr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivAw6wtr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7222EC4CEEA;
	Thu, 19 Jun 2025 14:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750344113;
	bh=9FjL7jXN7+I+9siWGEmJXJzuW18Q3lpA7eWXzplUB2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ivAw6wtrYKgkzWLYkf2Hp+qnnUqbKbOFmACm8FbuOwTPxq6h/KixDqlZCvtLU6fQx
	 G/tqyvalqNt4FjgKdn02u+4neUnD0S6pad7GvwyyxSP2rkUZfDwn/AIixoCzSXovsP
	 ckad/x+2+vVjSLzVrmZJIWmDVOC4zjxEtSieNfP6n52my/DhwaeOPeyaJhAh7qDLYv
	 7v0pLwICmCVACwSrLI+8EnJw/YA9cFy5rnt8z7wSmlE/PtW1IBBMOwMEa4GYSXyIkl
	 ROWKwASDP3wTCyLN1VfdIIix74mfC6ApDdGfCC4ha7y+x0ZH+Bu1grKvcr1O6GdyeZ
	 7B3+jBXQc7uyA==
Date: Thu, 19 Jun 2025 15:41:47 +0100
From: Lee Jones <lee@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] mfd: spacemit: add support for SpacemiT PMICs
Message-ID: <20250619144147.GH795775@google.com>
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-3-elder@riscstar.com>
 <20250619144023.GG795775@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250619144023.GG795775@google.com>

On Thu, 19 Jun 2025, Lee Jones wrote:

> On Fri, 13 Jun 2025, Alex Elder wrote:
> 
> > Add support for SpacemiT PMICs. Initially only the P1 PMIC is supported
> > but the driver is structured to allow support for others to be added.
> > 
> > The P1 PMIC is controlled by I2C, and is normally implemented with the
> > SpacemiT K1 SoC.  This PMIC provides six buck converters and 12 LDO
> 
> six or 12.  Please pick a format and remain consistent.
> 
> > regulators.  It also implements a switch, watchdog timer, real-time clock,
> > and more, but initially we will only support its regulators.
> 
> You have to provide support for more than one device for this to be
> accepted into MFD.
> 
> > Signed-off-by: Alex Elder <elder@riscstar.com>
> > ---
> >  drivers/mfd/Kconfig         | 11 +++++
> >  drivers/mfd/Makefile        |  1 +
> >  drivers/mfd/spacemit-pmic.c | 91 +++++++++++++++++++++++++++++++++++++
> >  3 files changed, 103 insertions(+)
> >  create mode 100644 drivers/mfd/spacemit-pmic.c

Right now, it looks like all you need is:

drivers/mfd/simple-mfd-i2c.c

-- 
Lee Jones [李琼斯]
