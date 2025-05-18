Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A722116EE
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 11:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747567837; cv=none; b=ZMFxU990XAMLlryyW79HfvCKnGZZfIk08UJoZ2zIOLMYWZmws1s3TpGrMJCqiBasUbfB7xG3i0NmXyTYKFg2qh6SvQF/l0wMzcWfCGRAJHKqQ+r9lArXnabmjBPTQRpboXYyDmy9fYy19QqTq6pAQYp/655B5q3zkAHKiC2G9oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747567837; c=relaxed/simple;
	bh=jkdiG0lJ94nElrybyviFXtXTYbeXbXBXBnbvmhZs2hU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G2kG9/wx7um9D2H4TGmjDbvgdHgSgBtEKTEco4xW5OQVf6JMTBeSlcWcU0eTYy3Hd4NspWWEBC71PfDk/qgl1Jzb60FxdscqMTFjUZx05c2XQBo378hfgzucYGOCHNlXhsu6xdJfiDAg5emL8zyDLpJn3j0YBmWKyRMEJQzK+UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dvu7mXo5; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dvu7mXo5"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso19958115e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 04:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747567832; x=1748172632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pBIA1MI9/yicy05NsDe+86Fp64IqgnRMLxKdcioKfYA=;
        b=dvu7mXo5TeW02fvoBHlKTWfNS8SeySbzEoyVsFudg61XYEvJyQxlHPDKDhwMEUEvBc
         MhxiuYbwi7gN+y9QLwuMLnGkCpv+sI38nlUYU72aET/T+nNqX+r0SxytqLL+B/L/M5Zm
         qjcJqJgWzIiZTfyG/VEAECIdKRC41pSFkKwl3yX1jKqaNIEmAMqAhaQWN7kUuMIdw/qK
         6OADlMBZxY6AnkMiFGn8P0Loa/vdWU9hFR/BlZ479q54WYUBTg4jQJXPtlvt4BGJHlBe
         sjNHzL84wu1hZl8XHWAYrkGFgoGJSMsFxoKhawEjctVsZAMD4eLPxKnK5NYjLR5A9/lk
         unOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747567832; x=1748172632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pBIA1MI9/yicy05NsDe+86Fp64IqgnRMLxKdcioKfYA=;
        b=qxaUbjJ0Z+gQeKaQyJOVMTB7OEZ/EuteZI7IOq3GtQCVgcux7Bg5ePEVI8flT4oMmv
         j47IphbuStRQhw+qv0DFzdB/4qZMHWBVjqNt35fHfkDeODvEXoKd8XaS9QTj75AWit8G
         JF+5WFGXPzh9vtKnh3Qtp1IwrFUpyqVBZhtLNZYg1XOVHLf3GJw3Gh17thE+L5H8m54e
         dVoO1UjU2dBfMDFOEW7JxRA/yRWzHKZm9GKSk+CQ13I0VZ+BmM89It3XZOWXYn2QdyG7
         9aDATnaVXzBh+EDEKzoBUMHEo3wCxnHJGULuyWbbsig+j9VVzl8K9G0Tr6FpOOw/TS1Q
         z+Sw==
X-Forwarded-Encrypted: i=1; AJvYcCVl7yE4kbMQrTG4rQmD3Aao2HKyRhQe+JUIkSoLwLpslub8vnYkbeIVoTFwg8oMeB51GaOZ/0rroipSLPo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7PkREppcGUlorp8vKIDSCdSbhQI2A/c17FIxazs/6iKFf9t99
	gsVOr51iApG857I1R8EpJpjPFOWdH5ZKV823ni0NLqIxw9FBRaNAwFYf3RHxu63Wid0=
X-Gm-Gg: ASbGncutjNBohaoCFhDm0kNV6NawEAdU7xnwoerkU4oPHfXw6XAbJ+gjMuGg128KK1X
	nBxhhHbjNzzyNQaRP3Vsn+VCuCReTD3DOKVIyKLgS99m7dbvIdhDYT5TQQEctb2wJwED1u8hrMT
	x2BffVu+3kZgDq99grB+R4UOtXrQv7vB5lz7xl78GeqXoPRNA6hA9bD51Aw3IYhJp6PV7N82+PV
	qTp9GerWbDCkSeBh0XzcCCjRbTGJj4A/8+/O1BXnafIZyRklcJwUrtafqJ9Nyu64Sw6Go2aqpaM
	CT/cFqDYVxBGF2UML3m1cQFpks03CFZZsVix045YgpfrUuvIIh76Ig==
X-Google-Smtp-Source: AGHT+IF34B9iB4YYbEjDrj12bkfULgsY6pZqvIhu7M+OeX0JALzMAOn3pM/55PvEI45+GQTKRphZsw==
X-Received: by 2002:a05:600c:6296:b0:43d:46de:b0eb with SMTP id 5b1f17b1804b1-442fefee254mr84736685e9.12.1747567832613;
        Sun, 18 May 2025 04:30:32 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd59701dsm99293335e9.35.2025.05.18.04.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 04:30:32 -0700 (PDT)
Message-ID: <d4810834-b10f-4de9-bf41-bc9e5cf23b91@suse.com>
Date: Sun, 18 May 2025 13:30:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] module: Strict per-modname namespaces
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, mcgrof@kernel.org, x86@kernel.org,
 hpa@zytor.com, samitolvanen@google.com, da.gomez@samsung.com,
 nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 hch@infradead.org, gregkh@linuxfoundation.org, roypat@amazon.co.uk
References: <20250502141204.500293812@infradead.org>
 <49b63a7c-d323-4b13-8a1d-11ec8f0a3152@suse.com>
 <CAK7LNATX3qGFfLASWivOTWVqRAFCcSsgwG4b2yBuXc+0YUfH_Q@mail.gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <CAK7LNATX3qGFfLASWivOTWVqRAFCcSsgwG4b2yBuXc+0YUfH_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/17/25 08:48, Masahiro Yamada wrote:
> On Wed, May 14, 2025 at 5:48 PM Petr Pavlu <petr.pavlu@suse.com> wrote:
>>
>> On 5/2/25 16:12, Peter Zijlstra wrote:
>>> Hi!
>>>
>>> Implement means for exports to be available to an explicit list of named
>>> modules. By explicitly limiting the usage of certain exports, the abuse
>>> potential/risk is greatly reduced.
>>>
>>> Changes since v2:
>>>
>>>  - switch to "module:" prefix (Masahiro)
>>>  - removed some patch noise (Masahiro)
>>>  - strstarts() and strlen() usage for prefixes (Masahiro)
>>>  - simpler ___EXPORT_SYMBOL() changes (Masahiro)
>>>
>>> Not making using of glob_match() / fnmatch(); this would result in more
>>> complicated code for very little gain.
>>
>> @Masahiro, please let me know if you're still reviewing the modpost or
>> other changes, or the series now looks good to you. I'd like to take it
>> for v6.16-rc1.
> 
> 
> The first patch was applied to linux-kbuild.
> 
> I think I can take it.

Ok, that works for me.

-- 
Thanks,
Petr
