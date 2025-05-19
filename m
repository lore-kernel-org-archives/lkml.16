Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E933EA63;
	Mon, 19 May 2025 15:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747669663; cv=none; b=XAFTRmp2z/PMwS1EkCkdD/mZJd+w4v4d+EMINm7yG2eiTTreUMg4B3lKJganu6O+m13zERITApCw5fLn21FeEst2grJdXvm+D10t9Il2yMNcAMyNb7q42zu1RWwHI1IxWori/QORY53nciUgxgoKJ5ynhhBB2WS6shdIxvjRGxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747669663; c=relaxed/simple;
	bh=/AZJxc+ojypuP0EsmURDqeGd/HDPv50Ce64UuZuYrkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dC73xatl9OOKWrEuopB2BjWL8NuOhfLQKk0QVTzc4y/GFHHwGsZC1cDjCsorhv7DS4xai4KP4OHYstzur2+4/t+/b6N5NW3uM4nprJCQJt4cWPl0Qn4oZoh/7sHdij2hflz3/XLKeawMHv+Jggww51rbrFASKz1Mo/ri+HRtRcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iypG6fD/; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iypG6fD/"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3105ef2a06cso44410121fa.2;
        Mon, 19 May 2025 08:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747669659; x=1748274459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AZJxc+ojypuP0EsmURDqeGd/HDPv50Ce64UuZuYrkI=;
        b=iypG6fD/dsVGD2eM8E+a6h0/C3AXrK6WyD+Ny2xf07Oy8iIBbRlSodCcod9qVz8XfN
         /9UBrraSLH3IqhdpqQeRQgGcSnTtf10DbAtzzHM5n16URbJcTutU7zIm5FQVPeOMXeog
         IBTmDkaC3lLp/g3wlaTaUoDLak39ZWYipSw0o7gIHwYsJWpKABGMOW1N8KELQiX3AIkR
         0L7Hu7E0DCor6jDq1vAidIa3Pg6eYRJ2puw6+AQYEUigG0iTZsTSAD2mQNTgpVxuZnU4
         2oUG8X7pqv0b1SXgv8ezWE/XeUu/WiSBXPssWv6zNPGC3t+G3YXHpIR6EgEnWb0cegcR
         hDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747669659; x=1748274459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AZJxc+ojypuP0EsmURDqeGd/HDPv50Ce64UuZuYrkI=;
        b=U1CuKJOrQwhzGzDCE1Nwoz8vhsfWUFmUlfXNuzK4wdcHymfjV1fOjqO9OX2NH/7PP/
         QjS0RRr+ZMzYSoaFPqurRWW3G9klAAwA6vDAFOWGoqzLwoGDF3fGsmjG4BY11fDCjR0p
         nIXdjagTUOAo1nvXGdBlGvTXeP+msh/8B4IBroAmrLgUiAaUjh6sk8kyXfdIhBcEVBSS
         +Tvy7BBzfsYRsGOlRk76igCobifUlP2MeA0vgQrXzsyEDeiosMgEbJzv0WmVGvZT4poR
         RrG99uo/pxI0H6UagIe9IkZAFWHF60J3VKdtGsk8b5Oaw4V+SPctypIoB2cmsXNQriRH
         FCOQ==
X-Forwarded-Encrypted: i=1; AJvYcCULBXbKva1d8M4+3gd8j+EDTSnw8rDc+7dswLsV33PyEQNmiLZWxIoVylnlw0WCvtavsGGcQ5igPANblVo=@vger.kernel.org, AJvYcCUOY4oHUFt8EkA+jLYWTUZlUjvnKff1jf09UjyAhBu0LwGvRpnWXA5c0/Zns62saOfGJrSeD8rWxpZz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9VoSHxjFQZFAgNBJrrWrOO1DD2za0hPUPacG/6szZuSkbOOHW
	/dcxwxlczdfn2ND1KjrwUDEQTxxdGLsgTYeQYH2eGKwWBfDD60boIu5sQ9ISLeuc6NXupTGaB2Q
	KdMwbDTwFHdyEKDxxCONJ8ZAINgLM/U0=
X-Gm-Gg: ASbGncuW68TdOnvPBtauRr1u8qFUBXwZrdm8+6fln1uTb8dNwlCruLtL4quG8Lii0I5
	osAf4BcaIMochxprs3P0RfHE3rRrfpjUX8FVs7upG2X7jidx7a35SeSgM3d2eVuO6s6UNDGfmxy
	rMOGArvBdkv+IFQIIrPQLF7b5aMees4LkxedGPMjh/fMOL5ncoahljnIzZqF5yJbpEsqA=
X-Google-Smtp-Source: AGHT+IEXfEy9vlHFT2MUxdk6nm8iEqVbd6HoLEED3ANOzuyjvL0sZ1nvnEFDTLCVjF0H+H9Pwfdg52FYwXFYs5IgYG4=
X-Received: by 2002:a05:651c:304c:b0:30b:b987:b6a7 with SMTP id
 38308e7fff4ca-32807602735mr36330441fa.0.1747669658849; Mon, 19 May 2025
 08:47:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516033908.7386-1-shawn2000100@gmail.com> <e87a80d9-9603-4d27-99a7-a34eeda8c6f5@linux.intel.com>
