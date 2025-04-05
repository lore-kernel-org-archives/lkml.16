Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DFA224F0
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 14:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743864382; cv=none; b=DCnL/MgFb93P6erDe0AUZSKWOVg3swe9sfw9j6cht+sK6Tt7RK6ALA987+NTYCD3xaAHjvKJFryX8lCCRY5WZRr1LSncGZZuUT1aT9xIbemiQKFRwc5dLMC0bVnZylgF1RkY32GpwYuaW+ZatQUeiKzOdIU4O0gTt/fhFRP5xIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743864382; c=relaxed/simple;
	bh=4asEjp1/CUAT4ELHa+ao/ESAjyZCB6F1cHbC44yhvBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iNpSxMt70wVJcqI2CGqkEBPvnxcjCfH/2ZuipMO/2j5Q2M5xJSuGgWKEQbU8FzvqZwBB7yYQ4G3a3o6JUMs8QTR+r/OF8jkImfhLRYXfFLCm85XAXR7EhF+7TX/u13NbtRE/oMLQsw71lit/FZO7cGm0tkbsUDggSNMpiWixZGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PN0gjs/i; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PN0gjs/i"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5240a432462so2534529e0c.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 07:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743864379; x=1744469179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+q3WuE1NuO4BYZGOUfo2Q6wcwmVDQD0eIUmam6gSKw=;
        b=PN0gjs/iJvcoo9pivBhis9oAmeTZ9QZz2801UQXa5huYlqsTCfy4MM/t8cogBNkaAY
         gfJjqldEoIHxr40j/5xmJxipjnZvbv7Feckv5slrGYNiZaLM92uphusca16NYjCvgEDd
         OVDsrJ3WH2pinFicSyWewI2gfty05cbhZHA1rUQh0LF0XIoHxJ/h/nkI8/42uxWroc93
         PTUfdVuPzzS1Btxp1i+Zs5w7+Nk0/H2JD9APnxJ5PHbLurpMKXdY6sGtyMKU2c495XnN
         YZILehPYYVsgEyhXnpTaPprtB2BYqyIhBBJg6KsEqFxwZ6R9hB/yK++ieJAjwxtYP4GW
         fXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743864379; x=1744469179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+q3WuE1NuO4BYZGOUfo2Q6wcwmVDQD0eIUmam6gSKw=;
        b=OVEVWFOGQ7YCjMK1kUphhyoejHhmNVxSnugpbE+xNgo1V6DIa49r91z/hGHziXAzLK
         ExJJOOj+2ofp2tHgyEzSSlwOte1S8jY3CVlHH2ErLYHFe9JFiWMsQCMTN5BXmWesUnBj
         AFAD4k37raXTx6giBmaIT2l65+4CSQOJ93scpjb4Lf/BxCNS9DRFx9tmkDQHgwepcPgc
         y0k6CRznkgTKOjzWgZ4vLcbu9U2oCVPreGXUq1zZxdy0BTXtoxwUOQrxBVRmFfod3Jgw
         T580SmqPTcE4NAMcthz6TJ4YjfXhHL7OICGNBj/ce+gUQJjUdcS2Q+Ctro0JrnjaxXx6
         u4lg==
X-Forwarded-Encrypted: i=1; AJvYcCWl9ycb2Ts4cJjn5CcCue16KVcGyw4OnVS+v6cORbvqKRHQDpHLWf2KGQn4MyFpif75MJSsVRyMMIKtSvc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpL4BC5BxppNpmh0dAGDXXCSVWXvJsK/jDOh0W1dARrq8FSQSs
	xhMiGjzeqAsWUtvP0ugSPP2ur0RB5oE078PsN8YcLo78okUATe3kJqODKuuzPEZZOVrvBL6t9ZP
	rzKxLsSqUtrKKuZ7+VyN7L8CzLHw=
X-Gm-Gg: ASbGncu2pIBT0sIVEjc83IFAQtA/sxr1tzFIc+pvDs9XnujexRca0btYs/DFJwX9htT
	kjP1G0klzbYjJOYbCllUBXZSDSGxh/+okkjjKtfJO35NQQCQBSq2E0fFqIpFoIqdeQ/AiGTitSS
	YPR8p8bGvoIilf/D6BSUmvwjLj3Mqq
X-Google-Smtp-Source: AGHT+IHK3HALCKLcqM31l5+4z/urCJhqbEIAa3hFB3B36fwMqBaiINXqmQPTg1JRU5BQX1UJJ6O770sR/t1LVxpF5QU=
X-Received: by 2002:a05:6122:1686:b0:523:eb47:2884 with SMTP id
 71dfb90a1353d-52756b4d089mr7598741e0c.6.1743864379634; Sat, 05 Apr 2025
 07:46:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z/EuZuvGyQ9QBl6z@HP-650> <7e94b75e-6959-75c-ab4f-58147fc37dc@inria.fr>
In-Reply-To: <7e94b75e-6959-75c-ab4f-58147fc37dc@inria.fr>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Sat, 5 Apr 2025 15:46:11 +0100
X-Gm-Features: ATxdqUHrDub-sVlNR5liL3rucUsftUW0tBdBhtBxgcddbIEWCgXS8YWRk2oigZg
Message-ID: <CADYq+fb+L9_S6WDJYKdugCVNCd9kT2QvEURimPHb+_3r-PoADg@mail.gmail.com>
Subject: Re: [PATCH v5] staging: rtl8723bs: Prevent duplicate NULL tests on a value
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, outreachy@lists.linux.dev, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 5, 2025 at 2:30=E2=80=AFPM Julia Lawall <julia.lawall@inria.fr>=
 wrote:
>
>
>
> On Sat, 5 Apr 2025, Abraham Samuel Adekunle wrote:
>
> > When a value has been tested for NULL in an expression, a
> > second NULL test on the same value in another expression
> > is unnecessary when the value has not been assigned to NULL.
> >
> > Remove unnecessary duplicate NULL tests on the same value
> > that has previously been tested.
> >
> > Found by Coccinelle.
>
> The changes are found in the same way, but the code patterns are overall
> quite different.  It could make sense to make separate patches for them.
> Then you could make a log message that is really specialized to the code
> in each patch and it would be easier for the reviewer to be convinced tha=
t
> you have done the right thing.

Thank you for the feedback Julia.
Okay how about the versioning. Should I make it like a Patchset?

Like [PATCH v6] with the cover letter and two patches, one for each code
pattern?

Thanks
Adekunle
