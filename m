Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E152101B5
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 13:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738674170; cv=none; b=CyIqNZpWN54f5Hb8+PXJZEt4uRqVP8CFfgz/0MDjOguwGY9kR9EqAmygnCFMbkxSfu771lfENpF8QIl0lPy5756e88IlLmZ49NEK9LXQyj07DUm9QK/iBkcdkiWlNtiG0Z8Vvw5lDq1ooBIrQL+5nT+ea0ommSBda2VgGHBlzaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738674170; c=relaxed/simple;
	bh=HruZPTj2lCOv31GfDSLcuevE0PQQYGnyfJD0+VmJRQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EGfEwyF25YAn2KEgzdWICzen80SHX8Fo9kO5q0VlyZNAPm/KruM6uI7z8qcIwV4h/jIoI498LCnHTEAtHecyzI4zF08tzx2GAk03Q9W7UqXBWlbPjIvQ/GLdWQXF2I/5wrur3upNCzuXQ8mOfyrOUY6BY5bFl+CfZFVCOVQCrV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D00ga4ep; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D00ga4ep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738674167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ZTsUTGKVtJitTmMrF1V4eCWa6xeaggKQxZaNcEEP78=;
	b=D00ga4epCm91vpqUmNdQQL7hMqYu528h1DdqrhjPmXKtoHDSa5RUAKJP9s3Exz8L+OOYls
	fLqmIOEro8iswCnDRU844EfSlgxrEPQsX5yMMiawXLp9+UqYlxVsT9HL6wcGwHyeQouqky
	jmtZmvcBhWAT6UIbww+BRmQ1ENNz1po=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-oYmum8KVMUuZHB2QS3nKrw-1; Tue, 04 Feb 2025 08:02:46 -0500
X-MC-Unique: oYmum8KVMUuZHB2QS3nKrw-1
X-Mimecast-MFC-AGG-ID: oYmum8KVMUuZHB2QS3nKrw
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38dae3db3bcso351308f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 05:02:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738674165; x=1739278965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZTsUTGKVtJitTmMrF1V4eCWa6xeaggKQxZaNcEEP78=;
        b=mIbdeJCpWnlDSZbXT4gdkWBC4KvscUhsDE//+D8VgWP+8s+SE5HFObjNMFIT0V65C1
         ym7gh6Ix4U1CrEzpzzajSHFKyPn3KjyQFIh7rz6CpM9Fi2nBB+UgVG4LpVI7F1Q7AE0D
         Jz2KJfxZGLbgCs+IBwSW5XknmUxoJsQJ4dToqUF2Jy6NVqlNypQymBug95wlDTQz4O5z
         8ivqC+bOcg0hkQbjcWhou6PV2JqJWaHPESKKzPz347aorterFJ661rBLUI2x0kqBDh4p
         UAhzoVfzgasR3uB+SI34x6z58ZHPaTN0WlAUFGLAJv74P+k3r7QHa0Q0Ap8ogInKSraf
         BvPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXvLQ7WUX9ravHcyAPrj9Conxk/YwIyuCcQqgxBaVcrIlPz0mnX1uQspZshBvhBe/w3IM4zRvfNvI57pg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoXlE7CkSgArdlKEDgVwuGKnGqw19xbSZabhN3jRFTk7dDR7fB
	hICNnxXma4/hW5tEaH8yfKqYfYD7l0kRGFwXgnXeOgfmPaBLBVHqmj3WGJNG+5rWez35rtPFR6V
	7txpIKovSUbHxIweKnOMtPr3c15+YS7R+QqPw+4dp+bFUzy3zGMKUTMJhaxMYSA==
X-Gm-Gg: ASbGncuha0L/t7VNxWf3dVE585+2wBa6AabWUyKREapGaJhmNP+5RIBt/G5DjpDs7+2
	GH5x61uucchrCNxeZOz+xfEJMyZ1QYAWDCHdQvIV+89SMe8ALysk/AAJXDJ0ZvhlJ5CttAbQxpd
	7z6+qgwiwoOSS54TjtnuQ4BUKS9OSHVZXy4ejM1/rEMlE/uFA6i7XGFMts4Hk5Ub1CwhUZNmZ+g
	C7SAUxbeuy8x8HNPwNqr6KQoLwHSpRtk3czWGIPXuV8fN2P9IblQtArpB7JeJbFEeax1rQcd6j3
	CZoPtICdMYeUq58sb0Zwgw1lqGLu2Ppmd0g=
X-Received: by 2002:a5d:6da2:0:b0:38c:5d21:df15 with SMTP id ffacd0b85a97d-38c5d21e291mr15717716f8f.34.1738674165235;
        Tue, 04 Feb 2025 05:02:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHy9t3up7bVa03IIHhfW6h00FYsjRC8OkGUO8RkaXmCBbcKhty5PI+YRywJ3RP5DQinrXaR0g==
