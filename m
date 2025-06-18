Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6352EA74B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750266297; cv=none; b=jSUQUqBc+Wm1VaoHvsOT0H6TqChWc6mer+3YLyc/JYNsuTPhsD8rHKFov4frIIVGN67V55K/5p7JNOPOAYLuvY3/75cMxE1R5j4wzal36jRzSfrtsmJQPgles4Zx0QAvSpauPv1lzgKy4zPhGmovJAOrJpX/fpUmVs1VdrM4f1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750266297; c=relaxed/simple;
	bh=GTy2PvCYPFvLUsCSngTuNqGVyYNKX0N0F1THUwKHJIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qAGUemgnobwYuQ65keSICyK2tcym84I9HKrRsziGQpeAu8euZZScWSAjnK2dvH86yLne06O0MtasJbMH/MZdg/U0BNOYet6d14FCe7Rbr7bvhF9ZYGkfcezY6O8BQN46oV/gSbG8/Z96UVEQYmpNHgr1ECioPlYbrnFnSYODsmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q3YHtCZb; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q3YHtCZb"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7d09a032914so646942185a.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750266294; x=1750871094; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIj7/912U1hLS69DmdTyCJ8d+fvfWdHshome4WGvT9U=;
        b=Q3YHtCZb8x0K6q5VSlokIgW7WTidGSFFNXZkRSQF1Sp66I5hlo2nrAR7/SI8fVYdqR
         V/epRnYQ3kRuN3pz+8wLHrk8V7l08L+yQ786Y9wwNvdUaJX7hEG984UGqtT4R3aNhOLP
         QeKIcDO5lDTkL36MbTYKv7w3ySll7z6bbLs1zZMlC49lI6sKdveKdxp35AOd4JHjbMKn
         oQQQvbjRS3BdQUuFPS/eXLrDDeZIRwRm5v1JXveJwyIUxwWVhY8DFwDbncqUtzyGm/E4
         c2zDY0S1uG0qgt7APJWZBj0RrIezG/aA9o+p89ixvpfQA0QbgSbtMuifRtsBQHxiXMhF
         eplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750266294; x=1750871094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIj7/912U1hLS69DmdTyCJ8d+fvfWdHshome4WGvT9U=;
        b=oidHciCIdL4EzUzK8/5Y9QgMgoL2KrKsuGHsGVHMInbnzPkmhHKPuvD+y+IMs4m4M2
         lNjgUAO1JX4ecrQXlsrVcDj+wYN9W2lUY0jcrozaQ1q3nkd8KqZvZbMtfUsGmn7XoMwz
         UjLyGmgJ5azN1QJbgLgRDJZFKvriyEEFuWkF1Wl2X/mBO0y5uYgubDIdxDDsVHdMuHqS
         ABKVYNAFvw6cqzWWCPAQj22UgcXNM4pqNjXRSAHBWjcI5Kqr4P/zqbJme7vsZgIz8U5H
         hwDqvJUe8iTJ8pC84sVyccZnQf0GYQVdhoJ/6RX3467c6mK7wjaBBRGf9gRkYZIOJ++R
         ki9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUhfHdHXxu7vcaeVpTTVp3GxxIRyc/KInKlvV66ou6GgKlReLlKfKHKW2E3ZyzqV+BGtZ9IAxPiK8KsbFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJtHDQ0PienwR8wMZnxpXFjc93i0PG7TR7w/ZlLmCmyB5k9mBU
	X5zKIgnxI0mWQof7zZjmjuD2ALenzhfoZ5djVCk4lo/M0Q2isCwdCW7Sf6ebOZeya5tgM+XmlCD
	2uWCaapU22zLo1kDhq+svEMlKxUn3+GWzC/kkMx5u
X-Gm-Gg: ASbGncvZ398O7LOrIy9Hb0DrGLUpK/iNWGs3zht2/uBdzBcJJT19q0lsbQp44ooMlg+
	g6Izr0IY2AqwrtzcLoi6F4HtYR47910CrW140wM/q0AbgyF0PwJGadIaepUYuCFrAnXpdsNtmfM
	jXQyBT/7v4XRnSA4rx55HTaA9Dn09LmlbMM7iGa4D9PreGRbue5AG96e7Ak2eOV1T/SunLK35vw
	7C3zW9Z20aFZPA=
X-Google-Smtp-Source: AGHT+IH6EVcpTkTw8JUim83xuUFB8wy9O7eSl84h9hvZtn+Su5XHCUSFtap/mY1OURayGAsXwHK+Jtpft8ah/aDmp1Y=
X-Received: by 2002:a05:620a:2628:b0:7d3:8f51:a5a5 with SMTP id
 af79cd13be357-7d3c6cfe4efmr3043653185a.51.1750266293724; Wed, 18 Jun 2025
 10:04:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522190912.457583-1-royluo@google.com> <20250522190912.457583-2-royluo@google.com>
 <20250523230633.u46zpptaoob5jcdk@synopsys.com> <b982ff0e-1ae8-429d-aa11-c3e81a9c14e5@linux.intel.com>
 <20250529011745.xkssevnj2u44dxqm@synopsys.com> <459184db-6fc6-453b-933d-299f827bdc55@linux.intel.com>
 <20250605001838.yw633sgpn2fr65kc@synopsys.com>
