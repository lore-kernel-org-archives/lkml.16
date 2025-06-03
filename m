Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF2322F767
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 16:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748967966; cv=none; b=kwp4kEuXIiuk9l/8xzBP5ep04TXm+ywTxP+P1sfsPb896KgaBQRfGWDJ9gsdJgDkMvc/FkNBbsKdNGdOtG6GyCQ19+QUkoPBvBCqJe+jO5AijBaAIPPuj0xJu/lClQX96URi1OyXgSuOar8q3YVc2Fqc4PkmM4AXfJKnTnX47aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748967966; c=relaxed/simple;
	bh=qYUkchjTxE1MzQV5k1KofmSbFrtEMfwqFdzUPzbBrHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=axawRLPGDsj8K7/WyFy6KkLuZcD2m1682TUfQ0936Kx3TlXRfzfliPKTF1OCbJ3AEtK2lNnv9oAQ2++EKtkOST+5F1eAlfFBW7AuMvi1LT1nmbhwx7IuPzhfXJthcyU/GiKnqkqp9FdJ++zoaK78sKIdvc4rRFmuRWZbHmDp6GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GFmL4mso; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GFmL4mso"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748967963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=I0elFj4iCpU3Q37dfy3qczDfEot5ZH9J+BNq48Sc/WI=;
	b=GFmL4msoxVK/CJH6HWad2peOeRp055fW64AGnSqcWG56avuF19Rh7X+9swpDOjiL4vh+nh
	txizmHf9/ICAp73mppGTCtAIkCcHGyNMAqFlT77zyYCdzBKwIGPhW1YTorUo4KyGFI98bd
	b40EZgA6H4R9YnE9K3eIrMRcG5LuG9o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502--q-VAWbyPOubWzhB3Fx46g-1; Tue, 03 Jun 2025 12:26:02 -0400
X-MC-Unique: -q-VAWbyPOubWzhB3Fx46g-1
X-Mimecast-MFC-AGG-ID: -q-VAWbyPOubWzhB3Fx46g_1748967961
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f858bc5eso2915244f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 09:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748967961; x=1749572761;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I0elFj4iCpU3Q37dfy3qczDfEot5ZH9J+BNq48Sc/WI=;
        b=NXdYMnwc9gLuoimSquwdxz6C5dtus7zJ905aQe+n8+ympaS04LGIMkpYCFuxrmk0bq
         al7Oe9mrEa2XqG8kBG3AgMyehsB3yFB/GEL7ro7/AdS/7ZVbqklCn8DwyHnGBn41wXOd
         H1l/IeBxmxpDhC8iYb2MhcocS+vRC2xlH2eaf71quMWBJZplTNVufRvvI6V2nVS9g47o
         xO3/64hJsxv0hTxCYrlM2sMtjKWR8c4mpD/wIjBCBETfOHDmwW0pT5k6xCzDQIcZ3pLG
         BmCKxh1hFibBjep6va19rl0BCqKucmX0hMnGeKJfS9XzwXNFpuaNuwEJhWknuk38YLhb
         uS1g==
X-Forwarded-Encrypted: i=1; AJvYcCU998gvjs24FAJtiRUwf2r/MlrG8KCQ31uewPi+P4BMJ7Wh/bcF+88nzwcIZrtXX++new6qsoJG2vKJepE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB+S3pKrnmrU5Pl0pcGJoZDIjlYYz7scSZ96Sd7cFr3pfWDGmH
	rRh4F01PjOMxMdwsdkCMoa9D+Wq7oVSR+fZr1VK4NZU5l4oo8V4AfLpbh2Er+rcSc6FMWPBGCfx
	AvLt6XOJ1PPvJs22ZzgfzE4Od3bbQzj/6e01f3hXa7FFGN0nJD6fzgAeGWtIvsFmfVw==
X-Gm-Gg: ASbGnctDfLvG3vPJp0I4DayZhSXAdgAQDnpDjZKIKwPq20hZzUs1dbJxJSyrldXg4l0
	KimRLI+I2WZJyAyKmu3ryvrhV/LunNe8c32CDmVyMVHLTmJzc3Bc4vKOk1tyrs8STKSrd/xAJiR
	cPJAXUz87XHTJv4eVYLpiyNq70N7uXK/IeybxplkRytc92bNPIOPzeWyIlJiCVEXRBB8K+sv9iT
	/wvLNUfhgv4YJvwlLd2LUmlh7rnANuOngv4lNb4U65/w0UQHLXi+mnAxGABEJ3LhNWIsyDqwBGv
	FgCppkLWecbfMctpVXFMSoGxutE6q38uILYTJ0w+YMxsKw6f9PI2xo9HWz9iB0R9jnyYu6RbW0c
	sG7a/+sf0y7UgKx51fiIVUiQCkspx39AsxuJITkLNkDmXcpqYHA==
