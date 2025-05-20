Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C62222D794
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747748799; cv=none; b=L5dK3hhVTRuDa5yHw060RF47g/FJv+zzH2II7aGpzJuNg5XV6jhckG40cMGYYbnURUkbj9AYqtBAUicuk+MOt6qkkdoe9Y2TlbhiNpheCB7DOSCnmes/WNp+UskBEBIh11wtsNvMCM7dB4xO5mfT9z0WPu3GxCVkrmSsyUfszgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747748799; c=relaxed/simple;
	bh=HNi/fBupM8V0uCd8n5v5erSjfON7H2afkO3wD7izDQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M5SPuAzdgiQ3jt4O0cA6ixWwgdhIV5gFNHppKORt0kyHCL1jSSqCioKBDi5p35zUtr/q6XLVYM1tK7RNbABFDnnRYH9dEh3PkdIX+YU8I6qbWoDP3K6+eyik2Cf5pDnHdliwuZ0wvu9ISLYJSqz19lUUkSQ1H4sKMjN1+AB4qnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ds+roIkm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ds+roIkm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747748796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ttZdwX7pocHD4KH7bapGwxeFxmxnKsH58aUosyTWGQc=;
	b=ds+roIkm+9LfROxVk+Ipl+s5BmqaeTnTeOgMw5lF7b3iVZqf4bF3NNA8OifbgJX1oMKdPl
	Ka+24M1kNHL2aG3GglVIymJ5RiWT6sb495CVE7u9ALCa0HDMEw1HmyTInakbLV8++MS+34
	4Df3dbUry43lITB+IRbYi+JvTu9/G9c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-vDdj4kmgPFqGs1v6MlWoKQ-1; Tue, 20 May 2025 09:46:35 -0400
X-MC-Unique: vDdj4kmgPFqGs1v6MlWoKQ-1
X-Mimecast-MFC-AGG-ID: vDdj4kmgPFqGs1v6MlWoKQ_1747748794
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cec217977so30050445e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747748794; x=1748353594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ttZdwX7pocHD4KH7bapGwxeFxmxnKsH58aUosyTWGQc=;
        b=bwsbCYbQ4Kv6TLIH1vd6TP0lOaz8kCaLnp45lv0YitFHvJvYKhkpIlQ4imo3+i6Z5n
         wQXOurjjPBaIlfj8bG16Ab0k0EHaQ9xvGHOe7TnI0wHueCpv0nGoWZMyNWHAwFJx8xES
         bZM+470gH9wIE3d+GH8klusi9IWMQou+pQFfvevzlFyn2JW5nPiXtE5dLuGVTWLXJVwJ
         dsNO3sjC1NNEYQzlFFudL/4r5cx4nr6oDeQ1noeNmDzL/YAQMpQ6Oy+gE1xldXDvTRdD
         MWhD4bo4HFbbQPA+tgjtBmNbrpN8X7ssOGWXYfbVfFj9TUD2b81aYaFq7vgG/ljCXk6/
         8lMA==
X-Forwarded-Encrypted: i=1; AJvYcCWBNl0yJf5YjbibWs9grPKFTyPdk2i7hGrXQNCxry63hpM0H7VIoj/UH4p+dICuGxO4JNF9TVh6zJRREtA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7qhKoc8lv2xfdPbySy02nd/TeVM11zzFqzKgkDkdM4jHqka/C
	K34s3lDD7Veg7tNY2ZgcgpGvHZvGEm7G0riNbe1c9wMJ7wJGZzmibtwWzyPyLRXAbm6zP6GZznY
	H+POyJuCfK+GTHkBScHAlphpd19+u9V4p/xBVezaqOt24W8NbwHHixBWR17dgXNqP1g==
X-Gm-Gg: ASbGncvi44XCskAsSVRvLT8mYFtStIeOMujuN8kCzYnvExFlpPZTaePqQs4X/CZXgul
	E6lHyP3kHw9Kd04FXEGupTNcCJz72p/fbAc/MZwM5KYh8B0ek8HvlNdEu436WqO8EmFlRQj1inn
	5fqkEny/ScXF0U6JDbN6E0GYL+Ap1TyyDyWavagVru5CXhUJf5KUII2y7aAmfZnK7MvRzTw8Are
	KS/3il0AVwDarDWMkj4kt9Tb862TCY79n3zMTRu3fo0EFSzhb1kJUAhO2vFhokYMsevUiSTFDge
	ZSO6iUTJkPTy/Jw+FiY=
X-Received: by 2002:a05:600c:c8c:b0:442:f4a3:b5ec with SMTP id 5b1f17b1804b1-442fefd5f8dmr167588025e9.4.1747748793771;
        Tue, 20 May 2025 06:46:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEraeeZ8dXT6jFTOV2vUtyjUlfu0PJDbiOGJ7n9ISNv0+w1r+DJhMjQd230y3rw1DDHt2o+QA==
X-Received: by 2002:a05:600c:c8c:b0:442:f4a3:b5ec with SMTP id 5b1f17b1804b1-442fefd5f8dmr167587725e9.4.1747748793394;
        Tue, 20 May 2025 06:46:33 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:244f:5710::f39? ([2a0d:3344:244f:5710::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d1f9sm16268918f8f.1.2025.05.20.06.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 06:46:32 -0700 (PDT)
Message-ID: <f818a2a6-2c14-4b55-92f4-c55f27010339@redhat.com>
Date: Tue, 20 May 2025 15:46:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] r8152: Add wake up function for RTL8153
To: Wentao Liang <vulab@iscas.ac.cn>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, ste3ls@gmail.com
Cc: hayeswang@realtek.com, dianders@chromium.org, gmazyland@gmail.com,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250515151130.1401-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250515151130.1401-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/15/25 5:11 PM, Wentao Liang wrote:
> In rtl8153_runtime_enable(), the runtime enable/disable logic for RTL8153
> devices was incomplete, missing r8153_queue_wake() to enable or disable
> the automatic wake-up function. A proper implementation can be found in
> rtl8156_runtime_enable().
> 
> Add r8153_queue_wake(tp, true) if enable flag is set true, and add
> r8153_queue_wake(tp, false) otherwise.

The existing initialization for r8153 is actually different from
rtl8156. Lacking the datasheet, I tend to think that the missing
queue_wake is actually unneeded.

A 3rd party test would be helpful.

Thanks,

Paolo

