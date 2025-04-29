Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5365421883E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745939041; cv=none; b=up2hr9CwziTa+/rkcw1LEQdB4oeMjQWsmcrAOLuMnD5WCbT+vUY13zYnuuno3xWWjE/Wh3GfdMDctPUVqu6FHLgOfYLbugOsyEtOUSe4RGQNavLWGBEXIzeccGe59LI9TBQ6kzcSDgRm5DrZg4GtTke+NdS1EVt7o6Fy7XqPvDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745939041; c=relaxed/simple;
	bh=07G9Y0+nqlY03fvr8srBQeJEfqq0mWj7H4qgzsSSMC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eTXvSXOTdwCV17DtUq8Y5yjd3XIkV7gMizQRevdxymiT1JeddrWy6vLWEkd9+OF5TohNcqJawZE2RvXC/VrT+3NaIUhYWcjPOViGIJQY+3vok3T8Se7Z2GJKjqm9vJWUJp4nOfBfQ5cbslXPGOkMrO93eimEGxQpmb0cH3hIAmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b2RSriF1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b2RSriF1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA8E5C4CEE3;
	Tue, 29 Apr 2025 15:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745939040;
	bh=07G9Y0+nqlY03fvr8srBQeJEfqq0mWj7H4qgzsSSMC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b2RSriF1PYemUlOEM4eytLR7EQokiggwNpQWL0brlA0py7t88h57IFIcL3nc5JPlr
	 zCEIvgdOJeWphGywZ/RdE3vyNdiDgxakgkRvo8c5nD9A+l8FFq94QHjjT6CL3E7iQD
	 +098om27DJSagNnfegkQWkf90HjK3jV2dh7n9xJvapwQSzFEtyQuLE3O+aKosQPIzQ
	 PWsy1RFZv3tZbkoSWBEeBtLsfLMRcnP+abFPekl8OrQKHAU9m66tMiwhjoC1X6b8EX
	 KL2W+7To5tAf31adc5+48VNfVCFm1h1z3tMqjdEWqeuGGTOIegkqrdycZSIQPOmxaN
	 u4KpDbEcNoCrw==
Date: Tue, 29 Apr 2025 16:03:54 +0100
From: Will Deacon <will@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: tglx@linutronix.de, ruanjinjie@huawei.com, catalin.marinas@arm.com,
	oleg@redhat.com, sstabellini@kernel.org, peterz@infradead.org,
	luto@kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
	paulmck@kernel.org, mingo@redhat.com, dietmar.eggemann@arm.com,
	linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com,
	joey.gouly@arm.com, kevin.brodsky@arm.com, dave.martin@arm.com
Subject: Re: [PATCH -next v6 1/8] entry: Split generic entry into generic
 exception and syscall entry
Message-ID: <20250429150353.GA26272@willie-the-truck>
References: <20250213130007.1418890-2-ruanjinjie@huawei.com>
 <20250320142612.396250-1-linus.walleij@linaro.org>
 <CACRpkdZKaUtnv0HfTci1-_WekNkmJyNA3znx7cUgJW5NNDAYVg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZKaUtnv0HfTci1-_WekNkmJyNA3znx7cUgJW5NNDAYVg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Apr 28, 2025 at 04:46:02PM +0200, Linus Walleij wrote:
> Hi Thomas,
> 
> On Thu, Mar 20, 2025 at 3:26 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> 
> > > Currently CONFIG_GENERIC_ENTRY enables both the generic exception
> > > entry logic and the generic syscall entry logic, which are otherwise
> > > loosely coupled.
> > >
> > > Introduce separate config options for these so that archtiectures can
> > > select the two independently. This will make it easier for
> > > architectures to migrate to generic entry code.
> > >
> > > Suggested-by: Mark Rutland <mark.rutland@arm.com>
> > > Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> >
> > If the generic entry maintainer (hi Thomas) thinks this patch is
> > OK it would be nice to have it applied because it will also make
> > the ARM32 transition to generic entry easier as we can work on
> > exception and syscall entry each in isolation.
> >
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Do you think this patch is something you could queue on some
> tip branch for v6.16?
> 
> I don't know if either arm64 or arm32 is going anywhere with
> generic entry for v6.16, but having this in-tree makes it easier
> to split the task going forward. We can always pull it into some
> branch or just wait for v6.16-rc1 to get this patch under our
> patch stacks.

Agreed, having the core part merged would be really helpful if possible.

Cheers,

Will
