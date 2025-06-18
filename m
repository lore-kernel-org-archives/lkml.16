Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7904F2C08B8;
	Wed, 18 Jun 2025 13:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750252322; cv=none; b=R9aekwHTlBQ2X22CJHGxLW+QSsQgQiotCXUS7ygBCVM6h/VtWsmTApSn+6I3luCewBwCQphUOb3mcGsp4H7xtvQ2HOx7GJk5DuOpU0dXELtqZrtaOWkm/c7HVKc2hhBu/auu7pl0oms4HuFlnm+Plv3lUfOeotSkT5eUOuYy958=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750252322; c=relaxed/simple;
	bh=s5qyzz/qBQpZoUuL9l+81lOuO/S3Lo8ObQXBuGDJkMo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XbqOUIVgzHdqlSmaV1LITRsJxKGuhYnpm5kKuUSSGiF7+ubxV58iAhDxTJY6E6ikBQMDfMcjj09sOYKU0gZTm0zPrPZQ8FKp5eDo4HFtERYdKXm/G5XnU7bj4CVfZeiC0rkc3ehFImd7fUW62I27nCrXxHUw1KbHOI8WLG8mVEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GozqKuXy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GozqKuXy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA03C4CEE7;
	Wed, 18 Jun 2025 13:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750252322;
	bh=s5qyzz/qBQpZoUuL9l+81lOuO/S3Lo8ObQXBuGDJkMo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GozqKuXyxjUgmHEhOYXLuI/y4m8rpsuTDKgLStZR7yoSnii9/Rf/S6+YbwlUnjzeJ
	 r21kcjcCLL7SGOmlJ1y1lzExbZBJHW3sOgcdEsIQjMxHlC2hefQ7m5EmeksGYUnC3I
	 1iC0MFOnA7XEfodJTxoBdRjz18ca+DPjNXh7cdswd8lEqxYFc7Gylhr8xhOg2q24KO
	 JFBIdww/zFK+lik5vw5TJO8cJHTBvRxLlggrRF/hccLVTvRLLwuayDWtGfNTo3NEcr
	 VS7Phta3ho4Ph9cLqBRV/TVbThOaueLHdz+GJfVD9hktZqBlyJQgR+FHfQTxHld7aX
	 GxNpyxYYXQg4A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,  Pratyush Yadav <pratyush@kernel.org>,
  jasonmiu@google.com,  graf@amazon.com,  changyuanl@google.com,
  rppt@kernel.org,  dmatlack@google.com,  rientjes@google.com,
  corbet@lwn.net,  rdunlap@infradead.org,  ilpo.jarvinen@linux.intel.com,
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
Subject: Re: [RFC v2 05/16] luo: luo_core: integrate with KHO
In-Reply-To: <CA+CK2bAtO7BA5iptRfA_oa=5sUz_t-0F3Lu8oae1STnijXrPPQ@mail.gmail.com>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
	<20250515182322.117840-6-pasha.tatashin@soleen.com>
	<mafs0sekfts2i.fsf@kernel.org>
	<CA+CK2bA7eAB4PvF0RXtt2DJ+FQ4DVV3x1OZrVo4q3EvgowhvJg@mail.gmail.com>
	<mafs0sek3n0x8.fsf@kernel.org> <20250617152357.GB1376515@ziepe.ca>
	<CA+CK2bAtO7BA5iptRfA_oa=5sUz_t-0F3Lu8oae1STnijXrPPQ@mail.gmail.com>
Date: Wed, 18 Jun 2025 15:11:52 +0200
Message-ID: <mafs05xgtw5wn.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17 2025, Pasha Tatashin wrote:

> On Tue, Jun 17, 2025 at 11:24=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> w=
rote:
>>
>> On Fri, Jun 13, 2025 at 04:58:27PM +0200, Pratyush Yadav wrote:
>> > On Sat, Jun 07 2025, Pasha Tatashin wrote:
>> > [...]
>> > >>
>> > >> This weirdness happens because luo_prepare() and luo_cancel() contr=
ol
>> > >> the KHO state machine, but then also get controlled by it via the
>> > >> notifier callbacks. So the relationship between then is not clear.
>> > >> __luo_prepare() at least needs access to struct kho_serialization, =
so it
>> > >> needs to come from the callback. So I don't have a clear way to cle=
an
>> > >> this all up off the top of my head.
>> > >
>> > > On production machine, without KHO_DEBUGFS, only LUO can control KHO
>> > > state, but if debugfs is enabled, KHO can be finalized manually, and
>> > > in this case LUO transitions to prepared state. In both cases, the
>> > > path is identical. The KHO debugfs path is only for
>> > > developers/debugging purposes.
>> >
>> > What I meant is that even without KHO_DEBUGFS, LUO drives KHO, but then
>> > KHO calls into LUO from the notifier, which makes the control flow
>> > somewhat convoluted. If LUO is supposed to be the only thing that
>> > interacts directly with KHO, maybe we should get rid of the notifier a=
nd
>> > only let LUO drive things.
>>
>> Yes, we should. I think we should consider the KHO notifiers and self
>> orchestration as obsoleted by LUO. That's why it was in debugfs
>> because we were not ready to commit to it.
>
> We could do that, however, there is one example KHO user
> `reserve_mem`, that is also not liveupdate related. So, it should
> either be removed or modified to be handled by LUO.

It still depends on kho_finalize() being called, so it still needs
something to trigger its serialization. It is not automatic. And with
your proposed patch to make debugfs interface optional, it can't even be
used with the config disabled.

So if it must be explicitly triggered to be preserved, why not let the
trigger point be LUO instead of KHO? You can make reservemem a LUO
subsystem instead.

Although to be honest, things like reservemem (or IMA perhaps?) don't
really fit well with the explicit trigger mechanism. They can be carried
across kexec without needing userspace explicitly driving it. Maybe we
allow LUO subsystems to mark themselves as auto-preservable and LUO will
preserve them regardless of state being prepared? Something to think
about later down the line I suppose.

--=20
Regards,
Pratyush Yadav
