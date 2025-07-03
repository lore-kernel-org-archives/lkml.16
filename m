Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0825A298CB7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751531384; cv=none; b=c5XnxWp7NgXAKm+fKozJW/TYykAdHoWfeAiEzKa8kaFrZS+V3AdFDqcBmNFnOb88Yx8igGg2A4wdDDoOiWUl7cqrxAzGCVUvQCM3bVrP51dlt8ZkC3eipYbiIN5ZOh/y3gS/7LL6MYJ5on5komW3fqdSMeI/4rOFwQzkFia2V5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751531384; c=relaxed/simple;
	bh=JmFTr4VG2yzIn+6cqotg3dpPO5cEw0/ijns6BC8xnpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BkUDRPOUSZVzcgkwQN4ppCaOgSqgpohUBjgRmnVStRpMiCM91oZdhK/of8joK6zSw+1MkaNyqoAjgd7jkPlhYE96NXBViwTWUQjB4EXyENUzPErt1TQmfOyy4NuruZ7qOrboMnW+8iGVMc8t1UM+CZXdLKGgaEKoi9uqLLH4I8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eFXGnCa0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eFXGnCa0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751531382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Ao7iXo6bPr/lMtF2Dn4u+FVUcO1qO3WglYeGUpi07GA=;
	b=eFXGnCa04wNomChCFDCUkL13zzN9VrFpfAJkyrAX4YysAAOwyXfkoyEbd4aw5dnUU5Cp8S
	wHjTg48mN5k3UJk0WqJrV+tBvl6EbrQG1aiwuuU9zL9iK/C09isO7VtV9SYzL1jqvpV8HD
	ju++0xcFlLiBLdGLd4+WXd0UvFmSodg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-hV2OiQpEMGyfhROtyT5JEA-1; Thu, 03 Jul 2025 04:29:40 -0400
X-MC-Unique: hV2OiQpEMGyfhROtyT5JEA-1
X-Mimecast-MFC-AGG-ID: hV2OiQpEMGyfhROtyT5JEA_1751531379
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ade81d27cddso751241466b.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 01:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751531379; x=1752136179;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ao7iXo6bPr/lMtF2Dn4u+FVUcO1qO3WglYeGUpi07GA=;
        b=Odk8pQnRFbkGk93CwicRfbwN7/p8+7dMt+jNamCeep54PXJqofTjW5ZK4fctTpX/wA
         oFd0Xz64HEwEPjhrINin1IEo3a/Mc3RJvSvFXWUzw/PX71J7LuSHLvNAEbMkEpR7uM6b
         YOFQWq+LzyPiCoWFzLCf0ChAIaa/U/eS8jZmzfkeLc/J2ZkYQTLQh0SCGfN2P8e4JZJt
         umSJxoofIre7hpyTzFX/yFFzvvOkTeEs9PeCj6W4zw52mrKVVsFy5y1hl66HcT1y6EAY
         5rqlJ0qwrRLzESDj2rhNiGKnrFyr2umMeeprx+HndqOg3AdkQOf8OExnyCiABUMBerLK
         eIFA==
X-Forwarded-Encrypted: i=1; AJvYcCWE2hMmRbYIc65EkYze+OF4P7Rm1DzHlbj4U2qK7mK1Xs4IBRJ+M1yEjzBeWeAXgzC+dJJeifYbaJ5e6cI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy72o2n8YNyJysXylJcepheRS5oAPLFJaAGRVxrY9nb1z0neIU9
	8ez62AjZ1HLAD6dfewv4LAZ6YGqNBVa69a6hTewKoCdkmoLiUkedbI9y6b3IN9nkIXcSW4aRDoX
	smI0sD8gv/PzxIs6v0KBj+HxBGAng33FTO598uBBQY7M4LOtPg0uVkUA5UrUDCpksjQ==
