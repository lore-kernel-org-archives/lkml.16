Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D1A1EA80
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 14:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748960150; cv=none; b=asNUJQO4+cggl0V/DbiJ9UYAoo715u3IjvrmbhIorpCxkRBfPlm23qnisGD/HVEx5+Z0/uDAMhlZZRJdYq3xCDGo7dTdZyGxznGS7NivcMnScWjNM96tykyA8Vz5UIjxlwiFZXUEwJEdcYGvVD3w1nJJVuCi2gnYbpE+t7ulII4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748960150; c=relaxed/simple;
	bh=7mQwZzpgsWuVhYhjxhIyDrAOa+YcgXV40KHe5n8HLKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HUIWVrt/AgXyqF3x/7AqxPMwbfUXgpNFZ28pppsSDkCHL3IcCHlPrtN5F8qV/A13p4gTWFMprx/FHqAmXk+iS0ajVDv/3cAyBuD3UB2CXTvbJxUgVvzCPHC1PY+FxqfnuGwA5rfap8GRGAioI8thNI+ack7S5qTMVFyucgY6wbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XleDqXeO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XleDqXeO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748960148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sKa5t52MY3GEaT9Com1xmb0aaOXYWR4eXFTO3mfWlV8=;
	b=XleDqXeOO8RsEzLnRGZYIjWTtwmUzL/a+PrUZ0J27F7HFMNVkEGNbEVfnTsdOQrAQyjsvh
	n3LmSya7CHHUmN0UnNHeUe+KbM4JlgpDzMCEJXFZZXHGskl6zA3GS888Ptop6r8ZlAP+2Q
	xtPQycBB7wh1GamrEWj2IES5GDLiAas=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-YxnTZzYiO3CSvZNILxKhGg-1; Tue, 03 Jun 2025 10:15:46 -0400
X-MC-Unique: YxnTZzYiO3CSvZNILxKhGg-1
X-Mimecast-MFC-AGG-ID: YxnTZzYiO3CSvZNILxKhGg_1748960145
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450dada0f83so31065105e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 07:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748960145; x=1749564945;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sKa5t52MY3GEaT9Com1xmb0aaOXYWR4eXFTO3mfWlV8=;
        b=qOIhkn9EUCRdCnuQ6hVxJ1Xu+29phOFNg9GELKsWgLINbCRBLHaqEhS4eeOF2TJ0Tl
         kZJyYOChpk33eBbvjxPgxAhEsCGWMAz1A64EU258t7rgfFaJdedNJGQmKHqR6qKl805G
         ilzA+fZMKoFzN0AofcmNUAZSxeG5uOesDq6J7VRG8gHk4SUkwvVMIVa+bES0xM4mZCMQ
         IfjMA8FSusNKWArkBnVe5gv6eIYr0JJPqokUruxApKc6ZwvV+fJE9FDfUmMRAoNN+Lou
         LjKjJgnl+f6W2v0d9vClF5e+6FFawlJkOfhahl55g5RoKqIbK66d76XZa3EXyZGBp2Tk
         +iww==
X-Forwarded-Encrypted: i=1; AJvYcCVWWFuIjB+2ssGMnAZYJkEkG0x4K9pTOqLuP6jSpa3iT27id34kuwpGxLsD3vnnZc7wqYbopdnABvESB+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqPN13Se3obZj9IHNhXJZYFdMSAvRENXzdB5T+PlwGGoexooLi
	AbxX4xxugNeh2KHIptX578Ttc9XdJKHCgRYvx7nvskxEnu8UMPZZBbzIIXpA+5hBMwZUWEnZE++
	r77mYo1Vs0d2l6Wchy1OdPpaPIh6Op8ApPVAimh/LKz5tyh4J+IPaYEGpPl/C2iFavw==
