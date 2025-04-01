Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D876C28E0F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 21:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743541905; cv=none; b=TBb8rrGHpFFttPwVWqwFfK/OmWHwlDL2qT30FzEUKGp5n5b9ZMTxEfRRv/6ODRgPCsNQUZ/qqKEB2g4ZMFHzwdeJ8bLMIaMvYoK+474Ty7tpS4T2afv0rAbLpfaCFtargsKeu9v99/DZeOmAS99CcTKkxoD/FAz+vY4XwKkkUNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743541905; c=relaxed/simple;
	bh=rMjpGK0x20BTqCSxYq4fAVRwIJtldcC0j5qhiRgV2xQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LWQYZxsVDMx+xxN7Y303ctEuulw569d5JyydXvTHI1f3OCkQWPq+y5r5o9+U8QBURaKhSsLRqdWjOtVc+L672hl7GzgsbHLaMroLxfbEoSrwFyH311JlDXPXzbbyNLFIYzQ1FEu1g5na9AhTL8Vyfq4gQmxY9OrcQQKoymeH0aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E33Vgp1f; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E33Vgp1f"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2a9a74d9cso1152492366b.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 14:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743541902; x=1744146702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zZhvBFk6Q5JA2hrTvBAdsvbT20QXAxX8oTVZqicyDU=;
        b=E33Vgp1fPSH4+gABxe34+m/U42EK/PVfgAAealufleRMf5dYfjxaFC7LwiJFbkhOGs
         BFwQxQxOCwn1pPZ3yf/KjWz9wsdESM01LaK/xzXW8H2ak/xEkYy+/UIkP7I5x8XBpRiX
         sNPxTPzbLSFt6Eld/oOtVG+0QK3+ZrYuqwuoMl/XsvILcnDJnoQZx5kDTQapiixF4or1
         ibxFH0YNmzrtNvUHzyCo+S/SKmEZ0UpOd8gf9V8y8rS/jIEB8I6Ll6WslueHM+cqkQ6R
         a7q/SGD10r/IsvEsshf4JisDPpFiz0w07e6KKkpJHkj7F9kAlaA7qljHZa9fLzwIThyN
         bn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743541902; x=1744146702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9zZhvBFk6Q5JA2hrTvBAdsvbT20QXAxX8oTVZqicyDU=;
        b=mUn4sYUmmTgwYLJnJAa9uYOgE+GDXQ7YfIdRPpQHMn6aspzcPmWoWlIOy+ngwURZkH
         9Kr2YlDqJisx8DCPkFyD5cPyTGvOquccmATX8MqiMkIWaLDZkkUioNYW3ufFzuTep+9k
         565rz5oLfZ2qLgu/Yb6tu7GslmcuVPNMOlii7eCITpwY9bX/VMcSyk+bWyvS3nSMLvM/
         vN5ahNdpo6gHAWfcdoLGYmeBzhO2m5KmHqcuEm4rEqWhHpeEaGXWWTDlDJpERISulrT9
         0i4sv1iQjur0bpobvoBzl2DacBcnSrZBbe9P4k2AmUDE2erCstM7PZkSTFUG9KIeVQUv
         r7tA==
X-Forwarded-Encrypted: i=1; AJvYcCU8D2lTlEg4B6q4t/Vt1HLNsqKgJtuqP5xU2necYSy7fDkH9kkJ0AkVH6Ed7XzIpN5X45fGrm0aju/ZEXw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq4jS9A/gINQVeslXPqhKgoXhfyixcn5GFcinZJaJEO7djCGAA
	yQ0XcxnMzWXUxBgqZpHVVsfgYcCNre9CqvFofRhUTfviVBmVrXkYBr9U43MtPTlMquMUkJDlWzv
	4wnazuH4N0W5yeLzgu5+33wrtdSk=
X-Gm-Gg: ASbGncvC0zvCSNEUubynn4X7oYvcJmUiC9zUmFLJJ1SsYC26o4dMCfZ+j1GGB3hFTjn
	Jnyg0tuvxWaoeML6JC51M+25ZkNDdazewnE/oxKpxBp+r1ua3twOM0F4rjKRVR6Tkpteb6zaL7t
	yN2uT5nZ8JHhMCLKBKxOv8O8v3Xi9KveLnqt0=
