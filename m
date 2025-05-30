Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960DF54652
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 03:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748577568; cv=none; b=dYY0g+nDuBWADP9h400rhA73sdwNLbYlG+9uChPto08u4sftGkunSOBPHg4Xm3i3PNqyunGJqnr3DZ95hPTv+nzySg8VBqxN4PmvMGmABMoPBqHx9dk89Nu7PJOkf51cedQf/4NmzCBvuTCdVGxUwOyEpNTPTkimkakm8wSbtdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748577568; c=relaxed/simple;
	bh=K9v1GL1QjK+Wof3wceXCVJSQqVhWivFaCdV39NTnwg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y15lpiLqVKNojFOzfxWFsNhdXdjNasZ2cMPQd7cMj9zNiLgsqYQfvhE7B0EsvUGTd2s+ieAwD9rhdYQN01eyjdOSsXYQvb7UrRvMUkv5zAvNobwosRCKOqpZ+DiHvchfSLHkZ38lQKZglxULXVAVyUwX5NRHzJS0dCv0nQ/VDcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dF3JaAuw; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dF3JaAuw"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad5273c1fd7so328133066b.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 20:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748577564; x=1749182364; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7u6516ckwzZC1b+zjRBoRu7KP/oGOxCfzdJqCCxLuQ=;
        b=dF3JaAuw5zOrayt7qO0xzhWZ2L94Eh8CJpdDpW5ndNlzaXiAFvn8BX5xMJk88d6vHV
         Zd8m+bb31nb7h3w5EExQfhQIKrgy6LTDnOMd1aMk3ecpHSYiWIcGvlwYSvEo/csVPyQm
         Jb5+m1nudlfA2tfxYVyiJhfgXfAxgk8OQBWas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748577564; x=1749182364;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y7u6516ckwzZC1b+zjRBoRu7KP/oGOxCfzdJqCCxLuQ=;
        b=dOBQsQsDul0H6WvF8cQ9UuDaAcLtkQQ0HoxnF9Q99ZS88qMLviO9nwivQXtjEPFa+S
         MpNI7MIv9wqBwgvzIpYWP6BqogiTox9yAmppZHxRGq4EXzKHjkx8VPGKdJcKgAs1Jbqf
         ZgZg4NtnVpw6vwORWfTXDnjW9ip2mjms0CAc1XoBuGfSZDdg8Imc4IrkAhGeXbt7g8ZC
         y9btZFJJmmTO7HtiaXn+MGbQyvBBZRI3X9FXINgfY17WVg7rng6fh2Vlymff1fV5JlC4
         IvkUjX/iDs5pOY+BDbiCsWFDruzfVdNcVdtdjjXx6SjY2eYzEKlmyKIrXhxbJcKfL/xi
         mMDA==
X-Gm-Message-State: AOJu0Yx3zV2H1GpE/ndEJCznWSQqTCtPV44adBpaMFYH0rlfkic519FT
	T/m33VWR0NS4uG6BoKRAJJUPOk0gsTu7HioFnuVfCdbwoQxbpU6kBzrFWZbRFUyGq6uk/9q5MRq
	vp/QikAI=
X-Gm-Gg: ASbGncuNeF09ImfehngKQW8gLTttmK9ICXLu2qAMD0lH/KIvyimL88V/WyaCR8CN4DX
	S1ufZ8GYC9gQYZrvOIjiRiTvoumwXFz3hHbhSWx7AY4mkFxRy8opv1QMq28yExALK7efztNIx6M
	KYutUiryWWF7ncBWuud4KmIMoMjaGOwV4jztIlgTPskqs/9qyLE3Gf5zYb2z0gcnTkKfsBJfVLq
	cFfX3eJp+cnRp36yQ/gd9AiSxOP7uaWesTyqk4Ulapj8W9vvTCzLQjTlnzlgHDys3W5s+9Chi8r
	c4Q4603C97rwuPW2xeGV80Tmoc78Wo9hnblLmZlklRLws0Vyz7dIPw8IOyK8p0TnGkHub6D676Z
	S7euimO9Mq3aEASnJZ/m2Sx3/zFG/UP8PHwqN
X-Google-Smtp-Source: AGHT+IH4NzdWarM6hqjq9yQUeIbImaE9M8KP6jo+XLtmIzfWtdHDs8nCCrSABy0ZpuEFaCvbSnjeew==
X-Received: by 2002:a17:907:6d1f:b0:ad8:9c97:c2dc with SMTP id a640c23a62f3a-adb36b23210mr58209266b.15.1748577563702;
        Thu, 29 May 2025 20:59:23 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad3a6ccsm248364066b.156.2025.05.29.20.59.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 20:59:22 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6049431b0e9so2364027a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 20:59:22 -0700 (PDT)
X-Received: by 2002:a05:6402:5c8:b0:5fd:c426:9d17 with SMTP id
 4fb4d7f45d1cf-6057c63e5a9mr579843a12.34.1748577561701; Thu, 29 May 2025
 20:59:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aDYMkVGnByTn6HBQ@yury> <CAHk-=whi6O47-0r=eOJHnd1ACa83Kd-aaELi=Tw4p4HwJ74q2w@mail.gmail.com>
 <aDji_0NEVRpIZMKP@yury>
In-Reply-To: <aDji_0NEVRpIZMKP@yury>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 29 May 2025 20:59:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiVQjbTrko9GDrkJxCaNhxM34ai2OsEMdFwUJSDhRecUA@mail.gmail.com>
X-Gm-Features: AX0GCFtsI1hxnTzXVjAUnMwQd9VJA3qL_TQPoMZeHjifwibF6pkvXWaKgFEcgyY
Message-ID: <CAHk-=wiVQjbTrko9GDrkJxCaNhxM34ai2OsEMdFwUJSDhRecUA@mail.gmail.com>
Subject: Re: [GIT PULL] bitmap fixes for 6.16
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Luo Jie <quic_luoj@quicinc.com>, 
	Andrea Righi <arighi@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 May 2025 at 15:43, Yury Norov <yury.norov@gmail.com> wrote:
>
> If no objections, I think the simplest way is to resend this request
> with the key you're familiar to.

That sounds good. Thanks,

           Linus
