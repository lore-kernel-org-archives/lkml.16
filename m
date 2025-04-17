Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D521D07BA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 21:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744924038; cv=none; b=pUgH6qbfzecNBrHF6GDa/et/XN23KA0mYoxqKWyjiv+QcxIu7g6TN1pDREuWGAZG+UvSzVbUwGJURPfsWsAwEUxLQgHyNG/uivcYyygBqu5AYNHKNo3bP+zwRYynMocVYrmEthmhYXk86KP6ffte3YQ8XNstCJRo61CopAwpHTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744924038; c=relaxed/simple;
	bh=FSHaLk8QPpM/v3S68vYzV0LMHrrbtmhPLPGbdpRe0Vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=syvtyVfAxodY9xKXkUL+PawTqkRXsnY0i3Jv1ZosKEOuSTLTnESxBG6zc+NAIUvJKwZdvox4XWVIi1g2iBvmQBeN6xQB4PDIbNxIq4vl0UK46AHcC/6vh2Klc3DxLxpKFg2HKip1IVgbK/CbzFTYEKTzJ0XU2sG4ON+tvP+/i1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zbe1vOOv; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zbe1vOOv"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-736aa9d0f2aso1519023b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744924036; x=1745528836; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hGDO9m37F8olfB2fdhlZB0IsLu+CvliE5NlH9VjBk0=;
        b=Zbe1vOOvaQCjiq9MmPvJjNDPOAyhIlWnXS/Bud/8EbpeLmuM4uRbvBAUwNFZN+TlbK
         nnah4KpqRN8Sw8N+J8p7Rk6tlPSgiVFkbSZfaa//6cIPxHMjqpnfGEg/rcL/ZLZU8sO9
         VqtmxtxFEv0wMIq8eunajVMc/ILaZJA6R7y4lR8KauwQwjchuWN0r8KkH8JBdfOf4tp4
         +kkdu1+vu8zMJQYoH8jAC+yCr5F7kE7D1Y/NXpj4OSmH4HU3WlZ+ASGsQwLhuHVxDoEg
         hbVvbYMEkFTC6Eqd/1WdDgoaJgISyPSvZwy5Gjwt6bCC1yoNHlOkKVNL0bR9n8YCJ9V1
         UmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744924036; x=1745528836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8hGDO9m37F8olfB2fdhlZB0IsLu+CvliE5NlH9VjBk0=;
        b=wtOj41g/OUz+CMEWSLpBpdWxpoh/auLscXR5uXYc9r5you5BIIYbh51qz5yEYFCEjc
         f1I8bM1YAdl7YJFjpIBB1waMLLpusKwrQ41nAgLnoqpL1/jOZjO+Uj5LgHC5mu5GpfVM
         ljXyvSVuX2pmGSyb1JtUS0zj786nSPSIierdPQLmr5eBMATEk0geNT5SrDhWvrATuPnO
         qEelUvX9uyjfgzBB02xx0/xR1TyYOVNQtP74BbM6M7yAiPVHv5UX1cBbn7yA4Ib5fmDT
         wcP8wx+ZU6kj+bDQIu3Na8ZWVCpQEEG5urNur90jbijDh8y4T6EOW8YQbwnqquhtSAWe
         Dejw==
X-Forwarded-Encrypted: i=1; AJvYcCWFUaRM960YB3neuftcBUFYQjUTVm85y8WrHMHKYv7ceoxjvXnlhRCzoryePUjMqHLNOXOSH1mD98Zi+RM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGaA5Fed7iuZyNugnxGinocoG2Ts3sInnw0Z8MYPlZb2/LAlXh
	6TpZ/tmfln+PBtxQePcZNXVn1z7cwT35zvYYPiBBwdwDjWNPeD0dREmoExIjTSF2XnIMz+x73q6
	sGgcszIk0jongttEc76FWetb4fXI=
X-Gm-Gg: ASbGncsVxO3NYSEJY+Oj5z66PZPB+TTfoe+FYrp1YeMO/QH7YkNhBS+MN0fsi8i8GlS
	1n3x1ioKqvZ6oUJ5UMW6teP0kCUMU1eFm7LoD+2yPDKEEPssVR6Mpvu1brtork4PwZirDDhI/Ef
	0iw/egYwUsB/zdW/N1/IJ1GhP5Vnsh/LDoFRO7Ew==
X-Google-Smtp-Source: AGHT+IEp2h1PChq+hq+IZtAH+fTv1kA9Edtc3QCZPZK50mz8+fRy67JCrHzW/SDMcLPwXeh0/h2rV3TwJ095hr7FSik=
X-Received: by 2002:a05:6a00:3990:b0:730:99cb:7c2f with SMTP id
 d2e1a72fcca58-73dc148fabcmr386498b3a.6.1744924035769; Thu, 17 Apr 2025
 14:07:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417152808.722409-1-mykyta.yatsenko5@gmail.com> <20250417134006.60e0d6b3fc963bcbec1255b0@linux-foundation.org>
In-Reply-To: <20250417134006.60e0d6b3fc963bcbec1255b0@linux-foundation.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 17 Apr 2025 14:07:04 -0700
X-Gm-Features: ATxdqUEFTmpRrsv6w29jFE4h3SsG8NbT9GQel-Hr3_4AXYZwwT22CpCkhYoG-0w
Message-ID: <CAEf4BzZrQbpp9ZrSj3PTm2P1CAT1YG6O8zN6dc0FdJjHLXTP7w@mail.gmail.com>
Subject: Re: [PATCH mm] maccess: fix strncpy_from_user_nofault empty string handling
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>, linux-mm@kvack.org, rostedt@goodmis.org, 
	mhiramat@kernel.org, andrii@kernel.org, kernel-team@meta.com, 
	linux-kernel@vger.kernel.org, Mykyta Yatsenko <yatsenko@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 1:40=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Thu, 17 Apr 2025 16:28:08 +0100 Mykyta Yatsenko <mykyta.yatsenko5@gmai=
l.com> wrote:
>
> > strncpy_from_user_nofault should return the length of the copied string
> > including the trailing NUL, but if the argument unsafe_addr points to
> > an empty string ({'\0'}), the return value is 0.
> >
> > This happens as strncpy_from_user copies terminal symbol into dst
> > and returns 0 (as expected), but strncpy_from_user_nofault does not
> > modify ret as it is not equal to count and not greater than 0, so 0 is
> > returned, which contradicts the contract.
>
> Looks right, I think.
>
> But why do strncpy_from_user() and strncpy_from_user_nofault() have
> different interfaces?
>
> /**
>  * strncpy_from_user: - Copy a NUL terminated string from userspace.
>  * ...
>  * On success, returns the length of the string (not including the traili=
ng
>  * NUL).
>
> /**
>  * strncpy_from_user_nofault: - Copy a NUL terminated string from unsafe =
user
>  *                              address.
>  * ...
>  * On success, returns the length of the string INCLUDING the trailing NU=
L.
>
> This is surprising and I'm wondering what led us to do this?

Agreed, this is very surprising and error-prone. strncpy_from_user()
semantics is a bit better, IMO, in that it allows to "detect" empty
string even if buffer size is 1 byte. And there isn't a lot of places
where we use strncpy_from_user_nofault (only 6, it seems). Maybe we
should just change the semantics of strncpy_from_user_nofault?
