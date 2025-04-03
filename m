Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946AF433D1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743689033; cv=none; b=WwG3U0R7vfxmZaRcmxg9iIWpE25HAtuiQ68+bVgw3lQGa6J8ddTZ3z7UxzcRcrwusPUG5yfwgp+KJRHhpZzpHdpQcF3BhHRw013vGMiRaeXHG7QVVUMceTQ1jH9M7rmJdGsn7Ws0CG2XyYow0kI1pT5V++pV0cUOM/LciIzmwuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743689033; c=relaxed/simple;
	bh=rL26xxEaFFTFvkAGhilYps033EnKGYhmmlJhoI3PCSk=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lP+TKb+P5IHmevPWoW1i0TIgWyAemsmPHha0nvPCc8iUoN/hS8TmMJ2wNcxum4i6h/oW6v9SC8wQmAOzU3fQtn8NMSKOHA1LdWP3WD/+OkBlpuOBIZTh9r9KNfEbl+sLiMVkI1XysNmxIVV5JAU2jXb0JRFCioDCodjGOFt7XzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FdsN6Nuq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FdsN6Nuq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743689030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SCSNaKfIQGFj62LxsLl56Qmm/lRsV/ZZkpDZXBMgObY=;
	b=FdsN6NuqQ4C4/kT8O6xSyxTECTjoGTMUTnKxD25vk7J7uEu82WncT2AlGJEBRLGHFTKqBZ
	xlvVAgJrAH+uPr07bE4SbXHOfZjMcVuEk2l2NnEeEjgANjkKQe8jtIVBBXRxCTGAk6Woxa
	YGodFmyviyLyPIrygzsvWlGwnplGP1M=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-Af14t0M4NUeL5fdUaRRX6g-1; Thu, 03 Apr 2025 10:03:49 -0400
X-MC-Unique: Af14t0M4NUeL5fdUaRRX6g-1
X-Mimecast-MFC-AGG-ID: Af14t0M4NUeL5fdUaRRX6g_1743689029
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54767e507so147746885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 07:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743689029; x=1744293829;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SCSNaKfIQGFj62LxsLl56Qmm/lRsV/ZZkpDZXBMgObY=;
        b=YJDhugL5WTjFFRQVk5JrTKnoqQ6VBOrOdkcfwDQkUvtq2teHGjvISbIxpEEvAm01zl
         vI2y9yCRZHDgkn3c05DJPjTMVn60Ljn8OQd79rkPu/rTM5vQKytSb6AyU2C1YbCY+DA8
         hZdr/ZYBZ9wJ/X25NWu2Z9lp27yNthc49/kO0EoAm8FNELr5b+4db4lEJ8IycJs0FW1R
         U8ewgy9SeGi6eyNhAl5GpH70J6YALZteLglnVrhdRsAAKswxoYtwfudN7gm7iiSHQebi
         W6V97M0YlSSKzvBqK6w3Zb4W/y8rwEhLGzMN1rGhCgeLTYas42ohnrYHAGmNbouH1Av7
         fJKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPb8229LBT53/ofeXd7GeIRM1LZ13lymDi/IsqGan88f+G/KUI1dHLaD6S91ishsTy+JDnZbicwYUZG+U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz17gY/qBT+UvwY3qumCaWdFTqNPhnBSniaOV/K6s6a7h6AHiSA
	PQqHxQQfP2kfNpl6tMsuGI2o73CiK0XxeKnGJTBS22SkOYsY+S/loOR672eJWGXWOXrGdH2aGJ2
	d3rxQQRMTnbrv7XnSdCS/hXGZCKCXYl/pM56x0gcdzd5ovOhcK0nzSWrvk40h3Q==
