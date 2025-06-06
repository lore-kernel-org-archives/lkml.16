Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953A828850C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 11:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749210663; cv=none; b=MzygOOI/rKqLc5gRfw4LXb+bAa44+S028gbfKdyp3BNyzd1VdgpAJKCenzJFlhYEiJfowVz3dH8BPE6rMSHtphTOZ8zYP3siB0QHyL0HEw2UkJ3Wn3/htcC3R7V034gg6cpwfvxirroLN8Lvq+11kQYMxtRGyc0mA/AmqlLLv6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749210663; c=relaxed/simple;
	bh=rSVdPCfJzYH2kr5oMn102aWmnIZp5De7oGIaNPdkOeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KvmM4enYjvMpQijHGYUCFC/U+ym2+7EoBjx3ybeB6g/Pk/RyLH6DPKt7MJbbEMhv2H8AnAdffmxqAtHPRsf+VhMdur1yy3u8WYyzo/884EotiAVeFcTiLqjK/8lSYJmXMeRWN3rbFSFXPBFighhuYmomLZVjQ42U2LS3RttJD5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336--TLjSp-wNbOiWaOODJHs_w-1; Fri, 06 Jun 2025 07:50:59 -0400
X-MC-Unique: -TLjSp-wNbOiWaOODJHs_w-1
X-Mimecast-MFC-AGG-ID: -TLjSp-wNbOiWaOODJHs_w_1749210658
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a50816cc58so829340f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 04:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749210658; x=1749815458;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pYJGRqckhRe+BwZpb5JLIznIuBTO3J/tHjbtBqCbLRk=;
        b=JSl1hda2l3kS87p0zg32aaGQPgrN08DI5gLJqOdIbiBZEVNgrFSWxAxrRCjZPly0lV
         z1rJjV7rRKtIAbSad9v5hGP0/kIw5uCyswhG2LjldVhcErgBqAVggM2wqlQu127zqLfH
         UWalg2cujc5Vz435qFOmvvLyLt/D9sKnZFoTwp1ecUOhEeZl26z35p/YZQ+cOB/HzUNV
         bfTCa6+pBehOOpxSr/8M3BXcXraZfEcI9V/9sJBW1tyQQNM7TheKSfoEPWvV6oM83Uxg
         MdO1nyRZhWuUQqvBFwunLOJJjS2gTkWFgVzwunNy1KoIMf4JybE5aO7XSgr53xxVELDu
         Rdrw==
X-Forwarded-Encrypted: i=1; AJvYcCUZau8huKUtXIoIdC7fE5NVFODBsKF1UiJW8lM1Cgz/51fOAolm42tNUQUnazSxfOnsbU0KrmOwAvDfb3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFeitJPwceXssb/fCYb6CAuM1eM1ok1eq/q5DJMCu2qx602qz+
	CYQbh2o2KlZorTup7Nl4MaeLAStNKCEmgrQYpnK1rqEnx/IQz6I5N5FfLmzehRa0Vw67YJ0L9Oy
	/qZmOxBHMd0jTtYKZa65Cev1nBBYwnbk8LGwH3KAuJK9xyqD8YAoZQ7eWWVdncaf8Rg==
X-Gm-Gg: ASbGncs41n2JwDs/6+uaXCcQGog6o4KD5SSHb+vsVhWbs4BgqUeqiRRZKpQ83hBkoYK
	fhk4V5jQW0PZw5Y7E+yo8YfbnR3QOHoJsIQz7u7C6hVCa6ok7LQcCW1E178OIUtRACIQSPh0Uwc
	oN2D8YjSelGvEA3lcVc7X8Z/2ceBxY4oqUUxwfl9TAhgCF40nZn22lEQslw1+5X1/r2DQr7Qru1
	4v+4ePamhTWGVqJ0jAljKt94bMswH9rieCOSKghP7OVDcduqPymq0O/WihHNWUHzHnTfKIGZnXm
	HHLiazl1qYQ6xI6eQAl503n2EsGglumXhTNWx8AsFme48IxJITtrZs+z1775thyIaNY5AXGRkMR
	/EbBhpViN0s5XSg76y6RVsGG5bYgIkGo=
X-Received: by 2002:a05:6000:40ca:b0:3a4:dbdf:7154 with SMTP id ffacd0b85a97d-3a531cf497cmr2521464f8f.54.1749210657965;
        Fri, 06 Jun 2025 04:50:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxlRZuyjqfxkJT9RqmeW3tRY0Za5IaocilDs8flVHqJyxHY7fHsk9RsbeeS7gy+19xAXOSBw==
X-Received: by 2002:a05:6000:40ca:b0:3a4:dbdf:7154 with SMTP id ffacd0b85a97d-3a531cf497cmr2521437f8f.54.1749210657548;
        Fri, 06 Jun 2025 04:50:57 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:9c00:568:7df7:e1:293d? (p200300d82f199c0005687df700e1293d.dip0.t-ipconnect.de. [2003:d8:2f19:9c00:568:7df7:e1:293d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229df09sm1665363f8f.6.2025.06.06.04.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 04:50:57 -0700 (PDT)
Message-ID: <16459fe6-e449-4fa6-8e63-1ed71cce627b@redhat.com>
Date: Fri, 6 Jun 2025 13:50:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/10] mm,memory-tiers: Use node-notifier instead of
 memory-notifier
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250605142305.244465-1-osalvador@suse.de>
 <20250605142305.244465-6-osalvador@suse.de>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250605142305.244465-6-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.06.25 16:22, Oscar Salvador wrote:
> memory-tier is only concerned when a numa node changes its memory state,
> because it then needs to re-create the demotion list.
> So stop using the memory notifier and use the new numa node notifer
> instead.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> ---
>   mm/memory-tiers.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/mm/memory-tiers.c b/mm/memory-tiers.c
> index fc14fe53e9b7..67f06e6264a1 100644
> --- a/mm/memory-tiers.c
> +++ b/mm/memory-tiers.c
> @@ -872,25 +872,25 @@ static int __meminit memtier_hotplug_callback(struct notifier_block *self,
>   					      unsigned long action, void *_arg)
>   {
>   	struct memory_tier *memtier;
> -	struct memory_notify *arg = _arg;
> +	struct node_notify *narg = _arg;
>   
>   	/*
>   	 * Only update the node migration order when a node is
>   	 * changing status, like online->offline.
>   	 */
> -	if (arg->status_change_nid < 0)
> +	if (narg->nid < 0)
>   		return notifier_from_errno(0);

Ehm, why are we ever calling a node notifier with nid < 0 ?

We shouldn't do that.

Can be adding first / removing last from something that ... is not a 
valid node? :)

Maybe it's already do that way, in that case just drop this check here.

-- 
Cheers,

David / dhildenb

