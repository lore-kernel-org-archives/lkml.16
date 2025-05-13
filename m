Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1D020CCE4;
	Tue, 13 May 2025 08:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747125336; cv=none; b=gdHlSbOwVF0R2PKPmO0HXHKgH81HPknSvMFrcMWBRvMcfAmCfFb9VozryvWCsnSmbCeaoIUkj7TNOE4CtiFT+09DO2/rVxiJwBBs5fOGdVkkdxB88o6VoUGsOMI+wl2ULuCMFMjuOlumiWbuKpDois9pwXQbJjp12d15UcXWWmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747125336; c=relaxed/simple;
	bh=AQsw6m7iH5by6TnMCmB9Fcyzck4JqC+iM5hS4GjSXTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9DPGdZaZuCf6UNBk6+6cYaqVbuMIWJbS9kPFz/pbl8cawf6WKjn8Pcss1YOHN+apNTI98C7C8r8RB2uV3uKknf1q5OE28sWcwNnu1TvM+wDaoSq42gN7P1c9hl9m9+zc6fXkLJN2oh3FucMTHFRLf7ElktgHyxkeWku5P4UgpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cKRyHWXQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cKRyHWXQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E58DC4CEE4;
	Tue, 13 May 2025 08:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747125334;
	bh=AQsw6m7iH5by6TnMCmB9Fcyzck4JqC+iM5hS4GjSXTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cKRyHWXQ1Ci63Evz8Btig3gSKZnRJ2oQPD64QOiVjNS+aHTHvyJl0XrXNKlyfag/Y
	 IOstQmBNvqBol0UBuLeiZXhJsF6MuKwK3FCYmxTd32Mk949NRR06rKkdajNsXLQdVf
	 DTDnPFDBRc43DaZei1QMHRjFhEqlRL+OMwqK+lD7RSfACwPhji6Jn4leHixc+tJRoS
	 fSddiK2SDvfnC/3HTBT8vqH/QOxksGWXHnqrBU1fC9DqiSlYdlCF98SDSQ/yg4Pq6n
	 8XCbpE4CUONrW8BvlicrLpW9NF7IEHcHI5pNnKFalA/D/eC2XYsD1s9nqqom+jMMuD
	 bfxYFaLd9LTiw==
Date: Tue, 13 May 2025 09:35:28 +0100
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Nam Tran <trannamatk@gmail.com>, andy@kernel.org, geert@linux-m68k.org,
	pavel@ucw.cz, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, christophe.jaillet@wanadoo.fr, corbet@lwn.net,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix
 LED driver
Message-ID: <20250513083528.GA2936510@google.com>
References: <aCGPuKtfprIvwADa@smile.fi.intel.com>
 <20250512173800.6767-1-trannamatk@gmail.com>
 <CAHp75VcXmOByVsuwm0m0+FYXoaxBc1CLKtofGgHfB4sMDg+T2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcXmOByVsuwm0m0+FYXoaxBc1CLKtofGgHfB4sMDg+T2A@mail.gmail.com>

On Mon, 12 May 2025, Andy Shevchenko wrote:

> On Mon, May 12, 2025 at 8:38 PM Nam Tran <trannamatk@gmail.com> wrote:
> > On Mon, 12 May 2025 Andy Shevchenko wrote:
> > > On Sat, May 10, 2025 at 02:48:02PM +0700, Nam Tran wrote:
> > > > On Thu, 8 May 2025 Lee Jones wrote:
> > > > > On Thu, 08 May 2025, Andy Shevchenko wrote:
> > > > > > On Thu, May 8, 2025 at 5:27 PM Nam Tran <trannamatk@gmail.com> wrote:
> > > > > > > On Thu, 8 May 2025 Lee Jones wrote:
> > > > > > > > On Thu, 08 May 2025, Andy Shevchenko wrote:
> 
> ...
> 
> > > > I think setting PWM also same as brightness_set API. However, there are
> > > > many PWM config for a LED and it is one of other config to make autonomous mode work.
> > > > Therefore, standard led API can use in some use cases only.
> > > >
> > > > Please see the link below for a better visualization of how to configure the LP5812.
> > > > https://dev.ti.com/gallery/view/LED/LP581x/ver/0.10.0/
> > >
> > > To me it sounds like you should start from the small steps, i.e. do not
> > > implement everything at once. And starting point of the 4 RGB LEDs sounds
> > > the best approach to me. Then, if needed, you can always move on with
> > > fancy features of this hardware on top of the existing code.
> >
> > Thanks for the suggestion.
> > I understand your point and agree that starting with standard LED APIs is the preferred approach.
> >
> > However, the LP5812 hardware offers more advanced features, and I’d like to support end users all
> > features as shown in the link: https://dev.ti.com/gallery/view/LED/LP581x/ver/0.10.0/.
> > It is easy for end user to investigate and use driver.
> 
> I see. Good luck then!
> 
> > If I want to keep the current driver interface to meet this expectation, would it be acceptable
> > to move it to the misc subsystem to better support the hardware?
> 
> Don't ask me, I don't know what you want at the end and I have not so
> much time to invest in this anymore. Only what I'm sure about I
> already expressed in the previous replies and emails.

Briefly spoke to Greg (now Cc:ed).  We can all discuss this together.

My 2c, whilst falling short of deep-diving, is as follows:

1. No one is going to enjoy reviewing a 3k line submission!

   - Instead, submit the smallest driver you can whilst still retaining
     functionality.  It is not good practice to fully enable a
     complicated driver such as this in a single submission - let alone
     a single patch.

2. Hand-rolling your own API from scratch is to be highly discouraged.

   - There seems to be quite a bit of overlap in functionality between
     your bespoke API and LED's.  The LED subsystem already supports a
     lot of what's being implemented here.  Instead of letting the user
     configure the device directly, why not offer some high level
     options and attempt to infer the rest.  If possible, the complexity
     of the device should be handed by driver, rather than placing the
     onus on the user.

3. Shoving this into Misc because you don't want to use the APIs that
   are already offered to you is not a good approach.

-- 
Lee Jones [李琼斯]
