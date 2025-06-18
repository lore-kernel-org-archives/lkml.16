Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB1972606
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750273273; cv=none; b=RVU2GJbmbej0CnASG6ycJGDtPeRbtrxSXTbHdc1NkeUw436PUE6Sb/34XDAEl4gmXKYs0vpTfvx/fdJ892xMGU0UMhd/mfKeIy9HdGbk43Q3kMiHIubr0Zq5z+9Xxv/1wYbz3DFgOD/JpKVM2Ig3ku0SPiEojmzepvEiGetgzGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750273273; c=relaxed/simple;
	bh=GzWAQptLgrT0zD7Fj8+5KQBzafGtjHnio2uIakL7Yuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EmcTeavk2nfUB/XqZ/7pAvpv5ZgDQ/5+/ghX2KBms2itQjM0PG3YiQ5iiStYto2YkHBqwP+NrjBeEN0tKXdJc3MeT+ueRsfEdY5y4FqNWRbSVIJHlOo/p8i39dAS/q3ku5nZyIyuDJI3e8Pt426Oq8F6Yg2BBgQSV6/3wT6t4Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MtD2ch0z; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MtD2ch0z"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-70b4e497d96so68509677b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750273270; x=1750878070; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vS9LiE9yg5H5vdEjfnlTjqMOIW7xWKvw8zFalK7zffI=;
        b=MtD2ch0zK0yfOfR3SsOhACtwqZuupB0PjjcK+CfvOH+PP1RiZPUlx2MEnfR2OnfI9T
         6uYlEwecYJ2p/rOInJ56TyG//hqdwTEu028Py989qjOiMOFbrYO7w7gC/dOcrRuwOSxE
         VCf7S75K/jk60Opv/d2CeRtW/XWLJPNGAjamY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750273270; x=1750878070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vS9LiE9yg5H5vdEjfnlTjqMOIW7xWKvw8zFalK7zffI=;
        b=pTvsFD3vfe+w9soqkdchiYOadS93B1RY+KzutfYHIDf/e/OfdihYTFpcnVA4P+1PqA
         gsE6rbA+5pTygi0v/wUeJ8r6HOjt3delLf///hoqSd5Xt2gH5pdeOx9hPA/r28x2euzS
         DbUCZfYB/laZN8rMu54/SarMEtLSPuHK4Jrl3F8YJUe8Y44L5YAy6GCKLfx2OEJDYAPZ
         AsAsrdWlnLS3gS66zICQSFFTM2Wyl9pmy3hXXRbRxbJ1Q4FFDew7fy8Ngzja9QoKXbtU
         Hh+WrM9MaA9pzc6xsg1Z8qE9IrY06NQM6QRD0tHiPofTTg+4cwat1omIgmbwNjjzqJVu
         V31A==
X-Forwarded-Encrypted: i=1; AJvYcCWZmP830Baa3c7X0VyczWVNMDfmPZ2dZbyuN4TvW/a1Zxamtg/cHyzJzw54hdCjBP9DISaJ97yWSFuwKbY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpPO0RK53cDiKVnKRXItJZ/2PXmrbWHvYumNyYKC5YgzNwoG9T
	8ojVGnImCK9L9cVy0PmLP2LQSdGcYybHlmapAK8/Q0kHVSw03actFcXQwjWvHl74MDRx1nnEKBZ
	ojSMZLFpwJAZMzjHMdz9GgcAHvcGb3a+VKhtUYjB6
X-Gm-Gg: ASbGncvp5oxV7f4f54eTXuYKkuEeezl4BlA6af7bPGraa2OdXUdvTnqbZxBhIz0qWPp
	C6/tyP7SEojQDUeDiBZK3MK4OAQH6t0Mah2qzuaPeOPbqRzc1zw+fweQkBu0TXAkdXFv59+XMfS
	olNRnkSzCwcfYFp9Smb+bOS6kXiYJRsStX9OJFhZ+eIHukoC1GIXub1w==
