Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0076130A73
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751368187; cv=none; b=A6BT7RSYvJ2dcLcT9jnxq4fekTVBk60PEjxBCtKoz43Fuid217rG2YeRvDwF9CRljRD1g4gyz94uWc22KPYMKFytliZFBoHoD/2YRVDHbjXs50yW6UzT0bA88rP/0DNNcRZOhiOVauAvinZ6s/68p3auv0zHOr5TVR64fvM+cL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751368187; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=FR2rlFrgov32tUse7Ibl41/CsmsR4Fl/TQ8C4abtooLalmpteJ2rmqTCnZAcatuDha2VwDY15XZOia5VJnzOZuOBOsBZvmXBIyGaIPGRkYNQiopKc3Y2YEbxNnO3XYVYy6SdG9Y/4gPgrzX7CaHyO11VaeAzf0jKGDn/JASM0hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QIonUO9G; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QIonUO9G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751368184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=QIonUO9GJqbKpSMj960yJ7u7lWF6JSmKXU80WxnHBa1PUTZJTqbzRzXJ4ECFQIySrqVbRG
	wtMfIp0EJe1oYIaUyAbQx08/+MD8kThW62rjw2L+auPV4SOeO87G3J57PcNKqSqvoQ+HzS
	VKC4NCdpCu1FNVvg8QRR4vHaYFImZzQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-8PFFoPqVMQKjsK45jSWZFw-1; Tue, 01 Jul 2025 07:09:43 -0400
X-MC-Unique: 8PFFoPqVMQKjsK45jSWZFw-1
X-Mimecast-MFC-AGG-ID: 8PFFoPqVMQKjsK45jSWZFw_1751368183
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb4eed1914so77651496d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751368182; x=1751972982;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=d4qFGXZ+l89S1Xu+8GzbSa4nlr/SO2PH9BECx6iucgR4TM8FEmPdvRyUCBpPWoEL7O
         U5G1WGfyX1xuv+l/YMyJtjFgPmHC6Ln2EUiYkp4B+AzgJd9OklhxbIXGwh7W6lPshMll
         WLTaAOnWt4Mrd4K4taI3uCK4Cj+SDvaHvt4s+zX4rs8L6Yst3I4pjvzLI+pCiLRJ+Ayf
         ykyXF6hLGn6divW0x6vMPbEELxO2i1pLS3us9dQgzx8BEBABOfwpgGxrRnUKHafQCthN
         tfqR+eGW/LjnGwCmA+s4sbPDUq68JMV3rG9bc5iNCc57waubefHoW2jpuamEwzfWxRew
         4Pdw==
X-Gm-Message-State: AOJu0YyYI5zPHrnFRFrPEYGXmDWp0Guf5akcP5hjVX4OlBxeLJMHMAJN
	gKtbAQHIUBnRKXiaxYhYjURacI+e3Mls1FPlCBdlvB9uJzmRCfvkJ4rocMGPZP4v3WZSuFxZs1U
	40aVAjw50wVya6di15CsfkZ1XvGo8bMNfSp7fOzFtZ4G2ZFPpS6HRSIcXaVt1LAeLlI/gh/hcwl
	Ry3I2Ech2iQ5V6ZU9P56Z0nrxRrxxamjMrTZmG62j8r18FGCE=
X-Gm-Gg: ASbGncu+S7khAa/utvprA5TcU/aL9F6xVY6x6fnmOXywu117hRuiTlDuREtztwzO4g1
	AJIAa4iEr5/BjxGToXf1AkXQmwMN92gvkHgh+CbqkAKBGDLMX/03aqFs4w2bC442yftyIROhFOr
	yQo+iXJWg1sGICfEjkjb6LH2DXr/5JQoyotzsq51pS3dsSCUBCL7eKuiHATjZglVp8leX7VmDBo
	7ZbsQozHgZ4Gta7Z2tTRilQb9FFwDjCjf0Q8HsJZaRdasUJAMdapy7meUwAf3zZIIOK4u3xStQn
	WNzv1zvTAA1/Szgoo3SxFW3dgwVxhEKnYbK7aspFLocan3XENhuPOO5y2jPJ4kCM3H3z4g==
X-Received: by 2002:a05:6214:2b0c:b0:6fa:bb74:8d72 with SMTP id 6a1803df08f44-6ffed759587mr271562456d6.0.1751368182252;
        Tue, 01 Jul 2025 04:09:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHwmXfi/7hKHG19msH883lzOSK23pI+wqCzcfBmVTXHnBl25IbWVzY7wYOl/lEW+4bA1gxkA==
X-Received: by 2002:a05:6214:2b0c:b0:6fa:bb74:8d72 with SMTP id 6a1803df08f44-6ffed759587mr271562026d6.0.1751368181819;
        Tue, 01 Jul 2025 04:09:41 -0700 (PDT)
Received: from ?IPV6:2603:6000:d605:db00:2067:3372:85b3:36fe? ([2603:6000:d605:db00:2067:3372:85b3:36fe])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771ab9d6sm83228556d6.28.2025.07.01.04.09.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 04:09:41 -0700 (PDT)
Message-ID: <d9f2e0ac-1e13-4c14-bb8c-fd3715d15657@redhat.com>
Date: Tue, 1 Jul 2025 07:09:40 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-kernel <linux-kernel@vger.kernel.org>
From: Steve Dickson <steved@redhat.com>
Subject: unsubscribe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

