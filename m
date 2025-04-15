Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F1EA48
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744703365; cv=none; b=UmUX83poSDKlaf4/DOuRoHo/+jKrpKIX6or50TblCZ5ymb9bKDhAUNCM7ywk027n5Ya4mpfYDzErm3JjL7E6EKdw7xxa6jmb7cIzRpp5aXRU1XYADNcjqEZTxDu8uACW9NKveAqF2NT0a7O+ZviOw2rEHdsBac5/7Bfn0ugTSIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744703365; c=relaxed/simple;
	bh=tyZdD//ZQ6xBE/MhpjFRlze6sRS157wJz+AgJACwy20=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=XpCT9K1Kpb3GjN5nHaCobMXSu13qcKcbMO05d6Sp5a2h+klhxiAftChPwJZY5XnWHEuIfsTdllQ9u7ThebaWthfjyeniTFkTQOGb0BZ9BllCaApkIF1zmbkKHR/YlKQ8w/tDt0EqfLsI2zxltJFryNraTkldLLHMN9Ez56MLGUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tEttmYOD; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tEttmYOD"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744703360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ByW6HPxFcxRsglwqIKn+qgCgO3dW6iqP67Paz1bTeZ4=;
	b=tEttmYODW/NrdlmG+LFlwQw/fO7aX2fQeE2M4L98pNGv8kYuv03jWouMZmPMpykJ20JlVG
	20nwjNHc7fjIu3TPdkVHvFlOALBwI5KqUs1sElNqdmBGY/EpWJQAdayZuCryMolMteSTDz
	FwbzJe2LJZ3s+EwI1uE+GzHcngIpYdg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH] mm, hugetlb: Reset mapping to TAIL_MAPPING before
 restoring vmemmap
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <a2447027-bc5f-461e-8fd8-93704dd543e4@redhat.com>
Date: Tue, 15 Apr 2025 15:48:39 +0800
Cc: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Vlastimil Babka <vbabka@suse.cz>,
 Matthew Wilcox <willy@infradead.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <543686EA-CA72-4883-858B-15804FDB96F3@linux.dev>
References: <20250415054705.370412-1-osalvador@suse.de>
 <ab6d9bc7-4e6a-4604-9dca-44b13ce409b6@redhat.com>
 <a2447027-bc5f-461e-8fd8-93704dd543e4@redhat.com>
To: David Hildenbrand <david@redhat.com>
X-Migadu-Flow: FLOW_OUT



> On Apr 15, 2025, at 15:32, David Hildenbrand <david@redhat.com> wrote:
>=20
> On 15.04.25 09:23, David Hildenbrand wrote:
>> On 15.04.25 07:47, Oscar Salvador wrote:
>>> commit 4eeec8c89a0c ("mm: move hugetlb specific things in folio to =
page[3]")
>>> shifted hugetlb specific stuff, and now mapping overlaps =
_hugetlb_cgroup field.
>>>=20
>>> _hugetlb_cgroup is set to NULL when preparing the hugetlb page in
>>> init_new_hugetlb_folio().
>>> For a better picture, this is page->mapping before and after the =
comming
>>> for the first three tail pages:
>>>=20
>>> before:
>>> page: fffff51a44358040  0000000000000000
>>> page: fffff51a44358080  0000000000000000
>>> page: fffff51a443580c0  dead000000000400
>>>=20
>>> after:
>>> page: fffff1f0042b0040  0000000000000000
>>> page: fffff1f0042b0080  fffff1f0042b0090
>>> page: fffff1f0042b00c0  0000000000000000
>>>=20
>>> Tail#2 has fffff1f0042b0090 because of the _deferred_list =
initialization,
>>> which was also shifted, but that is not a problem.
>>>=20
>>> For HVO, upon restoring that gets copied in some tail pages =
(reset_struct_pages)
>>> and so those tail pages will not have TAIL_MAPPING set and the check
>>> in free_tail_page_prepare() will fail:
>>>=20
>>>   kernel: BUG: Bad page state in process kworker/0:3  pfn:10ac40
>>>   kernel: page does not match folio
>>>   kernel: page: refcount:0 mapcount:0 mapping:0000000000000000 =
index:0x0 pfn:0x10ac40
>>>   kernel: flags: 0x17ffffc0000000(node=3D0|zone=3D2|lastcpupid=3D0x1ff=
fff)
>>>   kernel: raw: 0017ffffc0000000 fffff1f0042b0000 0000000000000000 =
0000000000000000
>>>   kernel: raw: 0000000000000000 0000000000000000 00000000ffffffff =
0000000000000000
>>>   kernel: page dumped because: corrupted mapping in tail page
>>>=20
>>> Reset _hugetlb_cgroup to TAIL_MAPPING before restoring so tail pages =
have the
>>> right value.
>> Hi,
>> To handle that for ordinary hugtlb alloc/free I added in that patch =
in free_tail_page_prepare():
>> case 3:
>> /* the third tail page: hugetlb specifics overlap ->mappings */
>> if (IS_ENABLED(CONFIG_HUGETLB_PAGE))
>> break;
>> fallthrough;
>> default:
>> if (page->mapping !=3D TAIL_MAPPING) {
>> bad_page(page, "corrupted mapping in tail page");
>> goto out;
>> }
>> break;
>> }
>> Now I am confused why that check doesn't catch that?
>> Apparently only a problem with HVO? Because I recall testing the =
ordinary alloc/free.
>=20
> Ah, reading about the HVO hackery in the comment above =
NR_RESET_STRUCT_PAGE, might the following fix it?

Yes. And the Fixes tag should be

  Fixes: 4eeec8c89a0c ("mm: move hugetlb specific things in folio to =
page[3]")

Thanks.

>=20
>=20
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index 9a99dfa3c4958..27245e86df250 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -238,11 +238,11 @@ static void vmemmap_remap_pte(pte_t *pte, =
unsigned long addr,
>  * struct page, the special metadata (e.g. page->flags or =
page->mapping)
>  * cannot copy to the tail struct page structs. The invalid value will =
be
>  * checked in the free_tail_page_prepare(). In order to avoid the =
message
> - * of "corrupted mapping in tail page". We need to reset at least 3 =
(one
> - * head struct page struct and two tail struct page structs) struct =
page
> + * of "corrupted mapping in tail page". We need to reset at least 4 =
(one
> + * head struct page struct and three tail struct page structs) struct =
page
>  * structs.
>  */
> -#define NR_RESET_STRUCT_PAGE           3
> +#define NR_RESET_STRUCT_PAGE           4
>  static inline void reset_struct_pages(struct page *start)
> {
>=20
> --=20
> Cheers,
>=20
> David / dhildenb


