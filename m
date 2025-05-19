Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E6124503F
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747640668; cv=none; b=ZcO2BgjQAfPueTkqRlDzB3Lp7VDq7Wnfa9TEzV6yt1VH7TU3JiOf5w+ukXc4tFhbF/gQ0ij9ohXTy+dP4cXoV0bSztKClF28AQSIHWSeLvVr/Y+GMU8S1PuCdFg3JUD6ti2paIcJJkTaaMe4OuUmg+npfEl+Ui9iGj6x54c4lEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747640668; c=relaxed/simple;
	bh=JHEebM/xbyqhAbBKkDFMnHpPHGh9BD9s8PTK0WMaYi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BZkNzj8XyqXg46n+jOnZoFwZTySaIul1k22rH20Sv/OqVC6VzNe73sMPfyOXrWQXhLIq3wF2u1k991zI73t4JjxoTgsr/FbEy1+auN11v1AXKvCtk3Z7n0T6eShNtaTgDOmLpSUxBkBIt2SChcEUfNv6SRsyVg4dIyoQtqazgo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K6i+FIZ6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K6i+FIZ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747640666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=laiW/cEBsMQxDenpx6Tkk2YfIedzB3Fb/4ulSxLY1DI=;
	b=K6i+FIZ646ja5nLlYQS069sjVp8++FcDN8r/yxpl03jITNz8F/Frpb0j048ZLHIab6ksh/
	1lkMeiQAQ3k17DNXLNtljQ7w/1yh6U2GkNMVwgtXayw+fAzqJYy/MWFmF4eGbRICDZfliA
	/O5QCStDERyfvCXancwcT2CIq0JkRVU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-h22-kUsPMOipyZU-C1r93w-1; Mon, 19 May 2025 03:44:22 -0400
X-MC-Unique: h22-kUsPMOipyZU-C1r93w-1
X-Mimecast-MFC-AGG-ID: h22-kUsPMOipyZU-C1r93w_1747640661
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a20257c758so3121459f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 00:44:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747640661; x=1748245461;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=laiW/cEBsMQxDenpx6Tkk2YfIedzB3Fb/4ulSxLY1DI=;
        b=OjIjodwnbobJM7HDW1mmufmtDFM23RwowzXlxChoSG1HumAndGRjdgk3IxAcmLheaj
         DopU7QoEsfqdlUBfS3xLjvviS5MovbiM6H91ViD/3F6KTko00QMvI3yP8rwbgpBQ170v
         MndowPme0qObl0VOB/8W7x69T4wGPXVpY02SjFf2MmHq+zfKUhuhopDFcIc0i1YUHlEU
         4JEMWSitAixP/AUT+zgXjGwA/zlKjIT7MclfyDRo90fpO0PyRf9xeqc3O0vyDtH2WoI3
         X7+ru6WRxWUK+NjvlhX/EQTeqgVAvTjcYJPu93T5U/F9Ec+nLTc//UasHhAIaIW7Lvld
         bNdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNtYnSTuS8QiLHiWc6vdKpn3YXc15XP+z0/WR/F2n2jPZC6EQzBupFfos4cBjZRi6UolGFieicfrQRwFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO2qH8ESOSOZN23+LnU815TgvvhEI4AGLRtfwz5ywHs69431US
	EhWqMw4TksIvfugaCbTEW1CV7QahqSvj4FYTI+808zUcyMvHqKdXddit6ligk21nRsuZMolyC1v
	T4/1mbMHdEE/5lNY+pn0523/PJXPN2ZrUhq4kJGKPCH53Jf0Z6bR9kzs+L++poUZPBA==
X-Gm-Gg: ASbGncsykL4wTNx87rH1PLxKb5VQMUmjK+Q5EjXVHZ3GFDr+gpNy2F+9QGRL6VFlEAN
	6zC7FK2ifHsOu8XQTZdElakIlwTzFAHaY+KyF6X9BloKGfnjxVDq5QmmoA4jLOtsU8sjwxcULlW
	N8jz9o6XNZyD680FePDLxTgRTKPbDZhg4Hr0ETdYY6dXpMi+jarpQ9LkVdS9JMiHgQ4aO4BGGAM
	o+q/ZTpMqjNxVFT4ZuMZ/E6CyAo1+T4Kzl0Uzqp/3XHid6fDZLPme8P4xbtUb2wTU00UlXqsgVk
	agNxXI1QsHCqpdw1kj2lxukgiaRi0BtuCEcfU25D
X-Received: by 2002:a5d:5f8d:0:b0:3a3:5614:38e9 with SMTP id ffacd0b85a97d-3a35c808b1cmr10951389f8f.10.1747640661271;
        Mon, 19 May 2025 00:44:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmoySAUXPSTVP99eFC9w4durUUN+pOvmqboW6NAxQH5QFxV092QmYXqvB+yvCAeYI0e4UdFQ==
X-Received: by 2002:a5d:5f8d:0:b0:3a3:5614:38e9 with SMTP id ffacd0b85a97d-3a35c808b1cmr10951373f8f.10.1747640660958;
        Mon, 19 May 2025 00:44:20 -0700 (PDT)
Received: from [192.168.3.141] (p57a1a707.dip0.t-ipconnect.de. [87.161.167.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d258sm11744785f8f.20.2025.05.19.00.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 00:44:20 -0700 (PDT)
Message-ID: <55f41277-f686-455c-a6ac-86c7e952beb0@redhat.com>
Date: Mon, 19 May 2025 09:44:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Make MIGRATE_ISOLATE a standalone bit
To: Zi Yan <ziy@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, Baolin Wang
 <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang
 <richardycc@google.com>, linux-kernel@vger.kernel.org
References: <20250509200111.3372279-1-ziy@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250509200111.3372279-1-ziy@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.05.25 22:01, Zi Yan wrote:
> Hi David and Oscar,

Hi,

> 
> Can you take a look at Patch 2, which changes how online_pages() set
> online pageblock migratetypes?

Sorry, now looking :)

> It used to first set all pageblocks to
> MIGRATE_ISOLATE, then let undo_isolate_page_range() move the pageblocks
> to MIGRATE_MOVABLE. After MIGRATE_ISOLATE becomes a standalone bit, all
> online pageblocks need to have a migratetype other than MIGRATE_ISOLATE.
> Let me know if there is any issue with my changes.

Conceptually, we should start with MIGRATE_MOVABLE + isolated, to then 
clear the isolated bit.

Let me take a look.


-- 
Cheers,

David / dhildenb

