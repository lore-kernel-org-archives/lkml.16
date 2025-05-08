Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1938D22B590;
	Thu,  8 May 2025 13:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746710826; cv=none; b=TgWXDlSxCQxZpVWzCX8NnO52CfQheaTfMZ1XPtRCs01GdJ7oqcabEKZpQUaUeElFqGW5qQMPHDFjLAKgPMewbkPjYgXtnKvaQt5Lin5bfbBKHUuJI07/wSIsnTSlZzFVqAqVb1b7k2EJNL16/BacfUPDay0GG0EfcTcMtfLYlW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746710826; c=relaxed/simple;
	bh=dPpL/RWC7aL+EKekjxh/7eMQ479I+XUcW0IXz2XLt8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bIvIbKOtZlCPyd/fbMcBSPXCbDAzWOK+1oyY6MvRPvT3WhFoO/ddLFxC0YYOITjFaXmdiBTh85l7+nwZFqB/LX2LEyhaPo2WtuUVO2BgkDTYwA/eJNCtfPtbFiqS5cvYUn+um2ZK3iMxFN3iVtZajogZoo02FapG5tkrjHFKKso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BV0fRHlB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BV0fRHlB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 549C5C4CEE7;
	Thu,  8 May 2025 13:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746710825;
	bh=dPpL/RWC7aL+EKekjxh/7eMQ479I+XUcW0IXz2XLt8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BV0fRHlBCWobhfz8aMfe76eeZjjYo7R0yyCt4IKD8iUc7zvi3nuL+J0y7a5GVmNpN
	 GHHIrGC4O/f/55i/H6Zhge8FiwqRMlz31Vt7ufJbEILC8XKa4MseEuDxDac6/d/HWf
	 Pk/bwzw6aecim4iR1GVsXRJ6BvBjlHGa5GNLTHSNA7+V1CoiyG5ArUI8VSGSUlNJHZ
	 CAFjzPh1GX45eJCZYHg8NZPKHvln9eHI8SvQTDYoHvJ8NOJ+K+l8lWSlVq4cGvaUSa
	 4AS+OmW+HtQchYfdgS2uw3395A+D8KuUieSSrw7geSTsMQWYMbx5prxQwQ1ADGlHfQ
	 pwc1IZL1ktqwA==
Date: Thu, 8 May 2025 14:26:59 +0100
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Nam Tran <trannamatk@gmail.com>, andy@kernel.org, geert@linux-m68k.org,
	pavel@ucw.cz, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, christophe.jaillet@wanadoo.fr, corbet@lwn.net,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix
 LED driver
Message-ID: <20250508132659.GL3865826@google.com>
References: <CAHp75VcVmTwS-zw=o5=m1-x0XC67BKBVWae2mMKZQH=qLCxZwg@mail.gmail.com>
 <20250507164219.10083-1-trannamatk@gmail.com>
 <CAHp75VcNuXouL25ZRiym97AjR9249=ENMPFDQ7imZ_ZoeKc3Ng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcNuXouL25ZRiym97AjR9249=ENMPFDQ7imZ_ZoeKc3Ng@mail.gmail.com>

On Thu, 08 May 2025, Andy Shevchenko wrote:

