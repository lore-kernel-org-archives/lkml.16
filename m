Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF2F1E261F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743495671; cv=none; b=BlZ2d7ddpEWGFMWsB4wdlNf8IrLfAlsC8kX2tHwT9BPZyRmPBNG7ZYzL3Gzuc51VCpHL8pTOex9Xzt5hGFR+JcvBm5vBN9fE8D3VNHvlVK93QsKU15qF4rsOYF3Lbhtdevm/yMCMLx9LIDC3YQRr5OkuhtZN1GW1BSPfHl8Wkjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743495671; c=relaxed/simple;
	bh=cg6PEShvzm28yYdBaMTTDyOvb6+deHPCt0F8zssiOnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FW2nC7CYI7MfLApNrjBxI5JcHi0ot+nNhqYM8xrtyQns2hdVBpRJ/A13bYb8bAqMT2s9w7iGQJQXUSQAEUzxycXzvhrhkyzJbZElNK6GitekEMJwjEwDyG5OBLse3Ave+cgADiaziMiMGJa3hA0YWaLcfIyQmd+xp6hP9k9BEYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ek+WMyaq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ek+WMyaq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743495668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6hh3sHQg1YPcmqC0I6nucOyyi71QpSx5LGkEOERvFPE=;
	b=ek+WMyaq8ooCtEaa7ILGmcwotrDHpTyi+acKLFO8+RRhgSfEC/eIYI8l/TVXi03YGhz0rh
	8Xgm3r+CDWechLlhIL/47Y0s+BlLW7xJvACohwH6+8uAzOJ1TLq+F20k+pM4xSb7IMFdwV
	DJIyk1TW0tlFrQtnH9Ef6Osd9uuBGoo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-1crAhz-3PkWdacmrsib4pg-1; Tue, 01 Apr 2025 04:21:07 -0400
X-MC-Unique: 1crAhz-3PkWdacmrsib4pg-1
X-Mimecast-MFC-AGG-ID: 1crAhz-3PkWdacmrsib4pg_1743495666
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3914bc0cc4aso2638926f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743495666; x=1744100466;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6hh3sHQg1YPcmqC0I6nucOyyi71QpSx5LGkEOERvFPE=;
        b=ktyuIF7XOxly+MLm+fpHRAFh7fK24NQcKErVKN2r/OrzEl36JWGDiOU0RrA860VKB2
         WWA4mDtcNVUwfeg6mEJOJM9aSUzTI4FhV2Igt/B0q/AUHEH4iujkIJP07xC1JaqS7/GA
         IdIIsaVJBBCi+qlm1WvmyVKoaOlxHIuiHgSnzErTb5raIUFgQkBcGb6sWseF4UQEIkAs
         Pc0138AJMO2NirOHxKjCQs1v+3O24R2NvsiP9NLJwseSjzbNLRw9Tpk6TQlp831p1eaI
         TLFFLKMvcz9tP/4Q+VxBfOzLMECBq7MUxJqFaBSc9gfalHPt/p+I48I3yAEB/dOp5SN4
         EExg==
X-Forwarded-Encrypted: i=1; AJvYcCUl5QvlHa64sJQdzYL4pTSFaAJEgNDx2ijgVINGLOBt0Mx4UGdwg6Yb0ie/PHod2oa3Pn4lJ6NysLsNzWo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj9VgZsRG0ZVuCN+VHgiChL/ruM4c4MQkAJruS11qdnR6heW5o
	HA4asD8UpW/RXn2Bv+K8PvLmCiwrdox5iWJnVnZ3ed4uuuzGjXF8j2/2lwXyZWSjyu6RdoXJDB9
	7ZRtalzi2bwyebgxdTJDr6TfPpi1c0zYQSSSIYZ8c/AotmDpqfNApyxmo7O/YPw==
X-Gm-Gg: ASbGnctaEW6TlgaPMenong4EO9b5hU+crOq5Tya4YiOdiSAqBgVYmBFa1AtpkTK7dtR
	CXclFzY287bpwShz8VouQtcF8NzconiwaTU8wJsLF69CU8A1wozOMVYKCmw599vGUR4TeM1A+HT
	ToC95MUJJvqMLh1dNH+vBLbJDLSrP/eX3qAq0gvnSw8zd9uVkhHVN2vAqR+4gR9Vu7wQTQRY3dd
	JNSE5gigqQDbv0Xj9by1qJHucTxnZSApLcgs5e+SBANTeyokHXKAg5rOzsbpG6eSULQ6lcGNNcI
	xG4B05SJUDsnSTMnHbNXSN15SRplOwryHxXGMnITkkfbP6uX6XzyEJAZgl2aM7GFQ6IksSO+RgE
	rIUYN6aBxa39LrtBkLPjnKV3gRxFOM8PYD2dla/Oo
X-Received: by 2002:a5d:588c:0:b0:390:eb50:37c3 with SMTP id ffacd0b85a97d-39c120e33a5mr8199381f8f.27.1743495666194;
        Tue, 01 Apr 2025 01:21:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXLqumgl6PPZ8Sqy2fhKqkRiYpMZaxMRMS31vgxVjkrlC30wGVZ/p/0Y6r7j4mbneSYczTHg==
X-Received: by 2002:a5d:588c:0:b0:390:eb50:37c3 with SMTP id ffacd0b85a97d-39c120e33a5mr8199358f8f.27.1743495665888;
        Tue, 01 Apr 2025 01:21:05 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:4d00:6ac5:30d:1611:918f? (p200300cbc7074d006ac5030d1611918f.dip0.t-ipconnect.de. [2003:cb:c707:4d00:6ac5:30d:1611:918f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66aeaasm13620785f8f.53.2025.04.01.01.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 01:21:05 -0700 (PDT)
Message-ID: <d4f6c677-7944-4b27-a21c-819dccbfcb37@redhat.com>
Date: Tue, 1 Apr 2025 10:21:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] mm/pgtable: remove unneeded pgd_devmap()
To: Baoquan He <bhe@redhat.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, yanjun.zhu@linux.dev
References: <20250331081327.256412-1-bhe@redhat.com>
 <20250331081327.256412-8-bhe@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250331081327.256412-8-bhe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31.03.25 10:13, Baoquan He wrote:
> There's no user of pgd_devmap() now, remove it from all ARCH-es
> and linux/pgtable.h.

Drop this patch, Alistair will remove all that devmap stuff soon.

https://lore.kernel.org/linux-mm/42a318bcbb65931958e52ce4b1334f3d012cbd6f.1736488799.git-series.apopple@nvidia.com/

-- 
Cheers,

David / dhildenb

