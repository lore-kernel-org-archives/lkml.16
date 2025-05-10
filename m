Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDE21547F5
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 20:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746909952; cv=none; b=izc/VcspUegv4EHiNPczqDWuMEJlwojvZTZHPDwWyYr/bWeC5tsGwG9vaQ9ABoEBtfrYyXOyPjp0R+/SCA/CEyySZXgbwTLM+OUTFc6jBO33q8YHMSaTMxXOmlbPIaFIBs1h3fMGDMbRFGsRJn8Ffl8aB6p1iQMreJVR9j8O8+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746909952; c=relaxed/simple;
	bh=YDy9w+jQBR1Gxg40Fe02GHCPn2ATzzdCywMHD+kacWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XiJ6dBmLlsxYFInJ24cBXNn72aEe4ZnmT4ilwxx5j5z0n92Gu6KfMey0N/SRhFMsWIgOT3I3pHeMhJyF6MiUaTt/3spD6TpGixjZR8Q3clFpJkJ1EPmrPXwyFsViTiHevAIGaZwPUsrThAiDtJqu8TNt1mbOGaHHDTg51vOkE9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zx2/7ugq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zx2/7ugq"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so17529005e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 13:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746909949; x=1747514749; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EyP4HwBraQsae7oLaQ+SqQNi/VeXX8Q8Sp+epudPAIU=;
        b=Zx2/7ugqPkeiwRQ8q683ZRRpYd9e9YO6eyQvVWfc1rov9oGiGAlzsxgd7tcTdpr17X
         RdiXuJBdmqoNq0nYuuHpdYWotdMbDlqLiIunHeK6IirJKWDJpXAR9FBFm/dNRpxTCDiX
         KOlNOzLMv0BuyUyjztiS45FPbe4G+8Tc4UybkdPPUcQmzAMtk+fV12YG9yunejHJiZR8
         l4qgAzG0YOHQXFTPZTL+Kdd0ectR5yoKw7whJWx4qtPvaE843gVi97MCK4u2NJC2R1n8
         rXHpD2o795omllT03aIWM1xEONKAB+4DlJuxiH129TG0wfPjxRaBD+iafiuKaAU3hlGM
         2kfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746909949; x=1747514749;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EyP4HwBraQsae7oLaQ+SqQNi/VeXX8Q8Sp+epudPAIU=;
        b=rx8+SETEMU846ncQjF2SfsbT/nElczoO2y1/LbW4LstSY5DecS1NSbKqCFNwu9fl1s
         KbvdfLtn1c2Uq2xslEOkh6tHk6KqfFLrKQ8TBduqK91CSpT5rYMf4bmQ1MPDopPZ4A4N
         /0Bkr7JivRtW7qp1pOBFFSPBzAkns8FfrpGsts0Oqfq4WrUCeNa3aLgX10bUKjWA95rz
         8C5UCjpQG40e6jDmhRIRf8C0mpM+MBoiwD/Kji8ASw6U96LNJCiKAcdEddajRS/38d4s
         tRX3UbATIRIkYFz7J8HhN3i6AFguuZNU+4EluzHyxPKycesO02NUSXlb62xVOWzqbejv
         GNeg==
X-Forwarded-Encrypted: i=1; AJvYcCWvyLX0Tm/fDt7sv2txaXNc25tVt5dMR6Rc9+tulX/1lAPeHosVoIAtu9mYOiXKmPVJ6wao1qEKeJrkxoI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk03OY563OJzLHXowO5T1LRRkysf7SRidgNLLjxColHzbnpRHj
	DI/J+xinrT+0r9URVpXo3+oOjZUYhCv/VUsrUa+ehC6xn1GOJnIT
X-Gm-Gg: ASbGncvlleAzNf2a3JIalnoeS924wPdaB5+LKC27dJRYHdMp64dT5NcOKAcQgNbfpmG
	JKmZxogcLR3bqrOR4mH5FgnuGEPX4HxSV/ez86Exa+jL1orKlD5L9W2ySxoPMHgFEMlkHfS2uSO
	xz4+2cJ4FJ1eGcmruE9b+BMJ78n5POyUMAmfhDRRjEuLcYXPS+BZ7foAgns0bTPDiHzt+1BV0mC
	5bOKYcWBzzqkqb6MzRwj+zRf3qKjLY9UmGr24kQ2hemIKI6t73W4JQlWL4yKYRXzVuwVWAzbxD3
	eiHPz6Ca6C6AopAR2aJiR8T8b6kmdBK++r8ZWo+bJNom+qtjgrhoVz0Bk9aOR29uUeAVNPHeSuH
	k89E6zOCZElGke4Aty9tJ9eNWK+sV6udssSvEzzrIsqXO9Xp4n1YmNT3oIHZHJ2RhT5JTDUJcid
	p8cRldXjrHqx2tnGdJsgWZOu8=
X-Google-Smtp-Source: AGHT+IGdWyU2hz+jdbWaes1gHHcXW+EnwlUuRy0KsqxkMVgWLxt1Tz+TF2HYZdR/ABaf+HyogT5azw==
X-Received: by 2002:a05:6000:401e:b0:3a0:aee0:c647 with SMTP id ffacd0b85a97d-3a1f64374e1mr6738425f8f.17.1746909948699;
        Sat, 10 May 2025 13:45:48 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f3a:400:9165:e299:6732:ee1d? (p200300ea8f3a04009165e2996732ee1d.dip0.t-ipconnect.de. [2003:ea:8f3a:400:9165:e299:6732:ee1d])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde1asm7305103f8f.8.2025.05.10.13.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 May 2025 13:45:48 -0700 (PDT)
Message-ID: <ec8c3fff-d08b-4132-9a9e-c70e3efe6f2a@gmail.com>
Date: Sat, 10 May 2025 22:46:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Documentation of locking needs when working with lists?
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar
 <mingo@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <4f405d9b-460c-49f7-91b2-d147d9818369@gmail.com>
 <2025051012-karma-setting-af04@gregkh>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <2025051012-karma-setting-af04@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.05.2025 15:20, Greg Kroah-Hartman wrote:
> On Sat, May 10, 2025 at 10:46:32AM +0200, Heiner Kallweit wrote:
>> Even though lists are used everywhere, I was surprised not being able to find
>> documentation about which operations need locking, and which ones are safe
>> lock-less.
>>
>> My case:
>> I have a list where the only operation is adding entries.
>> It's clear that adding entries has to be serialized.
>> Question is whether a list_for_each_entry is safe lock-less.
>>
>> Looking at the code I *think* it's safe, under the precondition that
>> reading/writing pointers is atomic.
>>
>> Any hint or documentation link would be appreciated. Thanks!
> 
> You MUST have locking for your list if you have multiple processes
> accessing it at the same time.
> 
Thanks. Sure, I need locking for the writers (list_add_tail).
Question is about the reader, list_for_each_entry.
Last step in list_add_tail() is WRITE_ONCE(prev->next, new);
list_next_entry() reads the "next" member of the iterator.

Therefore I think list_next_entry() always sees a consistent
state, either the old or the new value of the "next" pointer.
So I don't see a need for locking list_for_each_entry().

If there is such a need, I'd be interested in the potential
race scenario.

> good luck!
> 
> greg k-h

