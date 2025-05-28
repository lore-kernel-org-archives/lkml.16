Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCC427A448
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748436483; cv=none; b=WYzDIiRhoHVxTt/ryrqwEp1//2koCbQkHuNbq6PeR1ZOyrEiRfMnY21e2IZuphQhgC1x0P/Ye9QqTYw4qWPDTP+LDezaoZ88kp8CUb33lmXF0NRUHP1T/fDJH9xSOyJnTAeBxlUZf9YbCU5P9LLKrDhn5ub5+14XPxSmMYwRROQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748436483; c=relaxed/simple;
	bh=fPpDhX/Lj4v0Tt2tZ4P8Q8dmeNG2Pvm0ZZhF2NT86wk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ze5edqujmA5jp+V20kGr/w3+ZaFG5Ztt0MwOr6n+L0WSdrdA/zHx6cqy+0IgOBk3LuVFO+sOZBtv2eGY6lGO1fh9WLsXHOngyMWlJQQOJKSJ8faXT2zcueC19+XmOkEdKuGHmwNBlCXYhoO+BW8/dIlH/BmEDo53o5MPz+Qug4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GHlR2/Dl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GHlR2/Dl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748436480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cb3aorbBqYJpCjQzgfwsaacNftxmHwGivS7PvwgLlWk=;
	b=GHlR2/DlgngX5An/kzqeDT41z6ndO/h9CEvRGHVTbmQyUlqgphq+3UA8La2XCQ0tm3vDz9
	bcsLYjj9o6zyEGVlspCXTWwtEV9u4cHM6bj1YQ8zBs1aRzjyMGhxK2p+neIxrTxm+e72qW
	WHR/e/BcgqcF4oZGiZDT/+Q3ea/+eRY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-GBU5ENEOOxeiNmj6su9y_Q-1; Wed, 28 May 2025 08:47:59 -0400
X-MC-Unique: GBU5ENEOOxeiNmj6su9y_Q-1
X-Mimecast-MFC-AGG-ID: GBU5ENEOOxeiNmj6su9y_Q_1748436478
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43efa869b19so29214145e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 05:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748436478; x=1749041278;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cb3aorbBqYJpCjQzgfwsaacNftxmHwGivS7PvwgLlWk=;
        b=gMcEN9o0zHuiH7IZalm4WN02tYcEWVDWq6JQrWAPT1kqCTzhkbni9sUNRUHGFUvhdg
         8dpVzr5hrw+G16EqF+4wZNHZ29RqSjliUsUPayaV0Rbl9lGRKgDXavjqk27M+0DnPArU
         pn5FeGzBIPMh7y8En0LfU2dovtJI24iNNpS0oeY3iYVE6/hiYfezA+PQfcGt16oBYY+J
         M+oJzxBJnR97+x/HCh4A8IxRzMUU+z3X+GeT7s7L2IlYtxlAA13Ue9KGGH1/6OCotxlX
         K8qxVGSNOWo4qIyD5hXZfhhy32xJd4usbhnkNiIFoHWNhFky7QRj4NiIfPl/w5fumP0E
         R6yw==
X-Forwarded-Encrypted: i=1; AJvYcCX26Of5QsvvqtdVV8Lnz/DAVRwiYN08EvOAExPdudcwNCuglGxaQjF544MWZm3eMQySLrDfZd0TpqkpbJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwsYJTNm6Bb2SR8WxBluGLZQQHeqTJB+YgruneD8DX9M9hVNMj
	C4I05w+OquYToEBldLhIkevSd2YgVgCBltRILp8u7paecQaxJmunPMYXvcRCA2Ub81weMB+FqUM
	OxXJ+BSXoPTQz5EeKitG/OgtKPnUY+Nvc4L2gJZ+0ZvhX59VQED/K0m4O399+6hDh4z0Xj+3Pf4
	3f
