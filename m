Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A9025A656
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 19:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738611203; cv=none; b=sFACcanD7tFh4dJodJxJTTPA7KjtF49/wLVtsHWx7OZfvX6tPARMW+wEnAIRFqRaxjZ1xx+aST5iDcQo2HZYHNw/GXECkQDq/iWASIc/pdWMZVMR6uZq+BhUxajMC5b5zC8VycVNMWNxH5lFerMezMnoF0kHRFyclwLJ3InZaHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738611203; c=relaxed/simple;
	bh=4ic/wvMQ7Fdx6VTzVaKAXmCBC+VizqQo3L+UiU/x1mM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OU8SXMA3gyu/87insdPSmH65R5KMDocJ6ND73UOhFRWPCaff57FaMsgiatH4wVh81FBjczYT7h3uo2XSYFjK8Na2Dfy2LyCQm5TIMWZMpIGKuVvqiMAR2kKKVZRauVGl0Embg9lV6GjHgBCv3SzzXjJ4gIcYkUGfqSPJBKpGa8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4Jca7MI; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4Jca7MI"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d4e2aa7ea9so10307279a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 11:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738611200; x=1739216000; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3Mbxdlki4UNb1fKLMCLgtt6afSbAambNGS14Lpj0UY=;
        b=T4Jca7MIz3fscfIpNeMpK7pg9iGpCBQEbFMU4huvxd8VTberckImUHtgn8xtrb7HBX
         AmpQVL8MwYOyzAMxgIPz1yHDMW7Va2xMTfHzHpWDqFyJJiX/9RglK7hmqF2cjbNWO72V
         n/38TKQiXlVVUxHkA1iZNkDkXkgg8+lva+IfC8e8Ww2LezHUERLT8mP7g6/zY1FXKl5p
         Fjw/CAw6KsnnoDrT9XE3TDkiwja34IXBbap5GB37qxcnuHKxxWKFFZbBJUegyBKTgivp
         pEikpQxtP8m5K4nbI2Oc3n1t/FATUaMf4u1k+KsylVKQ0ay7OQGHGydCRUihif99dqeY
         YOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738611200; x=1739216000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C3Mbxdlki4UNb1fKLMCLgtt6afSbAambNGS14Lpj0UY=;
        b=FkC3X2CyP5LzKFtMfKQeZ6/8kUAyOUJv5cbV+0ajLhu5HLwksfc2HpM9LgFmME92wv
         XCHtAhWWOCjXZr4AHK1yUxE+/MYr/3MVbtB29YIfac88b/gAkP8UL5udtWwo8qo5lesM
         0nqjR5BYE2+GiYmOP0BoZw5vDJbdKcUrkxClLpoBWKTklge3eGzeKuSWkkrwpyHxzPBX
         cUbMnL32e/VVm3MwfzipMr0K+59zJoIrfN5d3tKNuYmXvh6652GRJhfZMgEwTl2ey+u9
         ZvURCNmS/djBbO+ZSJD+VCLhhwGpRu4vLSWiVHRSSpr0dumZORn4GjHf3Wp6OcOAlJkm
         AzhA==
X-Forwarded-Encrypted: i=1; AJvYcCWVEClKvjErTJAWRw77zqHimTJ2hCqJF4SsPDzCaBg0Cf65+56CA3RtJvlB1rAcjjqPvrOph58j0K5lK1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUpfsd++m7w6b8wY7AL8SyqBp3Oiqw7FQA7mKEUEtY8gMvD1YX
	9Hg4BeLLVevYoGJ6Zk5cgHylKyNzrwr1jRO9Zj/C9xpY/CW8GJ/2bT8Me0gF4SOXPyl7oQj2cw5
	VR//WvqyLyzQWQ1Jl30O1WDJ5FV8=
X-Gm-Gg: ASbGncs0eE3bwJcjqgAOxigBkOSiF8hfG3w57ket1EtMoDpAkuNTdT01FUy2emgdYQc
	aWLroEOZPUj5zkI1gZqDCd62chmGytqIV78OjZapPzBVl0B1s+iCTW57MGBd3ItHPRBpyfCA=
X-Google-Smtp-Source: AGHT+IFGDjr0bCmLrrvx1f8jxTqNF0S5/R2+I3JIAkozSnMNxDI++ym7dXk8Hku9koAZrhrlIK4yLeFMuaeCptMlrCE=
X-Received: by 2002:a05:6402:50d3:b0:5dc:1239:1e40 with SMTP id
 4fb4d7f45d1cf-5dc5f00851bmr22854933a12.31.1738611200300; Mon, 03 Feb 2025
 11:33:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201163106.28912-1-mjguzik@gmail.com> <20250201163106.28912-4-mjguzik@gmail.com>
 <20250203180623.GC1003@redhat.com>
In-Reply-To: <20250203180623.GC1003@redhat.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Mon, 3 Feb 2025 20:33:07 +0100
X-Gm-Features: AWEUYZmEPqQjEvfptjb7WFQmVt-nVfYjwqmar3M5fFEh1pCYK8pa6ALc_W9oFl0
Message-ID: <CAGudoHEWJqJf4mhcs1+Oes3qK1zFOYnb8Dnkj0aQD52yjMO=ZQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] exit: postpone tty_kref_put() until after
 tasklist_lock is dropped
To: Oleg Nesterov <oleg@redhat.com>
Cc: ebiederm@xmission.com, brauner@kernel.org, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 7:07=E2=80=AFPM Oleg Nesterov <oleg@redhat.com> wrot=
e:
>
> On 02/01, Mateusz Guzik wrote:
> >
> > Instead of smuggling the tty pointer directly, use a struct so that mor=
e
> > things can be added later.
>
> I am not sure this particular change worth the effort, but I won't argue.
> I'd like to know what Eric thinks.
>

it trivially whacks an atomic from an area protected by a global lock

> OTOH, if we do this, then perhaps we can do more "call tty_kref_put()
> lockless" changes later. And perhaps even add the new
>
>         void tty_kref_put_sync(struct tty_struct *tty)
>         {
>                 if (tty)
>                         kref_put(&tty->kref, release_one_tty);
>         }
>
> helper. With this change release_task() doesn't need to abuse
> schedule_work(), and this helper can have more users.
>
> Nevermind, this is almost off-topic.
>

I have no interest in messing with ttys, regardless I agree this is
definitely something to consider *after* this patch is sorted out.

--=20
Mateusz Guzik <mjguzik gmail.com>
