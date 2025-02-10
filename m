Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F2F26461E
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 23:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739231489; cv=none; b=fGZ1qgKPWYNJvUAq1oqoXl0riReuEPou4wyr3zrloJJuvfxyiYWsbwor21pswt2GN2GYhlKKI7lgF2viCj0QWJCNPyk9vcZ/o3PlRn0HcXwxJLDwl3sJapSz3nzo8NKlgZESv156MX6TJo8ayHW6u8Jr9rnvmeUF376Y3EbywFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739231489; c=relaxed/simple;
	bh=8y93GLx5oEKFbWriKxxtGuKxC4nVxTakpj0q+7BExtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uwtbJoHjXWdAQnG2kCPxw4Q7YBheSEVlc6MU8p4osXUD+dcaRh9fwmDkScze4o0Zp3UivBPh8VItOkDHvGco71WbuSo/OXAlRNcn2Cg0GvUis8jBUiOjSQEd1S5AP2tI45VcaE+gPVbd4dkUKZeabuZ92/DdRHMnZQJG56mFjEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=391O7On5; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="391O7On5"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3f3b46db87eso911253b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739231486; x=1739836286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZe22CX8bjEljQqE/X18PzQlBgx3VPOHv4ii+2JauZk=;
        b=391O7On5S5fpUro0UKr9Vvl4bpoU+TW7WkyIJgY5D/vj/3137QDWjcaTlR6KI56XlM
         exFdmJnls1Zvp04aZ1OcOtK9mh9E4t4o2jUBj9UIQjX9W0yKfoI/erAIx3IzPrH2nFNK
         0QNBwGu+UIwrYImZG+EqW4+TvDVobG0Ge27Pf4e00Ouiw8XL3Z3x4aLaETcj3mMbg1KO
         r1fXxMMxrY6VUqiyh6cweb2iqMNcEIlWKY76n71VCU845ScmYp/HmaaPnxx1Y0+dbk61
         KVaIDJi8bqopT6F9hmjKwhfH7YgU74tr8+/1cWyR22lhfz4sxq76fH5OgyjBmn3Yl2ds
         4BwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739231486; x=1739836286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZe22CX8bjEljQqE/X18PzQlBgx3VPOHv4ii+2JauZk=;
        b=Jp1Gb2eZLqtPK3CaDqUly2gxbTZTAI2ydkcYH+MPiGLudIw6A156adwQm6TUkkXYbP
         1+1e/4UoJRbLdsB8jXpVUTuZB9828GmWaHJu44hXbcsMnG8lj8igWs7FRaL+MqR0J5S7
         INKg54V5wjV0wi5ze7E19rUd/70Y+Rol08pP/VLDx0ne76vL6BMdP9+rdvp/I9rSMVVj
         TUkTEwV0hxLLeC/H0doJILRbWE7sv1IrYPWmswGEwn+6uGgOnPoDDrn4wA75VDtriglS
         cjQ4gA8JGULF2xFWYMIrbxoGMWFQBA3GVbv0mwwoyoPIDm9z//MQznpOaHLxgkesEykO
         uagg==
X-Forwarded-Encrypted: i=1; AJvYcCWPj4CIgAmnK12grgS28DdGENSZjX+8aVtBHRaIG27Y2Zy4gQKyV96AJkMIuEJ0qeQyyYtqkecaYVymXZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjHaEbI6WhgvLDj8DpDB6xzkgoszseFwflWjkNOWz7hrqcRPnG
	lwKA763r1zxwxqM6Cq4KPpAm7BOOCShq77rR9/J0EakxgEKOZfK9xnx1VUw5m/1lVT0ybBB7NOO
	dEK64zB4Ib3S8gizL4M7lOHzZeMa7PDHsfWD/
X-Gm-Gg: ASbGnctzJtkInjFeMkkDCT5JHXT8rcKbzGNOHtoVKlumxsTvyTn4Q+CskSpMPXKh7gy
	kcfGXq7yROnX8XejZLhLmj/7Csxnl8EWQ6vXpbNttDBXSh1Ttv/mU9NJqQl1iOez3+8hBfIREef
	9NPe7fKEVZ3+Kx8bVHzU+JKGpcb8mJHQ==
