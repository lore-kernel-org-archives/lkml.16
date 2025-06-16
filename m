Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BF820C00D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085904; cv=none; b=tZal0l5Rfix69P4IYW4gp/4QTvQlPNdfgXdlizfyQb7dkj9IBsrQ7mnHbp47C5XYhTXL9zbNFmrsE70b3wQs27+SYFpgOgAdZWdhpmPe6OrQ48q/e71kfRn17zywHQC7buYy02XcSWej/hHUQcsRB8Q4plKo594Vsbcso1fIi1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085904; c=relaxed/simple;
	bh=cPrfXMOyiWg+1h9JS6Q6gagkKfqg1QmmYqOaKsbzlBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NAr2CSG8KfI7Icluxib5Alnxy0hHfN8Q0VDy2YxBBYAe9ifjebUeW6IUi4HzXhDWLpw1JYwBa6fw/HT4cHvo1BvFZI7xfvksI+lCieQr61qw3NYmUPFk0EkHnxbi446tsCKlP5lqr40UrZa2xvmakkFj8JaeTDgPfP+HlMnCZPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=ia6evUwi; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="ia6evUwi"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4a58ebece05so49237731cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1750085901; x=1750690701; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuMKK0wxk2Ppc1cObPUWbdepum9enQdFn8eNSrTwIrE=;
        b=ia6evUwisqAqbsdfGS2WQmeFvKFqfSOW/rmLZQxtc4azBceotQXLEFO5kpZgvAVAny
         tqIBfos4/uCaFNz6ZgRpimK4t1+XmKWkRe37dRA3nkgewq5+rFYG+R3gpDLBqs5LDUux
         ufNKmtKMM+weH3NnAGJb4LdXODp3iPGzpbepysVzv2vEvF6Bbd4W/fEW3d8YseAlAW5B
         XRhmAk+vWEX4npvwNR4KJnjD6+xzyRDsC7lhE6xPnIHxW9SAyMkVNXCM5vLo0nSVif0V
         ig0orE2NNRpqwD9gDf6eOs+Ln5aGN2yuzl69rpH2tSy9kFnngm/NOi78lBUwhPAqBqzD
         6wTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750085901; x=1750690701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DuMKK0wxk2Ppc1cObPUWbdepum9enQdFn8eNSrTwIrE=;
        b=ncUR4SgMenvUzWkbXkrW3OEQjmbfuMlD6wW+McRtheMK043qH/d4202WMr078WX22K
         FwnF1fPcKNFHmwGUD8qawMHLuO11tm/DAA6PMKUhhrvLDWjWJlKuUItA1/s/vNnATvoY
         Tp7GWWdjanGjxDw+PHR3YgMCE0b+IhgH9mpaqDAZyRTf15SHzHSinKIpsmKBUud1GsqV
         7nqxAfJxJt0P7iGv+oJjZbaXWC2H6lXtDOu63f8Z/YKkoCBYnhGaYu7z/rcZz829bNke
         RstAfPCKz8fpwlMsy7yPbPM1aD2ybD10Aifmld78/QatHM4tsSxYzae+gTfkKAjgImHH
         rEHA==
X-Forwarded-Encrypted: i=1; AJvYcCXjlfsXHitWIDDKkx4ojfMxe0PGntl1jkG5I/cCLwWNxS//bp7suhEOXG9PouMIXGNaT3vDoXHzN0NhS6o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8j051Uma+667FJsGX5PBQbDNdHULeaWuNnml0BTnecda6Sd6z
	t+LqN9MPjeS2lyhZ77uOwAPqvNl1jNxq/t/hrj5r+z8sbDozWoAWfrTFYAM3TH3VyPY/ooA2HnG
	rs/bbtrptcFVU7mC6kloLfrxVoFJVo42w7vuV4Xr20g==
X-Gm-Gg: ASbGncsGRX+JSWf7LyxQNzo+uCKcnLA+uDVfQ69uiEUaxGJe4CLpCBoxWRv6HXN/fez
	MLC5RPq1tJRlmYSRdYegla2UhqSMTS9KPdhdqNszN5HhHxtq+gO/St1fnt9q9MpE5LfLh9/gERS
	Zaqkm1s9w/E03HRHwXLbwZHO/00qxzHsuA9XyldmP7
X-Google-Smtp-Source: AGHT+IHeqnVp8310ARaaqnrcuIV7Bf4XtpwoW0IDiqPPSGX8Jd8nm+uznItPFIhEpr0JFzT8rjNxr8wKmjb6IQDf1UQ=
X-Received: by 2002:a05:622a:1814:b0:4a6:ef6d:d608 with SMTP id
 d75a77b69052e-4a73c609abfmr154969901cf.38.1750085901185; Mon, 16 Jun 2025
 07:58:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-10-pasha.tatashin@soleen.com> <mafs0y0u6rx8y.fsf@kernel.org>
 <CA+CK2bCigGJJqtSt1-4GP0JPVCZrTa6WS4LiMTT0J=04G64e5w@mail.gmail.com>
 <mafs0h60jmzzc.fsf@kernel.org> <CA+CK2bA6zsdARkRMQwadD__qXOzjABcRnwdZjfdnvLf26hsz9w@mail.gmail.com>
 <mafs0a568vuf5.fsf@kernel.org>