X-Received: by 2002:a5d:5f47:0:b0:3a3:7749:9783 with SMTP id ffacd0b85a97d-3a4fe3a6c35mr10417208f8f.51.1748967960847;
        Tue, 03 Jun 2025 09:26:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvQhQSejc4TxEAgYHYCI3h3d2YF9MKT2tL4RJ+lf40ORcTkjO3BavM3f1f2E8GMn64ILzM3g==
X-Received: by 2002:a5d:5f47:0:b0:3a3:7749:9783 with SMTP id ffacd0b85a97d-3a4fe3a6c35mr10417186f8f.51.1748967960393;
        Tue, 03 Jun 2025 09:26:00 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0d:f000:eec9:2b8d:4913:f32a? (p200300d82f0df000eec92b8d4913f32a.dip0.t-ipconnect.de. [2003:d8:2f0d:f000:eec9:2b8d:4913:f32a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009fd9bsm18456031f8f.82.2025.06.03.09.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 09:25:59 -0700 (PDT)
Message-ID: <d7cbbab2-8fe0-4a10-8b06-e47da955865e@redhat.com>
Date: Tue, 3 Jun 2025 18:25:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] kdump: wait for DMA to finish when using CMA
To: Jiri Bohac <jbohac@suse.cz>
Cc: Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org,
 Philipp Rudo <prudo@redhat.com>, Donald Dutile <ddutile@redhat.com>,
 Pingfan Liu <piliu@redhat.com>, Tao Liu <ltao@redhat.com>,
 linux-kernel@vger.kernel.org, David Hildenbrand <dhildenb@redhat.com>,
 Michal Hocko <mhocko@suse.cz>
References: <aDoT08LfXUEkS9E4@dwarf.suse.cz> <aDoVO4H4CpXPjAdI@dwarf.suse.cz>
 <da52a835-6a4b-4f11-acac-f4ef995da7e1@redhat.com>
 <aD8b7Q8Z9sC8meGU@dwarf.suse.cz>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aD8b7Q8Z9sC8meGU@dwarf.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.06.25 17:59, Jiri Bohac wrote:
> On Tue, Jun 03, 2025 at 03:15:03PM +0200, David Hildenbrand wrote:
>> On 30.05.25 22:29, Jiri Bohac wrote:
>>> When re-using the CMA area for kdump there is a risk of pending DMA into
>>> pinned user pages in the CMA area.
>>>
>>> Pages that are pinned long-term are migrated away from CMA, so these are
>>> not a concern. Pages pinned without FOLL_LONGTERM remain in the CMA and may
>>> possibly be the source or destination of a pending DMA transfer.
>>
>> I'll note that we right now do have an upstream BUG where that is sometimes
>> not the case. I mentioned it previously that such bugs will be a problem :(
>>
>> https://lkml.kernel.org/r/20250523023709epcms1p236d4f55b79adb9366ec1cf6d5792b06b@epcms1p2
> 
> I'll just reitarate the whole purpose of this patchset, as
> added to Documentation:

I know, but stating "these are not a concern", when they are currently a 
concern upstream is a bit suboptimal. :)

I'd phrase it more like "Pages residing in CMA areas can usually not get 
long-term pinned, so long-term pinning is typically not a concern. BUGs 
in the kernel might still lead to long-term pinning of such pages if 
everything goes wrong."

Or sth like that.

>>> +static void crash_cma_clear_pending_dma(void)
>>> +{
>>> +	unsigned int s = cma_dma_timeout_sec;
>>> +
>>> +	if (!crashk_cma_cnt)
>>> +		return;
>>> +
>>> +	while (s--)
>>> +		mdelay(1000);
>>
>> Any reason we cannot do it in a single mdelay() invocation?
>>
>> mdelay() already is a loop around udelay on larger values IIUC.
> 
> No good reasons ;)
> I just wanted to prevent a totally theoretical overflow (if cma_dma_timeout_sec was made configurable;
> I also anticipated someone might want to add some progress printks into the cycle (without verifying if
> that's even possible in this context).
> 
> If you want, I have no problem changing this to:
> +	mdelay(cma_dma_timeout_sec * 1000);

Probably good enough. Or just hard-code 10s and call it a day. :)

-- 
Cheers,

David / dhildenb

