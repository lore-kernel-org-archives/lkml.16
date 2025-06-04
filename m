Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2991F4703
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 19:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749064408; cv=none; b=iP1GKr083K0CB68kVeFLdjwwQrE0EDO4l3ijmOP5GYi6pXlOT1xj1jvkJ0pwim4p5NdycItN8lfro6Q66H1dYRg6j5n2EM1aRF7FQAztbxb/sJqdkF7eRiV1Ix44Lev5X9dzTQ8TB4NDOnukxqIMDbA3LOIA57as1XIDigGe+4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749064408; c=relaxed/simple;
	bh=Db2JDrEUFmXYyu/uDF6PlGRgyfAd3kmhH7T21wqyCzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jopHi1gYGt0s4ZIDMq83rCDpVHNgG77tzo+R8i6tThiJlqddW55tcJCxJLie8k2xHgN8kyRf1ZYMDy4e4+uy9SZuTatAieqXo9BRCDSKCu8cPUF9t6+//P0jaUAYex2F3GtdQV2OLCfup/Dcuj85SLcZCGvpwcy+mzKRg0z7o8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VstnK9hE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VstnK9hE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749064405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=burzST/eJ5Z7UGznQOvQVsG6FQZbixtkHRYAS7pvlM8=;
	b=VstnK9hEZWfdSpfV6ykV89QRGFp/IA+9h/IjdarTwzjRFp8Sq0KddsosM/YX0g7+p8BF7N
	Tet3Ym90MqC9kE/o48VOxynqLo8Qh3pTcbItkz6O3gOb1Nmlr3brVzwz7AjgeveqL6HF6S
	gqFtffW0FxPRzgDXJrWKaeBPNuMLOCI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-mMeo6g50PNSvDWMAWRMmaA-1; Wed, 04 Jun 2025 15:13:24 -0400
X-MC-Unique: mMeo6g50PNSvDWMAWRMmaA-1
X-Mimecast-MFC-AGG-ID: mMeo6g50PNSvDWMAWRMmaA_1749064403
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442dc702850so657265e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 12:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749064403; x=1749669203;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=burzST/eJ5Z7UGznQOvQVsG6FQZbixtkHRYAS7pvlM8=;
        b=OUghZdYSTR7LTkzccE8lmEHKwmPOE8wJZQlAnFqHHJkK+DS3SVism2s2HSso6bXg+r
         Eoc2sE7UsY+9W3nc1c5DMUqi2y8ssSXhTeHuY78u1xi/paOpjY/pN8il4SYUbePKvN+K
         wOcMv2eQu456C7Gb/soVVHng1MRUbXfd2KVUKj/oRpmhqzSDsB/hHENhhPaimd0GmalO
         L3EnoHMZB3JIfw33HOr/9M0s66V1za1ZxAocXzlezZqPmoTUvpvnF9x/eqT3wht48xIq
         QbzlWZx8rjQ2wW8D7SJWPix6tRZNdzbu+IrxhErHitWPPGkbbDvwH9kLRUyAx1mqpW5d
         Ftpg==
X-Forwarded-Encrypted: i=1; AJvYcCUdhWp1YN+OKJIYhxfxBafj8V25J060ViY9ihZJF2doD3ab0Pr91BskA+m6xn5GdMKihh7Y7Zb1kp96xa0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy42LbhtO6yyUzq5xZWNyI2llhN9xbIt3LH50DI2H5d8HgjDSGT
	hm98CejGzTzmIstAzFXAdSP5dmRuHtHV2dajNjRIuSwAtXiJoCY/XraiyrG2g5jspyaQ79stDkU
	4L7lh/hJORW5vub6XyoKT0svMlt3seUMhxicx3pvHFdKx14OzwDyq4ad3RgdBiNmZIQ==
X-Gm-Gg: ASbGncter6acbJQyo271OzzS+N9hUL5NuEgFXR3uIsg/j0kX6nykRqAbvUsd0DjlEHE
	w1LBn1Q/Bwxr8S0aUwyBllpit/EGe9qES/q6M8s/7lfscP7MqWVSrvsIj49WC5QDThvdwhiQkQ8
	Ln8FZHQcc+mIWi/rVx+EKA+/C2O0lbjYx1O0wdrDodTAf3E26MRDUjNMO/uDWnqgCKJ3aBIoipH
	5h4SX5eDcQVx/QeZuhKgg59DMta3nqhVhmkcEA5HnJrlTm/i4e3AYuJZEhsKSGLteF+cWLQFEWQ
	F/53gRfh7h3URg==
X-Received: by 2002:a05:600c:8b58:b0:442:e9ec:4654 with SMTP id 5b1f17b1804b1-451f0a9b604mr37174565e9.8.1749064403030;
        Wed, 04 Jun 2025 12:13:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBnAuhK8aMrK4WTMzaAHJs7iK560ZZF9epfXYo6P3+2qPcCX8WKi9YUFiOzsz53nW/hgwS+Q==
X-Received: by 2002:a05:600c:8b58:b0:442:e9ec:4654 with SMTP id 5b1f17b1804b1-451f0a9b604mr37174415e9.8.1749064402563;
        Wed, 04 Jun 2025 12:13:22 -0700 (PDT)
