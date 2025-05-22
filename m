Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D39E13D8B2
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747941619; cv=none; b=dOU96P99+40vBCxKKUf9UQyKh3ol7tMsKikGFprKNRwyal//R1A3TU0uYnHukUKH0raVWC4BujFLw1V6mnHaA89i6TrfA+XdIBI67f/sPxgcOMhYGM9PP0X61mnETn02MGZBDNLITihawgD3gfocg6BC5xi5XHlMUxJ3S+QehTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747941619; c=relaxed/simple;
	bh=Flu/isAmyCbTrz9xwLn13hoRVk9PwsB7V2D3/wlR9aE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F0YjbKi8tXC0DQ4ppiv/jMFoLKKZPAT7Ex7t4BPxJhWBnhxcshZWWjVf3uyrG4jB+50DWWWXk1O32Idit3HNKNZ1LVUFW43Tm2ca/y4B56kVbhoRR8FShvJXh6yVxWPHPDy2fznMfn9DdtV4IOZREgCWV3yBXDylVrfMalJRlgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kz1ddCio; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kz1ddCio"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c55500cf80so703186085a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747941617; x=1748546417; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgIZQIPQ0j6raACnSoKFPNh2DzvC29iIOKiCMVH+gE8=;
        b=Kz1ddCio8Wg6juUFw3ZmZyvlB8xlyqBYYUdchO6LhII0ZV4DRwiyr76eJXnFRG+hoO
         elC8V1mbezzrlEHIKqZcUfQ3idyrN1jgBnxmbXl6a1JuZ6lowKhRDaTWEETCQ83eaDQS
         XL17dW1jw7dxZl/UrecyXvGHZJuA9hFYZuo0sIVpQtMWEwn46CxPa+C4KxOh0HOyYNYf
         SzQTenoVJO7ZtTb12PSKawsXDi/28va9Kqh+qzSIWzQLgx7db3KgJimnSdMv4Uz6DTcT
         4mDc9vXOlLfHHWyK36rE9/ghJpEXWijuUBtPzGB4uACRmck4NXIcr7n+5/jYHNf/ZWbA
         v3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747941617; x=1748546417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PgIZQIPQ0j6raACnSoKFPNh2DzvC29iIOKiCMVH+gE8=;
        b=RmYOGKwg5hmBASc1HAMLTSgXWvQ3TAB9JzUiPy39cNUaaiAlQIJLUeVNQ6F9hxaRtn
         4istyopBwZd2lfUKY5RHA9xhny1qgXd3fKPtkF8FTksntozihkG3ialKdpeKMvx8P6fi
         7xd/dHy6KlV6bMBF4trF7AJ4fVAxpTl+iLLQh1ODi+/J4qG/m3kovwDMcg4jwyHOeS4f
         tM/twuJ5FSwC7ppSr5mjXhVrxe5459r2+ym6wkMO8p9/FS5nfM3QjMsKoTgYR2wZlhLd
         djHUTSlK3AfzqSV7cPJGILaFlH575uwk4hkjpsLSi6ddHU6k2zIcpt0E7oZc6nrv+7hJ
         49Ag==
X-Forwarded-Encrypted: i=1; AJvYcCUbBiTdROLBuE36vlyYNUvz1l0KNtBpnSkwwrlzvz0M2kLDetzCNcMdFKpc9ehRNoMu3MmDlRBvrV+GsA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhQP0sizQkOYIYpmvdj1s4qHgmfQGwgxjRwGQPng13qKiOivdz
	bfUi/hgYD+Zgc1ZSFMUc5ABBr+HswCRpe9I1aBV/rWYnCgAivTLyRPtW3333oYYRw2Bpu7nGOs2
	c/pzNnxVEyQtIrPh33Jn+ePia6sDB5mOs40dy1XvL
X-Gm-Gg: ASbGncsBC8jWO7WGLCrcgQvl388ITSV6+Bh8SYwEFclQc2Bgi9Rnc0UD/vEE5JFQgjS
	MGEZuiV0R+JxEZEWjKNiIPfUB30KDfRS+oUdE5yTZe1vYhd441eQKrdWMnRdHG2LDFdpn/ftMc6
	ZSuD+Ej4KjELIBYxPtvIAEPzECM7k86Q1wGtsQbXypn9+gtrP6Hy0ZoakCMjC5HV7oms7MOCMiF
	vdYs5Ad++rr
X-Google-Smtp-Source: AGHT+IGm1Btmu3cb/tiOOdp0UebQ2jl7A41+6mFY13R7UjK0iunERZC6D0vXs4YT7J5HKX2YgiexhtSR0yQfkPA2JxA=
X-Received: by 2002:a05:6214:2345:b0:6f8:a7c2:bb11 with SMTP id
 6a1803df08f44-6fa93a29fddmr4939596d6.6.1747941616531; Thu, 22 May 2025
 12:20:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517043942.372315-1-royluo@google.com> <8f023425-3f9b-423c-9459-449d0835c608@linux.intel.com>
 <CAMTwNXB0QLP-b=RmLPtRJo=T_efN_3H4dd5AiMNYrJDXddJkMA@mail.gmail.com>
 <fbf92981-6601-4ee9-a494-718e322ac1b9@linux.intel.com> <CA+zupgyU2czaczPcqavYBi=NrPqKqgp7SbrUocy0qbJ0m9np6g@mail.gmail.com>
 <6bfee225-7519-41ab-8ae9-99267c5ce06e@intel.com>
