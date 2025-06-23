Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5571201270
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750666084; cv=none; b=Z30kyUaLYPwfZM25Cm8Fxpdfn1lNrFni2iWTqeJZi9o+EE/o0PV1Qa8MCAn3ZhmnPXeuhUA7gO/Y92eOTPaNBqVKsslby7AfWCrBsJ2Lz9e50wpx5sk72ArQhtcniF+1z9Oyof0GtMGvUfjVwgTMkQEyDFD1zrSIMdvGprVlwbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750666084; c=relaxed/simple;
	bh=Ir7GrWuspL5cabdPDPHzW3EwajPasUzq9MSFveBoMrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YrRchqvLFWySmRvD9Zivl1V/2SQHOotE4WcPEUji0qlf6CSFxADbMJfumoLmPZireiKUkqccrdzI/bR9e6DcBePtqGvc6dHq7tnrlX0NFHBiByjKzbUEVvvoPwCxJwtl4gKQ4unxvfvsN/4ArTiubNwIonqbZeHFsiOg7zpc+Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a4rGbVYy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a4rGbVYy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750666081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Eg6CK6bZcDfOWWduv/3Lb1TUPUH2nOYd5oe1xWmhRck=;
	b=a4rGbVYy+fm2HcBiXUTTHXEDQX4fKR1X3PE4R/oTe+S06H/M3tHg1JtKYQtkWWxvMk4XCp
	howgDKbJDUTduRDWiOAM4RHoRQpKFmIXnz9SAk9GuIoZ7dKwv0CieDxsmXXhyKOfYF9v9w
	IW0nWCucNoiD2az1GYI4SoGY13EvwaI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-fkOB_GdiPDCAKqBtPEUa2Q-1; Mon, 23 Jun 2025 04:08:00 -0400
X-MC-Unique: fkOB_GdiPDCAKqBtPEUa2Q-1
X-Mimecast-MFC-AGG-ID: fkOB_GdiPDCAKqBtPEUa2Q_1750666079
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso26179285e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 01:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750666079; x=1751270879;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Eg6CK6bZcDfOWWduv/3Lb1TUPUH2nOYd5oe1xWmhRck=;
        b=RJ9KYmhWaHFd0YJ3gT359rlqCio+AtnpvUTciczHlRx4rdGRPUAeW7kXDSv7t6zJgg
         nospCLJVf2E7nlRQur25sFE6l3bY7RtdYvtkXKSuy0/NLs0+mdumec+w+OFBMXKmZk5F
         xgnKZNZ70N0B7igkAL2zI6tPcNbExkZsM/cTQzwEsAw0pZA3FSrcCbK652GUlnhnwQX4
         gLsBlbvBwYUy+V16m/fKDk23pxgHv1gOd1Ksx2FOpWm9ppUeEsZ+MxU9Iys3BhJTOb/e
         NmV6y4qtjC2XVepO37J6pHeJTfohof1JdvRiRALK2CKSF/R4dkGKjn58tlM7NtTZwJUs
         rGSw==
X-Forwarded-Encrypted: i=1; AJvYcCUI+wobcQ2MhaihNfdygwb7GukoyMMRCvSKD8oxP3YsNHR43+lY+TkF4ZkdfJ5boDtJsw2bOGXIQv+uEC4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFoa9d37PYxHcnnAWpBQUBQ7jZ5eiZAl2fgPgmP3zn2trVICL1
	m4KOzndyjf4GMI6QAIzzytFSE5qVD/qS9EuUH20z3BhY50btmR7lWdcTCYJJHNu6zkqJ8x6uDVI
	Aqhpihz2CNTDxdo+b62YzWDpmQfc+hgTd1xrCDcexRw/UdahR6guQ3b+LzUx3ZA+hlw==
X-Gm-Gg: ASbGncvpRn9n2jzQRbotWqump9wtPaIr4fzc+AxvErLCr89p02OHlFns1ttY4URCZbN
	2Ep/LdPDMcZD3+Y78UX8ho9bLZD3oeRK6voT0XBqifDXtnbOwqm05RhU5p6GLIkjEq8S+bPxwHb
	O7kL2c7PEeFNJgpvblJEdFk9bNAVSxywzJz5mDN04gz0wAEhZHElvRMB/FzNU4sGT3E45X4SeJm
	vVi6s8u6hHjYXY+aGwvZsjdjaiC/6mFTUMhUNJ7o8dko9+jdz+EEk9c0EhjOE4GnruKdz9jZuQS
	UKshOiKspOr2KAEGUp2wikoYTykpkAGISkyICapgJJzPEniWpDNxNjUs/U911XmHuvliwIsy7nZ
	UANcRd1tFIUnzftMu5HUkuQYNgU1F/3kRkqX7tTc9f61iCFtGbA==
X-Received: by 2002:a05:6000:25f2:b0:3a4:f024:6717 with SMTP id ffacd0b85a97d-3a6d12e652bmr8872778f8f.53.1750666078781;
        Mon, 23 Jun 2025 01:07:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIMvf/p55hMtkbeiNp+Nlj7DmENEB20RjfSJAb4xLB7xPP/a0Y4tIxLRfvUywl11yqer6nMQ==
X-Received: by 2002:a05:6000:25f2:b0:3a4:f024:6717 with SMTP id ffacd0b85a97d-3a6d12e652bmr8872752f8f.53.1750666078407;
        Mon, 23 Jun 2025 01:07:58 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f10385sm8964983f8f.17.2025.06.23.01.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 01:07:57 -0700 (PDT)
Message-ID: <b16a1df5-0b81-4600-bd68-2d261d2a3780@redhat.com>
Date: Mon, 23 Jun 2025 10:07:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/balloon_compaction: update Chinese docs for
 movable_ops
To: Nick Huang <sef1548@gmail.com>, alexs@kernel.org
Cc: si.yanteng@linux.dev, dzm91@hust.edu.cn, corbet@lwn.net,
 akpm@linux-foundation.org, wangkefeng.wang@huawei.com,
 vishal.moola@gmail.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250622004249.9083-1-sef1548@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250622004249.9083-1-sef1548@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.06.25 02:42, Nick Huang wrote:
> Remove Non-LRU Page Migration and Add Movable_ops Page Migration
> 

I'm afraid most people you CC on Chinese doc updates will not be able to 
help in any reasonable way.

-- 
Cheers,

David / dhildenb

