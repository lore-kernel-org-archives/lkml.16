Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F2B281358
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744295761; cv=none; b=oVoI6OdXBUwuPyca5LxyXqzSx29AV2gdGihlMmGZc7SAXSDKS1D/Z1M0UGJgKB6dd2lsRsF3+hQ7FcABeNu8puR0kya/LSHgrqS3qCHID/cBvSkxckhSPBHW25l9Uo11JOJkLpblFzNoNhNaPzvLwOj1/J8/g3aVm1roITZ+wME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744295761; c=relaxed/simple;
	bh=10LbntU7G6cSiJO95JZRsBQNWmis82LaIoeCO56r6Lk=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=DbRyNT+VvQNyG2i6obrkNs2k4v1RSMpUW621oXnCSNAvbgw3WebQgU5zjdhcQzlX0AjWe4lXZQmAlRrYfi7kvwzTvWjSwu/BK7rcM+zzRfLJ6bnwqEsxsmDCcM52upAMlpRh2i8p+5aBLF0f91lnoa/O7S5eboXFt7Y3t78L3uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S2QOvQlq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S2QOvQlq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744295758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/3SQB7rzhOVJ6Z2UjNgnVkSzmn6Ilrczcfrs8WunoxM=;
	b=S2QOvQlqtlRnNNqDzsg5rO0tplKCso9Wks01o+00TL74w0rr32wpC+y4uj47HBLoeBo/HD
	Tz/pPtkVbfHR39yeHimjmKrC+iAbV0X5xsUystqWVHHpG0QnHgsloVTN0u7j+s0jaJQQbD
	myo6a+j7tBgrSkfwNurRkadpGCiLVYo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687--IeDanPXO1Wcs84R5Rsrog-1; Thu, 10 Apr 2025 10:35:57 -0400
X-MC-Unique: -IeDanPXO1Wcs84R5Rsrog-1
X-Mimecast-MFC-AGG-ID: -IeDanPXO1Wcs84R5Rsrog_1744295756
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476623ba226so15101621cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744295756; x=1744900556;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/3SQB7rzhOVJ6Z2UjNgnVkSzmn6Ilrczcfrs8WunoxM=;
        b=N64xzkvq7FJDWSynr9pUTHVpeSQUor9s4gBZC5/bxB8jVSAnYUUtVoLfkQsANw+dyq
         jT6fS/4bspxwAEJH6pjrTvPdgPSeTopjjDsOg/nmR7+16jenYPQq8cx4e1semv/Dd+0I
         rXioIovYnde1xqZR344VYijNvVQFJy8U1bBTBx+F7eFm+VkEyNp14UqYZJiNRJz9d7on
         D3zU09zXVSMfsPT20QE5YyJFOmc0U/ABxh0LPes/Fq81s2okKm2Nw+VOfJzPCBG3GimG
         g9J9HATtkESP2HIFY4gIg3+ldBOSH4sYgF3X807GAVITsqTLuyA/Atk8hQbWy9T42DPU
         zmNg==
X-Forwarded-Encrypted: i=1; AJvYcCWeSi73ydXZeF0Q8I8/uMFnyiNai21t40pZkooF4zjDmjOe7nm+SEyYfuFLSJRjiEEdYw7JV0lF1U4xnLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW7OpcNbQlMEEJGbKTzVAYRa39urCX7Tu0GQ8LhMvnSM8+2qtS
	YntAgVpBPHV70KDthH0oasLi2YttXBJ5Nz5FxhfG0kaIS42BDyn3QBADwWiYIrvb2meyn6LE4AE
	0HIK3gVhMVOLsheW5qr7RyGZe+9Mcu0RUZKHvcMglQV+KHP+046GupPcuXgvCEQ==
X-Gm-Gg: ASbGnctpOHHJ1X29fIIYlz+JaPccGG4KtA3LK+YPuhAj31bodP2lx2hFsYCVR5RQLLY
	1cRBwQKxPiDm+CZo6uBhDtDCPmQnkQGJpOwILa/sqZNgIUjT9YEhw1V0JHhlRz0poYqOSASNolo
	6/K67dJct+Q32Ivl/p3OgccH4Rdu1BDyg/RRxSPZtfFoHFBIYvJxYqcsgACHkTHx5g2x3cNzg/x
	j0bldXbFiSK/5KutyuDl3TjfTPcjjs2F3ftdjh8YaaOeyFJNHSl8YTvyyB4avTAgeDzTi44sNyK
	vqRuDgh9zkM2BHlM+b3In30wPTUyxdJvLoWSIA+GJ9IV9ICJRW1RD6oyXg==
X-Received: by 2002:ac8:59d6:0:b0:476:9296:80a4 with SMTP id d75a77b69052e-4796cba04f5mr35843251cf.7.1744295756667;
        Thu, 10 Apr 2025 07:35:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEremdcNTaA4L2CmylqIV9X/DkyVJEuDpRqUKmk8xOFlf/oJ1kTWqolvNqMaNcSRlNIGjyXzg==
X-Received: by 2002:ac8:59d6:0:b0:476:9296:80a4 with SMTP id d75a77b69052e-4796cba04f5mr35843011cf.7.1744295756383;
        Thu, 10 Apr 2025 07:35:56 -0700 (PDT)
Received: from ?IPV6:2601:188:c100:5710:315f:57b3:b997:5fca? ([2601:188:c100:5710:315f:57b3:b997:5fca])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796ed9bcc3sm9426491cf.63.2025.04.10.07.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 07:35:55 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <77988036-7550-4ee2-a738-9f9bd4417001@redhat.com>
Date: Thu, 10 Apr 2025 10:35:55 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] timers: Exclude isolated cpus from timer migation
To: Frederic Weisbecker <frederic@kernel.org>,
 Gabriele Monaco <gmonaco@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
References: <20250410065446.57304-2-gmonaco@redhat.com> <87ecy0tob1.ffs@tglx>
 <2c9d71fd79d7d1cec66e48bcb87b39a874858f01.camel@redhat.com>
 <Z_fBq2AQjzyg8m5w@localhost.localdomain>
Content-Language: en-US
In-Reply-To: <Z_fBq2AQjzyg8m5w@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/10/25 9:03 AM, Frederic Weisbecker wrote:
> Le Thu, Apr 10, 2025 at 12:38:25PM +0200, Gabriele Monaco a écrit :
>> On Thu, 2025-04-10 at 10:26 +0200, Thomas Gleixner wrote:
>>> How can that happen? There is always at least _ONE_ housekeeping,
>>> non-isolated, CPU online, no?
>>>
>> In my understanding it shouldn't, but I'm not sure there's anything
>> preventing the user from isolating everything via cpuset.
>> Anyway that's something no one in their mind should do, so I guess I'd
>> just opt for the cpumask_first (or actually cpumask_any, like before
>> the change).
> With "nohz_full=..." or "isolcpus=nohz,..." there is always at least one
> housekeeping CPU. But with isolcpus=[domain] or cpusets equivalents
> (v1 cpuset.sched_load_balance, v2 isolated partion) there is nothing that
> prevents all CPUs from being isolated.

Actually v2 won't allow users to isolate all the CPUs. Users can 
probably do that with v1's cpuset.sched_load_balance.

Cheers,
Longman