In-Reply-To: <6bfee225-7519-41ab-8ae9-99267c5ce06e@intel.com>
From: Roy Luo <royluo@google.com>
Date: Thu, 22 May 2025 12:19:40 -0700
X-Gm-Features: AX0GCFuJzBzMPdmywUarQdKbXYdF5W_yqGe-afth_QCS9OITwqZ39S_C5IBtRsY
Message-ID: <CA+zupgxkvm9HxG4Aj1avPA-ZgjVxmg3T3GtbfnV=rXk9P7-pFQ@mail.gmail.com>
Subject: Re: [PATCH v1] Revert "usb: xhci: Implement xhci_handshake_check_state()
 helper"
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, 
	Udipto Goswami <udipto.goswami@oss.qualcomm.com>, quic_ugoswami@quicinc.com, 
	Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, michal.pecio@gmail.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 5:24=E2=80=AFAM Mathias Nyman <mathias.nyman@intel.=
com> wrote:
>
> On 22.5.2025 5.21, Roy Luo wrote:
> >>>> Udipto Goswami, can you recall the platforms that needed this workar=
oud?
> >>>> and do we have an easy way to detect those?
> >>>
> >>> Hi Mathias,
> >>>
> >>>   From what I recall, we saw this issue coming up on our QCOM mobile
> >>> platforms but it was not consistent. It was only reported in long run=
s
> >>> i believe. The most recent instance when I pushed this patch was with
> >>> platform SM8650, it was a watchdog timeout issue where xhci_reset() -=
>
> >>> xhci_handshake() polling read timeout upon xhci remove. Unfortunately
> >>> I was not able to simulate the scenario for more granular testing and
> >>> had validated it with long hours stress testing.
> >>> The callstack was like so:
> >>>
> >>> Full call stack on core6:
> >>> -000|readl([X19] addr =3D 0xFFFFFFC03CC08020)
> >>> -001|xhci_handshake(inline)
> >>> -001|xhci_reset([X19] xhci =3D 0xFFFFFF8942052250, [X20] timeout_us =
=3D 10000000)
> >>> -002|xhci_resume([X20] xhci =3D 0xFFFFFF8942052250, [?] hibernated =
=3D ?)
> >>> -003|xhci_plat_runtime_resume([locdesc] dev =3D ?)
> >>> -004|pm_generic_runtime_resume([locdesc] dev =3D ?)
> >>> -005|__rpm_callback([X23] cb =3D 0xFFFFFFE3F09307D8, [X22] dev =3D
> >>> 0xFFFFFF890F619C10)
> >>> -006|rpm_callback(inline)
> >>> -006|rpm_resume([X19] dev =3D 0xFFFFFF890F619C10,
> >>> [NSD:0xFFFFFFC041453AD4] rpmflags =3D 4)
> >>> -007|__pm_runtime_resume([X20] dev =3D 0xFFFFFF890F619C10, [X19] rpmf=
lags =3D 4)
> >>> -008|pm_runtime_get_sync(inline)
> >>> -008|xhci_plat_remove([X20] dev =3D 0xFFFFFF890F619C00)
> >>
> >> Thank you for clarifying this.
> >>
> >> So patch avoids the long timeout by always cutting xhci reinit path sh=
ort in
> >> xhci_resume() if resume was caused by pm_runtime_get_sync() call in
> >> xhci_plat_remove()
> >>
> >> void xhci_plat_remove(struct platform_device *dev)
> >> {
> >>          xhci->xhc_state |=3D XHCI_STATE_REMOVING;
> >>          pm_runtime_get_sync(&dev->dev);
> >>          ...
> >> }
> >>
> >> I think we can revert this patch, and just make sure that we don't res=
et the
> >> host in the reinit path of xhci_resume() if XHCI_STATE_REMOVING is set=
.
> >> Just return immediately instead.
> >>
> >
> > Just to be sure, are you proposing that we skip xhci_reset() within
> > the reinit path
> > of xhci_resume()? If we do that, could that lead to issues with
> > subsequent operations
> > in the reinit sequence, such as xhci_init() or xhci_run()?
>
> I suggest to only skip xhci_reset in xhci_resume() if XHCI_STATE_REMOVING=
 is set.
>
> This should be similar to what is going on already.
>
> xhci_reset() currently returns -ENODEV if XHCI_STATE_REMOVING is set, unl=
ess reset
> completes extremely fast. xhci_resume() bails out if xhci_reset() returns=
 error:
>
> xhci_resume()
>    ...
>    if (power_lost) {
>      ...
>      retval =3D xhci_reset(xhci, XHCI_RESET_LONG_USEC);
>      spin_unlock_irq(&xhci->lock);
>      if (retval)
>        return retval;
> >
> > Do you prefer to group the change to skip xhci_reset() within the
> > reinit path together
> > with this revert? or do you want it to be sent and reviewed separately?
>
> First a patch that bails out from xhci_resume() if XHCI_STATE_REMOVING is=
 set
> and we are in the reinit (power_lost) path about to call xhci_reset();
>
> Then a second patch that reverts 6ccb83d6c497 ("usb: xhci: Implement
> xhci_handshake_check_state()
>
> Does this sound reasonable?
>
> should avoid the QCOM 10sec watchdog issue as next xhci_rest() called
> in xhci_remove() path has a short 250ms timeout, and ensure the
> SNPS DWC3 USB regression won't trigger.
>
> Thanks
> Mathias
>

Thanks for the clarification! SGTM.
I've sent out a new patchset accordingly
https://lore.kernel.org/linux-usb/20250522190912.457583-1-royluo@google.com=
/

Thanks,
Roy
