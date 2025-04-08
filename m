Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360C11925AF
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744118966; cv=none; b=rCbRKYDd0sfvFeoZNCEcJQ7wHt8/WF1b0N46AFJsddBbKeGGfB2oFXy5/EB7N9/Q9MWIF6uFKDNCJPynIN39lyx4vAUE2fJra/MP2uWDeVkRj4WSdl+L8ppz2jAMmj4wfX+r41vXn0BUAGMXm36B2Key+Q471rNwIC5XPU5wATg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744118966; c=relaxed/simple;
	bh=3pOUYj6JIOLbe1ljngk//BXwsbh+xpYpSEW8R94B+kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bbs9utntWWBnD+6wJdXYx5V7bKu9MT/W9H+xmV76TpkBiPsl7uyhHOp56UvXUCdtEQ74MQDpzoAIHiWwE+BuVSk/c7MdPwtTUOgzqUQL7cTxZjRBKUVnTShBRDY18zlZ29hag7wcUmnZ/5Owm9F1fp8s95GSDTzp+BpwgtHl02o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b20U59gX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b20U59gX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744118961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uBHxE4o+poP6p/ofYoEMxQF6RNUpC2hi/3SExaAVHuA=;
	b=b20U59gXI4HHjIW2yoNZhiH0QtGvbO7O/giWKJiHoSTBux88satLREZk16kLX2oiM6rTrb
	9HUYWDaR/Ira/sqz9cNbpA61b1r83bOzJlUQ/60Ji4xQbC+TvSvIbiAoVtJirlcCg4Ssh0
	sD2I6MrMZiUapQ3U1Y6cQzc9plGaDGw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-HcAvU3vNNBajlCY_m5DIjQ-1; Tue, 08 Apr 2025 09:29:19 -0400
X-MC-Unique: HcAvU3vNNBajlCY_m5DIjQ-1
X-Mimecast-MFC-AGG-ID: HcAvU3vNNBajlCY_m5DIjQ_1744118957
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-391492acb59so3223783f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 06:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744118957; x=1744723757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uBHxE4o+poP6p/ofYoEMxQF6RNUpC2hi/3SExaAVHuA=;
        b=CajfzYaf26az0DMNSD8em5Kp24PmmdZ+ulnfqu9hkRx08JqL4BYJQ6AbNNf5i1qANi
         jW54uHetmlnre+qUoFBSg1WLfAt4RetngC0FlrKaN4V325RST1JafGFUnDFcCFWq56Cz
         wSjV0ELEtCLhXs5iTjWuSIiMsJeTjqxpYGDXLhIqKvXhspmdmhSIg7igvC41YQyJZwv4
         iU0ozVKAc8RxHBk0iKvcsZwCvmlby4MQhsINIVE+aXjriRcoZ4uHGTJm/F9Hz4n4n9ss
         3OIcZSUosq1cM1uJWxOhwc9Pep1GKbR2w1gq+UKrJ+MCyVFXXYzq0J8bx2WQ8YZZyrzG
         DHzg==
X-Forwarded-Encrypted: i=1; AJvYcCVUohhas9k5feVnQBxZdrefqeu66Yt3M4IMv+W084AUed8R0MAhOaWQjr4MH1N1oJNB9Ievs0hwmawVm78=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQR63Kxs/tK6FqmzQwDjhYjp0j++fZOmJdO7nHXR3cn/09T3il
	vQIaD3Jjg3qw0riXs1WNEHDHoVtE0BVLbxEwzp3OaWjL6Aus0UkPsZ6OR2VWZD/+VHaUeoULU3x
	+Uybs9PR8LNctedjra5NbBJH72wJejCuGkkCXR04GY3fRm32ZKXPdo2BR9z1bOA==
X-Gm-Gg: ASbGnctm/f58UiIAIONIjo3fh5Ny+P2uEMhK3z/vlISGFi4/lnbb4VeLINM8un2W8BS
	3mGBKM2sTi9NzboijvsTZlWkGDHHRxaHMCGsoc9wAeyFRg3pKi+MGhwu0OBJQlnwRSW5Ykmn1Eo
	9DDK8+3BPw/HUyCimc8JxBs+UlEZ4Tn7L/m0s+7xW0GKxKgL/ltqlWCACn5yf1aHWVqdLEO48Ct
	BVWnBT8nRP2Jw1Ww3O8/dl+oYDqhiuo8m3469YHPzkjk5TPcvGzRRGminlNJ4h9fWURigxNEB4J
	oo7QxC0dhTD8I5JsiYJ2C2S+ABBdg288ZOS2CUuOi7Q=
X-Received: by 2002:a05:6000:1a8d:b0:39c:1f10:d294 with SMTP id ffacd0b85a97d-39d0de28a44mr13769265f8f.26.1744118956999;
        Tue, 08 Apr 2025 06:29:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1HpRnEm/6M6CXH6msdauscTzQ/uB3jUvfgXW4D2EwTpNq9WLAloBhZWMlPFT2ix4Lmb7tOg==
X-Received: by 2002:a05:6000:1a8d:b0:39c:1f10:d294 with SMTP id ffacd0b85a97d-39d0de28a44mr13769230f8f.26.1744118956594;
        Tue, 08 Apr 2025 06:29:16 -0700 (PDT)
Received: from [192.168.88.253] (146-241-84-24.dyn.eolo.it. [146.241.84.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f0e5e8dfasm26993845e9.27.2025.04.08.06.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 06:29:16 -0700 (PDT)
Message-ID: <d5e03a72-bff3-4df1-91ed-6916abaaa0ec@redhat.com>
Date: Tue, 8 Apr 2025 15:29:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH REPOST] usbnet: asix: leave the carrier control to phylink
To: =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
 netdev <netdev@vger.kernel.org>
Cc: Oliver Neukum <oneukum@suse.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
 Ming Lei <ming.lei@redhat.com>, Oleksij Rempel <o.rempel@pengutronix.de>
References: <m35xjgdvih.fsf@t19.piap.pl>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <m35xjgdvih.fsf@t19.piap.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/7/25 2:08 PM, Krzysztof Hałasa wrote:
> [added Oleksij - the author of the phylink code for this driver]
> 
> ASIX AX88772B based USB 10/100 Ethernet adapter doesn't come
> up ("carrier off"), despite the built-in 100BASE-FX PHY positive link
> indication. The internal PHY is configured (using EEPROM) in fixed
> 100 Mbps full duplex mode.
> 
> The primary problem appears to be using carrier_netif_{on,off}() while,
> at the same time, delegating carrier management to phylink. Use only the
> latter and remove "manual control" in the asix driver.
> 
> I don't have any other AX88772 board here, but the problem doesn't seem
> specific to a particular board or settings - it's probably
> timing-dependent.
> 
> Signed-off-by: Krzysztof Hałasa <khalasa@piap.pl>

Does not build:

../drivers/net/usb/asix_devices.c:1396:19: error: ‘asix_status’
undeclared here (not in a function); did you mean ‘si_status’?
 1396 |         .status = asix_status,
      |                   ^~~~~~~~~~~
      |                   si_status

/P

