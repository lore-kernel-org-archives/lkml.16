Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625CC282E1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745461105; cv=none; b=HkIjvHC7Fyjm3JCimVUrMrlfPIa0N8TxwNfYUtyD9u05wpVBP5eI3UsSt4aieDCnU15fHYySC/eL4ot3CQIlpLDjwxeDcKddQ/iUmbPOry899QNHDGgQORG905YxMKVdCxJRlTBpGW9GzLgjI6WT9wMBoSUea45GBb1Mz7+qf64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745461105; c=relaxed/simple;
	bh=UVVi4P/sqC1/mlMQUgwoPMiBvWDUJoPNhcKxSph6Fow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L/U6l5EE3u6BZuFRE7yRdN0a33B/uChjs6PTZWWENwUtm8TCnyO6tobIqWaKI3leAkjnKPX2ZcJybFXHFW6NtObEaTSlq+03r7IxFuoZQpf11kg0kgLpG3g/5B9hANDTqMtmyg86ntO4jnBC/7pXiSqxIc1rMDJ/fZactxmpVb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EJi9vs5V; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EJi9vs5V"
Message-ID: <ba37651b-95fd-4db2-8806-58cd2a08a979@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745461091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2T5lAnrEJNQwQyiPVjj4uMl+QlzCXBRaN6qYGLhWYKE=;
	b=EJi9vs5VuPrCf+IsuIhmfeiUsjfuW5oijaBPLAesl2OHnb4Ge6KVn4qvnoI0fU9psMDF8S
	HSqkipFcZiY3aBK8VUUnFztyL5Hg/bnx42cesDbGQAF2a64Qi9GskUXeln6DVMzpLjWSIt
	Pvrtpvx5HmlDBGDz5rSlWEyEe+LQZTo=
Date: Thu, 24 Apr 2025 10:17:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3] tools/mm: Add script to display page state for a given
 PID and VADDR
To: Florian Weimer <fweimer@redhat.com>
Cc: akpm@linux-foundation.org, linux-debuggers@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-toolchains@vger.kernel.org, osandov@osandov.com, paulmck@kernel.org,
 sweettea-kernel@dorminy.me, liuye@kylinos.cn
References: <20250423014850.344501-1-ye.liu@linux.dev>
 <87jz7bky7i.fsf@oldenburg.str.redhat.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ye Liu <ye.liu@linux.dev>
In-Reply-To: <87jz7bky7i.fsf@oldenburg.str.redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/4/23 17:45, Florian Weimer 写道:
> * Ye Liu:
>
>> From: Ye Liu <liuye@kylinos.cn>
>>
>> Introduces a new drgn script, `show_page_info.py`, which allows users
>> to analyze the state of a page given a process ID (PID) and a virtual
>> address (VADDR). This can help kernel developers or debuggers easily
>> inspect page-related information in a live kernel or vmcore.
>>
>> The script extracts information such as the page flags, mapping, and
>> other metadata relevant to diagnosing memory issues.
>>
>> Output example:
>> sudo ./show_page_info.py 1 0x7f43df5acf00
>> PID: 1 Comm: systemd mm: 0xffff8881273bbc40
>> Raw: 0017ffffc000416c ffffea00043a4508 ffffea0004381e08 ffff88810f086a70
>> Raw: 0000000000000000 ffff888120c9b0c0 0000002500000007 ffff88812642c000
>> User Virtual Address: 0x7f43df5acf00
>> Page Address:         0xffffea00049a0b00
>> Page Flags:           PG_referenced|PG_uptodate|PG_lru|PG_head|PG_active|
>> 		      PG_private|PG_reported
>> Page Size:            16384
>> Page PFN:             0x12682c
>> Page Physical:        0x12682c000
>> Page Virtual:         0xffff88812682c000
>> Page Refcount:        37
>> Page Mapcount:        7
>> Page Index:           0x0
>> Page Memcg Data:      0xffff88812642c000
>> Memcg Name:           init.scope
>> Memcg Path:           /sys/fs/cgroup/memory/init.scope
>> Page Mapping:         0xffff88810f086a70
>> Page Anon/File:       File
>> Page VMA:             0xffff88810e4af3b8
>> VMA Start:            0x7f43df5ac000
>> VMA End:              0x7f43df5b0000
>> This page is part of a compound page.
>> This page is the head page of a compound page.
>> Head Page:            0xffffea00049a0b00
>> Compound Order:       2
>> Number of Pages:      4
> Does this show the page access flags anywhere in the output?  If not,
> would it be possible to include this information?


This script is currently a basic version, and we plan to gradually add
more detailed information about pages, including the page access flags
you mentioned, as well as PGD, PUD, PMD, PTE, file/anon rmap folios,
and more. This will be refined over time.                             

Thanks,
Ye Liu

> Thanks,
> Florian
>
