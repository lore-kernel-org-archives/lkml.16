Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D712E9EC2;
	Wed, 18 Jun 2025 13:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750254134; cv=none; b=KF5Ata3P6ueNoy87KKkUwENNRdLTqg8IXcuVjdOlvdbnfu5RaEL9VX8wyDAyuoZ8g+sKJV5fcyLpILhjrqvJaMpYvBw2zol+rwldWdUG35vk+AC54vNfm+auEym2hPqA2TCK5aBEoHDNM028DYkkeGuyjzY9lsMSm6gLfihnhxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750254134; c=relaxed/simple;
	bh=+/9JNRHrrflAEaSZltKiWrNUc19NmRK7tSUbSJiDoUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oY8LCFf4wVMTJWu6wdgDXEOs/teSTwHn2x7n+PuBRQi9Ti2x278eGD7qHpauZTI30vd4TANRkdmllgFejKlqz9MvGMf7mFMzzNF05ms0A3CT6V1cQ0n+LA/e2C+F1soT7mEovUhtJp72m2JnO/KA6C4aeN1dCKVJvCAMQjH4VZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VmNVePEf; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VmNVePEf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750254131; x=1781790131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+/9JNRHrrflAEaSZltKiWrNUc19NmRK7tSUbSJiDoUA=;
  b=VmNVePEfwl05i29Vg/P5PNTztpqFOE0n41uV0BjvF6s8hBvQmkyAOztG
   xbbubOtZcxVTH/mkxdb51fWhbKULDp1GhY+CFI3/GvU7OiJgS21/mYud6
   VysGKyfQ5OvNscbw3XWp47WxurxGf8dUsvzRFNXItSEaQfAjZe6FR25uP
   DZUImPuEwNp6ydrTJclD38rhUC3yVyh2yHD0NvYEA8LEz712jmIkLHZkN
   0mTF9PTabAe0RI/y/8heAJEERgXZstxgRY/bo2CUnWis7sYCybVOjfNQg
   jxRLMup96qwLdNms8q1VU3iEvCKcf+Kl6zOd+50h6Q62NIx62hD3xG6kT
   A==;
X-CSE-ConnectionGUID: e0BLjHp3R7y4tx9ohmYIGw==
X-CSE-MsgGUID: CQcsMMH8TCu3xTP6UwFejQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63825019"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="63825019"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 06:42:10 -0700
X-CSE-ConnectionGUID: 8ogvd9bFTnaJH720L8lF9Q==
X-CSE-MsgGUID: G5sord/TRaat0dMUjMxlqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="180632964"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa001.fm.intel.com with SMTP; 18 Jun 2025 06:42:05 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 18 Jun 2025 16:42:04 +0300
Date: Wed, 18 Jun 2025 16:42:04 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	RD Babiera <rdbabiera@google.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH 04/10] usb: typec: Expose alternate mode priorities via
 sysfs
Message-ID: <aFLCLL_7Ov8J9Wdx@kuha.fi.intel.com>
References: <20250616133147.1835939-1-akuchynski@chromium.org>
 <20250616133147.1835939-5-akuchynski@chromium.org>
 <aFE6dnxet4_sm8b1@kuha.fi.intel.com>
 <CAMMMRMdwUyxdMy42tA_ccYo77nf=6C+KgokDLHBLEYDa5aOHQw@mail.gmail.com>
 <2025061727-crinkle-drew-4a0d@gregkh>
 <CANFp7mVWo4GhiYqfLcD_wFV34WMkmXncMTOnmMfnKH4vm2X8Hg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANFp7mVWo4GhiYqfLcD_wFV34WMkmXncMTOnmMfnKH4vm2X8Hg@mail.gmail.com>

Hi Abhishek,

