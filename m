Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE501EF387
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 22:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743200100; cv=none; b=piSAN7oiqM8Zfo3zxqqw4sjeONwKkEPT8V2bnhTupX6h0VJlDHu+XyoMhCLS1jcbcHv4GYOtCRRAEkBWD6HS6qhyQbkEbPgVsgo+mwsspY0XfjIKd2lXz3dVDPjU25Vd2qivEEaSEXU+VhHYP4nl1N0o0INf+jWq77yDXarOsWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743200100; c=relaxed/simple;
	bh=3LhOBh1if/G4lc3HsqhYB39Qdkno2Qt5JqUSH0+F/e8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eBRgkwIi7C4m2k61Rdu4bmI4czQ5400OPFaiCqP1lqkTNgjbTn7AESDAgLmeNb5Gt181AjQuyEWX8+PUweir6fnJdVMrFnW9zqsyKkyLQ6Q8kmGBWR7J/bjEjgjXolIZqpKj7cq0M5RPOFtv+pGOSmEBUEP1lTZzE53kcQZrtVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UvsBsNtA; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UvsBsNtA"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3cfce97a3d9so9401275ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 15:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743200098; x=1743804898; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RUbOEFaJOAbY7faqDFBOHIbC1ZRfCrfheNTZ60rM6cc=;
        b=UvsBsNtArvRdDUeYA8UGU7XjwlDQbEMdhhEvZBr3aX3UOeuHbcWFDMVauG2NjQSEIH
         I65xsCKMykFCD6ZMgGOL7Ke6isQ3ZoNtt7/hyQ26RocNyWRImmT2UXRad6HULRG0QhTD
         F0KplDBlDAJ7+ptEMXg1rxs++Dwd3d75kQr00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743200098; x=1743804898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RUbOEFaJOAbY7faqDFBOHIbC1ZRfCrfheNTZ60rM6cc=;
        b=e1guPl0G5O0PBlsb8bNFggLHyg9xFcPnv81xgHAqkI/LjRhvEHyaM46pmJz6PojACA
         aPElRgGt1TmZ9pKPI/zw++b2BY9Anxc5MGOOj+qK64Ca1hZztGXOfslpnnFOmOvXE3ip
         zsnsLxVQVCr+X2AGEq9SlpMm4XvyzrLBkgI9MpteDn53llS19wTv+yeqf7zmR1RldW64
         1UB5YJRRzxhQ+oaLOAr/SDxKqQBHPFoavz7+8IKx/gF8Py44FF2OuQQHEm3Uek+OdjPI
         by/fSLIwsKDBiO5eim7ZBZ6tcPtSzww7Gw4s5z5X4qFP2TSOKb8pQ+fzc4fzqnthAvfz
         HpRg==
X-Forwarded-Encrypted: i=1; AJvYcCUKsBfwEDmlbdpJRB8bBGshbJV6I4RDgqEBEMaA4Yg6ZVJAHvIJW/tmNExlqVn8fc+1akDVfWTO3pMA4lo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN+myUmpgcpSPBMldG6iLrqkbJ6SQwpm4aTcni+zjvKZ4swdY0
	7zpVqGU5s8v/eOVCsG9IT+zOI6ciEvJZzlVil8ry2NKz5n7UwX9DSdTpN7M4eKs=
X-Gm-Gg: ASbGncvJKkQRq0q73Fqj30Fn/nz9uv8vsTmU6zXolxBUacawHL1tt9Kn1a3JMyVZuEl
	6aqdK+j39/yPAMHb0EDFEI9Kidpgm9iH3XP4+TnbNIeeL9SbQRtjGfb/7X5Pafv2J0mv4p12sb0
	hn1c7d0zoVRR8Qh2kafPw5J0aMmonUnvH7VugZbRNe66UJKbB+cs9Y6lh6keW2PdoS6Z0Bk7d/y
	myBPEJ5g3KY8namrQ205ueDqT+gyvTq3U/+Nar5zrBwtfyYc0n1zUzUQ0wXmSrSBlqSUhjcUXpb
	0LodnuHHXIV8/fOwLXIf8AlJn/2nPI/UGJi+x0jTMlIajvKQDnCywJ4=
X-Google-Smtp-Source: AGHT+IHAgQaNQm7V/HQ9xhZOQz/Fs6tsLI4+HRU2b6hOJkb/FR7IJnx7J0M2QjLjv4gsNmH0eGf+NQ==
X-Received: by 2002:a05:6e02:3807:b0:3d0:47cf:869c with SMTP id e9e14a558f8ab-3d5e0a004a5mr11036025ab.19.1743200097993;
        Fri, 28 Mar 2025 15:14:57 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f464751ebasm643215173.57.2025.03.28.15.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 15:14:57 -0700 (PDT)
Message-ID: <a998f3fa-495c-4165-884a-a11c5cb61e96@linuxfoundation.org>
Date: Fri, 28 Mar 2025 16:14:55 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/14] Add support for suppressing warning backtraces
To: Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow
 <davidgow@google.com>, Rae Moar <rmoar@google.com>
Cc: Maxime Ripard <mripard@kernel.org>, Kees Cook <kees@kernel.org>,
 Alessandro Carminati <acarmina@redhat.com>, linux-kselftest@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Daniel Diaz <daniel.diaz@linaro.org>, Arthur Grillo
 <arthurgrillo@riseup.net>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 loongarch@lists.linux.dev, x86@kernel.org
References: <20250313114329.284104-1-acarmina@redhat.com>
 <202503131016.5DCEAEC945@keescook>
 <20250313-abiding-vivid-robin-159dfa@houat>
 <c8287bde-fa1c-4113-af22-4701d40d386e@roeck-us.net>
 <20250313150505.cf1568bf7197a52a8ab302e6@linux-foundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250313150505.cf1568bf7197a52a8ab302e6@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/13/25 16:05, Andrew Morton wrote:
> On Thu, 13 Mar 2025 11:31:12 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On Thu, Mar 13, 2025 at 06:24:25PM +0100, Maxime Ripard wrote:
>>>>
>>>> Yeah, as with my prior review, I'm a fan of this. It makes a bunch of my
>>>> very noisy tests much easier to deal with.
>>>
>>> And for the record, we're also affected by this in DRM and would very
>>> much like to get it merged in one shape or another.
>>>
>>
>> I was unable to get maintainers of major architectures interested enough
>> to provide feedback, and did not see a path forward. Maybe Alessandro
>> has more success than me.
> 
> I'll put them into mm.git, to advance things a bit.

I haven't heard from kunit maintainers yet. This thread got lost
in inbox due to travel.

David/Brendan/Rae, Okay to take this series?

Andrew, Okay to take this through your tree - this needs merging.

thanks,
-- Shuah

