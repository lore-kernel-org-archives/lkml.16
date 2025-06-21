Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5E920C49E
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 16:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750522201; cv=none; b=QaA89EgpKcWJJqlBpZmPRRkzroP824Q1k31NzHSRR+VzuCmCJ/5bBYAjP5V2fVdvvktCNzQCVliE9TkAV67gvoSswIPhLtwhw+C05L0WaR9LqEdIwSIOGP1LhspQK7eEm3p++j0YhD5+QX579Ed2Tu3N/4AqojS+uKAI/L0Z93I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750522201; c=relaxed/simple;
	bh=hZVmROOzt5gmR/oCOgZdaBilYrkNqyZT7daFih7mQeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b4e3tdA4ihEOqBh59XLi7OwYg6aekFNoXLxyef9G8L87x4HiQOjvmA+IBuOoIhk3k+W6ytt2GImryuODr0z2nee4jsY8YnWbxG8jBrD1tRzLvs7/LwOCtg5u5NU/os92RP42NvP1yvGunJc8kT0c1HzIDXUZTGJo+vqqxAmK/po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fIDCT9Qa; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fIDCT9Qa"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-acb5ec407b1so469667566b.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 09:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750522197; x=1751126997; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bR9CkFS1o49k2KhvLWDphFNGNkDZGgw2MDOOVeB8Wlk=;
        b=fIDCT9QaxOIFNEU7EpKQrFG1R+u//wjnook0ViX06hlDuFwKz8EXL/bAQQaWRle6Gw
         wRRUVJUe5tPZ2rmssPUKR3ShJdGvcFIJnw3tgSZApFUFRx2/p4ulzgcMvfQo6Xscf0Rg
         ULy1fA3A3ZokRE9WO27h1E7y7NLnqb+eNswNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750522197; x=1751126997;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bR9CkFS1o49k2KhvLWDphFNGNkDZGgw2MDOOVeB8Wlk=;
        b=GXxOCK2pjmYy7JC3Ij67E9MB8ShjpsX6jmriKJyUeEO5ImKROZaHuNpUZ3YBt0sJES
         hrMOS5CrZbCeH3L/uPBM//tzT05J7nNMcxVtjyiTiEj4euX8J7l0+7ANdWOJ529Fr1sZ
         brG759ODTWjlbGJYaBkaFNJZl31ZRU9FI5Xfr2GsmPXO73nz3TtoxNjZYoSgRaBDnTGf
         FZa8XLAv2eoycU8ClFipEfUN2ghGc6Fq0UpNHcZWRxbWII64PzgkQDzDoyZphaK6k6cY
         lqV7A5sxxViUuCwtd609JacQn1I+Ws1r29fPo9LUdwxa6gvmjHa/f4is6DQdeNjahO9q
         0MSA==
X-Gm-Message-State: AOJu0YwdU68id6oICUuPh2fLyk3tkNL3HipzMltX0YKnTYnQRmeYcqzh
	kU6bjo1vzFy3RMfMt2yZLsHefM9V92z1mg2VE7SEMJwg/1RnYVSnZZLX3iFhK0vRitGerIqmyC0
	09+jI7tU=
X-Gm-Gg: ASbGncsMFfxhUwBtNqH74a0vriamkJm31H119D790sXQxt5BzVSXrfsNf3UJO1LuIhw
	iRmo1SXrc7Q8k4ECQ3WfUOV8+gUfrzO94snFo8GZIMi+LSG2DYdU+0z/7c2KkXg4WWb31hhr5WM
	UeRfrvuO68h/MYUKQs4H9zMIU+ToCD/gu17s145gUkk0H0d2j2W+KuHD4K62Cw8uHb9SJ9+mSnb
	Avf00oIexTjOfYNsRBM7oKnbyGm4epigaeS2F2gj1Y/TuoXFcWUoqAy+2fnoI62sIKDcW6HHrSx
	H5NzwiZ6z40lqfquHl73UN9+a0H4dhuDM/8Ad8i+P+LzAaJcJNQ24YtHA73WRtpe+uK7rjuyapU
	SyL8jzVZwKBmqOA0OLeGk4nJGo1g+aHxqjTWW
X-Google-Smtp-Source: AGHT+IF7j8OROhKGqifUY1Vmr7w8F1EaDnL+6Aa/0V4OlCsioYpwpZp8BnQNw58iSHyU+9gwfdCpwA==
X-Received: by 2002:a17:907:3e87:b0:ade:32fa:7394 with SMTP id a640c23a62f3a-ae057b6c123mr572769766b.35.1750522197252;
        Sat, 21 Jun 2025 09:09:57 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054083c95sm394055966b.91.2025.06.21.09.09.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 09:09:56 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6077d0b9bbeso4520065a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 09:09:56 -0700 (PDT)
X-Received: by 2002:a05:6402:2550:b0:607:116e:108d with SMTP id
 4fb4d7f45d1cf-60a1d1676dfmr5557990a12.21.1750522195823; Sat, 21 Jun 2025
 09:09:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAH2r5mtz1-JLM8PEZngKOd4bwESBLU+bw8T=ap5aMmJ6LOaNiA@mail.gmail.com>
 <CAHk-=wjZXRvTnAwO-EcheuHkjOmq2YMua9YC3sbaXYBQ+FC8og@mail.gmail.com> <CAH2r5msQwv4LuaF=kmmy_n=z5paCyat2vTZowOB46WeJxpwhiQ@mail.gmail.com>
In-Reply-To: <CAH2r5msQwv4LuaF=kmmy_n=z5paCyat2vTZowOB46WeJxpwhiQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 21 Jun 2025 09:09:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgReqMNHT8Y8W0jdbnhZBqsY3Omga8wYQJ-yVRumzSDwA@mail.gmail.com>
X-Gm-Features: AX0GCFshO2Qs5pTCKhyWhLvRvDT1-MxhzQG3NIDdJZYSnFdFeiznfZUuFLm6-W0
Message-ID: <CAHk-=wgReqMNHT8Y8W0jdbnhZBqsY3Omga8wYQJ-yVRumzSDwA@mail.gmail.com>
Subject: Re: [GIT PULL] smb3 client fixes
To: Steve French <smfrench@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 21 Jun 2025 at 09:00, Steve French <smfrench@gmail.com> wrote:
>
> I can remove that and resend, handling special files properly can be
> important (and there is a much more important patch being reviewed for
> fixing some symlink corner cases) but SMB1 is much lower priority.

So honestly, if you had explained it as such, I would have taken a
look and gone "Ok, I don't care, this area hasn't been a problem".

But instead, it was sold as fixes, and I went "that looks odd". So I
had to go explore, and decided that it looked decidedly like new
development.

End result: now there is no way in hell that I'm pulling that thing.

Trying to sneak things in is not ok. Claiming things are "fixes" when
they aren't, and me having to figure that out just makes me unhappy.

Just be honest about these things.

Sure, I don't always check, because smb hasn't been a problem, and
maybe you've done this hundreds of times before.

But that's also exactly the problem: now I feel like I can't trust
your explanations because they seem to be whitewashing what is
actually going on.

So instead of a "let it go", it's now a "I guess I will have to waste
time on these things because I feel like I have to double-check what
Steve sends me".

Which is what neither of us wants, but here we are.

            Linus