On Tue, Jun 17, 2025 at 07:47:18PM -0700, Abhishek Pandit-Subedi wrote:
> On Tue, Jun 17, 2025 at 6:28 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Jun 17, 2025 at 02:38:04PM +0200, Andrei Kuchynski wrote:
> > > On Tue, Jun 17, 2025 at 11:50 AM Heikki Krogerus
> > > <heikki.krogerus@linux.intel.com> wrote:
> > > >
> > > > On Mon, Jun 16, 2025 at 01:31:41PM +0000, Andrei Kuchynski wrote:
> > > > > This sysfs attribute specifies the preferred order for enabling
> > > > > DisplayPort alt-mode, Thunderbolt alt-mode, and USB4 mode.
> > > > >
> > > > > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > > > > ---
> > > > >  Documentation/ABI/testing/sysfs-class-typec | 17 ++++
> > > > >  drivers/usb/typec/Makefile                  |  2 +-
> > > > >  drivers/usb/typec/class.c                   | 26 ++++++
> > > > >  drivers/usb/typec/class.h                   |  2 +
> > > > >  drivers/usb/typec/mode_selection.c          | 93 +++++++++++++++++++++
> > > > >  drivers/usb/typec/mode_selection.h          |  5 ++
> > > > >  include/linux/usb/typec_altmode.h           |  7 ++
> > > > >  7 files changed, 151 insertions(+), 1 deletion(-)
> > > > >  create mode 100644 drivers/usb/typec/mode_selection.c
> > > > >  create mode 100644 drivers/usb/typec/mode_selection.h
> > > > >
> > > > > diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
> > > > > index 38e101c17a00..46eee82042ab 100644
> > > > > --- a/Documentation/ABI/testing/sysfs-class-typec
> > > > > +++ b/Documentation/ABI/testing/sysfs-class-typec
> > > > > @@ -162,6 +162,23 @@ Description:     Lists the supported USB Modes. The default USB mode that is used
> > > > >               - usb3 (USB 3.2)
> > > > >               - usb4 (USB4)
> > > > >
> > > > > +What:                /sys/class/typec/<port>/altmode_priorities
> > > > > +Date:                June 2025
> > > > > +Contact:     Andrei Kuchynski <akuchynski@chromium.org>
> > > > > +Description: Lists the alternate modes supported by the port and their
> > > > > +             priorities. The priority setting determines the order in which
> > > > > +             Displayport alt-mode, Thunderbolt alt-mode and USB4 mode will be
> > > > > +             activated, indicating the preferred selection sequence. A value of -1
> > > > > +             disables automatic entry into a specific mode, while lower numbers
> > > > > +             indicate higher priority. The default priorities can be modified by
> > > > > +             assigning new values. Modes without explicitly set values default to -1,
> > > > > +             effectively disabling them.
> > > > > +
> > > > > +             Example values:
> > > > > +             - "USB4=0 TBT=1 DP=2"
> > > > > +             - "USB4=-1 TBT=0"
> > > > > +             - "DP=-1 USB4=-1 TBT=-1"
> > > >
> > > > No. If you want to disable entry to a mode by default, then you
> > > > deactivate that mode, so -1 is not needed. USB4 is also not an alt
> > > > mode, so this at the very least should be named differently.
> 
> USB4 should be called an alt-mode though based on its behavior and I
> think the spec makes a mistake not doing so. It's mutually exclusive
> with alternate modes, it modifies the functionality of the data lanes
> and it's not a new data mode (just a tunneling protocol). But that's
> an aside for this patch...

It's still a big no from me for this one as it is, sorry. You are
trying to achieve too many things with these files.

The first thing here is that you want to offer the user a way to
define the order in which the modes are entered, and that's actually
something that we do *not* have any support for at the moment. I'm not
against this part. As long as you justify the need for this, and
ideally offer a way to setup the priorities also in tcpm.c, I'm okay
with it. But you do need to justify the need for this IMO. The specs
actually dictate the order in which these modes should be entered does
it not

But the second part is that you want to also use this file to disable
the modes. For that we do have the mechanisms already in place, so
there is no point in trying to include that here. It does not even
sound like the primary goal for you - your main goal is to just be
able to define the order, right?

So this is my suggestion: Change this so that you can only supply the
preferred order for the modes - the priorities. Get rid of the numeric
values - by simply listing the modes in the file becomes more machine
readable while still being perfectly human readable.

And the name. I agree that USB4 should be an alt mode, but it's not.
This should really be a no-brainer. Just s/altmode/mode/. That way
the naming is aligned with what you are proposing in patch 5/6.

