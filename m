Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E4C28033F;
	Tue, 10 Jun 2025 08:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543334; cv=none; b=T+Y7V2wg/ntNmTat1R1pZ3w3uaKTgG899c2oQU5D7+CWbTifzSymK+MwfAHnkdw8z5KKbIo535L0khypzOZHYDr456D0gXT4cS/ZQiZXrvY9cQlZ/Zsu2GAWXqHA1VS3f084R7qcmt8NEDq2yT07sfTUjDzoPNBbDMbhl81b9rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543334; c=relaxed/simple;
	bh=8q60IfHsdFA1WbbUEEE/3BeR/HOQfZE1lLoqh03xmek=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=SZEf33u40Z2tkd6iSwDhmpixQYrRIAmOVP02Elj/+y+6TPJw+iyKo7E3LNIYF2HBZekohYkSYXz/baUjzadnhXXdO/T1/+2AXa1EA2cn/Lf2H1pVmLl9j1oQfqr151PFPXl4cEj/XCAUlwLNKkxU7WTY5oQGWRCCTC8Kdm2LlhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCpjdMTi; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCpjdMTi"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso6105203b3a.2;
        Tue, 10 Jun 2025 01:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749543332; x=1750148132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y3B8a4Fsb8BKyuSt4okFUkT2d0oBx0YNbn4bvTYKUOg=;
        b=CCpjdMTiKK6DTXosy0cG7clhRwKBK8jkUK65rZ8IB/UwrcgjC1lffB9sJZmXfW9pso
         1vp+0wHZ+meL4+OFLWtAhcIF1w36DoxjngZaF0P7ZT+mNW/1FtnwgSE5q4JdN3rZRYMG
         jueFIl1sYD9Hp6MkntBTtq+a8riqEFJpi/cGZ6qWFcHPzCDzzQ4crdNL9q4fX9f6yz7l
         ots/Yms27l6XBhDoPcG7T1OTmU06iulYf/ENXrQinVxRNItH3DfGQLlLkWtnBWFDsNvU
         NeHITwAESTUpFSIgs4u0bvn0oaSDvcpoikQWLgkjljMy/+JpD2FHLZAJ2HvXiumD6Uyb
         Z0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543332; x=1750148132;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y3B8a4Fsb8BKyuSt4okFUkT2d0oBx0YNbn4bvTYKUOg=;
        b=fjf5oKEjfeNAf9tL2PvXziXXhHnedcuCw7afSwTnqiZImvHT+8+rnfajo0PbheEQD4
         uv4PunyMC8pdHXNf9dEWh3Muxw4mi5ikOdKvkz8fIfCT3hLvNbSIHKqHLPFTyLrioZlj
         4Tm9RjviA2uIWhVWj/ySFaP5N0TwwPYl09EnJQHaqXNwguC0Au7a/aqaDLMzf2UEj5DT
         rBGXri+1vH5pbByM9tt4aE0VPJ8VhD4iKRqGidX3tsfoHMYdv3DnOBvVo/7mf4uQQhIL
         1aHaNhjxpARof7NHmlyVooazKjECHZgsT9ieMxjgfblX9RmY/eiLpfhjGO2LvYicXBT5
         ZpTA==
X-Forwarded-Encrypted: i=1; AJvYcCV+8Q7ShcwmftWql7asKv9ZqU+n6oC1BeH7zHyqWs0yPSQkbVkJNN+c4MzjdbFWnogv+zQUxMM9RkNbMwg=@vger.kernel.org, AJvYcCVDntj1Z1GXYESvg7m6dB8Fc5rV13HM4hC46GwageARNzojFSXoanE68KdxgRJlUB9KqPm+uMvtLdTyuilLLq0=@vger.kernel.org
X-Gm-Message-State: AOJu0YySjQM9sj8oAhsVIWJbdMfKXzJrVQjF3M3jZHcyWpl2c61ly2me
	nUaQhu7W9ZlExD4GzNHTZwb35MQIs+Z08HXH3tsLNL4Cc0Kn+vQCfgQAx+CHLpKx
X-Gm-Gg: ASbGncvrg8bvCl3Zl7UOG1JqWSJwSTJ9ZVYXRkBHfP6lbPkxEr+jzJMfk429qaulE0e
	ayP5evPcOCxpyEz/OE+j0VV7gFEVgnycXFGxyHngZPdVN5jJKlod4Rkz5yWMHSHSYDoMR6y/4km
	aksy78qYZf+qE2ckkMi0OycJkkIWPcSE3tYEef8mTtjrfVXsjK+7MCdoCKLC/XSUljq9knRioJm
	8HCkiCNa6rc3FE9MTbgGAJEvfg4jF8LeoGFUz8ZFV4eGrITObfQp4WSdq1SCg5HsbcU+st+5hjv
	b+Sf+6r3LMWM8Zj0joAL9eFPxVP0c1aaz+NSKQI0iMCqM7lNc//QhCQxYOUl1CPHufeUXOnnLxY
	Xx2lYh6XFpMzai9tJNUQLtKI2uHC7gbyyOQqIlx2O
