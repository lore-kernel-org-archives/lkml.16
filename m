Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86EC26D4F7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745593508; cv=none; b=d+a1FwZf3TXu0pxJlQriHMLF/m4BBmN0nkQ733SMTAtW6dVHuhm1x+OdKRYLKTmLMUZ2JrghjPgM9rJ1XvVzTl4NoLsQ1crr+1FtqxGdwaBKWcWWBucKUU6o0TPfzBwkmvpeOGPr8L6QgPnAdj/Pr8kRL0m6R/jvZA5KHoEYVzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745593508; c=relaxed/simple;
	bh=Tm5q5MYJruhkNGjbbrmAT7rJ+JNee1e1hq6INizAKwI=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ro0xiFAbEe2u2WW4oWimjEa3vxqdcgcYq0edRwq7mhm2VnGZ0azovRKJZe5sAWAouLsBpmbPgPsyKtRaNm8iwbTUrBbI/8LLd9EMpz/K6ffBBNtV6x2LlpIQ415C5Fx6ZntHAg9ElfgJboGo2+pVtN5GMbOgFgpKNMoIr/brJKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E44JtBIN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E44JtBIN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745593505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DOF7MEdJZfeltW9hyPd1aEthrbud5eZtYdTNBpurl7U=;
	b=E44JtBIN99gFgqH5axpNi8x/Hx5TwOetgAOQ95Qdnbf9skqFEDtuVsTpmPyIzu5D3YfR5H
	5Fbp/vMVp9oO4M5v1vkGX/Yk+kRcrAcCnRV4Kn0ctO62Ej1gI5U7OYnv0BmvH1n+bH6F3B
	iEmQOD53V0y2fV+Qwd5AflJ+r0xhVIM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-dDmhM4_gP7uVaGN8lZ-y7A-1; Fri, 25 Apr 2025 11:05:01 -0400
X-MC-Unique: dDmhM4_gP7uVaGN8lZ-y7A-1
X-Mimecast-MFC-AGG-ID: dDmhM4_gP7uVaGN8lZ-y7A_1745593500
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c544d2c34fso340688785a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745593500; x=1746198300;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DOF7MEdJZfeltW9hyPd1aEthrbud5eZtYdTNBpurl7U=;
        b=RrYRePveq3/X+Oo2LRiRaJRhaN1WR/9s3ogZV+r9VPTxYkn+GbxH/YxVyZm+HEsH2m
         MswOZ3wbDVhV8KEIhhVIV09Gqjg0cXlUwlPz4D8UEO4wL6b+Ay2b+6tFef8BjmEGHdK3
         PIQHmUm4Eg5h4YS7jShwl/NuJIjThq7JZLLbCykMg2+I8YMSoDEzpojAsgA9MC0YLbmT
         2FUr50/aAt+DimyYA1HBEzHMH/QwH748dPCLVsdACao7a739ml6IJiTsrlNpB8btxou/
         q53nwbPKkhh7lQVL43vi3zW7d6niqJBXxmgrukYrQkNWGaHXREGq0DdpUV/t0wIWW+VY
         KVvA==
X-Forwarded-Encrypted: i=1; AJvYcCWCS/2YemIAnKSLH1F3PtXiyAAJZMDjdJJMcMRXB5NY1cwJZKfbXjJBHuOqbqd3/xapssVQjK+Ub1D+6MI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhCjec20mWKWRwROtWpIUCjxlB0ZXh5CLrmCa5TcJnaq7gO5Kk
	fzPG4sKknlWXOtFVUM3kSadfARIqr8h31ywzZej7H0idrMi5FYt1erMW7z88yYrTcgVgW2vyzwm
	Y3Rr5yQE5X2WP3tggikaENS9PIaBf/NkEG1lsjA4uoC7Z6K3BR4cJ9NVNQOUEyg==
X-Gm-Gg: ASbGnctPx47vtYgkst/xUupqIavIP2vbD3eZhTrcRSKgZcTbn5RPgvdTUjDTqSwYqkt
	HiaAzlE6WQz+aR5pymeoMSrfT306AqJjSISlHwfMy38S9DzmLjcl3wsJ8Q3Guuf3yT9aV9J2uKd
	AKmlR9x4raejav4PZ+Fq8+1GFl9RKduV/yIhaVQk72o9VGxVFIWUVedGaXo0Y6nYzPL4zwGEKof
	vs5cjd9f+QLdjx4W9UzGRBQVa3hc6oghzwzfoI21nSfdDYuHD427BH9Ri2HAT1OvSgnt04Jq/az
	kbkcelhwW3CqJgkkTUSBZ3hmtPfYbDhFCTbywpfAPxdjlW123Yoi7DgDPQ==
X-Received: by 2002:a05:620a:45a7:b0:7c9:2787:7a75 with SMTP id af79cd13be357-7c96071a2a9mr416811785a.30.1745593500697;
        Fri, 25 Apr 2025 08:05:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoVO/RlBmRwhTSBxGq+umqayLGF87nDdoCgXkyU71i0ZoeZaGSM6HAOq8f+P1CncBaPECQ9w==
X-Received: by 2002:a05:620a:45a7:b0:7c9:2787:7a75 with SMTP id af79cd13be357-7c96071a2a9mr416806685a.30.1745593500279;
        Fri, 25 Apr 2025 08:05:00 -0700 (PDT)
Received: from ?IPV6:2601:408:c101:1d00:6621:a07c:fed4:cbba? ([2601:408:c101:1d00:6621:a07c:fed4:cbba])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958d86c6dsm227016985a.71.2025.04.25.08.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 08:04:59 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <3fef1073-3a7e-45ab-8448-a144d5fb6a73@redhat.com>
Date: Fri, 25 Apr 2025 11:04:58 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: cgroup null pointer dereference
To: hch <hch@lst.de>, Kamaljit Singh <Kamaljit.Singh1@wdc.com>
Cc: Waiman Long <llong@redhat.com>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "kbusch@kernel.org" <kbusch@kernel.org>, "sagi@grimberg.me"
 <sagi@grimberg.me>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <BY5PR04MB68495E9E8A46CA9614D62669BCBB2@BY5PR04MB6849.namprd04.prod.outlook.com>
 <a5eac08e-bdb4-4aa2-bb46-aa89b6eb1871@redhat.com>
 <BY5PR04MB684951591DE83E6FD0CBD364BC842@BY5PR04MB6849.namprd04.prod.outlook.com>
 <623427dc-b555-4e38-a064-c20c26bb2a21@redhat.com>
 <642a7d6f-9d8b-4204-bc81-4d8e0179715d@redhat.com>
 <BY5PR04MB68493FB61BF28B5268815381BC842@BY5PR04MB6849.namprd04.prod.outlook.com>
 <20250425145450.GA12664@lst.de>
Content-Language: en-US
In-Reply-To: <20250425145450.GA12664@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/25/25 10:54 AM, hch wrote:
> On Fri, Apr 25, 2025 at 02:22:31AM +0000, Kamaljit Singh wrote:
>>> It should also be in v6.15-rc1 branch but is missing in the nvme branch
>>> that you are using. So you need to use a more updated nvme, when
>>> available, to avoid this problem.
>>>
>> Thank you for finding that commit. I'll look for it.
>>
>> Christoph, Sagi, Keith, Others,
>> Can this commit be merged into the nvme-6.15 branch please?
> What commit?
>
commit 7d6c63c31914 ("cgroup: rstat: call cgroup_rstat_updated_list with 
cgroup_rstat_lock")

Cheers,
Longman

