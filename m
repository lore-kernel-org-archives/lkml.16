Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF3F294A13
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744716620; cv=none; b=c5QCKVDHYex36Eg3neEujBkf9D9XwuOPWFHOJ2GyWZWU6oGltiFq6jnTVcTH/EQDDWE8Y1cR0lNtCjrk831DzDWHv6r2IRqydjK+njaGr9R4cUbmcO4Xy2MiLH3S9IAVUJbl++f5zRD/xIj68po4pcYhQ09hANEwYva/TWp6c3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744716620; c=relaxed/simple;
	bh=ZTSZEg3ynj7hOGMHhyiQRuhRE0t2PJvwDushT7+cE04=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=V6wR2IB1JEOrlhW8z9sZzS4QWuv4pjcJ44A/ktCFY/zzjvKQFA9y50kJdZG6TWWL/iNgn+6Weyonbb9SjjVKtNPL61EcSf4NteLAftnqx4qyBRfFywemhp1lAo/u2CNyeQPLpwdLWMA5EAcHHvXd4wwCbgdmxIOZffpiQqhnPZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W/gyfxEh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W/gyfxEh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744716617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZTSZEg3ynj7hOGMHhyiQRuhRE0t2PJvwDushT7+cE04=;
	b=W/gyfxEh1Y5GLKdYiGM5N2jXTA0lFC+K/7t04l7UUdeHqrpwXg3BQ4lK7r9sN3sNM+khGR
	WyZ4mgWK9v23VFD5jC3S5gQQCbpNsswJH7Gn0OqRqIC029YefRQROCRxwYqagrFGT8CDph
	8ClAmd9l0cVXXXN/oldeLyhD1j0v76w=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-NKglN7JlOVmJOWpGkCLWPg-1; Tue, 15 Apr 2025 07:30:15 -0400
X-MC-Unique: NKglN7JlOVmJOWpGkCLWPg-1
X-Mimecast-MFC-AGG-ID: NKglN7JlOVmJOWpGkCLWPg_1744716614
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5e6a64bd1ecso4631903a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744716614; x=1745321414;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZTSZEg3ynj7hOGMHhyiQRuhRE0t2PJvwDushT7+cE04=;
        b=GlK422LEZAOMfrez38Q7mAe0el2qPeBW81G8dGKwhWb8qMN14tWJ2FXgtTrsrYt47Z
         IrFRXDL1isnQzqhmy8w6K12+EprIKT65z9vn+QM9naMWkYqFYq9FQjJskSGsQaqte4kC
         I2e+etwIhzuxZNB/t2GeyEIgX8AvRKuaPEF22VMy8J8HEHsrJW66LGplKsGpqJYIKmOr
         j64bVvtpz2+nhBNC3sIgqfsH+DFZmoz/AWM5hxaTSa5fL+CsYTVekespoFGIelRSu8Fx
         f/bZ1bomJZTZb0M5RSbTJ6OPlHuSU5zQ9tfrTYJ0xyWPUgRZ2ERYEvgBopYQSmTauV5q
         4d4A==
X-Gm-Message-State: AOJu0YwNssdRcnOf6/DIlMiz/UcZ5dxQkUMI5KN7tdcADWoNkUFhvdLo
	H0geQqv8mrvw/7By8UeWlcm/wy63ozkhNABz4Rh6wlfCy6I9xzQJSL/KAQPlu8FPIE9WgN1UL+M
	zRqfzs3K76fMo6Xy8PGbdT4gqdarukWEAVxbfV15npTrsE6KkEMdZNXmdmVjaWw==
X-Gm-Gg: ASbGncve8di0ITdWWvw/q9Qv2b59Ij7ANHhOwVUm4jyO83aGfYrxA+/AvIv099gF9mN
	pbtyCf15YJBbVJehF5Tg4zY6twtkIWg4DZANpI6+g+fjseqAGzfWm5IN2hyg5tDCz9znLYuwO1T
	zG3jJRpzeUxHDofdh1HL/aXAyPm+YGSts0r8Zw22XBFPlJ5kGAbVcHBnGQ+nJrmY4Rb2Q5rRHgv
	+bhZJq+SDJp5CuXxoav0yvfY1ecXgn94BU8qeqacFmthDm8l0QOsJ/gtPt9Km0HwzBcMqbRWQ95
	w0l9bAr6
X-Received: by 2002:a05:6402:5106:b0:5ed:5e44:90cd with SMTP id 4fb4d7f45d1cf-5f37011737bmr13348136a12.32.1744716613771;
        Tue, 15 Apr 2025 04:30:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJg1T2zGt/c3xlxN6DHLM3imOYewefdPkz7tHiuJsnsyUasuwt1RmXBHXcd/5pyXlDyPwUVg==
X-Received: by 2002:a05:6402:5106:b0:5ed:5e44:90cd with SMTP id 4fb4d7f45d1cf-5f37011737bmr13348111a12.32.1744716613342;
        Tue, 15 Apr 2025 04:30:13 -0700 (PDT)
Received: from [127.0.0.1] ([195.174.134.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f06b244sm6657134a12.45.2025.04.15.04.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 04:30:12 -0700 (PDT)
Date: Tue, 15 Apr 2025 11:30:07 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tomas Glozar <tglozar@redhat.com>, Juri Lelli <jlelli@redhat.com>
Message-ID: <4e4b9c63-1b86-4d96-bcf3-0cdee8ba7c9e@redhat.com>
In-Reply-To: <20250415110455.0Qj-4EN2@linutronix.de>
References: <20250404084512.98552-11-gmonaco@redhat.com> <20250404084512.98552-17-gmonaco@redhat.com> <20250413150540.3ZW7XJVs@linutronix.de> <fb998d03b4ecc51834bf4383a71932ca877900cd.camel@redhat.com> <20250415110455.0Qj-4EN2@linutronix.de>
Subject: Re: [RFC PATCH 6/9] sched: Treat try_to_block_task with pending
 signal as wakeup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <4e4b9c63-1b86-4d96-bcf3-0cdee8ba7c9e@redhat.com>

2025-04-15T11:05:06Z Nam Cao <namcao@linutronix.de>:

> On Mon, Apr 14, 2025 at 12:31:12PM +0200, Gabriele Monaco wrote:
>> Mmh, that's a good point.
>> The thing is: this happens when the signal is generated while we are
>> scheduling (on different CPUs), so we take a short-cut and put the task
>> to running directly.
>> This thing is already racy, so we may or may not see the waking/wakeup.
>>
>> Now probably waking shouldn't be there for the reason you said, but I'm
>> not sure a wakeup not following a waking would be correct either.
>> I might be missing something here, though.
>
> I'm not familiar with signal and sched, so I don't have anything more to
> add, sorry.
>

No worries, that was helpful already!

> I presume this is to make the srs monitor works? Perhaps it is possible to
> modify the model so that this patch is not required? Let me stare at srs,
> maybe I will have something..

Yeah, that's another option, we could have a special case just for that, but I wanted to avoid it.
But still, let me know if you got a good idea how to rearrange it!

Thanks,
Gabriele

