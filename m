Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0F112DDA1;
	Mon, 16 Jun 2025 10:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750070600; cv=none; b=VHMB2LCRb+mpfSQDkWzAJtg5SFPyLCr35df9J7vkqyaHitsDTH9wqtgF69Z7XnxoYPDIfTOEMLT5DZASJ+l/NEU1hBgUZMUUOH7HrWQngX5ljovLiAGh17o/2ZHpNU42V3wMSztEEDdWDZA8ijMusCzFDNOLSB7PLSWkM8XdXh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750070600; c=relaxed/simple;
	bh=Lbtuz5Vwa/cgdysdVyVn1eSaL5ZpHU9q9W99m/VIS2U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DuPYhkPEZn0a7sv54hKJTH+BKdbJClLlM29M6aJ86+pZs5iSfGjrZ2npaFSQrUE+d0wsuqpPG+3Aao+PtPxOgofyIUZiib9TwqqILrLCStHm8peFje1vB5i3nZai3+20ZQbAYJ7gWMfGKrxDK/lQ6UxIKqZJSpbhTRi+jBUf4qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fEeoQYUk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fEeoQYUk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B85C4CEEA;
	Mon, 16 Jun 2025 10:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750070599;
	bh=Lbtuz5Vwa/cgdysdVyVn1eSaL5ZpHU9q9W99m/VIS2U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fEeoQYUkvSV+UKCyhe2VnUgE4OoTE8gOMla6mUimejqiNyx9AGGO0bpEkR6+e8GjA
	 TwrbkH7EfhInNPZ1hsmuhpbjfc8Bgrcw1dz6RMErFRVFYDRQL92QKG0PgQDS/gPZ9G
	 DaGlBy5tsfQjBsXx6fchbHwqDBgW4DrtIm0wE5+Tjzq8U9KNeyyed0OvoB59wHBIsN
	 zmKi+jQaF8xJKQT4XWYOw3j+vuFct4jlzQzkL91nkvWVl2gnR7Q3ko/7fEp3mVwVFn
	 4t/oO+E9uMq0BYUx5Kufwfm+WvRCwxPI1eKOo1kAutdDdwTqpsoz7TrTrP550frvPi
	 p4shshgLj89tg==
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
In-Reply-To: <CA+CK2bA6zsdARkRMQwadD__qXOzjABcRnwdZjfdnvLf26hsz9w@mail.gmail.com>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
	<20250515182322.117840-10-pasha.tatashin@soleen.com>
	<mafs0y0u6rx8y.fsf@kernel.org>
	<CA+CK2bCigGJJqtSt1-4GP0JPVCZrTa6WS4LiMTT0J=04G64e5w@mail.gmail.com>
	<mafs0h60jmzzc.fsf@kernel.org>
	<CA+CK2bA6zsdARkRMQwadD__qXOzjABcRnwdZjfdnvLf26hsz9w@mail.gmail.com>
Date: Mon, 16 Jun 2025 12:43:10 +0200
Message-ID: <mafs0a568vuf5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13 2025, Pasha Tatashin wrote:

> On Fri, Jun 13, 2025 at 11:18=E2=80=AFAM Pratyush Yadav <pratyush@kernel.=
org> wrote:
>>
>> On Sun, Jun 08 2025, Pasha Tatashin wrote:
>>
>> > On Thu, Jun 5, 2025 at 12:04=E2=80=AFPM Pratyush Yadav <pratyush@kerne=
l.org> wrote:
>> >>
>> >> On Thu, May 15 2025, Pasha Tatashin wrote:
>> >>
>> >> > Implements the core logic within luo_files.c to invoke the prepare,
>> >> > reboot, finish, and cancel callbacks for preserved file instances,
>> >> > replacing the previous stub implementations. It also handles
>> >> > the persistence and retrieval of the u64 data payload associated wi=
th
>> >> > each file via the LUO FDT.
>> >> >
>> >> > This completes the core mechanism enabling registered filesystem
>> >> > handlers to actively manage file state across the live update
>> >> > transition using the LUO framework.
>> >> >
>> >> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>> >> > ---
>> >> >  drivers/misc/liveupdate/luo_files.c | 105 ++++++++++++++++++++++++=
+++-
>> >> >  1 file changed, 103 insertions(+), 2 deletions(-)
>> >> >
>> >> [...]
>> >> > @@ -305,7 +369,29 @@ int luo_do_files_prepare_calls(void)
>> >> >   */
>> >> >  int luo_do_files_freeze_calls(void)
>> >> >  {
>> >> > -     return 0;
>> >> > +     unsigned long token;
>> >> > +     struct luo_file *h;
>> >> > +     int ret;
>> >> > +
>> >> > +     xa_for_each(&luo_files_xa_out, token, h) {
>> >>
>> >> Should we also ensure at this point that there are no open handles to
>> >> this file? How else would a file system ensure the file is in quiesce=
nt
>> >> state to do its final serialization?
>> >
>> > Do you mean check refcnt here? If so, this is a good idea, but first
>> > we need to implement the lifecycle of liveupdate agent correctectly,
>> > where owner of FD must survive through entering into reboot() with
>> > /dev/liveupdate still open.
>>
>> Yes, by this point we should ensure refcnt =3D=3D 1. IIUC you plan to
>> implement the lifecycle change in the next revision, so this can be
>> added there as well I suppose.
>
> Yes, I am working on that. Current, WIP patch looks like this:
> https://github.com/soleen/linux/commit/fecf912d8b70acd23d24185a8c0504764e=
43a279
>
> However, I am not sure about refcnt =3D=3D 1 at freeze() time. We can have
> programs, that never terminated while we were still in userspace (i.e.
> kexec -e -> reboot() -> freeze()), in that case refcnt can be anything
> at the time of freeze, no?

Do you mean the agent that controls the liveupdate session? Then in that
case the agent can keep running with the /dev/liveupdate FD open, but it
must close all of the FDs preserved via LUO before doing kexec -e.

--=20
Regards,
Pratyush Yadav
