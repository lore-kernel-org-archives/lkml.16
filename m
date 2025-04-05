Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2C314F125
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 12:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743855928; cv=none; b=qXxzLtjOn+CqoBPwyfN3IpniuQVE/Qegopf/QiaVTGVLdRE1Ne9UCIZFR4R6w0oYlDGDnyhQj4XYbhFhsACFG/GnIMCdJmQs56DSpwbl8TtWcXitQT79PHmehbAETeehJ8qL9CLzmGDzzlzYm8q4NmXs3JiqD8WYiJ5P4vE+LJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743855928; c=relaxed/simple;
	bh=CYduOFeB5IT3Kco1O/4Tx9MEW9QbS2Wtx+nqAPLrNlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UbRs6byxkLdyuBG/k1M5PjImq4KxS0KoAIve6kcaZLNOSeG5/ugPA55GmtkybdHLa9N53PJfnFyjuIna8Z0qCi1noif6EJH+fA3qgAFKlMfasCw6DOqJ95ty4MSqdPvhkdczx2DX2XgUdq+f0+iFPXa1TePm0mrF6vAGh3C6rC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+ZWxrpO; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+ZWxrpO"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5f0c8448f99so2680623a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 05:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743855925; x=1744460725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lyilPmtJoJj5gHj0tU+EtQiAso8knuigx97pyKiZk8w=;
        b=d+ZWxrpO3pT8cS4MUcbFFEwGxHtz1b3YbH9q0caIi6eHqYT5gKMiNIK7Qxd3mjXM0M
         +eQQGiHdAbFK+9xUlJu3AB3ZNIbEu7CYqkqU13ba+Rv/3avjo3tN3fPJbo/TH07UI7A+
         clxC8a+rmM45VxbXwNVakIwCzMiwEUyFENHxBKJWFx77YbHGAc4FK0SjIKX2dkkCJaWf
         EYz8HHxH5VNZb4BE1zm6URtHjpBiW9W+M9riRQpUgzQ/1jTc3R8e3srI2CxG/2u3kyDV
         t4Q2AuyDOwYo6jE75gfTFYMZ5930ijpY7HsunCJw16L/QDrAAY/NaBt1rfSIUH0rWqay
         Mjqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743855925; x=1744460725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lyilPmtJoJj5gHj0tU+EtQiAso8knuigx97pyKiZk8w=;
        b=M7gOvBUzqOOeSqKmH6haAni6To5jz+e4c2fu/bRRsNSw2xu8tNNBSEIvxj86yofl/C
         Lu9LSgCa7raxWSfdQKBCdyt2r38s/TSbgxWeP87nQL06+DuFhOitGcMgaac2yu0TsMOA
         0cwcH/4BZC1315mDNylynkfpCEew898V/rH2XtxRdq2vdhfXasKufhCQuWYDYgmyr1HI
         bJdkhrLyCu5bZ6SWAdr+3ZA/rzgO0pLr/uhT6ZaLMMJ/0QI1LtCA/3jSoxrAyk1ML5aC
         HHuxpQMoj0tmkRFxtvRZK5SFegi6AuCpcHK4N+E5q1GcW1yx6jDGyoFUkVUVUNONb/wb
         jP2A==
X-Forwarded-Encrypted: i=1; AJvYcCUag9QCr7zNsrHucxBBk4q/TEWUisglrexNfuhEqgW+vLe2a9k4zz3yx2P0vWf0SWJmEJ5P8qtlq3egypU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJHJnaXltD3tL0EtKOJRtEq+9oGjOidPgO8jX/5pc/YVgXinUf
	EkmQ/o0t5QivbpFsWbXZ+gEWYrT7GVrF8AXlbbCwBPeXLJ1W0//z0Bfo7dHrUvmtQX7PlSqgmO1
	m9yj3nz3S2E7wd9uC1cC5cPHoCY0=
X-Gm-Gg: ASbGnctorHd+YvUn/oFYARystO4nvrAIjSI5jtIVj7fpubwV9wQw/N1kALfXephvjr+
	cDkowVm5Isjc9Qpq5/K9atqhEciLbr+uasv8TXULmNfNQ82vf09t1VyDtxq0K6cyrYqN1oV8YYV
	MAMv7UbQjJOa8GPX19YJ9n7ZFVEg==
X-Google-Smtp-Source: AGHT+IFMeUZD+hS5ek/jSytgiuRMwCslST268AHJcAuN6buBogopfowCPWraMeSbqEcUGXq/8/oNF3gCMyBy3mKLoxw=
X-Received: by 2002:a17:907:3e21:b0:ac7:c688:9fd7 with SMTP id
 a640c23a62f3a-ac7d18942b8mr554424366b.18.1743855924499; Sat, 05 Apr 2025
 05:25:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z/B019elTtKG/PvD@ubuntu> <2025040547-vagrancy-imagines-384b@gregkh>
In-Reply-To: <2025040547-vagrancy-imagines-384b@gregkh>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 5 Apr 2025 15:24:48 +0300
X-Gm-Features: ATxdqUE5jVhnJsdiUE1drw_4pt6qvWaSrkgfi25HGTYyoscM5lE6n-dkdOMmrKk
Message-ID: <CAHp75Vc0vOB1nDLrV+wmYeshxTsDwYq0xBkmJiOH=d5HONRpNQ@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: Use % 4096 instead of & 0xfff
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>, julia.lawall@inria.fr, andy@kernel.org, 
	dan.carpenter@linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 5, 2025 at 11:23=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Sat, Apr 05, 2025 at 12:09:59AM +0000, Abraham Samuel Adekunle wrote:
> > Replace the bitwise AND operator `&` with a modulo
> > operator `%` and decimal number to make the upper limit visible
> > and clear what the semantic of it is.
>
> Eeek, no.  We all "know" what & means (it's a bit mask to handle the
> issues involved), and we all do NOT know that % will do the same thing
> at all.

And that is exactly the purpose of the change. The % 4096 makes it
clearer on what's going on, i.e. we are doing indexes that are wrapped
around the given number.

> So this just made things more difficult to maintain over time.
>
> What tool suggested this type of change to be made to this driver and
> these lines?

It's not a tool, it was me. I read the code and suggested that change.

--=20
With Best Regards,
Andy Shevchenko
