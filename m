Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D32C2367D6
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 18:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748631085; cv=none; b=iGzn0SPjg1wTgei9p7O0ksVNU/o0E+LNNeVoCufdXlqWsUP5SR/8xk+puQELAaI2NfHi910F7Lpla4+4yLWI4VvDPPq3k8wyuwyIdeQZAzM5vHS8ovJw1g3mznztPQKJonWqOP7vdYBqEXq/C8aSLwV6uT2wrAmsIjbL+L1Fpt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748631085; c=relaxed/simple;
	bh=eVV9xeVeiv2yXILMXk2UmpohCzZ0JzvHyAW4iBGaRic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M9YYyHgaoPtcbbV5g68iVHNKlHn10vbhdaQpBjKxp9hlFEXsk/CskaC5RF5ed0nWDHbhvIx8/HXOsFyoOumGE+o4NcF+OjgztI7vbCxgCfNPxiS1+MssyRGgJIfACvn631F3g7VAVcYJ7niuYxU34imOFZ9xiojtUPXDIar2iJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HiopQ5vM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HiopQ5vM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748631080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YJzGuOEyCD92yoey5UJsZHsZc4atn6WQPDIRCxciOwU=;
	b=HiopQ5vMWfvFKGgwhN+gcFiTf2bUR7U5jcPMS8wCEZ7huyKGjOEYMEW14ZVi5MeSHzjEb1
	ZP1VJEJcPM3/YH7ah4nafG3JOIwZlptule/5UL0DtjuJEu3GB4q1vvZzwRHvicSg2h+6OD
	Wxjip98RjqQdxQaE8fKqkF4A3mVCQWY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-Of2tg2f4PLuEdXHIdDBooQ-1; Fri, 30 May 2025 14:51:17 -0400
X-MC-Unique: Of2tg2f4PLuEdXHIdDBooQ-1
X-Mimecast-MFC-AGG-ID: Of2tg2f4PLuEdXHIdDBooQ_1748631076
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a367b3bc13so995842f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 11:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748631076; x=1749235876;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YJzGuOEyCD92yoey5UJsZHsZc4atn6WQPDIRCxciOwU=;
        b=aveyeQfPGiDxRQRYsD/2pIsbPDpNcoFbMMUkpvyeCwfr3QXlnEdU5cTSxvZ7MKPR3H
         P4bG1k+nm34DLi/WZd0ivyucIBEayk+dVX85xvc3B0hlJUrroX8xhq4yvsk43yypRBOo
         KyuCHv+7mBK850vWWpNmIZyz86/JYqOCpQ8ucVB+sVpQ1Br1hn0g4KK6IjnWgerJvtve
         Ptaab3Oq7aNFuwsZjkulGbvFDTP3EqlDwsP6FxWbhyi6c/XLJzbXXXPIRyUtKLvMzSOr
         GM7fJ7Tm1sbyCrtgT3emNwl/dOK7ZxnSVa29CBEONvb73432Uzc/sz37wrfS+jxTIMht
         s7nw==
X-Forwarded-Encrypted: i=1; AJvYcCUCQCrKPtvqd5w23IwEVccTM5GAPw5nnuUYvRGej+I6mpLXbF77xTK1zkOdjR0BSrlRWz0JG9Sz/YTwjgs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5dRBlvlifDdh1i6kfDdZ3gh9FeD9e4JYGpOQg32i0XsgqxlSs
	CvyLggNOv+6MId/CWYu8xwSNZQEk4BBPyzZxdkjNygOiQGDdUFImL8PG/kSUhWFyXUWJdLmHYqy
	lOBriT5QIePgz2VMarW0GkAMp/CbdU3L3OEiSzkAd0Gww9fRb85A99QPUP4E4lqUT3Q==
X-Gm-Gg: ASbGncslB3/hHOgLxdR9V2ClmM0HABRldXcnFCdZ53dh5+vQysCrGTnj57vWT8m79hR
	5Z4HW02z7uxgqXu17oCzsLBfJHfFLGrE6yf5ioBPe6db5FiLZ2OUE5t6JkDeS71JLnqO11O82fx
	xJZ4wXL3mQsFi3DzKahpFLPmyG4uLGvExh0jqnonLGp416Xm5jVrSp5CoyGQwteTpiIoSeshrpx
	CWt2b6to94zp1ZoCsFQ8RxC3Dp+RLqsPi7a0QoF4tb17QAnvxUc2i1w1g4eF1QzfadbpXoWGUNk
	MHLb4CqZLiJNnUwCUVVCgnulL7Y6Me6Wnu7cyPiS2/TWXMYaHoXArynhgX8RQS8WWAmMtp6rC96
	1rdhVFaDRmmPDCERjco776bACUesv13JNCQOZm5sLvu2Ml087dg==
X-Received: by 2002:a05:6000:18ab:b0:3a4:ea40:4d3f with SMTP id ffacd0b85a97d-3a4f7aafa70mr4212773f8f.53.1748631076240;
        Fri, 30 May 2025 11:51:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXz9jboLNudDIoWr1Y0bfqfhAVm5ux5WqC9fB4zaCC4yD21pmClOISusCFn1KSYiqhpVoOfg==
X-Received: by 2002:a05:6000:18ab:b0:3a4:ea40:4d3f with SMTP id ffacd0b85a97d-3a4f7aafa70mr4212755f8f.53.1748631075852;
        Fri, 30 May 2025 11:51:15 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f03:5b00:f549:a879:b2d3:73ee? (p200300d82f035b00f549a879b2d373ee.dip0.t-ipconnect.de. [2003:d8:2f03:5b00:f549:a879:b2d3:73ee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b8besm5586306f8f.16.2025.05.30.11.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 11:51:15 -0700 (PDT)
Message-ID: <962c6be7-e37a-4990-8952-bf8b17f6467d@redhat.com>
Date: Fri, 30 May 2025 20:51:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] mm: Fix uprobe pte be overwritten when expanding
 vma
To: Pu Lehui <pulehui@huaweicloud.com>, mhiramat@kernel.org, oleg@redhat.com,
 peterz@infradead.org, akpm@linux-foundation.org, Liam.Howlett@oracle.com,
 lorenzo.stoakes@oracle.com, vbabka@suse.cz, jannh@google.com,
 pfalcato@suse.de
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 pulehui@huawei.com
References: <20250529155650.4017699-1-pulehui@huaweicloud.com>
 <20250529155650.4017699-2-pulehui@huaweicloud.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250529155650.4017699-2-pulehui@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>   
>   	if (vp->remove) {
> @@ -1823,6 +1829,14 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
>   		faulted_in_anon_vma = false;
>   	}
>   
> +	/*
> +	 * If the VMA we are copying might contain a uprobe PTE, ensure
> +	 * that we do not establish one upon merge. Otherwise, when mremap()
> +	 * moves page tables, it will orphan the newly created PTE.
> +	 */
> +	if (vma->vm_file)
> +		vmg.skip_vma_uprobe = true;
> +

Assuming we extend the VMA on the way (not merge), would we handle that 
properly?

Or is that not possible on this code path or already broken either way?

-- 
Cheers,

David / dhildenb

