Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B6B7DA6D
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 03:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748575162; cv=none; b=jxvpEX7wVqf97arGlWyip6J0y4LE/VWb+Epdm0ST5DOzRcxSUDeFhpP9SSDLH5c9S0moXzoalBZYT+3PZZnw+wN4IEWLE9YSQXQnfnPJpGHSYY1L2/XitJ9dB1bK/d7UM5No/c4CV4zpyI6/oBgHVxAMY2aSoPbXViM5R4xGQIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748575162; c=relaxed/simple;
	bh=rrOcpru5BubrRiNH2qG5rubxS9EcrGMXnRaP/gR5FOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gouDWkLjKPCHjWWL5vOG2vjk70fgBa1vJWaPqyRyCbruUfDPPy79e8swS74RkIQz5otK45YVv9UOBNcbgnqopNIBVybVGkRLuY8TsOzP/TzjHNLIS1Ybi+4brd4hgRrOeB17A6BwMEYbCucYrQb3S8iUAChum5YT9xwEuqgeBxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xt3YL2Tr; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xt3YL2Tr"
Message-ID: <7867c19d-bd6c-4f8a-a227-1145fa0516d9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748575158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X7EYZXFII3k2j3Ewz72wcbW5pSHjtJI5SiZbJkKBZAk=;
	b=xt3YL2TrLEPB9zmNh1qbjZiQtaHoDug4D3mw4ZODesuTJAOeMmDyzeHVZd1rsORk84rdDt
	hXQid96WxG+n3Q1Pd8X7xOz9oZ746nMWc6yvYRKLksaQaPHb3Tg8l4maPfe4725/Bh0uuS
	t5BT+br5U93ZrpUCWPdtKd8nZG8C+jo=
Date: Fri, 30 May 2025 11:18:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4] tools/mm: Add script to display page state for a given
 PID and VADDR
To: SeongJae Park <sj@kernel.org>
Cc: akpm@linux-foundation.org, linux-debuggers@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-toolchains@vger.kernel.org, osandov@osandov.com, paulmck@kernel.org,
 sweettea-kernel@dorminy.me, liuye@kylinos.cn, fweimer@redhat.com
References: <20250528234232.56701-1-sj@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ye Liu <ye.liu@linux.dev>
In-Reply-To: <20250528234232.56701-1-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/5/29 07:42, SeongJae Park 写道:
> On Wed, 28 May 2025 17:15:43 +0800 Ye Liu <ye.liu@linux.dev> wrote:
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
>> sudo ./show_page_info.py 1 0x7fb3eb1b2000
>> PID: 1 Comm: systemd mm: 0xffff8d27279f9cc0
>> Raw: 0017ffffc000416c fffff31105a61b08 fffff31105a63608 ffff8d27121326a8
>> Raw: 0000000000000000 ffff8d271b9dcc40 0000002500000007 ffff8d2711f12700
>> User Virtual Address: 0x7fb3eb1b2000
> This is same to what the user passes as the input.  I think this is not really
> needed?

It will be removed in the next version.

>> Page Address:         0xfffff31106356a00
>> Page Flags:           PG_referenced|PG_uptodate|PG_lru|PG_head|PG_active|
>>                       PG_private|PG_reported|PG_has_hwpoisoned
>> Page Size:            4096
>> Page PFN:             0x18d5a8
>> Page Physical:        0x18d5a8000
>> Page Virtual:         0xffff8d274d5a8000
>> Page Refcount:        37
>> Page Mapcount:        7
>> Page Index:           0x0
>> Page Memcg Data:      0xffff8d2711f12700
>> Memcg Name:           init.scope
>> Memcg Path:           /sys/fs/cgroup/memory/init.scope
> On my setup, above two lines look like below:
>
>     Memcg Name:           unknown
>     Memcg Path:           Unexpected error: 'struct kernfs_node' has no member 'parent'
>
> Maybe there are rooms to improve?
The drgn version needs to be updated.
>> Page Mapping:         0xffff8d27121326a8
>> Page Anon/File:       File
>> Page VMA:             0xffff8d26cac47600
>> VMA Start:            0x7fb3eb1b2000
>> VMA End:              0x7fb3eb1b6000
>> This page is part of a compound page.
>> This page is the head page of a compound page.
>> Head Page:            0xfffff31106356a00
>> Compound Order:       2
>> Number of Pages:      4
>>
>> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> On my setup, this tool works without obvious or significant errors.
>
> Tested-by: SeongJae Park <sj@kernel.org>
>
Thanks,
Ye

> Thanks,
> SJ
>
> [...]
