Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A112E6D1E;
	Wed, 18 Jun 2025 13:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750252592; cv=none; b=BIVBuNm0wm99Oby88IngmRgGMtviRYFNsNeJ3WnNEYMGT8vzRBFU7WWRVybOCPTp0ZUdLaB7fyYv3hjnzc4/+AGPQ8Vv00OPHdy/SrdUX2dxCKj+NQhVfr8HygmqXcaZqACxhFXBZtdcqFcOhinO+AF0l3ErODGRofXKvxkUmVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750252592; c=relaxed/simple;
	bh=xjecfFW5v6eKSOI6V0Czl6riZVUJooaKA8suMig3d4k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mkeZMft46f3LbVTuGbObBZ0VbCbjRU4/NPtJVL/sPGKFMs07e7E+2WcSd+QVKjNAYdxzh88VEjFDIzy0onpSd2eA9A91L3qVa2VGVFexO8FEYyZYRUoqHx+y99BKr5dWaGHMkEBUVy/SAvqqttmViug+l3RmUsKT3sdOsWvj5DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ankVo7Tz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ankVo7Tz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94324C4CEE7;
	Wed, 18 Jun 2025 13:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750252592;
	bh=xjecfFW5v6eKSOI6V0Czl6riZVUJooaKA8suMig3d4k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ankVo7Tz1dI7sCR33wFCuIARshHMf2jU+/ch40Gue8vBjlnfhiTW8pUW/m6gwht9e
	 SzxnWzkJsxnJCThpoj+YcpqsKgZn1K2NjfKzuLyK0fflpMWhWv15VBHgcHqTOOAOSP
	 guzb8ACWx8Si8roiR/wOdJAIeFWhuf1cmRoW1sgkLuPUtIX/bXQ1Ob6XxeKvYzojPV
	 bga3jJkrX+/p0QxYuE1k22WTOeEXeYO9VO+QqrEL/iZO5/NIAGov//Ybshyha58WmZ
	 u2Odxs0G+IuzobOT67lYvX5eljcDYHLuKLnNhKWGS1JjUpOJo7Ka+eD3QrTds9yUSM
	 SLQMhdbwNsW4w==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  jasonmiu@google.com,
  graf@amazon.com,  changyuanl@google.com,  rppt@kernel.org,
  dmatlack@google.com,  rientjes@google.com,  corbet@lwn.net,
  rdunlap@infradead.org,  ilpo.jarvinen@linux.intel.com,
  kanie@linux.alibaba.com,  ojeda@kernel.org,  aliceryhl@google.com,
  masahiroy@kernel.org,  akpm@linux-foundation.org,  tj@kernel.org,
  yoann.congal@smile.fr,  mmaurer@google.com,  roman.gushchin@linux.dev,
  chenridong@huawei.com,  axboe@kernel.dk,  mark.rutland@arm.com,
  jannh@google.com,  vincent.guittot@linaro.org,  hannes@cmpxchg.org,
  dan.j.williams@intel.com,  david@redhat.com,  joel.granados@kernel.org,
  rostedt@goodmis.org,  anna.schumaker@oracle.com,  song@kernel.org,
  zhangguopeng@kylinos.cn,  linux@weissschuh.net,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org,
  linux-mm@kvack.org,  gregkh@linuxfoundation.org,  tglx@linutronix.de,
  mingo@redhat.com,  bp@alien8.de,  dave.hansen@linux.intel.com,
  x86@kernel.org,  hpa@zytor.com,  rafael@kernel.org,  dakr@kernel.org,
  bartosz.golaszewski@linaro.org,  cw00.choi@samsung.com,
  myungjoo.ham@samsung.com,  yesanishhere@gmail.com,
  Jonathan.Cameron@huawei.com,  quic_zijuhu@quicinc.com,
  aleksander.lobakin@intel.com,  ira.weiny@intel.com,
  andriy.shevchenko@linux.intel.com,  leon@kernel.org,  lukas@wunner.de,
  bhelgaas@google.com,  wagi@kernel.org,  djeffery@redhat.com,
  stuart.w.hayes@gmail.com
Subject: Re: [RFC v2 09/16] luo: luo_files: implement file systems callbacks
In-Reply-To: <CA+CK2bBcgkrM0D0w77+UpDZsF2rDOc15iAcEJ7PMw52HQDipvA@mail.gmail.com>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
	<20250515182322.117840-10-pasha.tatashin@soleen.com>
	<mafs0y0u6rx8y.fsf@kernel.org>
	<CA+CK2bCigGJJqtSt1-4GP0JPVCZrTa6WS4LiMTT0J=04G64e5w@mail.gmail.com>
	<mafs0h60jmzzc.fsf@kernel.org>
	<CA+CK2bA6zsdARkRMQwadD__qXOzjABcRnwdZjfdnvLf26hsz9w@mail.gmail.com>
	<mafs0a568vuf5.fsf@kernel.org>
	<CA+CK2bBcgkrM0D0w77+UpDZsF2rDOc15iAcEJ7PMw52HQDipvA@mail.gmail.com>
