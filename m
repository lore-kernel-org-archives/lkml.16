Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B25238143
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746806997; cv=none; b=NCcRZ6jN9ZHVsPpydBrzDYwk0KeRBnAchjTrES/oxVeV00qj+wKsricx5EhneS/Z5bccF0lsO/nPDiMoqzaahCz0VlJIqb2Dv8XJ8qLiMMeYnpAmnLMgr117a0Vc9l7sAcGkgcR2U4j9yXZKZlX5+8Mrw5RDijEUk+0/dIxXi08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746806997; c=relaxed/simple;
	bh=XpdZJNb/572VQuRWSZiwlXcZh7edQDGizIs9BsDnmSs=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=oRkdPjFbCR+PAqHxNaCklupJ/lgTIj9Tl0aNOsAtGrjk+KVLniK092Ru/xsb99r4ps3sC7WMbrJO+DsN8LFe9eg8BX1gyeVBKWgSnk8D0GBkrBd3JKcFn/1l10p/6lLl+5mUMx/ZSgrzLgWQIIdiovZ4NhFlaLceOsvviA6xHgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=gPSq3yrd; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="gPSq3yrd"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7376e311086so3365466b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 09:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1746806995; x=1747411795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QnWvRvLBiox5Bz9Lyem6f8SVAf49ycnR85XD0lPPJ4k=;
        b=gPSq3yrdCuF7pGYWAkT7v9mUWeG9TC5VVYYAoRGYqnYubfG2J2s4lyyjAciYG/wFIs
         te2Go4z2hhYxUvqJHhbEI7dI8HIISWWhc0ql03Qvjp4r5N6C4a0NQVqgpGQLmiR2cplX
         QgF1Ua7VwDqR/gb4ILhgvV9CrqAE081jGhb16kcTiJEKkQoRviKsVdKN2pahQo79kOdB
         qpdBg6C3N5j35WMFblQHI6srXx3Xb7fbRz3lsmcNhLIkX3a2hR0fkuTkfgvC2oJy3t1P
         0p0pISUjRW3S1mzfjhZSNkIUb/nDyGYN8rc2cM5f8XOxlaqQCaqAkm1deXdWtqUOYKLS
         CFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746806995; x=1747411795;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QnWvRvLBiox5Bz9Lyem6f8SVAf49ycnR85XD0lPPJ4k=;
        b=L/8rwAQw89YwgLh34NNUTXAUr2EtN2grbGo3+WxA+Z1JEtqB3uyBWFRhDHMpr/8cVD
         UIy3M2DaNqXUBoQ48aa9DDDNFx5kIoI/S3fiSvoP4ZFhq2bhxZztkjt1QqatWSPbbfnD
         wVG1Q418L9dd3UJcXStBKINpWRRwN6FbW3oeuDCO4WPgqVXhmwAL0nOZ6vHepHdSmBcU
         FnyId/FlH5tvh8i34iAq48Xv0ZKSdOVupPKC+RkqHndFrSrN9XJ0SS+M3rW/c22A8bKv
         sWTxje+AidEpp5O4RTvXEjDcOx/jexJ4w0Esc5e+rx1efoQsUCMwg1gbfI6WLv6vWhq3
         zO8A==
X-Forwarded-Encrypted: i=1; AJvYcCUku6gcNzy7wtTJQnByJ+mnGqYhgVmIEhGmsESOMLKsSdgsODyo3qA9kpI6JzQeZCgIUhdPLkzh8NrhAXU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym5EvzZ+FxLtLMv5g1gK9Tl5Uq5POAiMySaMw++DwvbXUZ1tZC
	cdxZKpAcoqLs7YjAJLNGc6rydVbFOkbTu5TbRI/y7H8i0uHT5vHHaCJk0nJ1zcE=
X-Gm-Gg: ASbGncucpA4YigC8r8RJKw6+Ky4KeHhSvJGSmTFAyNXDw0BxD574eVZPyAFzpsSadyq
	C1UqUmmllBuub80Cac1hNFcCZb4XWol1SqiWd5zGp54axDCgyTzSx5cxsLMrKxrAOjp1YzZfrij
	xul+0Dkc2+K/9FTMXbdQ+ZH+duwPrHFVJL7EnDYOolNIYwQ5bJEbYIgkQqqzDs8I/G+k73OvIKu
	06WakqZ5wFtml3lPzJ2k6PQ2kE5a5r/3LZp6Nq570TKt0OLg19MPpKwB2cHhfqJpf3eBmbcBHLi
	yKEhuBAO/ESP9khkwA2KymunLENqTHtKmQ==
