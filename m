Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9D2223DEB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745499135; cv=none; b=NtrNVhLDdCpxHV8ak+X3aXWh0MUaNWUp2SQRs8l/uz+HFYTowJDbMCycWclr+tPdz+iqWNdKuju52oERqgUkn3sC0rHWTZyKSBUDz/8Q0yDjld5DX8QwTf8SY7AyU9F/k6afKcRp5wZmMXZPP95V1iaWXuv2/FwwTPaLgIHkg34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745499135; c=relaxed/simple;
	bh=WxavlHYxqhbphiWdxP8wl5N4Y/+pmCkO7olDuBp05rA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j5uJg5cGumFV9+s3vUiOL+vR1uUkvrBMGW6F6BbQ0+l3AV9ouAVWHocsSV8ga4fUQiJP9+aD8AOLw3i9IoE/PWQmFbe/ennnRtM/EgaYW1C0iGIHIWexYEimgNovA2cbryiMox/IhtYRL8vxEpC5dle7OP9E5oc8XsS/0Y5M9c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QiivjA1U; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QiivjA1U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745499132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=x5+RMXJ3kxmQ5rdVfz/jHw8k3JOT607lBl+hVQ0qhRM=;
	b=QiivjA1UVVp8i+YKxRw00Sfljh7CqeLa95Ni8UVZWZLruPzxgmjzOGDYT2vo5DwaaqfEnb
	ykn5eyM1nyNpzE6UFOuVSkJ+ScgENlOGzKNKUqAMbuIF7fP3wX86yKtVT7Pbk+Fea56w6l
	v76mBo3rCjnSA0iMTCwWwp5GV80mHfY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-ZJ4lF2LwOAqAN937FvQr3g-1; Thu, 24 Apr 2025 08:52:11 -0400
X-MC-Unique: ZJ4lF2LwOAqAN937FvQr3g-1
X-Mimecast-MFC-AGG-ID: ZJ4lF2LwOAqAN937FvQr3g_1745499130
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so7443345e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 05:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745499130; x=1746103930;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x5+RMXJ3kxmQ5rdVfz/jHw8k3JOT607lBl+hVQ0qhRM=;
        b=cJnzZPEIjz9vMQVu2X53IfTBYL/CxkuJvk0Wdpns148I36DUGpsAOlnXkbmpm2n42f
         N1Oeii+jpvGxvoeQZYdTuqIhWvCZpoAZkAewd6G2lvIH/AoGz5zYqndfNpzLyLewpIoS
         iPT/GmmmzKa2nGpqMkdk9VQTsjaP2veKzNXV6yyXcXT05Y2nza3S+7L7erokd5XYiqTb
         9tRiOp0mVWhugtR66x2z9tHnYHQxKrR0HGNHKLNcQX9gtn7iiO9Xd6RQ837TykFQCN2Q
         /y0szHI3vL23JSKpZiEjuFeKZdUfdrYakalb3cJWUmZe1jXsKMbxOzWmuAjEiSSwqabY
         qPBg==
X-Gm-Message-State: AOJu0YyXEXevq4lGDDvmd0Q9LWnNEEYOEE7jJXyCZdd13xbtwk4UtNm1
	+Rtga11it8Ri38JBHNLp1nMD/Jz2LxC0sCGYHWlL9iyfoZx0fav6DUzez6nw/Rrm876VgDFqBPn
	gkIaiAFWrSns6UX+GgJy8ML89437CcFXKJUxVYOijvEZwTfwZra3CBdT98ERxKg==
X-Gm-Gg: ASbGncuNV4Kfhj/l0F69jrM4cFvPieEKyGf5rhqqw8y+huqoNWsBHxwAO1hdw3UnFfH
	kfdjUAd2t8bDiaarDFGoUeBAUoMLEn/KXbSadRb3gNEeRTP5am/gPehbn8N7PBsMVF/ytHPW7/Y
	rZ9tixisAOwBz7EdcY0K84vo1kyPXxd3Ukgey92rQfMZVNHKRjT0nsS1jbEvSiwb0PUR3JR98UN
	GpCs0EDaJnCNoVylaIMRletnPDEUDpuwGGHNQ1PKRinHo9/NTx1iEJu+hd2xS0qsfC/QKtbJpMx
	47o3jqRbGGnkilcarTP3szv0kkCDjxAAL6gHeVHrXE1L/1NM5rqD2nEEf99CqA2QBE7Mbph8MgA
	dxhI7V6u3xJVKsX2KSnr47K1af/tIZH1xh0qc
X-Received: by 2002:a05:6000:18a2:b0:391:3d12:9afa with SMTP id ffacd0b85a97d-3a06cf5c829mr2155328f8f.21.1745499129774;
        Thu, 24 Apr 2025 05:52:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvre7DwE6fQVzZ0MPKI7xxBSCW0o51ehcvPsBf2ef2fMH6U9d5ArTtiu4JwJk2bx4vlaIHyQ==
X-Received: by 2002:a05:6000:18a2:b0:391:3d12:9afa with SMTP id ffacd0b85a97d-3a06cf5c829mr2155306f8f.21.1745499129441;
        Thu, 24 Apr 2025 05:52:09 -0700 (PDT)
Received: from ?IPV6:2003:cb:c74e:ff00:f734:227:6936:cdab? (p200300cbc74eff00f73402276936cdab.dip0.t-ipconnect.de. [2003:cb:c74e:ff00:f734:227:6936:cdab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d532976sm2031062f8f.73.2025.04.24.05.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 05:52:09 -0700 (PDT)
Message-ID: <d63c1eb2-d026-4ef5-bb0e-531a0c390f77@redhat.com>
Date: Thu, 24 Apr 2025 14:52:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] kernel/fork: only call untrack_pfn_clear() on VMAs
 duplicated for fork()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Rik van Riel <riel@surriel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20250422144942.2871395-1-david@redhat.com>
 <45b26168-93c9-4170-b7e1-4b51078a04f6@lucifer.local>
 <d3f71458-8c0d-44c9-9a03-868efceee93f@redhat.com>
 <33b972a5-a137-4b5f-846c-614e5f83409f@lucifer.local>
 <0101d903-af59-478d-b0e6-af5ba6619eff@redhat.com>
 <7aeaa30d-3fa6-4edf-82a0-e0c494ef3df8@lucifer.local>
 <9f78fd5e-a785-4473-8c6b-8267821db446@redhat.com>
 <9a9103db-95ca-47d4-921e-42b8368ffcaf@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <9a9103db-95ca-47d4-921e-42b8368ffcaf@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>> But maybe I misunderstand your approach :) Happy to obviously look and if
>>> not like some crazy thing just for PAT (you can understand why I would not
>>> like this) will be supportive :>)
>>
>> This is something quick (well, longer than I wish it would take) that seems to
>> work. There are smaller pat-internal cleanups to be had on top of this, and
>> the new functions shall be documented.
>>
>>
>> Observe how:
>> * We remove VM_PAT and that weird VM flags manipulation + "locked" flag
>> * We remove any traces of the nasty tracking handling from mremap+fork code
>> * Just like anon_vma_name, it hooks into vm_area_dup()/vm_area_free().
>> * We remove the page table lookup via get_pat_info()->... completely
>> * We remove the VMA parameter from PAT code completely
>> * We reduce the track/untrack/sanitize interface to 3 functions
> 
> Yeah this is all lovely!
> 
> OK this should hopefully be workable then!

Okay, let me polish that up (and see if there is any reasonable way to 
split it up), and write some doc+descriptions .. and do some more testing.

The VMA split reproducer is definitely happy with this already.

-- 
Cheers,

David / dhildenb

