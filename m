Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4C819F495
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 14:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743864930; cv=none; b=EG+2lNwT+R6nylh1W98owvUCZQ1JFKvcEyiYIyrekR3dRog7tNq8OUxg5JJHiz1VoxVn4TxJZ8sHQe+WVghwYLQkNyU8aoLxlFnmw7d35exOKlLSCXzelrMC0q0vL8KuXW8OrRNdnoLHvKtn59xbtOtlWNtWs31unLVN3GiQ3Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743864930; c=relaxed/simple;
	bh=KN+GUQaDkyiC/q46ZCA0E+OC/aTo3sC5uzl2Y4YoofI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BgFi/lEY9Am10q0LWalu1LmApgTsvn0UgDxmZ3yBhf1N8blrnu1uJ/U3+d+8StAlTwOEF7H6yrzoKCJD0gWM0av9AregsxRBIi5PXbGKdpu+vdGJFbLz8Iz7uH0SbCn9DsvbDDz5TRMwsYURqCjdzKeXmRFNA6nYXETevtNUimM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dawX8ZJM; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dawX8ZJM"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-523f670ca99so1338732e0c.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 07:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743864928; x=1744469728; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0bylYK4rbcZkE8OQEolRnIpH1EzfwJRH0eir4LBzBk=;
        b=dawX8ZJMGmvrfrCU+zejubtPw0GAQB8f193VmiONcQOqFjb717X4l7aIw0+tUbPke7
         8jfpOxNmkorL04rQk/MEx7kDjldMVuJLkXgxzqF15fQ76O5mm0Km9mUWcRJBxUAHJl9j
         QtMlGq6tl8k/1cgZtxYg5MEWXZaQEDnt2SONgLZfw7RjFLaCReUabXlD8II2SMCH+5Qn
         rx3qlNC0uAsL1/KPlZKnj3Gpn1ukI69h3LhfNlMkex31dxVXJ8rV1FJxzGTcMbwN2vcX
         CEDLHXnXCTZL2aCAJ79JCH7eZgxf7x6y6g/6vJdvF2bhWgBiUSne2b4vZaXstao6fvPR
         phHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743864928; x=1744469728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0bylYK4rbcZkE8OQEolRnIpH1EzfwJRH0eir4LBzBk=;
        b=cw/L6bEhLSYRvK92/jsbkX8BTgQ9IaQhLh7PtTxvIjX47AJiMZavvIgJOSeIyAc6zF
         HvNC51HrfWZ34I6pmfACVZ9MuPwjEPv8E0pteX4JZI5h24P46uf5pZGubCaZghegySsA
         ppDIIHeVu1IRrthDCPNJpROY2axwbuEs/86MlnJvFQBem9M/RLvZraSEyV5ihJiNP/tV
         HX/blfZzhUam9lAma66eZ83EqOACOe+ri9eMNo3Ibk6kpyjDM4IcX91G00x2Drzuj/4I
         a9EUCHmdqTS1S+tSBlpFoird+7R2Rd9mrrT1BcdnY/aAOmZPItjpc5zxP0uMxnsG7riU
         5Irg==
X-Forwarded-Encrypted: i=1; AJvYcCUhfWnfIimEtOG6dXdzkhVe4jT7O006gZTl6mhzuLHlY6I38VQQWRXYnfhEDwXf/TNLvHOvWJnbItLvc8s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj6Krbyk7AcIqJhTinY3j4ptNl58J8DO87Z/x5P2RU/vGjX5ZH
	RyjpFAPM6keje3GOV+BllXxQN5VYYqLSCXdWllYcnxxtjnLKTQocR3zGAGVR1/Q+VxKk2GMNQK9
	NV+htLBVsO10KQd2gftQBG/98c50=
X-Gm-Gg: ASbGnct4C6rtTHrGEFMao/1vna0F2xvx4MXiihln4ch5AlYR+2pr8Al7RS/K4mlngf5
	hQDFdIw5OOceTBVhDDe0b8Wbl2DOUI8IETUAzMzkVuY4f/RSrs/x1M9k5MPt9VlXCcVh8kBP6PM
	6yv2UP72d+VLNPNAM+fgMX/iELIL1a
X-Google-Smtp-Source: AGHT+IFXdU/YZAvxOJqqLDDhDC6P7HTyP2c16ab3xeaYKa0koLLHuUjJ71njQgO24nXztiAlRXq0RvDB6HV8pHKbYt0=
X-Received: by 2002:a05:6122:a09:b0:520:42d3:91c1 with SMTP id
 71dfb90a1353d-527645a5e5dmr5259213e0c.10.1743864928204; Sat, 05 Apr 2025
 07:55:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z/B019elTtKG/PvD@ubuntu> <2025040547-vagrancy-imagines-384b@gregkh>
 <CAHp75Vc0vOB1nDLrV+wmYeshxTsDwYq0xBkmJiOH=d5HONRpNQ@mail.gmail.com> <d3b4e3b4-b5cc-5b5f-26b6-1d726f5e57c@inria.fr>
In-Reply-To: <d3b4e3b4-b5cc-5b5f-26b6-1d726f5e57c@inria.fr>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Sat, 5 Apr 2025 15:55:18 +0100
X-Gm-Features: ATxdqUHEUzZewfl8XOUc_Hod2fcZH_lElHfHjiW2nrFT1vgN6wa3S2r6Ya11cKI
Message-ID: <CADYq+fYMPGFdFvNPyo_XoNdMhh6qu=h10Gb2EDc2Jw=JK9iXig@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: Use % 4096 instead of & 0xfff
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, andy@kernel.org, dan.carpenter@linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 5, 2025 at 1:30=E2=80=AFPM Julia Lawall <julia.lawall@inria.fr>=
 wrote:
>
>
>
> On Sat, 5 Apr 2025, Andy Shevchenko wrote:
>
> > On Sat, Apr 5, 2025 at 11:23=E2=80=AFAM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > > On Sat, Apr 05, 2025 at 12:09:59AM +0000, Abraham Samuel Adekunle wro=
te:
> > > > Replace the bitwise AND operator `&` with a modulo
> > > > operator `%` and decimal number to make the upper limit visible
> > > > and clear what the semantic of it is.
> > >
> > > Eeek, no.  We all "know" what & means (it's a bit mask to handle the
> > > issues involved), and we all do NOT know that % will do the same thin=
g
> > > at all.
> >
> > And that is exactly the purpose of the change. The % 4096 makes it
> > clearer on what's going on, i.e. we are doing indexes that are wrapped
> > around the given number.
>
> Ah, OK.  Samuel, indeed, the log message was going in that direction.  Bu=
t
> probably it should be more clear.  Why is 4096 the upper limit in this
> case, for example.

Okay thank you Julia.
So I can add something like this to the commit message?

"Replace the bitwise AND operator `&` with a modulo
operator `%` and decimal number to make the upper limit visible
and clear that we are doing indexes that are wrapped around the given numbe=
r"?

You also said I should add a patch for the white space around binary operat=
ors.
I did it together because the changes were on the same line.
Should I still add a second patch for that change?
Thanks

Adekunle.
