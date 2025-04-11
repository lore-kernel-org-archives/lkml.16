Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7960D290BC8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 21:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744407741; cv=none; b=k5/x//Wy50ymmukChrr4Bz/lSkd66+LxJYw8cmTe88/VaNYa8PYwH6cgZE9HOz2Myy4JKvlpwhp7fDHh7FducQIsWahYG2St51N8Q9cTvpQ7e8hPMhf4LNOOmlmb8m2GAz9xG3LX3BhsXxNllKOPyQZ8tz8d+y8I3W8eqM2+i94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744407741; c=relaxed/simple;
	bh=VGgUuxdv1xzGXXZSD6ZHULfD1Juf1McLzuRi+iTVC90=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=olOmP43BdpF6XEX8DXs5Udkz5FgQqR862dFiyijc+aPCv6UnKjB87X0QUrZxFpjXLy2NcNctMW+7ax/Fvv5obOOxJpyoFV9+ZePfrYCKCTjtkyx2DoRtHihAWro1KHqv3dMPYS06H7LbCs3F9JGgWB2EmwfIntam5qcqd7Ka5XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NbV7eFWT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NbV7eFWT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744407738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3gi9jx3ynN0Fvs6xU8s9qk3uwTlKkqCTwIN8L/fT3WM=;
	b=NbV7eFWT+KABGSNX73uO9DMjAN0lmdnoRLVweh+zxWqyl3xhm6gx43Px2OHiuDy8hnQsZV
	kfwbOxBa0vUaTht8AxPOIe5xw+jEZKdpTkx158yAn2u9ZOWonkJJv3abf+cH5jTYPCTGjH
	7kKMNR8swI3lNQBKHyz8eWTJZAx9U3I=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-6vJxrRAyOrqi4rAka8lRNw-1; Fri, 11 Apr 2025 17:42:15 -0400
X-MC-Unique: 6vJxrRAyOrqi4rAka8lRNw-1
X-Mimecast-MFC-AGG-ID: 6vJxrRAyOrqi4rAka8lRNw_1744407734
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c549ea7166so390431985a.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744407734; x=1745012534;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3gi9jx3ynN0Fvs6xU8s9qk3uwTlKkqCTwIN8L/fT3WM=;
        b=UGBM/hQimON7R9X/KC3tjwpaliszv53XFtUeNWZiP5Yr11Zb8Q5M3GDkCv84k8m4ou
         JseKgVWOEI5aijCExWQrcdSUt2RbqZPU0C3+pKud1RgPmiGa1QVEKUbALNd7k0zOBLlC
         NYmZm8XDUIMVFtlhbDzXxyIa61DhThWMlUaP/hPOCGW7nDMOqWVd12IEH6ho5D6p9TRo
         7nrwLkRdApa2aUGG+o2Hg2KXySbUH840teGMOukYQt1Gvx+43e7yfbVQe9/KQvKYtM5M
         bhSvqnrfuA4bMggx7c1HuRB8GrRiT9L84ZtFy6t8M68GalgUpjSid4aAZBhOAX0IlNDM
         7pyg==
X-Forwarded-Encrypted: i=1; AJvYcCVpj1wcvdjoa8bkBOOVvzIVuFGc4Vn72kw/LunCKTXcWKT6rhmzSOfJ12HHpLxsXMNhtgrlRzqpwal4j/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzreRwEpOtSxcTNL2G/vX9RGzuc1UhPSEC3J2IFSC6ELDKTTwPn
	wlKaodUfNjQ9i/IvpvYmaDrvKiZQLb2HYj4eW4QndpQu0QV4c/tqCaHQdzkJb/cfv+fvMKoPdQs
	z2blvLbkvPZ+209bJm9tf6lrJezfqd3VF2/hQwjqhNWFQwZIi+PG2yNqz33QC4A==
