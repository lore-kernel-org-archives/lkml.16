Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00D814A4CC
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750733484; cv=none; b=EN1wsLQg6C0K29hELrr8HmWNMKnAsGtHmqqgWRH9NvXAw1Wu76yXuP0NRDb2LbynemqRkuQUtiS6LVGS9fZ79kHAElciNVgwZ+Sd9Kk23wxGQZJEUvS8iQK36k2xP4m4Pv2Xj08/y/UZjLNGERxQ+fAdT8yoDdO1RbHcNvYMERY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750733484; c=relaxed/simple;
	bh=EEJR6sXU0/BLALTA+1+eUAFyAkGYctDGzduMwikFMd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QguHmRj3iFvqgflhxhYzvi6MPWOjABaeYb7FFI5Hia+U/TLvbxEOGb1ewOTE19X9EgNNsLO6Da5QP3COdEBYLdzlOrtkhIMAh1tP2hjVZOsx8r199GZDhtNeJ6q3ROz33eNUwb3/7fpUir/VpkmsMI4XbGXjRceb/uQR+R52cEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aKW23L+S; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aKW23L+S"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so851463f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750733479; x=1751338279; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r2kkjtXLzuAokXE5IqJVyYKA9iqEVlvjjhxCskYZ3Ao=;
        b=aKW23L+S3e4mxw2sgkDS47OUSs7gyHXJXomBFL9xIl1EqwZ+t77QMyeufThnpl1uk6
         rMDeejU2jh/RicwGsLg45rqlR7ZDAPu36iXE8T8W0LqsU7UzGtYBDPObBV5/+ajrDY0r
         qzdh0j5osYuA31UXxR8I4CA0rvu092X4CLdOIO2FtLDu4OLbiQUwwQJiQRQ2SlSDgZQ5
         V8xn2ocZYxdNG9S5m+KuqQRqt5xItfLjNpCSlDEaagCa97V/KQCV+nqiSwyU3tjg7Z2N
         t0xUFCw6MjF54G+YA5Q9dcxcyaIE/MQ5tvAqtewTPcI4uy+EiMpyQ/3TV7UBxzRJjMvr
         1EEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750733479; x=1751338279;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r2kkjtXLzuAokXE5IqJVyYKA9iqEVlvjjhxCskYZ3Ao=;
        b=kHK2Mxw6FY4LHqnYjlr+xFuBUTliiKaN9N86f78Ro5JolGxCgrbSvHjqmlJX68iCWm
         v3O0vpCcTCSMYsT1pbXQ6iVhymIQ0HOvWSHaRJ8SGrEuibOF5Sm7jBSNGQ9ctTRGJJbG
         wik4WDr1PbPq+DtdLkNSQDK7HHegHc8ehzwcEX66Z+cmws2BwU+2fwM+NSiMbc3NPoq/
         bCtQo1NX9HboGsgaMLgDRuzZC2h696L4UKaXAlfjMjusd2XDsPI8w4IqOeOLHX0c7QGv
         ZJ4N03PtOj7KrRNEh44gYjtUc7h0McQiSyQVecOSrJywZw/LvV5dGOMzfCLKY4/o5/47
         TOaw==
X-Gm-Message-State: AOJu0YxKyj3jEmgBCx7pdhP0HwXzt6MmoTK1J9LDoQ/bsV8DQeTbAXio
	aQnnnIPvk7NgT7IdQOX2OF8+UAgprPBTqH8jm8KTvS80LB81bmuoFf3xZBJ1e3qWzdg=
X-Gm-Gg: ASbGncu5GLIxYY6O/IrwTBVyDMfwA3+vRSPPiH4iPvMl8E0Qwvn86Cah9B5QP3TS4Ff
	uWfxGJp8wVtGk5vsmXRGOLf6+71uZtSHAY0btkzzBuJztWDIfcPlEVthXjzjrW1oaaOwZ9POK/c
	Ehx9hhR1+ZxDd/AgCw6UU94tNQsek/NJHWmnglLbXJqeAD7Ti0zO2mVdRPuyrA0x5bXidIjCSmn
	W4Yf7GRMfakienAts4FYCnpGPmjWUOWYTZrA2kC+DkbloduKaLh+/EDYswe2X8Kf0M+2UG4PkVs
	trBfJld+vV4aIrEUWaPBJCqZbtHXNchT7bd83cE47ikoiopv2mKipuNW68cz2+cV+rHI8FO8kud
	xzA==
X-Google-Smtp-Source: AGHT+IGSJY3cPvwzUW+IxhjN3qW2fYFuXMaP6dq+d1HMtkEOnrp1h/q9v4NOKvlr1Mao5vhieQTt6A==
X-Received: by 2002:a05:6000:2f83:b0:3a4:f7ea:a638 with SMTP id ffacd0b85a97d-3a6d128bc58mr4225162f8f.3.1750733478981;
        Mon, 23 Jun 2025 19:51:18 -0700 (PDT)
Received: from [10.202.32.28] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e405a7sm535120b3a.64.2025.06.23.19.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 19:51:18 -0700 (PDT)
Message-ID: <be064737-f78e-494f-99ad-4686feb69eff@suse.com>
Date: Tue, 24 Jun 2025 10:51:14 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ocfs2: kill osb->system_file_mutex lock
To: Joseph Qi <joseph.qi@linux.alibaba.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: LKML <linux-kernel@vger.kernel.org>, Mark Fasheh <mark@fasheh.com>,
 Joel Becker <jlbec@evilplan.org>, jiangyiwen <jiangyiwen@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>, ocfs2-devel@lists.linux.dev,
 Diogo Jahchan Koike <djahchankoike@gmail.com>
References: <934355dd-a0b1-4e53-93ac-0a7ae7458051@I-love.SAKURA.ne.jp>
 <faf70481-09dd-4c7a-bd43-f1e8bec877cb@suse.com>
 <1c0f49ac-2634-4126-abcd-7859fc71f134@I-love.SAKURA.ne.jp>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <1c0f49ac-2634-4126-abcd-7859fc71f134@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Joseph,

Do you agree that we need to add a rule for the ocfs2 read/write (IO) path?
- When an ocfs2 volume is in the process of mounting, all write
   operations must fail immediately.

- Heming

On 6/24/25 09:55, Tetsuo Handa wrote:
> On 2025/06/24 10:33, Heming Zhao wrote:
>> Hello,
>>
>> Protecting refcnt with a mutex is the right approach, and commit 43b10a20372d
>> did it properly.
>> However, I don't see how your patch fixes the syzbot report [1]. Could you
>> elaborate on the root cause analysis?
>>
>> My review comments are inline below.
>>
>> [1]: https://syzkaller.appspot.com/bug?extid=1fed2de07d8e11a3ec1b
> 
> My patch does not fix [1]. My patch fixes a bug which syzbot reported at
> https://lkml.kernel.org/r/000000000000ff2d7a0620381afe@google.com
> when testing with Diogo's patch at
> https://syzkaller.appspot.com/x/patch.diff?x=178f93d5980000 for [1].
> 
>>> Reported-by: Diogo Jahchan Koike <djahchankoike@gmail.com>
>> 'Reported-by' should be: https://syzkaller.appspot.com/bug?extid=1fed2de07d8e11a3ec1b
> 
> Since there is not yet a bug link for my patch, I don't choose syzbot as reporter.
> Diogo will post a formal patch for fixing [1] after returning from vacation.
> 
> 