X-Google-Smtp-Source: AGHT+IGCe1DqC/GjhqJ2Yd7Vx4AAgaHiqdSHNCnAd8/ol8H17ka4BdKNqAzTjSK52dNVLRkHV49GbXLPbaiv6w3hH0Q=
X-Received: by 2002:a05:690c:670a:b0:70e:923:2173 with SMTP id
 00721157ae682-711753a1fcemr219699257b3.5.1750273269822; Wed, 18 Jun 2025
 12:01:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616133147.1835939-1-akuchynski@chromium.org>
 <20250616133147.1835939-5-akuchynski@chromium.org> <aFE6dnxet4_sm8b1@kuha.fi.intel.com>
 <CAMMMRMdwUyxdMy42tA_ccYo77nf=6C+KgokDLHBLEYDa5aOHQw@mail.gmail.com>
 <2025061727-crinkle-drew-4a0d@gregkh> <CANFp7mVWo4GhiYqfLcD_wFV34WMkmXncMTOnmMfnKH4vm2X8Hg@mail.gmail.com>
 <aFLCLL_7Ov8J9Wdx@kuha.fi.intel.com>
In-Reply-To: <aFLCLL_7Ov8J9Wdx@kuha.fi.intel.com>
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date: Wed, 18 Jun 2025 12:00:58 -0700
X-Gm-Features: Ac12FXxmMg4f17aNkb7AAVjT_oP9JqRrd5zhOoVRN3BCBtjAJ7nAX9nvTsTLl4I
Message-ID: <CANFp7mVGA1zBd=OYFrfzd-WiWtQpVXpcWgdH19hdVsxVbr3aYg@mail.gmail.com>
Subject: Re: [PATCH 04/10] usb: typec: Expose alternate mode priorities via sysfs
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrei Kuchynski <akuchynski@chromium.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	Pooja Katiyar <pooja.katiyar@intel.com>, Badhri Jagan Sridharan <badhri@google.com>, 
	RD Babiera <rdbabiera@google.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 6:42=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Abhishek,
