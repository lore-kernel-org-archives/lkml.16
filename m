Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA8225F987;
	Tue,  8 Apr 2025 07:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744098777; cv=none; b=sreayV06sKYMnE2oIK3fkwu+0mxroVN/3QvpaF/opsx2tat3TkzZQ+F/TtbbR03p9EVx16xk7fNW9/VsuuxMq0GpLLNTgym0cFqQB75XiZnDWoKzVdyPl+czJJ8TuKHJ5hT0JRrUvFeuoo96a21GPz4gyNK+B89vJwOPIAesW7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744098777; c=relaxed/simple;
	bh=ljJS8qQYfo2nm8bvCJlRcDRlmr6hYT/e363s6heZw+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I0yAI6Pp7QRzmyEbC1pHqdIbp3FNpkAGJb11GKMUb7Br3flbPDE51xR3M8oJuvisadqYvSV+44OAbm2r40LyyuOK1W1GH1cxvaKRAnRZUnXHnvueLrCDJkDy/IssPY2wAHzQtf+xrpOUc8dlYerrvxuILoFdxUlAa3mbX4Y8JGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org; spf=pass smtp.mailfrom=cachyos.org; dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b=IlkTbDSc; arc=none smtp.client-ip=202.61.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cachyos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b="IlkTbDSc"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B996C280AA4;
	Tue,  8 Apr 2025 09:52:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1744098772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OqgTZYxXv/xNrmSvb/jrSTI6+V6l0vurYjj+uVFpJnM=;
	b=IlkTbDScrHTPu/x+i7AOpVtg6teF1LgwjWNKInB07JSsjdz7dcxBamVs07xSB8dlmcwlsC
	iJIWGhuLRU18Mmd526P0Q6nvaqDHoB6YrfWb/Ncs/W6+SZVnE/6VUMz7lsbaU5Tc82cSZc
	bvfvSNeU9sp8d9gKeqOyEgr8vIRhp5szn/xiRUQZGeTN4NULgbFoUUjbiYEPTvW/roGJXf
	0xmBbAK3P3XLGeyUnDQxDG3QuQpPzGHx5j1eGkbkHMmNwelTwDs8APoVKbu4xxt675CipS
	1HOsBR5UcJ3bqS1aWMo3HVql511PHiin89av3brrxDffAf9GIeYLpXnh43MKnQ==
Message-ID: <182bfb4f-e856-47d8-bc54-d419109cb4ac@cachyos.org>
Date: Tue, 8 Apr 2025 15:52:25 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/17] mm: uninline the main body of vma_start_write()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Christoph Hellwig <hch@infradead.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
 akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org,
 liam.howlett@oracle.com, mhocko@suse.com, hannes@cmpxchg.org,
 mjguzik@gmail.com, oliver.sang@intel.com, mgorman@techsingularity.net,
 david@redhat.com, peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net,
 paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com,
 hdanton@sina.com, hughd@google.com, lokeshgidra@google.com,
 minchan@google.com, jannh@google.com, shakeel.butt@linux.dev,
 souravpanda@google.com, pasha.tatashin@soleen.com, klarasmodin@gmail.com,
 corbet@lwn.net, linux-doc@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-team@android.com
References: <20241226170710.1159679-1-surenb@google.com>
 <20241226170710.1159679-11-surenb@google.com>
 <0d36fd53-b817-4bbd-ae38-af094bd301df@suse.cz>
 <40182b31-95ad-4825-9c0c-0127be1734a6@cachyos.org>
 <Z_S7yjRXWIXnVXsf@infradead.org>
 <3f9f8a06-a044-4bce-a4e6-f17090cb3c0f@lucifer.local>
Content-Language: en-US
From: Eric Naim <dnaim@cachyos.org>
In-Reply-To: <3f9f8a06-a044-4bce-a4e6-f17090cb3c0f@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 4/8/25 14:25, Lorenzo Stoakes wrote:
> On Mon, Apr 07, 2025 at 11:01:46PM -0700, Christoph Hellwig wrote:
>> On Tue, Apr 08, 2025 at 12:39:25PM +0800, Eric Naim wrote:
>>> The out-of-tree NVIDIA modules seem to rely on this symbol, is it possible to use EXPORT_SYMBOL() here instead of EXPORT_SYMBOL_GPL(), below is the modpost error:
>>
>> No.  They don't have any business using this.
> 
> What on _earth_ are they using this for? Is this just via the VMA flag
> manipulation functions? If it's something else, it's an unintended use of this.
> 
> Anyway, generally speaking - agreed, this is absolutely a no-go Eric. In my view
> we simply should not be using EXPORT_SYMBOL() for _any_ new symbols whatsoever.
> 
> Out-of-tree modules are simply a non-consideration for core mm code, this is a
> GPL open source project. If I had my way we'd simply revoke _all_
> EXPORT_SYMBOL()'s, not add new ones.
> 
>>
>> In fact vma_start_write should not be exported at all, just the
>> vm_flags_{set,clear,mod} helpers.
> 
> Yup, I'd rather we just kept vma_start_write() mm-internal, though of course
> kernel/fork.c (ugh) needs it (we could probably refactor that in some way to
> avoid), and literally just the PPC arch (again maybe we can find a way round
> that).
> 
> Maybe one for me to look at actually... hmm.
> 
> Anyway Eric - I wonder if this is simply the nvidia OOT driver doing a
> vm_flags_...() call and then having an issue because the lock is uninlined now?
> 
> I guess you are jut noticing this is breaking and don't know since - proprietary
> code.


This seems to be the case, upon looking a bit deeper it looks like the driver code 
is calling atleast one of vm_flags_set. I couldn't find any direct calls to {,__}vma_start_write
at first and was bit confused.

> 
> Anyway in this case, the OOT driver should just write some GPL wrapper code or
> something here. Or better yet - make the driver open source :)

Yeah, as obvious as it seems it doesn't happen on their open-sourced code :)

Either way, I'm thankful for the replies. NVIDIA *should* have probably noticed
this already and it would probably fixed in the next driver or two so I'll just
let sleeping dogs lie.


-- 
Regards,
Eric