X-Google-Smtp-Source: AGHT+IGsuPhvBxp9ieu7lUDRme9H5ZY4I7e/Mz3z/LqkXkYZtFqt3O2tOAADnzsAc3Dakd6Cw0qThw==
X-Received: by 2002:a05:6a20:3d86:b0:21c:faa4:9abb with SMTP id adf61e73a8af0-21f78c49b90mr3311557637.20.1749543321852;
        Tue, 10 Jun 2025 01:15:21 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af3859csm6960783b3a.36.2025.06.10.01.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:15:21 -0700 (PDT)
Date: Tue, 10 Jun 2025 17:15:06 +0900 (JST)
Message-Id: <20250610.171506.1930082951902279512.fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org
Cc: fujita.tomonori@gmail.com, alex.gaynor@gmail.com, ojeda@kernel.org,
 aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 boqun.feng@gmail.com, dakr@kernel.org, frederic@kernel.org,
 gary@garyguo.net, jstultz@google.com, linux-kernel@vger.kernel.org,
 lossin@kernel.org, lyude@redhat.com, rust-for-linux@vger.kernel.org,
 sboyd@kernel.org, tglx@linutronix.de, tmgross@umich.edu
Subject: Re: [PATCH v3 3/3] rust: time: Add ktime_get() to ClockSource trait
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <874iwo3tze.fsf@kernel.org>
References: <-OrPPXscT_4STsX2CDg5ki77Lz68HLwGbucr-EZuMsTXhLnEdyuDfskI5daZYIwNuMJN_CBXX-gW_RLrw_H-aA==@protonmail.internalid>
	<20250609010415.3302835-4-fujita.tomonori@gmail.com>
	<874iwo3tze.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 10 Jun 2025 10:01:57 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
> 
>> Introduce the ktime_get() associated function to the ClockSource
>> trait, allowing each clock source to specify how it retrieves the
>> current time. This enables Instant::now() to be implemented
>> generically using the type-level ClockSource abstraction.
>>
>> This change enhances the type safety and extensibility of timekeeping
>> by statically associating time retrieval mechanisms with their
>> respective clock types. It also reduces the reliance on hardcoded
>> clock logic within Instant.
>>
>> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> ---
>>  rust/helpers/helpers.c |  1 +
>>  rust/helpers/time.c    | 18 ++++++++++++++++++
>>  rust/kernel/time.rs    | 32 ++++++++++++++++++++++++++++----
>>  3 files changed, 47 insertions(+), 4 deletions(-)
>>  create mode 100644 rust/helpers/time.c
>>
>> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
>> index 0f1b5d115985..0613a849e05c 100644
>> --- a/rust/helpers/helpers.c
>> +++ b/rust/helpers/helpers.c
>> @@ -39,6 +39,7 @@
>>  #include "spinlock.c"
>>  #include "sync.c"
>>  #include "task.c"
>> +#include "time.c"
>>  #include "uaccess.c"
>>  #include "vmalloc.c"
>>  #include "wait.c"
>> diff --git a/rust/helpers/time.c b/rust/helpers/time.c
>> new file mode 100644
>> index 000000000000..9c296e93a560
>> --- /dev/null
>> +++ b/rust/helpers/time.c
>> @@ -0,0 +1,18 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +#include <linux/timekeeping.h>
>> +
>> +ktime_t rust_helper_ktime_get_real(void)
>> +{
>> +	return ktime_get_with_offset(TK_OFFS_REAL);
>> +}
>> +
>> +ktime_t rust_helper_ktime_get_boottime(void)
>> +{
>> +	return ktime_get_with_offset(TK_OFFS_BOOT);
>> +}
>> +
>> +ktime_t rust_helper_ktime_get_clocktai(void)
>> +{
>> +	return ktime_get_with_offset(TK_OFFS_TAI);
>> +}
> 
> This just caught my eye. I think policy is to make helpers as much 1:1 as
> possible. We should not inject arguments here. Instead, we should have
> just one function that passes the argument along.

Indeed, you're right. It should have been as follows:

+++ b/rust/helpers/time.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/timekeeping.h>
+
+ktime_t rust_helper_ktime_get_real(void)
+{
+	return ktime_get_real();
+}
+
+ktime_t rust_helper_ktime_get_boottime(void)
+{
+	return ktime_get_boottime();
+}
+
+ktime_t rust_helper_ktime_get_clocktai(void)
+{
+	return ktime_get_clocktai();
+}

I'll send v4 shortly.
