Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F87213E81
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 18:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743444512; cv=none; b=q1AW49mFC5kBj3sBjbSnUUEIi8pGPXBs/uCMb8jVNalL6AyphoBYVtFEqo0od109tiJ6WGmEvbS0qt4v0d5+LmT4Asdi5k+qQ0UxnmJb6FbcDUOqy292Ld+ZOMBp1rRHP+xsRp7fRmaJy/wzA8pw0aqEVVV6BJHeI/EjqpP3cm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743444512; c=relaxed/simple;
	bh=olH4m4kk53u9cNmfYRGu86bQsK9SxtLGLnOT8S2xrhE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=s2OL5vEOZnK/hl6z2qYc9r42xPt1YFP1lUIlFwxWTQ1MjQ91ifCqO1S5YRe/kNbOhtR27JjZG7ubCynL647TV2iuVbDiHJ9JomPQ8ilLbOD6B+XfZt4xmb3EGUcEQb8Z/QE29YX7A0OBZbCCJQdx4QWns48mtVA28IMuDtnpg9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com; spf=pass smtp.mailfrom=iencinas.com; dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b=kXoXtbAI; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iencinas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b="kXoXtbAI"
Message-ID: <8c946f46-6453-4537-ab41-0e9dbde684e8@iencinas.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1743444497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xMxVAW58ZGEdGtUEe1CpsbQ+/ZdYRFfAzvIfiSdeIb8=;
	b=kXoXtbAIYlU/d1AcCclIw9VvUi/juJd37CHBeQaSwvCKnkew4KV8H79p2j5u5UW1Btasjp
	PEFO13d/Hui4qxnzyeDLeDEwpK0g7AHXfHVYNcHiKNkoTfX8eHL8ercKcrr4Pq4t/pdbL7
	PhyyLLw/+R9zekUIIBUCZ2zlGu4/h3G10rqgHqwUWUR01dWr7GjKkszR0ZLH5nEZS64fbv
	BEKJXEcDBrmwDgO3JsZK9mZFeD63yrfRDZSL4Id+kQmnGFto6N06xZ//P/Vzi462+NoALh
	/KMxXqbzlOWujMsE24nXHMnVndYhcyFJADcXeODjJeqWucNQ2FLSpAvCpsFX3w==
Date: Mon, 31 Mar 2025 20:08:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ignacio Encinas Rubio <ignacio@iencinas.com>
Subject: Re: [PATCH] mm: mark mm_struct.hiwater_rss as data racy
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 syzbot+419c4b42acc36c420ad3@syzkaller.appspotmail.com
References: <20250330-mm-maxrss-data-race-v1-1-2fe0ba6b8482@iencinas.com>
 <2c15f7bf-7852-4aa5-98f1-c8604fe8fc00@lucifer.local>
Content-Language: en-US
In-Reply-To: <2c15f7bf-7852-4aa5-98f1-c8604fe8fc00@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 31/3/25 13:48, Lorenzo Stoakes wrote:
> On Sun, Mar 30, 2025 at 02:02:04PM +0200, Ignacio Encinas wrote:
>> mm_struct.hiwater_rss can be accessed concurrently without proper
>> synchronization as reported by KCSAN.
>>
>> Given that this just provides accounting information and that the extra
>> accuracy isn't worth the potential slowdown, let's annotate is
>> __data_racy to make KCSAN happy.
>>
>> Reported-by: syzbot+419c4b42acc36c420ad3@syzkaller.appspotmail.com
> 
> You'll want a:
> Closes: https://lore.kernel.org/all/67e3390c.050a0220.1ec46.0001.GAE@google.com/
> 
> Here too.

Thanks for pointing it out. I saw some people didn't use it, but I'll
add it. 

>> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
>> index 0234f14f2aa6bea42a8a62ccb915c94f556cd3cc..84c86951a978aad07ab4ecefbfff77e7418d8402 100644
>> --- a/include/linux/mm_types.h
>> +++ b/include/linux/mm_types.h
>> @@ -19,6 +19,7 @@
>>  #include <linux/workqueue.h>
>>  #include <linux/seqlock.h>
>>  #include <linux/percpu_counter.h>
>> +#include <linux/compiler_types.h>
>>
>>  #include <asm/mmu.h>
>>
>> @@ -939,7 +940,7 @@ struct mm_struct {
>>  #endif
>>
>>
>> -		unsigned long hiwater_rss; /* High-watermark of RSS usage */
>> +		unsigned long __data_racy hiwater_rss; /* High-watermark of RSS usage */
> 
> This translates to volatile if KCSAN is enabled, and I really don't want to
> apply that unnecessarily given the impliciations/any weirdness we might
> observe as a result that might be confounding.
> 
> I also don't want to _across the board_ say 'hey we don't care about races
> for this'.
> 
> I think use of data_race() would make more sense.

Makes sense. The logic behind using __data_racy was to convey that data
races were fine in this case because it's just statistical information.
From what you're saying I misinterpreted the situation :)

> Probably we're fine doing this in update_hiwater_rss(), so something like:
> 
> static inline void update_hiwater_rss(struct mm_struct *mm)
> {
> 	unsigned long _rss = get_mm_rss(mm);
> 
> 	if (data_race(mm->hiwater_rss) < _rss)
> 		mm->hiwater_rss = _rss;
> }
> 
> This labels it as 'we don't care', is a no-op if KCSAN is disabled and
> abstracts the decision to this specific point.

Thanks for the suggestion. I agree this looks fine. If there are other 
races (for which get_mm_hiwater_rss seems the only candidate) these can 
be examined on their own.

I'll adapt your suggestion, reword the commit and send a v2.

Thanks!

