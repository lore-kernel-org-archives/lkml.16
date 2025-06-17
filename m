Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA3328D85F;
	Tue, 17 Jun 2025 13:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750166891; cv=none; b=AzSxim8OJCMu4vJE+kRkIMerYKRwO8A7Kodrk7UR2qcja0sgT4i30cO/ovvhn8wGZFALHrBp1KRqIdrHWYFerqbcxYwPiifCypq+s8GvPWCS2xBZhmsnLbi9svV+qZWIyXSFEfR1syQikmUETuT5Gz5DT65oxcR1w1oWsV5j4NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750166891; c=relaxed/simple;
	bh=Yq6koQedkWqteV35qFEPdkin2DPwyajpivV5+B4wGbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A8WvWs13SaFRVC5c2D62oPYmUuq2JmMb2CUPw9d2vF+1WKOraZAftgKY061RwQm8oWO1JZL95fCANqOwpuJn73yYFugjHIkX216F90iunmxLtfRVd8DiTbmRbk9gdLXoWhTHH99/RDXZKYX3xfpuyGEkcOBDV8YrKD4OB24Ti0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=prbJUmT0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="prbJUmT0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FABBC4CEE3;
	Tue, 17 Jun 2025 13:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750166891;
	bh=Yq6koQedkWqteV35qFEPdkin2DPwyajpivV5+B4wGbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=prbJUmT0BTl1+9tbTuJuhUFkpNnAYp/XbaH27k1msZyciuzIewanqiKN1vSe6Uz23
	 tuQcJBQTRXiznHS/F8pWQ/wjhVUyK/MwKYQqIgKKzOjXKseCEFh03+XaZ11Vi9K2+t
	 hXyRhfYmKQSP7D0EMKrFxjkn3YW088GqZZTO2jmY=
Date: Tue, 17 Jun 2025 15:28:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
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
Message-ID: <2025061727-crinkle-drew-4a0d@gregkh>
References: <20250616133147.1835939-1-akuchynski@chromium.org>
 <20250616133147.1835939-5-akuchynski@chromium.org>
 <aFE6dnxet4_sm8b1@kuha.fi.intel.com>
 <CAMMMRMdwUyxdMy42tA_ccYo77nf=6C+KgokDLHBLEYDa5aOHQw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMMMRMdwUyxdMy42tA_ccYo77nf=6C+KgokDLHBLEYDa5aOHQw@mail.gmail.com>

On Tue, Jun 17, 2025 at 02:38:04PM +0200, Andrei Kuchynski wrote:
> On Tue, Jun 17, 2025 at 11:50 AM Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > On Mon, Jun 16, 2025 at 01:31:41PM +0000, Andrei Kuchynski wrote:
> > > This sysfs attribute specifies the preferred order for enabling
> > > DisplayPort alt-mode, Thunderbolt alt-mode, and USB4 mode.
> > >
> > > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > > ---
> > >  Documentation/ABI/testing/sysfs-class-typec | 17 ++++
> > >  drivers/usb/typec/Makefile                  |  2 +-
> > >  drivers/usb/typec/class.c                   | 26 ++++++
> > >  drivers/usb/typec/class.h                   |  2 +
> > >  drivers/usb/typec/mode_selection.c          | 93 +++++++++++++++++++++
> > >  drivers/usb/typec/mode_selection.h          |  5 ++
> > >  include/linux/usb/typec_altmode.h           |  7 ++
> > >  7 files changed, 151 insertions(+), 1 deletion(-)
> > >  create mode 100644 drivers/usb/typec/mode_selection.c
> > >  create mode 100644 drivers/usb/typec/mode_selection.h
> > >
> > > diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
> > > index 38e101c17a00..46eee82042ab 100644
> > > --- a/Documentation/ABI/testing/sysfs-class-typec
> > > +++ b/Documentation/ABI/testing/sysfs-class-typec
> > > @@ -162,6 +162,23 @@ Description:     Lists the supported USB Modes. The default USB mode that is used
> > >               - usb3 (USB 3.2)
> > >               - usb4 (USB4)
> > >
> > > +What:                /sys/class/typec/<port>/altmode_priorities
> > > +Date:                June 2025
> > > +Contact:     Andrei Kuchynski <akuchynski@chromium.org>
> > > +Description: Lists the alternate modes supported by the port and their
> > > +             priorities. The priority setting determines the order in which
> > > +             Displayport alt-mode, Thunderbolt alt-mode and USB4 mode will be
> > > +             activated, indicating the preferred selection sequence. A value of -1
> > > +             disables automatic entry into a specific mode, while lower numbers
> > > +             indicate higher priority. The default priorities can be modified by
> > > +             assigning new values. Modes without explicitly set values default to -1,
> > > +             effectively disabling them.
> > > +
> > > +             Example values:
> > > +             - "USB4=0 TBT=1 DP=2"
> > > +             - "USB4=-1 TBT=0"
> > > +             - "DP=-1 USB4=-1 TBT=-1"
> >
> > No. If you want to disable entry to a mode by default, then you
> > deactivate that mode, so -1 is not needed. USB4 is also not an alt
> > mode, so this at the very least should be named differently.
> >
> > But I'm not sure this is the correct way to handle the modes in
> > general. Can you please explain what exactly is the use case you are
> > thinking?
> 
> Hi Heikki,
> 
> This implements the mode selection logic within the kernel, replacing
> its userspace counterpart. Implementing this in the kernel offers
> advantages, making the process both more robust and far easier to
> manage.
> This eliminates the need for user space to verify port, partner, or
> cable capabilities, and to control the mode entry process. User space
> doesn't even need to know if USB4 mode is supported by the port or
> partner; unsupported modes are automatically skipped.

But that's all things that userspace can do, so it should be doing it.
You need to justify why userspace can NOT do something in order to move
that logic into the kernel.

> User space's role is now limited to high-level tasks like security,
> with the kernel managing technical implementation. Mode selection and
> activation can occur without user space intervention at all if no
> special rules apply and the default policy (USB4 -> TBT -> DP) is
> acceptable.

What is wrong with "userspace intervention"?  Is the current api broken
somehow?

> > If you just need to prevent for example USB4 entry by default, then
> > you write usb3 (or usb2) to the usb_capability. The alt modes you can
> > deactivate by default, no?
> >
> > I can appreciate the convenience that you get from a single file like
> > that, but it does not really give much room to move if for example the
> > user space needs to behave differently in case of failures to enter a
> > specific mode compared to successful entries.
> >
> 
> You are right, this patch series is proposed for its convenience. It
> offers a more convenient method for users to enable or activate any
> mode, without altering existing methods. Users can decide whether they
> prioritize more control or an easier mode selection method.

So now you are going to maintain 2 different ways to do this for the
next 40+ years?  How are you going to test this over time to make sure
nothing breaks/changes?

thanks,

greg k-h