X-Gm-Gg: ASbGncsGIH/EcDO+Par+94R1T5Jo3EjeiGn0usWq96UamK8JdVCzKI72GCn+120JDou
	vZpkGJi59pvWEi9vWWWONKNX3KYQb8LIuVeHClQYdskKoj1rJzSrFkSzGvPRorjj4I0uKXIR5Nx
	GOeuFhxu9Pw4R94HvccWYpGEiCVpDfsENUEaIsWe6OnucguX2eW/45VHV3tqfBkQNuc8kaZT0uf
	wWsgMSc6ohZtsSNRpLgtV/5DzmVzv0ZErjrl15jM73fuxE57PSsbMkmK1VPdhb96d9xZYD+MOMW
	wnPJrsLwmkg+Cf1hJ0aqK13KBa9R7yUwz5s6nWar4VTMzC63k8fXpObBrQ==
X-Received: by 2002:a05:620a:4608:b0:7c7:70dc:e921 with SMTP id af79cd13be357-7c7af12df3emr861620285a.36.1744407734613;
        Fri, 11 Apr 2025 14:42:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrW3e7AIHhIu7AXBF5LC5KsZhgZcA6ahLpM5fFHEpeXmV2PCGX62skPo0rxtAIqHbrxnoQTQ==
X-Received: by 2002:a05:620a:4608:b0:7c7:70dc:e921 with SMTP id af79cd13be357-7c7af12df3emr861618085a.36.1744407734327;
        Fri, 11 Apr 2025 14:42:14 -0700 (PDT)
Received: from ?IPV6:2601:188:c100:5710:315f:57b3:b997:5fca? ([2601:188:c100:5710:315f:57b3:b997:5fca])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895163asm317581185a.27.2025.04.11.14.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 14:42:13 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <22368dc1-e026-4e9d-bb65-6df62f960a15@redhat.com>
Date: Fri, 11 Apr 2025 17:42:12 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] selftests: memcg: Increase error tolerance of
 child memory.current check in test_memcg_protection()
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org
References: <20250407162316.1434714-1-longman@redhat.com>
 <20250407162316.1434714-3-longman@redhat.com>
 <pcxsack4hwio6ydm6r3e36bkwt6fg5i7vvarqs3fvuslswealj@bk2xi55vrdsn>
Content-Language: en-US
In-Reply-To: <pcxsack4hwio6ydm6r3e36bkwt6fg5i7vvarqs3fvuslswealj@bk2xi55vrdsn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/11/25 1:22 PM, Michal Koutný wrote:
> On Mon, Apr 07, 2025 at 12:23:16PM -0400, Waiman Long <longman@redhat.com> wrote:
>>    Child   Actual usage    Expected usage    %err
>>    -----   ------------    --------------    ----
>>      1       16990208         22020096      -12.9%
>>      1       17252352         22020096      -12.1%
>>      0       37699584         30408704      +10.7%
>>      1       14368768         22020096      -21.0%
>>      1       16871424         22020096      -13.2%
>>
>> The current 10% error tolerenace might be right at the time
>> test_memcontrol.c was first introduced in v4.18 kernel, but memory
>> reclaim have certainly evolved quite a bit since then which may result
>> in a bit more run-to-run variation than previously expected.
> I like Roman's suggestion of nr_cpus dependence but I assume your
> variations were still on the same system, weren't they?
> Is it fair to say that reclaim is chaotic [1]? I wonder what may cause
> variations between separate runs of the test.
Yes, the variation I saw was on the same system with multiple runs. The 
memory.current values are read by the time the parent cgroup memory 
usage reaches near the target 50M, but how much memory are remaining in 
each child varies from run-to-run. You can say that it is somewhat chaotic.
>
> Would it help to `echo 3 >drop_caches` before each run to have more
> stable initial conditions? (Not sure if it's OK in selftests.)

I don't know, we may have to try it out. However, I doubt it will have 
an effect.


>
> <del>Or sleep 0.5s to settle rstat flushing?</del> No, page_counter's
> don't suffer that but stock MEMCG_CHARGE_BATCH in percpu stocks.
> So maybe drain the stock so that counters are precise after the test?
> (Either by executing a dummy memcg on each CPU or via some debugging
> API.)

The test itself is already sleeping up to 5 times in 1s interval to wait 
until the parent memory usage is settled down.

Cheers,
Longman