X-Google-Smtp-Source: AGHT+IEaZucBNObFCPlL+hxe0V/lS5+Y6rCoZP8rip8WDQP4X8PU+EirWpJnUHe7qNQ+TAoVPn0hPg==
X-Received: by 2002:a05:6a00:f0b:b0:737:6fdf:bb69 with SMTP id d2e1a72fcca58-7423be92b53mr5075987b3a.13.1746806994709;
        Fri, 09 May 2025 09:09:54 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a3cfeasm1935720b3a.140.2025.05.09.09.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 09:09:54 -0700 (PDT)
Date: Fri, 09 May 2025 09:09:54 -0700 (PDT)
X-Google-Original-Date: Fri, 09 May 2025 09:09:50 PDT (-0700)
Subject:     Re: [PATCH] riscv: Disallow PR_GET_TAGGED_ADDR_CTRL without Supm
In-Reply-To: <20250507180811.3CKhxtu0@linutronix.de>
CC: samuel.holland@sifive.com, alex@ghiti.fr, linux-riscv@lists.infradead.org,
  aou@eecs.berkeley.edu, bodonnel@redhat.com, Charlie Jenkins <charlie@rivosinc.com>,
  Conor Dooley <conor.dooley@microchip.com>, joel.granados@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  cuiyunhui@bytedance.com, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: namcao@linutronix.de
Message-ID: <mhng-4654dddb-920a-456b-8fc9-2caaa80c4781@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 07 May 2025 11:08:11 PDT (-0700), namcao@linutronix.de wrote:
> On Wed, May 07, 2025 at 07:52:18AM -0700, Samuel Holland wrote:
>> When the prctl() interface for pointer masking was added, it did not
>> check that the pointer masking ISA extension was supported, only the
>> individual submodes. Userspace could still attempt to disable pointer
>> masking and query the pointer masking state. commit 81de1afb2dd1
>> ("riscv: Fix kernel crash due to PR_SET_TAGGED_ADDR_CTRL") disallowed
>> the former, as the senvcfg write could crash on older systems.
>> PR_GET_TAGGED_ADDR_CTRL state does not crash, because it reads only
>> kernel-internal state and not senvcfg, but it should still be disallowed
>> for consistency.

We talked some in the patchwork meeting about returning success for the 
flavors of this that could be emulated in the kernel without hardware 
support (ie, disabling pointer masking on systems that don't have it is 
trivial).  The general consensus is that didn't really help any, as 
userspace still needs to deal with systems where these will fail (old 
kernels, Kconfig disabled, etc).

Happy to reconsider that if someone cares.  Either way this is going up 
as a fix, as it just keeps the interface sane when taking 7f1c3de1370b 
("riscv: Disallow PR_GET_TAGGED_ADDR_CTRL without Supm") into account.

>> Fixes: 09d6775f503b ("riscv: Add support for userspace pointer masking")
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>>
>>  arch/riscv/kernel/process.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
>> index 7c244de77180..f7a1a887ae68 100644
>> --- a/arch/riscv/kernel/process.c
>> +++ b/arch/riscv/kernel/process.c
>> @@ -330,6 +330,9 @@ long get_tagged_addr_ctrl(struct task_struct *task)
>>  	struct thread_info *ti = task_thread_info(task);
>>  	long ret = 0;
>>
>> +	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM))
>> +		return -EINVAL;
>> +
>>  	if (is_compat_thread(ti))
>>  		return -EINVAL;
>
> I think this matches what the man page says:
>
> "If the arguments are invalid or this feature is disabled or unsupported by
> the kernel, the call fails with EINVAL"

Ya, it's also what we do when the Kconfig is disabled so it seems like 
the way to go (we talked about that some too).

> Reviewed-by: Nam Cao <namcao@linutronix.de>

Thanks!
