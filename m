Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BFAF4ED
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750084360; cv=none; b=p6IyXjI5DJk+jFZL1lxBR0hjquKvQui0Th0aw1MqmeuxUwfEWOd4HwQqBR3yu1nIOaQCFpm5CSrWNbeqqa+7kIK8rBxwfHdlemxkPbZmVJAg18D4ue0JdGryqKY2s3uX8A7rGJPSENkXAgFlEoA9vnjUYCmL0K1y8BI3I5otYQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750084360; c=relaxed/simple;
	bh=UZaql4En8SE5KYN6yt6oZinGZhfhGX0QHJqp1V8AGAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LMwr0cg0MIMzP1cdDU2eaEKl8NJXj8QNun/4pAla5a3WHGJs+Z5lbTnm0smtpwcR6em/XiNfHKbTmW7WjjBvH/HFNdDOAAyY3Nclq8z7e7eG+kJISYI2EQwdcKakqlp9Zz1vf//FakrZpYuwZh47Bq2VlCnoxJAj/ypiS4juOQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TeBinRs1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TeBinRs1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750084357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=H6iV1SpeigZ3fzxMNkfMUF9irekWeacO2MkauwlQLtM=;
	b=TeBinRs1LstX6tL2d9ABI60pah0VmvS5mk8qbcCwhCuubA6qmECan8BsHAEp4dpy+lqum4
	EyA7BnA8oI5qlTBUyNi1AIK3ngkSSj0Lc8Xo7YNiCJsMSRj7FaqeQWE64wZGUzKUtj3t+b
	sNExBBRT0pIXeasE0BT4XDFMw8b/Vhk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-kKvgTRJVNtKDWyJs4XRo9g-1; Mon, 16 Jun 2025 10:32:36 -0400
X-MC-Unique: kKvgTRJVNtKDWyJs4XRo9g-1
X-Mimecast-MFC-AGG-ID: kKvgTRJVNtKDWyJs4XRo9g_1750084355
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450df53d461so38237815e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750084355; x=1750689155;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H6iV1SpeigZ3fzxMNkfMUF9irekWeacO2MkauwlQLtM=;
        b=v3o9R/1g0GE2m+4Jhw3BKUWvPb3jqpqpLhjb5/9ecGJlyImN2MjSAt0Oy5I34hCMJX
         vBhONLoyPdIDp79XCljxdsvBdWCWvlu31ySTLqtMZMLv3wpu61VaMa+v9/eTtrhE2U1x
         xgw2Y/6A4R3PzL4RtTgrcclrzgQR6HobE63oohj6s7InHvYotOwS6xniq4hkQSmDqIY4
         52TDJ8Zh3yCaQEuPANelvf2/T3kHJoeI/Iu6vfokXjdT+0afiTuF1j9GQFGr5MJVO1CJ
         8SZ2KtsxoTwlTtLFZn96cwRLrSRyRqOmV4pEolDuhHNtuHWTOKubFllwh4BBfQVfVPz8
         it+A==
X-Forwarded-Encrypted: i=1; AJvYcCUvLzigxmONbefZ3uJJK3T+sHnjGz1Gz2CIXf1Ls6X7sqj1rw1n9bH44Kd9/Lq0//CzzOrI0O/okj5ug7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdsDdvfPXvFv8IdPjTw+fUoR0TLbd9vYu9+YNeHdnetKmy/zKp
	I0qHjswxE/PHrUFp4K8MZzJ2QmSybnfzHH9N2MYHXsIOB1NfqH3I8WKnNRQfUywLBPC8DhwNYqi
	1gvAEbVq7QHtuBk0Ou5TeHkznBiSi/hlQrNHlNqyRlZoO50Uc0ejgIoKUHrsPyp6eEg==
X-Gm-Gg: ASbGncvqWipKANriGkGfWFqVppDP6y4PXUb3SZLXEkvz1Ca3KDb7m3jR9aLfJTUst+9
	L9aepGXb2fgqVD/2W1rdKwgX3LKz8nBL4DVHbz6hytxTFDM6l6wk35cOWZbT+z91l7Z/DkwaT70
	qrecqQcJkYW/PFUhL24VeKFT6gOPi6Vdu1meUoMJ4VeDJiMQO5T1iRknZwTL5x2XY7rCrX1t219
	urx3XDHbAeWaaJQpJEUnitkPU3pzCzwo147Ok9Dqc4eHHIVCqUZCwQi+JLRa95gddVIfSfy5gCi
	OsB2ahtGkxdg/+jqeuJcwJQKfWdbTn85PTJuVlm+vJP4ab7T3TiNq7xQ2IYGaY76q9MGQv2oi9v
	tyCOdJPnC4itQMI16JmIb6hIXeDWjF5ddUc+ZE+JHmsjQlYQ=
