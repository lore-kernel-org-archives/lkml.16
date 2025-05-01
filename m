Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2373E1EA90;
	Thu,  1 May 2025 12:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746102887; cv=none; b=lmBLhwi7wpu7JmmdqzBr71h5F8CUDfJ37bE/IZTxVeG2M324/gwnQ3vOB6XFRR+Ec1NuK9BXEuwSEdmLJqX0TrRDjrbu5lIE0KRulacVQECEHzdTv0nH/5A/joEuFaUk7lDIxH1GxFjBP7CerDBpy9Uo3rRlYGG+l3QBlREyCsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746102887; c=relaxed/simple;
	bh=5/47oM652hn/79kxkr3QT8Z0GJypWAqZvYJH2zuujRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A3IfZBeJTuoMSjiPylINc5ctZ+y4cGXI8iAIxeapKLn1ULb3rfEHYG+95s/qwP1tYtRuTh3fFI5NNA8oGUn6FA+8bJsouSKTWe/jI4u+O3OEkUMj/yuBQmrVSdWRVit0Ev9DgUfPVeAq+jCX0YHkigFs/3eN4UUAILY1LfND42Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJnQviWh; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJnQviWh"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-309f3bf23b8so1148770a91.3;
        Thu, 01 May 2025 05:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746102885; x=1746707685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9NV21R/zc5PuT2I2keLkWswBwHpgakQpo6sbiCsHEjo=;
        b=HJnQviWhBNgAwdnvf0lLokd4d5tfRLP2IqhUV5i8uRud+eq1/H4L43lzuuZ1ISUpYR
         2TChI7NYBvF4jzcXLcOPRQ5H+5aYgWD/E/jP7YYaSPpNESTLz0iN7AjiwW1zc2B2MKBE
         n1NwOe60THAE11YdWjM25SJaQYWN/sRZKP0QyOPULHIxI6cgD9F3vAia/oxf9pvbFc+u
         TjISNvdcx/Ku59wpouns0IUYS2pepPAXEy4kKlW4xafyAUdQPzxVFzfdN9TdW2+RPZvk
         2SieNkCyFVgTSLecPlD70n+hQGbMj3eJbE40ny2mOgIaV+m9G3aEYlZm9zWoq77vFZ79
         l2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746102885; x=1746707685;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NV21R/zc5PuT2I2keLkWswBwHpgakQpo6sbiCsHEjo=;
        b=AEdGHlfkTfZf0saL6BM0hJImXHU/aOsBLO9OwXt2F3dqSnelyvSlsqUyZNEBhpzV4Z
         bUKhd6JQR0mXArQyLX0lXf/w+PwMQArxPHCkVdF9xUrtPWjT8B73VLVH6tyf0Z/Lc5UN
         lLznU6dHY1GZvWKSdWREZCtHPUdVuAbNyau+oJJyFVza3cAoqCXJN8dCjwYjYFl3keRB
         tJHyTxsIZiKPumR+uvan0/Bod2O2T879BSrV+bx861GBMDaCbnHAQ+C6yE6dio85i5rV
         6iZAxfojVsoaZQGBKQm+ytA+gbNbVwTszhP+kX3l71UA352puQOzmjAj4WLbv1nK0ktU
         bauw==
X-Forwarded-Encrypted: i=1; AJvYcCVXZRk/8NkjZM3klq2ctvyvLBRrjF2vWAooYqNWeDbXB+x9/0RnyplJGkEYkZF8wleFi0X1kkygckA6Btyd@vger.kernel.org, AJvYcCWVKNv81/+T31kx+NM4rH+o57wHbC5+ji6hQD8CXk2+OiVJO7wF/HioOlaP9b/SqgXDyjjA00v3zec3Hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuUGD+kTC43ZD91Qv/UUYK1hDpqgYzFyW1RVJSsibUz+iizken
	w0OjG1UVlOK5lTL7UulQBjSTbaoVhzyom2ay9D2OdrRPfeYQMB6n
