Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572BE28934B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 19:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750101569; cv=none; b=ZscFZ9CbrnUN/JjBXoQjU2W46ThtMNUum/Deo0vJs+yH48L01ipAO+k/VvlJm/vzxYV73Zg9+ZGG+HWLIN3XCanIilgtajWoqWml39P6/tHIVmfX2xJcjD08A/ZGMnFpNGskj/HxS5Ruq/oThCmeVgnccJA1d02wcszuyUHLaHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750101569; c=relaxed/simple;
	bh=mdIp3vB5Ha2CBwub/+NszE6ufI2ImASNO4IUFcNtGTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oTHp6RtaXF631OixFFfKoYDVz2QLcWEXErw9bPCHw1Bjf7sP9UdWAr+WxXec4aPCTvsECnDqDWqU0uoJCjXaGUaUyf8xEMEnlPk5nF6CdpPGi6y1cyNLgV/plrXMMEklcZkZBSa/7b/I3BS9QkpAHqA5bSb7u7XDiHvFXtdhPlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RzPnasRd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RzPnasRd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750101565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=EGTo+qwi+5/6fxTtPdb2ly3uANZ/FhKje73zzR3iPNE=;
	b=RzPnasRdNISVxIEAWLBdexbDFf4CZTgcxoFgeFncILJ+P1lwLC2DsXzps7klDO/CCya754
	sk5i1+96olwgVO1LwZNv6CubxCKusfqVfsd8SjC3imobzd1Rxf5A25VDhg99CzetGIwGhP
	TMMPxzNNogftjtIiA03zmxbREfFLEFY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-W6uFnP9eML-pBcTmbscpkw-1; Mon, 16 Jun 2025 15:19:23 -0400
X-MC-Unique: W6uFnP9eML-pBcTmbscpkw-1
X-Mimecast-MFC-AGG-ID: W6uFnP9eML-pBcTmbscpkw_1750101561
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a578958000so714250f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750101561; x=1750706361;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EGTo+qwi+5/6fxTtPdb2ly3uANZ/FhKje73zzR3iPNE=;
        b=KZ7Q3jztfpHRqTgKJDoD4Msg8tZQKmpUgryOWJAuzBM/wVF49D4NZ8CoTvhSi0DsNm
         2/uC/QGZA1rq3KaN7gvgbYK6TvTDvXk9DLEcxbBuGWlJjPtVHkMyqVRq90MQL/7efCID
         DJztf6MMvCWIShK1WzsuMelYEeY1sJvYW/sS8rx8H5tfK1Z+1LpkcLB7f8H8BxEl4I0A
         P6uWeFRT4mydtzNziliyMq9NutViU6UEbQX0Fu6ZjH5D/D8/Ujn99wAX1pyo+Rl7ODce
         Fl9AuzrQF8eeYaanBX0z5Bj55XD6fjK8+Y3wB/yHaKzCjV+1sTKvg7Dj4IBVuBap2ocl
         Al7w==
X-Gm-Message-State: AOJu0Yy0b7hxq5Xti1szOVBUR0toxOhnnhqfVsEt21glFYLF4eR3Vrh2
	3ALK3FOPwq93gZTKpl7YEVuzAUhQYCsoJyoKT6em/k3siJ7wEd76BdZj0qeaJ8V0yuspKUYtcjs
	2Bw1TLTAaqxrzKTvHvSPIPRK0Z3mB0pPnRtsSQ9y5Gr58Mra70FPXi5IMWTfk2uxxCQ==
X-Gm-Gg: ASbGnctSHOVnonFCg883a8RHGGPSbsLlaRjRX1CzTYTwfI4RFbx7ZApSQS5YAytLfzM
	s2/umEo12U0Jpf7YJvmyhXYrtqWhJgJZQCUys53KN127AheTS9CDnT0UaTolLvHuJ/mJFeu7hDF
	DX7UBb9+CZAsUXlIp3zU/dlBj+xHn2cAeLFLg2eESw1cZ4PozbWsO+pJOUa3LWZ2ibtqKX43GVY
	I85dVIOYaMw1pGhthAMM+DVk10cRa1sKLRSqp7HeXZTxb9/szz06Ogc7W47VNYWlmyzsgc8CbZw
	DGnkAQOxTkqYS0FllYN/VnUE35Ip3KjnzqR+XkXqUsSmLIAqoiT/LoeIvqfwbLAAsBAPCaujZy7
	YAnanMABz1b4R8uwcVsv8Ln46su0lyr6ig1tr0Y9gq6Dkk3vVDw==
X-Received: by 2002:a05:6000:402a:b0:3a5:2208:41e3 with SMTP id ffacd0b85a97d-3a572398dcfmr8187801f8f.4.1750101560799;
        Mon, 16 Jun 2025 12:19:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFs3BDyNI99FOfL9EqfjBXFMImnIbuBvtQ454XoX1IczJP2AVZQLkQUA3sGStbQY/8LT3R1HQ==
X-Received: by 2002:a05:6000:402a:b0:3a5:2208:41e3 with SMTP id ffacd0b85a97d-3a572398dcfmr8187786f8f.4.1750101560408;
        Mon, 16 Jun 2025 12:19:20 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3a:e300:c660:4ff5:5bfb:f5c5? (p200300d82f3ae300c6604ff55bfbf5c5.dip0.t-ipconnect.de. [2003:d8:2f3a:e300:c660:4ff5:5bfb:f5c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a7cb65sm12007711f8f.38.2025.06.16.12.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 12:19:20 -0700 (PDT)
Message-ID: <32c85c56-063a-40ea-b6ea-e49304447ad6@redhat.com>
Date: Mon, 16 Jun 2025 21:19:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm, x86/mm: Move creating the tlb_flush event back to x86
 code
To: Steven Rostedt <rostedt@goodmis.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux trace kernel <linux-trace-kernel@vger.kernel.org>, linux-mm@kvack.org,
 x86@kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>
References: <20250612100313.3b9a8b80@batman.local.home>
 <65bb272d-b2d4-4d2a-9c7f-d3d5d2eba23d@lucifer.local>
 <20250616150942.789c791a@batman.local.home>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250616150942.789c791a@batman.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.06.25 21:09, Steven Rostedt wrote:
> On Thu, 12 Jun 2025 18:24:30 +0100
> Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
> 
>>> Remove the events/tlb.h from mm/rmap.c and add the define
>>> CREATE_TRACE_POINTS back in the x86 code.
>>>
>>> Fixes: 4cc79b3303f22 ("mm/migration: add trace events for base page and HugeTLB migrations")
>>> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
>>
>> LGTM so:
>>
>> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
> Thanks.
> 
> Should I take this or should this go through the mm tree?

I suspect this can go through your tree. (@Andrew)

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

