Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4149E1FAC59
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750084481; cv=none; b=JXFlZGMGET1aLgOs44hpD5gp5ps+HWCOQc9hC3uAnzWLJ5/L7fg4QRV2c2EMUbvRnHmArHEVuNjeMmf91D/WnX9K/OmHr39F05DSaDbIwn5L4aTMsbuK7XYrRgB/w9dBmEeeQoKCQuTHSIzps1D+Elx3umKr8QwpNPIalELz77E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750084481; c=relaxed/simple;
	bh=Wp7lzU5+Yj9+0iOBa9gILgVo4JRalw7QqSIh50BSyXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uMuO1lF4u+1SwpB9PA9CCUzD9mF6dlzJ4pwyjWkn3pYbgCgDoxB9Qe3ffR6s6m2nOwnlLIW327a3bTVkt6NoDaYJtLQ51JtOT/xaHBPApltxhg8/P7O29PkLdjHqX7A+lzw5zpEpUWSAFMww5Q5ObsIAsgs/bnRQ7Z1PC7B4Vus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=f52gPZ+p; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="f52gPZ+p"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3de1875bfd4so3868645ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750084477; x=1750689277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yAgEh06Y08KkZqg3CyCAQ7ePxZ39WZ/hqPC07deIYhA=;
        b=f52gPZ+pXtXFZf6BHiXStoym0Nuryta9L9RJhK6QBtTRpLEi5TeUVJXWmaTMujdffK
         jGdO6GKLI3rtNPFRB0Gu8B+oR6kwp+oAOin1xBusseEwA7t2DMpzF+4LVskTTeM2k7kB
         Ga5jrNQePAIimNeLhdlwSnBpPlyRBuK0DCAMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750084477; x=1750689277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yAgEh06Y08KkZqg3CyCAQ7ePxZ39WZ/hqPC07deIYhA=;
        b=adJVoK3rmx9x7aLNamKpAXXjuOfZyO6cwpn0h12sEmZs8DichAVYmtXpS1K/siiO3q
         Le9Y5lC509leI1F5DQELzILaNZqSy+BpMk5C4KUDmwgtjU9h2gn/qULijNykloQRRWlG
         RB8MZrroNZHJpZ9BpG3PBeAhDWv2ix9nRK1naZkpzgNojAZmZJdZmY6flnxfeubKSkH7
         yMx3pbA930BNQHYEZzPxc2IGy/hWMyCYurpFC5vTjE8doQYCNm0lCsyLWFbGAuEOSmYz
         XP05ncgatedyYJ2bHF4vxVXMHIraz0rhYv/oABzhWWJLRNBWC72+NhanHmXzmxgb/sms
         ewkg==
X-Forwarded-Encrypted: i=1; AJvYcCVDpierN5v2yQomoNl/AgCaV1l2ODhQgF/kOQDbzlMrD7PRLg2sEmDQ2zJMUXLGpal7atACfit2pXH2bw0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuC+N0VgA+v9D2ew4Xf48AhhLWEiunWkrawWQADhK3KlGDbjCR
	qsiTTvsVzkViDv+Es7IXTJhQr/zwnG1SvN8zW21wViEXfnsdFbiRr3MEotG/DvGb+FQ=
X-Gm-Gg: ASbGncvZ+y4WNZCC2+3uDVhLB8Pq0R7BbhLQsX5kAuLv0HY2YUnyaVyGIVgN7nX4Ojk
	JcabsgLJnYLRR/aR5KPKeiofPsEREzXUP3Y2sR2dftB5FbL63KivH6cjpKSeLZUqXUo/+EOrJIH
	CUN3194QJQM+ev9CRVv5oDh1sY8XdDBFFPeejzZfnrKdU165ooh8lg496EKtGFtwUhDNsQMA14l
	KBfE6KTCMGCP06A5wO4plyVsGZ1Ke/0xt9iAnHs5XshPUSVGovugWUsq2dgP4e19EvKOeuoxIy7
	qrwvLOsjs7rLGCDkoPF5U3ytZSbWUP4IS6tdk6RjiBIz+DLdMnn1WRlv9BjZ4EGUN2PltrXgQWd
	32yTk3XOD
