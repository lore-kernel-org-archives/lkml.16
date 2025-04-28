Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F0BBE67
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745824633; cv=none; b=lhi57R8V/IEJIqOOYEgLGWb+gC7fjOEsJWVEXzDOKJp3GPttCD+2z9maAbFsYjxE+Z2F5kB5+m2vSX1j74dHrUGvN0nYFVeNOmGrGaixgt+875O6OKcB2RqAjjvTQAnnGO9rGki9ZepOMdT+7GHKOgm8kuCa8srSsGvQnOPy2qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745824633; c=relaxed/simple;
	bh=g1mPxgImG0xqRPec2HGaDGZpfAWfAk0Q5tb0N108Ckc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YXr5KAL6OFPMLD0b31kvK9DkrTfRDW38Pa4s46bIuBeTI+pAQTPjASoQWuHQ3WfGNV7GYUgy92ur9vMnPr/xdUKdO8S804mGLrcavJskfDmO7SfoJv+3sld1RIZKO1XMIBhhqvlPqkJUxDytECfV8IPl5qs6xqqlLqlcem4Z68Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WVsBY5Cz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WVsBY5Cz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745824630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nhkdL/FcHNvjV112Pm31jbZuzpdUuIEoR806PZPDUus=;
	b=WVsBY5Cz/wFK+GG8Ep9OSYZnosVi6XIAKFxhd1CdJGJe7/8u0BtRcx6kKXIgAG9+8iToB0
	BCy4O5WiRBe8P5Y5lopGN2ig3ewi/lRCFKRdjNO4sR0bxnuOU/feQI5VuEwPb3uwIh1oW5
	GsQkLUdo37qrZj14p8DywQ+F/t7JeBg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-P7OmlqeYPE-OEyYT5bNjiA-1; Mon, 28 Apr 2025 03:17:06 -0400
X-MC-Unique: P7OmlqeYPE-OEyYT5bNjiA-1
X-Mimecast-MFC-AGG-ID: P7OmlqeYPE-OEyYT5bNjiA_1745824625
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3912fe32a30so1434728f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 00:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745824625; x=1746429425;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nhkdL/FcHNvjV112Pm31jbZuzpdUuIEoR806PZPDUus=;
        b=ls6JXA/OC13s1MhrK/u17hPpg8jpOdpxwiDhDNaEu2wmVdqNDYVQ8F8k+WbRM/vx+X
         SwZukPY+54HRSyIiKQOrWw7L1yru8dQv30llLVWSQZdAWUAT5KOr5O+abNRK+5+6pR/A
         ix3G5prAeDaCoyJzOWhaLqJLCRfriHhLa8GqIdR8DLNHWEI85EDhIyrPB+/UXZ3Z7k6S
         K2DmhCVLR01RqyJ/1zY8+/+8+A80/4951x6EitMuw5oZeie3/bUxZnP9L8UwtQCi8xTv
         D2W30oiga7Tu6+KarTgfecYeUK5XfMAQIleRlV6k0W7Yh1O2BpkPDFVwwnt30TC3Ff8A
         ILIA==
X-Forwarded-Encrypted: i=1; AJvYcCWWvg2UfVKMNGV/WW3vkyZMTY5IYm+FJGHSJYkSniR0AR6teQbVWOEd1MLGZ//8115vSlksiDznUjCLyi4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxf/aLDr5WPHPHn10Ti5AnOSSCLEqpW2/mulAl17dAk/YbOKsK
	XpQ6y/SDMLQDP00xWhO/42x2tG8SmnzhGf907q+9Llrw+g3ppvJsOj43xEEeSP9eyjikgTqTTBZ
	fs64lBx9/AOUITh8oOqtrNiynWjKM3JhixydFK9SqTY2YkrHqf5Ir6ix9GSc9czbTekjr2A==
X-Gm-Gg: ASbGncsFvJ6HVgNW/d9D/OIjKj57vRSso2DXVZR+ZadsGvWugZUOwntHK3YR2qwP4Bc
	eV7IGkFkKczsqmKeUruaE0++L2lznvRQFil96AS/cN257/pR1maPszLId6RsWq2TZ+soYMRvk9U
	hvlzjE7KgnY5vv0j7ckVQ1wiewb6vskIq3IDHgf5MF7mXwuIJawQC4GjWijoqrnh3nTqelJcCCW
	atVet8m3QvWpYBpMVV7FxhkwbU6JV+3KdVTXEcpuu+uw6Al6A1/gCgCk0U2j/1w6HYJhdMHBtML
	SDxsOJxvDKdNBsgtt12Z9HaShS2U156MGs8icnbxFUmA/G3z/msmit06pOTnnTsP8+4iVuIMtlN
	CGrLn81/NjPwuVZhcurx91nhr0tdMVsV9YD5ikIY=
