Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C522235054
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 23:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745970933; cv=none; b=u8Lkwq94I3P1w8d6Be6EE+mHNf3SOmn1rUv2zNNwbSwharywk+tbTXDsy1zXIBxPcXrDB0CDNx3BXvnEhDJmNWjFyMJXkZ3d6U5wVArIv42Vo23rNzI43S6dm/a4Y+ySp4+8UZLyuvmmtgfkknLjKJnm4xQ6IoLj8CDLEkp+J/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745970933; c=relaxed/simple;
	bh=4sQe6Jfa43pQKdoIOORFMeMr9zRM/xxrV9oSgaRydkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcYp5+4zTAL19qV5r5ZCiPF/atT4A38i27vk0+eWQaNh/ZgED9WtytXz3zWMbC0fhYi7SKA9JC+SioO2wjkpwmsKC9weUadKxyru1fa27chAjUcbLLQ+2uaXBJjiX0FXL/6WWhCI6wAX/ALMp3SwI7vTUh2OJfNJlq0Wl64pvug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMjcJPoS; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMjcJPoS"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2279915e06eso76143095ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745970931; x=1746575731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kb9xbHqnnf5jJZFzpxAQUZ23P9PnXIu8uEdBqbRpp1I=;
        b=KMjcJPoSebgee3mPhP1PzVcbMmUYr0ggKgvjt0qOBN+33RqBOWFvTFKjjzk80KPC7V
         mzM3PBVo3hB66SSQLgthMFKg/Ce9YZu1vbaSk5aIft2jPbuPHwMRCg6zbtonZK2kd6h3
         XbFL4b5A6my/Hd0bk+TOCUiGW3ZSrG56RUHz41TPUpcCl5pK5t+A+SG8b3rJdUo4sb5m
         NI/QpNWbKPWf5X7GbIEN3V1m9bjVKMmRn5FIAkOJe6xZ6SKZ7bqiH5q1HN36++wfQXN5
         JJwSg4OAvfapsemyQAD710rREEBzHHTDl8DoaO5fjghyqJCIkCjprr0If0qq4Pg/5oIp
         /CXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745970931; x=1746575731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kb9xbHqnnf5jJZFzpxAQUZ23P9PnXIu8uEdBqbRpp1I=;
        b=TaeovOsHruYy6ZZNewQEhbje86+AW+8Uqml/ERo0yhRxyR+yVRbQmOjdzG7YSUU9hN
         MnXhLBWJNX+hcrE5bVzTZZl+2xhxFWDqkmJZIaAQaRPJIcgsMJC6hFRIq7Gx3fT18QCx
         vZl08+IuIJsSWzqlDNMl3p30BoNlsaAnoV5NIZtZx+D0uJYWyW86hzpgYYgSAwISidHt
         36a7h6tWwYA2G7blDk7QG8UYLMFRzWz9atBmiSbNIKZflWnzXDoLFrpoLODqKEk7SvAF
         uV43uu6iUeeZ4HQyS3Pnk+p2FIdD3Njz1BxqEsLeeLNmDmXK38G4/+6EUeZNncnta/K/
         3JAQ==
X-Gm-Message-State: AOJu0YysM2h2S4bQ0xEaMYqEha2cpeadDvHfvXWBcYa1spDllRxdm1H6
	Q8VP/1SRX5oZgqGnTs3GGwlGC7/SailwO8R2RXUvFoKDfXmQxfLdLsGzvg==
X-Gm-Gg: ASbGncueBiOr47KNxygtHVG9m/ZcbAhec1QGn/ZBgKSwSDcLeRBmgR2d+aqZgYj15b8
	sdj/AcT7EUW+Q5WAW0c4ixT0NrRnD6uGX31jvx2dqxIqkN66AEP/RLxtPQsS6sTiXNJVoFVKT5i
	LcQg1+nds4TSIJDVdW5hoiDgXUOaN3YKA43kBhl96v7IkSdb8jqIuwH3RclVlb8qAjWwk4A3aVa
	HU+fTwcjrD6R2ScM4GyYrByyIFaE2kLVvWHYy9l7rPAXxw7sicl/od+LLVwpRH89RwaY1Cx8pPw
	bqepfu+mIEdCltyZtDxVgysKlCqYA6wKX+noEybc7S3KeBNfzZPCKg==
X-Google-Smtp-Source: AGHT+IHzvtNAgOuKHoVJVunwSe4SPexNrqTsw+M85p7kkLITGgGRwkWR1fB/v/hlxhPjyXDJGiQw/Q==
X-Received: by 2002:a17:902:ecd0:b0:223:619e:71e9 with SMTP id d9443c01a7336-22df577e4eemr5876315ad.11.1745970930742;
        Tue, 29 Apr 2025 16:55:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76bdfsm109920375ad.31.2025.04.29.16.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 16:55:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 29 Apr 2025 16:55:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Linux 6.15-rc4
Message-ID: <1dcded94-6576-41b9-bf6a-ca51e49ba35a@roeck-us.net>
References: <CAHk-=wg8VMvbaq6EECWxP7OcrGtUmauFQCjeLT24pXh-H=o-4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wg8VMvbaq6EECWxP7OcrGtUmauFQCjeLT24pXh-H=o-4Q@mail.gmail.com>

On Sun, Apr 27, 2025 at 04:16:33PM -0700, Linus Torvalds wrote:
> So let's see if this rc ends up avoiding any silly issues - things
> certainly look pretty normal, and there were no hurried last-minute
> changes this week due to system upgrades. And the locking mishap with
> local_trylock reported by phoronix (which didn't trigger on all
> compiler versions, so you saw it or not depending on what compiler you
> used) also got sorted out.
> 
> In fact, we seem to have reached the point where much of the
> discussion is about future changes. Which tends to be a good sign.
> 
> The rc4 diffstat looks pretty good - mostly flat with some (untimely,
> but still fairly small) openrisc updates and bcachefs
> case-insensitivity patches standing out. But the rest looks like just
> a lot of tiny fixes.
> 
> And by "a lot" I don't even mean anything excessive - it's all very
> normal for the rc4 timeframe.
> 
> Please do keep testing,
> 

Build results:
	total: 159 pass: 158 fail: 1
Failed builds:
	x86_64:allyesconfig
Qemu test results:
	total: 635 pass: 635 fail: 0
Unit test results:
	pass: 594138 fail: 0

with the known x86_64:allyesconfig build failure.

Error log:
x86_64-linux-ld: kernel image bigger than KERNEL_IMAGE_SIZE

Guenter
