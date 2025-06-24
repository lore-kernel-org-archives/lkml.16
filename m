Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9F525D53E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750754141; cv=none; b=MyBPUM8x400j8SxWrVFxHQQ4WCvZy6VGfZs3o9tgHSvmUPSbTBXr0SW2MQzcwQWjZUyJcsdpvJ0xCdOyByKpDgcxxbR6Q3IbZ2JjQt66+KE1nlVwY4qIkZvpgFc/GJE0RhPTAPqCzJP9wHkZFBRAolLvZiNToeCcUTQUVw4h1M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750754141; c=relaxed/simple;
	bh=DY8VfVXh807HpqhQSvP05svNfSrRH+64YMmFIomMOs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l44bi6vELsT35YtJhLl6+NDbCJIYSduCvDas9nUkRf9BK86W+mhBH0LbqFvmiOSiZwxs16G3gfT0X968shM+lB0IIzN1ssCUKq1FE4f4q7QKmJPRwsA71jy+pswb38c5efR69fQ2JUbP4OAv7hvbi+m630KLYalLbZDNmlXOsss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 3122758250d611f0b29709d653e92f7d-20250624
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:2399aed0-3dbb-4733-8ad9-882089a3a0b0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:e4d7ca572d61b1a74d34c9c0b6b80160,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|52,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3122758250d611f0b29709d653e92f7d-20250624
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <xialonglong@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 917961575; Tue, 24 Jun 2025 16:35:32 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 5B686160038C1;
	Tue, 24 Jun 2025 16:35:32 +0800 (CST)
X-ns-mid: postfix-685A6354-1975593342
Received: from [172.25.120.23] (unknown [172.25.120.23])
	by node4.com.cn (NSMail) with ESMTPA id 9885616001A03;
	Tue, 24 Jun 2025 08:35:28 +0000 (UTC)
Message-ID: <910a462a-8d4d-4b5d-941c-ba1396e287dc@kylinos.cn>
Date: Tue, 24 Jun 2025 16:35:27 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] mm/ksm: add ksm_pages_sharing for each process to
 calculate profit more accurately
To: xu.xin16@zte.com.cn, david@redhat.com
Cc: akpm@linux-foundation.org, chengming.zhou@linux.dev, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, shr@devkernel.io, corbet@lwn.net,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz
References: <202506181714096412Nvp5B3BkFpi3-CKLQ9ep@zte.com.cn>
From: Longlong Xia <xialonglong@kylinos.cn>
In-Reply-To: <202506181714096412Nvp5B3BkFpi3-CKLQ9ep@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable


=E5=9C=A8 2025/6/18 17:14, xu.xin16@zte.com.cn =E5=86=99=E9=81=93:
>>>> and /proc/self/ksm_stat/ to indicate the saved pages of this process=
.
>>>> (not including ksm_zero_pages)
>>> Curious, why is updating ksm_process_profit() insufficient and we als=
o
>>> have to expose ksm_pages_sharing?
>>>
>> Since ksm_process_profit() uses ksm_merging_pages(pages_sharing +
>> pages_shared) to calculate the profit for individual processes,
>>
>> while general_profit uses pages_sharing for profit calculation, this c=
an
>> lead to the total profit calculated for each process being greater tha=
n
>> that of general_profit.
>>
>> Additionally, exposing ksm_pages_sharing under /proc/self/ksm_stat/ ma=
y
>> be sufficient.
>>
> Hi,
>
> Althorugh it's true, however, this patch maybe not okay. It can only en=
sure
> that the sum of each process's profit roughly equals the system's gener=
al_profit
> , but gives totally wrong profit result for some one process. For examp=
le, when
> two pages from two different processes are merged, one process's page_s=
hared
> increments by +1, while the other's pages_sharing increments by +1, whi=
ch
> resulting in different calculated profits for the two processes, even t=
hough
> their actual profits are identical. If in more extreme cases, this coul=
d even
> render a process's profit entirely unreadable.
>
> Lastly, do we really need each process=E2=80=99s profit sum to perfectl=
y match the general
> profit, or we just want a rough estimate of the process=E2=80=99s profi=
t from KSM ?
>
Hi,

In extreme cases, stable nodes may be distributed quite unevenly, which=20
is due to stable nodes not being per mm, of course.
There are also situations where there are 1000 pairs of pages, with the=20
pages within each pair being identical, while each pair is different=20
from all other pages.
This results in the number of page_sharing and page_shared being the=20
same. This way, using ksm_merging_pages(page_sharing + page_shared)=20
averages a 50% error.
In practical testing, we may only need to enable KSM for specific=20
applications and calculate the total benefits of these processes.
Since page_shared is also included in the statistics, this may lead to=20
the calculated benefits being higher than the actual ones.
In practical testing, the error may reach 20%. For example, in one test,=20
the total benefits of all processes were estimated to be around 528MB,
while the profit calculated through general_profit was only around 428MB.
The theoretical error may be around 50%.

If we expose the ksm_pages_sharing for each process, we can not only=20
calculate the actual benefits

but also determine how many ksm_pages_shared there are by the difference=20
between ksm_merging_pages and ksm_pages_sharing of each process.

>>
>>> Hm, I am wondering if that works. Stable nodes are not per MM, so
>>> can't we create an accounting imbalance for one MM somehow?
>>>
>>> (did not look into all the details, just something that came to mind)
>>>
>> Indeed, using the method in this patch to calculate ksm_pages_sharing
>> for each process to determine ksm_pages_shared
>>
>> can sometimes result in negative values for ksm_pages_shared.
>>
>> example for calculate mm->ksm_pages_shared=EF=BC=9A
>>
>>           if (rmap_item->hlist.next) {
>>               ksm_pages_sharing--;
>>               rmap_item->mm->ksm_pages_sharing--;
>>
>>           } else {
>>               ksm_pages_shared--;
>>                rmap_item->mm->ksm_pages_shared--; // can be negative
>>           }
>>
>>           rmap_item->mm->ksm_merging_pages--;
>>
>>
>> Would it be possible to compare the ratio of each process's rmap_item =
to
>> the total rmap_item and the ratio of the process's page_shared to the
>> total page_shared
>>
>> to assess this imbalance? For now, I don't have any better ideas.
> Although stable_node is not per-mm, if you really add ksm_shared to mm,
> it won't cause negative ksm_pages_shared, because the count of ksm_shar=
ed
> will only be attributed to the process of the first rmap_item.
Yes, it was the incorrect method I used during testing that led to the=20
negative values.
After the improvement, it has not occurred again.

Thank you for your time.
Best regards,
Longlong Xia




