Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C201FFC49
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 20:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750970485; cv=none; b=W1owjdOxXfAx7IokZ3sCRUjT1W8shbuTLk7P2lkHkmBjtZiN42OD3kfC5usjdSJPgx6ODQmQACR0eI9RB0nZQIT9nbgKh2v7pDMwSE8xkrRO6v7RueMx5DPmMrKqErH78dViY/yShsfbn8sOs8N7qTGJXm3szTD0l6lR06XxENg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750970485; c=relaxed/simple;
	bh=yO4nmXPlOE3qATYCBlrBBNyW0/AyKXF04RwCBvWMJm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZwzTjWe3eIQ/fqh+LCdCQaTDvEcsGfEbN4+H8G5afBe63sSfWtJtaHcLwfJpskVayhKsk14zSCCvdhn2E/kNhR6OCpV59br+ElJFyX7RYlka2p9OfMMxr4Iqp8G6iIDSPDEJJp/Scowy00yB1qZ5DxT0U2cI+ESoXn90g4W+y1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=igGQ166U; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="igGQ166U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750970483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=McFwiUl5A+mzAAL3ucys/TS38xH7gm0pAeK1El97cl4=;
	b=igGQ166U2th5ZCCTp0AcjR5kwkHR5qIG06d9Gb1yp4Juu92fCMugl+pr+UzRQl+gg5Gs27
	xXBWryMbEDp+CFs8lV8RF9ux3RzJdRN9epmBWrnWMYHexteOWIsWQSW8/lYbksmTMiUkXv
	9kgDo1VXLlEiIiIi6agEfEjN6OEbG10=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-312-hkF_Vh0VPt-xet9KoD51fw-1; Thu, 26 Jun 2025 16:41:18 -0400
X-MC-Unique: hkF_Vh0VPt-xet9KoD51fw-1
X-Mimecast-MFC-AGG-ID: hkF_Vh0VPt-xet9KoD51fw_1750970478
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3d3f6471cso194390785a.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750970478; x=1751575278;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McFwiUl5A+mzAAL3ucys/TS38xH7gm0pAeK1El97cl4=;
        b=MstIP6LNnkHCDe4bYCKkmeZNOPYjvt2jKcckTaORr8Rb6rGifeJngeSUdF/MI6sVzZ
         ipdmzGEU91h//UjupKOIU5pxTfcBb+gMpgJNYwaJQ4SIcRGaGZoeCLVo8BD1bon9np/3
         44wjAXwd35NnnLjTuKEdYs9CQAPoKNpinG+YXNYL3iA3pUMABp59fMdHQwLRrUQB94V1
         V04n/h9pPzHP978p5wZQz2VAMmdy3RgrrC9G+xZL8Zo2YiYyq7sin8MFSnkWBnkT+M2n
         Zc+Ws6G63RMFmEVE6dQWN2SzYCKVEviveZh40EtA2mOJEWyhS5Hkx8WQIZOD6LWr0pFJ
         tk3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxvQz7Z7X11Nam1GeurKtKPIKlal2qNvqZkZA9/Q4FGFLvro5M0Oung77K6w0DnChCroF9uHHEUANm0KU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4/ZBAR6nnKPFw2n2pqmZuL7BdwxhAE6fuvqktE8KV078cOfx7
	W/jxNNjG9yY7EP9cuRnnWrcu9IHzySlIjk9/Jy9piTzX7IGgOVmWOEJW7qxykHZC/SPfCvv0E0S
	aw93ha2qvDJZC26UN45pMyqHDb2nAxmzm3kuE9JarGdg6K2qNb77HC2crxQtTc+7erQ==
X-Gm-Gg: ASbGncuaZ1BEtWDYZ4hSVXyizDm+jxwbf0l+p5VVx0LATa3RmkXmZMtu26R7TL6UrRU
	MY5vls5xntrT5bDGsoWm3hU5WzLZwsRcZjI7e4C72jDNUKeCeplp7s8XNwvLDtSxf7pyNiNOzLX
	o917lud+ZwXnz5D3+BhF/xiMtjy2G9S16TzUfZKE7f3A3tbRuWLDlEe9ZuG2Km1cxzTfKPlyDIM
	sIc74GEJcmva/51kvbufmMtYqMYVxonkJXl8En3Ghkups0W8KiJIJ/DbTg//gCABa7NcbfGtGTF
	JQoOPJSzXvohcHMru8Jmjjw=