X-Google-Smtp-Source: AGHT+IHuLnSHtPuNOUUDo6eSZSjQuYoUXhNNwpTBsmKLj0FndJlhcTPSRnjIBXPGqVasrsFQ14d0yUnIUP9l3ZkERZc=
X-Received: by 2002:a05:6808:1886:b0:3f0:5c90:f511 with SMTP id
 5614622812f47-3f3921e7ed2mr9342232b6e.1.1739231485512; Mon, 10 Feb 2025
 15:51:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209071752.69530-1-joswang1221@gmail.com> <5d504702-270f-4227-afd6-a41814c905e3@google.com>
In-Reply-To: <5d504702-270f-4227-afd6-a41814c905e3@google.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Mon, 10 Feb 2025 15:50:47 -0800
X-Gm-Features: AWEUYZmTqkrNQX7oj5ITMhk6PrY78GVnEbkrYb-DvR7qcJ1kKFIz7qBgYPD1m_0
Message-ID: <CAPTae5+Z3UcDcdFcn=Ref5aQSUEEyz-yVbRqoPJ1LogP4MzJdg@mail.gmail.com>
Subject: Re: [PATCH 1/1] usb: typec: tcpm: PSSourceOffTimer timeout in PR_Swap
 enters ERROR_RECOVERY
To: Amit Sunil Dhamne <amitsd@google.com>
Cc: joswang <joswang1221@gmail.com>, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jos Wang <joswang@lenovo.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 3:02=E2=80=AFPM Amit Sunil Dhamne <amitsd@google.co=
m> wrote:
>
>
> On 2/8/25 11:17 PM, joswang wrote:
> > From: Jos Wang <joswang@lenovo.com>
nit: From https://elixir.bootlin.com/linux/v6.13.1/source/Documentation/pro=
cess/submitting-patches.rst#L619

  - A ``from`` line specifying the patch author, followed by an empty
    line (only needed if the person sending the patch is not the author).

Given that you are the author, wondering why do you have an explicit "From:=
" ?

> >
> > As PD2.0 spec ("6.5.6.2 PSSourceOffTimer")=EF=BC=8Cthe PSSourceOffTimer=
 is

nit: https://elixir.bootlin.com/linux/v6.13.1/source/Documentation/process/=
submitting-patches.rst#L619

 - The body of the explanation, line wrapped at 75 columns, which will
    be copied to the permanent changelog to describe this patch.


> > used by the Policy Engine in Dual-Role Power device that is currently
> > acting as a Sink to timeout on a PS_RDY Message during a Power Role
> > Swap sequence. This condition leads to a Hard Reset for USB Type-A and
> > Type-B Plugs and Error Recovery for Type-C plugs and return to USB
> > Default Operation.
> >
> > Therefore, after PSSourceOffTimer timeout, the tcpm state machine shoul=
d
> > switch from PR_SWAP_SNK_SRC_SINK_OFF to ERROR_RECOVERY. This can also s=
olve
> > the test items in the USB power delivery compliance test:
> > TEST.PD.PROT.SNK.12 PR_Swap =E2=80=93 PSSourceOffTimer Timeout

Thanks for fixing this !

> >
> > [1] https://usb.org/document-library/usb-power-delivery-compliance-test=
-specification-0/USB_PD3_CTS_Q4_2025_OR.zip
> >
> > Fixes: f0690a25a140 ("staging: typec: USB Type-C Port Manager (tcpm)")
> > Cc: stable@vger.kernel.org
> >
nit: Empty line not needed here.

> > Signed-off-by: Jos Wang <joswang@lenovo.com>
>
> Tested-by: Amit Sunil Dhamne <amitsd@google.com>


>
>
> Regards,
>
> Amit
>
> > ---
> >   drivers/usb/typec/tcpm/tcpm.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcp=
m.c
> > index 47be450d2be3..6bf1a22c785a 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -5591,8 +5591,7 @@ static void run_state_machine(struct tcpm_port *p=
ort)
> >               tcpm_set_auto_vbus_discharge_threshold(port, TYPEC_PWR_MO=
DE_USB,
> >                                                      port->pps_data.act=
ive, 0);
> >               tcpm_set_charge(port, false);
> > -             tcpm_set_state(port, hard_reset_state(port),
> > -                            port->timings.ps_src_off_time);
> > +             tcpm_set_state(port, ERROR_RECOVERY, port->timings.ps_src=
_off_time);
> >               break;
> >       case PR_SWAP_SNK_SRC_SOURCE_ON:
> >               tcpm_enable_auto_vbus_discharge(port, true);
