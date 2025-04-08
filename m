Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8A82673A4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 10:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744108497; cv=none; b=GC0EZ4A8OC/SlTS9uSt7N8l2Di2cTWcAN/W3cDlQHn4NfoOg9T1VEZDyKj1RLX+GXFrDslwYKOeuP/Jh6t4GdE60o606qh47vGkZ4xBUalBqe/BAPLPzGWr6xCDyuchrrqSn5cqkEDFqtMTsDGyYlBwNr+iXsRFp/5WADJOHOAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744108497; c=relaxed/simple;
	bh=dIUSGCQJMkWXHVB5T0uBKfCutdPuOePLOlNcmB0Cw8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FJ9mxmfbgmLimAfwxE2yIbwpIi9rTwGn9txkxWkPGSWR/nOVFK0baVhifKMLNfoVpMsgpxZZLSU9+5uSuQJUzLgwoNkvcIpCxvu1Ueg3424yQxK/T7+JRxjhwx3dg7tp8WNtLog8AKfwQGSfEVQL9WrbgYqinSBHxE0eV8RXxbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jlty5irL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jlty5irL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744108494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z1kLDCuy0LJWaq40XfbBnptvlV3cFoN35q8yUrDYBAo=;
	b=Jlty5irLdbVVLkbKZpnR/fTezSo3p16sIE/BU6XwLdBaaoX98pdCMCAn6LEQMCQYBm/nOH
	LTG8G5nzsMdBmMI6bWJbZlS7XkEKp8LXk38gnsnROmX14LRU5e3ELwwuAw6tbQNBgLTP+l
	zgMr9U4LRKNvCXkmh6LoejF/OTWJRzc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-qOTULbL_N3WhHfAkleVrJQ-1; Tue, 08 Apr 2025 06:34:53 -0400
X-MC-Unique: qOTULbL_N3WhHfAkleVrJQ-1
X-Mimecast-MFC-AGG-ID: qOTULbL_N3WhHfAkleVrJQ_1744108492
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so40772415e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 03:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744108492; x=1744713292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z1kLDCuy0LJWaq40XfbBnptvlV3cFoN35q8yUrDYBAo=;
        b=nAcPwtiJj9tni9jL2jCxEW71cCGwWQ1FRX47+LG9ARZBxuB7QScnQYWfhajJqGT6uc
         Fq1qC3TI32/m+kRPZEqmcW6CZmCp/5DVwtZdAFyds2ji+q6dA4ARVkuW5XgY1EKq9S8J
         YUF0642QgsrrLTLlktUfQCOSA6EiZ1Ies/UZmG2q2ycCJWbdckvxWYWfIYxn1CZuIeIg
         5EnxjdjmRSd61Tl90mqKhVk/8ImpQzQHGsAW0dk+kPQWUi8uJ0bX0yao5z1mx/qYvmGK
         gdwQqN7Eb48DId46PfyC+5VMp/J6wvTOwnwWK1eeloZ/VlmhXUxcWO97HczMSoZrw7CP
         UDuw==
X-Forwarded-Encrypted: i=1; AJvYcCUEE8gilQw0vZ4Dq+EkBeV729iX/yKEKyPISfUsb2VyC7BvmB0BfIL55K9h2S57yrSy3Cb7EdQntC2J9Zk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4IoJuQErir5xqecHlTCvkOEevfg21cOhCaTXYhicEXI9q7/Z/
	ZNlD8iQoH8hYlVb8+fJZWt2r/KIROnih5qg830s0Q1L1IYFy5bGUEo5OsHvPC8/yJkPVAWsq6iS
	s+Btdixbg8jnXj/5k5ghZ2UjUrvkwiJs2SeQWqU80pHhXWogNBu0gynqIERfvSQ==
X-Gm-Gg: ASbGncusLVXB4wOZMQm+zs7parnPrwTTKVqNoN3UWrLFYn5r+YXGqXel+JrDJtYGztG
	iLMURPpp3DyrHGDtgEInEtCWdo+wZxERj8hSDNPbcrWn0DOYUicgsd3Ypx90Slj02q9oxycjDF2
	EaI57n4ujkLtXNxt3yFKwemqt3K34LgS5ZeYo0gD1SFTxxihg9wZrQ/GfDl+VcPTL6KrxaQbTgE
	jNBCeOW18gn44iswF6NfEPYNl+bFhASv94psa+AD5vJHJFGUNPMzqX0kynrP5jEzpsDMbyRnz3F
	VTi8/RYiamDnQYvEi9X2XNYtNuzl3BGrlzYOsBsDoGY=
X-Received: by 2002:a05:600c:46d5:b0:43d:fa:1f9a with SMTP id 5b1f17b1804b1-43ee077feeamr114018945e9.30.1744108492244;
        Tue, 08 Apr 2025 03:34:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNrx9b+C4sy+Jf7jez9bNmGMXH7wVN/rHcn9k1wVEeZvgkM6nisFU/CRDVij2cqGe7/JrW2w==
X-Received: by 2002:a05:600c:46d5:b0:43d:fa:1f9a with SMTP id 5b1f17b1804b1-43ee077feeamr114018755e9.30.1744108491905;
        Tue, 08 Apr 2025 03:34:51 -0700 (PDT)
Received: from [192.168.88.253] (146-241-84-24.dyn.eolo.it. [146.241.84.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f121d720fsm8632615e9.1.2025.04.08.03.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 03:34:51 -0700 (PDT)
Message-ID: <89f9194a-e7dd-423b-ae54-c082f42edf51@redhat.com>
Date: Tue, 8 Apr 2025 12:34:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3] net: wwan: Add error handling for
 ipc_mux_dl_acb_send_cmds().
To: Wentao Liang <vulab@iscas.ac.cn>, m.chetan.kumar@intel.com,
 loic.poulain@linaro.org, ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250405115236.2091-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250405115236.2091-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/5/25 1:52 PM, Wentao Liang wrote:
> The ipc_mux_dl_acbcmd_decode() calls the ipc_mux_dl_acb_send_cmds(),
> but does not report the error if ipc_mux_dl_acb_send_cmds() fails.
> This makes it difficult to detect command sending failures. A proper
> implementation can be found in ipc_mux_dl_cmd_decode().
> 
> Add error reporting to the call, logging an error message using dev_err()
> if the command sending fails.
> 
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

This has been posted while net-next was still closed for the merged
window.

You should have waited for the 'net-next is open' announcement on the
ML, or checked the status page, see:

https://elixir.bootlin.com/linux/v6.13.7/source/Documentation/process/maintainer-netdev.rst#L35

in the interest of fairness towards those who correctly wait
for the tree to be open I will ask you to repost this again,
in a couple of days.

When reposting, you can retain the already collected tags.

Thanks!

Paolo