X-Received: by 2002:a05:620a:a209:b0:7d0:a309:b1a0 with SMTP id af79cd13be357-7d4439233eamr137642385a.1.1750970478005;
        Thu, 26 Jun 2025 13:41:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0VfaF5gy5sqyorzrlrj2psC5q6ithRQ3K38EnG2q1bcJiydt5Kp7n65cteWaeW097MHo8hw==
X-Received: by 2002:a05:620a:a209:b0:7d0:a309:b1a0 with SMTP id af79cd13be357-7d4439233eamr137637685a.1.1750970477399;
        Thu, 26 Jun 2025 13:41:17 -0700 (PDT)
Received: from [192.168.0.241] ([198.48.244.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44318800bsm43199385a.52.2025.06.26.13.41.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 13:41:16 -0700 (PDT)
Message-ID: <3e82680d-149c-4a67-b838-bc73c0be3e4e@redhat.com>
Date: Thu, 26 Jun 2025 16:41:16 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: man-pages-6.14 released
To: "Andries E. Brouwer" <aeb@cwi.nl>, Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, linux-kernel@vger.kernel.org,
 libc-alpha@sourceware.org
References: <uidtufql6ftz72im7w6zggeihwhuwgnpxwb7j46fbp6ryvzv4i@cwyp6ewepeob>
 <20250509112627.GA924923@if>
 <bn2rs76dkhejmthy2wvul4ho26zzlwtkfg474ztiwggkxz7f3d@g25omktsd3ug>
 <20250509121454.GA952723@if>
Content-Language: en-US
From: Carlos O'Donell <carlos@redhat.com>
Autocrypt: addr=carlos@redhat.com; keydata=
 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
 O0FatDMfJw==
Organization: Red Hat
In-Reply-To: <20250509121454.GA952723@if>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/9/25 8:14 AM, Andries E. Brouwer wrote:
> Hi Alejandro,
> 
>>> I wonder about the legal status of such a change.
>>> There is ownership of the pages, and a license that allows
>>> others to do certain things.
>>
>> I also wonder about it.  We discussed it for several (~3) months, and I
>> documented links to the discussion in the commit message:
>>
>> commit 9f2986c34166085225bb5606ebfd4952054e1657
>> Author: Alejandro Colomar <alx@kernel.org>
>> Date:   Fri Apr 11 02:19:48 2025 +0200
>>
>>      *, CREDITS: Unify copyright notices
>>      
>>      Link: <https://lore.kernel.org/linux-man/jpin2dbnp5vpitnh7l4qmvkamzq3h3xljzsznrudgioox3nn72@57uybxbe3h4p/T/#u>
>>      Link: <https://www.linuxfoundation.org/blog/blog/copyright-notices-in-open-source-software-projects>
> 
> So I read this last link, and see
> 
> "Don’t change someone else’s copyright notice without their permission
> You should not change or remove someone else’s copyright notice unless
> they have expressly (in writing) permitted you to do so. This includes
> third parties’ notices in pre-existing code."
> 
> The main topic of that link is how one should document new contributions,
> and writing "by the contributors of the foo project" is OK for new stuff,
> of course provided the new contributor agrees.
> In my opinion it is illegal to change existing copyright notices,
> unless you get permission from all people involved, which seems unlikely.

I agree with Andries.

This is also my interpretation, you cannot remove these entries without
express permission from the copyright holder.

In glibc we did not remove any copyright notices, but *added* under DCO
"Copyright, The GNU Toolchain authors."

Example:
    1 /* Map in a shared object's segments from the file.
    2    Copyright (C) 1995-2025 Free Software Foundation, Inc.
    3    Copyright The GNU Toolchain Authors.
    4    This file is part of the GNU C Library.
    ...

-- 
Cheers,
Carlos.

