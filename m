Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B012235069
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 12:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747400132; cv=none; b=jhqOOzOWgHHcDdDXmCmOQHw5tlx7b1nuLNe18r0rta3iO9Kuw56abLQS4qh1vJjCl1vchi9QFSAOrHXo/FJDgKNb5/CJAdZqgj7wKhpUNIzveAYd3xTXtBgJeT2FzXooAjIdT1UN+IIgyqPZ/hyCCKfDZThN9WxoI2aV2qJoYfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747400132; c=relaxed/simple;
	bh=bZzWGMDYDzVegdcHFicDYJ1jOFP1bsLQ9Gud/BDvN34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iAa1+Ioh2jBeSq8HQBN7Qh2shNWnw/BYeznqt/LNeyEJVt1D05gFMPCu2/NHhHYYNN59L7NDeNpQBDheZPNyo08UGmDHOSBQlFKLYDLLD7XRBEpW7WFB7M6RavYVXH+4zGvzFZNkndCUhGMQXbA02Ys+/cw3FXatzXRwR8j0jFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SrOqPRxs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SrOqPRxs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747400129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PF4o05Qile29JrPKngFz8A7PCJwee70N2MJa6OzBXtQ=;
	b=SrOqPRxsmfFIQVEQcpt7+digDXdiIhNcl4O9Rv4IRBdysTx+wya+tRmKki5YgL8PX+WXcp
	S2Vzn43n/Cq9W5HBFUKU0OB7+1nwZ/No8shnNl8/Y6vOoL26LvPFFxV1E+GwKHpJmmTTrl
	LZiybTZMQwUdfNfIwjUbEIlyDs9dvCA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-QSMl6CRCNGuoo1PoQB3aTA-1; Fri, 16 May 2025 08:55:28 -0400
X-MC-Unique: QSMl6CRCNGuoo1PoQB3aTA-1
X-Mimecast-MFC-AGG-ID: QSMl6CRCNGuoo1PoQB3aTA_1747400127
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d5ca7c86aso11915525e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 05:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747400126; x=1748004926;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PF4o05Qile29JrPKngFz8A7PCJwee70N2MJa6OzBXtQ=;
        b=cJFFfCV3lVb87lHXbqKA9eTD4gSKuKAK/G1sexzzeq90Cobo6QalAj5PJHx+Ga0tdx
         l5w71QqEN9pzBAJacU6jHg9ujuIXR2HwUELroQ9aK8w/Jj/1uqf2ZSgRuctsyhkfR1w1
         ZievvpJcoBHG+bes94pp6qfKq+75uAQJL6+vrzLA3GXv7JO/obyp6XZ3HtAPTV2rAXMo
         NUynQQMdHvkOHIipj0aTGGrxbJMj6kBL0Mo0sn6rMJmD00vmdvwfLG2EFIGLrC3SpKfi
         kHsmRWHl/yjWpo9Q0idkUzVKMT7x2cLmZvE5nIDZEifK77AwFdfo0u4zc5KGPRvp8AE8
         hPhA==
X-Forwarded-Encrypted: i=1; AJvYcCXN8oqqmR5jDMY1co0TLSsBS3TQYQaU0agHAJnZIKQN1MdDJQefWez5e0ObBCyQbmIHQYzgzggWHyqFtP8=@vger.kernel.org
X-Gm-Message-State: AOJu0YykzMaVXuhgeUKs6AGGvhN3Tiy/fK087jo2Zium3/fL5cZRNNNZ
	K77KON6JU+8w7561/dqeef7W4tEjF285Csnq/KbjwsrgQiUN64QUBPZHg86aRVtUg76mqYEKnF8
	xR6/4JZPvd4jo8bR5rX0B5aOUr+VrgTmG9tSxKU+1waE9QXxtrC/12qJJjeyNv9j3gw==
X-Gm-Gg: ASbGncurCMa0aaZMC516M0QZCTERWgjNHsLdYFArKcMZ6LcBrlmOkLuSACRChXDfXRP
	nt/a//ZQXOaRnnecX4r2WkcldIJcQ0bw14RCL3RbiAamVo1J6+yADoqOd6jRZ1CY4fYnc9ujANX
	clvyDoP1zqhtTt3VWS08HNfUIXGZslGsqMhij1A2EoxNkikHCj/qpbzeI6osOyY4hbgQkQ9MBuc
	Q28tlefXpl7VbOAJFh03SN/Jm1HFvxXLE0uaC31B5En/11D8MY/Vg4ec1lW1TsZgxXbcNMyzhrS
	jk3O7VAxgLvUnCY1MXMgwJnhfKDHlCsTRiYRVC81O8LgI3f+Vin5gsoerLOsNQEn6WPvWZ3pqdp
	PcN0fOqNTPR50MOB6oI5s2Z+bG7DD/cx7QG6t5MA=