> First of all, I just noticed that you excluded Lee from the
> distribution list. Don't do that as he is a stakeholder here as well
> since it has not been decided yet where to go with your stuff.
> 
> On Wed, May 7, 2025 at 7:42 PM Nam Tran <trannamatk@gmail.com> wrote:
> > On Tue, 29 Apr 2025 Andy Shevchenko wrote:
> > > On Tue, Apr 29, 2025 at 8:02 PM Nam Tran <trannamatk@gmail.com> wrote:
> > > > On Mon, 28 Apr 2025 Pavel Machek wrote:
> > > > > > On Mon, 28 Apr 2025 Geert Uytterhoeven wrote:
> > > > >
> > > > > > > > > > - Move driver to drivers/auxdisplay/ instead of drivers/leds/.
> > > > > > > > > > - Rename files from leds-lp5812.c/.h to lp5812.c/.h.
> > > > > > > > > > - Move ti,lp5812.yaml binding to auxdisplay/ directory,
> > > > > > > > > >   and update the title and $id to match new path.
> > > > > > > > > > - No functional changes to the binding itself (keep Reviewed-by).
> > > > > > > > > > - Update commit messages and patch titles to reflect the move.
> > > > > > > > > > - Link to v7: https://lore.kernel.org/linux-leds/20250422190121.46839-1-trannamatk@gmail.com/
> > > > > > > > >
> > > > > > > > > Out of sudden without discussing with auxdisplay maintainers/reviewers?
> > > > > > > > > Thanks, no.
> > > > > > > > > Please, put into the cover letter the meaningful summary of what's
> > > > > > > > > going on and why this becomes an auxdisplay issue. Brief review of the
> > > > > > > > > bindings sounds more likely like LEDS or PWM subsystems.
> > > > > > > >
> > > > > > > > It is 4x3 matrix. That means it is not suitable for LEDs. I don't
> > > > > > > > believe it is suitable for PWM, either -- yes, it is 36 PWM outputs,
> > > > > > > > but...
> > > > > > >
> > > > > > > Is it intended to be used as a 4x3 matrix, or is this just an internal
> > > > > > > wiring detail, and should it be exposed as 12 individual LEDs instead?
> > > > > >
> > > > > > The 4×3 matrix is a real and fundamental aspect of the LP5812’s operation.
> > > > > > It is not just an internal wiring detail.
> > > > > > The device adopts a Time-Cross-Multiplexing (TCM) structure, where 4 output
> > > > > > pins control 12 LED dots individually through scanning. Each pin includes
> > > > > > both high-side and low-side drive circuits, meaning matrix multiplexing is
> > > > > > required for proper operation — it cannot be treated as 12 completely
> > > > > > independent LEDs.
> > > > >
> > > > > Scanning is really a detail.
> > > > >
> > > > > If this is used as rectangular 4x3 display, then it goes to auxdisplay.
> > > > >
> > > > > If this is used as a power LED, SD activity LED, capslock and numlock
> > > > > ... placed randomly all around the device, then it goes LED subsystem.
> > > >
> > > > The LP5812 is used for LED status indication in devices like smart speakers,
> > > > wearables, and routers, not as a structured rectangular display.
> > > >
> > > > Given that, it seems to match the LED subsystem better than auxdisplay, doesn't it?
> > >
> > > I have mixed feelings about all this. As per hardware organisation it
> > > sounds more like a matrix (for example. keyboard), where all entities
> > > are accessed on a scanline, but at the same time each of the entities
> > > may have orthogonal functions to each other. Have you checked with DRM
> > > for the sake of completeness?
> > > Personally I lean more to the something special, which doesn't fit
> > > existing subsystems. Auxdisplay subsystem more or less about special
> > > alphanumeric displays (with the exception of some FB kinda devices,
> > > that were even discussed to have drivers be removed). Also maybe FB
> > > might have something suitable, but in any case it looks quite
> > > non-standard...
> >
> > I understand your mixed feelings about where the LP5812 fits within
> > the existing subsystems.
> >
> > While the LP5812 uses a matrix-based structure for controlling LEDs,
> > it is not intended for displaying structured text or graphics. Instead,
> > it controls up to 4 RGB LEDs for status indication, where each RGB LED
> > consists of 3 individual color LEDs: red, green, and blue. Based on this,
> 
> So, you probably should have started with this. As I read above that
> this has to reside in drivers/leds/rgb for colour ones which seems to
> me closest to your case. On top you might add an upper level
> management to prevent users from using patterns whenever the LEDs are
> requested individually. So, this driver should represent 4 RGB leds
> and, possibly, the upper layer with those fancy stuff like breathing.
> 
> At least, based on the above it's my formal NAK from an auxdisplay perspective.

This is fine.

Just be aware, before you submit to LEDs again, that you need to use
what is available in the LEDs subsystem to it's fullest, before
hand-rolling all of your own APIs.  The first submission didn't use a
single LED API.  This, as before, would be a big NACK also.

-- 
Lee Jones [李琼斯]
