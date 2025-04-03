Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9315A19CD0E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743713961; cv=none; b=RT3DG5P416uvPAaF9E/HZ+rGTygjYwTT2Bq8WdeTP9FM5E+cXH2CMGq1u1Nh7XsAwOCCK/QrZZDVxbc6xcFw0W9x0rlP/78SEH6X4CYxwTFrdeZy0Vlvo6cBKLbiR58vh6PsLZFdsmXWpSYOGNtnZPo3U0eSI+6lIHBcpsZ0xpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743713961; c=relaxed/simple;
	bh=a0P1Ypvcm7vsNFG9CyYoKGQYsQ55XPGkbHxldE31IGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s9rjKVFC27IPquORc7lQ31BzO6WMFRSWzyYxY8hXLx8JaHnhwvK+YEfIhcQehfFjf11U2em0Vqrxnn5sqr3SuD1wtQ4Pv7uWNHYu+LxI+8eole/Sye0yOAtlJfDShTUNAYe3b2RPOAXi+p1kKsYhZ5+ttIs+LhnGMAlokJpXC1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dj33VQGJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dj33VQGJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743713957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=okPcXkwc0pba7YOQSP6Wfu/C299mxzOOCAmFdcpAZ/U=;
	b=Dj33VQGJ8EsjGMBUX/RFDVOL6L/0gdLlHXv8Badr8bB0hUckz/GpBrAFGRLCOpTU/udbc9
	tOirRac6rrmo99BRNJIVOy3A16Kc6GB7aGgghMVBbIwL1m4SUoKWNwaq1C9l9V+gUoJRKE
	vS3aQ2e/gYOxhInlZ5hcONYwckLLhM0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-OTbubBHTOhmCb4sDx5eZzw-1; Thu, 03 Apr 2025 16:59:16 -0400
X-MC-Unique: OTbubBHTOhmCb4sDx5eZzw-1
X-Mimecast-MFC-AGG-ID: OTbubBHTOhmCb4sDx5eZzw_1743713955
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39c1b1c0969so1290570f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 13:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743713955; x=1744318755;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=okPcXkwc0pba7YOQSP6Wfu/C299mxzOOCAmFdcpAZ/U=;
        b=txZP04m7uYmbqeRlB+aTuNPZlmpROuqzYApGRycjqkgZu/nnHorURKvO9NqRp1xiz9
         SkAmIuSjQQ0MDP8UhVDxq6G+o1UkfcdoFNhOi69zsS5WF3bLd+uUO2zcHv8YOFmEkfTX
         2DY4uo1K/auvxsXCnbMyyoVoCPp0OaCCraHhlc/r/EuswrthI/u5UKsz6TFFufnVBX9e
         n4OWmTKQGFXZTtx5gLT7IFEz3F5lZZmNvLVeR0rc03kOkm/diFI2VG61bWHH9ANpzoBx
         flT/J2g7hop/JEZEqPVplMTbBlYbE+AgZvMhhg/Rv3IuULCHSKgC9cwHHotkC4PxfdZm
         VJ9g==
X-Forwarded-Encrypted: i=1; AJvYcCXHdiGN8Shb8VCc0z5/VawV/H2w9YD9xmdLSG7tgmPrSiBPHPZRv/jtgdz2aNVioMTiGPQCMmPDctka4Fw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDfL8tYEsT9LUoEaSAMtf+Bf5mGrx4EsgAoGjRBW0g1II6wrpI
	TzGZGHCRlcEXnMIqgRlOaxuYDRrLnSY4dsaFSF0nHoo5kkRzQ9BGQOOQzclqyJoEA5gG8j0fLGl
	UiWyItccyHQDWUJmDyIsbJai1TlveE0i1Z2Eychs6VVXHzKDBG9VZ3xEfMqdX/A==
X-Gm-Gg: ASbGncvUj4v+eYjWO7PuUqjqwDk55/mw1igfTahXHjsVb88SHKQDgDcn3qYsAyJIVhH
	Y342h1QgmBEQmOyUivhgiU22fcHV/ojQlp43QEfUTaHtex6au3N3Bu7wuYSAYI7aCr+Lh17qSfx
	EM5xRPRtFYWOWvOAjDrVVGbbUcjMb2xqDPz44Q1uKM0CnxXIaadXj3Z8GzvP81sWckTvOakw81y
	ML+AkhXsy6IHvrvm6TSQ4vzvozIUr1BKILOIXe/ulNRdIQNWtJDaBSeh7Y8v/svZDroCFpTmzIe
	jxe0GYfGAV1OF7ujGi+RO4SYOvgiu8K8L3A/XeYIMfIr0Z6VE/k7/u8Mv7gC0/sB0/pP37DywZH
	kfisWk1Jy+9Dz0gdCbowZHCnvyxxObsiIMwmig0l/u/0=
X-Received: by 2002:a05:6000:23c2:b0:390:e1e0:1300 with SMTP id ffacd0b85a97d-39cba93cff3mr433657f8f.33.1743713954797;
        Thu, 03 Apr 2025 13:59:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsWOY+2shD/NONc8uSSm4VliRSdcVCeRxk5qB7v8EplW3KLanR1fhTMZTqT4/Mlb1KdWPuEw==
X-Received: by 2002:a05:6000:23c2:b0:390:e1e0:1300 with SMTP id ffacd0b85a97d-39cba93cff3mr433646f8f.33.1743713954396;
        Thu, 03 Apr 2025 13:59:14 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70a:7b00:54a7:eb96:63bc:ccf4? (p200300cbc70a7b0054a7eb9663bcccf4.dip0.t-ipconnect.de. [2003:cb:c70a:7b00:54a7:eb96:63bc:ccf4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a7586sm2752181f8f.38.2025.04.03.13.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 13:59:13 -0700 (PDT)
Message-ID: <a33df3aa-7f37-4d1b-bde8-642115dd1441@redhat.com>
Date: Thu, 3 Apr 2025 22:59:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in
 copy_page_range()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild@lists.linux.dev,
 Dan Carpenter <error27@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 x86@kernel.org
References: <g5vxcrmdjjsvrjeo5k6uzwypctv2mvbteoommwwpv6sfjpbcyd@lackqksyahfs>
 <94c35e89-f915-4122-b1a0-436893201373@stanley.mountain>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <94c35e89-f915-4122-b1a0-436893201373@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.04.25 17:14, Dan Carpenter wrote:
> Sorry, I've been having trouble with my email recently...  I replied
> earlier but my email got eaten on the way out.
> 
> What happened here is that the zero day bot emails go to me first and
> then I review them or forward them depending on if they're a real
> issue or not.
> 
> Here it's a false postive because it's set and used if the
> (src_vma->vm_flags & VM_PFNMAP) flag is set.  Smatch doesn't parse
> this correctly.  I've been meaning to fix this in Smatch for a
> while.

There is a slight complication (on top of the VM_PFNMAP checks):

If "src_vma->vm_flags & VM_PAT" we
* set pfn
* set dst_vma->vm_flags |= VM_PFNMAP

Then, we only consume the pfn if "dst_vma->vm_flags & VM_PFNMAP"

While we won't be using the uninitialized pfn (good), we'd still pass an 
uninitialized pfn, which IIRC is UB; likely nothing happens on GCC 
clang, but we better handle it.

So that should better be changed; I'll send a fix.

Thanks!

-- 
Cheers,

David / dhildenb

