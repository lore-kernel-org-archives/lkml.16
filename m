Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3131A01B0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745311810; cv=none; b=CAkzx8mC8SFpXQ+M2YC6V2MHjUO8laml6ureT5A3gOkbgr72LLXd6Ik2JzOsQtFj5vf8FvrMcgjFzuCh8oUpOUe1rHPUU8ntrv0ruY+JWwHCkQ2hIR7CD0m/8zXb8lXcis5kk3SuBuf4pmhRXlZk1CLjFdpKjqM8fH0flEaM1cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745311810; c=relaxed/simple;
	bh=mQMv0280S9fiv6yWeg6+QdliY/NMtzBceavxZCtVgPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TbcFo2q/+l1IVcL0r5nVe8z1zPF5z+wEn6aoK8wz58iDqWfvpNSUkZ+kMVDdQP5/PFQ+QlVBME+owEUiqA3VlMjQIxkV6SrOAYcXFQwiyUgoYu0xb7v60kQUgEXIOQWTXqqGgPCpJHv42JkyKUH3pp9JXh/YKFKNAIeouSXZ34I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QF2Tjqoo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QF2Tjqoo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745311808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=z0fcTSDbZFobMICkC0Dhe3mC0DwS7Ydit7B1nvC9kvY=;
	b=QF2TjqooDPYmYVVSymjAu8TSMlOgmcnl7WOwTfKJZxw1QoyWTtHf8nIhwHfVe8GZdURizC
	vz8H7YfcuOsUGrFwXW/IOppWiR3HGbQJz1kmySMalMH2LcNdsWQmyswEpArbu4kz7VaZo/
	zID3kFLfyXlndL24G/1Vv9+U70fX2Jk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-GBT95PQqM9S0JecYOD1t7w-1; Tue, 22 Apr 2025 04:50:06 -0400
X-MC-Unique: GBT95PQqM9S0JecYOD1t7w-1
X-Mimecast-MFC-AGG-ID: GBT95PQqM9S0JecYOD1t7w_1745311805
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43efa869b0aso31427175e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 01:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745311805; x=1745916605;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z0fcTSDbZFobMICkC0Dhe3mC0DwS7Ydit7B1nvC9kvY=;
        b=lefmtzKT84939qAroah8FYQV0+WvsXWAhAkRWQwDQhS+khhAi1bTU8Yz0MVfVcxFM2
         7pUazVeUE2wUdxr/Y3GWtZMnHi2TePom7yxS/bGj0cmmvQCJkB6dvMM2usxVeYsFwwAK
         G0ICp1RAuF1nBXMIEntYitYKbO5rFBkWcW7uLe5lycVstl3S4143AYzIXRuLEj42v+yY
         4ju+2X0vXp3gLMmsU1t6s3A7T5cdnzz/sGmCUxmH1Uq6E1JeyXkDWpujTsj/CqTyQlsk
         EiUq2/14fiUs82GhsVkZAP5BqvsdydS3nW+XbxFLdmXLzeANyyMrDtQUITx1QSyt83UE
         /+4A==
X-Forwarded-Encrypted: i=1; AJvYcCUDCAF76bsCNku3xmNFwDyyHCYXln2cZ2WELZbjBiHHBVADfRqnM8I80FnEmzBgwhzvRc4DYdqs/XAht5c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYc4uAsBE18hSVc0EZ54SwJT/UCKXMJ8WkHd0G1AOLspPRR+aR
	haCJsbagTx2aFDBCBYeAGmTAayYzBbb6APzP6evTURIjkjY3honvloBY5CdUHUAGWUQIk3f2Rzm
	fROJnYy5mzJ9quvzTWnfoC3MULMRqb5IsayHqWQvBL7dqFOVSMTZe36NFyGh8mQ==
X-Gm-Gg: ASbGncsb2k5M+7Vupnf6jPkvSXUK570+YGSiyFnAvDmpCjwdgzSJzJy8whFmQIEAGm6
	N9OKzYH3/E8ywpFzJplDt0r4+jMOweMMCdF80SE2CylN3IxHp5T7BzO+6kkvymmyJZfmxT3EQUQ
	QsEKMc2TH5VQbCehTxnHm6nIT8pABxj+23q6E1JoWsmeynXWeDEXsi8n7HIrqV/HqhRgthKknyg
	NeAr1C9K62aDC7IiimjPj1meJaK1AN9Cx1qBzk21Czy8ovcrwB6TSZz3vgFBzUJn9uHwoE7Gpwq
	ZFnqq8XsIP8zVrJd3vqvMIx+WC58Jj1s2D4FyytaB72r7jo/nuZA9Hiqrwn0RnqKC6XEUTnNpV3
	kB+D0h3joLV19JbAXs1yq37gh9TXSqT7BM3+7
X-Received: by 2002:a05:600c:1e0a:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-4406abfba46mr120321205e9.20.1745311805242;
        Tue, 22 Apr 2025 01:50:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECr66G2BVj6iMCdSW6EqVysasyZkIUlqhuAbaMtOvHNydc9OHzsoJRl5icUzYIKQjhjTTlZg==
X-Received: by 2002:a05:600c:1e0a:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-4406abfba46mr120320865e9.20.1745311804859;
        Tue, 22 Apr 2025 01:50:04 -0700 (PDT)
Received: from ?IPV6:2003:cb:c731:8700:3969:7786:322:9641? (p200300cbc73187003969778603229641.dip0.t-ipconnect.de. [2003:cb:c731:8700:3969:7786:322:9641])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5bbc07sm167240545e9.17.2025.04.22.01.50.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 01:50:04 -0700 (PDT)
Message-ID: <31ed0cc4-89a3-4f92-a611-06322c5d248b@redhat.com>
Date: Tue, 22 Apr 2025 10:50:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] khugepaged: Refactor
 trace_mm_khugepaged_scan_pmd() to take folio instead of page
To: Yang Shi <yang@os.amperecomputing.com>, nifan.cxl@gmail.com,
 rostedt@goodmis.org, mhiramat@kernel.org, willy@infradead.org
Cc: akpm@linux-foundation.org, fan.ni@samsung.com,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-mm@kvack.org, npache@redhat.com, mcgrof@kernel.org,
 a.manzanares@samsung.com, dave@stgolabs.net
References: <20250418183920.273154-1-nifan.cxl@gmail.com>
 <20250418183920.273154-2-nifan.cxl@gmail.com>
 <d987a374-c83b-4067-9d47-62f3b758c8d3@os.amperecomputing.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <d987a374-c83b-4067-9d47-62f3b758c8d3@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.04.25 00:40, Yang Shi wrote:
> 
> 
> On 4/18/25 11:34 AM, nifan.cxl@gmail.com wrote:
>> From: Fan Ni <fan.ni@samsung.com>
>>
>> trace_mm_khugepaged_scan_pmd() is only called in
>> hpage_collapse_scan_pmd(), where the head page of a folio is passed in,
>> so refactor it to take folio directly.
>>
>> Signed-off-by: Fan Ni <fan.ni@samsung.com>
>> ---
>> This is a new patch added to the series.
> 
> The change looks good to me. Reviewed-by: Yang Shi
> <yang@os.amperecomputing.com>
> 
> But I think the two patches can be squashed into one patch.

Agreed, something like

"khugepaged: pass folio instead of head page to trace events"

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

