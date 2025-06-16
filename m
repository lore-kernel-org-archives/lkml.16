Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43290BA42
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 20:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750105464; cv=none; b=AZKeGKFJMVEo9mipjwbjZMc2cnZru/kBkiM/+XympBUxGc1GFWd6712BUwC3/euUur5L6HMOp46qzmQxuokZcT+nnvttxfTyMfo8SgG2iv64/1wGiFnUSQpoHNMOATm+JVqqQkfhhl+Lvf+hcaw1wuB1W8RdIGi5Yo+P4tRGSAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750105464; c=relaxed/simple;
	bh=R4Ia1cESxjvJC4KUF2Nm3qYxKEVNTSSYVDCzjjROrxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RkgA0YzgRkG527UA6SCu4DorQFbJ+/EpFZwBwVEkkXR1ymSfsc+o3SxEzvsPqTHnNt6b3x+EpA568OwUP6mf6hfU5c5oLdUS9DDjHlxTGJSGG8DDadxgL7GL2U0uTMHtfcYsMy1fa1FiTfsW7J8TP/gLm6SWwZEHkyYhblPtMqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jQM5YH9y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jQM5YH9y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750105461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8KEHvhu8Gk9C+dugYHIGfcPOayUUPXJV6nunXJiz2rc=;
	b=jQM5YH9yC2eyIfQQIjWEpnNOhDLMXH1MykMYVLfNOEP8dj5Ax9WKXeCpkC8Q7jk2yLmzzN
	Ds42oF/NHJNVdVjR/gzRvASVuBQqPmKEofocS8OCMntm+3vrGV9o9vpiqxhALyxzoTn180
	Lln4dtngCVuqEK/0PFLClwVrUHH56ew=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-LoyO_-A7Osi83WhKZ7V0xA-1; Mon, 16 Jun 2025 16:24:20 -0400
X-MC-Unique: LoyO_-A7Osi83WhKZ7V0xA-1
X-Mimecast-MFC-AGG-ID: LoyO_-A7Osi83WhKZ7V0xA_1750105459
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f8fd1856so2396154f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750105459; x=1750710259;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8KEHvhu8Gk9C+dugYHIGfcPOayUUPXJV6nunXJiz2rc=;
        b=fixdVB5cyphJ9oWa9qP9T7KlP6F0vOPWB5zdXs2cg/XG/W3st6Y68nR7NkaS/oHCtz
         ftoeaniSAu21+Tjgeyu7Ymp8ACYN7cAyYE8zEFLSiVRJvkvGj0irjct6lrsDF3mVKgmo
         3TuYrz+MJD0bsMXC24y6Nd40rz39mpwjJulSpo6rccE+IYFuCYGWJSbOeEnqjBjCfYYH
         /Ks3utjcv34GJZJKfyo8jIVs9Gap3FppK3yVx1FOHWeEbavRaFYVMXnHCDmY5LDTH3pV
         Di8XhbunQF8zx4aF8lPCzGh2AcXYWNYmKH8/BUbZF9I/Lm0g1oLAnUFzN9ez5Fv12acZ
         7SCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyNNJfGfRUFaz2gzPy959zP3S2ybSeZXCh0XKuiRVTLrD/0V1o/RKLoiydtMxSgCT2Cw98IwOhcSBRYSs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo5P4RdAQfToscdWpSN9lwanXwwn1PkOSvEKKs5nGO6vfUcXM9
	T7GoALsdqFAjw2BGu+BiR50HfO66fa1Y8ZY+2PJy7g1AH0KT7VaRojqAbxk7dYZ8vdq1sdEZbWC
	/tCj6fN6ya3WjhZFpFNWd00vAJ+EcEYFLvsEy5dfgwCXphIpq23XYTaBhE9SJzKWGww==
X-Gm-Gg: ASbGnctXf5Ld1jb+U7sfP9JIGdf141QJX1j0YgAM4RutKdXMeQDUV6uFUPQjBrOrBJh
	aE2yimy5gjiH0HlvNEtRWklWSoI/dgw06utynuToIbGkYWOUKgBrBegbZeICyIf/u729GEC2wOH
	zhx+cOV6lhZV7pMmpXDjVM5dMMNraOw8sqqCpG9GnFq3WjpgWKahKgIfGC+WNy8ofZkQ6K9Qhtd
	4eqPhItPBIhc48TicHgD1W1DHD6PbFhU9bkjgUVLudeQ8rLasFYyUJZ7qFM0UWfIyAxxZAxmwOR
	VfgO3gtlqDL3axoJAF8JeqTp88r2EbjOjqNFTs8qL1ZIulIZiZ6rzC6hhIM2tNNhU6nVJMdgIuZ
	0E2VSj0g3wpKhDAQE15iTg3FA5a60gKFa2jALBF4E0bWPIeVKRg==
X-Received: by 2002:a05:6000:2dc4:b0:3a5:2b1d:7889 with SMTP id ffacd0b85a97d-3a5723af48amr9227334f8f.43.1750105458688;
        Mon, 16 Jun 2025 13:24:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0QIr+Gcwcj1KdDAG9VMZMc0jW53f2u2PAUlAa/uCPacS29Eduv2+BOalx98gqdzTSWr9iDg==
X-Received: by 2002:a05:6000:2dc4:b0:3a5:2b1d:7889 with SMTP id ffacd0b85a97d-3a5723af48amr9227320f8f.43.1750105458331;
        Mon, 16 Jun 2025 13:24:18 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3a:e300:c660:4ff5:5bfb:f5c5? (p200300d82f3ae300c6604ff55bfbf5c5.dip0.t-ipconnect.de. [2003:d8:2f3a:e300:c660:4ff5:5bfb:f5c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b2371bsm12036934f8f.70.2025.06.16.13.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 13:24:17 -0700 (PDT)
Message-ID: <d1eff528-3868-470e-b83d-a102ed52bd9b@redhat.com>
Date: Mon, 16 Jun 2025 22:24:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add missing test files to mm gup section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250616200844.560225-1-lorenzo.stoakes@oracle.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250616200844.560225-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.06.25 22:08, Lorenzo Stoakes wrote:
> We previously overlooked GUP test files that sensibly should belong to the
> GUP section, include them now.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>   MAINTAINERS | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4523a6409186..96407b87d1aa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15795,6 +15795,10 @@ S:	Maintained
>   W:	http://www.linux-mm.org
>   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>   F:	mm/gup.c
> +F:	mm/gup_test.c
> +F:	mm/gup_test.h
> +F:	tools/testing/selftests/mm/gup_longterm.c
> +F:	tools/testing/selftests/mm/gup_test.c
>   
>   MEMORY MANAGEMENT - KSM (Kernel Samepage Merging)
>   M:	Andrew Morton <akpm@linux-foundation.org>

Thanks!

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

