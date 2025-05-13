Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5950A211499
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747126806; cv=none; b=Av4G4w76l2QfO6lDKLiBmz0S5efTSnQPzPhoPq1rkkQT/bHtkMZcJl+cfZ5uk1z/9L9rnKHel7UsXt3otVoSjUUbBsf06CTbml1b4lrCb4WmH9D2p5midW34HRCeEdzz/at0oxTT1Tj/Fet5ZYFdGBxa/NYCqoSQeqFuwXoIBOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747126806; c=relaxed/simple;
	bh=7FJCteWCfIbSLLE6R3OoAZZaPUH1UYwU2njFZe3VddE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ULbrO1HBb1/YXIQalaR3DjkjUNGWmmbGp4tNZL2Kg2nikGlwU2PxuB7uJyD2fCXKQNhmCVlkVlyhMRWLr+0drAObdCQomKjvUR4PXHN9ednDWpN9TwWYviWq8TDBkbUdLFqKRQppnKVU2rYYclwxsgOj8spQiLaBYN4gqce5We8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=g4gafaXd; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="g4gafaXd"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso37313635e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 02:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747126802; x=1747731602; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J/sV5bReSJD3klljzGa19Hc4f5rzEgOUKX1lBy/6QCQ=;
        b=g4gafaXdSRyGB4TTs/uvclXPRxjcrsB9srAhglZg29HZvKoz4bSSmJxtp82KDbz6nw
         HINf6jdXI9U2PCCuOHu0LqsRPP63F2qewsoUIvbupIwg5eTPeaiQxLES7h3mLSNF6HnK
         QVHhQthofLEfPAzsVnA1EDsgo4x/Evfbzyq1DXHKjt+HUKwUrHQVh49xvUiFlHQFvf1a
         f6ZmEvb3IgcGDm0vOELCBogpYAhiU1jfsi1ZtvXKbWpFux2a/2uktmoDmUQYoAJXPOol
         BJ8lqBJz4Z11m8DQUJtAezj8czLXmmTclcxHrOHHNeX0pkxnDiT0eNxvlejiBF42I6pk
         moUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747126802; x=1747731602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J/sV5bReSJD3klljzGa19Hc4f5rzEgOUKX1lBy/6QCQ=;
        b=V60T097sDV/1OQiWfETIqFlKMpcJ2sQVRy60COeIS9u57X9DzVqqG3BtcLHbJ52nIX
         0a6kBJeMCVYaeY/z8f733qYPPUxdx8PgkROmtyMbs9NmlhTep/furSkNXjyrat8Jnxyx
         BQ658O+vyp1i8gjU6yuu1zyNSXFV9RwhJdvwwFVs9puRrSPBXhz95i7z8YTPhgivXmEs
         9/bD29nJyd+AmOOnUJdZ9zl9jQos5skjkNuXma5p5So8jNK08ehohtVGmJaUQ2WZYF+e
         Mqv4E2/sFIu8vh7mqsY7AvvFIXlz64wW5/JfnAobfSqv0+RqDzG7mqCwBHJpYGn3+HKb
         XgBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPoHSvSM9rZveEXOuai2m6V727oY5hDLeiAzcIPefDEaYqWyEXrjpotRv4ukOolgBQUNl8NEumGvbXe4w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfHYb7wTIVYel/LTIwl3i0P6hYE7hHrFwsMiI4Zdr9/Y7G7DE1
	A/b2g5YOwila506+KI33qf5HrQMwfWCqI2hzT0s6KvTm6ILpoVT/CzVyz4z3jHA=
X-Gm-Gg: ASbGncvLZkGOkXJqi5o2EU9mEe0hrXVagHsNaqgjMlTJoBfLM+mqqV0kibqz4tzTUYg
	JbPSKO4lpjPKTmrK3/NZ1UbYAM7jF9oMd/ZbnyGVP6i2enq38sJI6QLhLJ9UUbRTbU+B6UWKv6h
	62SoN8NZOpbW0lmBJirtZmXhfZpmB4zQbwGnWAkxH8ObgsXtP+hyL23gXUT7kqlLBeMkkzjjwF/
	z9Wsd2/Eflpagy84oXxmd0brJFqHow85eac04D+2T23UhX4iwOFAWftHEG+2rA7W3Cj3vl5hBEb
	clNhveRYA34vMOQpn/E1hY3w0riBmRTAtPD+T4ebmU3TXbtkjfSxnc4bBP8zLskasz7LUvY2JOo
	KtCHnsOnS3bPiISAqjcs=
X-Google-Smtp-Source: AGHT+IHNa6LdSLW0bGwyDavu41Wnn3O0fNNmTUGNaBgw+BMksPcYOfz9t377gEimfC/qQPa8Osxksw==
X-Received: by 2002:a05:6000:430e:b0:3a0:b733:f255 with SMTP id ffacd0b85a97d-3a1f6484984mr12614588f8f.25.1747126802598;
        Tue, 13 May 2025 02:00:02 -0700 (PDT)
Received: from ?IPV6:2001:a61:1335:3601:f121:69fe:935a:67bd? ([2001:a61:1335:3601:f121:69fe:935a:67bd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2961sm15400503f8f.45.2025.05.13.02.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 02:00:02 -0700 (PDT)
Message-ID: <cd601d4f-566b-4fd1-b13e-b7bf8bb59507@suse.com>
Date: Tue, 13 May 2025 11:00:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] USB: xhci: use urb hcpriv mempool for private data
To: David Wang <00107082@163.com>, Oliver Neukum <oneukum@suse.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250512150724.4560-1-00107082@163.com>
 <20250513055545.5738-1-00107082@163.com>
 <875848ec-f92b-48a9-b5c2-792bb0121824@suse.com>
 <1335f63c.7bea.196c8c53bef.Coremail.00107082@163.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <1335f63c.7bea.196c8c53bef.Coremail.00107082@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13.05.25 10:31, David Wang wrote:
  
> No, I don't think which HC the URB was last used for concerns here.
> A URB cannot be used by two HC at the same time, as long as this hold, I don't see reason
>   worrying about who use this private data before.
> 
> This patch for xhci dose not assume which HC use the private data mempool  previously, nor
> should other HCs.

OK, I need to correct myself.
Though I have to ask in the long run what happens
if two HCDs need to allocate the mempool differently.
But for now it will work.

> Or, do I misunderstand your comments?

No. The problem is with the first patch in the series.
Basically you need to pass mem_flags from usb_submit_urb()
to urb_hcpriv_mempool_zalloc() and use it.

	Regards
		Oliver

