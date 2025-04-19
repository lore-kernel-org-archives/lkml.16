Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F38D442C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 02:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745031157; cv=none; b=OydIZ4r0aXIMBxuep0/R5lahK/2qh43l//jjne3d5xwD+mjkWsI80CYuNf5+4ByYHVNi5SRsSrS6cok4PqPucN7p45zKCP5EmgO3Yv+m5L8i2Buw/5Apvp9PF+Ixj9nVMkDqXp99HoLIXUeJMMoxJOkyQIicDEPq+7yc7yAqLXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745031157; c=relaxed/simple;
	bh=theS8RcvZanrUD+M1LyijqXZYw66kB9iFil9ls6KtE4=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=WYceWMQHyG33+RqbTRZ69hvdbZl59hmTocSOO08wYbyhF1Q/2apLgOiW6nJS1MUWxLN9wQbL5GfI5+J0uTycZPXO7GK0iH8louiGFUkISBTgh0E3NJ7VKjshJMqUOz5twGKFG9k3AeoCQVmpDNxC7TOIox28Ilwf1W6THXk9njw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iJVoN5cE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iJVoN5cE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745031153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aQ20Wb91nRlL2HCLafPP8sqerrMAzTWNg53ZMrTEgiY=;
	b=iJVoN5cE0/WpIyidO80hxy2CEp8CZiKREOLbK2kYDL01yOnuoSI9Qp1T5DbB1qjb7eCF/3
	SB918sBHs0TQoE9DgwyfvjE7Oj8kUvKRwHtw4t38HM5WyU5Lp1Rmm8+3v6Mmnz6we9Nu5w
	6rVFWz458lAZuih3ar3fH9YHtuvl5ps=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-LWYtCL_oOKuIJi-_6uhcBg-1; Fri, 18 Apr 2025 22:52:32 -0400
X-MC-Unique: LWYtCL_oOKuIJi-_6uhcBg-1
X-Mimecast-MFC-AGG-ID: LWYtCL_oOKuIJi-_6uhcBg_1745031152
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5bb68b386so693210485a.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 19:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745031152; x=1745635952;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aQ20Wb91nRlL2HCLafPP8sqerrMAzTWNg53ZMrTEgiY=;
        b=nk4/AKCT74IojVF1cBkAi7SZrCv5v3oWAkFHWgaXtWMLQVrGIHwl1UP4ll2+QQ3ON9
         kuDzpd1iL58ws17ea/3uCEI7TZzxz/LnGoeUn0rUCo9V1pW4cjf9NLJwl85Uz/0kL8/O
         ueadEfddaAmYgbcLFkN03nXWrkkovQF/5m9asf7DmFJRLnUh6ZTFgYSAwqznPdEwpA2Z
         SoJj6QmFSfd+nEkylC2qfsoPWcJPu6RdsyThqsxjczifwbCBJKi/pYA6f2SqI33jj03A
         15ihmTpJ4fk4JWfRQuMRZorVnyG1BRQNgWHUc0VDKJal37f/VLK4u5KAAWjahc7TobnX
         GUfg==
X-Forwarded-Encrypted: i=1; AJvYcCUtCOjv+wsOpVKi1lUWeu6bD24izExoqiDX118HZkCHhEpmEofDyffcilVsZsbQFbl8Zf0bl5S36EYf0VU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv0olvQcc2I+uvFAmyrqWPHL/N8J8X6IT6tGIPHLwu/yONLyUy
	ox7AXRMgWp+2C9qPUnI1I1YjV5w6gsKZuB+JAXxCZ6qtS2jmRlK1ISgng1XuaUe4Lo6mkN9lsuO
	k0wB445StyNjB9Cgwm6ei24aSrKbWcka5SzVH4htLzWN4rk+LWvbFrR8uvbIlDA==
X-Gm-Gg: ASbGnctIrQjvdo0/63NhE3DYFsOEYW/+PpgxzyAw2qcV3Ci4LHA0NtEetbESQ9XHF+e
	ymSLhbHMYJOfzWaNa4yrhsNwIPz4rJM7z19NIw86/4Cf1G8+iQ340A76fY3p/WjjOmD22+H2rct
	RYMA/fkUOkLI901eljtsHuLtFMQlLcEfszTqMUXEmzHRq9rdMYBSyCGls3nzGp9yExsmlPk5lA7
	ptPkpsv3dE/NmV84/H5Bt81RZeAh+cjN1FkChyG3eHqhA25Wv1AbM0akQ+b23apGxiCDOAZfuPc
	PTNklTnhGRkn24AE/5pjs1ySvdELEf1AQTWIUtsetEOgF3Y9NA==
X-Received: by 2002:a05:620a:4045:b0:7c5:fa85:1ac3 with SMTP id af79cd13be357-7c928018a04mr785673785a.45.1745031151985;
        Fri, 18 Apr 2025 19:52:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJuMJNshO1vk0ZZ2DVTG6qPooBChPbh/ArWrm5qJvn1uZDiDXAgkpyh7A9UOWDTT7vFmuo0Q==
X-Received: by 2002:a05:620a:4045:b0:7c5:fa85:1ac3 with SMTP id af79cd13be357-7c928018a04mr785672485a.45.1745031151701;
        Fri, 18 Apr 2025 19:52:31 -0700 (PDT)
Received: from [192.168.130.170] (67-212-218-66.static.pfnllc.net. [67.212.218.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b78f0csm171452785a.105.2025.04.18.19.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 19:52:31 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <393a4c7f-c48f-4da1-a059-4c10f4094386@redhat.com>
Date: Fri, 18 Apr 2025 22:52:29 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] local_lock: Add local_lock access for a CPU-local
 pointer
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org
Cc: Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>
References: <20250417160057.jFRLMwfF@linutronix.de>
Content-Language: en-US
In-Reply-To: <20250417160057.jFRLMwfF@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/17/25 12:00 PM, Sebastian Andrzej Siewior wrote:
> For the most part the local_lock API expects __percpu pointer to operate
> on. So we have for instance
> 	local_lock(var.lock)
>
> and local_lock() will invoke this_cpu_ptr(var.lock) and do the actual
> locking on the resulting pointer. Good.
>
> There is one exception to this, that is local_lock_init(), which expects
> a CPU local (instead a __percpu) pointer. This is used with dynamic
> per-CPU memory allocation. You wouldn't have guessed that based on
> function naming but it is kind of obvious if you think about it. The two
> users, that use it, pass the __percpu pointer to the locking function so
> everything works as expected.
>
> Now I got to the case where a __percpu variable is made CPU-local and
> this pointer is passed to queue_work(). This is fine but the kworker
> operates on a CPU-local pointer and now I need local_lock()
> without the this_cpu_ptr() in it.
> Adding a _local to the function name would be a bit too local. I added
> _this instead but don't like it very much. Anyone with a better naming?

The "this" suffix looks a bit weird. Since you had introduced 
localtry_lock before, maybe you can follow a similar scheme like 
localcpu_lock.

My 2 cents.

Cheers,
Longman

