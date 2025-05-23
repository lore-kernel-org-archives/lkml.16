Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72EE137E
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 00:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747959023; cv=none; b=F2lB+E+Z8TCPZ2NHScJ8DPAElNITSSA2OrJV2xsO6TO3TfDHKxmH7XDpf0IjcY23Si3Uauw1QlImKTK9NK7CK9A+W0tB3VXg/Xe3lUt0r4OQouCIUkv8Wcwk0dmYzWoha7DlNNI6GxABvmHuxJDxuvEMez/NcsGcG3zcTr0FcEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747959023; c=relaxed/simple;
	bh=3vuN2GSvRHCHGPErwDlmWRc3CwFdgj82DkJjAH4waMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NISue40d7qbWdwjymispBP2qc3gTQxDakXXU4nCBq+VrPOHNjH36u6foOKbb2Jwr5JBigth2OJ3db49xlfBPqpK7qRP9nZ6SbMh+nKB2edl9Deo7/LQMgSLPhUaEPbLAZedvwf3+JMSubBB4nr9xFw7SCYQ0W+lsUnr3YffsMrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=mM6/3SzV; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="mM6/3SzV"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso16049009a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747959018; x=1748563818; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Gzjr+72w/msNfKlQ7uGd0rUlDyTdI08kbdU5rOmh8v0=;
        b=mM6/3SzVjj0yIVLRH7xQl819S9QOBKgsCY/QtWfgxHi3Gbv3Jckq7vMTrHF0QM/HT9
         q6v5F4dMdDN9kIO5DMrEcHCq84UnQhvfezGDUeV//MVZgU8tNR9p7lft7z3X7sPGFt1b
         pxhbdOci/M8mtSeZuC3TAyyHujpKVRLbrxilY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747959018; x=1748563818;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gzjr+72w/msNfKlQ7uGd0rUlDyTdI08kbdU5rOmh8v0=;
        b=Emb7Wrg3zzEEDu1OL383kKCSix73Rz+wwI1st9ncInrONvQpdfkZmatPv84j1b2HyA
         67HELhoepvIhy0KOAizFdY/T+jx9xVSuPFanJ9pZOOdUi3chwX555yDTuRosO2vLQ3F8
         3Om9TS/IVJHnMllvlx9EB2qDpFPBjrK/6rbg2aQ/aozvAnBxL77bKyUcZ78KD3krrRtr
         Lqyb8SH4/Lf70cwD1xtmtqLBVJpK6HDgF2GGRoHlptY1Ps3gOkDBpNTk9FWa9fxNsiqd
         C6cex97ytCoeMPNM7JicPxKyqvz/9ekmrVb0erWyaCrqQltBBponjQAr+mXW6IIN1WHt
         qrQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIqI2to8akLq5/coP/6S4xfI8fykg3VZBL5pds7i00bzAHig35gi9WLOS4t4yZ1YhYjFc4oGRuAi0cxHc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9aXFkBj0DNsNnxlqFQUTXf9KqlzKrhU9MAL4m/Upu5EywO2Wn
	WaGRdYthNdRshF/2dmJWSO4CNzcDoKpXVxbX1XU7ME3PSqHqqPh5oavgB4++xx5kr1w=
X-Gm-Gg: ASbGnctOYqBNCXQoX5Kfsdcxdue2RlhyI3ZAWcTdppCe3RNoeKqFc97Nh8xvxE0gKBQ
	oiN7iZeBrbjb9ESJgQr3HUrDcrtGlMVm5pf+PWEY8RMSLV3ldkIvxbpQGIxn2Mo6e7+wCAynLaw
	UsFbAJZ4YKiqCsCVoU8DDLz+4q+cWf4zEOYMY9/9bAss4BzHi1HWG6mRNDoPO0eceCOcsla9EDZ
	eFxTY23E2g6pGABHXm6MppZcyU5HrIlNQYCsd9IkrfvHzQGui2SuHJv4CSYJXWCnHTfkaAHKAoQ
	0IK9Y55pKXhCbqpaaHj2GfaMztgo9mAV95AsYFyKz15YCXe7Wbj2Hlb2RAjVXT5miaWpsqQgQ8u
	SyMkAUBrQGTjgpZle
X-Google-Smtp-Source: AGHT+IGdcBUVPJgJ2m5zjPOfsemTEeRdWTqzFTqb0lmZ14AB90ba39k30gSY99bJjgeh7Eazzt6puA==
X-Received: by 2002:a05:6402:51c9:b0:600:1167:7333 with SMTP id 4fb4d7f45d1cf-60114099a62mr22589294a12.10.1747959017984;
        Thu, 22 May 2025 17:10:17 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6004d4f310asm11184747a12.16.2025.05.22.17.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 17:10:16 -0700 (PDT)
Message-ID: <0a4db439-e402-4b6a-8aba-79a3c0398d9a@citrix.com>
Date: Fri, 23 May 2025 01:10:15 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] x86/fred/signal: Prevent single-step upon ERETU
 completion
To: "H. Peter Anvin" <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>,
 "Xin Li (Intel)" <xin@zytor.com>, linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, peterz@infradead.org,
 stable@vger.kernel.org
References: <20250522171754.3082061-1-xin@zytor.com>
 <e4f1120b-0bff-4f01-8fe7-5e394a254020@intel.com>
 <ad8d3a12-25f3-4d57-8f34-950b7967f92b@citrix.com>
 <3D4D48D6-D6E7-4391-8DCF-6B9D307FE2E2@zytor.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3D4D48D6-D6E7-4391-8DCF-6B9D307FE2E2@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/05/2025 10:28 pm, H. Peter Anvin wrote:
> On May 22, 2025 10:53:16 AM PDT, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> On 22/05/2025 6:22 pm, Dave Hansen wrote:
>>> On 5/22/25 10:17, Xin Li (Intel) wrote:
>>>> Clear the software event flag in the augmented SS to prevent infinite
>>>> SIGTRAP handler loop if TF is used without an external debugger.
>>> Do you have a test case for this? It seems like the kind of thing we'd
>>> want in selftests/.
>> Hmm.
>>
>> This was a behaviour intentionally changed in FRED so traps wouldn't get
>> lost if an exception where to occur.
>>
>> What precise case is triggering this?
>>
>> ~Andrew
> SIGTRAP → sigreturn. Basically, we have to uplevel the suppression behavior to the kernel (where it belongs) instead of doing it at the ISA level. 

So the problem is specifically that we're in a SYSCALL context (from
FRED's point of view), and we rewrite state in the FRED FRAME to be
another context which happened to have eflags.TF set.

And the combination of these two triggers a new singlestep to be pending
immediately.

I have to admit that I didn't like the implication from the SYSCALL bit,
and argued to have it handled differently, but alas.  I think the real
bug here is trying to ERETU with a splice of two different contexts
worth of FRED state.

~Andrew
