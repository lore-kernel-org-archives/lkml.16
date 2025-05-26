Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057FF1FCFFB
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 15:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748275111; cv=none; b=FI2jU64wipAmMia1GpoudPMlPbNp53XJNYBZYBWJdv6rpQpFSJ8z7x891HL7O7//qSQIKsH6Pyj+o10SxcnxJCSAzyI8u7gl+L6o9GJY/aen/UGYmLd70ThZagMAzJtpCORmsIZ6mFoZHI02UjCUdWJbbs7F/KGyVZgeaTxSd2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748275111; c=relaxed/simple;
	bh=LaFEsq0HvB9vr4NaAcRMwoScIc427WLEmDgdNFDZnT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OLL5MpFriy1dAzBIZE9yiJHdEv8LIFZU8hFvLAn64BvaGm8QarPR5geXxCYnBmn0pjQzvSZjh/UWq1H10cjbTEDBeRYuZRfEUcbURTmDdyjJHW8ozHbg3h+zwE0rCQO4ZfMaAvzGuTxvNP/D/aV8QeKhy+WmDIXJVmy/2wm13TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IOgRoZIS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IOgRoZIS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748275108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NSybODuSpim2xb5ecUjEV34I5epjrpdilRUFqZmAtNw=;
	b=IOgRoZIS4zJt2+ISC4iWiDUrAk/L+L3lL7jPyxeMDEYWnM+CyblwaPOtBLzRMNtMIMuK7Z
	wJHdgtj45c9Zhff3Xcwvremo+PdSohVsr2B+hiutev1y++COT1Bvy2XsBy0jQA4qO25YN0
	H8u2h76BwL2nAfwfgHSH5rxMqdkXB1s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-pXrMYdKwODu2M7MnftUTUA-1; Mon, 26 May 2025 11:58:26 -0400
X-MC-Unique: pXrMYdKwODu2M7MnftUTUA-1
X-Mimecast-MFC-AGG-ID: pXrMYdKwODu2M7MnftUTUA_1748275105
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43f251dc364so13608605e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 08:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748275105; x=1748879905;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NSybODuSpim2xb5ecUjEV34I5epjrpdilRUFqZmAtNw=;
        b=PqpYXStkL/t/U55DvMOCGk7sQh/B/kY6gmth84vv/Z796+kEVyXiOY3QqrRsKPVpiH
         JBGB1QRS8xlEAUqLXREBOHa1NYWrsWANmGg062OQCgslcFkU1mKAmsOMB9IV2/FTqIVs
         t/V17kvD115oeS2ToxKF7cp/hHgzJnCHFQkUsAe8SDBUukuAgYWlUrQZQkKaA+RgJ2tj
         rqdBwL/1xH2qcSK+ACVh96MOr23xxbbQMPXomRYIOH9aDPMJ4lanksKQgLIfOsvTImV2
         slfy28bFy0Bn3+M4ptGEVteYeQMa+mX4PuSRDyZXb2wzVcEsZyVavh9MZkQFtLHKjuh6
         Gn8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU76xlX1j3zCE5CpUNc+vDxs3oosbKv3OfTCK5V9RU4Wq/UTzLIEl0tm+jIjO8ySeGVx/+JaPrlQauEgYs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6/KUSq2FyHNzM7mIVwvldYjzqltk2PDSAvGVDkPowZcdU6Dbd
	/Jkn9nLqVx2RHEKfx93An3mEsmZ3AbGGix/ld4ePUgkchfogwcUoy2S5rU/nlYDA0QAI9jrb3ts
	V9CD3JUsZscMEh2bYa0U/JYO2STIE9mXhoJwEHHBCtyqmkX/tSCZvBzvY66em/XxjLQ==
X-Gm-Gg: ASbGncshr0LVTv27kjbfpxjOg8sHQG81KWdU6zdG472SCjlOi7TH390bMKwq5BtGlbi
	9d8BYFf9rSpkTCtx1NuZSuTbwJqlUXPpFVqaNcnAxuzqPeJT7W4BgQo9bawiQ9XT9ZSQqlVRrBa
	wNXKn7idtFtQ2MzQIkZBrb9H1GITGv0aY1lkI5DRDt2W5e55G34fPku2+LAF7d2QuvFRMMv/5Yy
	mEbgGwaRaB9G8lvSNK+8kGcZyIs/zHBo7gG6rL9FX5gTyH2NXucJ/JFpVNhP/IrFRWG8HPiMmDe
	t9Q+tLUYbhrCJexSX80=
X-Received: by 2002:a05:600c:1e8e:b0:43d:7588:6688 with SMTP id 5b1f17b1804b1-44c91cd5140mr79858705e9.12.1748275104832;
        Mon, 26 May 2025 08:58:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaz2/DahdwY7xm9KuhltKb/hfFgL621ZMWkKswp0RZ7mvRzfJ8eI43LuiT7V7CFnuroB3R7Q==
X-Received: by 2002:a05:600c:1e8e:b0:43d:7588:6688 with SMTP id 5b1f17b1804b1-44c91cd5140mr79858545e9.12.1748275104451;
        Mon, 26 May 2025 08:58:24 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2728:e810::f39? ([2a0d:3344:2728:e810::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d37498e8sm5450416f8f.16.2025.05.26.08.58.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 08:58:24 -0700 (PDT)
Message-ID: <3b7aa4be-bfb6-4c31-8f98-96a2d9988f86@redhat.com>
Date: Mon, 26 May 2025 17:58:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: phy: Add c45_phy_ids sysfs directory
 entry
To: Yajun Deng <yajun.deng@linux.dev>, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250526140539.6457-1-yajun.deng@linux.dev>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250526140539.6457-1-yajun.deng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/26/25 4:05 PM, Yajun Deng wrote:
> The phy_id field only shows the PHY ID of the C22 device, and the C45
> device did not store its PHY ID in this field.
> 
> Add the new phy_mmd_group, and export the mmd<n>_device_id for the C45
> device. These files are invisible to the C22 device.
> 
> Signed-off-by: Yajun Deng <yajun.deng@linux.dev>

## Form letter - net-next-closed

The merge window for v6.16 has begun and therefore net-next is closed
for new drivers, features, code refactoring and optimizations. We are
currently accepting bug fixes only.

Please repost when net-next reopens after June 8th.

RFC patches sent for review only are obviously welcome at any time.


