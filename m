Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BE7200127
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750321945; cv=none; b=FqaSq/lP/3iMZMEXj/V1LEkN6qshSWo8wKtRv8J1Y2rD1tpVcLzxhT6Q3fnjnxz3/+qdv67F3D9eTJqtJMXwIzd84qtuy3MdA/3Zw0NxVoOfbV59Izx7AOgkIpgoSM+0WGqewzbzjNaMH4ykDM/PMdIL3zI/wz4DkNZ+sZYiSag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750321945; c=relaxed/simple;
	bh=veLbyqyQiNiNGf8kWYBurqlKDpBrvWeCNoEqkaERoQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDqGccA7eJXa0hKuhVo6nMyKYns9Dobe8IdrpP0Lck0dbd+iL+7jgngHMJQ/QN1LSDVMtu/zEGQgpSg4ZBiELeIDPI1kfPu7lyiII1DyV8GEy5vkNfbmsyLlATLwoRI6VSBMmRuio5V9oKzci/59AYbe6JxHVZxcb7ZP0FCwUVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VfBRZZBg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VfBRZZBg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A845BC4CEEA;
	Thu, 19 Jun 2025 08:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750321944;
	bh=veLbyqyQiNiNGf8kWYBurqlKDpBrvWeCNoEqkaERoQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VfBRZZBg81CkJZ9QDpl4D45dW/W47hCM0epYD+mlcZs0gkILDaAtWFEVw0UAYTkh5
	 RQVOe7/lcj94OLvrqtZB72OA+OH/FGCSQ6Tp1kFXa3qEHDIyz7Xs/iBFkGqIp6mJ4F
	 Ty6EfEX518vZ505h+G3avKpVynfNPqVDs8bD8q2s3Z/1BE1JL0RrIVjX5YixqZKpuX
	 g/EcOVfZZwCc8cDJ1vd5DwuRRkp13nvuFjA3QcVECJzBy3nAea7zPScgpNgVinc8T2
	 nzlFMSp0o2v+LwtIjnig2dTY1R2bYzE6sAhn+gOIW/JB5WC7Mo5pZTOOQA6czqYPs3
	 QlzYGaIzuuQlA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uSAh2-0000000085F-2DGF;
	Thu, 19 Jun 2025 10:32:21 +0200
Date: Thu, 19 Jun 2025 10:32:20 +0200
From: Johan Hovold <johan@kernel.org>
To: Brian Norris <briannorris@chromium.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tsai Sung-Fu <danielsftsai@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] genirq: Retain depth for managed IRQs across CPU
 hotplug
Message-ID: <aFPLFKMnlvtBjD1P@hovoldconsulting.com>
References: <20250514201353.3481400-2-briannorris@chromium.org>
 <24ec4adc-7c80-49e9-93ee-19908a97ab84@gmail.com>
 <aEcWTM3Y1roOf4Ph@google.com>
 <CAMcHhXqq9DHgip3rr0=24Y-LEBq5n4rDrE6AsWyjyBmsS7s+-A@mail.gmail.com>
 <aEiQitCsXq9XSBcZ@google.com>
 <CAMcHhXrT-y3EotxrcCZ0Pj8Sic6wsPSmRiW7NSzdG=9iH8xqKg@mail.gmail.com>
 <aEnUHv8xMTDYgps9@google.com>
 <aEsfJj35W7HQlTOH@google.com>
 <aFKSLblsjXoMxK2W@hovoldconsulting.com>
 <aFLy9lFYnhA918TO@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFLy9lFYnhA918TO@google.com>

On Wed, Jun 18, 2025 at 10:10:14AM -0700, Brian Norris wrote:
> On Wed, Jun 18, 2025 at 12:17:17PM +0200, Johan Hovold wrote:
> > On Thu, Jun 12, 2025 at 11:40:38AM -0700, Brian Norris wrote:
> > > For the record, I was reminded that DWC/pcie-qcom does not, in fact,
> > > support irq_chip::irq_set_affinity(), which could perhaps be a unique
> > > factor in his systems' behavior.
> > 
> > No, we use the GIC ITS for the NVMe interrupts on X1E so that should
> > not be involved here.
> 
> Huh, interesting callout. I had looked at trying that previously on
> another DWC-based platform, for the same reasons noted in that
> switchover.
> 
> Anyway, all I can tell you is that Alex's logs clearly showed:
> 
>   set affinity failed(-22)
> 
> for what looked like the NVMe interrupts during CPU unplug / migration.

No, those warnings are for wakeup enabled GPIO interrupts (e.g. the lid
switch), which are currently partly disabled on this platform pending
some rework of the PDC driver:

	602cb14e310a ("pinctrl: qcom: x1e80100: Bypass PDC wakeup parent for now")

(And with the rework those warnings go away, while the IRQ suspend
regression is still there.)

Johan
