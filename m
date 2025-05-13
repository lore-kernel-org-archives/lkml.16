Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAA62BCF6D;
	Tue, 13 May 2025 14:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747145687; cv=none; b=PNSjYiZuax8uuMrqJ16dsGkzLt5qXruTNEWzUth8Jc1hsRjDh+MmnEQdyfCiY7Se/g5EOSpNPdrtGvjHmucZKfhTA8rOtQa0h9i8hhmBdLJ64asVDVZae+20zf9U19Y8dS+O/bTo22vpp02zxkcxSrEbB3mI1Fsx2jdaZR92WO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747145687; c=relaxed/simple;
	bh=WGdO5rKRD7CsZmqhujA7+2OsPCmfrgwF5c1NW8qEt6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JDZGXc7ZsSzpf/3FjNYkGkp2Icvs7U+vi/isN9nfUbgTXgt8tjwvCjsvhymWCoBp5SAptI/dTqMDJyJJrFl+9qCUdIcp50HaDKH93oaywAs4qP5bMtJkNgSrILJOdlY8jVPqDwKB53cinyv2QH+tdLNqLJwVHLoGUanBX0LKCnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FPzX6dEm; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FPzX6dEm"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-476ab588f32so87033061cf.2;
        Tue, 13 May 2025 07:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747145683; x=1747750483; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JqoJ9j6AIh2Bht6phcyCbQvFFPxUNAjUCdBFyGh/NlU=;
        b=FPzX6dEmyT6m4tK3yBUe3RjYZmgeCcAfI98XoNloldUqsvjC9pzEnt66E9UOremznV
         PlpWeySj9LMkrcp2RRHnqDUCrAIFSJEd5MhZDtPu/OcVSp+S0pMvmQaIWHbmVOkVPT8c
         f4zVemZS35OwRMFsAvlylO6vi/LO5Qu48G/GUP9S/ItfjqWN2o7VUNRcMjtOqgaaNVFQ
         +D0OyuOTNxTZdtHBTo8ggbNxBMl/4+MiNSwOIy0p/DXkXMnRmbyM0j8CFedgeia8GVpz
         hpYgX6245ZwzjkBDbLCCYblzjTb36XJZ4cGad0FqgkjKNUe2q9+vXr4TPzjYfWNL8dH8
         96sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747145683; x=1747750483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JqoJ9j6AIh2Bht6phcyCbQvFFPxUNAjUCdBFyGh/NlU=;
        b=dwYcanIe5IVkmuqBjMRrqkmZMDfjPn9kz9I5rNe5P6JRi5jz+b4Mi+jcy1oVY5XVcf
         P5C3lp6jMEfXbOCQ8eoyDbt5DNJ5ctgCFP/pLdbbimuPYmFq6ihaSSX7/S0itJgeZrwu
         nDGIc794nnTHT5y806RgUvATx9baghvUIYUIHnU2mwnYXVhItPOXTQEr7aK0hL0PvQON
         h46RVeQvVOZO15vRb598X03AECYelt2Rwzo6Da65TgrT3dXhj7cLZJybN4v5M8ihf7aP
         vkXeNyif7TeQPyN3pZ825M76Cczo5s/r8ht+fDXv2cVldiZI8ooLqF4BN7aCP0P13DHB
         N1QA==
X-Forwarded-Encrypted: i=1; AJvYcCWijO6w4qEsPCIfS9GU4kiIVmOUXjwc3YPtbH5+rAARRmUnM1wmMN6i5KiwMY/VahOXGIl/YHhv2hmDgDU=@vger.kernel.org, AJvYcCXvXVLZ7sdennR4EjXrvXsMMH0BrVl9fOnOzDt44vZGQ2lD0dv99oD+rZr4UQd5OU3cKJO8usVA1k8K@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4FMOKaLAXofvFgdxrKfnDO84rvHNu9ZrHzXq4nO6qfWm0c1RL
	DXGFhElAflh1izaWr+Ova9KV4iVsUHF2yTmx72ZMk3mgThredcCMXd5NNnboOQ35AOiA+LFdI2g
	YCjDbpsnXJ94p0Vm6sT7WnzoFIQI=
X-Gm-Gg: ASbGnctlRpdZl7ut9RyFiwS23YLQwiMr4jHF054a1oRK5CRAhpRPK4sgshFEfbNYKjc
	lqmQTDCH7almb2ys+a5dQAyb0BoMwtD1XKLhthAP8jk8SLc9xkpWsPh7OSKz1p6Ce2WLzRDzHBS
	qYfhfIttfQ0clyr/4SdOr29tBHguCe9ZFOPA==