>
> On Tue, Jun 17, 2025 at 07:47:18PM -0700, Abhishek Pandit-Subedi wrote:
> > On Tue, Jun 17, 2025 at 6:28=E2=80=AFAM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Jun 17, 2025 at 02:38:04PM +0200, Andrei Kuchynski wrote:
> > > > On Tue, Jun 17, 2025 at 11:50=E2=80=AFAM Heikki Krogerus
> > > > <heikki.krogerus@linux.intel.com> wrote:
> > > > >
> > > > > On Mon, Jun 16, 2025 at 01:31:41PM +0000, Andrei Kuchynski wrote:
> > > > > > This sysfs attribute specifies the preferred order for enabling
> > > > > > DisplayPort alt-mode, Thunderbolt alt-mode, and USB4 mode.
> > > > > >
> > > > > > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > > > > > ---
> > > > > >  Documentation/ABI/testing/sysfs-class-typec | 17 ++++
> > > > > >  drivers/usb/typec/Makefile                  |  2 +-
> > > > > >  drivers/usb/typec/class.c                   | 26 ++++++
> > > > > >  drivers/usb/typec/class.h                   |  2 +
> > > > > >  drivers/usb/typec/mode_selection.c          | 93 +++++++++++++=
++++++++
> > > > > >  drivers/usb/typec/mode_selection.h          |  5 ++
> > > > > >  include/linux/usb/typec_altmode.h           |  7 ++
> > > > > >  7 files changed, 151 insertions(+), 1 deletion(-)
> > > > > >  create mode 100644 drivers/usb/typec/mode_selection.c
> > > > > >  create mode 100644 drivers/usb/typec/mode_selection.h
> > > > > >
> > > > > > diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Docu=
mentation/ABI/testing/sysfs-class-typec
> > > > > > index 38e101c17a00..46eee82042ab 100644
> > > > > > --- a/Documentation/ABI/testing/sysfs-class-typec
> > > > > > +++ b/Documentation/ABI/testing/sysfs-class-typec
> > > > > > @@ -162,6 +162,23 @@ Description:     Lists the supported USB M=
odes. The default USB mode that is used
> > > > > >               - usb3 (USB 3.2)
> > > > > >               - usb4 (USB4)
> > > > > >
> > > > > > +What:                /sys/class/typec/<port>/altmode_prioritie=
s
> > > > > > +Date:                June 2025
> > > > > > +Contact:     Andrei Kuchynski <akuchynski@chromium.org>
> > > > > > +Description: Lists the alternate modes supported by the port a=
nd their
> > > > > > +             priorities. The priority setting determines the o=
rder in which
> > > > > > +             Displayport alt-mode, Thunderbolt alt-mode and US=
B4 mode will be
> > > > > > +             activated, indicating the preferred selection seq=
uence. A value of -1
> > > > > > +             disables automatic entry into a specific mode, wh=
ile lower numbers
> > > > > > +             indicate higher priority. The default priorities =
can be modified by
> > > > > > +             assigning new values. Modes without explicitly se=
t values default to -1,
> > > > > > +             effectively disabling them.
> > > > > > +
> > > > > > +             Example values:
> > > > > > +             - "USB4=3D0 TBT=3D1 DP=3D2"
> > > > > > +             - "USB4=3D-1 TBT=3D0"
> > > > > > +             - "DP=3D-1 USB4=3D-1 TBT=3D-1"
> > > > >
> > > > > No. If you want to disable entry to a mode by default, then you
> > > > > deactivate that mode, so -1 is not needed. USB4 is also not an al=
t
> > > > > mode, so this at the very least should be named differently.
> >
> > USB4 should be called an alt-mode though based on its behavior and I
> > think the spec makes a mistake not doing so. It's mutually exclusive
> > with alternate modes, it modifies the functionality of the data lanes
> > and it's not a new data mode (just a tunneling protocol). But that's
> > an aside for this patch...
>
> It's still a big no from me for this one as it is, sorry. You are
> trying to achieve too many things with these files.
>
> The first thing here is that you want to offer the user a way to
> define the order in which the modes are entered, and that's actually
> something that we do *not* have any support for at the moment. I'm not
> against this part. As long as you justify the need for this, and
> ideally offer a way to setup the priorities also in tcpm.c, I'm okay
> with it. But you do need to justify the need for this IMO. The specs
> actually dictate the order in which these modes should be entered does
> it not

The spec lists an example mode entry flow with cable warnings (USB
Type-C Spec 2.3, Section E.5) but it's not dictating the order there.
bleung@ and jthies@ contributed this to the spec and this somewhat
matches what ChromeOS does.

The main reason for having a priorities list in sysfs (vs statically
defined) is to reflect our security policy around PCI tunnels: we do
not allow PCI tunnels unless the user is logged in and has toggled the
flag to enable PCI tunnels (which is controllable via the UI or
Enterprise policy). What this results in is a preference to enter DPAM
when in the login screen even if the attached device supports
Thunderbolt and then a mode switch to Thunderbolt after login. This
was done on older ChromeOS platforms by bypassing sysfs and talking
directly to the EC. With our adoption of PDC and UCSI, we want a
common way to do this without having mode sequencing occuring in
userspace.

The eventual operational goal being:
* A PDC based system will automatically enter an alt-mode in the PDC
by default but allow override later based on the defined mode
priority.
* Our older TCPM based systems that do AP driven mode entry will use
the in-kernel mode selection implementation to automatically enter
modes.
* In-kernel TCPM system will also automatically enter an alt-mode
using the in-kernel mode selection implementation.
* Userspace can change the mode priorities when a user logs in and
triggers mode selection. A new connection while logged in would have
the kernel apply the preferred mode.
* Userspace can change mode priorities when the user locks the screen
but does not trigger mode selection. Only new connections would get
the changed priority and existing connections are left alone.