In-Reply-To: <20250605001838.yw633sgpn2fr65kc@synopsys.com>
From: Roy Luo <royluo@google.com>
Date: Wed, 18 Jun 2025 10:04:17 -0700
X-Gm-Features: Ac12FXwY_QrogUvvcPl-lKVgH0ASDSjF3Wdv-xGgP0Lciad5aKdoQcEiS3RwWkI
Message-ID: <CA+zupgwLkq_KSN9aawNtYpHzPQpAtQ0A9EJ9iaQQ7vHUPmJohA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] usb: xhci: Skip xhci_reset in xhci_resume if xhci
 is being removed
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, 
	"mathias.nyman@intel.com" <mathias.nyman@intel.com>, 
	"quic_ugoswami@quicinc.com" <quic_ugoswami@quicinc.com>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"michal.pecio@gmail.com" <michal.pecio@gmail.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 5:18=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys.=
com> wrote:
>
> On Wed, Jun 04, 2025, Mathias Nyman wrote:
> > On 29.5.2025 4.17, Thinh Nguyen wrote:
> > > On Mon, May 26, 2025, Mathias Nyman wrote:
> > > > On 24.5.2025 2.06, Thinh Nguyen wrote:
> > > > > Hi Mathias, Roy,
> > > > >
> > > > > On Thu, May 22, 2025, Roy Luo wrote:
> > > > > > xhci_reset() currently returns -ENODEV if XHCI_STATE_REMOVING i=
s
> > > > > > set, without completing the xhci handshake, unless the reset co=
mpletes
> > > > > > exceptionally quickly. This behavior causes a regression on Syn=
opsys
> > > > > > DWC3 USB controllers with dual-role capabilities.
> > > > > >
> > > > > > Specifically, when a DWC3 controller exits host mode and remove=
s xhci
> > > > > > while a reset is still in progress, and then attempts to config=
ure its
> > > > > > hardware for device mode, the ongoing, incomplete reset leads t=
o
> > > > > > critical register access issues. All register reads return zero=
, not
> > > > > > just within the xHCI register space (which might be expected du=
ring a
> > > > > > reset), but across the entire DWC3 IP block.
> > > > > >
> > > > > > This patch addresses the issue by preventing xhci_reset() from =
being
> > > > > > called in xhci_resume() and bailing out early in the reinit flo=
w when
> > > > > > XHCI_STATE_REMOVING is set.
> > > > > >
> > > > > > Cc: stable@vger.kernel.org
> > > > > > Fixes: 6ccb83d6c497 ("usb: xhci: Implement xhci_handshake_check=
_state() helper")
> > > > > > Suggested-by: Mathias Nyman <mathias.nyman@intel.com>
> > > > > > Signed-off-by: Roy Luo <royluo@google.com>
> > > > > > ---
> > > > > >    drivers/usb/host/xhci.c | 5 ++++-
> > > > > >    1 file changed, 4 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> > > > > > index 90eb491267b5..244b12eafd95 100644
> > > > > > --- a/drivers/usb/host/xhci.c
> > > > > > +++ b/drivers/usb/host/xhci.c
> > > > > > @@ -1084,7 +1084,10 @@ int xhci_resume(struct xhci_hcd *xhci, b=
ool power_lost, bool is_auto_resume)
> > > > > >               xhci_dbg(xhci, "Stop HCD\n");
> > > > > >               xhci_halt(xhci);
> > > > > >               xhci_zero_64b_regs(xhci);
> > > > > > -             retval =3D xhci_reset(xhci, XHCI_RESET_LONG_USEC)=
;
> > > > > > +             if (xhci->xhc_state & XHCI_STATE_REMOVING)
> > > > > > +                     retval =3D -ENODEV;
> > > > > > +             else
> > > > > > +                     retval =3D xhci_reset(xhci, XHCI_RESET_LO=
NG_USEC);
> > > > >
> > > > > How can this prevent the xhc_state from changing while in reset? =
There's
> > > > > no locking in xhci-plat.
> > > >
> > > > Patch 2/2, which is the revert of 6ccb83d6c497 prevents xhci_reset(=
) from
> > > > aborting due to xhc_state flags change.
> > > >
> > > > This patch makes sure xHC is not reset twice if xhci is resuming du=
e to
> > > > remove being called. (XHCI_STATE_REMOVING is set).
> > >
> > > Wouldn't it still be possible for xhci to be removed in the middle of
> > > reset on resume? The watchdog may still timeout afterward if there's =
an
> > > issue with reset right?
> > >
> >
> > Probably yes, but that problem is the same if we only revert 6ccb83d6c4=
97.
> >
> > > > Why intentionally bring back the Qcom watchdog issue by only revert=
ing
> > > > 6ccb83d6c497 ?. Can't we solve both in one go?
> > >
> > > I feel that the fix is doesn't cover all the scenarios, that's why I
> > > suggest the revert for now and wait until the fix is properly tested
> > > before applying it to stable?
> >
> > Ok, we have different views on this.
> >
> > I think we should avoid causing as much known regression as possible ev=
en
> > if the patch  might not cover all scenarios.
> >
> > By reverting 6ccb83d6c497 we fix a SNPS DWC3 regression, but at the sam=
e
> > time bring back the Qcom issue, so cause another regression.
> >
> > We can avoid the main part or the Qcom regression by adding this patch =
as
> > issue is with (long) xhci reset during resume if xhci is being removed,=
 and
> > driver always resumes xhci during ->remove callback.
> >
> > If we discover the patch is not perfect then we fix it
> >
>
> Ok. Fair enough.
>
> BR,
> Thinh

Thanks Thinh and Mathias for the review.
Please let me know if any further changes are needed before these
patches can be accepted.
I just want to make sure they're still on your radar.

Thanks,
Roy
