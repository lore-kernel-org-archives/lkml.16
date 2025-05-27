Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2364A33
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 05:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748325217; cv=none; b=fIoN+wkpsGU1sw+U86kcBaiEIJtxXdiVD8Jd8MuQztWOZbJpiCs6LM7/I6UpI6mWlT5p6+hYAtwRPsLcg85nJErGoeiJVaJVHdDqIVeTmHnGOtk9pvIDErhQ3YvJDlNsjvfdpSL+jRKHkV2YX+WOW6VdXfAwqFbtonfviXGRxYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748325217; c=relaxed/simple;
	bh=Fwx61S+EF2QQma00o87uNo5F0fwpTvXldp06OhTNWiA=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jUVEO0oU5pVbV/7v/gQfbu3iNT+/L7UFQMoyJAuz/WXNUZQyMv+k25pb/3xrF7MNt6/F2VxdcpWSu9+BVVgYWG79S2sM0sD3dM0muyYJRvmF7enJjmcyAvMMhgwA1654Rv1hZ0+UW4JjA/k1t83ZvCOriIYiTk8IkR5j4ZYBisU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dd2WgWqy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dd2WgWqy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748325214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5w3lAEDxGQgozPv2Ro2ouO4POU9JnVb0nE2cwrEpKJE=;
	b=dd2WgWqye4Lx6x9gKSNWDBxMC9JLOdzv2zFNO7zl436qE3NY4+cVuwfpeRG8MWHBBtyJnf
	R+FdOvwgle36foEo7Wzca4MlOH1uXWYCiH//xcmb11R/Xp702Hu9oz6Pew8xFxAtCZY5XA
	oMaBDy3e8sWgUH7PaMFE8RqFPjAgsc0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-yVzi46ZAOseCToq5LpvimA-1; Tue, 27 May 2025 01:53:30 -0400
X-MC-Unique: yVzi46ZAOseCToq5LpvimA-1
X-Mimecast-MFC-AGG-ID: yVzi46ZAOseCToq5LpvimA_1748325210
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fa9f133c35so50287236d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 22:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748325210; x=1748930010;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5w3lAEDxGQgozPv2Ro2ouO4POU9JnVb0nE2cwrEpKJE=;
        b=d42OeWSKvBlCALQZI4jwHLMXI+w34m0xKpHP8NwTcysxyt9Pt8etmL5jgXGejd0Kr7
         mfZM1HeYxRmfx/LItsVzSj1Gd4ihDW+bNmxpBTSTKld5rAdmcBlluJdzyrFWoLfp1ZVo
         nZw+rFFMBRIK3YHwfe32lnKIZJRHrtUx7P9SaSLhU9URu7Q7O+i26nyvv+GGoySgCCaj
         9AEKutJW1v72skolCTL6lSn3rBVLztT83ea8Fs2moNZwHE1UgVVt/9rF7xGRXzY4UXZx
         hF+Qh8opTi9ElRRlKZit6czCAdXu5kFwOjnsuu+S5oKw/OnJTd9IWSYikv85OvwtzbU+
         +QcA==
X-Forwarded-Encrypted: i=1; AJvYcCWL6xx2C2b/ZuCnX5SLwyBPu+Ne1vwYdYK6m87AsjO+KBylAN1XDDENRhzYkZ0M/gBmJPOqYXLYfRng670=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXekn/uVDsxCW/WmOGgPDWbiJVG0qdrpWWJgiI7Y9oM94QRWHL
	mG8z1Wkagu3W9ucXZ/9rsTHA8qylfCoLr5OHZGn+4KWVf9xw5SDOemzViE2365dfbOiu6kWa0+w
	5dnsYATzCreZVSCqJw2bJldClNzjU+uP9Pp7AyQQ41Jh/JtNSB608TVbwbb9k0vgGVA==
X-Gm-Gg: ASbGncvs6iosPQJbxXTZqThMmbxqMCcil+jzW8q8V/oGyphcwV1ih6Or5zoyOXsyh0n
	YXwAEthY6TFeAwOg55pj4WiPSh1YvDVBrODHVYIDToy3GMFuA4OQEnAfcxgpUyYa5+lKn9vFyt1
	tU4FDnY95+gFNkrEYvUqCvbOhkxtOmaD1t6kZtADBah/zPB/qbc0rLlJQTjqNpMkqHGRdxxoDHM
	lyKReBSMwR3mOBXUgC8Z90qHiyL9WvYlikZTE0BwYhYWwAQ/Q9I0tr9dWGcHm5TRzu2a/TgKltI
	+ET9af4V+74s
