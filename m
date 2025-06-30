Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152B51DED52
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 22:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751322125; cv=none; b=eWXTeMlOjfa79yk6YfbyX0z1ofXZ7vdEC/fJlyuMtNZhOcmeJ9oEB6LkAEwfDBA5tMIzMpCbjpr/FfLxr5z99jeNskMVHZBjn9yCAU2BeU1eTjy5Vd4O/O1GubBxASwaXl9QkhrnoPm3qTkw/C5cI0dYFxKjnpIHTkJTkX647T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751322125; c=relaxed/simple;
	bh=2CLtz46U0ZXDtdiCgcIhzpUNTh65xRlOyaznme7qwv4=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=k7uhx/3BBEgwGQj6WZhfso2PrG12ZOJuw8qR/XuE79UJrXf93RLW+T0vmI4vvNCMBDkqoMBjDBMOuhcDq5eSRkJn9/K3Vs4nxYIEV8zvBoihh7gqN9dickTwhVe0vnbl9LMolDh3TCkKQcf1md0Rl6poIwE3aNB+MvdMlKZER6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=ISr/276a; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="ISr/276a"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-235ef62066eso60050705ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1751322122; x=1751926922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q27Lyqj7tm/2CIsdVUBHnoGs4hlAqirUyp1XE3Nqk7Q=;
        b=ISr/276aIyEw+hH/uB631znrMnX6J2CKltkhMqBYeHSz1HTu6r6E83PXmklX/dZfSh
         VH5JcGT2p66vJo8loXD5BWz7UUIn8kEZimgmBDw2ELBgZW+xoZphmcOYTz7AbQRtKs0Z
         XkFOKaxfE7A0rWM0TxJPy2mUIEDFrVhd9Rrvej6lh6AJIVlx+tb8J6CQIHKdBaVKB5dE
         o9gXth5OHY8TH/ngMzVrSigipH/EwPkAIWqV+IpiZ/P8IeDDcmhLT9Zy4hZ5PYxx+wwC
         PzpS719b06nSV3jMPzWXzlSFSy2PfhXY7EN/1EexZfSrly/7ZSFAG0/hA751GiM9AlQb
         AkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751322122; x=1751926922;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q27Lyqj7tm/2CIsdVUBHnoGs4hlAqirUyp1XE3Nqk7Q=;
        b=TWkxbmwGVSSLXj/qpuvHG2kL5sbCGWkH0Pm0ju5QQlZqrpa42rmuOsDJK4zLhgqkX4
         4ariEaP4bCxZwVDz5Bg/euMU11/oCqA3/riyeusqVxRCUUJVHEnzsdxixLhcrVcunS1d
         0i917f6FNTRfasdXVyThxAua5XuS5frKrXD2JZYG5CTvPdAVDImfG5LZE6rl9yj/XpWB
         hMC0aePts3tUOUo+CcgaONIyBQHkv9h2QXoqou4R2OqZCpSxUt39J6EiIfGWBDLXhKmG
         2I23bTmC+eI0xBJVIQu36NkVrFtUzJsPNzBbOM+aF/uWmdLdh6T2nWNNi98nAgV0nj9g
         CwNA==
X-Forwarded-Encrypted: i=1; AJvYcCXS4Hj8VCo03BhyvlHwvi8dYr7awoNKCsVOOF9UZ+ozMZudwjjwnleZjPD8hTm6cwZ795pvEDB4nd5mA6U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiKG2i9w4sEF5teeKUmYIKYzq64b8UW3+dERhqeB9aeqDZ/kIp
	mv9y6QRayPJ+XiWck0kn1M1eAgJlmYnbCR9a8+2GcTCUBz073UXDxqK8zsJ93JYcVZM=
