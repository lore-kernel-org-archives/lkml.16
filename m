Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57971FF60A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857188; cv=none; b=HoGpi9U79HLCXBiVke5kL+nNyKFNkYJuG7ZGcXJVUyVqIjE0JNQRCrHw5F+hC6lWfX8uMnuuDfPg84XI4CVyxSfpvJRF4xBP3xeXz7zF5qQCa3A5O460x1BjRQ5/fzbVa/Av+60kxONvYx+ACDXBS169TqdMMujIdkrPp24O4MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857188; c=relaxed/simple;
	bh=qbVrJUOqtpcg4GZNYOu0Xyic/sq5QSvp1NE8aYZ98fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tu+Z5HWSA/m6ExJ1+hDKW4AqzqLLwrKDEjyCx2upjRx8NYciw5/w4JOAXyv/cwBlfRBeLU6qlsOjiJkXVhK7U61pYQLRnN6lHMn2DXNlWP4gGDfDj4VdYdg6gWYGVX/hbcXlM3sgyS2dYRwdiVYu2/f/nrL2aU80WY9n84k1oRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J41uq1+D; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J41uq1+D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745857185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VmOzNNa2lSW/GlQQhEhQ9IBRbBC+qenaKrXSKelhh2w=;
	b=J41uq1+DvOObkA+Tk/5Px9j2nAYpstI9KJhZqI6xKcSQxiOlNHzjefIv65xhuoDwiGZvap
	8tsnW/az/V4zYkdEDGLB/8xlki0kxYfjK7ohxR4pfV3Rm7aVAnwnnb+6hQ80YbN3LQAdpg
	IfdUUF/zyP2lYRxFudbwt++N5/MPmzY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-4R4b-jxhOvKdNYsGHkcTiQ-1; Mon, 28 Apr 2025 12:19:44 -0400
X-MC-Unique: 4R4b-jxhOvKdNYsGHkcTiQ-1
X-Mimecast-MFC-AGG-ID: 4R4b-jxhOvKdNYsGHkcTiQ_1745857183
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39d917b1455so1344581f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745857183; x=1746461983;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VmOzNNa2lSW/GlQQhEhQ9IBRbBC+qenaKrXSKelhh2w=;
        b=H+T9yxxniUJHF0sSLjUqY18kt8HyFss/I+bpR2Ij0hrdDXdvpv4FB7h7IxxdCKd0ci
         jruy7K5TOaJrIQjHFA1dmfdy4olog2WvdZtrqKOQM8MsNhoSIoqPmDugohzww7GDOb2u
         XK6mtAf3hgp7S5gWWMnvOEUZ6a/ttxqnK2IkZ30a4UP/nt2d/GpcSZudB2kb/vNHPCIK
         G5WKydtiYCSllJD5ayIswD5L8iuMbmO4Z1twFnTzrm2jrkjxqhRwAtntgiIWBq4CoVHy
         VFmAxygD4wV6rbTrZAHbZOeTO7PFKK71kwpHvvqtYf65daC7lkXN2Qd+jlXyoZJbEzcT
         gxrw==
X-Gm-Message-State: AOJu0YxglUwsrWIE7u5BqRuzN/HEYQs4ryg++Y1lFYqASveiqc/gmhmS
	Pd7TqJCJMsn/6fce2saXMUna9VRwFOY8dR542Qncl38cb377DnMgefEQobWZP1bCyVS3OBbZ50a
	FZ2W1WOpEHbprKH8x5LPG4Da2kvVqr9OsLT9AdsEb0PDeVXDe355Xu6wzC72l/Q==
X-Gm-Gg: ASbGncvmWCAUA7iLi+TZqRBzQ2EzZm2K10QnqSS36kOB7PXAqSzFXZfbV4m9TaA63r7
	g53jyGpswBy3Ve+TJMx/ky6gQxE6tRpn4IYJDaVLR0TRKuBm4PVgvfkY8JU1xuP1mhKFsKGZyVl
	QqImR1StjPhgGiTz/ftuttkWSMREjQSSzVvU1QU2jkfgX4oHchch64UJn5TQGsgq8scEzRevPD9
	WBOM3Eu0UWMslNUdMCkkDMyXMsW1l63danY1knEyja60g0IhUhwLZryDVkn+N6WuFG+9UlaC1PY
	WtadQbB3GvtVs1J2S3KCVxRGNIAJO3GVdzDE/Ua6X4lzJETot5xL6RDn9cpsOxmibWrIxZ+NqyP
	BKHUhItzdFnfEATZi2ELInwwagC5kT7auJ/bBWg==
X-Received: by 2002:a05:6000:40cb:b0:390:e5c6:920 with SMTP id ffacd0b85a97d-3a07aa5aae6mr6979536f8f.3.1745857182945;
        Mon, 28 Apr 2025 09:19:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfmXkFACO0g+j1lWpGRrjxvjpCuhLDHs85OpH7KxVI0nfzMRleb7eHjmZesdIvv0+FDZpOXQ==
X-Received: by 2002:a05:6000:40cb:b0:390:e5c6:920 with SMTP id ffacd0b85a97d-3a07aa5aae6mr6979515f8f.3.1745857182529;
        Mon, 28 Apr 2025 09:19:42 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f32:c200:9add:4a7a:46aa:f740? (p200300d82f32c2009add4a7a46aaf740.dip0.t-ipconnect.de. [2003:d8:2f32:c200:9add:4a7a:46aa:f740])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d29b990sm166199255e9.4.2025.04.28.09.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 09:19:41 -0700 (PDT)
Message-ID: <3feed348-a646-4a41-b9d4-9df788b3ef85@redhat.com>
Date: Mon, 28 Apr 2025 18:19:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/11] x86/mm/pat: factor out setting cachemode into
 pgprot_set_cachemode()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org, Dave Hansen
 <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-2-david@redhat.com>
 <da28d743-8622-46fc-aa60-5db9c776bd87@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <da28d743-8622-46fc-aa60-5db9c776bd87@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

n 0;
>>   }
>>
>> @@ -1073,10 +1072,8 @@ void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot, pfn_t pfn)
>>   	if (!pat_enabled())
>>   		return;
>>
>> -	/* Set prot based on lookup */
> 
> We're losing a comment here but who cares, it's obvious what's happening.
> 

Yeah, it's now self-documented :)

lookup ... set cachemode


Thanks!

-- 
Cheers,

David / dhildenb