X-Gm-Gg: ASbGncvsSDWXVHB2xCWjxRVnQP53T2OKGtVHZsdMvUn/5O1PHEFCUrypcNAidXOavNC
	VWTKtbF0Ptcr8gKM7vJJgz2m+7PejMM2uk0l3epXs38We2VSc/vYeApJLnJJXyM+fURpKkvaZYh
	bxKH9VSXC07FoqxrWn9SI7J2Q4wyNaUoYsQiu1MChuBS6Y0pmvNrjQDBHDU8LE7oPdvz+nMuEX3
	gGTT8poWCJTVjfEFqk8lzcvRvhrCWLiawkGk/k2e6XCrqh9sqwS3MRoUJjsufIByMbGS0BiFE9c
	c14r2UxL3h4=
X-Received: by 2002:a05:600c:3ca6:b0:44a:b478:1387 with SMTP id 5b1f17b1804b1-44c9465c97cmr164194715e9.17.1748436477895;
        Wed, 28 May 2025 05:47:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHn0xiKEpcJSzSrh775DNRafffjgj/uUM/6Uo2WjKb9P9Ak0t6BCmVMWXg+UmWKgjy5tjhLsg==
X-Received: by 2002:a05:600c:3ca6:b0:44a:b478:1387 with SMTP id 5b1f17b1804b1-44c9465c97cmr164194465e9.17.1748436477454;
        Wed, 28 May 2025 05:47:57 -0700 (PDT)
Received: from [10.43.17.53] ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450ccd8540asm5108215e9.8.2025.05.28.05.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 05:47:57 -0700 (PDT)
Message-ID: <2b5f6cd0-2b5f-4687-ad43-73a7be8fbfd0@redhat.com>
Date: Wed, 28 May 2025 14:47:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bpf: Specify access type of bpf_sysctl_get_name args
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: bpf@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, linux-kernel@vger.kernel.org,
 Yonghong Song <yonghong.song@linux.dev>
References: <20250527165412.533335-1-jmarchan@redhat.com>
 <m2ecw97mxn.fsf@gmail.com>
From: Jerome Marchand <jmarchan@redhat.com>
Content-Language: en-US
In-Reply-To: <m2ecw97mxn.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/05/2025 23:39, Eduard Zingerman wrote:
> "Jerome Marchand" <jmarchan@redhat.com> writes:
> 
>> The second argument of bpf_sysctl_get_name() helper is a pointer to a
>> buffer that is being written to. However that isn't specify in the
>> prototype.
>>
>> Until commit 37cce22dbd51a ("bpf: verifier: Refactor helper access
>> type tracking"), all helper accesses were considered as a possible
>> write access by the verifier, so no big harm was done. However, since
>> then, the verifier might make wrong asssumption about the content of
>> that address which might lead it to make faulty optimizations (such as
>> removing code that was wrongly labeled dead). This is what happens in
>> test_sysctl selftest to the tests related to sysctl_get_name.
>>
>> Correctly mark the second argument of bpf_sysctl_get_name() as
>> ARG_PTR_TO_UNINIT_MEM.
>>
>> Signed-off-by: Jerome Marchand <jmarchan@redhat.com>
>> ---
> 
> Looks like we don't run bpf_sysctl_get_name tests on the CI.
> CI executes the following binaries:
> - test_progs{,-no_alu32,-cpuv4}
> - test_verifier
> - test_maps
> test_progs is what is actively developed.
> 
> I agree with the reasoning behind this patch, however, could you please
> add a selftest demonstrating unsafe behaviour?

Do you mean to write a selftest that demonstrate the current unsafe 
behavior of the bpf_sysctl_get_name helper? I could write something 
similar as the failing test_sysctl cases.

I'm thinking that a more general test that would check that helpers 
don't access memory in a different way than advertised in their 
prototype would be more useful. But that's quite a different endeavor.


Regards,
Jerome

> You can use tools/testing/selftests/bpf/progs/verifier_and.c as an
> example of verifier test checking for specific log message.
> (framework also supports execution if __retval is specified,
>   tests can be written in plain C as well, e.g. as in .../iters.c).
> 

