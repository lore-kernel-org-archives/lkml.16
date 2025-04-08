Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E307A267B78
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744105946; cv=none; b=stAFBxo9LEPHrD8PtfhnWtHSqANc16jV92SCd4K1g7R2wfSCJXL63tmKdVbT/eorGAqzt2B9xXYMq64bUX5EbuWlKTk0cy5ZDVZDGsCL/038v5TZjwxR5NAUXXlyJdxJOHyB0fd8aDobNvx4sZFwUvkS6+gas24ZlWllqQpAQdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744105946; c=relaxed/simple;
	bh=60csaoMkd9b4BLus/GgeNpMVPuRHpVoH48hsGkF0brA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SMAIVB0TjuucLYludLvvCy+whpFFtB4KWzK4s7/FskSsusfgJK5vvKYQtzPrnoHUj/atnBRSimnfTfExQzRRVWii7lxZHiqMitIF7554h9tBABZ1KpHqTFkE1T/w2aycgrx820aF/hHja8sXB2Qa3UB/nryQwIfj1IhRTNMqrFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WHv5fXN7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WHv5fXN7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744105943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5OZHISnONE4t2902PGwoKIvjQlqckwAUXfpsZ5bT8VE=;
	b=WHv5fXN7u0YVP7eRLfdCTTD5Zp4RrYncUC6E3wXZ/cheLbRO9uuXiARy4V3Zyxt0R6y6zZ
	sBwo1KuWHW0Xjr40LpzkUcjCvEuFB6BTGIlGsnbDZ9N809U9yU3UcwniyXHOj/MkBmcB3d
	0d8M78Ir09aILe2Fwv/AMcz6/kPXrjM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-1P6Jm_EpMqq7ujURnNKtJA-1; Tue, 08 Apr 2025 05:52:22 -0400
X-MC-Unique: 1P6Jm_EpMqq7ujURnNKtJA-1
X-Mimecast-MFC-AGG-ID: 1P6Jm_EpMqq7ujURnNKtJA_1744105941
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39c1b1c0969so4584384f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744105941; x=1744710741;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5OZHISnONE4t2902PGwoKIvjQlqckwAUXfpsZ5bT8VE=;
        b=eza+mW300f+EOaPCW8pwPuxviyZaRHYHbbyJwo7LiP6ZR9BZMhrsdCyL4hX57d4oF2
         ceNUVnWx1gA2RJtksYnJnYeM1TT35uKjG9T4NEWMRV4Ojwy570qHWgvaxz1DiIaJzD3y
         Qq36ys86BJrcosm0ZG57jeBm3lK283esmAtutIuv2sp56xUVi6MeYWkPmzaLzPQcsBzq
         9yrbwbPLGIJ5hKK6uaOFlgqpTr+2ah+XFRYjfdnN35zJW8YkOV78ifRdq5nDxfAimo2z
         Xw24IKZXx6b8+RXfpIegdLHFxQ0928bmRmqgFZj0lNvtcxN9FHPjediDaV+sGeGXDSAz
         KpnA==
X-Forwarded-Encrypted: i=1; AJvYcCUyGcbDfNBVmJ+I4/jb9FQkrF66pJ78kr7KQ+SNWyTDgm9YW2oS4BcTpp26MNGWW57sh7+sZ0aH4gF4nc4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8jYStoCD9al0bcO2PmLW+Nag/GPl/AOcqATsTFg3qCi0tjng+
	4JcbKtOM/d/n5BHMtl+jfg+leJ+8nmyvB7TWpaChsP0FrY5HwBlIh5IrMO5f9xf33sxU0MDqiBp
	ENyQQnzrPSVf80t0Zpz4aD0UbPwh5QOvXOlh8z4yqQ0UzEz1BgLV/w7Sdki5Zbg==
X-Gm-Gg: ASbGncvLopEWi1zmhavyhWrl8npYeqFqxg4yrdGmSG08rtJ40n1yn1WEukPIrXH5wqs
	dYO9KFlVeQ7poC1dbUNnQroJUQF0YXWpilqiXHFvujspmfZlTfWn2e6eBiRUbyfGM3Kjf/cyjsK
	DbFI5e6KMUqj2PbQsioF514oHzgvfLDMHAvHral73pECypKnK5Xz/7ka61XhvpS0Zcpa1YGMNaA
	y0lUgWYflkFV0N+YTKfR1FjeLkYxmu76YoBfahL1zUyZAiMsZvxTR3zcqch0CpsTVZYtOqXVGhK
	EHLA4UY4ew9HhKEnIA4ga2boFdoKhix6zZXG9gvhYRQzcRtFQA+FQHbpNKybJF7zNr2ikhxgiGd
	rMayw4Yc+dKnXrc0Zz7lZAeee+z0tTn7p3euGK4WQ
X-Received: by 2002:a05:6000:2702:b0:39c:1257:cc28 with SMTP id ffacd0b85a97d-39cbc73213cmr8872982f8f.59.1744105940822;
        Tue, 08 Apr 2025 02:52:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2gVGfjfruzCCWFTilzPtgfgunNMxeHGGBQBFO5rsVQP+31PZLP2Be7Tye6UxULUDwvgznqQ==
X-Received: by 2002:a05:6000:2702:b0:39c:1257:cc28 with SMTP id ffacd0b85a97d-39cbc73213cmr8872975f8f.59.1744105940450;
        Tue, 08 Apr 2025 02:52:20 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:4f00:a44a:5ad6:765a:635? (p200300cbc7074f00a44a5ad6765a0635.dip0.t-ipconnect.de. [2003:cb:c707:4f00:a44a:5ad6:765a:635])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a727bsm14307091f8f.27.2025.04.08.02.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 02:52:20 -0700 (PDT)
Message-ID: <c8bc199d-30e1-4f0c-868c-6cbab1fbc747@redhat.com>
Date: Tue, 8 Apr 2025 11:52:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] mm/gup: fix wrongly calculated returned value in
 fault_in_safe_writeable()
To: Baoquan He <bhe@redhat.com>, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, osalvador@suse.de, mingo@kernel.org,
 yanjun.zhu@linux.dev, linux-kernel@vger.kernel.org
References: <20250407030306.411977-1-bhe@redhat.com>
 <20250407030306.411977-2-bhe@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250407030306.411977-2-bhe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.04.25 05:03, Baoquan He wrote:
> Not like fault_in_readable() or fault_in_writeable(), in
> fault_in_safe_writeable() local variable 'start' is increased page
> by page to loop till the whole address range is handled. However,
> it mistakenly calcalates the size of handled range with 'uaddr - start'.
> 
> Here fix the code bug in fault_in_safe_writeable(), and also adjusting
> the codes in fault_in_readable() and fault_in_writeable() to use local
> variable 'start' to loop so that codes in these three functions are
> consistent.
> 

I probably phrased it poorly in my other reply: the confusing part (to 
me) is adjusting "start". Maybe we should have unsigned long start,end,cur;

Maybe we should really split the "fix" from the cleanups, and tag the 
fix with a Fixes:.

I was wondering if these functions could be simplified a bit. But the 
overflow handling is a bit nasty.

-- 
Cheers,

David / dhildenb