X-Gm-Gg: ASbGncvGeuBJnP3UyiB99ANjzf98PJCOsCCGYH2DvGoK9oN65u/kObb0lXby/9lkkJo
	x0DK3A4X4ZIHRfW4z2s7Q3rYN1y2o8LG3wRug1IXS4T8PHKGlJ2ZF9UuwK3/dELS3EAZ7mOIV6v
	KdMW0gLUWFFD4E8cwuNewiUvlGT+GEzRl5Ev+afJ5pce74lVrDY1aDv+y23+IWlHslt4hGc7g8D
	lBcV98pFk+Mekw2v4w8meYS5oNUIcS10E3BSGECCtLHLdWf/+EDC0DXDl8JK8vDA53HUKnZc+yy
	wthCXWl24VfCN5hfH1fwRKYqPqic0fKwhQxgNBh8/v/h7fw96HROjpUtWEvbCB3/m3q7cJgy6h/
	jgVlj9ei3txp9xAxk9iqwnPrJC/YzbSLTm95Nr9bX2wtxVLy9Ng==
X-Received: by 2002:a05:600c:548c:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-45126572d16mr132881485e9.30.1748960144793;
        Tue, 03 Jun 2025 07:15:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWpp1Ue9ft7Rf3WE+CItJU5/SFz/z8xheX0XLv2yVZGygyV17SSstF2Qqeydu/Hmnb1lqrnA==
X-Received: by 2002:a05:600c:548c:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-45126572d16mr132881045e9.30.1748960144305;
        Tue, 03 Jun 2025 07:15:44 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0d:f000:eec9:2b8d:4913:f32a? (p200300d82f0df000eec92b8d4913f32a.dip0.t-ipconnect.de. [2003:d8:2f0d:f000:eec9:2b8d:4913:f32a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f0097205sm18573064f8f.79.2025.06.03.07.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 07:15:43 -0700 (PDT)
Message-ID: <4676a010-a977-4d5a-b42a-edbbea7d356d@redhat.com>
Date: Tue, 3 Jun 2025 16:15:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] selftests/mm: Report unique test names for each
 cow test
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250527-selftests-mm-cow-dedupe-v2-0-ff198df8e38e@kernel.org>
 <20250527-selftests-mm-cow-dedupe-v2-3-ff198df8e38e@kernel.org>
 <c43347ce-433b-498e-bfd7-f09b8e781197@redhat.com>
 <9961082f-848d-43d3-b97d-3df675ca4415@sirena.org.uk>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <9961082f-848d-43d3-b97d-3df675ca4415@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.06.25 15:21, Mark Brown wrote:
> On Tue, Jun 03, 2025 at 02:51:45PM +0200, David Hildenbrand wrote:
>> On 27.05.25 18:04, Mark Brown wrote:
> 
>>>    		ret = mprotect(mem, size, PROT_READ);
>>> -		ret |= mprotect(mem, size, PROT_READ|PROT_WRITE);
>>>    		if (ret) {
> 
>> Not sure if that change is really required: if the second mprotect succeeds,
>> errno should not be updated. At least if my memory is correct :)
> 
>> Same applies to similar cases below.
> 
> I thought about checking to see if that was guaranteed to be the case,
> then I thought that if that wasn't clear to me right now without
> checking it probably also wasn't going to be obvious to future readers
> so it was better to just write something clear.  Previously we didn't
> report errno so it didn't matter.
> 
>>>    	} else {
>>> -		ksft_test_result_fail("Leak from parent into child\n");
> 
>> Same here and in other cases below (I probably didn't catch all).
> 
>> We should log that somehow to indicate what exactly is going wrong, likely
>> using ksft_print_msg().
> 
> Can you send a patch with the logging that you think would be clear
> please? 
 > I dropped these because they just seemed to be reporting the> overall 
point of the test, unlike the cases where we ran into some error
> during the setup and didn't actually manage to perform the test we were
> trying to do.  Perhaps the tests should be renamed.

ksft_print_msg("Leak from parent into child");

-- 
Cheers,

David / dhildenb

