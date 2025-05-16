Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0956F21ADC6
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 05:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747372245; cv=none; b=Y6tlBUKtDUc9ILqUXqFVafdO/kUXtin4bIH6MaTDfQSiU5ajPr9wURmsW5A+WUFO8ePXOR85Q0seGu8M1DOtjTH8WBTTNOctCv2e5sLOmOaBwibQl7ren8yoaj5m89Qo15hn67FGRSX8PcLhLNdualA+PvZxQTGy1hRSnrVoz3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747372245; c=relaxed/simple;
	bh=PBgrfDfjGMRv2RNzmim1ZNyY5R2PME9uUKJ/LS6bXtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IDleFrrdAv4lW20fnN/+uPPA7rNuTurtgARHEnNLleBzQo5KtvED0qekt9yLjoFFw8avOeO1X5GZimvwdX/NZiDaYAe/PgTJptoibfmbMQPY93xlR1EDbF6Wp+ZaoC1widDyQmuhueC7ELFI63No/0UCgiN9m8TYZ5E8eBtiUlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hoUxlBPg; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hoUxlBPg"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-72ecb4d9a10so2154223a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 22:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747372243; x=1747977043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rS14ehsKTRh0Yu2NCsmeKqi7C6zemUJM36Ay6+7ClPM=;
        b=hoUxlBPgFMFWuvqAR+h3ExrVFQW3YwCJq8ua0+txH0fNV0EQ94vuZ5ECFk7ltBkefI
         IeyFS2SmRrZyvK8r80z3s3JX6tSGvmRkjQHxFR4RbU5ARRm5tiIXc1aHVCLYHbfE3lIE
         0cnhJm+QZ9fbFhpUwocBxET4Xc2Hc3ZGh7A5lIko26N//IsFtgJrPtc2CHznWP+mQ3Rx
         HOEokBD+OkSmL/3S2d9vLVpOAHbAlCbYS5WlMprPtUnyWDFbO5vvgprIbqSKlQWS5Ljj
         hODEXAsX4NhuUIr2Alj0uEZECFG9PA7DMxq1LM7j13PMj2zg/ltdo+qPC1VTlvuOBP76
         at5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747372243; x=1747977043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rS14ehsKTRh0Yu2NCsmeKqi7C6zemUJM36Ay6+7ClPM=;
        b=F+6rym/T+I6x9s9JpI48nav0EcaVeKPnWTmm8BklM84766MYUplb1ANG8ZqbmypvB2
         3IBkEaLnrGIdTb7Fjk2/Th+R7tDjWG6PSTyq3W+/SLt87HazxoKYVgDUatQgjiQygE46
         p07geJeWiE/teSSdkx1GKZoRJXdUzMXkO/Y6CqnI52yZXXrP9WRertI1cNs4bJ46Qv6T
         ahe+7SDNdoPxKbgkrFxxWNc/SOCjIC7ZDZ8IrocDtgqj5YEKfLRtxG+J7NtkiDdua1QH
         oJdgKbp3BGst7pkKF+nbVVMO9AutW2yZh+d0fXJDOINlMckCjx00Z6Q2WWdGmNQlR4Ed
         pi2w==
X-Forwarded-Encrypted: i=1; AJvYcCW2PpT++hrKnbOxomcVuh8FOGDK6mHu1CzvFZzaZZIdZU8RNBdd18i2lWb961IUeq7lRnZIVzZFtB42/dE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXDlOEHRNPnoDx67ZxmfHL7VLcjyToKmH9qVDtKF2rbHVMB+Xr
	PnSr9y0tEpLJIdZh8Qvhs8SgyOc2JoLI0K1PUPjFAvuXVKtgeJxfaHkds+WsMTasbw+Bd/9vkSc
	jgQKWbxnZB/y6h3yXTbK3X1EfQlTC/q2dDmz06q1c
X-Gm-Gg: ASbGnctAjaszlHxSiQmGEz5dqWp5g8zhWWwmlyFNR+St+HPp8RdAACJBxvsho3x6/P+
	2T+I8KOkhZ4qjMSawCM5iDvB9O2kjxM5dFrld9L2xJEhKUeXmsuH1do0zBf4Cz+5my9Fs7IZPk8
	YCnBc/PNTm+ifmF6IJOokLu7GCyOrpetU5N8VJkk95Lf28O0+2uSL9oACW2SikD8bEAcJR/a8O/
	PasCbKaJutXbcM=
X-Google-Smtp-Source: AGHT+IG+EBPZr1Odrxpf1BvUc8QTj8b6UyQ5Vr/g6q7DusGK32UF2knRIwviRux7xsAeZ0mZs0vqZ6oxPUhtdWbBVBA=
X-Received: by 2002:a05:6870:a7a5:b0:2c8:361a:da77 with SMTP id
 586e51a60fabf-2e3c1ed9f95mr1231548fac.26.1747372242630; Thu, 15 May 2025
 22:10:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513130834.1612602-1-chou.cosmo@gmail.com>
 <aCNLeX1k34BSgPOV@kuha.fi.intel.com> <aCNOOXcAuA_1B-0Z@kuha.fi.intel.com>
 <CAOeEDyuFmFqacy1N8TtpuJRdv-3K2f1DzXNwR1MpyNn4Nrug7A@mail.gmail.com>
 <aCRQbRCHFdFOCNw2@kuha.fi.intel.com> <4245c9da-cb81-4494-93c6-224883057410@google.com>
