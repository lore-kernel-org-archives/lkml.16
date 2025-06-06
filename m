Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D4A19D06A;
	Fri,  6 Jun 2025 16:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749225753; cv=none; b=XShAB/UVHOSOISs9ur+4bDGdp9rakbg57XsWagaBxiz1ZYAn+XTA+l1KhFAVrAoASoZUOLMEOurwQsOaM57JU84VGqyhDNt+o5WIDvJwD3F8pK6ILQNudLSnwAmFtFU+71QwqHGkkSTMR97mHiFCXmE+6crYJZZV5e1v6GHQ5Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749225753; c=relaxed/simple;
	bh=FtkFOsUKZ50tzy1J+drSGlG/kc9vt2gh8BH5UXSXY54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aP6E34tzBvLHIWjt4ZXGvHS0mPJgpCwV9bvAmoQ1otwmaqa+K+cXqWxWWvjtGzzcerl0li59I3ZDcqEWZEguv8899/j5EYOGXYiCzsSJrrA+Oa2mAD2ydD3vMepRTnZbNbstLjAQkkU8fuEbanJ1AadpMbYSl4/yJPkgxeuZAHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ah0N+mt0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ah0N+mt0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0539C4CEEB;
	Fri,  6 Jun 2025 16:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749225753;
	bh=FtkFOsUKZ50tzy1J+drSGlG/kc9vt2gh8BH5UXSXY54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ah0N+mt0bQyWUkfcpnipbskj7vUEjySkVJ0bp2NR45zIm74a94uwf0b+LiJ7UtBF7
	 Qa9mvMmo0XHnUroIDAd/bxSQOtwjn9+4Nf2Bm+BYTDJ0k172aNq5ZUC7I3PB6jsw3m
	 dtl+0Y/e8KH2I68dTn/gAa41DVeCbknazdlErEL8=
Date: Fri, 6 Jun 2025 18:02:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
Cc: arnd@arndb.de, conor+dt@kernel.org, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v3 3/3] ABI: sysfs: add documentation for ST M24LR EEPROM
 and control interface
Message-ID: <2025060618-errant-audible-4c52@gregkh>
References: <2025060632-luridness-carpool-bf90@gregkh>
 <20250606144657.3140262-1-abd.masalkhi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606144657.3140262-1-abd.masalkhi@gmail.com>

On Fri, Jun 06, 2025 at 02:46:57PM +0000, Abd-Alrhman Masalkhi wrote:
> Hi greg,
> 
> Thanks for the feedback.
> 
> >> +                Behavior:
> >> +                  - If the password matches the internal stored value,
> >> +                    access to protected memory/configuration is granted
> >> +                  - If the password does not match the internally stored value,
> >> +                    it will fail silently
> >
> > Why is the kernel in the business of adding passwords to devices?  That
> > feels wrong, and a way to just flood the device with a "try all the
> > values" attempt if needed.
> 
> You're absolutely right, implementing password-based access in kernel
> space isn't ideal. However, this behavior is defined by the hardware
> itself. The M24LR chips require the user to "unlock" the device by writing
> a password before certain registers become writable (such as the Sector
> Security Status registors) and unfortunately, the chip does not provide
> any status or feedback to indicate whether the unlock was successful,
> which limits what the driver can safely report or validate.
> 
> >> +What:           /sys/bus/i2c/devices/<busnum>-<primary-addr>/sss<N>
> >> +Date:           2025-05-31
> >> +KernelVersion:  6.16
> >> +Contact:        Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
> >> +Description:
> >> +                Read/write attribute representing the Sector Security Status
> >> +                (SSS) byte for EEPROM sector <N> in the M24LR chips. Each sector
> >> +                has one SSS byte, which defines I2c and RF access control via a
> >> +                combination of protection and password settings.
> >> +                Format:
> >> +                  - Read: returns a 8-bit hexadecimal value followed by a
> >> +                          newline
> >> +                  - Write: requires exactly one or two hexadecimal digits
> >> +                      - No "0x" prefix, whitespace, or trailing newline
> >> +                      - Case-insensitive
> >> +
> >> +                Notes:
> >> +                  - Refer to the M24LR chip datasheet for full bit definitions
> >> +                    and usage
> >> +                  - Write access requires prior password authentication in I2C
> >> +                    mode
> >
> > How "deep" does this sysfs tree get here?  This feels like the wrong api
> > for read/write to the device, just do it with a single binary file if
> > you really want a "passthrough" way to get to the hardware.
> 
> The depth of the sysfs tree depends on the M24LR variant. For example,
> the M24LR04E-R has 4 sectors, resulting in 4 entries: sss0 through sss3.
> 
> I understand the concern about exposing multiple sysfs entries. The
> reason for this design is that each sector has its own SSS byte, and
> separating them helps reflect the per-sector nature of the access
> control. That said, I'm open to refactoring this to expose the SSS
> area via a single binary file if that's more in line with expected
> kernel interfaces.

Who and what is going to be talking to this device through this
interface?  Is this unique and special to ONLY this one chip/device or
does it fit in with all other types of this device (i.e. eeproms)?  You
can't create a userspace api without actually having a user at all, so
if there is no userspace code using this, why even have this?

thanks,

greg k-h
