Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7235A264A6D
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 19:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746472595; cv=none; b=PipbjtSy9kbARTlFkTqJpo5uziwKCmP2VSRs/QAjBiPDaubNFYfxPdJ2eyM3yp5Qi23vfH9F2/gmoEQ8AZeCzDS46dnyDt2HWqB8gUYdhQcngUCGn0mu7Ivmzbb1r6yO+65TiTHwOvF4qzUxkUUfDG6681BJqWSlT7TxD9GCVt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746472595; c=relaxed/simple;
	bh=HVlKQTkpmc1YncJ2iiXAkylrcADV9GXDzdyqB/r3UEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZPO6LavAUqaT3hvMFPzM96vO+owRSaV0Aj1Zgd1cVuaA1t1LtI0OHXcgy0kcOjnWI6j/kfrJ+TYa5EQ5dJhEyxc7vrKNJ+hCTWmHVbBQavWFeAkuXkcFZz6V9FEV7L7JUbtFN+ATE/WNJpkOZu+3FxCakRLputAXLvFkZP/1OWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FMt22awz; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FMt22awz"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f88f236167so2247a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 12:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746472592; x=1747077392; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4UqmbbEpCvFVQT8fRSD8VX2Mt6JubvT+2Yu+nTuNU8c=;
        b=FMt22awzqLfxMFVC0kd1XsqjMvjSHAfbat3moOB9zAG1aelJuQz2VBpoh0iOuzfaZm
         giiUvD8mBc+SZvlvHhwcEkDwiW4j0xR/Br/OSmQ/B1f2Jb62GqhO3mircSmy3TGedfGX
         Nc56wszQuu6rsHnZ1+lzg2F8mBHcIiUyjmdU/nOAcSr76C+Oe/UnF+OHv9sg/OinEUdo
         uKtCYHfWAojfmOkoSt/RMkb85r2C2GTFt3CBfFiHKPlA+UvLonmVGo9u59lD1FyJy+fT
         vwwVGOnppEsEyuUMz4jFBe1QM4zSMA0KeryPuzuWMmicgAfkeOeD6mn9iFSWe7+kCFsT
         mrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746472592; x=1747077392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4UqmbbEpCvFVQT8fRSD8VX2Mt6JubvT+2Yu+nTuNU8c=;
        b=w7bkhhZuNWFHYKU9fHrtXgfeH3lboqNzhaYAHvOFAssXzoshdwMP0GQQ4wtrzs18Nn
         Q1OPG2z2ut5QPEwLh8Yqhm4EKAmk70/siakpvbnrp6P5/30fg3IuJYwu+UH+nosuMzR7
         qk3v7QKiTwZlZM53a5Uomw1u474IqyvWDGrp0Z/sCkHgVb2UttIczxpr+9Sy7NWF2ZZK
         0ssBsVbDbyAPySDjSFxG3bI9lef9aijHxAZVOTLzv7f9J5M5qTnl8Yd+PoypiEgykKsg
         wC67xrYQCtsLff2+MxZdNK+NytzO5+LmbdiGI4CGaHNtx/iisFHfuaXnal9uKnyw4DB3
         vd9w==
X-Forwarded-Encrypted: i=1; AJvYcCVi0+aV5RzbJUiKvQPEqN9kBK9V/jOPyZqtPqrglfNoWVyJk8IwiuZnIA+/JQOv9rcK7+aaCOd1AuGc5F8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkBR+9bzRmYBxdVeKhKGatiENqi4sb7Z9005PQ9/t7TDq/z0QX
	3Z+nzCKtxFbB4jnOGH42V1COh4Xp0dVwE1DsYYhkTnh1gsu7/xthcEPeqaECAeWcQVBTzSKog2Z
	XbwIFRp8CnP1v/mmll/8C9JrOhPB8X0M8Qcu8
X-Gm-Gg: ASbGncv6SNRG0fm0XUVyYbmNA4tjkKhPOYtBhVLElLAqG7mPcoxBOPdAhhkMi2LxGrx
	cwd+wua373jCtXhgjztaaEH/bCr4+maTtTPDvn8PCUc4GeiO50wEU+iBZxNuo5ZAR6bbYAkyOmf
	vYZmn51u7T0SGHpIcTYWk=
X-Google-Smtp-Source: AGHT+IHmEndQB6Tu83bwh7OyDMnJ3xUrTl1zQK3v8JOE6AWXBWphQCyFZRFldhee0Ein2K66Hf2nzymTQKHcwAOhqb8=
X-Received: by 2002:a05:6402:1a29:b0:5e5:b44c:ec8f with SMTP id
 4fb4d7f45d1cf-5fb72db5ff0mr461a12.3.1746472591505; Mon, 05 May 2025 12:16:31
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430214049.2658716-6-samitolvanen@google.com>
 <20250430214049.2658716-9-samitolvanen@google.com> <5b0fd8c8-8466-437a-95de-581075f8faf5@suse.com>
In-Reply-To: <5b0fd8c8-8466-437a-95de-581075f8faf5@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 5 May 2025 12:15:54 -0700
X-Gm-Features: ATxdqUEpzHMDOd2NBhfWi5EWsSiYjrdwE4P-bz0XIe34l-giW6gjF4PygfxhK6M
Message-ID: <CABCJKuc+mXoWZsQRwCMB=8R8WM_bnC-pfEpkdyQPqVnyQ7Kc-Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] gendwarfksyms: Add a kABI rule to override type strings
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Daniel Gomez <da.gomez@samsung.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Giuliano Procida <gprocida@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Mon, May 5, 2025 at 5:17=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wro=
te:
>
> On 4/30/25 23:40, Sami Tolvanen wrote:
> > +static void type_parse(const char *name, const char *str,
> > +                    struct type_expansion *type)
> > +{
> > +     char *fragment;
> > +     size_t start =3D 0;
> > +     size_t end;
> > +     size_t pos;
> > +
> > +     if (!*str)
> > +             error("empty type string override for '%s'", name);
> > +
> > +     type_expansion_init(type);
> > +
> > +     for (pos =3D 1; str[pos]; ++pos) {
> > +             bool empty;
> > +             char marker =3D ' ';
> > +
> > +             if (!is_type_prefix(&str[pos - 1]))
> > +                     continue;
[...]
>
> I'd find this mini-parser more straightforward, if its main loop started =
at
> pos=3D0 and looked ahead, instead of starting at pos=3D1 and looking behi=
nd.

True, I'll send v2 with this changed. Thanks for taking a look!

Sami
