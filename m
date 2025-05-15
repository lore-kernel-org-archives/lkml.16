Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AE2132122
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 14:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747318242; cv=none; b=bToRFlDO6BuOkA3IHLR7uP8uYod8yn9di7uXQ1CJaTblb4xZckDD9w3iO0Jy5lSAwfUWhPhsu4g4KICaE7IeT5DblAH4Jf/4HOhS2UGdFaySqfyJsw/fobL30hyjzdbqD/JPgq6InYVsnOZEESCX2Pxhq31TZxLmqJ7I+psqEeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747318242; c=relaxed/simple;
	bh=YcCSvt/pONiW6TTscpWY0T3LRgxgCdrzCwLfiodKQaY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=L3f4uIGaMATl6IGu7ecP/+AOgkv/fn9QgjE6v+CvpLaMHd4bhOXddzp8DXjXoWZXYnC+7w0+T7KFEhgljV1cOpnGvJGg69Fpn5f3x9L0cx3bdwYFx+FdHU9mIi5JnrPdvxEmNnMQckotXYwbdC1I7D0IHAgLfroRu2AaUx7vz/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=au5NjYeY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="au5NjYeY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747318239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+lcYxqOygs7CrsNUkbbofsVji7C7nAqeA5usDI/rqf4=;
	b=au5NjYeYyrVgXl3ZceOBcjxglw1csP3JuDyF+VRHn0Ij/wmyYn/OEB2z7KDby+aI68Vfxy
	E3adK5FNL2RPHJwNjl0tRjOusSeb01PgXB7mTyuzKVZRANV/izMP8gI4BBr8NedgXHSk9l
	JN+RSj4eOEGtfG97sJzchDwYIKqBRbQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-FMJVd1EBMSaj_qtWSMXP6w-1; Thu, 15 May 2025 10:10:38 -0400
X-MC-Unique: FMJVd1EBMSaj_qtWSMXP6w-1
X-Mimecast-MFC-AGG-ID: FMJVd1EBMSaj_qtWSMXP6w_1747318237
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43ce8f82e66so5078565e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:10:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747318237; x=1747923037;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+lcYxqOygs7CrsNUkbbofsVji7C7nAqeA5usDI/rqf4=;
        b=w7eC0HPomC4LhOC71l5tfVCb2FOSnS4nh50xh1Q7MimDvBMPkz+5dThs1p/ZNi096M
         jeGmr/CQWDZOM0cc2s6WKxgpljrVU96sv2tuV0CTJuOsnSl4CC8DgsA1/cdIatIHwGgY
         WAJmmV8DxVH+IafPZBqNpAEjtqN0RixOfpLfaCN+um1V0+iZB+b44oVcImlSka+ORvc5
         +OvGOBMysTAoINM0GaaoUvNlnhlAnGCUabfg3CFxN7/XuvlKpVmrTmDYs/VTzUvhZhMM
         TqnIuWOapeJPXj1e1kaLWYxVmpPT2djo48fb0QKo2n12P3oUS5wv3i8Uai04di7rLtmQ
         pRSw==
X-Forwarded-Encrypted: i=1; AJvYcCWxWPBI43IN+Rqq3dKL5SMi8PJDcD3RwQgDLzF5kHk0eEMllWiiM79d/2qNGERCGaWviJeX6jUJewz3v6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQLTXqUZYGC6hrqzYSVREsuKmLGNPpK1c8W1O7hchZDMLBoSbz
	qGl/HVHmGRlO24jN1osbZZo+hgpfxHsiaKMl3yOu038yqrYG9j2q9uSDFVRot+wrOgzPawFI7Vc
	a8EKUUSW1CgNPLIdCJrQt41b0V5wjYeb/VR/z8vXfDcBOVExgw0t9rA/2AByF3w==
X-Gm-Gg: ASbGncujEe4SJI2RfcwrjZcnGmKdiSiBAEWi9CiEuBa7FPLpfCp8g7ThaQRiITe1FbX
	sM7Qi1DQ/JgDVQixnTbDbDKGTZ0dF0a5LjiXEojVyDOrruabU69LpcdW4KoWiheaI9w0WmKNlPE
	ETUQLRV69KrXyrk3UWv1wE81+4xTqSMIWu6Wf/5X5LAX5GuV47AxK2OISfwhXb6TYj7fYSD2n2G
	CQBtI+aJiUqwBlf6OmegXnMgdAY0/RMjx69ivdAkSap+ZIdXXg+NpI6Es+hv9R5QytmH5rorCt5
	I5zNuBssp6heEDJj1tpKd8vXlnLfT7sS8nnt6eqClJbwGBVpvAonHfJjBWhP4IEt5bTyLYvxhKE
	+tLoyO7d/sqRIzerp0ZmUwe1HgHjsXFizMz1ela8=
