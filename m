Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF3A274643;
	Fri,  9 May 2025 12:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746792228; cv=none; b=sybXniYEXp3SGQFRvQbLBBkX6/YnqYCZpXtoZUkjPNWsUMx3VxvqECRkxQN5/oLHsBKJZhNhOg1pKQe0PoO/36ovYjP6qdFkrdB/tGLL/6pI6YvyBwpVkNnbl2wxlOk6zQPTSl21JMdzIaswp+z5FpKEy94K3/Dw5gFtHpXu9ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746792228; c=relaxed/simple;
	bh=zMk3Ur7keZic+WklbtXFWS6gObTJIJhCYMILZ9CiGdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SpGHQ1/Di7rEduh1/OwMiIlV3lIO9ziKLFlVhY+tJkx58h0pRTZS2FrI53AcRF5v3e++k4CtV7oL5u75o2Mnnrcbx8Gv54NyOi4IRB695zmANMoGQF6hxeVenltg1bfkiP5HT06jxLUeESI+73ZjunjZyUvFfWJiA10HHsCspek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=mlGh+L/e; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="mlGh+L/e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=uZznWLba/NrZlGr5Qa9wgXdmAIeUPmYseOlEvibVjwc=;
	b=mlGh+L/e3yD5Rzxyt5H4YE5WgU95NUq48DtszJYSAK09t/qKPMO2tb5qPO1ANa
	CO673MDq3NgqiHbSRopshU79k8zJukP3ey48IEnX4Qkfdka1wZIaOXr7jETDafFC
	6D0y8KiZxyUvBGEnGDjZ8UUDzIl3iL/FuD1aBPN4ml7Gw=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgC3N_Ke7h1oXnOrAA--.65461S3;
	Fri, 09 May 2025 20:01:36 +0800 (CST)
Date: Fri, 9 May 2025 20:01:34 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
Subject: Re: (subset) [PATCH v12 00/19] Support spread spectrum clocking for
 i.MX8M PLLs
Message-ID: <aB3unsCzCFUkdp9i@dragon>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
 <174643143452.2950397.16722215892279685541.b4-ty@linaro.org>
 <CABGWkvrkVLRocFsZs9JLni4KDZCDyYDZxMzwA9AzAwipmUyTzQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABGWkvrkVLRocFsZs9JLni4KDZCDyYDZxMzwA9AzAwipmUyTzQ@mail.gmail.com>
X-CM-TRANSID:Ms8vCgC3N_Ke7h1oXnOrAA--.65461S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxXw1kGFWrCr1furWUWr13CFg_yoW5WrWUpa
	4SkayqyrWDJFy8GF9Fyr45ta40qw4DZay8Jw1Ygr90v34YqF15JFW7Kry5KFyUG3yfC39r
	tay5Xw1ku3WYvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j4c_fUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxNIZWgd37UzoAAAs5

On Thu, May 08, 2025 at 10:32:10AM +0200, Dario Binacchi wrote:
> Hello Shawn,
> 
> On Mon, May 5, 2025 at 9:52 AM Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> >
> > On Thu, 24 Apr 2025 08:21:30 +0200, Dario Binacchi wrote:
> > > This version keeps the version v9 patches that can be merged and
> > > removes the patches that will need to be modified in case Peng's
> > > PR https://github.com/devicetree-org/dt-schema/pull/154 is accepted.
> > > The idea is to speed up the merging of the patches in the series
> > > that have already been reviewed and are not dependent on the
> > > introduction of the assigned-clocks-sscs property, and postpone
> > > the patches for spread spectrum to a future series once it becomes
> > > clear what needs to be done.
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [01/19] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
> >         commit: 20e5d201b5d8f830e702d7d183f6b1b246b78d8a
> > [02/19] clk: imx8mm: rename video_pll1 to video_pll
> >         commit: 26a33196b5b68cf199b6c4283a254aa92d2aaf4b
> > [03/19] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
> >         commit: 2d50415e2457c6f6621c2faa3b01b11150fb9c67
> > [04/19] clk: imx8mp: rename video_pll1 to video_pll
> >         commit: 21bb969f608cefd8d847cf6eb50a193d9f1fbb87
> > [05/19] dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
> >         commit: 2ba124053687c933031a6dc5b2e16ceaca250934
> > [10/19] clk: imx: add hw API imx_anatop_get_clk_hw
> >         commit: 17e3c1a272d97e49b4f3fbfe1f1b889e120d2be8
> > [11/19] clk: imx: add support for i.MX8MM anatop clock driver
> >         commit: 3cbc38cf42ca42d2dc9a93c949e0381ff919df71
> > [12/19] clk: imx: add support for i.MX8MN anatop clock driver
> >         commit: 80badb1d7264e83b512475898e7459f464a009c9
> > [13/19] clk: imx: add support for i.MX8MP anatop clock driver
> >         commit: 4c82bbe8b5437c7f16b2891ce33210c0f1410597
> > [14/19] clk: imx8mp: rename ccm_base to base
> >         commit: 1a77907dbbecfbe5e6a1aec28afd49a1dc184b7a
> > [16/19] dt-bindings: clock: imx8m-clock: add PLLs
> >         commit: 6a55647af3334f1d935ece67de4a838a864b53fc
> >
> 
> Please check the remaining patches, as they are required for correctly
> building the
> ones merged by Abel. The kernel test robot has already reported build errors.

I assume the remaining patches are DTS ones?  If so, I do not see how
clock drivers would require DTS change to build correctly.  Do you have
a pointer to the reported build errors?

My understanding about the build dependency is the opposite, i.e. the
DTS changes require clock defines merged by Abel to build?  In that
case, I suggest Abel pick up the whole series with my ack on DTS changes.

Acked-by: Shawn Guo <shawnguo@kernel.org>

Alternatively, I can pick up the remaining patches after clock changes
land on mainline (the next -rc1).

Shawn

