Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB5D33993
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 05:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743659912; cv=none; b=tjciA5DK2OaArSoSKD9D60HEaeldpr3jUGV1eiZZw+3Yos9HlGnrlWMuFxm1mcbC2d93TNy+P1czRSR5/l7zdGbvuwNdT9Ryh2tzMZBjxvte5WMovJqr5bHGA6Vtvo6cXEMV6LQ8TDDnvl94+loaAf1FbOrCscndHsTFIioKNiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743659912; c=relaxed/simple;
	bh=3Kni2oOnbEHyUAU3pgeBQOPNWlUqFyZ9wu5gIlDz/Gc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dVGnYNVChshO/EYSdgLy0aue/UKqJj69NfZ8dGOWmzMeTi1+xkG3WPOP8F4IRpqG9wKXvGfn6Fj8EvzcuHJF8kv/RSTZJhaQ8mk29O9t2Nkx6iKmjZadJ5eWX/ypGy6qaTvlhQoHilfcwjChhUtggfmCx2OLTZWXoKADIX3SNZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xayL+XCw; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xayL+XCw"
Message-ID: <b6cd8306-5049-4e03-ac24-7f8f5bb381e2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743659906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z4j7PhN7Wup2fYwx3gBiSsMabuOB6a6FQW9/Vz5nkMk=;
	b=xayL+XCw9AqSEOzvQvWTAwKzx9GstCLM1h1BXL2Si7vcCmNaWQRJEKCzJc+Q/EATqCRgbD
	IB1w1EilAXBTs2x0toxWhPVLZXX2c+vUAfHwf8fnwLu4Z9DmiA64soBZkmeHuhUYhoLfVz
	ZmsGloM3c0IbrAzzfcePV6eOuSQTi8I=
Date: Thu, 3 Apr 2025 13:58:10 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4] mm/page_alloc: Consolidate unlikely handling in
 page_expected_state
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, Markus.Elfring@web.de,
 Ye Liu <liuye@kylinos.cn>, Sidhartha Kumar <sidhartha.kumar@oracle.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
References: <20250328014757.1212737-1-ye.liu@linux.dev>
 <Z-ayTt8o656AkGfz@casper.infradead.org>
 <8720c775-c0fb-4fbf-a1a8-409fef2b67ad@linux.dev>
 <Z-q71LlcCQ5I-2D-@casper.infradead.org>
 <6cd78595-f9d3-4f26-8ca3-d1a0bf4e8dff@linux.dev> <Z-4GuZZ_BjFNm9Gq@fedora>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ye Liu <ye.liu@linux.dev>
In-Reply-To: <Z-4GuZZ_BjFNm9Gq@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/4/3 11:55, Vishal Moola (Oracle) 写道:
> On Wed, Apr 02, 2025 at 10:49:17AM +0800, Ye Liu wrote:
>> 在 2025/3/31 23:59, Matthew Wilcox 写道:
>>> On Mon, Mar 31, 2025 at 08:08:01PM +0800, Ye Liu wrote:
>>>> 在 2025/3/28 22:29, Matthew Wilcox 写道:
>>>>> On Fri, Mar 28, 2025 at 09:47:57AM +0800, Ye Liu wrote:
>>>>>> Consolidate the handling of unlikely conditions in the 
>>>>>> page_expected_state() function to reduce code duplication and improve 
>>>>>> readability.
>>>>> I don't think this is an equivalent transformation.
>>>> Could you explain it in detail?
>>> page_expected_state() is called both at free and alloc.  I think
>>> the correct behaviour on encountering a HWPOISON page should be
>>> different at alloc and free, don't you?
>> In the alloc process, this patch does not modify the code behavior.
>> Regarding the free process, the if (unlikely(PageHWPoison(page)) && !order)
>> code handles the case where order is 0. When order is not 0, it does not
>> matter if __ClearPageBuddy is used to process the last page of the compound
>> page, because page->flags &= ~PAGE_FLAGS_CHECK_AT_PREP; will also clear it.
>> Is that right?                                                             
> I believe a page's "Buddy" flag is stored in page->type, so maybe this
> won't do what you expect?


Got it, thanks! I originally thought that page->page_type would also be
cleared in the free process, meaning the free behavior wouldn't change,
but that’s not actually the case. I need to look into what impact it
would have if __ClearPageBuddy is also executed in the free process.   


Thanks,
Ye Liu


