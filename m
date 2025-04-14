Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D13A2820CC;
	Mon, 14 Apr 2025 14:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744639501; cv=none; b=ro+X3OP6/oTZT/4GxEHM2bcSGF644axo48pujXFzV8FzgSfAY/OUjAYH9ox8dF2r3cuDadv9jmwc6+aToA05wEHA7e+KMJB6vHWMOFNH910NpNHtwzU7kk0cq2NzeGhSh7Vj/EeXxx2hBHiO+WEXYMLpmXMgyBBVxZuO/Nl8d+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744639501; c=relaxed/simple;
	bh=xcdfEB5chZKoeptFY4xJ0U1KQgjZ1oaFIrUheA6D+Uk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SpncJqoNdZhVHW5/bh4MKrgxndf+x4J47rwBdwh5XdA+A0PaHeS21yFRKByvey5dP/LV/Jdf3NDE/i8a8B2kaUiVFPQfHfd4PmUGfGo51F09VTuCaGHOYpVt45k7XU/J1/fbY28cJSDmvNzO3AGFpo2Bl+mhxzUjj4DDD+h/jbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ws8v15nd; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ws8v15nd"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30f30200b51so43506941fa.3;
        Mon, 14 Apr 2025 07:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744639497; x=1745244297; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3c3TpHIM4RMmyecfazoCsNtCiwNPm1S/fai+tCg7ySs=;
        b=Ws8v15ndMTJBf6Ri53E3p6/NTqMceApFcGeffDIaqzC4tnTM5KSce+ELIfLUvZnwi7
         si/qHctYJ+ZXLeriGyUzVYxxr+z8rD6YMhwnr33W+L/HFsp6ungaJ0r+pwb88C47AdQM
         UDg/JRPRoq7u1i+PJiJo+mtCznRgPb9z630Ywy1spJAyhHWCSMMUVrrF3+NAxFcJBFd4
         UwNogcFIsrWXoATOSzmy3sU/+cPelINXzfFwI+i97kUdsETvRAiWkI2Axsdp5axJo9y5
         40OGCeyQOD0PsORVTBk+dB1CLinFEJeCdzashaROvFiwJObAWWdy56OUiP6OhbHG4plN
         be0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744639497; x=1745244297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3c3TpHIM4RMmyecfazoCsNtCiwNPm1S/fai+tCg7ySs=;
        b=BcgzDd3mHBZCn7BilfBaCHLQIQtGj74TjYvMRAQY0RkR4HN0y0aEZ/l5UleSupg1AZ
         6uGI2rr7t9YNmMiXQ82wZ5lyWDLMY1ymPK5MwkMczY7BtRDhOWiqCkqpytWKvXhhz4uj
         ZGDOm/zKVbD/HHjufCqFVjMyPgC6LyFsutXQpNqPntkudVZUHwsMpuoRVYemDTP2mGlR
         IlyKpnG3n0jqJ7h/9kUrf6/KF/ilW4n3aKGoiEWz+njY7JMd9X991/zI0CdI1xMduaJv
         38L3Ci/z69rD/b6m6Ml0owIuRE2WNR3Bn2bnE8bY/9071MHfntkVlr5WB6+bVLw3+Jep
         Iu1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4YVVJWRcRIVrDEiJvF8WtNDzP5zZcFuVO6RZ3K+PJgBTcnjEC1VbDJpJnGlR6GvJIqciOoWXYQmQzGGI=@vger.kernel.org, AJvYcCWc2TMxfq71+7JEREQb1lKDUpOVZtO39veZe8uiNZggmlzlxOZh4rzX52HBVMGdmMLG7UQ7Y+AeqF3gJF8W3Cw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0nlyqq9d+h+lXsHmM6NdjoVDrkIAXDkngxvDg/UxLxDwxyH+f
	Xe2ETuFmM23h8UcIU9WM+5OVLx1fH2bpJJGk/+JO6u5rFhPjqEa67lDs1Hwbr2GZgjX2E6j4kZt
	S6GFZtNuMoU3y6lvJzXJLjhB4JOg=
X-Gm-Gg: ASbGncsSiauk+i82WzmQw40TcMvFe7L4ZwEPJxBnv0RQx7X1QttpLzPemPZfEiYBfKw
	PlLb0yByH8AhZ1SaJaQq289q9qNmeV0RNLU/lYlL4DNTOypEJY/VCfBbaSj6RHLvAh+mbNIARBH
	F/mU1SJdlgP8mSvGgjbIRnWzbXNb2NVhWidmsbjg==
X-Google-Smtp-Source: AGHT+IETlytKJr8LYJQ63o0Q44kILG+njvce1c1TbmYW+W2MPLIL3bpNPCFeGE8YQZp4KTNevlybSTufY1jcL6sKLR0=
X-Received: by 2002:a2e:be8f:0:b0:30b:d17b:26aa with SMTP id
 38308e7fff4ca-310499b58d7mr38578641fa.2.1744639497017; Mon, 14 Apr 2025
 07:04:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412-b4-container-of-type-check-v2-1-f3cc9934c160@gmail.com>
 <CANiq72kAYp0Z3VNS=JgApceCXx1OVXMNJJYcm8OnZdToz0zufQ@mail.gmail.com>
 <CAJ-ks9mrRYkEGJ38tTkDXg0RkSP7K8=wtWBa8y6S3dxDh7ei9A@mail.gmail.com> <CANiq72mWVRoiXisOSmwb6Dj4BSe-s1s+BTpRoU7Le9DVcvmsjQ@mail.gmail.com>
In-Reply-To: <CANiq72mWVRoiXisOSmwb6Dj4BSe-s1s+BTpRoU7Le9DVcvmsjQ@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 14 Apr 2025 10:04:20 -0400
X-Gm-Features: ATxdqUEUWgKttekZwuWxx3UUZYix0046kudWQ8DvLWfwIt7tA90VAkkMFv6CNaA
Message-ID: <CAJ-ks9m72Wrv_=Sf+zsfkKTbz8AdeY-evRwhNqdvAQusV00bLQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: check type of `$ptr` in `container_of!`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 9:57=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Apr 14, 2025 at 3:27=E2=80=AFPM Tamir Duberstein <tamird@gmail.co=
m> wrote:
> >
> > `b4 prep --check` complains:
> >   =E2=97=8F checkpatch.pl: :207: ERROR: Avoid using diff content in the=
 commit
> > message - patch(1) might not work
> >
> > What do you suggest?
>
> (It is `checkpatch.pl` the one that complains, no?)

Yes, of course, I just mentioned b4 because that is how I invoke it -
better to over-communicate :)
>
> I don't think it really matters, since `git am` is OK with it. So
> unless you are sending the patch to a subsystem that still uses
> `patch` or `quilt` or similar, and those are quite rare nowadays, I
> wouldn't worry.
>
> But if you care and want to be extra nice, then I would suggest doing
> what others do, i.e. checking the Git log. That tells me to use `>` or
> `:`, since they seem to be common. I don't see `;`.

Will use `>` on respin since I need to fix up that comment anyhow.

> I would also recommend patching `patch`... :)
>
> Thanks for clarifying!

Thanks!
