Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56D01C6B4;
	Wed,  2 Jul 2025 03:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751428687; cv=none; b=BrKaR5Lo3GkpfIxDvntmAllhvhF/dAgtI9+jNFnGb3jUTuqJrbGzYsSeRvJlSqQdA8DEhTBSmxiPteZTMqwwG/tY9mUNCugOhtBc0lmJUB7qJoW59uQs575cOrDwNazqsK8G/hURKLsEspGFSH/gipcMFc+piILyOGjf2F51mmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751428687; c=relaxed/simple;
	bh=w2dfqLUduE1K0tzjQWf6mTcs+MvqxhPTIhPYmuODJXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RzJCTsPBluee13pwk+rkTsqd4x6rnuToKTHSi2Up8rMT4lmXaxX1454QtoPgK3wlD8KNgQgpMtJJoiWdTZ/fxfx28f4gO2HEuhgbco7n0eJLU5heydzo48e9+q7YnLaTBZ1o9I7bGSe8FWyPHSYJTAD6pwpFo8M0gu5oajXLE5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BeMgVi2/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BeMgVi2/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B68C4CEEF;
	Wed,  2 Jul 2025 03:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751428686;
	bh=w2dfqLUduE1K0tzjQWf6mTcs+MvqxhPTIhPYmuODJXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BeMgVi2/lPqbzjgKLEoGx42J082sAksCfmSnOszZYoztWaretvEIpY27FFoA16INS
	 fu647AtLzup1BkBD/kb6Q29r8GWpfa/JataNh8mcuBZObqPFnOs0dbxlkGeMFWUxW9
	 dBthWztZBRTXx5NzwUsX4nlkrVYz7/h1aSmvoC8EdmdobXWgRLJLjzD4u3/au8/bUv
	 z2nxXc3XlXDv1JHY7yNDvfXpXt4fr3wM6VN9xip1S83300xwvskIEIKsDWX6YSu+Oy
	 /HQEIO5s/YNs2orrbssXPI/+z4Kab9v+5REycyCndRxYW4OlVsVAcycwDsnUrEo+X1
	 bnPAZlZN31aVw==
Date: Wed, 2 Jul 2025 03:58:03 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Dawid =?utf-8?Q?Nied=C5=BAwiecki?= <dawidn@google.com>
Cc: Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, chromeos-krk-upstreaming@google.com,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Subject: Re: [PATCH] platform/chrome: Add ChromeOS EC USB driver
Message-ID: <aGSuS81Psqm_Ie4N@google.com>
References: <20250624110028.409318-1-dawidn@google.com>
 <aF5N5jrRUlj3SUGS@google.com>
 <CAJ_BA_CppC58kc-Uv49PSmWFcCih-ySuGDuRcO5-AWQQqcqWVQ@mail.gmail.com>
 <aGOiu-sXFj1EUQAB@google.com>
 <CAJ_BA_CZWvC2=i8riNe5LReLKzPXK1vPwymiG2dzLEntda7TRg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ_BA_CZWvC2=i8riNe5LReLKzPXK1vPwymiG2dzLEntda7TRg@mail.gmail.com>

On Tue, Jul 01, 2025 at 12:29:51PM +0200, Dawid Niedźwiecki wrote:
> >What are the shortcomings if it re-creates /dev/cros_X everytime?
> 
> In that case, to avoid memory leakage, you would need to free the
> cros_ec_device structure every disconnect.
> An application with an opened cros_ec file would try to access the
> freed resources (use-after-free) via the char driver [1], e.g.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/chrome/cros_ec_chardev.c#n345
> 
> It would also require additional work from the userspace application
> e.g. reopen the cros_ec file every time there was a communication
> problem. I think recovering an already created file sounds like a
> better idea.
> 
> > Isn't it also a way for userland programs to be aware of the EC device crashes?
> 
> No. First of all, we don't know a reason for the disconnect / reprobe,
> so it is not always a crash. Also we signal that there is a problem
> with the connection by returning -ENODEV when an EC device is
> disconnected.
> There are dedicated commands to check reboot reason, and detect
> potential crashes.
> 
> > Why other cros_ec_X drivers doesn't need the mechanism?
> 
> It is a very USB specific problem. USB host/hub detects a new device
> on the bus and starts probing procedure.
> It is not a case for other drivers, e.g. SPI probes only once, at the
> beginning of the boot, based on ACPI entry, there is no hardware
> detection that a device is alive after reboot.
> Additionally, the USB related structures are new every probe, so we
> need to replace those.

