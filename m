Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541692222D2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 20:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744059496; cv=none; b=W8VuHF/C1M9p8yOvHE2Wh91sffw1NmX//ol9VieubBX1q4ZJZk+QANJ6HajS4HewLTQ4+BSUqLiSLbzxL6xO/0pGMrP5+4VcJUUWmfUBn99g3RrCs4da0frtwo4SCyUmcv/t8j++qMPs51Nx5a+IGORXP37iM3jGZM7ldqBEgDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744059496; c=relaxed/simple;
	bh=zUJ41ZEdKneZmcfN4gKME3SUOvx/FlghYDIs7u5++dk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ru4OWTGFOhBjEqCSWyQfrYGDkKv9yzSqqEtW8x7VBs7BfrCUSQsNwnKdyYTRWrr5OtNnnqjuXnaUl/TVijPU3FCGjUkAGcUIyOi4HoOBnCMldszlk8STI9tAdbou0ZMA8m2nN34mMv9NFHzZySobqLgYg1cSMHrVog3Tpr9F66I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuqjmT+l; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuqjmT+l"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-523f1b31cf8so1979525e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 13:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744059494; x=1744664294; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjQmcvDsvjEdE4QG0ylteb0iRIEFhO+OPGY6ri34DpI=;
        b=iuqjmT+lWHDN850khrwBg4Ds/YiFT5YLVbOBDxV+umkHizdTZ7J5O9vWWRKljB9hln
         fDvgtLAc3lmCVoT711c/oWAVpyraoSvq+dwKRgYfYnbasfEJ/wp/wGkfFLCtw4u+KqeE
         Mw5D7TXW2eSdNJ8pcfVZvt3MCcalwiiM9YrImD0ANCcODeugIEYU0ujs+jxwj9Vv6CN9
         1x+12yZmfvdiY+7uPYMb7/bcrBwG8Ix21G32fxucCrSxuaxf7Tk9iQx8N55SDrEfsqzk
         +sdFDj+IVPymdaj89kshfm3GcM2224164uBRf4awJFtfiZqg1cF1nlcxsQZoCXTdwtx7
         Al0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744059494; x=1744664294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bjQmcvDsvjEdE4QG0ylteb0iRIEFhO+OPGY6ri34DpI=;
        b=jpQ2JTaGX1Yl7KcDLLWCscHroePtNvTb1oT+d9nCo+NTQsK2uirI0tYBsuJOvl+To0
         f5VI4IxFPNPHl3ElBWlKAKeOtucSKyV1OeBrukF9Q0xzgoOpMqOP6TC5tWvlYA4dKp9l
         VOzd3xO7T6ab/puWsiZfe4fQK8SLbSIOCaPjbyp+5uoaSnBP4mW72nonfZb723+1MhkZ
         lXChxA6FCHF4dW3/kHt+fd2oUwzU0alOWQ64Ljobk0Z8zfSgMoq6+btFr+Lpz9u5hhpz
         0s7m265rj7D+cltoqUQzG7p2/cATkAJ9DFvy332WG2A+D30jA4aLiuaXrQZA0aECB7+y
         FjuA==
X-Forwarded-Encrypted: i=1; AJvYcCVl7sqj9SxSXDI4+ucaleUOztpRXnqFRZChwf+qd11zEMYhEra+5vQJ/jXeUP3mrTcHfidpTkuy0luRsvI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxti3WvaPMD6sbWL91Bw7SERA9YEsOsztCdOLM+tHzImIo7SALH
	KEuSLRKDvRlN0RDIh/SpjxIiNpd90/FIE+UUfPiwF2eD6YmTzRH28wSBPcS9xyh6kkFknorp3M3
	yLdNrW+krhoHqbaiJhFOXPEL0+DA=
