Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EAC158535;
	Thu,  5 Jun 2025 11:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749124577; cv=none; b=WDmFhP461r7fVLooIMPWEo0D2fAGQ9H/wgxrNqvMox+rDCIo/+FbtJ0zX31Bng+M/uHQX0Z4P5L88xFhloU1FklfBLKU3yyL94Z2fal6Ze1XNbL7gkp8JfIj7SVATaezSHSmGha+4p9oDdc3/FuqVwo/wbvqDkFRUtRnGFxMq+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749124577; c=relaxed/simple;
	bh=uWcXl9ynCkshNAH43IpoOSXtxdbCOYh/GOFOCUI9uBM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fFsKrTXR00JostM9oj76ehLq7+GcuX6ZP2DFndeRODyLX6ZiP8CdId+F5DffLIdHs8kLg3jHvZDbtDnfYLEeiMlPBYlIgMdfZk74MtBKccl8lHkNUdvUVN18I5tUu4ZO7WBlR2TlV2/i5Xi9WtKA6YOh/4hfjHYGxZvrrK0AQQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jxlZk0qG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jxlZk0qG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA70C4CEE7;
	Thu,  5 Jun 2025 11:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749124575;
	bh=uWcXl9ynCkshNAH43IpoOSXtxdbCOYh/GOFOCUI9uBM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jxlZk0qGEQhuOAutqsXnOe9PmJHL+oEglN6Gi3ZE9MjWut4dthhXTsEGgA2HAbcHb
	 sw5LD4lQxsUirwofRPfTE4Q+JUD47iS3Tcq1ue9KXa4oMdnceICx+TkFYV/F0jlpHI
	 XU8EMX/6+aJwPOQEOg6Ez+4ZS/+5fdpTfFywGkIsTJ8Eo32WxK1IizN0AzD1H7If3n
	 sY+26Nc5iR0/Afw1IrtCODqNeOE2hJLylCKpMdiPL3zFWHkdKBZasU5kH02sc49Q2N
	 Zss2L83Q4KA/HZEtHWYMsP/Fy8ZOCgulYwJbu92vZuGus9qVdKbHl0+GDsYstcQW2A
	 VDKOQHOOHaTxA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,  pratyush@kernel.org,
  jasonmiu@google.com,  graf@amazon.com,  changyuanl@google.com,
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
In-Reply-To: <aDQeWT9sLNQVZKf-@kernel.org>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
	<20250515182322.117840-9-pasha.tatashin@soleen.com>
	<aDQeWT9sLNQVZKf-@kernel.org>
Date: Thu, 05 Jun 2025 13:56:06 +0200
Message-ID: <mafs07c1qtnah.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, May 26 2025, Mike Rapoport wrote:

> On Thu, May 15, 2025 at 06:23:12PM +0000, Pasha Tatashin wrote:
>> Introduce the framework within LUO to support preserving specific types
>> of file descriptors across a live update transition. This allows
>> stateful FDs (like memfds or vfio FDs used by VMs) to be recreated in
>> the new kernel.
>> 
>> Note: The core logic for iterating through the luo_files_list and
>> invoking the handler callbacks (prepare, freeze, cancel, finish)
>> within luo_do_files_*_calls, as well as managing the u64 data
>> persistence via the FDT for individual files, is currently implemented
>> as stubs in this patch. This patch sets up the registration, FDT layout,
>> and retrieval framework.
>> 
>> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>> ---
[...]
>> diff --git a/drivers/misc/liveupdate/luo_core.c b/drivers/misc/liveupdate/luo_core.c
>> index 417e7f6bf36c..ab1d76221fe2 100644
>> --- a/drivers/misc/liveupdate/luo_core.c
>> +++ b/drivers/misc/liveupdate/luo_core.c
>> @@ -110,6 +110,10 @@ static int luo_fdt_setup(struct kho_serialization *ser)
>>  	if (ret)
>>  		goto exit_free;
>>  
>> +	ret = luo_files_fdt_setup(fdt_out);
>> +	if (ret)
>> +		goto exit_free;
>> +
>>  	ret = luo_subsystems_fdt_setup(fdt_out);
>>  	if (ret)
>>  		goto exit_free;
>
> The duplication of files and subsystems does not look nice here and below.
> Can't we make files to be a subsystem?

+1

It would also give subsystems a user.

[...]
>> diff --git a/drivers/misc/liveupdate/luo_files.c b/drivers/misc/liveupdate/luo_files.c
>> new file mode 100644
>> index 000000000000..953fc40db3d7
>> --- /dev/null
>> +++ b/drivers/misc/liveupdate/luo_files.c
>> @@ -0,0 +1,563 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +/*
>> + * Copyright (c) 2025, Google LLC.
>> + * Pasha Tatashin <pasha.tatashin@soleen.com>
>> + */
>> +
>> +/**
>> + * DOC: LUO file descriptors
>> + *
>> + * LUO provides the infrastructure necessary to preserve
>> + * specific types of stateful file descriptors across a kernel live
>> + * update transition. The primary goal is to allow workloads, such as virtual
>> + * machines using vfio, memfd, or iommufd to retain access to their essential
>> + * resources without interruption after the underlying kernel is  updated.
>> + *
>> + * The framework operates based on handler registration and instance tracking:
>> + *
>> + * 1. Handler Registration: Kernel modules responsible for specific file
>> + * types (e.g., memfd, vfio) register a &struct liveupdate_filesystem
>> + * handler. This handler contains callbacks (&liveupdate_filesystem.prepare,
>> + * &liveupdate_filesystem.freeze, &liveupdate_filesystem.finish, etc.)
>> + * and a unique 'compatible' string identifying the file type.
>> + * Registration occurs via liveupdate_register_filesystem().
>
> I wouldn't use filesystem here, as the obvious users are not really
> filesystems. Maybe liveupdate_register_file_ops?

+1

[...]

-- 
Regards,
Pratyush Yadav