X-Gm-Gg: ASbGncsAZLvTcF0EqAzLzL2KtLZ7YxbA7fFCZzde1+Ggf8u/wS5pzjAc3yfjc818P7c
	E9A+zCvm0iYXwf92qUEBNBWoLvXPXtQrhVcjlI3SXRi+K5txGjxXxjEuYsY/b3YPN5C2wWMu1kn
	WZET5WgqnAueta7Jv0RjSohDwNzemHTqGu5Z3VY20I/QjD5yHtbt7TfubxoVMbuzfYBKHbflzJf
	jqmO1jurd/Nh2d2rlDkGxBY7xDRcdYZyH2iIvZtJTCYPR8tI94CFpMejjN1E0PUxMl69ySrSiE6
	SG7o/9evA2v7hrzouLjuAim7NU0U0TSP5leybtXOcXP8/b8wUODEXTKJkowzNw==
X-Received: by 2002:a05:620a:472c:b0:7c5:5859:1b81 with SMTP id af79cd13be357-7c690891f00mr3187048885a.57.1743689028766;
        Thu, 03 Apr 2025 07:03:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWPT4dKBmHcc8B0tkMrz6AwLs5xR1eHivxGfGIxFh9vYm0nZAH8c1g09bxgsP+oR66GW7FLg==
X-Received: by 2002:a05:620a:472c:b0:7c5:5859:1b81 with SMTP id af79cd13be357-7c690891f00mr3187045485a.57.1743689028398;
        Thu, 03 Apr 2025 07:03:48 -0700 (PDT)
Received: from ?IPV6:2601:188:c100:5710:315f:57b3:b997:5fca? ([2601:188:c100:5710:315f:57b3:b997:5fca])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e735361sm80281585a.18.2025.04.03.07.03.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 07:03:47 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <7feb1ef2-9ce3-4014-bc0d-b98ddb108470@redhat.com>
Date: Thu, 3 Apr 2025 10:03:47 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memcg: Don't generate low/min events if either low/min or
 elow/emin is 0
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, linux-mm@kvack.org
References: <20250403031212.317837-1-longman@redhat.com>
 <20250402211542.6bfb9ab3a6511ea26ce3cdf8@linux-foundation.org>
Content-Language: en-US
In-Reply-To: <20250402211542.6bfb9ab3a6511ea26ce3cdf8@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/3/25 12:15 AM, Andrew Morton wrote:
> On Wed,  2 Apr 2025 23:12:12 -0400 Waiman Long <longman@redhat.com> wrote:
>
>> The test_memcontrol selftest consistently fails its test_memcg_low
>> sub-test because of the fact that two of its test child cgroups which
>> have a memmory.low of 0 or an effective memory.low of 0 still have low
>> events generated for them since mem_cgroup_below_low() use the ">="
>> operator when comparing to elow.
>>
>> The simple fix of changing the operator to ">", however, changes the
>> way memory reclaim works quite drastically leading to other failures.
>> So we can't do that without some relatively riskier changes in memory
>> reclaim.
>>
>> Another simpler alternative is to avoid reporting below_low failure
>> if either memory.low or its effective equivalent is 0 which is done
>> by this patch.
>>
>> With this patch applied, the test_memcg_low sub-test finishes
>> successfully without failure in most cases. Though both test_memcg_low
>> and test_memcg_min sub-tests may fail occasionally if the memory.current
>> values fall outside of the expected ranges.
>>
> Well, maybe the selftest needs to be changed?
Yes, probably some minor adjustment to prevent sporadic failures as much 
as possible. Will look at that.
>
> Please describe this patch in terms of "what is wrong with the code at
> present" and "how that is fixed" and "what is the impact upon
> userspace".
Will do.
>
> Is this change backwardly compatible with existing userspace?

I doubt there will be much impact. There are two cases where the 
behavior will be different.

First of all, if the user doesn't explictly set low/min, it will remain 
0. However, the low/min events may have non-zero value if memory reclaim 
is happening around it. That is certainly unexpected by the users. I 
doubt users will have dependency on a non-zero low/min event count 
because that may or may not happen.

The second case is when we set up an empty cgroup with no task in it. 
The low/min value can be set, but the effective low/min value will be 0. 
Again, low/min events may be triggered and I doubt users will be 
expecting that.

Cheers,
Longman

