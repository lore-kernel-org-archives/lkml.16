Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEA77262B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 00:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750897392; cv=none; b=lFKZ7FaIPDQf9Nezz6222ThyYaNlH9CLQ06DhHUU0cm5Yj4N3m2rGqGnwfP83z+jzj9dbOfDVbE1EBwIMPBKoQ5h0jF/X6ldw8NrTFrytpMNdkdM4NfexZ6DjWEnFH2Uz4+8NfpztAxgC73f22MNu5xhScXkq2ICsBEuPMAiNAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750897392; c=relaxed/simple;
	bh=NCsrN+HdfSuoPmwKEfBglZgoIH5ku20D9mJrTlOeaBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OdALvrjsUzJMW1WsiXjISdrM1IiNQghWzXzzV4gJgIxYCInBxuVU0BwMDX3ZpgmL3HEdCaMebpTDnjtFJE4bd5yTKLziI3FLOcsSy/ejv2o0Zc6+lGmDeBNyB1cUcwYgv42kuP8yDlYxrbYnOZEN0lle01VFofNPSBqJh6HGlGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qKmktj46; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qKmktj46"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-237f18108d2so77385ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 17:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750897390; x=1751502190; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCsrN+HdfSuoPmwKEfBglZgoIH5ku20D9mJrTlOeaBw=;
        b=qKmktj46XZqkCXdDVtADec0Zec3dj35JZwRCtZdCuPecri1j7eaizdKepXoSNYYriY
         QtjJrIyn0f3GadAc1rYJ3wTF1u7FmntBQ7NTBsFS8pPGDf97LCC7plnJ0WVTxTOcL3kB
         KmH5GuGuW5QOfdXZUAadNejFYNzEkoxs9t9rGCjXQFDxtymf8I3pWhorP1X8N9aUgcX1
         gyvQGp2uMbAEdXnlWIwcUVx0gGP7AA04ojInqUZ1Ny9mYhNIuBKeuGUEb9tCE+K4f58X
         9gp4Jdd3spATmhTqD3qgfL3wxmBUHfMgSwW+4UXRTvHdpJOfw6AltXnj0lMI3Fn9uI2/
         yOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750897390; x=1751502190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCsrN+HdfSuoPmwKEfBglZgoIH5ku20D9mJrTlOeaBw=;
        b=jcDkPirfRm4De3ZNkmqE/E4KV1MtPVgKIhj0FrCzHUNMUowb/Aur4FWAjvixeKD+Ag
         Uppv/sVR/UXVUSob3XS56Fv4P6TdXcIGtz9MkMg8bcw7acc3Mma9zF1fNQpT5oQYbFoW
         WU3ljIZrStQh5gr6BTb06ebRizSlU/CCobFKInAKYqBHmVMT1zfP6rpV0dbXNQYXF55x
         47DWF2PFLc9JxM20cVcln9RU3tHvxKDRaRle9I6H0vHq47siDDJR3+lFeTg8Cm76Nsbu
         aglPZCEYU2QLCE8rBDKSmQUCcuQ4GpaKqPHtJcbMe4uCtwOjPkHz4D1qvTvUUZ7OVSzk
         fGaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzvBOFJMOUfAFWc/C9PFj2CwdjRcFAh4+dfTQZmEcaeNdVnlg5j8VJK9XVdruW/4/G9J4Okbm83KCv01A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhvXlktqttRXPnlSif7l38W/NdTLVtAK2Hc0imUnM7qFa/ju+Q
	JFh/mFFNDq1nOvQOqZKZ90npdA8ALRmOuCSM5EKseGKequmDHoMX79OCTB5Fwhs1R4L+iX6HL4w
	nL33zPDlt2CfdVGyRrWMcAKfn1iXFa7j81aLtkcnS
X-Gm-Gg: ASbGncv/PcQQh1tvRxaaR7ABcl0SG4aOM9we1/LnEurTPD3yKEWf9J05euxGYi1q91s
	Naetl8xbwK3Wpu9xirS/xFMpTo6peyh/gsXE/Zzdv0kNsfJHQWMpaI9xeclc+aCUWgopNXHaxTS
	03AHB3a+finUcnIMbHfhTF5QNieu6GKj6zdEgrMZBnIHTYZd9LCg/hkuu04zVaKHIsl+Ey042+s
	g==
X-Google-Smtp-Source: AGHT+IEwuIRJz2GnuYFakjvLvwNdDT0PhaAO+MJrfxFtHd/bqcmj1964+AMMsw9hZf+b6bYiVMNzPCB9JCe4G7It6W0=
X-Received: by 2002:a17:903:1b2d:b0:22c:3cda:df11 with SMTP id
 d9443c01a7336-239785df083mr1424685ad.10.1750897389164; Wed, 25 Jun 2025
 17:23:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619181519.3102426-1-almasrymina@google.com>
 <175072801301.3355543.12713890018845780288.git-patchwork-notify@kernel.org>
 <CAHS8izMPWjmxLWJr+BSqd5jamsFHDOm71NkG7fmm-78SkLxQTg@mail.gmail.com> <20250625170305.40d8c27a@kernel.org>
In-Reply-To: <20250625170305.40d8c27a@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 25 Jun 2025 17:22:56 -0700
X-Gm-Features: Ac12FXyiBMisv4tGfeRxSMIrkn6bU28R4i4OvLr3C7LRcHrlkuJntc45GbrMbFU
Message-ID: <CAHS8izO9=Q3W9zvq4Qtoi_NGTo6QShV7=rGOjxz3HiAB+6rZyw@mail.gmail.com>
Subject: Re: [PATCH net-next v5] page_pool: import Jesper's page_pool benchmark
To: Jakub Kicinski <kuba@kernel.org>
Cc: patchwork-bot+netdevbpf@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	hawk@kernel.org, davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	horms@kernel.org, shuah@kernel.org, ilias.apalodimas@linaro.org, toke@toke.dk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 5:03=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 25 Jun 2025 16:45:49 -0700 Mina Almasry wrote:
> > Thank you for merging this. Kinda of a noob question: does this merge
> > mean that nipa will run this on new submitted patches already? Or do
> > I/someone need to do something to enable that? I've been clicking on
> > the contest for new patches like so:
> >
> > https://netdev.bots.linux.dev/contest.html?pw-n=3D0&branch=3Dnet-next-2=
025-06-25--21-00
> >
> > But I don't see this benchmark being run anywhere. I looked for docs
> > that already cover this but I couldn't find any.
>
> Right now to add a new TARGET one needs to have SSH access to the
> systems that run the tests :( The process of adding a runner is not
> automated. But this will probably need even more work because it's
> a performance test. We'd need some way of tracking numerical values
> and detecting regressions?
>

I actually did what you suggested earlier, I have the test report the
perf numbers but succeed always.

What I'm hoping to do is:

1. Have nipa run the benchmark always (or at least on patches that
touch pp code, if that's possible), and always succeed.
2. The pp reviewers can always check the contest results to manually
see if there is a regression. That's still great because it saves us
the time of cherry-pick series and running the tests ourselves (or
asking submitters to do that).
3. If we notice that the results between runs are stable, then we can
change the test to actually fail/warn if it detects a regression (if
fast path is > # of instructions, fail).
4. If we notice that the results have too much noise, then we can
improve the now merged benchmark to somehow make it more consistent.

FWIW, when I run the benchmark, I get very repeatable results across
runs, especially when measuring the fast path, but nipa's mileage may
vary.

--=20
Thanks,
Mina
