Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AD82900AF;
	Thu, 22 May 2025 15:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747926892; cv=none; b=e+zB4lWfw3Cv4Rr7TIgiVQbqWht7T0+mb17UNob/mhD87GfZ+ykwAgpm9E/u7z+iQWE04xP30ae2rho24wITYVH/Mtc9voVd/yxavN/G5nSi8TdIoVIWaaXHW7ylaekyhZcwZnRQxbDcFVgUEzq8DhzfCmbxgSBfLMYsUf21Aa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747926892; c=relaxed/simple;
	bh=WsxG8OORjCH2ppomC5jfk23UfoRK9sGqeuLdPN9mfNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZeAdtYAFi5SXgjQ9oo8OcdnpxlCqgdDc/lTp1JLTdCglAMs6UT7zyMrc2NxEc+MLQsHoJKJxIjpYonhB3OCfZZaJP5tEG3mq/NJYRSxIBuuf46441DxSjy4Ej6371sYwBD+zZtJE8hu3HZhbA0J2eXzAdr1RJ2Byc/bUZ6S3Mmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KVnPFJRi; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KVnPFJRi"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-232059c0b50so50298325ad.2;
        Thu, 22 May 2025 08:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747926890; x=1748531690; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WsxG8OORjCH2ppomC5jfk23UfoRK9sGqeuLdPN9mfNg=;
        b=KVnPFJRilfw7eeBMYf09YI2wOOjscz1er1H+tW6DbURjOCgdvUgVgctt0LjUgSDqE5
         wSpIcJSqmazowzDL54Q++3Q5bb7rWyKoFxotC15bJXji+3DCrTq5KZsf3CxezrNEHIoW
         mlx+G1RPDcy/w3GarvjdEysMvKXc+p+knzNQ2Ca2ORUt3KT7qwLlA8pgeCAoLXYf3aSQ
         f6pqnw2bQryhplJJKlAMlhj8My0E6TUFwlPRh5I7uF+pQc+zqFm9fdnd2H+D58gPk9QV
         qvNEO1RY5stbP3wpdxqUXYmJy0TrMs8dFwFi5wg2FF4I9BwjhdQXsl3o5MOLFphydz1/
         nl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747926890; x=1748531690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WsxG8OORjCH2ppomC5jfk23UfoRK9sGqeuLdPN9mfNg=;
        b=F5sN0+geD8LQ1LqZ/c8krEkOx+bq+McRo+GZtvFYoRO1E+JpazAbPHUVXVQEJiDPEB
         Ma8InymN1Ke95I/iLzlkXJSxmXg1DwFHmEqiQvg6TZO5JahdcMQzpsBuWriegB7Y9BJi
         WN9rmMfOxrZwqIkQdur0Akj8QyNdzDUbrV5yqPje3E/RVeswUhRU87ycvCdQEaJGku3t
         lqB9PcD7XYjkaE5Qa099Zz6E1/YChKKdr7H/6GqgkpsTaLQqZPQ0BWgbhH++suew1IHp
         I0pZDwI4wRmTRwqyPq/gsIb8KDJA2dcFM9blHA5QcDb+NmbCMU+90gYKm3PjFscXBirr
         Va5A==
X-Forwarded-Encrypted: i=1; AJvYcCWuRnDdacazf6zhZMBj8WUozoAIGOvV/t9C513DEI7jv2WdsMHGx4qH6jwdq6ID9PlPz3YFGStUlLWTDm/sY7Q=@vger.kernel.org, AJvYcCXw1fevQHW4LcCMg1lSVD6D4i3wKHbklYXfzmGxYqfkz5/7FGKHgizG+Tm11ASkElrMqhZ5r3F7teTFUO4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuprSYIalvGopZNl5K1QdgE4RmU6M5r75R7KSRNuH0eoSg+MCC
	X9xoMPZtBdlkyi8778kSP0NVTN2eAV6Q6/jSDyekJ6umhQ6wOipO8piB
X-Gm-Gg: ASbGnctlTLzdlLHyBQda8Q5zjbx18P5V//vja/vt02zp2Ik+anWZqLvUzg9MxaWTSdY
	hXRUSNnzG6rhKciPajF761El9Qdti/Z9FDpB7VTqAYRJo4Y0tMe9lDU23eqdHildrOkU5sP5ZT6
	GtY0HUs8hrkBB2bYxuQo7BPV9xU4Plieh2ZPRZzvZ98IGPzoK57mqGPgtjoOYazSov5L1XgkKe3
	gxnuw2BosPg7FE1UuE+MK98DbAg232wfdtAcHTz+1SeKCpt2Vj0+AhypiC5ul1Akk9p9ZQDDz14
	kvGRgAdJYtixus9hdLpolsYDBKhkgXw42guXir40rdigOfTeOjs4j4D5ZWvy2YuJo/R5eAhSnfj
	t8cdjfHAENX6tWh2BmeSbIg==
X-Google-Smtp-Source: AGHT+IFFHdCg2bYOMTipIdA9PaTTIsK/FEQRHO9l1ug8WETlJWK+AYJ1xQFp0K0ePyvYyX5dR5SrDw==
X-Received: by 2002:a17:903:1a68:b0:22f:c568:e691 with SMTP id d9443c01a7336-231de3149ddmr360264745ad.21.1747926889909;
        Thu, 22 May 2025 08:14:49 -0700 (PDT)
Received: from ?IPV6:2601:644:8500:5dd0:864b:f5ff:fe5c:59a5? ([2601:644:8500:5dd0:864b:f5ff:fe5c:59a5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac93besm109295605ad.12.2025.05.22.08.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 08:14:49 -0700 (PDT)
Message-ID: <95d28adf-1eae-4d33-9421-c0864933c242@gmail.com>
Date: Thu, 22 May 2025 08:14:46 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm: Fix rustgcc unknown argument '-mno-fdpic'
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, torvalds@linux-foundation.org,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Christian Schrrefl <chrisi.schrefl@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>,
 anders.roxell@linaro.org, arnd@arndb.de, dan.carpenter@linaro.org,
 laura.nao@collabora.com, lkft-triage@lists.linaro.org,
 regressions@lists.linux.dev, Nick Clifton <nickc@redhat.com>,
 Richard Earnshaw <richard.earnshaw@arm.com>,
 Ramana Radhakrishnan <ramanara@nvidia.com>,
 Linux Kernel Functional Testing <lkft@linaro.org>
References: <20250522-rust-mno-fdpic-arm-fix-v2-1-a6f691d9c198@gmail.com>
 <CANiq72mh1h8d-EWrZef=BPPtadZyHG0B+tg9GgA_RnWiETWMkA@mail.gmail.com>
 <db93019f-0a57-4b1d-95a6-ed5a6ab9a989@gmail.com>
 <CANiq72n3UzgG4BTcZXd9aJK_9+BwodRkbzewPtipi4-iCqdeqA@mail.gmail.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <CANiq72n3UzgG4BTcZXd9aJK_9+BwodRkbzewPtipi4-iCqdeqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> No worries, I will apply this one :)
>
> I will remove the tag, unless you want it there for some reason (e.g.
> because you want to point out some extra testing that goes beyond what
> would normally be done).
>
> Thanks!

Removing the tag is fine by me :)


Rudraksha

>
> Cheers,
> Miguel
