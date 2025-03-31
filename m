Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F698635B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 18:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743446954; cv=none; b=IX+vzR5Z+Wm0Ug9RXAXc4htox1s3PGNAqlDmKGfyxbR/ErtPgJ6i7OLFTrFJajnYIWTG9cMeEgiLOLPNFTWhzRblnv3CTEP6TVPk7K/cgU2BhdyWv0obrHIrO+rm22C4zXnmexIyNEvtOg4p9ICJtgEz5NNvpOeuBXmkJegDlP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743446954; c=relaxed/simple;
	bh=fP5nJMhdUikXpEYDfwduvae1UDi/nvJhhgFt6V/JW4s=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZZTNgLfO/LGUxsbba90mh8XlDgOW/ED0UB0ZDH+GTpbkaUFogWtiKLU9FITKyKMjbVmKiWI4FtEgoWEn17wPOE1lVSsoY9saS2uLJKO9gSdnEqRgDouaKfbxrR92FynLQaXLewtQ121yJtpfkrko2DigjIypC/+L06poxDg+L84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info; spf=pass smtp.mailfrom=jacekk.info; dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b=GDiT5x+V; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jacekk.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b="GDiT5x+V"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ab771575040so1146165566b.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 11:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jacekk.info; s=g2024; t=1743446950; x=1744051750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kl0dov9VrLyOk8gwNhMGQPqf9rUFgQMxrLRugxXZN4M=;
        b=GDiT5x+V0eaznkxsk11JWb5hvVCR+4wtazofhPe13TFg6z8MzAq+L4UAi9IGLmFZW2
         TQcFxRVF3DZJa2uZLMhmdkrkrOmMBDKTIK77vxgV09+8tHwRAWMgMacytkiOs4QiZCgU
         g6YAg/49u7KiBzYos00jh3p4Dlgg4HXqM4PoVlBvPk0GY5TIHeYqcK2DekHnLBvL+P7b
         Nbd7l8ujErxt8NXASyG59u6vlWXfTOQfpqdXfT7hGYULaWm8+43TpNhAaTFR9NyarpT6
         XlWM27zImqfyGa0kFJq/FaZ80DWd85a02kDMZFVBwuEOvOKWCQrgbiVYdVshm7Cn1j1r
         bEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743446950; x=1744051750;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kl0dov9VrLyOk8gwNhMGQPqf9rUFgQMxrLRugxXZN4M=;
        b=PM4FLs26BTKkSHVgNrXW2V9OZ1/SFe48NcEK4/1izeAHSyRCPmwqHJcaBS2bmgAv8u
         hkWPC3doKYzd2vVuNbHlYbHny7yQCCmwRuhQDE1qDrvsSCnHHMN+0VxeFiIkuXtesdQL
         j6ZYlbA0W30iMNSvxdJnnIBxhdUckzOM1NbewZR4gl6ek4GknvIePqfdIqgWVEKM/8eV
         iIsKonYaTtHN6+XJhywhkrxYuHqxliL56R4NM7DrMmr6GTUiXU38KMXQ9SlQtqy6hZtg
         XrjldHTTxfn+8LFyPtkT5et1Np1FVhzS5kxmKjfoTNUDOtuvVm9ITgfOw9QRW0/L4RUz
         snfg==
X-Forwarded-Encrypted: i=1; AJvYcCWcNUQt0ploJliiI1BEqOjlB9XPwsNKzkQQJdCCxmHV3k8KZ7iyTKoxmKhQlPpa9B7UYhKQSiKEAUX3KaI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrdSqj1EsDjgKhj0S3ug6vYIFBf1iJEs/rWy9VTGQ9ypmbXuvH
	s1hJI8tdNB2SHG1REXhPYfBRdi+CsBcgRqX6APzsh2DmC6KwFF/aTL62AJTOEA==
X-Gm-Gg: ASbGncsiZ3Psll7I9GPQWvEl9+M9GaBz8O1sgqW1dUCzKO9wDtP7rayNgvTl3PyXHUB
	C/utIyqSoDem+zoAQPwsZKWbKTfPqEmXmwtqTrU3TWMj+CWBYXBj/Rqh9efxCSQLCsaDkhVp4v4
	H43PHLOx8dQ38OG3NgDkVgsxs2tip2SU4fRcGVnN2TmpPVC9CDhYe8BqN0if5uQg+I3IevweCpg
	1Maz1QjTMM7g7H3YwEYH54dkoOYdEIvMzoypITXf6kXaPX+i1VvyavOcOP7dkLRUQPU2yVZ6QhY
	kjiCpenA8rg8rk4Flk0By+HyrrApyE3fflU9SMoDZoDEspDHfwU7PtYe8h6R9r63GNFyABGisEr
	rl+PwHA==
X-Google-Smtp-Source: AGHT+IFeXyOVxpJBuKLqwlWNeeKwHSVbkp2ZEQUHlSwJKNVeuE2vj2Ime+ulaGAN6UWBY/kDRbu4Vw==
X-Received: by 2002:a17:907:971d:b0:ac7:7c45:e9ab with SMTP id a640c23a62f3a-ac77c45f89emr132662966b.16.1743446950276;
        Mon, 31 Mar 2025 11:49:10 -0700 (PDT)
Received: from ?IPV6:2a0a:2300:1:1fe:e2e5:1eb0:886e:bbbf? ([2a0a:2300:1:1fe:e2e5:1eb0:886e:bbbf])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7196ddfebsm650656166b.164.2025.03.31.11.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 11:49:09 -0700 (PDT)
From: Jacek Kowalski <jacek@jacekk.info>
X-Google-Original-From: Jacek Kowalski <Jacek@jacekk.info>
Message-ID: <45b7a842-02d2-4b9d-851f-022ce2b9e694@jacekk.info>
Date: Mon, 31 Mar 2025 20:49:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-wired-lan] [PATCH] e1000e: add option not to verify NVM
 checksum
To: Andrew Lunn <andrew@lunn.ch>, "Lifshits, Vitaly"
 <vitaly.lifshits@intel.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <c0435964-44ad-4b03-b246-6db909e419df@jacekk.info>
 <9ad46cc5-0d49-8f51-52ff-05eb7691ef61@intel.com>
 <978d1158-c419-4a59-b0dd-ad5be9869991@lunn.ch>
Content-Language: en-US, pl
In-Reply-To: <978d1158-c419-4a59-b0dd-ad5be9869991@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> From a technical perspective, your patch looks correct. However, if the
>> checksum validation is skipped, there is no way to distinguish between the
>> simple checksum error described above, and actual NVM corruption, which may
>> result in loss of functionality and undefined behavior. This means, that if
>> there is any functional issue with the network adapter on a given system,
>> while checksum validation was suspended by the user, we will not be able to
>> offer support
> 
> We handle this by adding quirks. We know which vendors/products have
> FUBAR checksums, and allow them to be used when the checksum is
> FUBAR. You could do something similar here, add a list of vendors with
> known FUBAR checksums and allow them to be used, but taint the kernel,
> and print a warming that the device is unsupported because the vendor
> messed up the CRC.

Unfortunately at the device level I don't know what is the motherboard 
manufacturer and model to be able to determine whether I have the 
checksum messed up.

I could peek up MAC address in NVM, but even then there is no reliable 
way to know which ranges of MAC addresses are indeed affected.

-- 
Best regards,
   Jacek Kowalski