X-Received: by 2002:a05:6000:1a85:b0:3a3:4ba9:67cc with SMTP id ffacd0b85a97d-3a35c825f6dmr3791642f8f.33.1747400126567;
        Fri, 16 May 2025 05:55:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxmqyrl2Rmv5n5lMbM8yWmXcj+ByZHNn8K0w0aCt6HfAzzFOdJD39SfyvM80IH0dNAiN28qQ==
X-Received: by 2002:a05:6000:1a85:b0:3a3:4ba9:67cc with SMTP id ffacd0b85a97d-3a35c825f6dmr3791627f8f.33.1747400126137;
        Fri, 16 May 2025 05:55:26 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f47:4700:e6f9:f453:9ece:7602? (p200300d82f474700e6f9f4539ece7602.dip0.t-ipconnect.de. [2003:d8:2f47:4700:e6f9:f453:9ece:7602])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5aba3sm2745916f8f.40.2025.05.16.05.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 05:55:24 -0700 (PDT)
Message-ID: <58dbef73-6e37-46de-9092-365456306b27@redhat.com>
Date: Fri, 16 May 2025 14:55:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: Fix test result reporting in gup_longterm
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250515-selftests-mm-gup-longterm-dups-v1-1-05f8f731cf63@kernel.org>
 <f924f789-5269-4046-99a4-2991f9a3ab3c@redhat.com>
 <aCcvxaFc6DE_Mhr1@finisterre.sirena.org.uk>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aCcvxaFc6DE_Mhr1@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.05.25 14:29, Mark Brown wrote:
> On Fri, May 16, 2025 at 10:02:16AM +0200, David Hildenbrand wrote:
>> On 15.05.25 10:57, Mark Brown wrote:
> 
>>> The kselftest framework uses the string logged when a test result is
>>> reported as the unique identifier for a test, using it to track test
>>> results between runs. The gup_longterm test completely fails to follow
>>> this pattern, it runs a single test function repeatedly with various
>>> parameters but each result report is a string logging an error message
>>> which is fixed between runs.
> 
>> As the person who wrote that test (that you apparently didn't CC for some
> 
> I just CCed whoever get_maintainers told me to CC for the patch.

For the future, it's a good idea to look for the author of the 
problematic bits.

> 
>> reason), what exactly is the problem with that?
> 
>> We run tests. If all pass, we're happy, if one fails, we investigate.
> 
> None of the tooling is able to either distinguish between the multiple
> tests that are being run in gup_longterm, nor compare the results of
> multiple runs effectively.  If all the tests run they report themselves
> as being duplicates of the same test name, if one of them starts failing
> the effect is that one of the duplicates disappears and we get an
> entirely new test that's never passed reported.  If multiple tests fail
> it's even worse.  This means that UIs displaying test results end up
> reporting things unclearly (Was there a regression or was a new test
> that never worked added?  What was the test?).  Since it's difficult
> to track the tests between runs tooling that does reporting of things
> like "This last worked in X" in the UI doesn't work properly, and tool
> driven bisection of issues similarly struggles since it can't tell
> what's going on with any of the tests between runs.

Okay, so this is purely to make tooling happy. Humans are smart enough 
to figure it out.


What mechanism do we have in place to reliably prevent that from 
happening? And is this at least documented somewhere ("unique identifier 
for a test")>

I guess when using kselftest_harness, we get a single identifier per 
tests (and much less output) just automatically.

 > > Basically, the output is garbled and vastly less useful for people
> running this as a matter of routine or as part of a broader kselftest
> run.  For example with my own automation I probably won't notice that a
> previously working test failed unless every single test fails, and newly
> added tests that never worked are a much lower priority to the point
> where I may never look at them depending on where they are.
> 
> If a selftest is reporting multiple tests it should report them with
> names that are stable and unique.

I'm afraid we have other such tests that report duplicate conditions. 
cow.c is likely another candidate (written by me ;) ).

Probably, the affected tests should be converted to use 
kselftest_harness, where we just report the result for a single tests, 
and not the individual assertions.

That would reduce the output of these tests drastically as well.

So that is likely the way to clean this up properly and make tooling happy?

-- 
Cheers,

David / dhildenb

