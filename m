Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923242147E0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 17:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743787540; cv=none; b=P6vrEWWghXtKeJQfv6sa7xRyIthVU61BDd9VoOqHHHJu1t5pRZgJn0uPHmzOGeWV4QqlHA6fGNX6vKFOInct81sEb7I09xOyZUkB0n7Av4XtSstU5wmfkDm0xMN+S9yNQeGSaxIlfrjsOwU58fk5Swbz+ohO4z4heb5x5jiY+aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743787540; c=relaxed/simple;
	bh=UIONdw5KXPgsmLhBGCkNGI+fIM7vKA5uHxq4ySw2mXA=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=q3wyPmBIJc5Mfl6rBSmgZGVzyPgwouyOQU/rUhEHTdDQShFbcazSwziYQzltqO30FW+9DZnu8MPtWU9sJHWIEk8Rn970D/2waEicOGJmEiT8b8E1vMs+JBcy5OBvHGwav4dYjWWhla5MQett6+437ZgW9YR5RxvxEzBr1e5vFyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OwZlB6l/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OwZlB6l/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743787537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zY1OdvQqmeKzz5CfMBTTTFp4WcoqAgk+p41C7P+KQBs=;
	b=OwZlB6l/wdpehFI4Gfr/IAe7NTo4bRqQbe1m8nr5A34RBRooJEnbf+BFM9iM2/X8h5vc1C
	nc5jVq9Wg7PX9AgmDQ5ArPlSZr42w3txOfdfyQaC3hHhsZ9Sjfak5OvuSupfB8BKKbbzJ7
	hqcm+8mTvqVxSPH9kD6PuogJlvCYd+k=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-hFA0JMimPDCwPfY77uKC5Q-1; Fri, 04 Apr 2025 13:25:36 -0400
X-MC-Unique: hFA0JMimPDCwPfY77uKC5Q-1
X-Mimecast-MFC-AGG-ID: hFA0JMimPDCwPfY77uKC5Q_1743787536
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4768656f608so48796181cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 10:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743787535; x=1744392335;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zY1OdvQqmeKzz5CfMBTTTFp4WcoqAgk+p41C7P+KQBs=;
        b=WIrRl8S4JsBj3Y0JpXffeSHK37RsNAqAIHNQJ0mxffxOf1HPLD+p8g5lGfR56qEclY
         4jngK6v2IhwjMJcTl97iOMW+qh+yUGUsyNlUjQkXHKwyaPbWg+HGa+DK0EIu4iWkq5PY
         8TWUvMjUyBESAL42je5KRTEID5Zz+Mhp2UFv5jUg7NnChokXD2aFnMQKYx4uLQgKsGVu
         sVdv1tlDQ+NYmjTW0PX3epZfUee+yEM1SvX55NGsgh0mmGqHF3JVuicSjeP9GIFGZzTP
         nGNKowk3JHJOqu0X2od6C1Krx1qkKywProW2SbIe/zv1J0laYQp6+QNryUKtUysvtf/F
         jQUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpqmQgiwild57Pi1WBzsYcd+Tt1siWVojK9asqs62VTEhgkYWSy2qkmfsKz7Kbi4YVtH7kV1s7uwG7BVE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCzCToZSoroOaZffZybdsu/9rkh/NH8ub3c0X8D6H6A7itkhN0
	sgpR8b4euWmOdENHg13wJ5T1xzoWLPqez9KkpBveUNHC8n67IPsKwSnQC5wKgzaO+OlOJKcQMvW
	KYTvoSMJtq7CLakBhliow5mhtwj6zFG4p6GX6KBOMmfgWm8vVkMBWKo2TnQHazUm+202+LQ==
X-Gm-Gg: ASbGnct8AlJ3OvGSKeLqKrgSfmB7vBLk5mVsWo7K4VcmhJ2G10tVpEwqy0AdbspN+SC
	66xo//6ofplc/7WQwBBx1l/Ht+LhmxKUc94WG0/VZcob1U9VgiJxZI/WCXai3FQGvEcpitfCGM9
	NZW60u1GO50g34QwOp27nZnRA/DblRzrzvjh1ESeUTOUcgQSYmclnBF6ItgW6yi3zf/r0Gb6e4t
	NPvKVlD/nffaOionTb+HSgxbAY6Tfs2XaXOHHTkjshJp9prWL+y5vrOL3aMhC9Y1JCp094fO0ZG
	3/UCQLzoDthE3mp6i3Jflscrr/A9US3gVlaXgN/asbMXkV6rkZPGaeEy/oerzw==
X-Received: by 2002:a05:622a:24c:b0:478:de14:135a with SMTP id d75a77b69052e-4792595adafmr51651961cf.20.1743787534885;
        Fri, 04 Apr 2025 10:25:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPaEDXj6BQIt1pawQwBSb2n8E48wuGD6upHv6D0WAjJO96YQubjDzEqlaf96Y8LIMcvLc1vg==
X-Received: by 2002:a05:622a:24c:b0:478:de14:135a with SMTP id d75a77b69052e-4792595adafmr51651691cf.20.1743787534569;
        Fri, 04 Apr 2025 10:25:34 -0700 (PDT)
Received: from ?IPV6:2601:188:c100:5710:315f:57b3:b997:5fca? ([2601:188:c100:5710:315f:57b3:b997:5fca])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4791b0883f1sm25312231cf.42.2025.04.04.10.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 10:25:34 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <1ac51e8e-8dc0-4cd8-9414-f28125061bb3@redhat.com>
Date: Fri, 4 Apr 2025 13:25:33 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] memcg: Don't generate low/min events if either
 low/min or elow/emin is 0
To: Tejun Heo <tj@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org
References: <20250404012435.656045-1-longman@redhat.com>
 <Z_ATAq-cwtv-9Atx@slm.duckdns.org>
Content-Language: en-US
In-Reply-To: <Z_ATAq-cwtv-9Atx@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/4/25 1:12 PM, Tejun Heo wrote:
> Hello,
>
> On Thu, Apr 03, 2025 at 09:24:34PM -0400, Waiman Long wrote:
> ...
>> The simple and naive fix of changing the operator to ">", however,
>> changes the memory reclaim behavior which can lead to other failures
>> as low events are needed to facilitate memory reclaim.  So we can't do
>> that without some relatively riskier changes in memory reclaim.
> I'm doubtful using ">" would change reclaim behavior in a meaningful way and
> that'd be more straightforward. What do mm people think?

I haven't looked deeply into why that is the case, but 
test_memcg_low/min tests had other failures when I made this change.

Cheers,
Longman

>
> Thanks.
>

