Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C450186E2D
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 19:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743967914; cv=none; b=NR9NT5w5pM+na+pjkZX6chvEu9PiRMIRnp7Nf508Tu7HKO8dcLJeabiGKPAhJ7GO2XF1S2REYqQh0ndrBZR/U1+qI1eN7nE1ZrkBzkXt2t3t3sOxfn7LUaJlP/ubcklupCrbSBtjuSQkPkPWyhWqNHo3bQdiFACDlhjl7DkUIRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743967914; c=relaxed/simple;
	bh=ob3wX7Z2aH473XCTO6TyZAABWSoJMmsRjLmXdgn6j3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q/XSWPtWHd/UWRiyuf6YRAx9hl/Imda6Iwd2XcrKqzOSnSbc/ly1sIrKlHCL30KEoCBdJ7YTMegvUloBUnBY5T3fPxFRbZW4mi01MqocO1PwHZwOLisoNjWPV7PpPnPMu38+zGalIvnzqGNCZEm7fs56AUyHuyVioUCQxa9kxsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qbge8Gm4; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qbge8Gm4"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-523f670ca99so1613307e0c.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 12:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743967912; x=1744572712; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQ+1s9oM9qObthyiZTuc9f3DRpIrodclF0EeUJvoWj8=;
        b=Qbge8Gm48TIOthlFgyMJtvGWEVezOw3HjCvt03MQjdboTJFp4UPLi/oUMSHLbvsaBy
         GWzR0aU78S/XQc4oAPhvBJIagaDx/k8tiMDFzo5UqgGtwa1fiy0eGvOBcS3Sz0hdsNZQ
         qzMd3QQGOVZiHXTz8zsB6jNRENH/0V3CikhH6nqpTyH213NAYDgD2c4SRiCmRrW5ychR
         NvjUxxFnGfGGiu9eDry3C6V24EjCFzMj8cIOuFVdONXTptQs1u5ergEc2cmwHXFo90oo
         XOjuC3LjeN6SgBlm4KtUWHotlLKAhMpURWkFl/I9B1FMW9KpXJOgr9DjQWjQxKE+Tqg3
         hXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743967912; x=1744572712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQ+1s9oM9qObthyiZTuc9f3DRpIrodclF0EeUJvoWj8=;
        b=t72l5Rx0eJPXRQVD8QRiGm/OeCr1ZjxZl9F8srLP7bFyL9PEOsM7Ad4lQVKzZlsWMo
         I3Itlhu7vYf9YgYix3HdArL7i/ix/xqtz5iO5YBL9S7FhfRJ1c22/AGoizgEKPWs7ppn
         IYjLbpr6Lk5ahabtra49lT8i1r8U2/oEkKPKdgDiofjPNeK2ij93etSO7z/4brNGE4Ko
         4J8+MBKmE8v7suatEHgJ9pzMCMNgQKRboqmmNvBtqZslFitx3QBG6vAOT2N1Z5CrGMX8
         RZO+EFXKDaqc5qJGMSf9tnB/829w3ijdy8YKsyg7P/cTNJGhrWhWBYpo8jHsMpePuSO0
         zkrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFIBXR89IYaGPm4VuyAs+wwqOgdCN2hs/XypYLleENQ2MbU8XQkDvZgPkVt0ehmpyGMuAB1ceyjL3Rbfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOq/G/n+l97RuobbZEGYTC8fYOOQijfP8Iaus15enp/JsBaR6d
	BXvaN3DnEtdQiab6b43VAUsqUy1498BfRdOYb9cPwRksrUhMW7LVqij21O9cf9MUbvOGf2Hp0km
	o62/KV1OmMT0zW7mmUIG4sfy1y0U=
X-Gm-Gg: ASbGncvYkMHHLLqV1qoFlSTcgA+WnNwdr8IyTrQlQC073T1lzmve98JBN6OUNaeZD9U
	xaHwGepludGyblowGqGlswo+JXavfwBQhfrYCPh8JJ24exYnPCK3S8e6jTJ6otTmbt/5zfblyxy
	QatCy4sTZs+G6iZZ9yW9cjQkDFw8IcBqLPV6j9cg==