X-Received: by 2002:a05:6000:1a8b:b0:3a0:825e:8559 with SMTP id ffacd0b85a97d-3a0825e857fmr2775928f8f.53.1745824625273;
        Mon, 28 Apr 2025 00:17:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbFiRmvlPt1q5SFYiya7xVoJHgzB0A+anc2FlqgErcwTJ/UQHpw2aom4fuAZ5vDttAqlN6ow==
X-Received: by 2002:a05:6000:1a8b:b0:3a0:825e:8559 with SMTP id ffacd0b85a97d-3a0825e857fmr2775910f8f.53.1745824624926;
        Mon, 28 Apr 2025 00:17:04 -0700 (PDT)
Received: from ?IPV6:2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea? (p200300cbc72fea002f00e7e58875a0ea.dip0.t-ipconnect.de. [2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8c968sm10083251f8f.8.2025.04.28.00.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 00:17:04 -0700 (PDT)
Message-ID: <d8228c02-b5c0-47cd-927f-9054d412c7ea@redhat.com>
Date: Mon, 28 Apr 2025 09:17:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: remove useless code
To: Barry Song <21cnbao@gmail.com>, Feng Lee <379943137@qq.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, libang.li@antgroup.com,
 peterx@redhat.com, maobibo@loongson.cn, lance.yang@linux.dev,
 anshuman.khandual@arm.com, trivial@kernel.org, linux-kernel@vger.kernel.org
References: <tencent_C263C0783702591C464F887E3D3C496E6B08@qq.com>
 <CAGsJ_4wWK6B8GSc=cxPGnPU0Jt_o0YB55yk4+VNOm_hY_iditA@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAGsJ_4wWK6B8GSc=cxPGnPU0Jt_o0YB55yk4+VNOm_hY_iditA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27.04.25 10:22, Barry Song wrote:
> On Sun, Apr 27, 2025 at 2:16 PM Feng Lee <379943137@qq.com> wrote:
>>
>> Remove unused conditional macros.
>>
>> Signed-off-by: Feng Lee <379943137@qq.com>
>> ---
>>   include/linux/pgtable.h | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index b50447ef1c92..47c5a54b7551 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -1164,9 +1164,7 @@ static inline void arch_swap_restore(swp_entry_t entry, struct folio *folio)
>>   }
>>   #endif
>>
>> -#ifndef __HAVE_ARCH_PGD_OFFSET_GATE
>>   #define pgd_offset_gate(mm, addr)      pgd_offset(mm, addr)
>> -#endif
> 
> Do you know who else had pgd_offset_gate() before except ia64?
> 
> /* Look up a pgd entry in the gate area.  On IA-64, the gate-area
>     resides in the kernel-mapped segment, hence we use pgd_offset_k()
>     here.  */
> #define pgd_offset_gate(mm, addr) pgd_offset_k(addr)
> 
> btw, do we still
> need pgd_offset_gate() given that nobody needs it now?
> 
>     1   1168  include/linux/pgtable.h <<GLOBAL>>
>               #define pgd_offset_gate(mm, addr) pgd_offset(mm, addr)
> 
>     2   1112  mm/gup.c <<get_gate_page>>
>               pgd = pgd_offset_gate(mm, address);
> 

Right, we should just remove pgd_offset_gate() completely in this patch 
and simply make the single caller use pgd_offset().

I think we can even do:

diff --git a/mm/gup.c b/mm/gup.c
index 84461d384ae2b..05dd87ccce155 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1106,10 +1106,7 @@ static int get_gate_page(struct mm_struct *mm, 
unsigned long address,
         /* user gate pages are read-only */
         if (gup_flags & FOLL_WRITE)
                 return -EFAULT;
-       if (address > TASK_SIZE)
-               pgd = pgd_offset_k(address);
-       else
-               pgd = pgd_offset_gate(mm, address);
+       pgd = pgd_offset(address);
         if (pgd_none(*pgd))
                 return -EFAULT;
         p4d = p4d_offset(pgd, address);

Unless I am missing something important :)

-- 
Cheers,

David / dhildenb

