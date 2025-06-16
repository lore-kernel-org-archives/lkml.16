Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433761F7060
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750084700; cv=none; b=cG2E905qyLZ9iV/vmE2k/9dMsvaLFNF9NBMsinfcf5kufKZ4JPZDftcXsX34JBB6d3D4UqA2AYqn9DFZVq1RE6EBMsFn7FTKxz83UE8jmMhW4J+r+HY2wse+7oc97FR/731RCtCSAEyRnUHZZ9nchPT6ZuUWBWrrS6ERGzrRwik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750084700; c=relaxed/simple;
	bh=UXaABHQD22K9FyO8R9mM3dQFCxIl3GBYZjPUSbcMKwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R08tBetxVZzmB3IMiY2W0f2Vcsw/qfdXS0CRfH1nQjJxYamqfUcu35zr4WxUW32p4gn1o+d3EU5SLKXmWq2Z6uJkpJ5oL+Iml5guPESzKIWc/cdzGJCfaZ+6BGYYCqOo6HoUhJGSeS1q5ri6bEtM4xoR7fYP3/6IDbrPTnYHseI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=INCtnHk7; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="INCtnHk7"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3ddc5084952so19609945ab.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750084697; x=1750689497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RaDdB7ecZw9rq7H/cB+ruY2mtDm9EqdjfLyEE/nDh7s=;
        b=INCtnHk7i6hY6jsAz4shzHWCSEKsQ6iJ13dDtEuVgk/XlTSIgsui3751au2x9jtMKq
         1rTL1NVzuJmfFpgihedliMgTwcv4PhSwFSP5rBfbO25Wos5qZvRMI07yAFiA64SAx4a4
         xIDYC0JcoCZCvEI4LOdI8DWDWtwJvxu3miHRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750084697; x=1750689497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RaDdB7ecZw9rq7H/cB+ruY2mtDm9EqdjfLyEE/nDh7s=;
        b=W8d9SFViAWHWUz8X42M7mH0kpAGw6etT+3rwW7m9kk1YpWzZEMZhOUPWhBOvJ2gtg8
         atmC4Q2+r0cZyrwmCxKvaGCRl3S2CSBoKbK9LkZAKqZeFlGdNSyI9v529nGejwgScO5y
         K7GbdZc/W1L3pt9Q37a3wIgiwVpxkueExzz9yc3AgANEIfMF7OiXZW/ZiqY6S4kLIG0J
         ea8T3SNJotxNTYHynG0wQ6o4R94SshJ+vboOaEG55diOJXZV22Fa+/vwbgz05LqAp42h
         GyNjPDy1YYugdgfXAuim7UXN2LIlkv0TMtExmquKocC+WhPzzcC/9URMS6ZRcG9ESCAF
         QjmQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6b/Af2HkGAXaLxdP5QF1zj+qKK2VJTD9DJ7ApUiQ67LG/D/+8zGphJX5hU55wrKxhH4D9NHCDu9SVmSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQv4mh/QOGpX+X2DQpPzrTIL2TgmQAT7kJnDhUMdion1X58V6D
	lAS2Jye9OnvrmpXqG6kd/c3liWUMbD8xlDg6Db32Qxz9dSgXAgQx4jqci7DC2J3GFIQ=
X-Gm-Gg: ASbGncsjUOUK+xRC7AbmpOMrhxSJw+T+oobQlvNDJ7HCAoVu/keo0RV8flbdqI+SQVj
	sLz6WxTL+xs9a+h5zkNe+GGewJyebIK9HLWU3hr/xoLQ8ctbA1KC4lhHV0u2bOEO4wnxdgOLocQ
	R6h4imQbFEM4PjO9HaCh/CeWJGs+qGMrb+hJrPcvzU9eXgDnxn8LTAOOKTAC2Sv03CFqslf2k5L
	BjkisFTzpAz7xOqVf7I2krHUasnue5rLXuhFWL7CICI5OBKVRj7nxOur28W4XvwCFh/6py+NlG3
	xcB+LSn+zeq6R46D+UFzeEwiLKYIYC/BUtfZMOnHmcpQwb7zoJWtAsDvikn0SCIC/CHoFk0TGw=
	=
X-Google-Smtp-Source: AGHT+IGp/2E6cAX4aTSkp5+1j4lVd5Xk0hzBOAiQZW5tUPxlnAfIJ0ewA01WNGRwtt7CvP7Nt/sbOw==
X-Received: by 2002:a05:6e02:1c09:b0:3db:86fc:d328 with SMTP id e9e14a558f8ab-3de07c3ef41mr106272685ab.5.1750084697187;
        Mon, 16 Jun 2025 07:38:17 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019b3fd0sm19388505ab.11.2025.06.16.07.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 07:38:16 -0700 (PDT)
Message-ID: <5e8e0f17-9a4c-41d0-854f-e73a6f5866b7@linuxfoundation.org>
Date: Mon, 16 Jun 2025 08:38:16 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] clocksource: Use cpumask_first_but() in
 clocksource_verify_choose_cpus()
To: Thomas Gleixner <tglx@linutronix.de>, Yury Norov <yury.norov@gmail.com>,
 I Hsin Cheng <richard120310@gmail.com>
Cc: linux@rasmusvillemoes.dk, jstultz@google.com, sboyd@kernel.org,
 linux-kernel@vger.kernel.org, eleanor15x@gmail.com, visitorckw@gmail.com,
 jserv@ccns.ncku.edu.tw, linux-kernel-mentees@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250613033447.3531709-1-richard120310@gmail.com>
 <20250613033447.3531709-3-richard120310@gmail.com> <aEuw7ls9hieUv_Ox@yury>
 <87ldpvsyr8.ffs@tglx>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <87ldpvsyr8.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/13/25 04:48, Thomas Gleixner wrote:
> Yury!
> 
> On Fri, Jun 13 2025 at 01:02, Yury Norov wrote:
>> This exact change has already been submitted by me and is under review.
>>
>> https://lore.kernel.org/all/20250604232550.40491-2-yury.norov@gmail.com/
>>
>> I don't understand why are you undercutting my work, and moreover do it
>> for the second time.
>>
>> For the first time you submitted something that duplicates my another
>> patch from the exact same series. John Stultz has pointed that, so you're
>> surely aware.
>>
>> https://lore.kernel.org/all/CANDhNCoJ_MmpEfyuL+JWav+NUfQDH3dm196JSE-Mv3QrPUzi3g@mail.gmail.com/
>>
>> Kernel development process implies that one makes sure that his work
>> is unique and doesn't break someone else's development, at one's best
>> knowledge.
>>
>> What you're doing not only breaks this rule. You're in fact trying to
>> get credit for the work that is done by someone else. This is the
>> definition of fraud.
>>
>> I cannot make sure that any other patches from you are unique and
>> written by actually you. Therefore, I will not take your work anymore.
>>
>> I encourage everyone else to be careful working with I Hsing Cheng
>> and check his patches for uniqueness, at minimum.
> 
> There is absolutely no justification for accusing Hsin of fraud or other
> nasty intentions.
> 
> It's sufficient to point him to your series and tell him that it's
> already been dealt with.

Thank you Thomas.

I Hsin is enrolled in kernel mentorship program and is new to the
kernel community. Pleas give them the benefit of the doubt. It can
be overwhelming when you just start sending patches. It can be
difficult to figure out if there is duplicate work happening.

Duplicate patches happen during kernel workflow. Most of us have done
that at least once.

thanks,
-- Shuah
