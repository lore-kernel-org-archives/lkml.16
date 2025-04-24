Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E9D1624C5
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 20:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745526569; cv=none; b=XcprrkVTHV6Cy3fSwvA/zCniTY3gst1vpedgVuwRfZFzuSH7zyEVF+2kcWp+ebg2L1WxyJsU1O+5zX+4+/uCneFqQtS2YABMQqEWghczW5z7Z6EKCZX8s8YZUYr5w2XxXT06vgpkc0oN99/NIFRM565qRCDeYCVSuHF9Ya0wJ9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745526569; c=relaxed/simple;
	bh=YB0uxa2wMCUwGbFJXLOGYd4rRF6o2Kws7l8SEeqV304=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mjAr//YM2NdTl2CDaxlG8CCNcs1DLxWiP2LPYhEgCI9cDx+mUkjp/LnHFg39JCI1EiPZsmUHrjhgB3KhKJbe04elbFlLNkz/k6RDOFMOw3PkJd5K2gCeCKDvEsTCIa9uSfJJzaZJJpkJhn8GtpDre17E7kuuhrXrCOF5HJQbhJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UXk6bDx2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UXk6bDx2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745526566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MM3pxXrvUDxQ9/OW5AIhgm66dwJITRXGhAdjOmWdan8=;
	b=UXk6bDx2d5qHatPOGl1RAsS8wI6Fbt2bi+9BpQlAjpSZiZjSxK4sILN+HtlhNLsmCG2ztl
	ohVGsNcwdWvZY/G29E1LTLUgLoeZ2o+OWNv+daH+k947io3nZYlWdyoijfLACz6itrw/ou
	WeEmIg8as8xaxFbGogwbPtockUj1H00=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-s184oou4OcGsn9ybcRFFwQ-1; Thu, 24 Apr 2025 16:29:25 -0400
X-MC-Unique: s184oou4OcGsn9ybcRFFwQ-1
X-Mimecast-MFC-AGG-ID: s184oou4OcGsn9ybcRFFwQ_1745526564
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43e9a3d2977so10650935e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:29:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745526564; x=1746131364;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MM3pxXrvUDxQ9/OW5AIhgm66dwJITRXGhAdjOmWdan8=;
        b=BKt/WO8msbgsk1CPfEEO10i4nTu3Jm1qvqCAq0eJBHJ491PY7CrFzZ8XTDkZs+6935
         8WcVvNUDK50vsdzGZh7fCKqCiOW/mhjrRiK2byGwPslgjR5Rjqoik/9VkHr/eH5qxRXg
         /OCQqR/DdS8mrrwFyFMNqU9r8495fjGogWGTEAqwHuuFPGnv6FxLwQGGiKz6cu8EvyxP
         +LoJGX8LUrOM0BLgb5voAXHKKb/1UUjTPofs8Sb10ykk5FGAYbXYB/iQ7lp86UH80fiL
         C3fQ+hd7os3icH9FTa34kXzNQOo9NWiw5OJDztjYZWG0ZbQzozF+xMSHY9sJDJymkWK+
         fG/g==
X-Forwarded-Encrypted: i=1; AJvYcCW3ntrS57Spx2aAuzgacPlvyPDOUAbePp346LdCikuYfK6h7XRclAxG6UqFtFx5Mr1nwHATXiVKJ8uuDr4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT4jzIbmtvTe8togACJd3eC8/0dZTOvl8YnBz5c/Jxt+7nxzQu
	E3t4m7O5jsDREL77K5LDb0PvLVdQlDcnL/U7VdK6d8JwNkqnlxvMzr0s6/lBA5HcweK7ox2rbnr
	xkp+uxSIzQ4g5jJo1gyT9e3PzgxKlwSYc8Ef3zzJoCTBYgK0xARMfGL0laekUlg==
X-Gm-Gg: ASbGncui9tB6fPLTJDMrWyka0yV4vJebeabXKgrNpQYbauxU8+0x0mZ4xySL73WrYBb
	hqEclYF8xYlI0uAcVm3Mj1RmyvAD/WJYFqauJecli44lg4zwY19zQYTdjc8Y7hXs1QLZcFhHS6+
	eGzZr38kcqxr++V7KLDh9qxbWi4PiLorDD3/rCuqcO+gWN6mbCYA6cyahYfxi9DThXuQAn7PaMU
	nkuDdaF7CFJDDrlwvJmVBSIHpMr8J9HF+Y2wJPvFfVuyKERiZEs5XYMO7JBrnCm/IT3Oa976I4d
	AKXSfBA37fAWsKCxewauNZ7g4311hht9vHwpz825Y1STuO71gxILgDj6Rr/rq45c2i6rgB6liP9
	RelHLFgUZ24cLOrqiI5HlgVhaawjvfyXmLaTq
X-Received: by 2002:a05:600c:34ce:b0:43d:fa59:a685 with SMTP id 5b1f17b1804b1-440a31ad9camr7412545e9.33.1745526564135;
        Thu, 24 Apr 2025 13:29:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAhpxcwcVUHa8LSqX+EOpjrtvrt7DLS1MMFCxrUzzfeKg3O+/5EPUU7za2QWXIN4EgZi775w==
X-Received: by 2002:a05:600c:34ce:b0:43d:fa59:a685 with SMTP id 5b1f17b1804b1-440a31ad9camr7412375e9.33.1745526563740;
        Thu, 24 Apr 2025 13:29:23 -0700 (PDT)
Received: from ?IPV6:2003:cb:c74e:ff00:f734:227:6936:cdab? (p200300cbc74eff00f73402276936cdab.dip0.t-ipconnect.de. [2003:cb:c74e:ff00:f734:227:6936:cdab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5e1c6sm254100f8f.98.2025.04.24.13.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 13:29:23 -0700 (PDT)
Message-ID: <b470031b-f314-4081-b1d6-87768e5d8e73@redhat.com>
Date: Thu, 24 Apr 2025 22:29:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] support FEAT_MTE_STORE_ONLY feature
To: Yeoreum Yun <yeoreum.yun@arm.com>, catalin.marinas@arm.com,
 will@kernel.org, broonie@kernel.org, anshuman.khandual@arm.com,
 joey.gouly@arm.com, maz@kernel.org, oliver.upton@linux.dev,
 frederic@kernel.org, james.morse@arm.com,
 hardevsinh.palaniya@siliconsignals.io, shameerali.kolothum.thodi@huawei.com,
 huangxiaojia2@huawei.com, mark.rutland@arm.com, samuel.holland@sifive.com,
 palmer@rivosinc.com, charlie@rivosinc.com, thiago.bauermann@linaro.org,
 bgray@linux.ibm.com, tglx@linutronix.de, puranjay@kernel.org,
 yang@os.amperecomputing.com, mbenes@suse.cz, joel.granados@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 nd@arm.com
References: <20250410080723.953525-1-yeoreum.yun@arm.com>
 <aApBk8eGA2Eo57fq@e129823.arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aApBk8eGA2Eo57fq@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.04.25 15:50, Yeoreum Yun wrote:
> Gentle ping in case of forgotten.
> 

I think we need some input from arm experts. Anyone?

-- 
Cheers,

David / dhildenb

