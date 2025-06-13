Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5468833E1;
	Fri, 13 Jun 2025 15:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749827632; cv=none; b=XL38S6duzo5HjhOGk9T13qszqL2uoSPe7y0n2h5Cirh6ft+qrRdHocXELU46WhcKTNGe+FTTqn52BlUSm8+ITxngzv00moO76gExnFGvr9PxdRHLYmRB1QFyO0q4BMaaku8y33mCANVO3lQ37sGseeTNaewLsA6KPMKlqUvHoAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749827632; c=relaxed/simple;
	bh=FM3IrbmJmnE9i2+qWqWQlZ+E4ahHxHM5H66AV9WmBoI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Dq36IfNbEVm9mO9K0ZciCY8C3qNThCVE+B7fyRRrwOzMqXaYkJcwd7kiHQZizPejlH8WsugRQP0RkpQ/YWmfiDp+sQFEhelP9bdOjOGivPeIBMRESXaC1eY+OmvjqXMTZaEB/d/cQR9cKirlKcERu0cu92rXJb0LXfxhPhnBGzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kly87QeW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kly87QeW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51532C4CEE3;
	Fri, 13 Jun 2025 15:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749827631;
	bh=FM3IrbmJmnE9i2+qWqWQlZ+E4ahHxHM5H66AV9WmBoI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kly87QeWZT/wrbptR1YPxy1l9gyVEOhvNZZmEaevtRPT9WyrvZ0TX/4+fp6YZ7aiQ
	 afAh/kZ7hLMkf8CdrnaxRQeBQ+vnOjBT4liAml1ERCct5+1CFWyxZ4uBOdQicDrROD
	 gRjB2u5eTm/qsBQse/skOXLuIfmS6EB7pL6ZkklPLOBw5wiIX00+2l5CRJrtz2QLlA
	 hvNVejusVTbhm3bvR/PInaoduM3LlFHlrAFsoFTmFlQRRf59XWc4E1QguZkSoAwF1k
	 sbn+dhQN1ND+j3porT3PrSJizbAMCdW/Y8zn8uT4C7Qf290YS0GAHbcfQHpyC6CaU6
	 UB+VG3EAUGLqQ==
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
Subject: Re: [RFC v2 11/16] luo: luo_sysfs: add sysfs state monitoring
In-Reply-To: <CA+CK2bCnMpRy=wYtt02Xy+R7BFhrY_RsdaZ7X4i+CUASv5Uo0Q@mail.gmail.com>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
	<20250515182322.117840-12-pasha.tatashin@soleen.com>
	<mafs0plfirwh3.fsf@kernel.org>
	<CA+CK2bCnMpRy=wYtt02Xy+R7BFhrY_RsdaZ7X4i+CUASv5Uo0Q@mail.gmail.com>
Date: Fri, 13 Jun 2025 17:13:43 +0200
Message-ID: <mafs0ldpvn07s.fsf@kernel.org>
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

> On Thu, Jun 5, 2025 at 12:20=E2=80=AFPM Pratyush Yadav <pratyush@kernel.o=
rg> wrote:
>>
>> On Thu, May 15 2025, Pasha Tatashin wrote:
>>
>> > Introduce a sysfs interface for the Live Update Orchestrator
>> > under /sys/kernel/liveupdate/. This interface provides a way for
>> > userspace tools and scripts to monitor the current state of the LUO
>> > state machine.
>>
>> I am not sure if adding and maintaining a new UAPI that does the same
>> thing is worth it. Can't we just have commandline utilities that can do
>> the ioctls and fetch the LUO state, and those can be called from tools
>> and scripts?
>>
>
> This is based on discussion from SystemD people. It is much simpler
> for units to check the current 'state' via sysfs, and act accordingly.

Ok, fair enough.

[...]

--=20
Regards,
Pratyush Yadav
