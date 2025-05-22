Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775D1221D9B
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 06:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747897147; cv=none; b=Oukxczo+bYc5ju97VDV4x6XsxSVXbzI71X96s0DKgJs4f/VPn0P/nsx1OIGZEPEC7N858t0wa/PApmGKs6bTmOoOxjnCBJH8p+Q9RVR0+Cok5ZgwPGaoeWbY6LS9nzl7vIPyimuX0OdabOkC1ujlfQmyQ/gKU+24nixZXJPMETI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747897147; c=relaxed/simple;
	bh=hEdJFkIO3gkYUCi5+RF2B0lQFqmJC8q8XaO56pIBmIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lpB0dkpPVmT4vER9NFgNh66xDmPoouundS6VcQIMBB2CVm/D4yW6l4V1BaEPGaeib3x7vHy7esaIX6N/GheyXVFdlBtkLTNdpJiQLhMuzuZv/R4Ioo+8aiVc8o6E4+QNP4docQq+m2QjMpUF6wfCFDeqbnH554YuiY8ej7hf0P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=SCp9qdHP; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="SCp9qdHP"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2322bace4ceso41170315ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 23:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747897144; x=1748501944; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4LjFz6mOQNEL7zonDklRPi1DtpqOZPfCamZxqL1Q0c=;
        b=SCp9qdHPVi74ClZvLPhcx2IPz+xvcQdFSbkbn1KdIndwhkm7uq7W8zz66fkj6iO+Nv
         FmPDeuFpRdDZLeKRD4KrwQERS3pPBQNzlp5JzSNx9BmzLSEM2GcOVZaSAijpqQWRNgh4
         OrMWg5TwVmsaMCZd9vxAUp6ShUpBX4l+7ezbjpjkUGscnOXRo9nXiMWyTLz9inS2oUmm
         XzDa4fF+rhN8kzAAwoFw7o3KRduAOmUWuOqWor+M1ASDOfXsKe4dmHvl5zY9+qMbKV9M
         Ew56qLHiim39W0AV5kn1P680KzFGwoHpBv4RXaNhB8bdLwH9QbOBPeuVM1wiKlZnUtL+
         N1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747897144; x=1748501944;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S4LjFz6mOQNEL7zonDklRPi1DtpqOZPfCamZxqL1Q0c=;
        b=UHKSDc/lW2pIJmP2GULWFxHZW/tSIvcdp9KCkJBLSU4rTqvJhdzaWUvmFuVOs6YyI6
         YYI6zEXr5pflTrEFP+Yw4gXNVYcTKAwYS5eMj8i2OrPtSZdHorfo2FEsIWgsIor2Rktc
         1MbDTIuTbJRtzp7hiWeVX0hUEL6Jq9Sy/s7eh2sr00p60txRKeW40cAR84YbhY8JwFVa
         RP+KTEFw3KwLwRCRMrhiTPeZYx6SPnOSQbnfBQ7v4yHG4YdrbFBS3cs1fkFfsHL6vC+U
         5a2jCIvVT8Bwyjxswc4i18aNB39ZZomjOM6WF2BbKcWsG4wwIggb2ursKnY+jlm3MAdk
         FXxw==
X-Forwarded-Encrypted: i=1; AJvYcCUq+ex6gCyZHHbEhehaMrfaIo3QT003j2Tgb2tf6PsHrGpQkU2qXf2sscdKqjqFZhenisI2DIx410pGlN8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym0NEgEqWJGdgDnw+U+jVvmScR21hTGRwqzBZNYsBrUcKid6+t
	p6o0snaiarIov7FjCHoklYacKa02x3nb/p6qj3M7Cnqp+6MghaORdRtUQYGa6C/AMwE=
X-Gm-Gg: ASbGncvwj9bJxD/nmKbcf9K03lUWWEEgxCEtlPN94O1NlbVaFBEqkWxx1kiJIs6J+eh
	YWdDWVfRwzYOjbJp7v++0mv7Kd7/rxO8NqeeevpabKKX9win9xQi1v7uoUY9D6VBH/IYvX7lAxL
	lrB0ohk6j0v8joC3N1mD6ogsO2SUymeJxQPWzbLkOJr8/3dUvRIdVwq+HwHpO75O1zKw4krYwd8
	o2wpwbIx2VdBiBYgPQOD64962cSEjNZjSmo+QXp8/baI2RQgx56kUg6KDOs3Fx5YZ8M6XOY5H36
	qMnm/RMx2lermcS4njlwiNMEkF/8TXHQz0Hju3MYmG5VSPeG7GHsybWjFy1NQ0UlZtmo8DP/560
	=
X-Google-Smtp-Source: AGHT+IGp1JwsZ8Ui4zlhII3RRPZ52m9mG0aZy1A/wKlXOSBG5FU1K00VJkoLeuCiJsLgcvYVGZMmxw==
X-Received: by 2002:a17:903:1ca:b0:223:2630:6b82 with SMTP id d9443c01a7336-231d43899c1mr346475295ad.10.1747897144452;
        Wed, 21 May 2025 23:59:04 -0700 (PDT)
Received: from [10.68.122.90] ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb0d4sm102734715ad.195.2025.05.21.23.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 23:59:03 -0700 (PDT)
Message-ID: <53518ee0-d5fc-472e-bd67-0be5208b5b77@bytedance.com>
Date: Thu, 22 May 2025 14:58:57 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: fix potential NULL pointer dereference in
 pagetable_alloc_noprof
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Ye Chey <yechey@ai-sast.com>
Cc: akpm@linux-foundation.org, david@redhat.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250521124008.36139-1-yechey@ai-sast.com>
 <206c6dc2-792b-4c73-a922-eebd03864d2c@lucifer.local>
 <257c094c-522c-48c8-9bc2-70571dfb276f@lucifer.local>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <257c094c-522c-48c8-9bc2-70571dfb276f@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/21/25 8:48 PM, Lorenzo Stoakes wrote:
> +cc mailing lists
> 
> Please ensure you always cc these when submitting patches by the way :)
> 
> On Wed, May 21, 2025 at 01:46:48PM +0100, Lorenzo Stoakes wrote:
>> On Wed, May 21, 2025 at 08:40:08PM +0800, Ye Chey wrote:
>>> The pagetable_alloc_noprof function does not check the return value of
>>> alloc_pages_noprof, which could lead to a NULL pointer dereference when
>>> memory allocation fails. Add a NULL check to prevent this issue.
>>>
>>> Signed-off-by: Ye Chey <yechey@ai-sast.com>
>>> ---
>>>   include/linux/mm.h | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>>> index bf5520693..9052bb531 100644
>>> --- a/include/linux/mm.h
>>> +++ b/include/linux/mm.h
>>> @@ -3000,7 +3000,8 @@ static inline bool pagetable_is_reserved(struct ptdesc *pt)
>>>   static inline struct ptdesc *pagetable_alloc_noprof(gfp_t gfp, unsigned int order)
>>>   {
>>>   	struct page *page = alloc_pages_noprof(gfp | __GFP_COMP, order);
>>> -
>>> +	if (!page)
>>> +		return NULL;
>>>   	return page_ptdesc(page);
>>
>> Doesn't page_ptdesc() just cast the page to the appropriate type? And thus can
>> handle it being NULL?

Right, no NULL check is needed here.

>>
>>>   }
>>>   #define pagetable_alloc(...)	alloc_hooks(pagetable_alloc_noprof(__VA_ARGS__))
>>> --
>>> 2.44.0
>>>

