Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712265D8F0
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745413318; cv=none; b=AWETNdrO+wuSXVc9rXMOFLtpwq5AYeJ6ggNCJuVeb1wI7emmrCD3hVtmTuYbto4a/BLUe8u5Z5xMtb2NtdjEy1yhzxphEKrbDspMgxJS4HyCL3jF/EQsqdTJmFwzqeAWcrL10Vf+JKuV1CEdgk1foGbbSfOFnfHSZzRKrLIbN+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745413318; c=relaxed/simple;
	bh=BFIwDAuvOHbV99ODTkXNOxYVoa02YbeOgYuucyYTUoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JJGqsuOTIiNHBkfkIWzK4YYLuORC6LSqS7bhEWQyTO0WI4+lN8/n6Jb2BEHMF8Q4WgTEeUs3RaGWaZxZfA+vocqOK0uXTT6B5qzHfJGfN6G42v5MTGcjMRhYipGrsaxv8pdsYyHLf83j0TTHcmeqdTorzb4N/XPycLeNPDGyRsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lr+wEyAz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lr+wEyAz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745413313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sx4l1tbXkEG7PkOUiOZp+7tc1TMV8SML9VNZdb+RlOU=;
	b=Lr+wEyAzIAJhiexTVYW9UtCybrYzsxyLqH/6PbOi4WfUUNZlrNyyX+bS3VBXMzVYCvRZ0H
	tT1namTOFN7MNhEPlUbUvEQOjUc7E99xlNz1sgD04+WU7WEJilXeAlJ6neyhbcU8mx8urv
	+MMwhFyoRd/3+Rvi4vYIdtfvuDKZlUg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-6dDoYiTAP1WrqYGYctEYFw-1; Wed, 23 Apr 2025 09:01:51 -0400
X-MC-Unique: 6dDoYiTAP1WrqYGYctEYFw-1
X-Mimecast-MFC-AGG-ID: 6dDoYiTAP1WrqYGYctEYFw_1745413307
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39d9243b1c2so1921250f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745413307; x=1746018107;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sx4l1tbXkEG7PkOUiOZp+7tc1TMV8SML9VNZdb+RlOU=;
        b=qoy++Xp41/sYP8OC0HvW7rmqaE8rxYFuwFma3923icxddTOGf39Gz8vHyN4UxTu55w
         KevRXl4/W2cyVWrOcAg1B/5ZDn+VyNNBG43LFBbEt3BNjRbUp9w4JmyXum1k0gako8QV
         9eFMsx/0DRkf322vc6SN6Oa8qcapSL9W1qkXkk3fVu6kLruzrB27aF8P33TnuqtplO5A
         aI6t4EBH8sT/I9oMuAUCbVaj8i/e4ypQeQ2CDe5tS8D3y77KVnIdzAKO3SIwXQTSOc3b
         duDH1i8Xz5NXDi+l4z/rZ8auZ/F7xaJ2s7eCQSCuAoZTlf/QdQ8skj03E6LVuqgQht3m
         SIhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTp2fGdWz2EmoLPcMGAlNt0ScUrj5hoFSu1IHHUcPsQxmyFO7IGtQXJ6sjC1kc29jaw/vLPlsflUFsltI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqtylZ+dmMK3dpPe0IoconWyFklOMqUFvMNVSsqlvk8fxj1SEZ
	5qZ9YU6zX/2BlAOp3RpoFCfrG3EYAPVaxv8Z7ypdKBevdSgP0Yq+xJPglabs3Tz20dErIqUjqv6
	g9OCfM48qlJ0aSX74EDaZeXcXIwTtDAohtCBmjFmTN55rKSKo3fdDNfh/y3r3z04jveL1MuId
X-Gm-Gg: ASbGncu/9AyAptKJG4S9an6/WVDJqopsOIHo6exO0CJv9sXdQWT2/wqvwWe4s09Drzo
	zZ9YE0gH3MtyegAUbEESoUKewhsgv4DACDKXTpE+xOCfy+g8d7rbuSJMAHlWsS9cC6BSmw4/Fgn
	hbLRuL4IrzofwrN3izsBZIzwQMo+gbltLF2a4DGPX5kaZWVx1bH9Ly2lTsulZF+v3ivMDHrxDu8
	xaTvbKWPcZaHOJNFnWzeAbrySdG1Q4Hxtu7WDcXdvyE8sxXUN4iVpXEF2Gxw95kAz8roQ8Wp1Qp
	ajqDrKJ/qElAPuwqXT7KVzGyLOrhpfiizy9ER59y0ArZO1L5RV+leRC5ufO+Nw1aJlIbrq01xAC
	vt4MsRNgLiT9XqGZcaAb0eYrnoiaFGV+IgXBH9Hs=
X-Received: by 2002:a05:6000:228a:b0:39d:6f2b:e74d with SMTP id ffacd0b85a97d-39efbae02a8mr16858605f8f.39.1745413306822;
        Wed, 23 Apr 2025 06:01:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+n0jShfgBE9Ba4xwJ9QVog02mIMYqwyMNipJiDLDuKOGbjvThzg/gjpSFAeE9OVo5bsvZAw==
X-Received: by 2002:a05:6000:228a:b0:39d:6f2b:e74d with SMTP id ffacd0b85a97d-39efbae02a8mr16858559f8f.39.1745413306363;
        Wed, 23 Apr 2025 06:01:46 -0700 (PDT)
Received: from ?IPV6:2003:cb:c740:2c00:d977:12ba:dad2:a87f? (p200300cbc7402c00d97712badad2a87f.dip0.t-ipconnect.de. [2003:cb:c740:2c00:d977:12ba:dad2:a87f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493105sm18815418f8f.76.2025.04.23.06.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 06:01:45 -0700 (PDT)
Message-ID: <fc4570eb-fa84-4e63-9aec-2678571579fb@redhat.com>
Date: Wed, 23 Apr 2025 15:01:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add core mm section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250423123042.59082-1-lorenzo.stoakes@oracle.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250423123042.59082-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.04.25 14:30, Lorenzo Stoakes wrote:
> In furtherance of ongoing efforts to ensure people are aware of who
> de-facto maintains/has an interest in specific parts of mm, as well trying
> to avoid get_maintainers.pl listing only Andrew and the mailing list for mm
> files - establish a 'core' memory management section establishing David as
> co-maintainer alongside Andrew (thanks David for volunteering!) along with
> a number of relevant reviewers.
> 

Thanks for doing all that MAINTAINERS work!

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

