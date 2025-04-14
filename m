Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6721D63E4
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 21:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744666010; cv=none; b=IRS/4/EJcOgAApwVqeiWWo5VuEtJKjSk5gUIAKzllNLPRQSMg/X8TiHcGislt2GFYpa5ZV5ChswdcJ8hD91+hRVdUikt9x3rb2IPQ6DVWK7B3he2R2Q90/AKP8eyTfGtlDRTpW4XnMyQBDEn7NhqMxbdAB2rdfAyVDrFwLt5hjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744666010; c=relaxed/simple;
	bh=4t2rtLVqqU0aTkJeDPtSqq4FVhOaMGn3kakYdD+NjSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nxQMpzpGC62MG9XUskLKS2BwfUTCQKM6RSbRLHHLtDgptPj4ljqn770nuON9QOccuFr26IKreMEnYG17/92CoNS+611suYf0/qjo5rz0ZZ9+LvAANfLfpxYT5u0RGQ6Gd19dyubEEehkUDkNy3qrTdtfAEDD3EhvHhQTNUmPFCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KL4J1r6L; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KL4J1r6L"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so3057414a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744666007; x=1745270807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4t2rtLVqqU0aTkJeDPtSqq4FVhOaMGn3kakYdD+NjSY=;
        b=KL4J1r6L4atQzQIib5/hCoMQCn3uIm5UzrZyTJ9PRgYS0UfYwSMQjqB5gWJzP59mg+
         42xokV/JMBRl60dfI9pPhCratwegq2Myz15WbsNs6TUWeKvK8FMoT7fzoOksZzdEAXdQ
         ywulrhSZ4UTcGjowjSg7q6zZkE5X3UJbdCYg4ubFgh+fZCOor0ppnSH/N8pH2DqOMlA4
         3D+WHcehRAdPAc0tH/fsHBev7LWxFocxFeF0rfNLKqpXjH2PdyEBFNdUD46cm1MiMoJI
         ZsbxOK0xQ5yxzHBcDqAgKZ4kEFGnh7BF7t2xpkl/+K/k7eAv76CdMzPKMJ8y326MsLQy
         kdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744666007; x=1745270807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4t2rtLVqqU0aTkJeDPtSqq4FVhOaMGn3kakYdD+NjSY=;
        b=FZHKxrLP0gthaCIOoHqpQwc04/5WEUxJwWcqVMP0YAMpKY7sKHiGLxg6YJFR5rVn81
         TnJYwWf9urJ5yXUyCPXeuGA6iOQG3wdAZ0gso8Qa1X5L3SlmWsolt15ZHvAsXlLuRQN+
         lxGabBJmpG7VEdU+RDemwggkUzJtFmG3mNcEr077ST2g+lOMPFuvYQf87Moeph7RXsWx
         T2yQumguquGo2has/clBSpnotVHGRphz/uHnQ58BCW+1JhH879nALdAMQ4Y9Ju/tLp3S
         rOVhpT1iGcHECECOnH61/yCMaeo/j3uxrPAurTLYu0XYlskzcE5lwh1xqoMNWXsjBfWn
         rQ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKQD0m9n+W7PCreVxFAU1AZXBgpXw94i8aVsYfdmxizFxXUu6tXID3bvGw+VM4cdcCj1VXNkEsGpmJnwI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRCylfWVxKIwt3n8Gtszb3q56fgYdDY7YmTWuKgeXoaD1gDGxS
	hld5tL1htlyNzxo7LbYCGgJqOe10S+FNqXfSi5Vi8riKRSCFO5Lfhc2Kmo/78lsNvXpyorq0kVo
	nPuwu2KTxtTehTm7Fz1pNOrlbXU0=
X-Gm-Gg: ASbGncu9FWggvxe5MGcHlu7cI6hp4EJEgyoSMNzXCM8ckrAJXo6UMq3iJCWKiZNNgFY
	xspHhVjBUJhRXabnrNm7wblNCM+9U/hkfvw5UDCW7jn1F2PDgc1MCz+r08v0Ou797EALcFACNA/
	tKPMN4BOjkBIVQX9r6+6xv
X-Google-Smtp-Source: AGHT+IFX7NdWsPkZIK7ChMY8jRnvLH7QWIwuHybxq7167LI22diypZoHx+d7FAAuWNWxWNxqFnXF6UbH++2MYTG5CVg=
X-Received: by 2002:a05:6402:4027:b0:5f3:7f49:a398 with SMTP id
 4fb4d7f45d1cf-5f45dfce67dmr1017949a12.12.1744666007160; Mon, 14 Apr 2025
 14:26:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411121857.GA10550@redhat.com> <20250414-lappalie-abhilfe-eb7810af39bb@brauner>
 <20250414-tintenfleck-planbar-656144f25a3b@brauner> <CAGudoHGyN5qno0TVfY-vCJBHjkDd-CL82-W_o7u6b+qXraAJVA@mail.gmail.com>
 <20250414204535.GI28345@redhat.com>
In-Reply-To: <20250414204535.GI28345@redhat.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Mon, 14 Apr 2025 23:26:35 +0200
X-Gm-Features: ATxdqUHHz-GRSQvHsttRZh3ZUG8ItZSpptA4qnv9ZCudjhUcl5unxudRVNw7xOA
Message-ID: <CAGudoHGi6yZNDVzA1coEu5t4NB_PB51wo1tJmKV0f=mxzWs=0w@mail.gmail.com>
Subject: Re: [PATCH] release_task: kill the no longer needed get/put_pid(thread_pid)
To: Oleg Nesterov <oleg@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 10:46=E2=80=AFPM Oleg Nesterov <oleg@redhat.com> wr=
ote:
> I'd prefer to move add_device_randomness() after release_thread(),
> but perhaps this needs another minor cleanup?
>

I have no opinion on that front. As far as cosmetics go I would not
touch it past the nit I mentioned in my previous e-mail, but I'm not
going to protest any other changes.

imo the real thing to do concerning the routine is to figure out if
the call is even of any benefit -- it very well may be this is call is
only there because nobody with random-fu bothered to remove it.
Personally I have epsilon knowledge of that area, so I'm not even
going to try to evaluate it. But it would be nice if someone(tm)
reached out to random folk concerning it. Worst case, even if it still
has to be there, maybe the sucker can trylock and bail. It does
contribute to contention, likely for no good reason.

--=20
Mateusz Guzik <mjguzik gmail.com>
