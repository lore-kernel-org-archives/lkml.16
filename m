Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6DC131E49
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745413709; cv=none; b=aj6J6nlBMo2RcylDU1qVSHXOSj5YYosZWPOA3/8QQVqAxcRHC0UlGm+ll7DbfwZARjxj0zHU+6o90AMFUyg79DUFoMJrhY2USrBS+i/IubaCqEkUBmG1oQ59PH7MTmlWtL3HHiQKh2br8/pOc9Udckl44Llo6Z6u391bXWf27t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745413709; c=relaxed/simple;
	bh=L7JtrhS7BvZk+vMKscQrGUgIEYcJsNk3zT6lIhrjt9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MAWyr1UZRKYt1PvNix+TpP+/Urw6G/ad1BG9uobSUKLnYrY1NWxLyZiz+oGcNAZRY+ruJBGEa//WvMaEmt32b/omyFvNMALwjmX5Mfz+0xfWxG0Jh/Ek7aI0NJIcZWF4lxFC5zFrFJSd/qhTUYIca/aZQfd0EaMg2biblhBBDAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AlMXYBp2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AlMXYBp2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745413706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Tw5QkYjbUX88v+0BEYQ53saJV7aVYcuDEPi0hJNXifI=;
	b=AlMXYBp20rCsutGdTgbAQhQ6Vzz2Q8VeVKCT1nyl5VIO4jf9EfRkX/K9A5WMr8l9aNIznD
	dohYs5H19MkAv/dw0gU//gp7OIal5+18tLwztqQ9IgiX4CsslcbPwXFDUUD7LfUZ2df8df
	WgrU24L6QotVihcOvPkwcibmvqT8LCg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-QrcH0cGeOtOlOuKaLxDu6g-1; Wed, 23 Apr 2025 09:08:24 -0400
X-MC-Unique: QrcH0cGeOtOlOuKaLxDu6g-1
X-Mimecast-MFC-AGG-ID: QrcH0cGeOtOlOuKaLxDu6g_1745413703
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912d5f6689so3471666f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745413703; x=1746018503;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Tw5QkYjbUX88v+0BEYQ53saJV7aVYcuDEPi0hJNXifI=;
        b=mECOLI84d2UQcqv3zkmfkeHCAejyI4Rr8qENeGyJus3a8PM+xV/TaYBz6pvIVpMX89
         8ft/YFepL21d/mVZGBDb+K/bq/ADJJcYBWHYrscpJgwsHYsVtDylTnecEeHLbo/P+7Rb
         zlaHeJOnPbrsvy7vpMDJGXSNwjsOREJMEFVzCayCSzdH4RvtcZToVAE7x8u+TrWcIWeK
         cLw7ept3wolid1fpTRQRQXl7knFTTpyH4l1lNbJjFGBrHkiUl2A2jrpRJhrMRSQg9o74
         uW9zKy+pfG8E1TnWyDNA7vxaXncc2OvYOz8cOZqwORJ4qsqmCo8d3duoUCDIlIOgUIRL
         EI6Q==
X-Gm-Message-State: AOJu0YyRlpUfEOT6zPppeb3fzGS0m45nf6R4dX96NB/2byj93w9LpPfZ
	00JtSdEORX7Jo4jMzZchGGA5Gzxf58KPpA+DoPrY6EarVQZ8KANl3zT8mKWBZLvOzvAOvIS1lRN
	NaPYH2FbOp2UNXS5bg/SQe0ovW22Dxfwp3UfsoJtjhP5O5Wwp9ppMktnschqaCw==
X-Gm-Gg: ASbGncuVVDH5xzkFg/x+q5rfhbmGLbGcJjzD2FZsGRkAz8LXTW3EAH4c/sFbmH1BZDK
	G2Oof+nONFOkISqCG2Gyc/GDLASKS754gB15n9cPKSEKM81MUTwoqbVv1lZrFOmCAzHKtM/KcXM
	Zlz668Q+2Opkgy1QfqMtG/7/bbY6xQMQ3yELGJzGvgPZJ9mfkAPL5lQiLDiSIDAwvgYbDV3uatQ
	868l7JfavC1xjzZSc8k/T2B+wPdWbUmPPhdqCtYWi/AHTnliKRiQpsokvyTay04uWsr7bqUr2Di
	HmH1IAh5Z6Fjfs3qNi7sbu940Abq09eT1B9BeujzUkknuteH4DCECUVUiGoiO/zdwub1VI68D04
	6nUlmvrilJqZH8EK25wPMKv3w8PV8e/wbyxSouf0=
X-Received: by 2002:a05:6000:2907:b0:39e:f89b:85e2 with SMTP id ffacd0b85a97d-39efba5ae96mr16605120f8f.26.1745413703094;
        Wed, 23 Apr 2025 06:08:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1uPpvEz5P9ccgo4rkBC5tHZb6a8Sfm5Stca/6CyUjNxZGTYBy4H0ZspJUsugxSLDXR9DhaQ==
X-Received: by 2002:a05:6000:2907:b0:39e:f89b:85e2 with SMTP id ffacd0b85a97d-39efba5ae96mr16605062f8f.26.1745413702602;
        Wed, 23 Apr 2025 06:08:22 -0700 (PDT)
Received: from ?IPV6:2003:cb:c740:2c00:d977:12ba:dad2:a87f? (p200300cbc7402c00d97712badad2a87f.dip0.t-ipconnect.de. [2003:cb:c740:2c00:d977:12ba:dad2:a87f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44092dbfac7sm25685485e9.37.2025.04.23.06.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 06:08:22 -0700 (PDT)
Message-ID: <6663d393-bac8-4bcc-b36b-58b08143d959@redhat.com>
Date: Wed, 23 Apr 2025 15:08:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 0/6] support ksm_stat showing at cgroup level
To: xu.xin16@zte.com.cn, akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, wang.yaxin@zte.com.cn, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, yang.yang29@zte.com.cn
References: <20250422191407770210-193JBD0Fgeu5zqE2K@zte.com.cn>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250422191407770210-193JBD0Fgeu5zqE2K@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.04.25 13:14, xu.xin16@zte.com.cn wrote:
> From: xu xin <xu.xin16@zte.com.cn>
> 
> With the enablement of container-level KSM (e.g., via prctl [1]), there is
> a growing demand for container-level observability of KSM behavior. However,
> current cgroup implementations lack support for exposing KSM-related
> metrics.
> 
> This patch introduces a new interface named ksm_stat
> at the cgroup hierarchy level, enabling users to monitor KSM merging
> statistics specifically for containers where this feature has been
> activated, eliminating the need to manually inspect KSM information for
> each individual process within the cgroup.
> 
> Users can obtain the KSM information of a cgroup just by:
> 
> # cat /sys/fs/cgroup/memory.ksm_stat
> ksm_rmap_items 76800
> ksm_zero_pages 0
> ksm_merging_pages 76800
> ksm_process_profit 309657600
> 
> Current implementation supports cgroup v1 temporarily; cgroup v2
> compatibility is planned for future versions.

As raised by Willy, we focus on v2.

Independent of that, I strongly assume that 
Documentation/admin-guide/cgroup-v1/memory.rst needs care :)

-- 
Cheers,

David / dhildenb