X-Gm-Gg: ASbGncuX5r0G92uWB3CaTI7w+v7gLKOhgYiouf3++isROuLBgYKyIzcUiBF/NhfEYIC
	oWUmd2L7+xFfBnI37dNTvdHIxC0wYroieTdHqOr6p2Xbx8U/ta9i9S7PxxhpuPB+OXRTwHjgd9F
	qxwsXjKOYC2v1m2cDijg1zCN7ma5Fw
X-Google-Smtp-Source: AGHT+IEAXxVQkImXDwoA+ny5U7LSZBqlhE5wwveej72BW29iMwXaVRAZEfY7wQUyqXryMYsOBfpAGWxbu6ALI9dbteE=
X-Received: by 2002:a05:6122:660a:b0:527:67c7:50f with SMTP id
 71dfb90a1353d-52767c70798mr9537670e0c.11.1744059494148; Mon, 07 Apr 2025
 13:58:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z/PyMXTjCHduOhKX@HP-650> <CAHp75VdtUhUBL5d103RunY5EvgmTQVH48S21N1-1KmDM0q44Aw@mail.gmail.com>
In-Reply-To: <CAHp75VdtUhUBL5d103RunY5EvgmTQVH48S21N1-1KmDM0q44Aw@mail.gmail.com>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Mon, 7 Apr 2025 21:58:05 +0100
X-Gm-Features: ATxdqUFdd_Ptxa4GLZ49mQuV1WJ3ENWGee8KMNYcQF5pT5xDLfQ_PD6ytACWYog
Message-ID: <CADYq+fY5fbENFa9b53HKNPrCHTfR6YPDektUoTi8=9h5ZbxbuA@mail.gmail.com>
Subject: Re: [PATCH v5] staging: rtl8723bs: Use % 4096u instead of & 0xfff
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: gregkh@linuxfoundation.org, julia.lawall@inria.fr, 
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, andy@kernel.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 5:17=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Apr 7, 2025 at 6:54=E2=80=AFPM Abraham Samuel Adekunle
> <abrahamadekunle50@gmail.com> wrote:
> >
> > The sequence number is constrained to a range of [0, 4095], which
> > is a total of 4096 values. The bitmask operation using `& 0xfff` is
> > used to perform this wrap-around. While this is functionally correct,
> > it obscures the intended semantic of a 4096-based wrap.
> >
> > Using a modulo operation `% 4096u` makes the wrap-around logic
> > explicit and easier to understand. It clearly signals that the
> > sequence number cycles through a range of 4096 values.
> > It also makes the code robust against potential changes of the 4096
> > upper limit, especially when it becomes a non power of 2 value while
> > the AND(&) works solely for power of 2 values.
> >
> > The use of `% 4096u` also guarantees that the modulo operation is
> > performed with unsigned arithmetic, preventing potential issues with
> > the signed types.
>
> ...
>
> > -                                               psta->BA_starting_seqct=
rl[pattrib->priority & 0x0f] =3D (tx_seq+1)&0xfff;
> > +                                               psta->BA_starting_seqct=
rl[pattrib->priority & 0x0f] =3D (tx_seq+1)%4096u;
>
> > -                                               psta->BA_starting_seqct=
rl[pattrib->priority & 0x0f] =3D (pattrib->seqnum+1)&0xfff;
> > +                                               psta->BA_starting_seqct=
rl[pattrib->priority & 0x0f] =3D (pattrib->seqnum+1)%4096u;
>
> To reduce churn, it would be nice to have another patch _before_ this
> one that makes above clearer (by adding spaces) as we already new in
> practice that it's hard to read:
> So, this will become two lines in each of the cases, and in this patch
> only one of those line will be touched.

Okay, I will send a patchset for the change. The first one will add
the spaces, then the
second one will add the logic, and they can be applied in sequence.

>
> ...
>
> Besides that I haven't found in the changelog if you have looked at
> the entire driver code and checked that all usages of this field is
> done in the same / similar way and no need to convert anything more
> that these.

No, I have not checked other drivers. I will write a semantic patch to
match and transform such cases

Thanks
Adekunle.
