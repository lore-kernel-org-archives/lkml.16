Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5229B2376E1;
	Fri, 30 May 2025 17:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748626175; cv=none; b=JqK0Kuj9o/tgcXJFW0eUeJvuccTktybz6INT63ZdFO44v1eySl2McFswyQ6x8BOBI4Sfle6VRhuFi2bKK7S3fYMzliV8FYuCpkwgR4DymBV2nyi/5KjOvUoCoxigUnJKl16lBxGh4f6hmecuJ9Udf4BDNnJ54623A8/7XW5dF28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748626175; c=relaxed/simple;
	bh=ZfnjKIrTe1ZNcUBteiFSjif9wWN0w0CxKPKVDLLztUY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LGmIya3qI8GUrKQcwtyiFEBKyyakwdybPeQw65AxID1WHc8+EpbUV260JZhnBBPumus1ZxlqwVDZ7tJ0+8itg6XPyO9d6AQK0bx/VlBGTT4voFBaz7GUTYGmS5vo99x8yryW1BzPdlDA5nGuoBQ6i2rmYPhLqS1PuMTVQ3Asd8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iP/jds4e; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iP/jds4e"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-450cf0025c0so16336435e9.3;
        Fri, 30 May 2025 10:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748626170; x=1749230970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kTqSaYFhxmPnPDIx8N60bwH3vz7CB1aufj4HnoWFO/w=;
        b=iP/jds4eRFqf7R7bBqpvK8OeRDIvFm9UbI87pZKjw9Aa7BBTCuyLvOeQ8p+7bRnEt5
         qSpig/JJJkxVd0+LFduxTg6IrGPYf1WRjcwSqFnRberj5/D+YapXQNSF/C0nGQH1WjvH
         hFfJHAjEW7qC2kVVl0XwL9eu2gOMsjRq/VoS/mB1LYRR2gHlKsPCUygpC+GErNH0t7HV
         Vu2dHiv8PeVD6bPxH6AeX6CKS4L7qKXtqJ9pT/bEWJnD+8RtdOiQMhJtH0Ove+4hcFWj
         DbWqNt1Ih1SYeREMVLO0G0PaW3fVzb56CUpaa/GEOvvgCRw8SuHaYNQ9Sbl4891lJFgY
         TpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748626170; x=1749230970;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kTqSaYFhxmPnPDIx8N60bwH3vz7CB1aufj4HnoWFO/w=;
        b=HkVT+rWlE1MWfqqUHWpVL8OjB7KnPfVSX7U84+Y91/NLqb8moWhmFbBAyLtJxVD6rB
         6H8nkyA/GipnlDjbu7qF5FDY1hap9AKag5JOgCizsg9JWXavvdHLLP7pJNsz8xXQ3c9b
         qhSMNPmv1ccUgKiiX+B9p9pvn7k/z4cV/sbB062ngq2wW4tMkjf8ksxucq5hqoi3vmob
         xkohRrJsmGLclAZ3z2DVJnsp7KVqf2G0ANyIPlVGI7xqTwKbU0uirLvmL4Kzj8U0Kd1d
         PFmXCv+LY2lu5XO3c9rSc3RqHArO3GlrjOasOj/8QCd52i0gZ10Bjzl96ej5Va8+CvpN
         Un1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXlx/yGHMFs6azDtMwd5cjnnsulR5CizhbdfpizbLjTCwDezYW7ItXL3K/NqeIy8hg4OerG2qbyxmpzpvc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsdbgRs+DLULW2S1oTHZpNYeb7sHUCtI1zzPM78GhAq/HJWo0u
	fZV9BJ6DPL5ocV6J3w6CA3anm7Kbr7d2GhR6xec0S6298oCLgDl1ePn6
X-Gm-Gg: ASbGncsmj5W6MlzzTWyhYzI4DutIAFb4N6ZbzyCfyRc4z5xfgr5JtOTlWoKKHB3XvX5
	18JhEiYqBxVZFREMVyHQb8DLhXNjRIWITBVYywex/3WoUUzPIoa/OTHZp5NJKnuxQSzB5Bv6lkA
	wVn6RN6WEdDuQSLGuUAx3bHHdNBfMdCiPxi6nrDOhZVr4eUTZR0XxKxddUMQOHW/uBl0/yVOBe1
	eioA7KBQSJ/SoU6o+O9mrlZGavaaW63mzXew27xHxoh4uQtg1i1UIDl+irYdqXk4MXMI3rw8l4E
	DBV/E4Z72SwxMg12KvixCT+Gu4v7JGhisrpIQzFwENOBV6V4PvNXlOmXOg01FqcnLT/mEuu7dMM
	=
