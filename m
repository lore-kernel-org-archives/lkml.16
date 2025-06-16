Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3251E2823
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 20:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750105471; cv=none; b=OHLz6RNkFvTSUz2vedIe6oKgP2h79ep8rEsUFiTFq9g2xo+ULC+fY1Dts9dnoyBhHXDL+7dIOymROxbjUNmlLm6OfLH4igTzbVI/KnzIPCPhzkapMhYEIaxeIgMRU1Dpf9zXdSuzQrIX0/IFY1OXlQAxVHdffLhCRVrF+n3G60w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750105471; c=relaxed/simple;
	bh=GGAkn8ghXhTe7VWsUVBkyHZ52N8CO/D8nxbEgjOx/ec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F5hvCCSn/WRfrfhYK5SD//rBF/0sMJqQDElXdBsWSwVVwnlBYGuNj2XxKhIutzHPCHeDvgz1tnMzSofUXxAfoeI3ShaFQNzNRdtBFkgUFCI//OnjZVR2mhX+6mBsAkz6ZWPefRqt4z6U/qFZQNYtjzZ9fpZ29DcW7wT+gCQcFas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ee0gpWqp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ee0gpWqp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750105468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7ZM0zPJwKxnfdTicj0evCUK1qKbbPrysz/A3A28cCm4=;
	b=ee0gpWqpCRE2PtndYQgvJa3g1TFvKTASQ9zRrlkwdd4aWn4K6lUXUefbOwDwwX7mcgGbGd
	tM3ai6ol5eu+0DxFCdUsstjrcThuxPhXQJj0nW9DWmcA0BRz7/YNorA2Aws1+LXay7gkaB
	3kv3m0gWY4//iEBPX5uoPIkuMR+buuA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-b5dPcNqcNsSsJvQfJX44yg-1; Mon, 16 Jun 2025 16:24:27 -0400
X-MC-Unique: b5dPcNqcNsSsJvQfJX44yg-1
X-Mimecast-MFC-AGG-ID: b5dPcNqcNsSsJvQfJX44yg_1750105466
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450df53d461so40574245e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750105466; x=1750710266;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7ZM0zPJwKxnfdTicj0evCUK1qKbbPrysz/A3A28cCm4=;
        b=iQK/M403UXHiudK+Zc7gaXXvRn/RSQf8ykmOtu5P7ife2Ax17ki20kJuq02vd/lX+d
         5+MRhMMRLjPCP62EipB7ew3sDkZHClSxkZ5AerKyED1ecBeZXKLYpSw8Sf8nkIbQEzTj
         9y7fOVx5YqZkMXlVNuqVFc3WdIpMjZadLx+hjchuFeAvR7fPkjvqM2f9aFkQgVVYWQu8
         iQbUktYQoLlcRdJAIdy9PWDk9sZHl1eoTb6VNPt/8Bb5O5m2Ts9lEZSz6t61GmT1m37e
         A1DgU32QiPtHVwGEhPa7vKrtEnshFlB3FF7mh0GdmZ6zrfHmmKKnBt2CUfKNZmbujgPf
         ZFUA==
X-Forwarded-Encrypted: i=1; AJvYcCV5iLFpBirkquo64PMTyr4jhf++EBN19i/5F/gs9YLJIJppCZsQ5JySp8zT75MfmHNeHbsuzrqnZIzQrEs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIL7DfD067t1Qf9c+xSj0UL7yc8V509P5XQchp/SpYnTXq9lsZ
	FwpDp+v7MLVm7eGEyjgjpM+tMAFMKoYanQGJyQ/fE65CmvbdxHH7nWDrUTcyY7jjTQvRq9cNLt/
	XEJcLmnppcl+e7ydBPNV5E835t8Iwu9iS7Iqi0T5+1xug3Jhki5xQD9Xziy2pb5CRhKSG4JaLsQ
	==
X-Gm-Gg: ASbGncutRH0dmwe3VbGcGzT15VrV78msFUpHZSYTzo+QrG1UOM8qzEzD/+1OWYE2lDp
	JjExdcj1mWrsvlndnz7wgkKEdjTUWEorsmfV4kjTVODHHOTdhpHn0T5HWqsoz2yi0zebKLdhxIB
	ztG2UiicIGhw1KFkE+wSZQYKXhCxDZsmFh5O5crSHhZ4K5TLnhsah9I37YGqddNYWDypiFhE69s
	iN+AgmnApPFMBctrfeCPBgU5l7lZTSRuTC/WzqVSC/9Ky3DHE2SMNEhjTk1wE3xgP4iB/g3Chvj
	rwAur7HU7w5QwkSnRWykj0dFQtJIB2TuaPytyhnW7b30psto9SdhQNa2TqAv05epTFqU/71/0HL
	q+uz7UYnCQ8HdSY+gLiSskUE7JFGjAfDhhuYV+WN0xLNGlKQiGQ==
X-Received: by 2002:a5d:5846:0:b0:3a4:d4cd:b06 with SMTP id ffacd0b85a97d-3a5723a2891mr9630368f8f.34.1750105466137;
        Mon, 16 Jun 2025 13:24:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcmRqo5HCK7eivEn4L1G8El+OQSEWvk2FreI0o++HHCgv960dH1B3shsQIgYW1es8s5FgIrw==
X-Received: by 2002:a5d:5846:0:b0:3a4:d4cd:b06 with SMTP id ffacd0b85a97d-3a5723a2891mr9630353f8f.34.1750105465704;
        Mon, 16 Jun 2025 13:24:25 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3a:e300:c660:4ff5:5bfb:f5c5? (p200300d82f3ae300c6604ff55bfbf5c5.dip0.t-ipconnect.de. [2003:d8:2f3a:e300:c660:4ff5:5bfb:f5c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b4e4f1sm11700243f8f.87.2025.06.16.13.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 13:24:25 -0700 (PDT)
Message-ID: <07039beb-efbf-441e-9c23-e02a595e2b41@redhat.com>
Date: Mon, 16 Jun 2025 22:24:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add missing mm/workingset.c file to mm
 reclaim section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Qi Zheng <zhengqi.arch@bytedance.com>, Shakeel Butt
 <shakeel.butt@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250616201643.561626-1-lorenzo.stoakes@oracle.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250616201643.561626-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.06.25 22:16, Lorenzo Stoakes wrote:
> The working set logic belongs very much to the reclaim section and is
> otherwise not assigned to any other MAINTAINERS section so add it here.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4523a6409186..f28f7625723d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15871,6 +15871,7 @@ L:	linux-mm@kvack.org
>   S:	Maintained
>   F:	mm/pt_reclaim.c
>   F:	mm/vmscan.c
> +F:	mm/workingset.c
>   
>   MEMORY MANAGEMENT - RMAP (REVERSE MAPPING)
>   M:	Andrew Morton <akpm@linux-foundation.org>

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