X-Received: by 2002:a5d:6da2:0:b0:38c:5d21:df15 with SMTP id ffacd0b85a97d-38c5d21e291mr15717631f8f.34.1738674164414;
        Tue, 04 Feb 2025 05:02:44 -0800 (PST)
Received: from [192.168.88.253] (146-241-41-201.dyn.eolo.it. [146.241.41.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c121951sm15616958f8f.45.2025.02.04.05.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 05:02:43 -0800 (PST)
Message-ID: <3375fb21-c921-4245-a084-738a418f084c@redhat.com>
Date: Tue, 4 Feb 2025 14:02:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] netdev-genl: Elide napi_id when not present
To: Eric Dumazet <edumazet@google.com>, Joe Damato <jdamato@fastly.com>
Cc: netdev@vger.kernel.org, kuba@kernel.org,
 "David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>,
 Amritha Nambiar <amritha.nambiar@intel.com>,
 Mina Almasry <almasrymina@google.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20250203191714.155526-1-jdamato@fastly.com>
 <CANn89i+vf5=6f8kuZKCmP66P1LWGmAj06i+NhgqpFLVR8K5bEA@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CANn89i+vf5=6f8kuZKCmP66P1LWGmAj06i+NhgqpFLVR8K5bEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/4/25 6:41 AM, Eric Dumazet wrote:
> On Mon, Feb 3, 2025 at 8:17 PM Joe Damato <jdamato@fastly.com> wrote:
>>
>> There are at least two cases where napi_id may not present and the
>> napi_id should be elided:
>>
>> 1. Queues could be created, but napi_enable may not have been called
>>    yet. In this case, there may be a NAPI but it may not have an ID and
>>    output of a napi_id should be elided.
>>
>> 2. TX-only NAPIs currently do not have NAPI IDs. If a TX queue happens
>>    to be linked with a TX-only NAPI, elide the NAPI ID from the netlink
>>    output as a NAPI ID of 0 is not useful for users.
>>
>> Signed-off-by: Joe Damato <jdamato@fastly.com>
>> ---
>>  v2:
>>    - Updated to elide NAPI IDs for RX queues which may have not called
>>      napi_enable yet.
>>
>>  rfc: https://lore.kernel.org/lkml/20250128163038.429864-1-jdamato@fastly.com/
>>  net/core/netdev-genl.c | 14 ++++++++------
>>  1 file changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
>> index 715f85c6b62e..a97d3b99f6cd 100644
>> --- a/net/core/netdev-genl.c
>> +++ b/net/core/netdev-genl.c
>> @@ -385,9 +385,10 @@ netdev_nl_queue_fill_one(struct sk_buff *rsp, struct net_device *netdev,
>>         switch (q_type) {
>>         case NETDEV_QUEUE_TYPE_RX:
>>                 rxq = __netif_get_rx_queue(netdev, q_idx);
>> -               if (rxq->napi && nla_put_u32(rsp, NETDEV_A_QUEUE_NAPI_ID,
>> -                                            rxq->napi->napi_id))
>> -                       goto nla_put_failure;
>> +               if (rxq->napi && rxq->napi->napi_id >= MIN_NAPI_ID)
>> +                       if (nla_put_u32(rsp, NETDEV_A_QUEUE_NAPI_ID,
>> +                                       rxq->napi->napi_id))
>> +                               goto nla_put_failure;
>>
>>                 binding = rxq->mp_params.mp_priv;
>>                 if (binding &&
>> @@ -397,9 +398,10 @@ netdev_nl_queue_fill_one(struct sk_buff *rsp, struct net_device *netdev,
>>                 break;
>>         case NETDEV_QUEUE_TYPE_TX:
>>                 txq = netdev_get_tx_queue(netdev, q_idx);
>> -               if (txq->napi && nla_put_u32(rsp, NETDEV_A_QUEUE_NAPI_ID,
>> -                                            txq->napi->napi_id))
>> -                       goto nla_put_failure;
>> +               if (txq->napi && txq->napi->napi_id >= MIN_NAPI_ID)
>> +                       if (nla_put_u32(rsp, NETDEV_A_QUEUE_NAPI_ID,
>> +                                       txq->napi->napi_id))
>> +                               goto nla_put_failure;
>>         }
> 
> Hi Joe
> 
> This might be time to add helpers, we now have these checks about
> MIN_NAPI_ID all around the places.

+1.

IMHO a follow-up patch could additionally replace the existing
open-coded tests with the new helper.

/P

