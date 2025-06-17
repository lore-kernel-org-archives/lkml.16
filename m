Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5F528C00E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750197152; cv=none; b=HU+fZv67Am2G5e941EKEB2ohCu88xfWgSIUuQTVo3MgvxrKEdUY+lXgWApSNLMeUQDvhX075X0FPbXgnyHxVG0lJjh345fVqzt082FyJ/AMdqqHd2l8Vmh/Bz+E0IyDxYw9bQA3H0JGrf+jYO4BcLTumwdArmY24NVMS2J4OyEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750197152; c=relaxed/simple;
	bh=G6aq9UULzQSeWStHfJCFlTRXAe06thPa3pLZymjNKfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L+EnK3ZY4H25Olkb/eaTdj4A1kJukJJxBr/9UUt7WgC0WY509meDTsG1pgDA5PUf/AFYXCRnkIjMoNqJV4fcBn2UNRqitGXgFqMcnHxMC/2knpND68KMNCDOGBL5YynsglE0tDWS+2OV8i+k1eKUVvsj+rMIWYr61amP7ORzegk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zJsXlUhe; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zJsXlUhe"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-235e389599fso62925ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750197150; x=1750801950; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tk9GnGftZvypb/fve6Tub1/yPh7i0cO/ST2epnsknjQ=;
        b=zJsXlUheUCW2JIG/15+IHtVHkX/mQF9dlkr4jyeK+BLPjAAOHU0m2nmqrga7HVGzC9
         7unkZHSVF8xWoPA+H391ji4FGmtIcWqkgTumss1HQYXdqA8l0mJEhZUkp+R+z7jXGsuk
         iWp462bbNrPjHik0Y9rYmgkSWDgVTo8IyqC6YdJyEYn3lEyTVMb5Un8wRfITR9+9O+AZ
         /A1nKHjlxsxIpEZsqpLaXQWkyN9YO7uY5Ksm+2aBZEWG2JKbv/erbbK7ab+0wVkNAlht
         I1InBMejwQsrOXiIIhJu/L3euzIiI9YnCS8rwt8cBRPY9I7+S1WZHbY758kmCoCtojUr
         S94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750197150; x=1750801950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tk9GnGftZvypb/fve6Tub1/yPh7i0cO/ST2epnsknjQ=;
        b=XX6RAmDAGBManMleLuLLNZ0+Rd8uc72pM5PV5fj4fDfhWqHf+2xZ2jtnbEO2hUouNu
         BxeMRusZqQNjo3KV2ptf8LRJUJTaDcEBXYrUuSh7nIOKzAZsxdhriCeGY4orJ0hoOb1S
         ffyJFau0zImgeQnxb/YYT9206nsLcuKrq2E6wUycVZe1k3/+j7CeoOkgIEZrbruqPnKM
         tDVLjgKq/302t/sdqS89WZJkMtMwRRKxfhWdrSayj8+mV+YSZkhnjowlpM558KxXW5kB
         rttq7ZrLWLeJ/i1hOMZG4K7xJKobw4ZpsdLrnh+rBHLzsyuFf9KT6c73a4e7SlPA0S5+
         qjTA==
X-Forwarded-Encrypted: i=1; AJvYcCUdYoBnym4/jy7v5PArZUXrNY02z4VxN4hWhd7mXrPbQzm6AXJWquHLqZXhw/1sgLF/DR1LMyNPWbwaEMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQSLIJ6oFKTEoD+8rxZysSQHWCMaEBQ37x8c+S0VmNQ9R3fPxr
	0LS5sThdY5yT8R83f72bkcrpOFl4NLO7UxXahYdoa2lbWN7JzkF36b+VA7gufo9Oiv+aYCbCs0b
	8+dqa0R+1MfwPgs72JP3i5iHGclcfWUmxopyMYaG3
X-Gm-Gg: ASbGncvJZxp42ImWR7iiNnauM1BekL6qg7/ZAxPobJ99PC5xRKPdnVt7NUPVogNF/X4
	sqjmtUUsJijXT6JKo0UOU3zwNGM24ABqhc0HtLWAOK05TZJpi1q/RdBx7eyJ0dmdkgaoH+GB66t
	UHyF0DiVuGak2CobjlB3qUka+LHhkSOh8LgNE5HfeDMmiWEaIK9lENWs6aJfFyvyyCIO2MjbHWn
	A==
X-Google-Smtp-Source: AGHT+IEjic+DQ+x5I1iXBb3/VZNJM4D7edP1sy7P3+y0WzbFzyD+lgXbWJrCNXbJ7hLkiIre4KJPn7EyvpHv7CZV3kw=
X-Received: by 2002:a17:902:f78e:b0:235:e1d6:5339 with SMTP id
 d9443c01a7336-2366c8140dfmr9959955ad.26.1750197150134; Tue, 17 Jun 2025
 14:52:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617210950.1338107-1-almasrymina@google.com>
 <CAHS8izMWiiHbfnHY=r5uCjHmDSDbWgsOOrctyuxJF3Q3+XLxWw@mail.gmail.com> <aFHeYuMf_LCv6Yng@mini-arch>
In-Reply-To: <aFHeYuMf_LCv6Yng@mini-arch>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 17 Jun 2025 14:52:17 -0700
X-Gm-Features: AX0GCFvx4bn0aOYkN3CSqdpJSpRaKHHjptdW4cwpAa8d5lG6VPslMmhVC6iQfF0
Message-ID: <CAHS8izOMfmj6R8OReNqvoasb_b0M=gsnrCOv3budBRXrYjO67g@mail.gmail.com>
Subject: Re: [PATCH net v1] netmem: fix skb_frag_address_safe with unreadable skbs
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	ap420073@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 2:30=E2=80=AFPM Stanislav Fomichev <stfomichev@gmai=
l.com> wrote:
>
> On 06/17, Mina Almasry wrote:
> > On Tue, Jun 17, 2025 at 2:09=E2=80=AFPM Mina Almasry <almasrymina@googl=
e.com> wrote:
> > >
> > > skb_frag_address_safe() needs a check that the
> > > skb_frag_page exists check similar to skb_frag_address().
> > >
> > > Cc: ap420073@gmail.com
> > >
> >
> > Sorry, I realized right after hitting send, I'm missing:
> >
> > Fixes: 9f6b619edf2e ("net: support non paged skb frags")
> >
> > I can respin after the 24hr cooldown.
>
> The function is used in five drivers, none of which support devmem tx,
> does not look like there is a reason to route it via net.
>
> The change it self looks good, but not really sure it's needed.
> skb_frag_address_safe is used in some pass-data-via-descriptor-ring mode,
> I don't see 'modern' drivers (besides bnxt which added this support in 20=
15)
> use it.

Meh, a judgement call could be made here.  I've generally tried to
make sure skb helpers are (unreadable) netmem compatible without a
thorough analysis of all the callers to make sure they do or will one
day use (unreadable) netmem. Seems better to me to fix this before
some code path that plumbs unreadable memory to the helper is actually
merged and that code starts crashing.

Similarly I put this in net because it's a fix and not a feature. I
can send to net-next if preferred.