Received: from [192.168.10.81] ([151.49.64.79])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4f009fdbasm22133731f8f.85.2025.06.04.12.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 12:13:21 -0700 (PDT)
Message-ID: <c48de0c5-7dd4-4c3d-9f15-3cf0714793b9@redhat.com>
Date: Wed, 4 Jun 2025 21:13:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/28] KVM: SVM: Add helpers for accessing MSR bitmap that
 don't rely on offsets
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Xin Li <xin@zytor.com>,
 Chao Gao <chao.gao@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>
References: <20250529234013.3826933-1-seanjc@google.com>
 <20250529234013.3826933-12-seanjc@google.com>
 <1392db34-0c37-49db-8ece-68c02ff3520d@redhat.com>
 <aECD09sxnFAA2Te5@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Content-Language: en-US
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <aECD09sxnFAA2Te5@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/4/25 19:35, Sean Christopherson wrote:
> On Wed, Jun 04, 2025, Paolo Bonzini wrote:
>> Replying here for patches 11/25/26.  None of this is needed, just write a
>> function like this:
>>
>> static inline u32 svm_msr_bit(u32 msr)
>> {
>> 	u32 msr_base = msr & ~(SVM_MSRS_PER_RANGE - 1);
> 
> Ooh, clever.
> 
>> 	if (msr_base == SVM_MSRPM_RANGE_0_BASE_MSR)
>> 		return SVM_MSRPM_BIT_NR(0, msr);
>> 	if (msr_base == SVM_MSRPM_RANGE_1_BASE_MSR)
>> 		return SVM_MSRPM_BIT_NR(1, msr);
>> 	if (msr_base == SVM_MSRPM_RANGE_2_BASE_MSR)
>> 		return SVM_MSRPM_BIT_NR(2, msr);
>> 	return MSR_INVALID;
> 
> I initially had something like this, but I don't like the potential for typos,
> e.g. to fat finger something like:
> 
> 	if (msr_base == SVM_MSRPM_RANGE_2_BASE_MSR)
> 		return SVM_MSRPM_BIT_NR(1, msr);
> 
> Which is how I ended up with the (admittedly ugly) CASE macros.  [...]
> Actually, better idea!  Hopefully.  With your masking trick, there's no need to
> do subtraction to get the offset within a range, which means getting the bit/byte
> number for an MSR can be done entirely programmatically. And if we do that, then> the SVM_MSRPM_RANGE_xxx_BASE_MSR defines can go away, and the (very 
trivial)
> copy+paste that I dislike also goes away.
> 
> Completely untested, but how about this?
> 
> 	#define SVM_MSRPM_OFFSET_MASK (SVM_MSRS_PER_RANGE - 1)
> 
> 	static __always_inline int svm_msrpm_bit_nr(u32 msr)

(yeah, after hitting send I noticed that msr->msrpm would have been better)

> 	{
> 		int range_nr;
> 
> 		switch (msr & ~SVM_MSRPM_OFFSET_MASK) {
> 		case 0:
> 			range_nr = 0;
> 			break;
> 		case 0xc0000000:
> 			range_nr = 1;
> 			break;
> 		case 0xc0010000:
> 			range_nr = 2;
> 			break;
> 		default:
> 			return -EINVAL;
> 		}

I actually was going to propose something very similar, I refrained only 
because I wasn't sure if there would be other remaining uses of 
SVM_MSRPM_RANGE_?_BASE_MSR.  The above is nice.

> 		return range_nr * SVM_MSRPM_BYTES_PER_RANGE * BITS_PER_BYTE +
> 		       (msr & SVM_MSRPM_OFFSET_MASK) * SVM_BITS_PER_MSR)

Or this too:

   return ((range_nr * SVM_MSRS_PER_RANGE)
           + (msr & SVM_MSRPM_OFFSET_MASK)) * SVM_BITS_PER_MSR;

depending on personal taste.  A few less macros, a few more parentheses.

That removes the enjoyment of seeing everything collapse into a single 
LEA instruction (X*2+CONST), as was the case with SVM_MSRPM_BIT_NR.  But 
I agree that these versions are about as nice as the code can be made.

> The open coded literals aren't pretty, but VMX does the same thing, precisely
> because I didn't want any code besides the innermost helper dealing with the
> msr => offset math.

>>> +#define BUILD_SVM_MSR_BITMAP_HELPERS(ret_type, action, bitop)			\
>>> +	__BUILD_SVM_MSR_BITMAP_HELPER(ret_type, action, bitop, read,  0)	\
>>> +	__BUILD_SVM_MSR_BITMAP_HELPER(ret_type, action, bitop, write, 1)
>>> +
>>> +BUILD_SVM_MSR_BITMAP_HELPERS(bool, test, test)
>>> +BUILD_SVM_MSR_BITMAP_HELPERS(void, clear, __clear)
>>> +BUILD_SVM_MSR_BITMAP_HELPERS(void, set, __set)
>> Yes it's a bit duplication, but no need for the nesting, just do:
> 
> I don't have a super strong preference, but I do want to be consistent between
> VMX and SVM, and VMX has the nesting (unsurprisingly, also written by me).  And
> for that, the nested macros add a bit more value due to reads vs writes being in
> entirely different areas of the bitmap.

Yeah, fair enough.  Since it's copied from VMX it makes sense.

Paolo