Please don't top-posting [2]. The discussion thread is somehow messed.

[2]: https://docs.kernel.org/process/submitting-patches.html#use-trimmed-interleaved-replies-in-email-discussions

> On Tue, Jul 1, 2025 at 10:56 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > On Mon, Jun 30, 2025 at 01:59:39PM +0200, Dawid Niedźwiecki wrote:
> > > On Fri, Jun 27, 2025 at 9:53 AM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> > > > On Tue, Jun 24, 2025 at 11:00:28AM +0000, Dawid Niedzwiecki wrote:
> > > > > +     /*
> > > > > +      * Do not register the same EC device twice. The probing is performed every
> > > > > +      * reboot, sysjump, crash etc. Recreating the /dev/cros_X file every time
> > > > > +      * would force all application to reopen the file, which is not a case for
> > > > > +      * other cros_ec_x divers. Instead, keep the cros_ec_device and cros_ec_usb
> > > > > +      * structures constant and replace USB related structures for the same EC
> > > > > +      * that is reprobed.
> > > > > +      *
> > > > > +      * The driver doesn't support handling two devices with the same idProduct,
> > > > > +      * but it will never be a real usecase.
> > > > > +      */
> > > >
> > > > I don't quite understand why does it need to memorize the registered ECs.
> > > > Supposedly, the probe function is only called few times during booting, and
> > > > gets success once. Hot-plugs?
> > > >
> > >
> > > The probe is called every time the EC device boots from the beginning
> > > - sysjumps, crashes, reboots etc. It succeeds the first time.
> > > Once the /dev/cros_X file is created, we need the possibility to
> > > access the same EC device, with the same, previously created file.
> > > The only way to do that is to reused the already created
> > > cros_ec_device structure.
> >
> > What are the shortcomings if it re-creates /dev/cros_X everytime? Isn't it
> > also a way for userland programs to be aware of the EC device crashes?
> >
> > Why other cros_ec_X drivers doesn't need the mechanism?

Copied your reply here:

> >What are the shortcomings if it re-creates /dev/cros_X everytime?
> 
> In that case, to avoid memory leakage, you would need to free the
> cros_ec_device structure every disconnect.
> An application with an opened cros_ec file would try to access the
> freed resources (use-after-free) via the char driver [1], e.g.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/chrome/cros_ec_chardev.c#n345
> 
> It would also require additional work from the userspace application
> e.g. reopen the cros_ec file every time there was a communication
> problem. I think recovering an already created file sounds like a
> better idea.

They doesn't look like shortcomings to me. The corresponding destructor
callbacks have to be called when a device is removed anyway.

Instead, re-using the same inode for the userland interface however
*silently* swapping the underlying devices makes less sense to me.

> > Isn't it also a way for userland programs to be aware of the EC device crashes?
> 
> No. First of all, we don't know a reason for the disconnect / reprobe,
> so it is not always a crash. Also we signal that there is a problem
> with the connection by returning -ENODEV when an EC device is
> disconnected.
> There are dedicated commands to check reboot reason, and detect
> potential crashes.

My point here is: to let userland programs be aware of the underlying
device has been removed.

What are the reasons for disconnect and reprobe? From your previous message
and code comment, are they "reboot, sysjump, crash"? Would it happen
frequently after AP boot?

Note: we are talking about a EC-like device here. For a real EC either reboot
or crash, the AP will be reset.

> > Why other cros_ec_X drivers doesn't need the mechanism?
> 
> It is a very USB specific problem. USB host/hub detects a new device
> on the bus and starts probing procedure.
> It is not a case for other drivers, e.g. SPI probes only once, at the
> beginning of the boot, based on ACPI entry, there is no hardware
> detection that a device is alive after reboot.

No, I don't think so. I think all EC-like devices share the same concern
regardless of the transport medium (e.g. SCP over RPMSG, ISH over ISHTP).
