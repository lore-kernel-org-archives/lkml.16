Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C63239E7A
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 08:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746694410; cv=none; b=AnQiGmuA1qKQt9icVcrcY0J3CEgaNJHp69w8XP7sgGoHstxv6LrrCvRxknwRIcE+LVJCn3LGZPJhT2uhfBzwgb/oVw4e4KRl24w/Bm8pp1wLK5YfsVVUijxlM6OcBxqUs5zFBtaCJ2HR7p8EAILvL3Dll297frwWzo5Y6T1C6Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746694410; c=relaxed/simple;
	bh=HAjsB5Gw8N9moh5KeeTbnmkIqkCkuQqLeh9viFVSLcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jgy4WGaPCNV6jJTp84oi64/gloPSLRfQr6y5e0JkXnR5XNuWpnwQwnPzwROkkxBLsoupCUybd7bBvup8NydhR8RtShL8Ai9MSDS4RVJ+1bfZFyCruD02PHb8WHRwzPAyE8/RVLKtBO07HbcFC7dWmYID3IpawrsNvthMDv+rFQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UD8fcni2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UD8fcni2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746694407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HDnr/Gb76arBesUwO13URL1dkjwySu1tR6Afq6uoTIE=;
	b=UD8fcni2WrVhrZnCCrw71D2iTGeeZoV7aA7cEHf5GNh3lXOYLHTW5isF3fQtFNXzRm9O73
	zrVsahjQ+EPPL5tVwyPjKXt+PBSri6RBZ/dsndkio4Jk3hZsck0FbNdMSk0egYCR6udt2p
	LgpFYElG4GD8lBHzyFn0/ckR+Ffzuwc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-0o6KChJdPEaJ7fNBJnHbRA-1; Thu, 08 May 2025 04:53:24 -0400
X-MC-Unique: 0o6KChJdPEaJ7fNBJnHbRA-1
X-Mimecast-MFC-AGG-ID: 0o6KChJdPEaJ7fNBJnHbRA_1746694404
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a0b1798d69so297752f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 01:53:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746694404; x=1747299204;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HDnr/Gb76arBesUwO13URL1dkjwySu1tR6Afq6uoTIE=;
        b=MfkKalFpSHl0E1XZYSwgoHgigrHuXASbcjuVCkFPn9MWOt/jvuwtbT1TjBVgM4Ia4z
         KZYi5dyhyGo2beW4P3rAibfBLxBNgH967J1hiURQsTh9md/9qrbeDDgeZsx5IxAz9LP5
         uUAgtsxfaF/R6IMpAiMqduEG1c/ycTKum1E7adzlahhraqeqbRQP75/aNaOAtt4+vOTT
         YE/yCxo1IL+yAOmlr8XtU/Qtd8KVGcoQ7sAVpaJe3MrCEoQdl/+prfu1Zwb3Gfgq1BL7
         e6qbem31BvOR+8BTEzG1ZL0HQrcj7ranT7UcmywPYaP03KS50OuNCu2PmHyeSe7tqVyW
         ZNWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWwET3O+Eyh4XZpn4TA2koXv2+h5qO/MHhJGcYE68TQol4+UPojZ1pw0iuYcHS9sWR/DB7KVZuQpxsA+8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+CBT3xTwevXFiKweJYYe04n+9gfjaYeyedS3Ir7lBPYl/5/8l
	WkhjRvrKYq/uD+r+u5O6vZ/OdXrf0Ks8co6+gceotFJ5cS0wyTqVt8cYQVIZpt5spWCZSPh0DI/
	ApSJene1muu91D0Pr08NxqJCy4K+qMCInHs4lVHC37AKfN+B5u0L6TH0XZN17xw==
X-Gm-Gg: ASbGncux8xmqteoHMbQ1HVgHmuWCqR0hAMOZovHfLk99aWBtXJgVxZOxmPvRZOFv70T
	umeeANeP06/CONjz2viOQFPhiz9rl64bIGte0EjuSshuxshOad0amR7sUfd12JiFwNdOfzKzD3K
	FVonpq5ZezaW69Z+AxbEVC+t673IUAMPeCFKeulh5uALDc4lspLUXlSNfH+hyEwBw3cT9PJEW8i
	JjdPx3UxUBHVDI536+/l7vLHON8QNDt+AxRHzjOGuGmQ15s1b7W7t5OwbrfRdxhvoOu3fRFQ/sX
	qPPHc075uVbVGeCSa9eKLFdifAa5hzdoMxlIIDQySIt0MLoc7PtuRXngiwyEHg5HBMNOgw2ES60
	a8bYjKgvQCGObsqn+zsJGlkqgbIZmqnpahEzY+fQ=
