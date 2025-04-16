Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C18A221F25
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 22:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744844052; cv=none; b=f/EkzpevLOz66u5fKGZ38V8VAV6PF8/RVLH9jAAMLGmDadPRarSV9Wm0GBmnyeF+Ee+YnW+XUvln9S9+xixTYF3iAwIHEjvK86ZGlZUYSXW4pY8wUkMK7LoH0XFf4U/+Fs4ycdypnekzBSegzqt1Q2SMDUfANIVvROzNSI8rPfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744844052; c=relaxed/simple;
	bh=+AuiwU9uG7b94jvOOiaauqwi+BDUKTtM7QT1BeW5Tyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHk72Eg36YX6aPzBi2FUtNSnU2jpTz4Lr3oHbuZVtOvVNkePNz8w54wuOaCaOT0myjaIbCuJPfxizrtlajNh9anGWA7f7E/c8FKD53bUs2zQtZvcl35sVSI0mbtVThIzfz85cf3H6d5/S1sQauA5Vgtj1XypjAHj+gyUF7VHqKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F256C4CEE2;
	Wed, 16 Apr 2025 22:54:10 +0000 (UTC)
Date: Wed, 16 Apr 2025 23:54:08 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Ross Stutterheim <ross.sweng@gmail.com>,
	Ross Stutterheim <ross.stutterheim@garmin.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Mike Rapoport <rppt@linux.ibm.com>,
	Linus Walleij <linus.walleij@linaro.org>, rppt@kernel.org
Subject: Re: [PATCH v2] arm/memremap: fix arch_memremap_can_ram_remap()
Message-ID: <aAA1EHMzoHOTpv-l@arm.com>
References: <20250414133219.107455-1-ross.stutterheim@garmin.com>
 <20250414142140.131756-1-ross.stutterheim@garmin.com>
 <Z_-B5fAhZzShX34I@arm.com>
 <c7db6fda-bf4e-4d6b-8cca-db82c40ce1b6@gmail.com>
 <Z__RNhf5CJrbv5yb@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z__RNhf5CJrbv5yb@shell.armlinux.org.uk>

On Wed, Apr 16, 2025 at 04:48:06PM +0100, Russell King wrote:
> On Wed, Apr 16, 2025 at 08:57:09AM -0500, Ross Stutterheim wrote:
> > On 4/16/25 05:09, Catalin Marinas wrote:
> > > > Fixes: 260364d112bc ("arm[64]/memremap: don't abuse pfn_valid() to ensure presence of linear map")
> > > > Signed-off-by: Ross Stutterheim <ross.stutterheim@garmin.com>
> > > 
> > > I think you could also add:
> > > 
> > > Cc: <stable@vger.kernel.org>
> > Done. I also added some other Cc: entries on V3 along with Reviewed-by:
> > lines . I'm new here, so I'm not sure I've used those 100% properly.
> > 
> > > Not sure how Russell picks patches up these days (I used to send them to
> > > the patch system -
> > > https://www.arm.linux.org.uk/developer/patches/info.php).
> > > 
> > > It might be simpler with git send-email (that's the alias I had):
> > > 
> > >    git send-email --add-header="KernelVersion: $(git describe --abbrev=0)" --no-thread --suppress-cc=all --to="patches@armlinux.org.uk"
> > > 
> > Thanks. I created an account there and submitted V3 through the web
> > interface (to avoid my SMTP server appending more stuff on the end).
> 
> Thanks, seems all good, applied and pushed out. I'll send it to Linus
> tomorrow as it's certainly a serious regression.
> 
> I'm surprised Mike hasn't responded...

Ah, I think he joined Microsoft. Adding his kernel.org address.

-- 
Catalin