X-Google-Smtp-Source: AGHT+IGg1AEwIlo8EVhvHp2g0YnS0MUpCk9Dvo5RMMIiqC4BUUSfgI6QGBjUhfVdkZJByeVv7X752TX9+D9GPv68Lhw=
X-Received: by 2002:a17:906:f5a8:b0:ac1:e07b:63ca with SMTP id
 a640c23a62f3a-ac782b6bea2mr357954566b.22.1743541901836; Tue, 01 Apr 2025
 14:11:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401203029.1132135-1-mjguzik@gmail.com> <Z-xOFuT9Sl6VuFYi@gmail.com>
 <Z-xQAyPxQGvlg_hd@gmail.com> <CAGudoHESK=sPyYLjqubjfAy-Un18EML8HX45EgfL+UhiqU8bHA@mail.gmail.com>
 <Z-xT2Td5_8XbSO1t@gmail.com>
In-Reply-To: <Z-xT2Td5_8XbSO1t@gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Tue, 1 Apr 2025 23:11:28 +0200
X-Gm-Features: AQ5f1JrIqMqXH2hayr2MHmpLrvDOJZUUPCRAvYAmGDvzcA-8W0QDZpXcBEeweQ4
Message-ID: <CAGudoHFFr6vWaUocAbQhhq23Hh4r4R+b2vDvA0EJmRq9nxCO+g@mail.gmail.com>
Subject: Re: [PATCH] x86: predict __access_ok() returning true
To: Ingo Molnar <mingo@kernel.org>
Cc: mingo@redhat.com, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Uros Bizjak <ubizjak@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 11:00=E2=80=AFPM Ingo Molnar <mingo@kernel.org> wrot=
e:
>
>
> * Mateusz Guzik <mjguzik@gmail.com> wrote:
>
> > On Tue, Apr 1, 2025 at 10:43=E2=80=AFPM Ingo Molnar <mingo@kernel.org> =
wrote:
> > >
> > >
> > > * Ingo Molnar <mingo@kernel.org> wrote:
> > >
> > > > It's also the right place to have the hint: that user addresses are
> > > > valid is the common case we optimize for.
> > > >
> > > > Thanks,
> > > >
> > > >       Ingo
> > > >
> > > >  arch/x86/include/asm/uaccess_64.h | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/arch/x86/include/asm/uaccess_64.h b/arch/x86/include/a=
sm/uaccess_64.h
> > > > index c52f0133425b..4c13883371aa 100644
> > > > --- a/arch/x86/include/asm/uaccess_64.h
> > > > +++ b/arch/x86/include/asm/uaccess_64.h
> > > > @@ -54,7 +54,7 @@ static inline unsigned long __untagged_addr_remot=
e(struct mm_struct *mm,
> > > >  #endif
> > > >
> > > >  #define valid_user_address(x) \
> > > > -     ((__force unsigned long)(x) <=3D runtime_const_ptr(USER_PTR_M=
AX))
> > > > +     likely((__force unsigned long)(x) <=3D runtime_const_ptr(USER=
_PTR_MAX))
> > >
> > > Should we go this way, this is the safe macro variant:
> > >
> > >    #define valid_user_address(x) \
> > >         (likely((__force unsigned long)(x) <=3D runtime_const_ptr(USE=
R_PTR_MAX)))
> > >
> >
> > Note the are 2 tests and the other one does not get covered by *this* l=
ikely:
> > valid_user_address(sum) && sum >=3D (__force unsigned long)ptr;
> >
> > as in sum >=3D ptr is left be.
> >
> > However, I confirmed that with your patch the issue also goes away so
> > I guess it is fine.
> >
> > I think it would be the safest to likely within valid_user_address()
> > like in your patch, and likely on the entire expression like in mine.
> >
> > That said, there will be no hard feelz if you just commit your patch
> > and drop mine.
>
> Feel free to turn it into a Co-developed-by patch:
>
>   From: Mateusz Guzik <mjguzik@gmail.com>
>   ...
>
>   Co-developed-by: Ingo Molnar <mingo@kernel.org>
>   Signed-off-by: Ingo Molnar <mingo@kernel.org>
>   Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
>
> Because all I did was to transform your fix into something a bit more
> maintainable. I didn't even test it.
>

This is 2 lines changed in total, both trivially.

I think it is going to look rather silly to have this "co-developed",
but I can do it if you insist.

My suggestion would be that you commit your thing and add:
Reported-and-tested-by: Mateusz Guzik <mjguzik@gmail.com>

feel free to steal the disasm before/after
--=20
Mateusz Guzik <mjguzik gmail.com>
