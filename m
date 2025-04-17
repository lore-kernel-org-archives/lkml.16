Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26DF233144
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744886896; cv=none; b=GRgeFshGtmObD31a8bYx9hi5EfxmmNYhw142eEXM6q4MyHLfgYWzkixL0URnRtzDp8jz1p846tMBr0q7cmHZ6BGyu/QK89vY/76vT8va4te1gDbL/Ecb2+Yc5ZaeTA8rrbITcv47KBaGi7EX0jYNSLo5KTYlhbbJUDS/CrExTyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744886896; c=relaxed/simple;
	bh=XhGacwTcE6A+IWJQpQyCMN16TVH3Z6owtk1R8JSA4+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bsu+djcN4J2aPQg0n6H+EqbVhYqSgi28j0rzIytR6yLE9BM6bs/n9EhqbN3THPxEnVx9EvmmHRZR3thl1jVXcP9iiZL3K/Yzsu6FQmnBL7I0DdUwuXrw9MNtaji3tI22JwB5esehA5lnnMGHOj7u66H1m1foJv16RtA6/KVerO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CYj/IJ4R; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CYj/IJ4R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744886893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OudEsC2htuXU3a1BRgDOXrN8cqmum79c1G5XjX0b0Ts=;
	b=CYj/IJ4RRldEBDBj1ag7dWJmTek3U/cRZlHlufqdrMALS1eHyQnNNvuFvVfrRX26Zo3DWY
	r0etfLnaxRq+pV8mDDyXMJINocfR006S+Zuki1ietbPTpampz201MIXfC2kfTjG+0+TUG8
	Ozmk8oPjZ32B+HZhfwb6KamXaN4/caU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-VM7mjO3HPESTRBWyATi48A-1; Thu, 17 Apr 2025 06:48:11 -0400
X-MC-Unique: VM7mjO3HPESTRBWyATi48A-1
X-Mimecast-MFC-AGG-ID: VM7mjO3HPESTRBWyATi48A_1744886891
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6ece036a581so12502736d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 03:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744886891; x=1745491691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OudEsC2htuXU3a1BRgDOXrN8cqmum79c1G5XjX0b0Ts=;
        b=YomcAflA1Wr18UJbSNLC2N6kG7cDjXbTtvB/HHlrYpaDamSVyCRqXEdDgnpzeXRs+t
         4di4eOxq92SClrzYhcajV0GOVeHQJGNUNr+aeTGyviWn5Vdu79GCM44kiEDVRNk+t+hw
         0/L+0wJNNGF+T1YOiEki46vVlsauHOta7mQ8Hnz8pTzRZqXEvXXrnMjJWd/g3JVPQYE3
         ApQXYbxAgr7qfGFUe9xK8CdPDuBWfAXKD2ihbK0as2sN/hXRB9hrien/pS+sK59TAs40
         jAfM7EXGIJ/dLx+vbb8Mr2tSqZ/jmLZ6PksgRqBvhnPlZoLr4VcobsxhDD2hUlXyNaKB
         4l7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlQi3PCtoDh/Huy4CSXOaCiImRKoAstNEzQq7kxl+C828fO47zxGLoWAsAd51l8jk4eCSK87lZ2PYVD9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjoSK6yimBAgBcyToIbp10aMcpfQ625OV4lWezJiqJXLcL8Ce1
	H3nOn9a5gqMiPf9eR20DN9SwMuQMDUDfyekF71TgvVpSTPoue2MnlIoDcke+MxWJ4kRsogKIL8i
	Or2QVeGHH+gBVOMCDvFu6CFoTKt+yWhXERuAFjwOfNJB5hbIblIdGbb1myQyZRA==
X-Gm-Gg: ASbGncs9bm6qxmsNzi+6Cn0p/9Gl0ibD7LjaiTu3IyubJZeoJDmj4Byv5nxe8r1rokj
	gI4KMEZd+PZaN6adnTTgb0QMdcysQZ+dIUNDJOypxVnFblzxv7AOMv+tJOWAAYKBoLwtfU3gHNh
	xL5tPi69iK0vQmFsnVPPKwDHahQsvw+g+hdm4GKASn5lQEIVeDIfXaViqslFL+yJbW32USwaH4W
	QuzCQFcUE/jSOhy2jJXH1zoJdFxtSJRWGV75yI6iz5EyCkkabishImzqcydVo7ZE/eLmONduOtw
	Ho78gtInMrNCn00KwsMJI6oEbOlEjYC9w9IWGwXVAg==
X-Received: by 2002:a05:6214:3008:b0:6e8:fa72:be49 with SMTP id 6a1803df08f44-6f2b2f421b9mr65124536d6.12.1744886891276;
        Thu, 17 Apr 2025 03:48:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRD2S2lNf87+n5j2F4wP6+GtOIfe7KgdYGkxqrRR5TEwTDQjpW1zM73oytFXas9ITp16LLpQ==
X-Received: by 2002:a05:6214:3008:b0:6e8:fa72:be49 with SMTP id 6a1803df08f44-6f2b2f421b9mr65124216d6.12.1744886890999;
        Thu, 17 Apr 2025 03:48:10 -0700 (PDT)
Received: from [192.168.88.253] (146-241-55-253.dyn.eolo.it. [146.241.55.253])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0de982274sm125717616d6.64.2025.04.17.03.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 03:48:10 -0700 (PDT)
Message-ID: <8bfc6c5f-4bfc-4df4-ac52-b96d902a9d7f@redhat.com>
Date: Thu, 17 Apr 2025 12:48:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v26 00/23] Introducing OpenVPN Data Channel
 Offload
To: Antonio Quartulli <antonio@openvpn.net>, netdev@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Shuah Khan <shuah@kernel.org>,
 sd@queasysnail.net, ryazanov.s.a@gmail.com,
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Xiao Liang <shaw.leon@gmail.com>,
 steffen.klassert@secunet.com, antony.antony@secunet.com,
 willemdebruijn.kernel@gmail.com, David Ahern <dsahern@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Shuah Khan <skhan@linuxfoundation.org>
References: <20250415-b4-ovpn-v26-0-577f6097b964@openvpn.net>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250415-b4-ovpn-v26-0-577f6097b964@openvpn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/15/25 1:17 PM, Antonio Quartulli wrote:
> Notable changes since v25:
> * removed netdev notifier (was only used for our own devices)
> * added .dellink implementation to address what was previously
>   done in notifier
> * removed .ndo_open and moved netif_carrier_off() call to .ndo_init
> * fixed author in MODULE_AUTHOR()
> * properly indented checks in ovpn.yaml
> * switched from TSTATS to DSTATS
> * removed obsolete comment in ovpn_socket_new()
> * removed unrelated hunk in ovpn_socket_new()
> 
> The latest code can also be found at:
> 
> https://github.com/OpenVPN/ovpn-net-next

I think it's finally time to merge this. Thanks Anotonio for your
patience and persistence and thank you Sabrina for the huge review effort.

/P