X-Received: by 2002:a5d:64ad:0:b0:3a0:9dc2:5e0e with SMTP id ffacd0b85a97d-3a0ba0999a2mr1621431f8f.11.1746694403672;
        Thu, 08 May 2025 01:53:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpqgYSjIjZmKkbgQcMtIzFo5/el1c2AHzzcZ/Blw8bOzE3YQAUDpVc6jfE4p8q87WGhFpAdw==
X-Received: by 2002:a5d:64ad:0:b0:3a0:9dc2:5e0e with SMTP id ffacd0b85a97d-3a0ba0999a2mr1621417f8f.11.1746694403335;
        Thu, 08 May 2025 01:53:23 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c? (p200300d82f3e590027aa5f4ab65c3d3c.dip0.t-ipconnect.de. [2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0bf6sm19799102f8f.18.2025.05.08.01.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 01:53:22 -0700 (PDT)
Message-ID: <e3e2663b-2749-44c7-8452-ffcbf2167572@redhat.com>
Date: Thu, 8 May 2025 10:53:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add mm GUP section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
References: <20250506173601.97562-1-lorenzo.stoakes@oracle.com>
 <20250506162113.f8fa0c00e76722a1789ec56a@linux-foundation.org>
 <c4258dfd-14ee-411a-9fa7-c4a1fa4fad1c@redhat.com> <aBshiBX_N6hhExmS@pc636>
 <13a32f52-dc5c-45ef-b45a-585586868509@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <13a32f52-dc5c-45ef-b45a-585586868509@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>>> (looks at vmscan.c)
>>>
>>> Current maintainers (mm/unstable) on 20 biggest files in mm, Andrew is
>>> implicit:
>>>
>>>   $ find mm -name "*.c" -type f | xargs wc -l | sort -n -r | head -20
>>>   198195 total
>>>     7937 mm/hugetlb.c		# Muchun
>>>     7881 mm/slub.c		# Christoph/David/Vlastimil
>>>     7745 mm/vmscan.c		#
> 
> This is, as Andrew rightly points out, a key one, I will have a look around
> the git history and put something together here. I'm not sure if we will
> get an M here, but at least can populate some reviewers.

Yes. I would assume that at least MGLRU people are reviewing this ... 
and probably memcg folks :)

[...]

> 
>>>     4703 mm/huge_memory.c	# David
>>>     4538 mm/filemap.c		# Willy
>>>     3964 mm/swapfile.c		#
> 
> The various discussions at LSF lend themselves to suggesting people here,
> can take a look at this also.

Yes, we should be able to come up with some R.

> 
>>>     3871 mm/ksm.c		#
> 
> As per discussion below, thanks for suggesting yourself David, I hope this
> is a case of 'well de facto I am maintaining this'

Yeah, it's exactly that I'm afraid :)

> rather than taking
> anything new on, as I worry about how much your workload involves :P
 > > I will sniff around the git history too and put something together.
> 
>>>     3720 mm/gup.c		# David
>>>     3675 mm/mempolicy.c		#
> 
> Ack below, and will take a look here also.
> 
>>>     3371 mm/percpu.c		# Dennis/Tejun/Christoph
>>>     3370 mm/compaction.c		#
> 
> As you say lots of R's which is good.
> 
> As per below would you want M for this?

Probably we'd want a migration section with sth. like

* mm/migrate.c
* mm/migrate_device.c
* include/linux/migrate.h

And maybe we also want also the following files in there (a separate 
section might not make sense)

* include/linux/mempolicy.h
* mm/mempolicy.c


MEMORY POLICY AND MIGRATION ? I think I should have the capacity to be M 
for that.


mm/compaction.c is a bit in-between the page allocator and migration 
right now, but I think long-term stuff should simply me moved to the 
proper files and compaction.c should be a consumer of migration 
functionality. And likely compaction.c should stay in the "PAGE 
ALLOCATOR" section.

M for "PAGE ALLOCATOR", hmmm ..., I was hoping that Vlastimil might have 
capacity for that? :)



Not 100% sure what to do with

* include/linux/page_isolation.h
* mm/page_isolation.c

(I hate the word "page isolation")

They are mostly about page migration (either for alloc_contig... or 
memory hotunplug). Likely they should either go to the MIGRATION section 
or to the PAGE ALLOCATOR? Maybe MIGRATION makes more sense. Thoughts?

-- 
Cheers,

David / dhildenb