X-Received: by 2002:a05:600c:a378:b0:43c:f050:fed3 with SMTP id 5b1f17b1804b1-442f20d9d37mr71948405e9.11.1747318237208;
        Thu, 15 May 2025 07:10:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAAk6HBarDrhds/XnLscSfSUgJMlH8mkC/3Viy6Za4wwJO/FV/AHxO4WRJqQ2pQFZ1DlGaMw==
X-Received: by 2002:a05:600c:a378:b0:43c:f050:fed3 with SMTP id 5b1f17b1804b1-442f20d9d37mr71947325e9.11.1747318236560;
        Thu, 15 May 2025 07:10:36 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4a:8900:884a:b3af:e3c9:ec88? (p200300d82f4a8900884ab3afe3c9ec88.dip0.t-ipconnect.de. [2003:d8:2f4a:8900:884a:b3af:e3c9:ec88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f33691bbsm74868695e9.7.2025.05.15.07.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 07:10:35 -0700 (PDT)
Message-ID: <4ff30707-99ea-472a-9f16-517f52d7729a@redhat.com>
Date: Thu, 15 May 2025 16:10:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] x86/mm/pat: remove MEMTYPE_*_MATCH
From: David Hildenbrand <david@redhat.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org, Dave Hansen
 <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>,
 Ingo Molnar <mingo@kernel.org>
References: <20250512123424.637989-1-david@redhat.com>
 <20250512123424.637989-9-david@redhat.com>
 <f2bxgy5tmb3cpk457lay3hl4wejj5dvttswnvzi2uudxtkkbsm@ktcytlgv64nn>
 <18d502c8-7bbe-470e-863c-7c2f42ea2487@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <18d502c8-7bbe-470e-863c-7c2f42ea2487@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.05.25 19:53, David Hildenbrand wrote:
> On 13.05.25 19:48, Liam R. Howlett wrote:
>> * David Hildenbrand <david@redhat.com> [250512 08:34]:
>>> The "memramp() shrinking" scenario no longer applies, so let's remove
>>> that now-unnecessary handling.
>>>
>>> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>> Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>
>> small comment, but this looks good.
>>
>> Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>
> 
> Thanks!
> 
>>
>>> ---
>>>    arch/x86/mm/pat/memtype_interval.c | 44 ++++--------------------------
>>>    1 file changed, 6 insertions(+), 38 deletions(-)
>>>
>>> diff --git a/arch/x86/mm/pat/memtype_interval.c b/arch/x86/mm/pat/memtype_interval.c
>>> index 645613d59942a..9d03f0dbc4715 100644
>>> --- a/arch/x86/mm/pat/memtype_interval.c
>>> +++ b/arch/x86/mm/pat/memtype_interval.c
>>> @@ -49,26 +49,15 @@ INTERVAL_TREE_DEFINE(struct memtype, rb, u64, subtree_max_end,
>>>    
>>>    static struct rb_root_cached memtype_rbroot = RB_ROOT_CACHED;
>>>    
>>> -enum {
>>> -	MEMTYPE_EXACT_MATCH	= 0,
>>> -	MEMTYPE_END_MATCH	= 1
>>> -};
>>> -
>>> -static struct memtype *memtype_match(u64 start, u64 end, int match_type)
>>> +static struct memtype *memtype_match(u64 start, u64 end)
>>>    {
>>>    	struct memtype *entry_match;
>>>    
>>>    	entry_match = interval_iter_first(&memtype_rbroot, start, end-1);
>>>    
>>>    	while (entry_match != NULL && entry_match->start < end) {
>>
>> I think this could use interval_tree_for_each_span() instead.
> 
> Fancy, let me look at this. Probably I'll send another patch on top of
> this series to do that conversion. (as you found, patch #9 moves that code)

Hmmm, I think interval_tree_for_each_span() does not apply here.

Unless I am missing something important, interval_tree_for_each_span() 
does not work in combination with INTERVAL_TREE_DEFINE where we want to 
use a custom type as tree nodes (-> struct memtype).

interval_tree_for_each_span() only works with the basic "struct 
interval_tree_node" implementation ... which is probably also why there 
are only a handful (3) of interval_tree_for_each_span() users, all in 
iommufd context?

But staring at interval_tree.h vs. interval_tree_generic.h, I am a bit 
confused ...

-- 
Cheers,

David / dhildenb