In-Reply-To: <4245c9da-cb81-4494-93c6-224883057410@google.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Thu, 15 May 2025 22:10:05 -0700
X-Gm-Features: AX0GCFtsjDRTU_pVx4L7jEmXjCCPPMdleg_78CjSDC1A9ysVADujU6X9sZe26tg
Message-ID: <CAPTae5+GFX7HpB6Vp68LQtFgy+iMCj8cCOuHUPyn8nZPBt7+zQ@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: tcpm: Use configured PD revision for negotiation
To: Amit Sunil Dhamne <amitsd@google.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Cosmo Chou <chou.cosmo@gmail.com>, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cosmo.chou@quantatw.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 12:15=E2=80=AFAM Amit Sunil Dhamne <amitsd@google.c=
om> wrote:
>
> Hi Heikki,
>
> On 5/14/25 1:12 AM, Heikki Krogerus wrote:
> > On Tue, May 13, 2025 at 10:14:32PM +0800, Cosmo Chou wrote:
> >> On Tue, May 13, 2025 at 04:50:49PM +0300, Heikki Krogerus wrote:
> >>> On Tue, May 13, 2025 at 04:39:09PM +0300, Heikki Krogerus wrote:
> >>>> On Tue, May 13, 2025 at 09:08:34PM +0800, Cosmo Chou wrote:
> >>>>> Initialize negotiated_rev and negotiated_rev_prime based on the por=
t's
> >>>>> configured PD revision (rev_major) rather than always defaulting to
> >>>>> PD_MAX_REV. This ensures ports start PD communication using their
> >>>>> appropriate revision level.
> >>>>>
> >>>>> This allows proper communication with devices that require specific
> >>>>> PD revision levels, especially for the hardware designed for PD 1.0
> >>>>> or 2.0 specifications.
> >>>>>
> >>>>> Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>

Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

> >>>>> ---
> >>>>> Change log:
> >>>>>
> >>>>> v2:
> >>>>>   - Add PD_CAP_REVXX macros and use switch-case for better readabil=
ity.
> >>>>>
> >>>>> ---
> >>>>>  drivers/usb/typec/tcpm/tcpm.c | 29 +++++++++++++++++++++++++----
> >>>>>  1 file changed, 25 insertions(+), 4 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm=
/tcpm.c
> >>>>> index 8adf6f954633..48e9cfc2b49a 100644
> >>>>> --- a/drivers/usb/typec/tcpm/tcpm.c
> >>>>> +++ b/drivers/usb/typec/tcpm/tcpm.c
> >>>>> @@ -313,6 +313,10 @@ struct pd_data {
> >>>>>     unsigned int operating_snk_mw;
> >>>>>  };
> >>>>>
> >>>>> +#define PD_CAP_REV10       0x1
> >>>>> +#define PD_CAP_REV20       0x2
> >>>>> +#define PD_CAP_REV30       0x3
> >>>>> +
> >>>>>  struct pd_revision_info {
> >>>>>     u8 rev_major;
> >>>>>     u8 rev_minor;
> >>>>> @@ -4665,6 +4669,25 @@ static void tcpm_set_initial_svdm_version(st=
ruct tcpm_port *port)
> >>>>>     }
> >>>>>  }
> >>>>>
> >>>>> +static void tcpm_set_initial_negotiated_rev(struct tcpm_port *port=
)
> >>>>> +{
> >>>>> +   switch (port->pd_rev.rev_major) {
> >>>>> +   case PD_CAP_REV10:
> >>>>> +           port->negotiated_rev =3D PD_REV10;
> >>>>> +           break;
> >>>>> +   case PD_CAP_REV20:
> >>>>> +           port->negotiated_rev =3D PD_REV20;
> >>>>> +           break;
> >>>>> +   case PD_CAP_REV30:
> >>>>> +           port->negotiated_rev =3D PD_REV30;
> >>>>> +           break;
> >>>>> +   default:
> >>>>> +           port->negotiated_rev =3D PD_MAX_REV;
> >>>>> +           break;
> >>>>> +   }
> >>>>> +   port->negotiated_rev_prime =3D port->negotiated_rev;
> >>>>> +}

IMHO this looks better in terms of readability although V1 is more concise.

Thanks,
Badhri

> >>>> Do we need this? Couldn't you just add one to rev_major?
> >>>>
> >>>>         port->negotiated_rev =3D port->pd_rev.rev_major + 1;
> >>>>         port->negotiated_rev_prime =3D port->pd_rev.rev_major + 1;
> >>>>
> >>>> Or am I missing something?
> >>> Sorry, I mean minus one :-)
> >>>
> >>>         port->negotiated_rev =3D port->pd_rev.rev_major - 1;
> >>>         port->negotiated_rev_prime =3D port->pd_rev.rev_major - 1;
>
> The only reason I asked for macros is that in the case of Spec Revision
> for header, the value for PD 3.0 is 0x2, PD 2.0 is 0x1 & so on. While
> for PD max revisions, it's the exact values. Having a clear distinction
> may be easier to follow. If you want to go with the +/- approach you can
> add a comment stating the above.
>
> I don't have a hard opinion on either approach :).
>
> Thanks,
>
> Amit
>
> >>>
> >>> --
> >>> heikki
> >> It seems to be the PATCH v1:
> >> https://lore.kernel.org/all/20250508174756.1300942-1-chou.cosmo@gmail.=
com/
> >>
> >> if (port->pd_rev.rev_major > 0 && port->pd_rev.rev_major <=3D PD_MAX_R=
EV + 1) {
> >>         port->negotiated_rev =3D port->pd_rev.rev_major - 1;
> >>         port->negotiated_rev_prime =3D port->pd_rev.rev_major - 1
> >> } else {
> >>         port->negotiated_rev =3D PD_MAX_REV;
> >>         port->negotiated_rev_prime =3D PD_MAX_REV;
> >> }
> > Okay, sorry I missed that. I still don't like the extra definitions,
> > but I don't have any better idea (I guess macro is not an option?).
> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> >
> > thanks,
> >
