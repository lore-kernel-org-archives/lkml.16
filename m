Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96F313D521
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 17:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749144875; cv=none; b=ZXv+i+400bhjvLLwnKyiPMp9rMGruGoVYXtkykTNUQSq6aek0tw2dxbrNjaE6RoObX52kEabPngfIokOtp684SE6yBfYmUuWFxi2PvWjilU/Gsx6ftbtWFTPEWLKJK2VWmmmOsTgRU6yIywFuKfM2pDfBdp9XeiaImqFmj2X3Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749144875; c=relaxed/simple;
	bh=2kKbWOin0RzdMTaui9GJA5fTWK65z8DnC8J39neg90A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JbNJKw+YR7RMb6lvQtgh2rId3PjVGVa6+eRZJHlEEvSou1ilFpoE2oBh37Ab1K5s3eVWBGMj+qGlZajPQjrHNlHjgB1jFtDbde1bVuRVMXsfJQEOyCB8jKeIk1kj92Y9tiB4b7DTKKiqCDuNWUND5rkw9v+CS/Lk97XwxVA07os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cefRyqHG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cefRyqHG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749144872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=N+VarYqLQuGgClJsa5xpg1rG90PvZ9CaNT9z4QUrLYA=;
	b=cefRyqHGb18uwJ0fXDPp6FWw4tX4V1Vs9ZmmUpSxeTUzgwaqlT90TNoNfj9LjmCe+sNTsu
	DyzdjFR5WqZi+IgxT3n1XEb8PYIPFbb9JYFLnQNXB5Lkf1pxWPK05iX/zIvFuGhYXMv7Bi
	N+JoWX7jd0Whvb6O5HjLSEGLNVDh88Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-ySIc_O3uMtuFNdiYlTnnnQ-1; Thu, 05 Jun 2025 13:34:30 -0400
X-MC-Unique: ySIc_O3uMtuFNdiYlTnnnQ-1
X-Mimecast-MFC-AGG-ID: ySIc_O3uMtuFNdiYlTnnnQ_1749144870
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d9f96f61so9005295e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 10:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749144870; x=1749749670;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+VarYqLQuGgClJsa5xpg1rG90PvZ9CaNT9z4QUrLYA=;
        b=Qq0a4ISe2GQ3ud4OvuGjWqo/QpgZQ147gtTzAIy8cdhYKe9h97MdLFhxDEsRBUBwio
         3Wx6hUeHGx66t42+Dy8gFoJ4AIfZSEoA0M4Xab+3/4Vo9qR3TbJZoKvF4m58mysHjvyk
         6JlWf5SOPKb/2YEKtl269+eTJdlCK1JnL38alD84sSn5JpGu562ET0YPSVysxLblsxUx
         aHc6l2c8igYdSz8OevK5xsdHyvf4Q4pXWBay0zpvv0uPftIjyWDSl+6Bhq+UnNyLwrZ1
         QkS+6fe7uBuvtBHFqESQyp9v/6NUL1zx5wdeqAvCCar0KdxoOO27LHuZVtslyQcqBbH+
         308g==
X-Forwarded-Encrypted: i=1; AJvYcCUZV6kdZLX7nYPRrZw4qn2jTfFrBxiI5O8z9FIjFcSUEuVZotWmggFajRcZqqobP8VdTDLnOAYkC4yf2V0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWHEfEjy9dXgP8wOeWKaVk9ROS3+YF4AlkcJax0sOizOqdMzi1
	qTq6Qr0ceF/ZcI6NDr1dPb9gbgcCoE94ME/kQG8EEkKdGSyRPJbZWwhyWL8GWEncgHGyLtK+KPk
	o77PXSeETupVPngev9+nT0MLtzUDbR2DRmNd9hINQG2zfQ4QoDyz0H9ouQQ/31euSig==
X-Gm-Gg: ASbGnctonXhPbThaLvkIdD8PV1bAtaZQDWT/HTC6bF96IBRt3hey85fC9kOWalbYewQ
	OxRl84nfTX5qlA1hdPcK3LHtBF5YgrnhdgXa6tvfyeMJ5Avu8P65F9PmOQG1VIv+pgDM6XLsmPD
	8glms3mHEgLZhJ7fohnuBX2EAKNh5vj5VJqCxoV4sMHS1Z5b8GUfgyllIcK0ze0H/aiMFUY/dE3
	Nags2JNLHU4ooLspzAVknVqX2D7RmRb5BCmZQTXKLJ9ATVT7/T/bOhggEZY3p1HARCNWy0LrDl3
	y8FRpTctIEelV+217jgkgnexCIfVtLbpKUjhehs3EyWPlWmj7rmlDEdKLfnPxfZT/by9wRh+Zib
	PGgiZRbHLpHNwjDnPhFhP5qbyrfcJ+Jp+PR6Z
X-Received: by 2002:a05:600c:3e85:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-45201427814mr2246165e9.31.1749144869664;
        Thu, 05 Jun 2025 10:34:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOIdwk9vIvHkwUdjltnf7udOV3nMdpRUY7MDy56aIo62nojlBrO6s9zCIJ94lF/1hMXSvDyg==
X-Received: by 2002:a05:600c:3e85:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-45201427814mr2245885e9.31.1749144869297;
        Thu, 05 Jun 2025 10:34:29 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2? (p200300d82f27ec004f4d0d38ba979aa2.dip0.t-ipconnect.de. [2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f991967csm31016945e9.32.2025.06.05.10.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 10:34:28 -0700 (PDT)
Message-ID: <beee85ae-8b36-4705-af96-1d65c40df215@redhat.com>
Date: Thu, 5 Jun 2025 19:34:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] selftests/mm: Fix test result reporting in
 gup_longterm
To: Mark Brown <broonie@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250527-selftests-mm-cow-dedupe-v2-0-ff198df8e38e@kernel.org>
 <20250527-selftests-mm-cow-dedupe-v2-4-ff198df8e38e@kernel.org>
 <a76fc252-0fe3-4d4b-a9a1-4a2895c2680d@lucifer.local>
 <722628a8-f3fd-4fb9-ae04-2313a52ffb36@sirena.org.uk>
 <66db3d9e-73a6-4fcd-8abd-db65cfff49ab@lucifer.local>
 <661fc4ce-839f-4c47-bc3a-0c864e846324@sirena.org.uk>
 <077b6af0-bef3-4f1f-b785-9e351d01a89f@redhat.com>
 <d039ca05-da2f-4317-be04-34edb7ad3496@sirena.org.uk>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <d039ca05-da2f-4317-be04-34edb7ad3496@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.06.25 19:19, Mark Brown wrote:
> On Thu, Jun 05, 2025 at 06:55:53PM +0200, David Hildenbrand wrote:
>> On 05.06.25 18:42, Mark Brown wrote:
> 
>>> I can't remember off hand, sorry.
> 
>> I assume in ... my review to patch #4?
> 
> Oh, yeah - it's there.  I did look there but the "not a fan" bit made me
> think it was one of the stylistic things as I quickly scanned through.
> 
>> What an unpleasant upstream experience.
> 
> TBH this has been a lot better than the more common failure mode with
> working on selftests where people just completely ignore or are openly
> dismissive about them :/ .  Probably room for a middle ground though.

Can we *please* limit such reworks to mechanical changes in the future?

It's just absolutely hard to spot these things during review (I did at 
least on patch #4).

And Andrew apparently just merges them -- and I am left with the feeling 
that we create more mess by "accident".

Anyhow, thanks for working on these tests ...

-- 
Cheers,

David / dhildenb

