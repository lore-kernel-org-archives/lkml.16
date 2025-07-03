Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96ABE22D78F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 11:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751541173; cv=none; b=rNb5pcomAa+sXYXXOhLCWauxQrcPiWMHVTh9+YTxB4t8RiamF/TLB9rK+g/gT4griCm+R5bMGoo4pvcdNSZi7ezAB/LamZsN5BMTsaygpz21OJOKbqtg5XlZehslTdFY934s6h8CgHzslXd8bKchZa61h0Pu+zZXNSOhKNjRcKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751541173; c=relaxed/simple;
	bh=u/6TCbOvZ97FmN6eykNhQhM+VGvjHnlJfaFOpMtSJRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dQ+0OJuJNgjUnsDtCHNWRoojN6SK+9kDX/4dGYWR/02tZoW7NyYqi009SwXWSAVGphXrxMOr3iyQC98IYB38JI2fC6aTd4ASu9Cgfqp1dpDIZ8o5KUStEEKPVKvEzfz4otbla1H+xz3DSML9kVK8gU1HIi6np5hQSi9r/qqdR9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ah6M1YaS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ah6M1YaS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751541170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DJULFj6wqOcrY+vDTEpJn97vOwi/Y1SVapHFqg9QnZs=;
	b=Ah6M1YaSFwPINVdYyQJzRKG/rRIlNFPKquQkxMDz2H72EUqd/y2OYn6C+5y/WbGaxQm9zI
	1kDrxKy72F5u/VNFgBrz4fw/w7QMyuo7Y+gnUa7aR/xlMbVaIYLI4Lteo1IXOFBOeAYYQj
	c6mG1igJ8y9BGr6agGpy0NUyr/BfnsU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-NL77zU6qNi6k2Dn3yopSMw-1; Thu, 03 Jul 2025 07:12:47 -0400
X-MC-Unique: NL77zU6qNi6k2Dn3yopSMw-1
X-Mimecast-MFC-AGG-ID: NL77zU6qNi6k2Dn3yopSMw_1751541166
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-60c9a1db851so4765734a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 04:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751541166; x=1752145966;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJULFj6wqOcrY+vDTEpJn97vOwi/Y1SVapHFqg9QnZs=;
        b=f45jlZcpcjQHrphBIl29Kmsn3ydc1RLPX92NnkY+qQ/FJgkiM2nfWhI/cJOA5Dv2lk
         +fXS1PBoUI9iQm+gt2YodCIHcRYga91rsrr71ajcG48rJuGRg0EKxsL3AR+zdsmkKCzP
         T6kX6+Bfbpmo0K1FLIVBkZz6V1RovN0vvPKIMlWCALbZZv3mnkUniRgwAF27kwoqtNaB
         hWQf/xd/tGOS07OX/EXr/kH0sFsb670FHiojX6+X053iT7+NWC+LlJpomI/7hdYINhQM
         ezb9Ny7/uR/VAAwzjzMq+gGYwOlouTQNO0ilYxtriERQEgnmSXsiBjykDo5e7rFAaZHc
         l67Q==
X-Forwarded-Encrypted: i=1; AJvYcCVz2b7IXKyPN7U9HRggw8MldZfMLgLRmSQ64TM78GQFAxuXtW0vEgtmGyLi5P8Cz74agktQbpM6MEMvHkA=@vger.kernel.org
X-Gm-Message-State: AOJu0YylxkhEzlHmsSGjE8LCE+BDD33awu5MM8J2+lVVQcLRbb2M7J/e
	dqrlbRBS4hxQrtFMk01klOiyM1AORDzC0U6quCyCv+4a8M2czmZSaXG/8RKf/3vOIYnPXo799de
	IULKOUgAQKyte13l13kYkVQNxu7I+S/RdsHCnb7rsnLbe1/9/lsoMm3GN5vd7rBvidg==
X-Gm-Gg: ASbGncsTuIeL/zcWzX6l+jF7CnYrFUnCFImJIEhKus2beWG+mcc/iOZ6jDvKtQoH5eI
	o3HRZCytbMVOx0ZFtIgendBoqJA0UgArHOqX/LKD1x7eBvt+DxnBWdcUZJpyUKSpU2y2nP/JFab
	V56vnbb+ztpz2l7rbmT2PpLnKuRyp/BQe/adNkvNT1g2S1cFYwAwfy2GLkHzHZvbuE0OR46sBTw
	RiLctFGjDQFPJZCZZEzVtXSSOJpEc15l5/xoAtfdUaPpTyjcQqAPYfVpNiLDi/IZxMeKL/vhkGa
	gcDkBqkAuOSPE0mEQ0Vciclbi26EZIiAZglpECqsZlPy
X-Received: by 2002:a05:6402:51c7:b0:60e:e4b:b8e1 with SMTP id 4fb4d7f45d1cf-60e53619aa3mr6146128a12.34.1751541166129;
        Thu, 03 Jul 2025 04:12:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmkbrOy4GJgynfnWcYtqY/OCsyVeNZLRBi2bFK6slD2Wi4/tuG6coxBbIpbqSdQR5k1e++2A==
X-Received: by 2002:a05:6402:51c7:b0:60e:e4b:b8e1 with SMTP id 4fb4d7f45d1cf-60e53619aa3mr6146094a12.34.1751541165673;
        Thu, 03 Jul 2025 04:12:45 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60e22a7b726sm4819126a12.80.2025.07.03.04.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 04:12:45 -0700 (PDT)
Message-ID: <2a86fe49-6583-43c3-b4ff-1f2ce2de1630@redhat.com>
Date: Thu, 3 Jul 2025 13:12:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] cma: split resrvation of fixed area into a helper
 function
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Oscar Salvador <osalvador@suse.de>, Pratyush Yadav <ptyadav@amazon.de>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250702173605.2198924-1-rppt@kernel.org>
 <20250702173605.2198924-3-rppt@kernel.org>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250702173605.2198924-3-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.07.25 19:36, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Move the check that verifies that reservation of fixed area does not
> cross HIGHMEM boundary and the actual memblock_resrve() call into a
> helper function.
> 
> This makes code more readable and decouples logic related to
> CONFIG_HIGHMEM from the core functionality of
> __cma_declare_contiguous_nid().
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