X-Google-Smtp-Source: AGHT+IHaTJyvYGtUYxRCC8aLQYWD84Tleb2mhCFQXTAwGWvVDbRp3wJlJYyagqyJdUOJjRKUl4WYwjAUXAhGQ1puXME=
X-Received: by 2002:a05:622a:4ca:b0:476:8f90:b5d9 with SMTP id
 d75a77b69052e-49452707331mr280088161cf.5.1747145683119; Tue, 13 May 2025
 07:14:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513130834.1612602-1-chou.cosmo@gmail.com>
 <aCNLeX1k34BSgPOV@kuha.fi.intel.com> <aCNOOXcAuA_1B-0Z@kuha.fi.intel.com>
In-Reply-To: <aCNOOXcAuA_1B-0Z@kuha.fi.intel.com>
From: Cosmo Chou <chou.cosmo@gmail.com>
Date: Tue, 13 May 2025 22:14:32 +0800
X-Gm-Features: AX0GCFsaVqCyUUKlxk8YgZxeYSwUd13Nx4HzBmCntx8z62ymeiqDXteyyT1678Q
Message-ID: <CAOeEDyuFmFqacy1N8TtpuJRdv-3K2f1DzXNwR1MpyNn4Nrug7A@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: tcpm: Use configured PD revision for negotiation
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: badhri@google.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cosmo.chou@quantatw.com
Content-Type: text/plain; charset="UTF-8"

On Tue, May 13, 2025 at 04:50:49PM +0300, Heikki Krogerus wrote:
>
> On Tue, May 13, 2025 at 04:39:09PM +0300, Heikki Krogerus wrote:
> > On Tue, May 13, 2025 at 09:08:34PM +0800, Cosmo Chou wrote:
> > > Initialize negotiated_rev and negotiated_rev_prime based on the port's
> > > configured PD revision (rev_major) rather than always defaulting to
> > > PD_MAX_REV. This ensures ports start PD communication using their
> > > appropriate revision level.
> > >
> > > This allows proper communication with devices that require specific
> > > PD revision levels, especially for the hardware designed for PD 1.0
> > > or 2.0 specifications.
> > >
> > > Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
> > > ---
> > > Change log:
> > >
> > > v2:
> > >   - Add PD_CAP_REVXX macros and use switch-case for better readability.
> > >
> > > ---
> > >  drivers/usb/typec/tcpm/tcpm.c | 29 +++++++++++++++++++++++++----
> > >  1 file changed, 25 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> > > index 8adf6f954633..48e9cfc2b49a 100644
> > > --- a/drivers/usb/typec/tcpm/tcpm.c
> > > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > > @@ -313,6 +313,10 @@ struct pd_data {
> > >     unsigned int operating_snk_mw;
> > >  };
> > >
> > > +#define PD_CAP_REV10       0x1
> > > +#define PD_CAP_REV20       0x2
> > > +#define PD_CAP_REV30       0x3
> > > +
> > >  struct pd_revision_info {
> > >     u8 rev_major;
> > >     u8 rev_minor;
> > > @@ -4665,6 +4669,25 @@ static void tcpm_set_initial_svdm_version(struct tcpm_port *port)
> > >     }
> > >  }
> > >
> > > +static void tcpm_set_initial_negotiated_rev(struct tcpm_port *port)
> > > +{
> > > +   switch (port->pd_rev.rev_major) {
> > > +   case PD_CAP_REV10:
> > > +           port->negotiated_rev = PD_REV10;
> > > +           break;
> > > +   case PD_CAP_REV20:
> > > +           port->negotiated_rev = PD_REV20;
> > > +           break;
> > > +   case PD_CAP_REV30:
> > > +           port->negotiated_rev = PD_REV30;
> > > +           break;
> > > +   default:
> > > +           port->negotiated_rev = PD_MAX_REV;
> > > +           break;
> > > +   }
> > > +   port->negotiated_rev_prime = port->negotiated_rev;
> > > +}
> >
> > Do we need this? Couldn't you just add one to rev_major?
> >
> >         port->negotiated_rev = port->pd_rev.rev_major + 1;
> >         port->negotiated_rev_prime = port->pd_rev.rev_major + 1;
> >
> > Or am I missing something?
>
> Sorry, I mean minus one :-)
>
>         port->negotiated_rev = port->pd_rev.rev_major - 1;
>         port->negotiated_rev_prime = port->pd_rev.rev_major - 1;
>
> --
> heikki

It seems to be the PATCH v1:
https://lore.kernel.org/all/20250508174756.1300942-1-chou.cosmo@gmail.com/

if (port->pd_rev.rev_major > 0 && port->pd_rev.rev_major <= PD_MAX_REV + 1) {
        port->negotiated_rev = port->pd_rev.rev_major - 1;
        port->negotiated_rev_prime = port->pd_rev.rev_major - 1;
} else {
        port->negotiated_rev = PD_MAX_REV;
        port->negotiated_rev_prime = PD_MAX_REV;
}

--
Thanks
Cosmo
