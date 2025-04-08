Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5551A2686B1
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 11:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744111673; cv=none; b=fHLUaw9wA1X+2nys6pOaf3PtKVZwvDb3qQCcMDPE3J75itksBxtfeccZRCEHH4sZoX09arqVketX6gAf2Y12lU/Z4oKrEXKOCMG95HSTLNudhrTTx+mCvys/2sWI6a6S8jS1dx3r7chFouufPmEWXkwVnNxLI3WQDMrkqstmHsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744111673; c=relaxed/simple;
	bh=f0wyTvRh5lpgWiiGO9fwyzoCdEcKmYS3jgl7pHv8Jw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Raz+arVsnRz3L3s8jF+FDwQf9dGE07JR4glFqa/gPRi5GeTMKVOocywtex6MiXt/6cYfQtCyNpYR/aQMSmA2ak5w/W1I8hRgpjB0csIuempjYuTW4Hg0wX+KTDw9bLEd2ZXJ0eiufz04mXFis1BB+PlhF61WB3EPRJ0zPZGsN20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VXMquUIR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VXMquUIR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744111671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oiJcUwgw3G77cyBQmbSkkpxoJDuSwz/pqjPj/WDvIhE=;
	b=VXMquUIRy1MxC5SRZVdpqzIwZsbMDv+RFq3/Y5220aLZtiRnz27yRuZ/Wx5EBDWmSajekE
	pFDg7OWp51KfI3J5j7fXIhaTxI3aPlei9wm3mYvYgzyMBs7Qw3alqgfNar7J2UYSvxobHf
	X4GtIiEkGXSk9MPfL4m0OnUGlg+1e7c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-nbDrglSvM12m8j_hjX-FIg-1; Tue, 08 Apr 2025 07:27:49 -0400
X-MC-Unique: nbDrglSvM12m8j_hjX-FIg-1
X-Mimecast-MFC-AGG-ID: nbDrglSvM12m8j_hjX-FIg_1744111669
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso39740425e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 04:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744111668; x=1744716468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oiJcUwgw3G77cyBQmbSkkpxoJDuSwz/pqjPj/WDvIhE=;
        b=eWya7ACUSrd5nrnHW23XgFZLDs6w+j1FLzs7Dxw5dbjzPB4WN2bP2eFAlEfwG7+lbE
         8rVAQBkHJ3hKQzouvhiQBEJTnPnVkgFKFGS/0EYiAuyyhxN+bWaLFMPcxEeOkrLOo5iA
         L/sZ61s4iod+wIXdmaGmw3aSuAO5ypF0Z+XltPXJq5mPr4ClGtAozRrTeb+RlenW7crc
         U1wGrWcqUhJY5ZYzQkxwvhsdjovJuCbQ/jdgqiyf7u5Qf8OZ3sVtCclFLTXEM/RW6CYF
         gBdKF6eZB3T94HNoskCHGewjQ/1q2Z60x8yayHe9uTDx0+eE15fypZWibsUoam+QC+YK
         OrPA==
X-Forwarded-Encrypted: i=1; AJvYcCWgPLN5aRbPWSZhcoDRji46lbswBnGR/dlZjdKu5X3FWeG9XHCKphwlAta9y2TW53Ci311X95EfuowNmJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM2u43FcM+mCZoSgzW1nbv3UX59wiQEeC2z68e2RS/FZ3ZbZJU
	YINSX7leKeS4T6PAYpwFafKSK82hG9vSTbXW2s2tEE+KPgK4ansooC/IGiMB7YA7LMkiyilh21E
	0ELl7PDqcUVvDm9a7PXP40c5uerzFMoRP+GPnG8YdYY4VPAAlRVocvDkwpXq7sg==
X-Gm-Gg: ASbGncs7HS4WTf/zu0kdLOg8jEaDoWCo3k1WFCxsdt4xoNRnccQp1beSfdxyHJ4aoMC
	pr9EsL/zpXpxoFIP1dUKncQSXxvqjHzVQpubHfjV4NCwCQiEyP1jvXx9YRtRZcL5YhFvlzTgjG1
	3K87o3PgPeVTtbc8NaibEGvBR/AgnbR7E0o5uNLMTUXI1HlHqxlcVcy4fsUxDqP8kNQw6Zc/iF0
	hmYixP9D5y6jGciFcs5/cuff98E5XU6TZ8cPVYNX69KeYYvL+5J1XQIzG1D00vYl6KFOj+dTvUm
	oCNWH4j1gl49+Zd0OEi5J0H1cLlhLLXNU0K4UaDozbM=
X-Received: by 2002:a05:600c:4e52:b0:43c:fab3:4fad with SMTP id 5b1f17b1804b1-43ee069569fmr126983665e9.16.1744111668624;
        Tue, 08 Apr 2025 04:27:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJoXZ2/VTIioZNKN80gDIxGBXzvfyGiFohuL9wpJ/xqRl2/l2496Uw3iNHljUOTZLrUqMGVg==
X-Received: by 2002:a05:600c:4e52:b0:43c:fab3:4fad with SMTP id 5b1f17b1804b1-43ee069569fmr126983395e9.16.1744111668288;
        Tue, 08 Apr 2025 04:27:48 -0700 (PDT)
Received: from [192.168.88.253] (146-241-84-24.dyn.eolo.it. [146.241.84.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34bf193sm156859775e9.24.2025.04.08.04.27.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 04:27:47 -0700 (PDT)
Message-ID: <f8f98783-0aad-4ff7-9fd6-0ebc8c734abc@redhat.com>
Date: Tue, 8 Apr 2025 13:27:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] amd-xgbe: Convert to SPDX identifier
To: Raju Rangoju <Raju.Rangoju@amd.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shyam-sundar.S-k@amd.com
References: <20250407102913.3063691-1-Raju.Rangoju@amd.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250407102913.3063691-1-Raju.Rangoju@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/7/25 12:29 PM, Raju Rangoju wrote:
> Use SPDX-License-Identifier accross all the files of the xgbe driver to
> ensure compliance with Linux kernel standards, thus removing the
> boiler-plate template license text.
> 
> Signed-off-by: Raju Rangoju <Raju.Rangoju@amd.com>
> Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

You targeted the net tree, but this is IMHO net-next material. Applying
there as such.

Thanks,

Paolo