> > > > But I'm not sure this is the correct way to handle the modes in
> > > > general. Can you please explain what exactly is the use case you are
> > > > thinking?
> > >
> > > Hi Heikki,
> > >
> > > This implements the mode selection logic within the kernel, replacing
> > > its userspace counterpart. Implementing this in the kernel offers
> > > advantages, making the process both more robust and far easier to
> > > manage.
> > > This eliminates the need for user space to verify port, partner, or
> > > cable capabilities, and to control the mode entry process. User space
> > > doesn't even need to know if USB4 mode is supported by the port or
> > > partner; unsupported modes are automatically skipped.
> >
> > But that's all things that userspace can do, so it should be doing it.
> > You need to justify why userspace can NOT do something in order to move
> > that logic into the kernel.
> 
> Userspace "can" do it but it is not doing it today. There is no
> userspace alt-mode manager (that I'm aware of) that's writing to
> /sys/class/typec (typecd in ChromeOS only reads and does mode
> entry/exit via a sideband mechanism) and boltd (userspace thunderbolt
> manager; https://github.com/gicmo/bolt) only deals with tunnels and
> not mode entry directly.
> 
> I think the inclusion of TBT and USB4 in the kernel makes this change
> necessary and the existing way of doing it is not widely used yet.
> 
> >
> > > User space's role is now limited to high-level tasks like security,
> > > with the kernel managing technical implementation. Mode selection and
> > > activation can occur without user space intervention at all if no
> > > special rules apply and the default policy (USB4 -> TBT -> DP) is
> > > acceptable.
> >
> > What is wrong with "userspace intervention"?  Is the current api broken
> > somehow?
> 
> There were some previous discussions on this:
> https://lore.kernel.org/linux-usb/ZyjW0CMXgGIt-usC@kuha.fi.intel.com/
> https://lore.kernel.org/chrome-platform/CAA8EJpqiF_0bgYT8boFa4UPJWcxgw89mmfbdMVKeAP-xnFOP4g@mail.gmail.com/
> 
> Some background:
> * The Type-C port driver will add a partner alt-mode to the altmode bus.
> * An altmode driver will probe and attach if available on the system.
>     * Currently, the probe function of these altmode drivers always
> enter the given mode. The expectation is that if a system allows mode
> override, it should always be done by the alt mode driver. This
> doesn't scale beyond one alt-mode driver – between DP and TBT, which
> altmode driver should win entry? Prior to TBT driver being added in
> December and USB4 support circa similar time frame, DP was always the
> default choice if override was supported.
>     * Userspace could make this decision but then what about USB4? The
> current APIs don't expose USB4 information in the same way and the
> auto-enter behavior is different (it doesn't enter).
> 
> In a lot of existing designs, mode entry is entirely handled by the
> firmware and no mode selection is possible from the kernel. This is
> covered by patch 3 of this series (alt_mode_override) flag. Windows
> designs usually fall into this category as they use PD controllers
> implementing UCSI (and usually a very old UCSI version 1.2).
> 
> A few designs allow overriding the current mode:
> * Chromebooks with cros_ec_ucsi which support Thunderbolt will allow
> override of the alternate mode (via UCSI set_new_cam) and USB mode
> (via UCSI Set_USB). They will enter DPAM instead of TBT by default if
> possible.
> * Chromebooks with the cros_ec_typec driver which support Thunderbolt
> will require the OS to make the mode entry decision (no mode entry by
> default on attach).
> * Pixel phone TCPM currently requires mode entry from the kernel as
> there's no userspace mode selection component.
> * Potentially some Windows designs that implement AltMode override via
> UCSI (ucsi_acpi). These should behave similarly to cros_ec_ucsi but
> will likely automatically enter TBT mode.
> 
> In these cases, the kernel is a better place to make alternate mode decisions:
> * Quicker than having a userspace implementation (and more consistent
> during boot).
> * Works consistently across drivers and accounts for both overridable
> and non-overridable systems.
> 
> The main thing userspace should really be doing with mode entry is
> setting policy around what modes they want to enter instead of doing
> low level checking of compatibility and sequencing of mode entry
> operations. And the main policy we're trying to enforce on ChromeOS is
> to not enter TBT by default (based on our security posture described
> at https://www.chromium.org/chromium-os/developer-library/reference/security/usb4/).
> 
> Given that Thunderbolt altmode driver support and USB4 support was
> only added around December of last year, I don't imagine there are
> many userspace usages yet and we should fix these API issues before
> they become too widely used. I think mode sequencing belongs in the
> kernel and not userspace.

My two cents - I'm sure this is clear to most of you, but not to
everybody.

The problem with the USB Type-C framework that I wrote is that it was
primary designed to support tcpm.c, but unfortunately it does not work
very well with the PD controllers when it comes to the alternate modes.

With tcpm.c we need to handle the alternate mode communication inside
kernel, but with PD controller we of course can't do that. The altmode
bus and altmode drivers are not needed with PD controllers, in fact
they only complicate things with the PD controllers.

So there are basically two separate ways of handling the same thing.
That's why I think we may need something like these files that you
guys are suggesting. We need a way to support the controlling of
alternate modes with PD controllers, or perhaps I should say
with interfaces that support it.

But that said, this series is not acceptable as it is quite yet. You
are trying to push a lot of information and control to these couple of
files which I'm not convinced is always necessary, and possibly even
prone to errors. I'm also really concerned that you want to only deal
with a predefined list of modes. It will probable not be a problem as
long as we can fallback to ABI that we already have. But during my
short career I've already seen several cases where assumptions have
been made about how a specific technology will be used, and it has in
practice always backfired.

thanks,

-- 
heikki