X-Received: by 2002:a05:600c:1c8d:b0:453:dbe:7574 with SMTP id 5b1f17b1804b1-4535018683amr12746135e9.12.1750084354799;
        Mon, 16 Jun 2025 07:32:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGS7a27CapJB00WF0o/NjM9KLea/AMQKawQeUbRdhumTER566ZU+CFlSCYS3UCxKChof4+k/Q==
X-Received: by 2002:a05:600c:1c8d:b0:453:dbe:7574 with SMTP id 5b1f17b1804b1-4535018683amr12745875e9.12.1750084354421;
        Mon, 16 Jun 2025 07:32:34 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:bd00:949:b5a9:e02a:f265? (p200300d82f25bd000949b5a9e02af265.dip0.t-ipconnect.de. [2003:d8:2f25:bd00:949:b5a9:e02a:f265])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e24420csm145146365e9.20.2025.06.16.07.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 07:32:34 -0700 (PDT)
Message-ID: <fe0e9434-0c6d-4a24-b209-d40c7b9e9352@redhat.com>
Date: Mon, 16 Jun 2025 16:32:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/11] Implement numa node notifier
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250616135158.450136-1-osalvador@suse.de>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250616135158.450136-1-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.06.25 15:51, Oscar Salvador wrote:
>   v6 -> v7:
>     - Split previous patch#10 in two, one for page_ext
>       and the other to drop status_change_nid (per David)
>     - Implement feedback on simplifying previous cancel_on_*
>       notifiers and better document the fact that we consumers
>       can get called on _CANCEL_* actions before having been called
>       for previous actions (per David)
>     - Add Acks-by
> 
>   v5 -> v6:
>     - Remove redundant checks (per David)
>     - Fix build failure
>     - Drop 'nid' parameter from memory notify (Per David)
>     - Add RB/ACKs-by
> 
>   v4 -> v5:
>     - Split out conversion for different consumers (per David)
>     - Renamed node-notifier actions (per David)
>     - Added new Documentation for new node-notifier and updated
>       the memory-notifier one to reflect the changes
>     - Make sure we do not trigger anything when !CONFIG_NUMA (per David)
> 
>   v3 -> v4:
>     - Fix typos pointed out by Alok Tiwari
>     - Further cleanups suggested by Vlastimil
>     - Add RBs-by from Vlastimil
> 
>   v2 -> v3:
>     - Add Suggested-by (David)
>     - Replace last N_NORMAL_MEMORY mention in slub (David)
>     - Replace the notifier for autoweitght-mempolicy
>     - Fix build on !CONFIG_MEMORY_HOTPLUG
>   
>   v1 -> v2:
>     - Remove status_change_nid_normal and the code that
>       deals with it (David & Vlastimil)
>     - Remove slab_mem_offline_callback (David & Vlastimil)
>     - Change the order of canceling the notifiers
>       in {online,offline}_pages (Vlastimil)
>     - Fix up a couple of whitespaces (Jonathan Cameron)
>     - Add RBs-by
> 
> Memory notifier is a tool that allow consumers to get notified whenever
> memory gets onlined or offlined in the system.
> Currently, there are 10 consumers of that, but 5 out of those 10 consumers
> are only interested in getting notifications when a numa node changes its
> memory state.
> That means going from memoryless to memory-aware of vice versa.
> 
> Which means that for every {online,offline}_pages operation they get
> notified even though the numa node might not have changed its state.
> This is suboptimal, and we want to decouple numa node state changes from
> memory state changes.
> 
> While we are doing this, remove status_change_nid_normal, as the only
> current user (slub) does not really need it.
> This allows us to further simplify and clean up the code.
> 
> The first patch gets rid of status_change_nid_normal in slub.
> The second patch implements a numa node notifier that does just that, and have
> those consumers register in there, so they get notified only when they are
> interested.
> 
> The third patch replaces 'status_change_nid{_normal}' fields within
> memory_notify with a 'nid', as that is only what we need for memory
> notifer and update the only user of it (page_ext).
> 
> Consumers that are only interested in numa node states change are:
> 
>   - memory-tier
>   - slub
>   - cpuset
>   - hmat
>   - cxl
>   - autoweight-mempolicy
> 


All looking good to me (and much easier to digest now that it's properly 
split up into patches!) :)

-- 
Cheers,

David / dhildenb