X-Gm-Gg: ASbGncuZZWuSANqRbxWeoNdvCkbODCw8vH1D8Z5zM+p74pg2f1tVx3Xg6ht2IakMBLo
	akxUznbBi9PqIHOp1QbYThJta40vhBaxmg6k9ePSMh3KGkT5Y8FlayWhWHn7tJwyX2kgLwjLEsA
	Bn8vUxETWbwJ7m8izrLlLyhJyCpmN25qFjUpvqb48Jg6aAG+/xV0FMu68iEZPBntWAwLwbSXayN
	EZUC3HLhjXvDUrdv5yducFJkgkGacqFkw9OXQLwe5Ik/vvJ04SKXoREHEMxP5Ug/2fNzzd7eKMr
	FoFpO+/pUMcr4T+UbxKcfAjW73HETKroETNXKOYBIUTq
X-Received: by 2002:a17:906:ee89:b0:add:ede0:b9d4 with SMTP id a640c23a62f3a-ae3d7dec8c4mr211838266b.0.1751531379339;
        Thu, 03 Jul 2025 01:29:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQR9Sq+kwX+EgrNsiJGUPRsQvrn7rKaEleIhOhduYW9+Qa0jv7W//ZA8gBY3JGvvrmcUIaZQ==
X-Received: by 2002:a17:906:ee89:b0:add:ede0:b9d4 with SMTP id a640c23a62f3a-ae3d7dec8c4mr211834566b.0.1751531378784;
        Thu, 03 Jul 2025 01:29:38 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6beb8sm1226408166b.132.2025.07.03.01.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 01:29:38 -0700 (PDT)
Message-ID: <897dbcbf-d98e-4177-9d38-3d179c7d560b@redhat.com>
Date: Thu, 3 Jul 2025 10:29:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] selftests/mm: Fix child process exit codes in
 ksm_functional_tests
To: Aboorva Devarajan <aboorvad@linux.ibm.com>, akpm@linux-foundation.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, shuah@kernel.org,
 pfalcato@suse.de, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, donettom@linux.ibm.com, ritesh.list@gmail.com
References: <20250703060656.54345-1-aboorvad@linux.ibm.com>
 <20250703060656.54345-6-aboorvad@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250703060656.54345-6-aboorvad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.07.25 08:06, Aboorva Devarajan wrote:
> In ksm_functional_tests, test_child_ksm() returned negative values
> to indicate errors. However, when passed to exit(), these were
> interpreted as large unsigned values (e.g, -2 became 254), leading to
> incorrect handling in the parent process. As a result, some tests
> appeared to be skipped or silently failed.
> 
> This patch changes test_child_ksm() to return positive error codes
> (1, 2, 3) and updates test_child_ksm_err() to interpret them correctly.
> This ensures the parent accurately detects and reports child process
> failures.
> 
> --------------
> Before patch:
> --------------
> - [RUN] test_unmerge
> ok 1 Pages were unmerged
> ...
> - [RUN] test_prctl_fork
> - No pages got merged
> - [RUN] test_prctl_fork_exec
> ok 7 PR_SET_MEMORY_MERGE value is inherited
> ...
> Bail out! 1 out of 8 tests failed
> - Planned tests != run tests (9 != 8)
> - Totals: pass:7 fail:1 xfail:0 xpass:0 skip:0 error:0
> 
> --------------
> After patch:
> --------------
> - [RUN] test_unmerge
> ok 1 Pages were unmerged
> ...
> - [RUN] test_prctl_fork
> - No pages got merged
> not ok 7 Merge in child failed
> - [RUN] test_prctl_fork_exec
> ok 8 PR_SET_MEMORY_MERGE value is inherited
> ...
> Bail out! 2 out of 9 tests failed
> - Totals: pass:7 fail:2 xfail:0 xpass:0 skip:0 error:0
> 
> Fixes: 6c47de3be3a0 ("selftest/mm: ksm_functional_tests: extend test case for ksm fork/exec")
> Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>

Surprising, but seems to be the right thing to do.

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