In-Reply-To: <e87a80d9-9603-4d27-99a7-a34eeda8c6f5@linux.intel.com>
From: =?UTF-8?B?6Zmz5a2Q5r2U?= <shawn2000100@gmail.com>
Date: Mon, 19 May 2025 23:47:27 +0800
X-Gm-Features: AX0GCFtK9wy_mLe68iUQ-E7fyZFHE60wHy8e1Ql_5ZfLvwLm1x8pPvozJBFkk2o
Message-ID: <CAPwXWsCuMDTYwfSodKsrV1MZCtmLrM380ziQFdhcpTt9r+_gxQ@mail.gmail.com>
Subject: Re: [PATCH v3] usb: xhci: Set avg_trb_len = 8 for EP0 during Address
 Device Command
To: Mathias Nyman <mathias.nyman@linux.intel.com>, =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, jay.chen@siemens.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Micha=C5=82 and Mathias,

Thank you for the thoughtful feedback and review.

> Only the xHC internal firmware could crash or misbehave from that.

Yes, precisely. The potential crash or division-by-zero would happen
within the internal firmware of certain host controllers, rather than
in the Linux kernel itself.
I'll make this clearer in the commit description as well.

> The rest of ep0 tx_info is zero, so this could be =3D instead of |=3D.

Agreed, I'll update the next revision of this patch to use '=3D' instead
of '|=3D' for clarity and correctness.

---

> I'd skip the 'compliance with spec..' part as spec is a bit unclear on th=
is
issue.

Sure, I will modify the commit message accordingly.

As noted, there is a subtle contradiction between two sections of the
xHCI 1.2 specification:
- Section 4.8.2 "Endpoint Context Initialization" states that all
fields of an Input Endpoint Context data structure (including the
Reserved fields) shall be initialized to 0.
- Section 6.2.3 "Endpoint Context" (p.453) specifies that the Average
TRB Length field shall be greater than =E2=80=980=E2=80=99, and further not=
es (p.454):
=E2=80=9CSoftware shall set Average TRB Length to =E2=80=988=E2=80=99 for c=
ontrol endpoints.=E2=80=9D

Strictly setting all fields to 0 during initialization conflicts with
the explicit recommendation that avg_trb_len should be set to 8 for
control endpoints. In practice, setting avg_trb_len =3D 0 is meaningless
for the hardware/firmware, as it defeats the purpose of the field,
which is used for transfer calculations and validation.

Motivation / Real-world context:
I am developing a custom Virtual xHC hardware platform that strictly
follows the xHCI specification and its recommendations.
During validation, we found that enumeration fails and a parameter
error (TRB Completion Code =3D 5) is reported if avg_trb_len for EP0 is
not set to 8 as recommended by Section 6.2.3.
This behavior aligns with the spec's intent and highlights the
importance of setting a meaningful, non-zero value for avg_trb_len,
even in virtualized or emulated environments.

Therefore, this patch is intended to better align Linux xHCI host
controller driver behavior with the recommendation in Section 6.2.3,
and to improve robustness and interoperability with both current and
future xHCI implementations=E2=80=94real or virtual=E2=80=94that may enforc=
e spec
recommendations more strictly.

Thanks again for your feedback. I'll prepare and submit a v4 patch
shortly, incorporating your suggestions.
Let me know if you have further questions or suggestions.

Best regards,
Jay Chen

On Mon, May 19, 2025 at 9:14=E2=80=AFPM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 16.5.2025 6.39, Jay Chen wrote:
> > According to the xHCI 1.2 spec (Section 6.2.3, p.454), the Average
> > TRB Length (avg_trb_len) for control endpoints should be set to 8.
>
> Maybe add here "But section 4.8.2 "Endpoint Context Initialization"
> states that all fields of an Input Endpoint Context data structure
> (including the Reserved fields) shall be initialized to 0
> > > Currently, during the Address Device Command, EP0's avg_trb_len remai=
ns 0,
> > which may cause some xHCI hardware to reject the Input Context, resulti=
ng
> > in device enumeration failures. In extreme cases, using a zero avg_trb_=
len
> > in calculations may lead to division-by-zero errors and unexpected syst=
em
> > crashes.
>
> Would be good to specify here which exact hardware requires avg_trb_len t=
o be
> set before the 'Address Device Command'. This way we can later create a
> quirk for it in case it turns out other existing controllers can't handle=
 it.
>
> So far it seems other hosts can handle it well, and quirks may not be nee=
ded
> at all. Thanks to Micha=C5=82 for testing.
>
> Thanks
> Mathias
>
> >
> > This patch sets avg_trb_len to 8 for EP0 in
> > xhci_setup_addressable_virt_dev(), ensuring compliance with the spec
> > and improving compatibility across various host controller implementati=
ons.
>
> I'd skip the 'compliance with spec..' part as spec is a bit unclear on th=
is
> issue.
>
> Thanks
> Mathias
>
