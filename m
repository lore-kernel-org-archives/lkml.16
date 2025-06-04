Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1AE28F537
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 13:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749043837; cv=none; b=ZYXzIs1XorINKkAYCY9r6kukLv02ovsO/1mad/zzJ8NdvNxl44nSuJj4qy7D/Exm4kzFGC0dS9ixlM4NQiMs0mh46uZLRyHuQY6aw8r4JH6B3orAm/9z2bZxxtXRPqcWqwrqnflAEZ5CwEIhTN1YgRySnU1rNRGV7jRce/BohEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749043837; c=relaxed/simple;
	bh=vGc/ya8WD8Arl5kBDqEmegGuYoXLUKGi0BH+cyLb1Ac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yp/cnziJQ6DZrVL0HMYkvB/kdiRUO/LAT7MaipoOVP2WirTLSF5H48Ar4i/4vOmy5PdxNeXueIKbdbDlTRbOi7vtDi5u11Mgx408G1DNfOQ+Y60wKJK7x4JlIAlk1jkkyH0BuscE74H8JlTxcvyNNbl6P/Wy1D6/jIHfNV7cmAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Np+Yj+Cp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Np+Yj+Cp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749043834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+X4krYrnH5NEJpMGCxhyBmpja6nPciHd8wSnog0o/ME=;
	b=Np+Yj+Cpb5eZvlhGMNWyqDTgEiuLlAuo1RgyV18fZDFv2zr9nDzRpi0oXn/SBorIll5TGB
	qK94DIzmJSz9nVk6wUUcnIePIrDYaAWqzMO0zWg+IL9GmEicb1RDshV10DLFC5X5T4pw/C
	JLza0CseFyRzQP7GzZKHpvD1LnHbCbM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-uBoKpPGoPs-pAMWI0StnyA-1; Wed, 04 Jun 2025 09:30:32 -0400
X-MC-Unique: uBoKpPGoPs-pAMWI0StnyA-1
X-Mimecast-MFC-AGG-ID: uBoKpPGoPs-pAMWI0StnyA_1749043832
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4fac7fa27so2305196f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 06:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749043831; x=1749648631;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+X4krYrnH5NEJpMGCxhyBmpja6nPciHd8wSnog0o/ME=;
        b=m4agw8Fn1TulEMrFIY05HWiKjtBFh7e/iMXK8rK111znMAaZ1uY+mLc7GsJl8SzGk5
         0PdWSmkGTWoCucBCjBT/Cn/TQMlQvk+PSURhpIuN3s9plS5QlEdp8PVlBc1JRGsPFGkL
         UKKNvjV3QudUQv070QGoyCCcbu1IMDpN9E8emHU5sNvjyp7nbcqsSECf6WFHorIASEmI
         /Kw8FNBgcV/iOwEqDOb3kqQYyn7+bpepuumG7PNpAfPDNfZM91zWO5cFgjK/OQoBXSG4
         /4LCNBbZde3hKBjyi3Bne/U6D63mNK4X7el41Q/VUwUlEIh6Ai9W5k8OVESpB/vpiNjY
         C9LA==
X-Forwarded-Encrypted: i=1; AJvYcCX06Q4lpKl6BG0BKfgY8ObY3WmBrNQlZXOxUFJTug7JtM4CMiLQi/Th7qcpiD5qNjWblxMHnjaNJxFYH2w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEeOWvBJ3MGngiunfoIhakoTW9LBTaFCmLBcOL68OYVKrdbWpu
	n+hO4lD6xAveYvFD+GRSpTzxamk0/AjZDvL4cXMn8H0y6gW/o/mttQscvtZidlsEtE2mUgXdZAk
	nzRkpbQupATxz1FD8bRQAc96zGMyflgbfidWKem2PEIsjjf7DqlBvTVEr9MyUQd9Gd+mur20GcA
	q1
X-Gm-Gg: ASbGnctc87cgmJkmaUHhH1KJzCnG7IYDtUOAKTiiuFbpszqEzQpHZhqtwl0uqs0m+0n
	Krp18wVamfN25BlupmIOqavHqoQ05jxmnR0hRMsRFXZ6g/i/Dbb61yCAtA3dsMSF/lV1+OX8vIW
	bOW21uA32sCDEvliH7g4guqPZOCvfBsIoHK9tiTmJWpfqnoeVJ0GfQRgcQ+0KZLzpE4JyQI/p85
	68C3rqeBZHSJm6SNVqbqCmCZ1dhUslTpRUBD2jPEoJIrILEY1rf4bNNWaPacXHWW6N8lxRrpi2D
	/CeuTziT/fe2thSFBJaI9lh/9wq/2euRJZ7LP3uOz7DFEfnmy856xnS6sc5whFp+k7iJ4TH8DVj
	uCuXkhT3toYlrGM4L4hENpfdSKGT1fSN2vV4nNNnk58R7IZFuYw==
X-Received: by 2002:a05:6000:178f:b0:3a2:ffbe:3676 with SMTP id ffacd0b85a97d-3a51d975b8bmr2460452f8f.49.1749043831559;
        Wed, 04 Jun 2025 06:30:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpcxAjAVL4GX5/4qPkj9qmsXJ/nEQtr6a+UPbPxY3tj6mbKjE9dQy9GiHzcIDrG79/3qURZg==
X-Received: by 2002:a05:6000:178f:b0:3a2:ffbe:3676 with SMTP id ffacd0b85a97d-3a51d975b8bmr2460422f8f.49.1749043831138;
        Wed, 04 Jun 2025 06:30:31 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf? (p200300d82f1bb8006fdb1af24fbd1fdf.dip0.t-ipconnect.de. [2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5253a7aeesm354307f8f.1.2025.06.04.06.30.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 06:30:30 -0700 (PDT)
Message-ID: <106e83b1-7738-4c98-9095-84cfc1017b73@redhat.com>
Date: Wed, 4 Jun 2025 15:30:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] drivers/base/node: Optimize memory block
 registration to reduce boot time
To: Donet Tom <donettom@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Nilay Shroff
 <nilay@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <2a0a05c2dffc62a742bf1dd030098be4ce99be28.1748452241.git.donettom@linux.ibm.com>
 <96f7d3a2-2d85-442c-a9f7-e558d4a2ba06@redhat.com>
 <de209828-d237-4912-905b-8c7de7e5734d@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <de209828-d237-4912-905b-8c7de7e5734d@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


> 
> Thank you David
> 
> I’ll make the change and send the next revision.

Feel free to only send a fixup on top of this patch.

-- 
Cheers,

David / dhildenb