In-Reply-To: <mafs0a568vuf5.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 16 Jun 2025 10:57:44 -0400
X-Gm-Features: AX0GCFtEAEaQHrRq3yY3LztJjK9AZdUJhVhSl24FNdkzOUkQ_-QE0qUF49S7jzU
Message-ID: <CA+CK2bBcgkrM0D0w77+UpDZsF2rDOc15iAcEJ7PMw52HQDipvA@mail.gmail.com>
Subject: Re: [RFC v2 09/16] luo: luo_files: implement file systems callbacks
To: Pratyush Yadav <pratyush@kernel.org>
Cc: jasonmiu@google.com, graf@amazon.com, changyuanl@google.com, 
	rppt@kernel.org, dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn, 
	linux@weissschuh.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, gregkh@linuxfoundation.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org, 
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 6:43=E2=80=AFAM Pratyush Yadav <pratyush@kernel.org=
> wrote:
>
> On Fri, Jun 13 2025, Pasha Tatashin wrote:
>
> > On Fri, Jun 13, 2025 at 11:18=E2=80=AFAM Pratyush Yadav <pratyush@kerne=
l.org> wrote:
> >>
> >> On Sun, Jun 08 2025, Pasha Tatashin wrote:
> >>
> >> > On Thu, Jun 5, 2025 at 12:04=E2=80=AFPM Pratyush Yadav <pratyush@ker=
nel.org> wrote:
> >> >>
> >> >> On Thu, May 15 2025, Pasha Tatashin wrote:
> >> >>
> >> >> > Implements the core logic within luo_files.c to invoke the prepar=
e,
> >> >> > reboot, finish, and cancel callbacks for preserved file instances=
,
> >> >> > replacing the previous stub implementations. It also handles
> >> >> > the persistence and retrieval of the u64 data payload associated =
with
> >> >> > each file via the LUO FDT.
> >> >> >
> >> >> > This completes the core mechanism enabling registered filesystem
> >> >> > handlers to actively manage file state across the live update
> >> >> > transition using the LUO framework.
> >> >> >
> >> >> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> >> >> > ---
> >> >> >  drivers/misc/liveupdate/luo_files.c | 105 ++++++++++++++++++++++=
+++++-
> >> >> >  1 file changed, 103 insertions(+), 2 deletions(-)
> >> >> >
> >> >> [...]
> >> >> > @@ -305,7 +369,29 @@ int luo_do_files_prepare_calls(void)
> >> >> >   */
> >> >> >  int luo_do_files_freeze_calls(void)
> >> >> >  {
> >> >> > -     return 0;
> >> >> > +     unsigned long token;
> >> >> > +     struct luo_file *h;
> >> >> > +     int ret;
> >> >> > +
> >> >> > +     xa_for_each(&luo_files_xa_out, token, h) {
> >> >>
> >> >> Should we also ensure at this point that there are no open handles =
to
> >> >> this file? How else would a file system ensure the file is in quies=
cent
> >> >> state to do its final serialization?
> >> >
> >> > Do you mean check refcnt here? If so, this is a good idea, but first
> >> > we need to implement the lifecycle of liveupdate agent correctectly,
> >> > where owner of FD must survive through entering into reboot() with
> >> > /dev/liveupdate still open.
> >>
> >> Yes, by this point we should ensure refcnt =3D=3D 1. IIUC you plan to
> >> implement the lifecycle change in the next revision, so this can be
> >> added there as well I suppose.
> >
> > Yes, I am working on that. Current, WIP patch looks like this:
> > https://github.com/soleen/linux/commit/fecf912d8b70acd23d24185a8c050476=
4e43a279
> >
> > However, I am not sure about refcnt =3D=3D 1 at freeze() time. We can h=
ave
> > programs, that never terminated while we were still in userspace (i.e.
> > kexec -e -> reboot() -> freeze()), in that case refcnt can be anything
> > at the time of freeze, no?
>
> Do you mean the agent that controls the liveupdate session? Then in that
Yes
> case the agent can keep running with the /dev/liveupdate FD open, but it
> must close all of the FDs preserved via LUO before doing kexec -e.

Right, but in this case the agent would have to basically kill all the
processes the regestred FDs through it prior to 'kexec -e', I am not
sure it is its job. However, we can add some pr_warn_once() when rfcnt
!=3D 1, I think this is a minor change. Lets do that once we have a more
developed userspace setup. We need to start working on liveupdated
that would through some sort of RPCs calls store and restore FDs.

Pasha
