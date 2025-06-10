Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3982279789
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749541945; cv=none; b=pNmN2QsdE39J6ppsKUMOm1UePDfF4QxQRjcz7jthDYYOIgnPvZOGVStKyyWiCqSWxG3MikkxJDUvcay+HcDm/THytlP6HJLzQ5vDKiMQLOTpMRBU9APFy90T95YZ0PkGzxzteVMBkpYb9yT6wX8DISnp09sKrXF7bRoupb+PBk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749541945; c=relaxed/simple;
	bh=L+kijDdYj5EQre9OM15AGd8y8L/Rgw+LpDnEvDGn1Gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dkRNybpo2N9j4G+5jXNthQvz2xd2+PZQbNGxP2aYxHdqgDaFM9oudzRfUX9o2G4LFwWOllFqtTBMyj5dmeQQ+nbEFY5Tdq9ddLjft1QhXErNdLgO0ooLXwKvm5j+ZvkKNMmqAR8bXBlonbPF3D4NLiDH3XV7HezB9sMHkl/ZTzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bz9XR5xR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bz9XR5xR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749541942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Ojq4bzOTN8fRRjWl7WrjOjLlJ8FiuAWchMJtGwmE3YM=;
	b=Bz9XR5xRNK1AAX9QhknZwhkTEw9Rz3s/mPW7pI/KvhklEluQ/RNbDHemu+k6XtR1RZePbV
	rATSH/Ldz+79kpy4ijdCdPrhbMdS8bOsziezQxqCDjm3FQNDnAq3l+cK/sQ89AMDBZwEmQ
	RnJ64iz5+pos+v6Il4mb8ck+LLLVQYY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-oYNaml0VP-q0JUicLGQpJw-1; Tue, 10 Jun 2025 03:52:21 -0400
X-MC-Unique: oYNaml0VP-q0JUicLGQpJw-1
X-Mimecast-MFC-AGG-ID: oYNaml0VP-q0JUicLGQpJw_1749541940
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4edf5bb4dso3143913f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749541940; x=1750146740;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ojq4bzOTN8fRRjWl7WrjOjLlJ8FiuAWchMJtGwmE3YM=;
        b=NRCjRnGJU6xu31equydPak0fkXL9E8kgzt6uDE1deTPJkTYbIZ7jT2rEmT9RqnuI5U
         QKzFcvB+r75hiXVQEeNIC8MQ3crySNAyWz9F4+AeQzydENxp+P+6INiWO5Cl5X7garPS
         7/ZTXRt89hh692lFF/RwADFlA7ij9q6X+6Ysatg1HMXH2GPFLnEoDDbNb84UItfjStM3
         EBC9KmR0IzLrFHW3SjanKEuu3EyLXOIXUtXYghBA653F9P1qa8cD33L96lUGHeGOFQ3V
         Bt/1oF55DyQ6eMtjk1DSny3rU9eW1NFQO13f1OtLolfXNx3UKZ9ovumZy38ySHO+eILq
         RkVg==
X-Forwarded-Encrypted: i=1; AJvYcCWH2+0XxIv9PviGjk7FOI/xDoAFHEuigMXFSUz794gb3PGTxeEQ8ZR4Gu8GwLtod+2humt7Pmxta2kLMrA=@vger.kernel.org
X-Gm-Message-State: AOJu0YztrAS4Oa2hV40xOdMvflWMEsJSKsxqX1xLNU3qFCG/cUiRhral
	nZumh1fpulDsoX1K3S6831ELewCXbQMUMU0bYNeJcpMVJgpNs1O+88aFmiOrreEYOJ/3l/dDLj1
	WFJxTx1aybgaT3jASbBICk4VUqEbDWhyikzHTGShkrGTGWPoUgULGNwVKlpA4p5tEPQ==
X-Gm-Gg: ASbGncv8w8O3Uld9cPT5iPUrN5g3DkExGacnHo9yUs5Tv+CWdJLF7T2BDPer6Kj3fTG
	YdeCtIjEFNT6MyYlIfEY2n8svbSejjk65vkHq6ttZMAC99zoPqRQAcDHPPEQrGf6Deu4R6eZbhk
	SfMOkfx4h0w7UjaLMtbOTz3Qu+AZgBNgSlz5+SRoQ3K3YxFWasb4JrgFkrcRFovSH1rMm6L0Qsy
	BPetb3hEveG4QOnIqWosSd1afRUyTKrSSOG8jI4fEnh79ndROaSaY6hwcnQrqGUUEiqAPE1fFC9
	hA/utjfoS1beIXfe/9yN+o+TyzFNACGfOwmdQGOQOifsV6/yVKt92T0=
X-Received: by 2002:a05:600c:4e41:b0:450:d012:df7a with SMTP id 5b1f17b1804b1-4531de914bcmr11908365e9.28.1749541940328;
        Tue, 10 Jun 2025 00:52:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfMaKASf3W/DieC0P7pyVLCbWfrMnkPGu2B5QjFfrqZKlgGrwxaKqoIl0ktPoDm2EKFHO0Kw==
X-Received: by 2002:a05:600c:4e41:b0:450:d012:df7a with SMTP id 5b1f17b1804b1-4531de914bcmr11908065e9.28.1749541939929;
        Tue, 10 Jun 2025 00:52:19 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4521370961csm132412035e9.22.2025.06.10.00.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 00:52:19 -0700 (PDT)
Message-ID: <75fe1477-98a0-4692-97fb-75156fb128b2@redhat.com>
Date: Tue, 10 Jun 2025 09:52:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/10] drivers,hmat: Use node-notifier instead of
 memory-notifier
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250609092149.312114-1-osalvador@suse.de>
 <20250609092149.312114-8-osalvador@suse.de>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250609092149.312114-8-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.06.25 11:21, Oscar Salvador wrote:
> hmat driver is only concerned when a numa node changes its memory state,
> specifically when a numa node with memory comes into play for the first
> time, because it will register the memory_targets belonging to that numa
> node.
> So stop using the memory notifier and use the new numa node notifer
> instead.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

