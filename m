Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E382028EC
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 02:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747189890; cv=none; b=OcHG33ZwtKgveFWO/rHSFNWn1hKYgZ1EHvdkg7aJchduCtj9QJBxrGqxHsl656jyiejhSqGfIaaOvSoUPE7Q+K08KXqRBf2DLyLBS5P3HrDSMNg8fPBd08a5Wp0Jxwdw1XW943H9YAxKOcUjBRdYxMGWpKWPeGByKXNRhDSjoRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747189890; c=relaxed/simple;
	bh=LjvvToWTFbGu8qqbc6FMpGTg25bWuuCmS0HGQk239dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uKdPLhSLw7sCYbe1Zfg3tGLvNuji8P5tcSD9v/SnF8fxUYjHj2nqgGUP1CvwXbsrnAoYAufnkqYu7MIGksZ6UJZmP0yrV//L5aex0KmM1z3Bmxl6/bKlceGXHv9FWkb/5Io7uvsgnxPYsFRxyaKIAOiF9sg8h2m7Nd6fe7E1wAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vVIApRZa; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vVIApRZa"
Message-ID: <21854d9d-c83c-402f-89c9-179bc684f0fd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747189881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OSGYsPY/ji+PKxMbLb2LEmvo/BGwhuEcdXZmFGwP0Cg=;
	b=vVIApRZaRMvfLZABn6WHZJ09a6iHhtFZ/61n0mVq7LRkCGNLCFOsd0LCvh1a0L5+bGyh8s
	tBgC98GBMJH4X3/z/9Kzmmka/S2u0L7ZH2o+7GyxO5NMeXdeZYWAL+wQ1UsqihjkxqcB33
	K+rCBrx+T/yinhh0cr6EnMhV4SjEBGc=
Date: Wed, 14 May 2025 10:31:12 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RFC PATCH] MAINTAINERS: add mm ksm section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, xu xin <xu.xin16@zte.com.cn>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250513161758.136402-1-lorenzo.stoakes@oracle.com>
 <dd10e199-e5de-4c4c-a524-68091973de7d@redhat.com>
 <783a848c-f9f0-4f2c-8d6f-46d2765d80f7@lucifer.local>
 <ae22b0df-f4ab-4567-b3b4-35c1c6b5233a@redhat.com>
 <561581d5-4f29-4e23-b543-09960118da9c@lucifer.local>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Chengming Zhou <chengming.zhou@linux.dev>
In-Reply-To: <561581d5-4f29-4e23-b543-09960118da9c@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2025/5/14 03:09, Lorenzo Stoakes wrote:
> On Tue, May 13, 2025 at 09:05:15PM +0200, David Hildenbrand wrote:
>> On 13.05.25 20:17, Lorenzo Stoakes wrote:
>>> On Tue, May 13, 2025 at 06:52:27PM +0200, David Hildenbrand wrote:
>>>> On 13.05.25 18:17, Lorenzo Stoakes wrote:
>>>>> As part of the ongoing efforts to sub-divide memory management
>>>>> maintainership and reviewership, establish a section for Kernel Samepage
>>>>> Merging (KSM) and add appropriate maintainers and reviewers.
>>>>>
>>>>> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>>>> ---
>>>>>
>>>>> REVIEWERS NOTES:
>>>>>
>>>>> I took a look through git blame, past commits, etc. and came up with what
>>>>> seems to be a reasonable list of people here, if you don't feel you ought
>>>>> to be here, or if you feel anybody is missing (including yourself!) let me
>>>>> know :)
>>>>>
>>>>> David has kindly already agreed to be co-maintainer for this section.
>>>>>
>>>>>     MAINTAINERS | 15 +++++++++++++++
>>>>>     1 file changed, 15 insertions(+)
>>>>>
>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>> index 80aa09f2e735..5ea2020acf84 100644
>>>>> --- a/MAINTAINERS
>>>>> +++ b/MAINTAINERS
>>>>> @@ -15567,6 +15567,21 @@ W:	http://www.linux-mm.org
>>>>>     T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>>>>>     F:	mm/gup.c
>>>>>
>>>>> +MEMORY MANAGEMENT - KSM (Kernel Samepage Merging)
>>>>> +M:	Andrew Morton <akpm@linux-foundation.org>
>>>>> +M:	David Hildenbrand <david@redhat.com>
>>>>> +R:	xu xin <xu.xin16@zte.com.cn>
>>>>> +R:	Chengming Zhou <chengming.zhou@linux.dev>
>>>>
>>>> I don't see a single RB from Chengming Zhou, and a single one from xu xin
>>>> ... :)
>>>
>>> Yeah sorry this is fuzzy but git blame mm/ksm.c for 2025 gives you _very little_
>>> activity in general, a series fro Xu and a series from yourself :) Xu's series
>>> was... acked by you :P
>>
>> Yes, 2025 so far had little activity (fortunately).
> 
> Deprecate? ;) (kidding haha)

Haha, these are very few changes in KSM since I submitted some optimizations.
Hopefully, maybe we will see more changes with more people trying to use it.

> 
>>
>>>
>>> Equally with Chengming based on other files listed here, I went and checked to
>>> see if there were substantive series as a sort of 'fuzzy matcher' which might
>>> imply a review interest here, and see there did seem to be some.
>>>
>>> But obviously if anybody feels any entry here is inappropriate, or on the other
>>> hand anybody was missed off, more than happy to rectify on the un-RFC!
>>
>> I guess my point is, as a submitter you expect that people that are listed
>> under R: that you are supposed to CC would actually ... review? :D
>>
> 
> Yeah of course, kinda makes sense right?
> 
>> In that case, I would prefer to have actual reviewers there. If there are
>> none, then there should be none listed.
>>
>> Of course, If Xu and Chengming do *want* to actively review KSM code
>> changes, I would be more than happy to list them.
> 
> Sure, so I think best thing is to ask:
> 
> Xu, Chengming - do you WANT to be reviewers here? :) if not, happy to drop.

Sure, I have time and passion to contribute, so:

Acked-by: Chengming Zhou <chengming.zhou@linux.dev>

Thanks!