X-Received: by 2002:a05:6214:20e5:b0:6fa:9b5e:f1d1 with SMTP id 6a1803df08f44-6fa9d2954d2mr183979996d6.24.1748325210046;
        Mon, 26 May 2025 22:53:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEf6cf5ml1sk3PHQjxZNbd4XuXgrqVdk79X+7MA2ctDwTZlFENE6c9ZXdW7oO/0ud2Ud0sVWQ==
X-Received: by 2002:a05:6214:20e5:b0:6fa:9b5e:f1d1 with SMTP id 6a1803df08f44-6fa9d2954d2mr183979836d6.24.1748325209750;
        Mon, 26 May 2025 22:53:29 -0700 (PDT)
Received: from [172.20.4.10] ([50.234.147.137])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6faa2599ac9sm40049546d6.50.2025.05.26.22.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 22:53:29 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <25e2293a-f49e-4bc9-bf80-efb66d87c7cb@redhat.com>
Date: Tue, 27 May 2025 01:53:27 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [WARN] LOCKDEP: MAX_LOCKDEP_CHAIN_HLOCKS too low
To: Lance Yang <lance.yang@linux.dev>, Waiman Long <llong@redhat.com>,
 peterz@infradead.org
Cc: mingo@redhat.com, will@kernel.org, boqun.feng@gmail.com,
 linux-kernel@vger.kernel.org, Lance Yang <ioworker0@gmail.com>,
 Zi Li <zi.li@linux.dev>
References: <20250527020252.43684-1-lance.yang@linux.dev>
 <c0fb67e3-ebe0-45ec-9f61-a8cd5949cc42@redhat.com>
 <055a9abd-8137-4382-9830-551961cbcda2@linux.dev>
Content-Language: en-US
In-Reply-To: <055a9abd-8137-4382-9830-551961cbcda2@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/27/25 1:33 AM, Lance Yang wrote:
> Hi Longman,
>
> Thanks for looking into this!
>
> On 2025/5/27 12:48, Waiman Long wrote:
>> On 5/26/25 10:02 PM, Lance Yang wrote:
>>> From: Lance Yang <lance.yang@linux.dev>
>>>
>>> Hi all,
>>>
>>> With CONFIG_LOCKDEP on, I got this warning during kernel builds:
>>>
>>> [Tue May 27 00:22:59 2025] BUG: MAX_LOCKDEP_CHAIN_HLOCKS too low!
>
> [...]
>
>>>
>>> $ cat .config|grep CONFIG_LOCKDEP
>>> CONFIG_LOCKDEP_SUPPORT=y
>>> CONFIG_LOCKDEP=y
>>> CONFIG_LOCKDEP_BITS=15
>>> CONFIG_LOCKDEP_CHAINS_BITS=16
>>> CONFIG_LOCKDEP_STACK_TRACE_BITS=19
>>> CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
>>> CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
>>>
>>> Is it safe? Or could this be a real locking issue?
>>
>> The lock chains store the locking order of nested locks. The default 
>> value of 16 may be too low now as the kernel is becoming more complex 
>> in term of possible nested locking orders. Anyway, I would suggest 
>> upping the CONFIG_LOCKDEP_CHAIN_BITS to 17 or even 18 to prevent this 
>> kind of problem. In fact, the latest RHEL debug kernel sets 
>> CONFIG_LOCKDEP_CHAINS_BITS to 18.
>
> Yes, makes sense to me. Bumping it to 18 sounds reasonable as the kernel
> is getting more complex in terms of possible nested locking orders. It
> uses a bit more memory, but keeping LOCKDEP working is worth it ;)
>
> And if there are no objections, I’d be happy to send a patch making the
> change.

MAX_LOCKDEP_CHAIN_HLOCKS is composed of 2 parts - (1 << 
MAX_LOCKDEP_CHAINS_BITS) and AVG_LOCKDEP_CHAIN_DEPTH (5). I believe that 
the average lock chain length is probably bigger than 5 now. We will 
have to check the /proc/lockdep file to figure out if we should increase 
it as well. Anyway, I think we should increase 
CONFIG_LOCKDEP_CHAINS_BITS to at least 17, those we may still hit the 
"MAX_LOCKDEP_CHAIN_HLOCKS too low" if we run a variety of different 
workloads without reboot.

Cheers,
Longman

