Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFCF2E11C2;
	Fri, 13 Jun 2025 15:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749827936; cv=none; b=imNHZhCCsc5SjOVURSVlgNqo2od0w7Vuhsn7FEGVCSJoJFHJS9bqvEm50/YfSAsnMVx/AzKqPRRnY0TR7fGd/1EewSZSges6S3FJeG1a1qww50WtL5FKyG+pJDiLmLFBBuTTXKbS1S+6ztAog+UePrKP571u9FcUUWI2vv/3kQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749827936; c=relaxed/simple;
	bh=d3YgWUVRWKg58VispgWHX09hXScELBYDKFXpt5XFraA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i1eD1sRLKnuYvQuV/LPER63W/Qri3ktepDgblZGZkwY5RUECCZ9v63FHFXGoZZWcyDJFN7k/vulh2gDAR23tYd1/aP+HXMP7Di/7V8o8732ImSuIZC4Tw+9LXM+9fxLBUOf8pMzHyTryQxX/tE2gJZoKrXM3VTRa1bZneQESocs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AtlrWRtf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AtlrWRtf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6303C4CEED;
	Fri, 13 Jun 2025 15:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749827936;
	bh=d3YgWUVRWKg58VispgWHX09hXScELBYDKFXpt5XFraA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AtlrWRtf2Kufmhvu5sy7r4LAHiaKOtkOzUBYatM6VCdu4h4cdfyZ7e9hfIfV7mCyx
	 ccQYIUKTJuWgUJhUU30EEnoxLXhW81Y9ac5mLTjrgI6Hqx/KBcBC9WB0Vu9ejdxrc+
	 ciKSzbU5xZr9qlKs/K+Lp83FIbR/TAurjRs91YSsdOuLosVOumwAgwHhRDENTCj4vQ
	 Of5fndiZVPFw9gI/4BoLOPv0TWOii5uiJhz2QfWsz0eVcT133/3aWXfGIitCMN3uJ2
	 pdYFRjlBI+QGV/Megpp+qYfBOu9IdSf/m6eSHwQMzqkJM7ymQXGpc/oFkyu+RV/HhD
	 29BkcFt1Nmpiw==
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
In-Reply-To: <CA+CK2bCigGJJqtSt1-4GP0JPVCZrTa6WS4LiMTT0J=04G64e5w@mail.gmail.com>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
	<20250515182322.117840-10-pasha.tatashin@soleen.com>
	<mafs0y0u6rx8y.fsf@kernel.org>
	<CA+CK2bCigGJJqtSt1-4GP0JPVCZrTa6WS4LiMTT0J=04G64e5w@mail.gmail.com>
Date: Fri, 13 Jun 2025 17:18:47 +0200
Message-ID: <mafs0h60jmzzc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 08 2025, Pasha Tatashin wrote:

> On Thu, Jun 5, 2025 at 12:04=E2=80=AFPM Pratyush Yadav <pratyush@kernel.o=
rg> wrote:
>>
>> On Thu, May 15 2025, Pasha Tatashin wrote:
>>
>> > Implements the core logic within luo_files.c to invoke the prepare,
>> > reboot, finish, and cancel callbacks for preserved file instances,
>> > replacing the previous stub implementations. It also handles
>> > the persistence and retrieval of the u64 data payload associated with
>> > each file via the LUO FDT.
>> >
>> > This completes the core mechanism enabling registered filesystem
>> > handlers to actively manage file state across the live update
>> > transition using the LUO framework.
>> >
>> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>> > ---
>> >  drivers/misc/liveupdate/luo_files.c | 105 +++++++++++++++++++++++++++-
>> >  1 file changed, 103 insertions(+), 2 deletions(-)
>> >
>> [...]
>> > @@ -305,7 +369,29 @@ int luo_do_files_prepare_calls(void)
>> >   */
>> >  int luo_do_files_freeze_calls(void)
>> >  {
>> > -     return 0;
>> > +     unsigned long token;
>> > +     struct luo_file *h;
>> > +     int ret;
>> > +
>> > +     xa_for_each(&luo_files_xa_out, token, h) {
>>
>> Should we also ensure at this point that there are no open handles to
>> this file? How else would a file system ensure the file is in quiescent
>> state to do its final serialization?
>
> Do you mean check refcnt here? If so, this is a good idea, but first
> we need to implement the lifecycle of liveupdate agent correctectly,
> where owner of FD must survive through entering into reboot() with
> /dev/liveupdate still open.

Yes, by this point we should ensure refcnt =3D=3D 1. IIUC you plan to
implement the lifecycle change in the next revision, so this can be
added there as well I suppose.

[...]

--=20
Regards,
Pratyush Yadav