Our preferred alt-mode ordering:
* Default =3D> USB4, DPAM, TBT3
* Logged-in, Tunneling allowed =3D> USB4, TBT3, DPAM

>
> But the second part is that you want to also use this file to disable
> the modes. For that we do have the mechanisms already in place, so
> there is no point in trying to include that here. It does not even
> sound like the primary goal for you - your main goal is to just be
> able to define the order, right?

Limiting to just priority in this file sounds good and simplifies this
change. It does seem to duplicate checks already existing in
`altmode->activate`.

>
> So this is my suggestion: Change this so that you can only supply the
> preferred order for the modes - the priorities. Get rid of the numeric
> values - by simply listing the modes in the file becomes more machine
> readable while still being perfectly human readable.
>
> And the name. I agree that USB4 should be an alt mode, but it's not.
> This should really be a no-brainer. Just s/altmode/mode/. That way
> the naming is aligned with what you are proposing in patch 5/6.

`mode_priorities` and `mode_selection` sounds good.

>
> > > > > But I'm not sure this is the correct way to handle the modes in
> > > > > general. Can you please explain what exactly is the use case you =
are
> > > > > thinking?
> > > >
> > > > Hi Heikki,
> > > >
> > > > This implements the mode selection logic within the kernel, replaci=
ng
> > > > its userspace counterpart. Implementing this in the kernel offers
> > > > advantages, making the process both more robust and far easier to
> > > > manage.
> > > > This eliminates the need for user space to verify port, partner, or
> > > > cable capabilities, and to control the mode entry process. User spa=
ce
> > > > doesn't even need to know if USB4 mode is supported by the port or
> > > > partner; unsupported modes are automatically skipped.
> > >
> > > But that's all things that userspace can do, so it should be doing it=
.
> > > You need to justify why userspace can NOT do something in order to mo=
ve
> > > that logic into the kernel.
> >
> > Userspace "can" do it but it is not doing it today. There is no
> > userspace alt-mode manager (that I'm aware of) that's writing to
> > /sys/class/typec (typecd in ChromeOS only reads and does mode
> > entry/exit via a sideband mechanism) and boltd (userspace thunderbolt
> > manager; https://github.com/gicmo/bolt) only deals with tunnels and
> > not mode entry directly.
> >
> > I think the inclusion of TBT and USB4 in the kernel makes this change
> > necessary and the existing way of doing it is not widely used yet.
> >
> > >
> > > > User space's role is now limited to high-level tasks like security,
> > > > with the kernel managing technical implementation. Mode selection a=
nd
> > > > activation can occur without user space intervention at all if no
> > > > special rules apply and the default policy (USB4 -> TBT -> DP) is
> > > > acceptable.
> > >
> > > What is wrong with "userspace intervention"?  Is the current api brok=
en
> > > somehow?
> >
> > There were some previous discussions on this:
> > https://lore.kernel.org/linux-usb/ZyjW0CMXgGIt-usC@kuha.fi.intel.com/
> > https://lore.kernel.org/chrome-platform/CAA8EJpqiF_0bgYT8boFa4UPJWcxgw8=
9mmfbdMVKeAP-xnFOP4g@mail.gmail.com/
> >
> > Some background:
> > * The Type-C port driver will add a partner alt-mode to the altmode bus=
.
> > * An altmode driver will probe and attach if available on the system.
> >     * Currently, the probe function of these altmode drivers always
> > enter the given mode. The expectation is that if a system allows mode
> > override, it should always be done by the alt mode driver. This
> > doesn't scale beyond one alt-mode driver =E2=80=93 between DP and TBT, =
which
> > altmode driver should win entry? Prior to TBT driver being added in
> > December and USB4 support circa similar time frame, DP was always the
> > default choice if override was supported.
> >     * Userspace could make this decision but then what about USB4? The
> > current APIs don't expose USB4 information in the same way and the
> > auto-enter behavior is different (it doesn't enter).
> >
> > In a lot of existing designs, mode entry is entirely handled by the
> > firmware and no mode selection is possible from the kernel. This is
> > covered by patch 3 of this series (alt_mode_override) flag. Windows
> > designs usually fall into this category as they use PD controllers
> > implementing UCSI (and usually a very old UCSI version 1.2).
> >
> > A few designs allow overriding the current mode:
> > * Chromebooks with cros_ec_ucsi which support Thunderbolt will allow
> > override of the alternate mode (via UCSI set_new_cam) and USB mode
> > (via UCSI Set_USB). They will enter DPAM instead of TBT by default if
> > possible.
> > * Chromebooks with the cros_ec_typec driver which support Thunderbolt
> > will require the OS to make the mode entry decision (no mode entry by
> > default on attach).
> > * Pixel phone TCPM currently requires mode entry from the kernel as
> > there's no userspace mode selection component.
> > * Potentially some Windows designs that implement AltMode override via
> > UCSI (ucsi_acpi). These should behave similarly to cros_ec_ucsi but
> > will likely automatically enter TBT mode.
> >
> > In these cases, the kernel is a better place to make alternate mode dec=
isions:
> > * Quicker than having a userspace implementation (and more consistent
> > during boot).
> > * Works consistently across drivers and accounts for both overridable
> > and non-overridable systems.
> >
> > The main thing userspace should really be doing with mode entry is
> > setting policy around what modes they want to enter instead of doing
> > low level checking of compatibility and sequencing of mode entry
> > operations. And the main policy we're trying to enforce on ChromeOS is
> > to not enter TBT by default (based on our security posture described
> > at https://www.chromium.org/chromium-os/developer-library/reference/sec=
urity/usb4/).
> >
> > Given that Thunderbolt altmode driver support and USB4 support was
> > only added around December of last year, I don't imagine there are
> > many userspace usages yet and we should fix these API issues before
> > they become too widely used. I think mode sequencing belongs in the
> > kernel and not userspace.
>
> My two cents - I'm sure this is clear to most of you, but not to
> everybody.
>
> The problem with the USB Type-C framework that I wrote is that it was
> primary designed to support tcpm.c, but unfortunately it does not work
> very well with the PD controllers when it comes to the alternate modes.
>
> With tcpm.c we need to handle the alternate mode communication inside
> kernel, but with PD controller we of course can't do that. The altmode
> bus and altmode drivers are not needed with PD controllers, in fact
> they only complicate things with the PD controllers.
>
> So there are basically two separate ways of handling the same thing.
> That's why I think we may need something like these files that you
> guys are suggesting. We need a way to support the controlling of
> alternate modes with PD controllers, or perhaps I should say
> with interfaces that support it.

Making this sysfs only visible on drivers that support in-kernel mode
selection is probably a good idea to reduce confusion.
typec_attr_is_visible should be updated for the `mode_priorities`
attribute to reflect that.

Patch 1 in this series makes the `active` sysfs field reflect the
`read_only` nature of the altmode as well, which should help make the
API clearer for PD controller based systems.

>
> But that said, this series is not acceptable as it is quite yet. You
> are trying to push a lot of information and control to these couple of
> files which I'm not convinced is always necessary, and possibly even
> prone to errors. I'm also really concerned that you want to only deal
> with a predefined list of modes. It will probable not be a problem as
> long as we can fallback to ABI that we already have. But during my
> short career I've already seen several cases where assumptions have
> been made about how a specific technology will be used, and it has in
> practice always backfired.

That's fair. With respect to the `predefined list of modes`, these are
all the spec defined alternate-modes (and USB4).

I understand your reservations about the predefined list though. I
think I'd want to see this file have a superset of all kernel
supported modes and have port drivers enable support accordingly.
Right now, the nvidia driver is the only one un-accounted for but that
looks like it's just remapping DP to another SVID. Converting the
TYPEC_SVID_TO_ALTMODE macro to an inline function with a switch
statement would cover that.

>
> thanks,
>
> --
> heikki