X-Google-Smtp-Source: AGHT+IFWZyOfdBvtIeaX4r9KeyscEUamoohkuJbwWLO21ggJf2ui7LwN4OGcYTpGxVLP5r6618vpNg==
X-Received: by 2002:a05:6e02:1a43:b0:3dd:d653:5a05 with SMTP id e9e14a558f8ab-3de07d01da0mr111772845ab.3.1750084477180;
        Mon, 16 Jun 2025 07:34:37 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de134094f6sm9383095ab.9.2025.06.16.07.34.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 07:34:36 -0700 (PDT)
Message-ID: <385a3bc1-2c0a-4a11-a802-ad02abafef1e@linuxfoundation.org>
Date: Mon, 16 Jun 2025 08:34:35 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] clocksource: Use cpumask_first_but() in
 clocksource_verify_choose_cpus()
To: I Hsin Cheng <richard120310@gmail.com>, Yury Norov <yury.norov@gmail.com>
Cc: linux@rasmusvillemoes.dk, jstultz@google.com, tglx@linutronix.de,
 sboyd@kernel.org, linux-kernel@vger.kernel.org, eleanor15x@gmail.com,
 visitorckw@gmail.com, jserv@ccns.ncku.edu.tw,
 linux-kernel-mentees@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20250613033447.3531709-1-richard120310@gmail.com>
 <20250613033447.3531709-3-richard120310@gmail.com> <aEuw7ls9hieUv_Ox@yury>
 <aEu1r12L_34Lxsgp@vaxr-BM6660-BM6360>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <aEu1r12L_34Lxsgp@vaxr-BM6660-BM6360>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/25 23:22, I Hsin Cheng wrote:
> On Fri, Jun 13, 2025 at 01:02:38AM -0400, Yury Norov wrote:
>> I Hsin,
>>
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
>>
>> NAKed-by: Yury Norov <yury.norov@gmail.com>
>>
>> Thanks,
>> Yury
>>
> 
> Hello Yury,
> 
> Sorry to make troubles, I didn't mean to do this, I wasn't aware that
> you've send the same work and nor do I mean to interrupt your work. I
> didn't have the habit to check others patches regularly, I'm sorry for
> that.
> 
> I just saw Kuan-Wei's patch from months ago and I asked him whether I
> can continue that work, and he agrees, so I try to do something from
> there.
> 
> Again sorry for causing troubles, I'll make sure to look for others
> patches first before submitting them.
> 
> Sincerely sorry for this.
> 
> Thanks,
> I Hsin Cheng
> 
>> On Fri, Jun 13, 2025 at 11:34:47AM +0800, I Hsin Cheng wrote:
>>> Utilize cpumask_first_but() helper instead of first using
>>> cpumask_first() and then cpumask_next(). The logic is the same here,
>>> using the new helper will make it more conscious.
>>>
>>> Use bloat-o-meter to check the impact on code size, the result is the
>>> same, does not have positive impact nor negative impact.
>>>
>>> $ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
>>> add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
>>> Function                                     old     new   delta
>>> Total: Before=22590709, After=22590709, chg +0.00%
>>>
>>> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
>>> ---
>>> Generally speaking, I think this is just a small tweak on the code,
>>> making it more readable. However, no benefit in code size or performance
>>> as the implementation behind the helper is in fact the same as the one
>>> used here.
>>>
>>> Maybe more tests should be done to ensure the change is solid, I hope to
>>> seek some suggestions from everyone who has any ideas, or this is enough
>>> then it's good.
>>>

Thank you for explaining what transpired and clearing the misunderstanding.
It can be difficult to figure if there is a duplicate patch unless you
are closely watching the mailing lists - it is very hard to keep up.

Don't be discouraged with this experience. Continue to contribute.

thanks,
-- Shuah
