Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.8])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DBA42550B4
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 06:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749191521; cv=none; b=cZXR0GegZgTGW29JrtJFLLpUlj+r3P4t84hWlx27XHe2MZKZNLZPLJEoPFXjOvDmrsnSHgYx8BVAa4Nx8QYM+j5rSs6E/zUY69mrvMnifqGzXpR5FwuIQTTEFYpYgsMCHxwdzUNMH1a1nm5VIFO6N0Ob7x7OK4EDOMtOfu5Zy64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749191521; c=relaxed/simple;
	bh=twRi+HAcOCoN8kNjPgqZNRZo3pWlLxYUYgi6AF6k4gM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XaRm6bfYTAUHHIDnDYjlgGuLPbqC+38JHKvdOAaxfx6G0yLJzmzFUzQma2VOHyM/jCtn0kXCwgiXycCQGal5tS9pib+sCY33UvkucVbwm65vDO4KusOrWCGQyMEAY+4V03Mc16bxmhgaeCDtSUCho+GVmoiB8uxsgDPEOMTifbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=psEsKbkL; arc=none smtp.client-ip=117.135.210.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="psEsKbkL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=VlkXIqbrHLNm6KB283mzI4Nr/emCcxR2Gwn0N2hg5lw=;
	b=psEsKbkLFnDrIJ2bRJQpP0KZD8fbbK97QG2hPjjn+DTmY68UBdlBYHe5CYr7RQ
	4GSwwR2osODvKK0WXu+aUYEGodv48mxz+gq5S4C1y2FMpGZhFHyaMFuzjwiWG+JE
	nWxOBn/0c2FZV1W3AOAk9R8rCoNPN4ChWqAltmScKbojg=
Received: from [172.19.20.199] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PikvCgD3h7iKgEJolGIhBA--.42221S2;
	Fri, 06 Jun 2025 13:45:47 +0800 (CST)
Message-ID: <a57a2de7-1b0c-4cc9-a300-02cb46c1f02a@126.com>
Date: Fri, 6 Jun 2025 13:45:46 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] mm/hugetlb: remove unnecessary holding of hugetlb_lock
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 21cnbao@gmail.com,
 david@redhat.com, baolin.wang@linux.alibaba.com, muchun.song@linux.dev,
 osalvador@suse.de, liuzixing@hygon.cn
References: <1748317010-16272-1-git-send-email-yangge1116@126.com>
 <20250604154754.a30e327c3f1640173c8b9cb8@linux-foundation.org>
 <c15bfa20-2113-4299-98bf-1865b6b535ef@126.com>
 <20250605181242.54767f38223f9ebd4c379ccb@linux-foundation.org>
From: Ge Yang <yangge1116@126.com>
In-Reply-To: <20250605181242.54767f38223f9ebd4c379ccb@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PikvCgD3h7iKgEJolGIhBA--.42221S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKrW5Jw13uF45ury7Gw4rXwb_yoWkKrc_ur
	1kZ3s7Cw4UW3yqga1ktrZFvrsxK3yxZrZ5Jay0krZ7Aas7XF13WFs3tana9Fs3Wa1kJFnr
	Wr90gwsIyr4jgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8OdbUUUUUU==
X-CM-SenderInfo: 51dqwwjhrrila6rslhhfrp/1tbiOgxkG2hCeNjCwgAAsD



在 2025/6/6 9:12, Andrew Morton 写道:
> On Thu, 5 Jun 2025 08:44:09 +0800 Ge Yang <yangge1116@126.com> wrote:
> 
>>> This change addresses a possible performance issue which was introduced
>>> by 113ed54ad276 ("mm/hugetlb: fix kernel NULL pointer dereference when
>>> replacing free hugetlb folios").  113ed54ad276 was added recently and
>>> was cc:stable.
>>>
>>> David said:
>>> https://lkml.kernel.org/r/87521d93-cc03-480d-a2ef-3ef8c84481c9@redhat.com
>>>
>>>
>>> Question is, will that bugfix's performance impact be sufficiently
>>> serious for us to also backport this new patch?
>>
>> In some low-probability scenarios, there could be severe impacts. For
>> example, when multiple CPUs execute the replace_free_hugepage_folios()
>> function simultaneously. It seems that we need to backport this new
>> patch. Thank you.
> 
> OK, thanks.  I added
> 
> Fixes: 113ed54ad276 ("mm/hugetlb: fix kernel NULL pointer dereference when replacing free hugetlb folios")
> Cc: <stable@vger.kernel.org>
> 
> and moved this to the mm-hotfixes pile.  I'll keep it there for a week
> or two for review/test.  Once it goes upstream, this should propagate
> into 6.15.x.

Ok，thanks.

