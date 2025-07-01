Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397AE223327;
	Tue,  1 Jul 2025 08:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751360191; cv=none; b=QFtZGYBk37qwsGRSAUQ9Yv5GMLjBQTb+xzt1u1cFRAbhLz6yu5CkpWLTFfpepGCmxalrmoRHBWT77hbqnRwU5ry//yiVoWnH8mufq1+zHKhdlkbONWsHtG1bHxMkbjVw5TI/lk1Glrqb58DaecGUeR0Qk19hTBDwGdUuAGlN1TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751360191; c=relaxed/simple;
	bh=uH6Yw7bGTeucDzsgGjJzwn8ma4BLY0noOggnXGhbx7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJDEH8KdGnMxUj9LlWsm47h56u6jyoLEOIQhPbkudltAuRwY+nFfBSVwiaMtfUceoQUJqAgoYXpEAz9UeJyoEPL8feKHaiOqVgPONtBs4VBN4vft3AZSEMT3deeiIynIh576nbggFs+7gaHqT+inCPvMsuvpWlvuWgQYAgr9PWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V7u19ud0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V7u19ud0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7703C4CEEB;
	Tue,  1 Jul 2025 08:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751360190;
	bh=uH6Yw7bGTeucDzsgGjJzwn8ma4BLY0noOggnXGhbx7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V7u19ud0KQHc/RXrkQcbavbkINfsEfhbE0Lu22PrJjR54sRcsF8sf9fVrOryFwgZ/
	 QdrRZ+DlmPngMUwKUZlSbcarU/amUEdWfWMAdLNTHVgE8oxxFsfG8tT7PNoyScPWJF
	 25f0mTQaWnCcNJd3WsKlGywLgNnVlP+64vO1yhoM+vU8k85TZP+ObsgyFBg+mF++Gu
	 ptAPpP840Omt9L+zpx+D9tv9njuEdRLdHSAVcmBmgi5fIqfv3a2SNbHVp9PC2lG2Kd
	 J37VxIAxDe4KiQlURcpEQive5NyHYkK7cH4VwcZKCWFsf56kEWZdgI3N+K4mKdsdF6
	 PlOjY+LYyPB0A==
Date: Tue, 1 Jul 2025 08:56:27 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Dawid =?utf-8?Q?Nied=C5=BAwiecki?= <dawidn@google.com>
Cc: Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, chromeos-krk-upstreaming@google.com,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Subject: Re: [PATCH] platform/chrome: Add ChromeOS EC USB driver
Message-ID: <aGOiu-sXFj1EUQAB@google.com>
References: <20250624110028.409318-1-dawidn@google.com>
 <aF5N5jrRUlj3SUGS@google.com>
 <CAJ_BA_CppC58kc-Uv49PSmWFcCih-ySuGDuRcO5-AWQQqcqWVQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ_BA_CppC58kc-Uv49PSmWFcCih-ySuGDuRcO5-AWQQqcqWVQ@mail.gmail.com>

On Mon, Jun 30, 2025 at 01:59:39PM +0200, Dawid Niedźwiecki wrote:
> On Fri, Jun 27, 2025 at 9:53 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> > On Tue, Jun 24, 2025 at 11:00:28AM +0000, Dawid Niedzwiecki wrote:
> > > +     /*
> > > +      * Do not register the same EC device twice. The probing is performed every
> > > +      * reboot, sysjump, crash etc. Recreating the /dev/cros_X file every time
> > > +      * would force all application to reopen the file, which is not a case for
> > > +      * other cros_ec_x divers. Instead, keep the cros_ec_device and cros_ec_usb
> > > +      * structures constant and replace USB related structures for the same EC
> > > +      * that is reprobed.
> > > +      *
> > > +      * The driver doesn't support handling two devices with the same idProduct,
> > > +      * but it will never be a real usecase.
> > > +      */
> >
> > I don't quite understand why does it need to memorize the registered ECs.
> > Supposedly, the probe function is only called few times during booting, and
> > gets success once. Hot-plugs?
> >
> 
> The probe is called every time the EC device boots from the beginning
> - sysjumps, crashes, reboots etc. It succeeds the first time.
> Once the /dev/cros_X file is created, we need the possibility to
> access the same EC device, with the same, previously created file.
> The only way to do that is to reused the already created
> cros_ec_device structure.

What are the shortcomings if it re-creates /dev/cros_X everytime? Isn't it
also a way for userland programs to be aware of the EC device crashes?

Why other cros_ec_X drivers doesn't need the mechanism?