X-Gm-Gg: ASbGncsbnP8GqIO06yPH6i1FF14DuwUwAfI29zoaWhlRW7arGDNpc/qNLA/BtmA7HIn
	2bVzakzjKEpzwmSsY7INomX/ltYkIABFYEv5myqJwuXzSrPG91j/dlUHJ3HHaxn4k4j19l4nXCT
	KFWBQZ+HVnqUrsbwbFT8oLfF0hoQ5isUZtewJCQMrRLQ2v2+7H/ULDVjUd1vkd5XkzfqOyQB1cc
	tyXouJXATL92KB/+ih7iEHzn5Ocdbg1ikBG88zy3746xFswTixqoL1UGhJfrt7DDUUUumVFSqck
	jObv8HMQWOIRdApKRiFO4h6zUIuR4z2RRUOlbuULWiwX33wh1sM9qbKM41Nj
X-Google-Smtp-Source: AGHT+IF/9/W/RobbWdwapPYgKRdpaogHaPHhcEoCtTmVtsHtpGyQZz83d6v6lkerOgwvII/tZ2AWiQ==
X-Received: by 2002:a17:903:22d2:b0:234:8f5d:e3b6 with SMTP id d9443c01a7336-23ac3bffd40mr175587995ad.3.1751322122339;
        Mon, 30 Jun 2025 15:22:02 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:9aba])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23acb3c6e14sm87155465ad.228.2025.06.30.15.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 15:22:01 -0700 (PDT)
Date: Mon, 30 Jun 2025 15:22:01 -0700 (PDT)
X-Google-Original-Date: Mon, 30 Jun 2025 15:21:59 PDT (-0700)
Subject:     Re: ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(security.o at 937376)
In-Reply-To: <20250630064442.M5D7FRfm@linutronix.de>
CC: lkp@intel.com, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
  linux-kernel@vger.kernel.org, alexghiti@rivosinc.com, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: namcao@linutronix.de
Message-ID: <mhng-111A4C41-B987-489A-9D99-754124522DB4@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Sun, 29 Jun 2025 23:45:06 PDT (-0700), namcao@linutronix.de wrote:
> +Cc: linux-riscv@lists.infradead.org
>
> On Sun, Jun 29, 2025 at 02:25:33AM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   aaf724ed69264719550ec4f194d3ab17b886af9a
>> commit: 890ba5be6335dbbbc99af14ea007befb5f83f174 Revert "riscv: Define TASK_SIZE_MAX for __access_ok()"
>> date:   5 days ago
>> config: riscv-randconfig-001-20250628 (https://download.01.org/0day-ci/archive/20250629/202506290255.KBVM83vZ-lkp@intel.com/config)
>> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506290255.KBVM83vZ-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202506290255.KBVM83vZ-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(net-traces.o at 1014596)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(e1000_main.o at 992876)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(core.o at 912236)
>> >> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(security.o at 937376)
>> >> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(sock.o at 1012256)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(ioctl.o at 1015736)
>> >> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(socket.o at 1012196)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(ring_buffer.o at 910076)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(hugetlb.o at 919016)
>> >> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(btf.o at 913916)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(page_alloc.o at 918536)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(slub.o at 918836)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(spi.o at 992036)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(vmalloc.o at 918296)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(syscall.o at 912296)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(trace.o at 910136)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(skbuff.o at 1012376)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(vmscan.o at 916376)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(xprtsock.o at 1024196)
>>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(filemap.o at 915776)
>>    ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)
>
> I'm not sure what lld is saying here. It seems this problem has always been
> there, the revert commit just made it appears more.
>
> These errors should still be investigated, but I think the revert commit is
> fine.

Ya, I agree.

> I see CONFIG_CMODEL_MEDLOW=y, so probably has something to do with
> arch/riscv/mm/init.c is compiled with -mcmodel=medany, while the others are
> compiled with -mcmodel=medlow. I leave it to smarter minds..

LLVM has a blurb that says

    // Linking object files with different code models is undefined behavior
    // because the compiler would have to generate additional code (to span
    // longer jumps) if a larger code model is used with a smaller one.
    // Therefore we will treat attempts to mix code models as an error.

which is just wacky, so I'm moaning about it over here 
<https://github.com/ClangBuiltLinux/linux/issues/2097>...
