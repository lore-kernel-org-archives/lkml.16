Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D937643ABC
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750241840; cv=none; b=TkKIuAKUQvoPwVHsr7jG0vapuDzAyyle/xgzVG/Fj5cwR2Fi6E5OEwEbtjpagKIx40YNCu4LDkODpvtXRdUj7P8dl+8Dg3ku8GF5fW5d24cX13a8tDcUl4teOEEeoFoZ5q16Wq+YL9wd07kYg4YVMTlwvODsCDIE55CeXY/Yr0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750241840; c=relaxed/simple;
	bh=Iu7+hNKCCdjztLeX2eFEdJH31jIEHBTI0oNl1UH89RM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QpeJwX1uHdtZ+p3rRkPXVKQcoIFEJp28JYDCsuVBsG9ysCpsNLAcBCrmzNO/jI25bspYc1DqzcUPo5m3pb4wWAPBzlt1LeH+Trul15M5BxakOTIwqzLP3zuqPuxfRY8AsgKBrxjlJTbAAG3RLJQFf1ra6xP04Lvv8dCilFPxclg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PFvhWztn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFvhWztn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57D4CC4CEE7;
	Wed, 18 Jun 2025 10:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750241839;
	bh=Iu7+hNKCCdjztLeX2eFEdJH31jIEHBTI0oNl1UH89RM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PFvhWztncz7lytujppxlwwpUcpRZYxQdisgd43U3Eln7DMTD8Ltn9YLjwgehd14Ky
	 H8Z8b4Aub3b2BFkn/DasBCUPPxXS4KiZUwF0KcYkvoBxipF8QU0ABk9bvh0q4EarRm
	 wDBwXso7qP8uxH0x9REjDEkQwNYW8FNkGRPONDS38RdTvTUZEUYblbPKumWc+jpn0o
	 dYNDKF2vOfRBFVzUEY645WpaK7qabyLejDmjYqR7+NJG0jR/IDpXsLSvb/zLJEa/4+
	 9lsAIMeIDwnf2bd94DSty6QqaUUxLqCDrGEJLnwRQK+IjTQ+c/mSSnCGnLemWYk8WV
	 n1iJA3I/rMa2A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uRpr3-000000006Pc-37D3;
	Wed, 18 Jun 2025 12:17:18 +0200
Date: Wed, 18 Jun 2025 12:17:17 +0200
From: Johan Hovold <johan@kernel.org>
To: Brian Norris <briannorris@chromium.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tsai Sung-Fu <danielsftsai@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] genirq: Retain depth for managed IRQs across CPU
 hotplug
Message-ID: <aFKSLblsjXoMxK2W@hovoldconsulting.com>
References: <20250514201353.3481400-1-briannorris@chromium.org>
 <20250514201353.3481400-2-briannorris@chromium.org>
 <24ec4adc-7c80-49e9-93ee-19908a97ab84@gmail.com>
 <aEcWTM3Y1roOf4Ph@google.com>
 <CAMcHhXqq9DHgip3rr0=24Y-LEBq5n4rDrE6AsWyjyBmsS7s+-A@mail.gmail.com>
 <aEiQitCsXq9XSBcZ@google.com>
 <CAMcHhXrT-y3EotxrcCZ0Pj8Sic6wsPSmRiW7NSzdG=9iH8xqKg@mail.gmail.com>
 <aEnUHv8xMTDYgps9@google.com>
 <aEsfJj35W7HQlTOH@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEsfJj35W7HQlTOH@google.com>

On Thu, Jun 12, 2025 at 11:40:38AM -0700, Brian Norris wrote:
> On Wed, Jun 11, 2025 at 12:08:16PM -0700, Brian Norris wrote:
> > On Wed, Jun 11, 2025 at 08:56:40AM +0200, Aleksandrs Vinarskis wrote:
> > > Yes. Dell XPS 9345 is arch/arm64/boot/dts/qcom/x1e80100.dtsi based,
> > > and Asus Zenbook A14 is arch/arm64/boot/dts/qcom/x1p42100.dtsi based,
> > > which is a derivative but has a slightly different PCIe setup. So far
> > > both laptops would behave in the same ways.
> > 
> > Thanks. So that's what I suspected, a DWC/pcie-qcom PCIe driver, and
> > seemingly standard NVMe on top. pcie-qcom doesn't seem to do anything
> > weird regarding MSIs or affinity, [...]
> 
> For the record, I was reminded that DWC/pcie-qcom does not, in fact,
> support irq_chip::irq_set_affinity(), which could perhaps be a unique
> factor in his systems' behavior.

No, we use the GIC ITS for the NVMe interrupts on X1E so that should
not be involved here.

Johan
