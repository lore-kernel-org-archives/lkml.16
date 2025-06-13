Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F0C1E5213;
	Fri, 13 Jun 2025 15:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749828451; cv=none; b=HnI6Bec1JbHRRIGsBqpmY8rIDT1kBN76PNhsUeZgUa7WA862BLBdJei2hEL+ryJ0hl2MGmnZYryH+4dh8r8GGaxRhvMTVG46U23JYq+eE2BSDuejm5mAdltiq+ARRdiPsXsTj/Cp5WPYYdmSgyhrJgFK0UFxM9lB6mkVXOn0Au8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749828451; c=relaxed/simple;
	bh=88xUdYBMPT3UbWHPTJRNtJ5le6acxvABX2a2MypWfUE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZrVdEqpJLXOvX0s8Pas6oIbjM/Gay4uWpBujSc+WD9N6C5DPj9OMbAnmNZTATS3MOOw9K4cTpWrPXLQEPmPer6tZVEAqvMnkFWVs57G20ln29M5Qb0UI1lMSrfnyl25QH5QrvjiTup1/cnlYfWjMVCt43/c4WjKfD4E/JYu5jbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBosYd0U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBosYd0U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC73C4CEE3;
	Fri, 13 Jun 2025 15:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749828450;
	bh=88xUdYBMPT3UbWHPTJRNtJ5le6acxvABX2a2MypWfUE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OBosYd0UCBZw4SAiVzH5bFP26U8lcMe2wbd/3tbGiUAQ9sfKtUT2UeGBUS50U9S4P
	 F6Qt1zqdq8JNIyEFCbk/oIp6YWZXv/UUqkYVEqLxwjhuQ/66c4+ka28Qh4HVgBdVdV
	 SB1Mnr5ycqi1qRMC7qKas9U652pK/xJngizVsheYzvkbsjBiYv+y+i/yT/A+ogx5fN
	 YKgYRNzaqcMkMv6xGYhGfseiaMJ58y+G4SfCtefRuriPxTMAPoUXqBZfpRLZn/UICh
	 2ocRZSUrTAIXwmBzylEyCCg4nzKTpd2//Brxj1WhoTUAr+b6hyMJbfwbIpFQDpyln+
	 eCaXnAU7yNhyw==
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
Subject: Re: [RFC v2 08/16] luo: luo_files: add infrastructure for FDs
In-Reply-To: <CA+CK2bBeCOojpZ=qoefd6NG+bO6CUh+NU8=8dMhD01=LtC9eNg@mail.gmail.com>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
	<20250515182322.117840-9-pasha.tatashin@soleen.com>
	<mafs034cetc5g.fsf@kernel.org>
	<CA+CK2bBeCOojpZ=qoefd6NG+bO6CUh+NU8=8dMhD01=LtC9eNg@mail.gmail.com>
Date: Fri, 13 Jun 2025 17:27:21 +0200
Message-ID: <mafs0cyb7mzl2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Jun 08 2025, Pasha Tatashin wrote:

[...]
>> > +     down_write(&luo_filesystems_list_rwsem);
>> > +     if (luo_files_xa_in_recreated)
>> > +             goto exit_unlock;
>> > +
>> > +     parent_node_offset = fdt_subnode_offset(luo_fdt_in, 0,
>> > +                                             LUO_FILES_NODE_NAME);
>> > +
>> > +     fdt_for_each_subnode(file_node_offset, luo_fdt_in, parent_node_offset) {
>> > +             bool handler_found = false;
>> > +             u64 token;
>> > +
>> > +             node_name = fdt_get_name(luo_fdt_in, file_node_offset, NULL);
>> > +             if (!node_name) {
>> > +                     panic("Skipping FDT subnode at offset %d: Cannot get name\n",
>> > +                           file_node_offset);
>>
>> Should failure to parse a specific FD really be a panic? Wouldn't it be
>> better to continue and let userspace decide if it can live with the FD
>> missing?
>
> This is not safe, the memory might be DMA or owned by a sensetive
> process, and if we proceed liveupdate reboot without properly handling
> memory, we can get corruptions, and memory leaks. Therefore, during
> liveupdate boot if there are exceptions, we should panic.

I don't get how it would result in memory leaks or corruptions, since
KHO would have marked that memory as preserved, and the new kernel won't
touch it until someone restores it.

So it can at most lead to loss of data, and in that case, userspace can
very well decide if it can live with that loss or not.

Or are you assuming here that even data in KHO is broken? In that case,
it would probably be a good idea to panic early.

[...]
>> > +             }
>> > +
>> > +             luo_file = kmalloc(sizeof(*luo_file),
>> > +                                GFP_KERNEL | __GFP_NOFAIL);
>> > +             luo_file->fs = fs;
>> > +             luo_file->file = NULL;
>> > +             memcpy(&luo_file->private_data, data_ptr, sizeof(u64));
>>
>> Why not make sure data_ptr is exactly sizeof(u64) when we parse it, and
>> then simply do luo_file->private_data = (u64)*data_ptr ?
>
> Because FDT alignment is 4 bytes, we can't simply assign it.

Hmm, good catch. Didn't think of that.

>
>> Because if the previous kernel wrote more than a u64 in data, then
>> something is broken and we should catch that error anyway.
>>
>> > +             luo_file->reclaimed = false;
>> > +             mutex_init(&luo_file->mutex);
>> > +             luo_file->state = LIVEUPDATE_STATE_UPDATED;
>> > +             ret = xa_err(xa_store(&luo_files_xa_in, token, luo_file,
>> > +                                   GFP_KERNEL | __GFP_NOFAIL));
>>
[...]
>> > +struct liveupdate_filesystem {
>> > +     int (*prepare)(struct file *file, void *arg, u64 *data);
>> > +     int (*freeze)(struct file *file, void *arg, u64 *data);
>> > +     void (*cancel)(struct file *file, void *arg, u64 data);
>> > +     void (*finish)(struct file *file, void *arg, u64 data, bool reclaimed);
>> > +     int (*retrieve)(void *arg, u64 data, struct file **file);
>> > +     bool (*can_preserve)(struct file *file, void *arg);
>> > +     const char *compatible;
>> > +     void *arg;
>>
>> What is the use for this arg? I would expect one file type/system to
>> register one set of handlers. So they can keep their arg in a global in
>> their code. I don't see why a per-filesystem arg is needed.
>
> I think, arg is useful in case we support a subsystem is registered
> multiple times with some differences: i.e. based on mount point, or
> file types handling. Let's keep it for now, but if needed, we can
> remove that in future revisions.
>
>> What I do think is needed is a per-file arg. Each callback gets 'data',
>> which is the serialized data, but there is no place to store runtime
>> state, like some flags or serialization metadata. Sure, you could make
>> place for it somewhere in the inode, but I think it would be a lot
>> cleaner to be able to store it in struct luo_file.
>>
>> So perhaps rename private_data in struct luo_file to say
>> serialized_data, and have a field called "private" that filesystems can
>> use for their runtime state?
>
> I am not against this, but let's make this change when it is actually
> needed by a registered filesystem.

Okay, fair enough.

-- 
Regards,
Pratyush Yadav
