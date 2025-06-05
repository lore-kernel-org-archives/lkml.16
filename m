Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEBC27A105
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 18:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148346; cv=none; b=mZtjJrt+KT0ayX12DubbQF5fx4/kSXhofBWWsBADzFS2l/MrkM7ewxc2X2p5K469FlBa77k+0uzCsgVNUvyL6qw7G7RZRQ+ANCfE3TbCkQz3ObelmIU/7pr1lHh/Wh6ADa67a9nFHgc07dKtDF1afJ4k2HUckLUOsM0vMi7PfNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148346; c=relaxed/simple;
	bh=PD7YuSTb/DT/r03vM8ozZQ4W6Ib9zZrSXEzBWlswyd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hsrzyq1MCovUZp9I38tW240EbHR7aGc1xlSD+Q9sPKs69pnmhhgtCr85TWqLtCIXUpTQol7ehaBs1CcQo+eJ1VSx+wz9u2BvrEBwaiPoTC0hD0qkqwj/AKofcx9kQsdHiDLP8j6m1Y0uRLg2y8Wo6OccPY0ZrUhiffLyDGrvIxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gMeGt6vb; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gMeGt6vb"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so2030334a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749148342; x=1749753142; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9urHXe2bN5tHQsZj80Y5j/RW2HoxK004xrWJlKqzeE=;
        b=gMeGt6vblJ9px6pW61ATZIrAy/44c1yr83/iIhUjGI+Gx0ydQB42dWB1rcV/lRxIg4
         ZePv57IvZ9RkKPRMszBisdEsd/2xKksqf1wE+TCIVC9shHYzSbmrVzqRQ0nLk3JkPvUZ
         S9UZ0gbNGpBMJbS2aah5gPtdHNzcXjCmK8drg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148342; x=1749753142;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y9urHXe2bN5tHQsZj80Y5j/RW2HoxK004xrWJlKqzeE=;
        b=D6RSxjyThO/BTJyBk4sFt/FlHxypbUZdIwEcPZKRotS4ap9TrS6lfnNZDsw2XtKBCm
         MZr/3cdm7gVCT1jWeaxhKllBKMBhIcm48PxouU3NYHTXEBMm5kVEhLoXG9har9ysq58L
         4ca5MqKFFAMkAzN/cvcautnsCj4uyEfAltH81IJ0mAdA1ckaH9g3XoH8psYf+KkDh0Ih
         K7kGezGp5BxU+isvW5PU+hqldf8EXciwdUoDMvKqoV+pM4lm5YbIom867YKqUyNK8H4r
         +F4qYGEwMZwdSa/OpQ4oGY8br2ABBDDUP8cGxAbjpsmbmsodyTXiDDQ1J8ILmOOMjq5S
         IInQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkFC4JAwROBwx1p0/SpsiHzB9K6WfsDclRaNrV34sncgD97cAXYE2l4/pVyux4wqUKJp7GIwm/AF6TDqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGAcQq3LWa7wJDyOwRnqAl84J3CVO8WFF1M1orKEgLjd1xlT4D
	UWPt88pDvtzFLYJFdzNhzH/2j8CLZKeYBB6xqOaouRD2pV/IiBlmWzOBmo8vpkxrQaG7k+sRwOd
	jGc1V38g=
X-Gm-Gg: ASbGncsVk8bzthSYzqSekxTruJSo2NmLpG4A1/zRyF6kT3dq/8iHMkzv1Yxo4pfb1dr
	RjVkLC1Zh7/Pm+oSeAXfHPGs+bKvbkX7kdxO4+78dssg6tGjXeulwCjNszf6Vxjpz9rYVpfGG/P
	fZCUIKurMc3HiZWwkoujBnPVZYR4ggaYWUtMzjHR9Hv1I3CYIwCn5NoEVI4vM1lHtAzDz4TgUhH
	Ez6LjKqVfCJlU/BIQsvOqhPvuN9tPB1biqGpEVRSMPoaallO2LdcLS+Ny7XxH6XOFqHwzWX7GpA
	SxJPYw8er93i4dQREddoM15dOZi9+4fPmgoxgMCIuq8EiNmNCZ9U+xgA0+AGF73IR5IbfiM90Y2
	wbXWN03dHegdexiAdpYyygeQeS606gerCRdLV
X-Google-Smtp-Source: AGHT+IHWN4lVn3gabfN904Bw0oVixiGSeiDXkhXe5YqzYEUKihjTUuMtV4X66cxQR8oe66MWNZALdA==
X-Received: by 2002:a17:907:7248:b0:ade:403:da4a with SMTP id a640c23a62f3a-ade1aa06c8amr26637666b.45.1749148342112;
        Thu, 05 Jun 2025 11:32:22 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade125a01c3sm92739266b.95.2025.06.05.11.32.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 11:32:21 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60477f1a044so2248270a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 11:32:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPcBnsoKunzJyfnQvdGM7FMtAuTTCSRawwT/Relwy7BGX8nchXic7NFA0SOn42TdjWfdip4MLcbyJPbTw=@vger.kernel.org
X-Received: by 2002:a05:6402:354a:b0:607:2d8a:9b2a with SMTP id
 4fb4d7f45d1cf-60774b80025mr197023a12.31.1749148340813; Thu, 05 Jun 2025
 11:32:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605164733.737543-1-mjguzik@gmail.com>
In-Reply-To: <20250605164733.737543-1-mjguzik@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 5 Jun 2025 11:32:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg-+FZTCTBY79UBMc=MT1-t5EWtGOXt=kYySUmqZU4qxQ@mail.gmail.com>
X-Gm-Features: AX0GCFvnsUSPTdHW9Szh8VgHCVZhhWVCbaenV-8IfvYf0fo5SIV88rLBK3OfZig
Message-ID: <CAHk-=wg-+FZTCTBY79UBMc=MT1-t5EWtGOXt=kYySUmqZU4qxQ@mail.gmail.com>
Subject: Re: [PATCH v2] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: mingo@redhat.com, x86@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Jun 2025 at 09:47, Mateusz Guzik <mjguzik@gmail.com> wrote:
>
> gcc is over eager to use rep movsq/stosq (starts above 40 bytes), which
> comes with a significant penalty on CPUs without the respective fast
> short ops bits (FSRM/FSRS).

I have said this before, and I'll say it again: I do not want random
crazy internal compiler tuning flags in the kernel sources.

We've had them before with things like inline limits, and it's
absolutely horrendous.

If you believe in this so much, add it to your gcc spec file. Or
continue to push gcc code improvement.

But this is not in any way kernel-specific, and I do not want to have
random "compiler internal modification flags" for code generation.

We want to have much higher-level things like "-O2" and "-march=xyz"
for optimization.

Now, for *correctness* issues like instruction choices, we will do odd
low-level internal flags like "don't use AVX", or
"-fno-strict-overflow" that are fixing ABI issues or bugs in the
language definition. So it's not like we don't ever do low-level
internal implementation compiler flags, but not for random
microarchitecture tuning.

           Linus