Date: Wed, 18 Jun 2025 15:16:23 +0200
Message-ID: <mafs01prhw5p4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16 2025, Pasha Tatashin wrote:

> On Mon, Jun 16, 2025 at 6:43=E2=80=AFAM Pratyush Yadav <pratyush@kernel.o=
rg> wrote:
>>
>> On Fri, Jun 13 2025, Pasha Tatashin wrote:
>>
>> > On Fri, Jun 13, 2025 at 11:18=E2=80=AFAM Pratyush Yadav <pratyush@kern=
el.org> wrote:
>> >>
>> >> On Sun, Jun 08 2025, Pasha Tatashin wrote:
>> >>
>> >> > On Thu, Jun 5, 2025 at 12:04=E2=80=AFPM Pratyush Yadav <pratyush@ke=
rnel.org> wrote:
>> >> >>
>> >> >> On Thu, May 15 2025, Pasha Tatashin wrote:
>> >> >>
>> >> >> > Implements the core logic within luo_files.c to invoke the prepa=
re,
>> >> >> > reboot, finish, and cancel callbacks for preserved file instance=
s,
>> >> >> > replacing the previous stub implementations. It also handles
>> >> >> > the persistence and retrieval of the u64 data payload associated=
 with
>> >> >> > each file via the LUO FDT.
>> >> >> >
>> >> >> > This completes the core mechanism enabling registered filesystem
>> >> >> > handlers to actively manage file state across the live update
>> >> >> > transition using the LUO framework.
>> >> >> >
>> >> >> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>> >> >> > ---
>> >> >> >  drivers/misc/liveupdate/luo_files.c | 105 +++++++++++++++++++++=
++++++-
>> >> >> >  1 file changed, 103 insertions(+), 2 deletions(-)
>> >> >> >
>> >> >> [...]
>> >> >> > @@ -305,7 +369,29 @@ int luo_do_files_prepare_calls(void)
>> >> >> >   */
>> >> >> >  int luo_do_files_freeze_calls(void)
>> >> >> >  {
>> >> >> > -     return 0;
>> >> >> > +     unsigned long token;
>> >> >> > +     struct luo_file *h;
>> >> >> > +     int ret;
>> >> >> > +
>> >> >> > +     xa_for_each(&luo_files_xa_out, token, h) {
>> >> >>
>> >> >> Should we also ensure at this point that there are no open handles=
 to
>> >> >> this file? How else would a file system ensure the file is in quie=
scent
>> >> >> state to do its final serialization?
>> >> >
>> >> > Do you mean check refcnt here? If so, this is a good idea, but first
>> >> > we need to implement the lifecycle of liveupdate agent correctectly,
>> >> > where owner of FD must survive through entering into reboot() with
>> >> > /dev/liveupdate still open.
>> >>
>> >> Yes, by this point we should ensure refcnt =3D=3D 1. IIUC you plan to
>> >> implement the lifecycle change in the next revision, so this can be
>> >> added there as well I suppose.
>> >
>> > Yes, I am working on that. Current, WIP patch looks like this:
>> > https://github.com/soleen/linux/commit/fecf912d8b70acd23d24185a8c05047=
64e43a279
>> >
>> > However, I am not sure about refcnt =3D=3D 1 at freeze() time. We can =
have
>> > programs, that never terminated while we were still in userspace (i.e.
>> > kexec -e -> reboot() -> freeze()), in that case refcnt can be anything
>> > at the time of freeze, no?
>>
>> Do you mean the agent that controls the liveupdate session? Then in that
> Yes
>> case the agent can keep running with the /dev/liveupdate FD open, but it
>> must close all of the FDs preserved via LUO before doing kexec -e.
>
> Right, but in this case the agent would have to basically kill all the

Or the participating processes can be cooperative and simply exit
cleanly, or at least close the FDs before triggering the kexec. The
whole live update process needs a lot of parts to cooperate anyway.

> processes the regestred FDs through it prior to 'kexec -e', I am not
> sure it is its job. However, we can add some pr_warn_once() when rfcnt
> !=3D 1, I think this is a minor change. Lets do that once we have a more
> developed userspace setup. We need to start working on liveupdated

Sure, makes sense.

> that would through some sort of RPCs calls store and restore FDs.

I have been playing around with some ideas on how to do this. Will try
some things out and see if I can come up with a PoC soon.

--=20
Regards,
Pratyush Yadav
