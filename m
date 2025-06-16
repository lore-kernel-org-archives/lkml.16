Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE7B111AD
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750063959; cv=none; b=sNdFNREH/3NtiP8UkJUnL64ArqMrNGn2UNPZFEU7nzicUIP9nF7bIbZnF3aw34et1YWIqmwHvc2aoRkCknIpphwchOQZoHFfU/SwmVLX1vEbq72kcHImeEF4JKiS23PBRUPdTiQ/dY6Q68gJeLEIClj/IK42zHWl9ddT0rFoWCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750063959; c=relaxed/simple;
	bh=TyxpSP78nDCh3Vd7Wbl/3HT5AyOJ05SWkUzJt4gc7j4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s5tVUOpTtYBQE6cN9SBMJpvuC9uRTbONJqyh7vkYWsTR6JK1SfVsEoWsvO3KzzTIJLJnbLbGX+VTlaUh/scS6Miho0Pd0zLLbiCjlKQktDfFzXbleQFfUAAi8F0R5hycpftaFkhI1Gf0f3OJ2K9DN0VVkHtMo7ZFM/Bx4CL7ljg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SxjC98kR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SxjC98kR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750063955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fPHIMPvrBzoREu1VcC8X9lDpNoQrPz3OTuINv7K2wUc=;
	b=SxjC98kRo06gWosbuEWvux03pKttpi+i1k3rlzX/acgCdkPeEHw6MM3HhMeLm8eimg8Win
	aP0UEVW1j3KyjgoKWSwkDYOEvNNYNEtGht7WSP3bnBUgaWMLdwVdb7BBys/XR5hk/Y8OX6
	B1loS3tf34KNGdLJ7zUNYv5F71yH0LI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-nh3pnL8DP36GXINtlWOrqw-1; Mon, 16 Jun 2025 04:52:34 -0400
X-MC-Unique: nh3pnL8DP36GXINtlWOrqw-1
X-Mimecast-MFC-AGG-ID: nh3pnL8DP36GXINtlWOrqw_1750063953
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451deff247cso26411265e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 01:52:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750063953; x=1750668753;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fPHIMPvrBzoREu1VcC8X9lDpNoQrPz3OTuINv7K2wUc=;
        b=BGR9ZXIZbXwE5SxAfYz+zpqxm59AG1k8bv7/z5veysF9obvQuUqqopYhT5NhleYnQ6
         P9J6rTP0opMpelEx8ud1nyNWdNpNHPgH82xRN53IDv3MU8jbLtMb/odW7Kj0e0e+J9yk
         xCwpOoucoYNsa4C8xJwyQ36mU/1dhwMbLwxfNFymUALg/Q105oMXWCFc7FV+DTkgwRbB
         4jE5CtKMERypYzXNK2r6sD5Uf62x4ndGbI+UOKa7XSXUh0GVuDMh1S/QAbnlZjUr224B
         AWUH4G0nIkyhWt8CDdYDpGgFYzjyDX1uCuMye2EJZHF5NxEOduLGPRl7aVIQboiJT+Hr
         bzaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXps3gT8Cjz66K7lja5ZUleaV3ZySQLNNL2U/hQlXiF8UG7xIQTAi1A0G9b/bbUxDaJVohMh4f4k/gncus=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz94QthVdlAi8DIqIhMconOE+RjG4vfZluNtFSVRG5kHmRiVKA0
	td0Ct1FZFaCWvQ8Q2P0xdEqOGYcXygdMILCgkcumuEPrazDmnzInuoC97YZeOAYP5lkJla/6KJs
	Nu+3qRlfiioxMPVOKfNrwqHQneLTr8Fm0DcuGx63SxsmUPFGU0gtblF4bvYkhYUn57Q==
X-Gm-Gg: ASbGncsC5xFQP031TXyOLs/FnFlJHf3QSxFTDdT6NmGsuNE0bFR4O+utzvRZbKBwT6D
	iMWmXfpwNh6YDkJCMwNFpnqYLs6hqM0+9q8wYYsRRRfsTRVNYKY5FNwA3e7kRoYol2h0hOxr8Zx
	om6bXxCIWRYXyP8tqr4yyFgUhfCg/JwntZQxYhpEmUYCKjysrTf1Uli8KUvrGxmVWomihCHG/yQ
	gC8TfBCztAvpHzZ6Whu9yYRWKNeAXvYGPEeFLIbOBXJSCfOdq9cAgn8rovV47zY6I2ZqAZZz8zM
	Kd9lRGkG+Xq8SHGSFWyGTZxgvAymB3K2tG/FInyYAT9sqaSYy9joKasrCec8p89JEaN6+mc8U92
	7MHjVj92JIyXBtMOmINpg2pLEHpwYUz6DUa5usXkyUbX2CjI=
X-Received: by 2002:a05:600c:5908:b0:453:827:d0b1 with SMTP id 5b1f17b1804b1-4533b235e16mr57473095e9.2.1750063953023;
        Mon, 16 Jun 2025 01:52:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9GnegdK/3E3PNxqRuxb0/vNwMKp7H5Yg1NntIPro7VDqQfx5r3w41L1vEP8lrERepH6JIBg==
X-Received: by 2002:a05:600c:5908:b0:453:827:d0b1 with SMTP id 5b1f17b1804b1-4533b235e16mr57472965e9.2.1750063952648;
        Mon, 16 Jun 2025 01:52:32 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:bd00:949:b5a9:e02a:f265? (p200300d82f25bd000949b5a9e02af265.dip0.t-ipconnect.de. [2003:d8:2f25:bd00:949:b5a9:e02a:f265])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532063ebf6sm109069235e9.3.2025.06.16.01.52.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 01:52:32 -0700 (PDT)
Message-ID: <360f2f04-4542-4595-bf36-c45ed10335af@redhat.com>
Date: Mon, 16 Jun 2025 10:52:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/10] mm,memory_hotplug: Implement numa node notifier
To: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250609092149.312114-1-osalvador@suse.de>
 <20250609092149.312114-4-osalvador@suse.de>
 <2bec8b53-f788-493e-a76e-1f804ed3aa0c@redhat.com>
 <aE_WG6bnjtLBzCp8@localhost.localdomain>
 <10c87a0e-c9fe-48fe-9bbd-16afd244b4ec@redhat.com>
 <aE_a4_rGbMLJKBIs@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aE_a4_rGbMLJKBIs@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.06.25 10:50, Oscar Salvador wrote:
> On Mon, Jun 16, 2025 at 10:39:24AM +0200, David Hildenbrand wrote:
>> It's suboptimal yes, But to get it right, you'd have to remmeber for exactly
>> which notofiers you performed the calls ...
> 
> Yeah, definitely not straightforward.
> 
>>> I mean, yes, I guess we can put the burden on the users of
>>> the notifiers to not assume anything, but then yes, I think we should document this
>>> as it can lead to potential misbeliefs.
>>
>> The burden is already on the users I think.
> 
> Yes, it's already on them, although I'm not sure if all of them are aware
> though.

Probably worth checking, to make sure we don't have accidental bugs in 
there ...

-- 
Cheers,

David / dhildenb