X-Gm-Gg: ASbGncsyQQLLwJhS0bURElYKgiOi/Y4vbc9FsBX07uAmF55LF0kyoZYhKAKLLbCPMj5
	lBdxlxRQlXDHSHfQxb1cGnWcYdMLKPo07gb9kAabOxJC/OZ2xZJsueA0YINmVkZnu1p6x9kQ3R2
	SS+y4d33Xk0lC/nVszuxNSL57dSPE4Xki5pWyOAmYwt2sUy2RHfzQovMuOtF/ScriNtNMj0eS5N
	wC3qPe9DzGyR8oYy/lvxOXgyR1FMe9lp3mxyqdRTMyyAoZOB66fNw2yGbUW/gOSuKxdwnrT5fSX
	5Nqb6Y7RNzcrCToMat95hhdMoMAld16YLJxMR7NulUUL/AX++pMbG8isxzjEdyEGgloVGgQGYQS
	PpQmmf9MMNegeWg==
X-Google-Smtp-Source: AGHT+IEnQGcndxaGD6Yafmcj4g+I7fwdfOqb1Itql8MMJVBaPkwsGQLl+wQHPp2bvW8Dsgrk16zgog==
X-Received: by 2002:a17:90b:2247:b0:2ff:52e1:c49f with SMTP id 98e67ed59e1d1-30a34467cbfmr8555216a91.26.1746102885196;
        Thu, 01 May 2025 05:34:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4747749dsm739921a91.18.2025.05.01.05.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 05:34:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1e5fc32c-04dd-46b1-8943-03fd9370bfdc@roeck-us.net>
Date: Thu, 1 May 2025 05:34:43 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (asus-ec-sensors) add WARN_ONCE() on invalid
 sensor index
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Alexei Safin <a.safin@rosa.ru>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
References: <20250425200051.2410-1-a.safin@rosa.ru>
 <CAB95QATm-iNJokfcSxpen3YBbx6xNUrecELD44squoaqCQ-b7w@mail.gmail.com>
 <8dec9c47-d13d-4e59-b1ca-fcb9e3beccbd@roeck-us.net>
 <CAB95QAT4JJFYiXviJB78KELFnsitDj=Zb3EM_1F8uqiRHMwBhw@mail.gmail.com>
 <38c7114e-3ea0-4f4b-bb12-5715c992656a@roeck-us.net>
 <CAB95QASErsOGibQ1+kB2LjNr-v3-KS86w8KvGLurB67D_4Bt4Q@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAB95QASErsOGibQ1+kB2LjNr-v3-KS86w8KvGLurB67D_4Bt4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/1/25 01:07, Eugene Shalygin wrote:
> On Wed, 30 Apr 2025 at 06:13, Guenter Roeck <linux@roeck-us.net> wrote:
> 
>>> Thanks for the explanation! I'm still not convinced that such a
>>> generic error message (without the type and channel) can be of great
>>
>> Feel free to suggest a better one. Maybe I misunderstood your earlier
>> concerns, but it seemed to me that you objected to having a message
>> in the first place, not to its contents.
> 
> The only two conditions I can imaging to trigger the log message are
> hardware and/or firmware change and RAM instability. In both cases the
> message is not helpful: for the hardware change case I would need
> sensor type and channel, for the RAM-related cases I would need to
> know how often the problem repeats itself. Neither is possible with
> this log message, and therefore I'd rather log every time and with
> sensor type and channel.
> 

The message would only be expected if there is some programming error,
where is_visible does not correctly disable non-existing sensors.
That is the situation the messages try to catch.

You do have an excellent point, though: The messages should display the
sensor type and channel. As for logging it every time: No, because _if_
there is a programming error it would clog the log, so once is enough
to tell "something is wrong with the code, fix it". The same is actually
true if the hardware changes "under the hood".

Regarding RAM errors: Those won't be caught by checks like this. You'd have
to litter the whole kernel with checks at almost every line of code
to even have a remote chance to catch problems like bit flips. Even
then you'd still not catch cases where the code itself is changed.
Even trying to catch that would be futile.

Thanks,
Guenter