X-Google-Smtp-Source: AGHT+IG8O4eR9vyR/uL7chE+cHzQPnEmC5TDofABoyyQdCiMidjjMimmgQSHJ9Ok/LZAeHwoGjcUNA==
X-Received: by 2002:a05:600c:1d85:b0:43a:b0ac:b10c with SMTP id 5b1f17b1804b1-450d6590786mr31321355e9.26.1748626170349;
        Fri, 30 May 2025 10:29:30 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:cd68::171c? ([2001:871:22a:cd68::171c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00a0a96sm5384447f8f.96.2025.05.30.10.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 10:29:30 -0700 (PDT)
Message-ID: <96891e54-8614-4f98-8a98-ad90f18c8e43@gmail.com>
Date: Fri, 30 May 2025 19:29:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] misc device: support device drivers
From: Christian Schrefl <chrisi.schrefl@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org,
 rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250530142447.166524-1-dakr@kernel.org>
 <9e0acb35-7d10-4a8e-b5c6-968d1310146b@gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <9e0acb35-7d10-4a8e-b5c6-968d1310146b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 30.05.25 6:37 PM, Christian Schrefl wrote:
> Hi Danilo
> 
> On 30.05.25 4:24 PM, Danilo Krummrich wrote:
>> This patch series adds support for device drivers to the misc device
>> abstraction.
>>
>> For design details, please see:
>>   * patch 5 "rust: miscdevice: properly support device drivers"
>>   * patch 6 "rust: miscdevice: expose the parent device as &Device<Bound>"
>>
>> This patch series depends on the pin-init series from Benno [1] as well as on
>> the misc device series from Christian [2], with UnsafePinned replaced with
>> Opaque, as suggested by Alice, since UnsafePinned may still take a while to
>> land.
> 
> If you want I can send out a new version using `Opaque`.
> 
> We could also add a type alias like:
> 
> type UnsafePinned<T> = Opaque<T>;

I forgot that Opaque doesn't drop, this would not be quite as simple,
but with a newtype with a `Drop` impl it should be possible.

> 
> That would then be removed in the `UnsafePinned` patches.
> This should make the migration simpler.
> 
> Cheers
> Christian
> 
>>
>> A branch containing this series and its dependencies can be found in [3].
>>
>> Thanks to Benno for his great help with pin-init!
>>
>> [1] https://lore.kernel.org/rust-for-linux/20250529081027.297648-1-lossin@kernel.org/
>> [2] https://lore.kernel.org/lkml/20250517-b4-rust_miscdevice_registrationdata-v3-0-cdb33e228d37@gmail.com/
>> [3] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=rust/misc
>>
>> Danilo Krummrich (7):
>>   rust: types: support fallible PinInit types in Opaque::pin_init
>>   rust: revocable: support fallible PinInit types
>>   rust: devres: support fallible in-place init for data
>>   rust: faux: impl AsRef<Device<Bound>> for Registration
>>   rust: miscdevice: properly support device drivers
>>   rust: miscdevice: expose the parent device as &Device<Bound>
>>   rust: sample: misc: implement device driver sample
>>
>>  rust/kernel/devres.rs            |  27 ++-
>>  rust/kernel/faux.rs              |   4 +-
>>  rust/kernel/miscdevice.rs        | 341 ++++++++++++++++++++++---------
>>  rust/kernel/revocable.rs         |   7 +-
>>  rust/kernel/types.rs             |   8 +-
>>  samples/rust/Kconfig             |   8 +
>>  samples/rust/rust_misc_device.rs |  73 +++++--
>>  7 files changed, 350 insertions(+), 118 deletions(-)
>>
>>
>> base-commit: d5e34ea41dda1500a4dc163d6e96395fe7adc681
> 

