Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136A11F1538
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751449466; cv=none; b=qUch8BQvwuMZKCVkz2KpnVTItdV7Wa0vhhDUVTFQumpAOUSF2/tHfMD0+ad45MXFkizb29OBB2CdvlJIkYwYvFaUcsYikblcp/H5nKNy2+SbTqVKvaRmb7OpHoyIy/9iCeT4c+5jeNlT9HtPH5orUiIHW1HbnJtEHRL1XR0fd7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751449466; c=relaxed/simple;
	bh=jKBMDncC8ddnLwSEFohDebKVtSgwAdx7lv5bGEOwey4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BFqIApl23XR7L1wyH3PeDm7p/yUvBty94IxD/REZ6fwqgisqZpvQmfL7IdQkCPi2bFNOyzHRbOov9JpFUeoLg4+kvI/xvpQYXYeGYZJjXtIn4HT8/hKlilGD/0/SJAsVH278REgKjw7e4z2/Yb39ox3vtYYqDcILGduIFVpCVLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X1SbzMIm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X1SbzMIm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751449464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jWaiZiJnu/CnZdAJVRXrQVhMDFKfTvJLcIPYGet2XQc=;
	b=X1SbzMImUL0hH+gQ1DU+rxu8YRZ4xT3KW+k9uEwv6hEyl7JoC5BBrY7HqyYb7c1RT6SheJ
	wd9EWPrUBScULZItXF01yCZRZ3vCoVsNDa+UCgMyeNbmSU3wMUZamBuw5OKMTL29JaPRgK
	CO4p9CP+nRs8jptVJR6yhEpqzGB+PHA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-jjDb5mddPNu7-wLJvq_82A-1; Wed, 02 Jul 2025 05:44:22 -0400
X-MC-Unique: jjDb5mddPNu7-wLJvq_82A-1
X-Mimecast-MFC-AGG-ID: jjDb5mddPNu7-wLJvq_82A_1751449461
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a3696a0d3aso2022885f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 02:44:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751449461; x=1752054261;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jWaiZiJnu/CnZdAJVRXrQVhMDFKfTvJLcIPYGet2XQc=;
        b=izpAYlc4RGzVI8ZUsN9n905ryeOoXKvOpG9bwfOAByCEU0RUj+8LD7pwM0TMvg3mnl
         S5+z7N+MQFFyTH955gIZDhPqNGi0MzJvfy0UOFMeQ0G+dKFX2MCpVTJNUQWYkiOA02Ia
         LZGZ8xiijHq32sUeN4xrpbsYIfHzM82zmCzDynvlV+ycR92/oAyUK/8ofCjNW2RnFSj2
         HbG0Vb5nmgsTMq8FDbHy3bSYyrzVBgrdH7w0IkDgRtcKyabML59ZMXRLDgJlrT2Y99x1
         9Qbo3I11zpMYQFM7W1an0EHS1HNV0BVQncCGZYoSxMYzaD36OQ7Sok+WwjIbN7+AFBFl
         Gduw==
X-Forwarded-Encrypted: i=1; AJvYcCUHFT1pYVtRn7WIMC2K9G3BVHn8DNfx3ls6YYhV/4rstpuNoepvns/qka45gieB0FCm1I6FCW/O3PZCdSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxunY/L2EHzLomPIWCwHX7SW8BduPCG7DTDUyephLiR0+pSh8W4
	l0oKZydmExMvWGX5j1xpBzSW9i9L7pQrVUce75Ogwwhs99jJg5TGas735Xn7VM1pc2S0QEwvYhm
	jW/2bvzohu2A4EyTIGSE18vD1YZlrfvKVkrmv+0AMPEB7GVwYc2R/+ERCuzajSypomA==
X-Gm-Gg: ASbGnctdHWUl8+CQGG1CEM5kkuhCCpw9F9xg3BFp6PhMCfoAggS2MmC+z9nVmNl9DPu
	eVR1Ndgf3CWtwsXfnU3CTX2n8SxNrc93jD7HkGKJfIy8XwQ19sqXPaUIsT4Lhtp3tuGnMsgXsoh
	Lf/O4xnFO2uTGUyEeJbMMEAtT1D+2+E+vrQ/Vjz0dpRk7LOZ2EVoJ4VbREsZF21LYH4ck2GbdaY
	qS3NDz/6m1WIOBUJhalVzEBOVe7GLjRsvKSOR1iyPV0jlHsZx4rxK0QGNRDwOy9pSiHeaxx7SRM
	D7wXGR/DYZ6WYFfQEcQVXpeBbzV0sp292dxKq3mO3Mzroeax+JcvcI8=
X-Received: by 2002:a05:6000:290e:b0:3a5:39ee:2619 with SMTP id ffacd0b85a97d-3b201f791cemr1637570f8f.47.1751449461147;
        Wed, 02 Jul 2025 02:44:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9np4uIQl9aHdlzS9+NuXgk+aG0Q4JUToz1/2w82lzJO5p+sCi0pWNq2v1hdIYrzorl5l+YA==
X-Received: by 2002:a05:6000:290e:b0:3a5:39ee:2619 with SMTP id ffacd0b85a97d-3b201f791cemr1637550f8f.47.1751449460744;
        Wed, 02 Jul 2025 02:44:20 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52b9esm15783021f8f.61.2025.07.02.02.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 02:44:20 -0700 (PDT)
Message-ID: <32a0cfdd-3f6e-47af-86f6-248149ae51ae@redhat.com>
Date: Wed, 2 Jul 2025 11:44:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm/vmscan: Account hwpoisoned folios in reclaim
 statistics
To: 18810879172@163.com, akpm@linux-foundation.org
Cc: zhengqi.arch@bytedance.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, wangxuewen <wangxuewen@kylinos.cn>
References: <20250702093440.146967-1-18810879172@163.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250702093440.146967-1-18810879172@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.07.25 11:34, 18810879172@163.com wrote:
> From: wangxuewen <wangxuewen@kylinos.cn>
> 
> When encountering a hardware-poisoned folio in shrink_folio_list(),
> we unmap and release the folio but fail to account it in the reclaim
> statistics (sc->nr_reclaimed). This leads to an undercount of
> actually reclaimed pages, potentially causing unnecessary additional
> reclaim pressure.

I'll just note that this kind-of makes sense: the memory is not actually 
reclaimed -- we don't get free memory back. The hwpoisoned page is lost.

-- 
Cheers,

David / dhildenb