X-Google-Smtp-Source: AGHT+IFaTgwtQVCB6dQah5vMwzim3Svop74d4yWLu898tFNTbqeMiT0OUhcPEPufushY4bP01z3/U8c0RW0OWnjyL5A=
X-Received: by 2002:a05:6122:31a3:b0:518:965c:34a with SMTP id
 71dfb90a1353d-52764430de3mr8438174e0c.2.1743967911889; Sun, 06 Apr 2025
 12:31:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z/B019elTtKG/PvD@ubuntu> <2025040547-vagrancy-imagines-384b@gregkh>
 <CAHp75Vc0vOB1nDLrV+wmYeshxTsDwYq0xBkmJiOH=d5HONRpNQ@mail.gmail.com>
 <d3b4e3b4-b5cc-5b5f-26b6-1d726f5e57c@inria.fr> <CADYq+fYMPGFdFvNPyo_XoNdMhh6qu=h10Gb2EDc2Jw=JK9iXig@mail.gmail.com>
 <7f48a42-1921-77d7-1cf4-fb6ea8f6fb7e@inria.fr>
In-Reply-To: <7f48a42-1921-77d7-1cf4-fb6ea8f6fb7e@inria.fr>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Sun, 6 Apr 2025 20:31:43 +0100
X-Gm-Features: ATxdqUELPCmvuG0sH2XItW_r_2KDPuczJ4AeCUXp8FXnHfDHkOaZ8YzZ3FOsH-8
Message-ID: <CADYq+fbsYFZaS6EiAKPhv5vf9f1_Z6vho-vDENeYwR3=bvR2xg@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: Use % 4096 instead of & 0xfff
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, andy@kernel.org, dan.carpenter@linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 6, 2025 at 1:59=E2=80=AFPM Julia Lawall <julia.lawall@inria.fr>=
 wrote:
>
>
>
> On Sat, 5 Apr 2025, Samuel Abraham wrote:
>
> > On Sat, Apr 5, 2025 at 1:30=E2=80=AFPM Julia Lawall <julia.lawall@inria=
.fr> wrote:
> > >
> > >
> > >
> > > On Sat, 5 Apr 2025, Andy Shevchenko wrote:
> > >
> > > > On Sat, Apr 5, 2025 at 11:23=E2=80=AFAM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > > On Sat, Apr 05, 2025 at 12:09:59AM +0000, Abraham Samuel Adekunle=
 wrote:
> > > > > > Replace the bitwise AND operator `&` with a modulo
> > > > > > operator `%` and decimal number to make the upper limit visible
> > > > > > and clear what the semantic of it is.
> > > > >
> > > > > Eeek, no.  We all "know" what & means (it's a bit mask to handle =
the
> > > > > issues involved), and we all do NOT know that % will do the same =
thing
> > > > > at all.
> > > >
> > > > And that is exactly the purpose of the change. The % 4096 makes it
> > > > clearer on what's going on, i.e. we are doing indexes that are wrap=
ped
> > > > around the given number.
> > >
> > > Ah, OK.  Samuel, indeed, the log message was going in that direction.=
  But
> > > probably it should be more clear.  Why is 4096 the upper limit in thi=
s
> > > case, for example.
> >
> > Okay thank you Julia.
> > So I can add something like this to the commit message?
> >
> > "Replace the bitwise AND operator `&` with a modulo
> > operator `%` and decimal number to make the upper limit visible
> > and clear that we are doing indexes that are wrapped around the given n=
umber"?
>
> No.  First say what the upper limit is.  Then explain that a module
> operation is thus more appropriate than a bit mask.  People need to
> understand the reasoning behind the change.  By saying "make the upper
> limit visible" you are asking them to trust your reasoning, or more likel=
y
> requiring them to reconstruct it.  You need to make explicit all the
> information that is needed to understand the change, so people will know
> what to look for to verify it.

Okay thank you very much I get now.
>
> > You also said I should add a patch for the white space around binary op=
erators.
> > I did it together because the changes were on the same line.
> > Should I still add a second patch for that change?
>
> It's quite a different issue.  So, a second patch seems reasonable.  You
> can do it before yours.  Then, if someone still doesn't like the modulo
> patch, the spacing patch can still be accepted.

Okay then.
It makes a lot of sense.
Thank you.

Adekunle
