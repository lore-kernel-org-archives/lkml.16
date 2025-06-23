Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E952989BF
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750695495; cv=none; b=s+1JMIrBpChdVfd2sUbptwDafWKTpmieHfiYNXyIl4e+nZ6CNgypOfN6IgYc+wGt3WvYuQIihhV9eQv6snw49mKU8K8jCAxozPfBCFSiHPFLrJR8arHWHrE/zDjpURsrHj2GS55LEzbTmL3RAhC/PiGdXICNZweuZE9QUprocQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750695495; c=relaxed/simple;
	bh=xOMzG1FX23M3d31kPYpV8HaBnyVBn7S3wyyV5oXXlCc=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=k93/u7aaYyMDLq9aZQdCS8Ji7VZbwlS2cmTyucdYcLEaUHvosonyfGOL84CVlyony3nzR9BnNU7rcr3tqjeRWiWgNWgyt0IamcVfDhtpI3zkL8FAL7lns0z/XBKijMw0ZD+e32zaoyGqhQpyd3MLMoVJNYkT6U7hCwAEvAHOToU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info; spf=pass smtp.mailfrom=jacekk.info; dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b=ngdv2pGr; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jacekk.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b="ngdv2pGr"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-adb2e9fd208so901967466b.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jacekk.info; s=g2024; t=1750695492; x=1751300292; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=08GIWol905Tz9t1Y5KR/Px/0Bj/EghmvZQXSpfLZ3xo=;
        b=ngdv2pGrB8cTttQJIM6zP5bclIG3e+4z/WrmyJaL8sOru4Byd31dZYi6WJV5iiECSE
         10ffemdd55gvB2Db8lk10NtSKNUz6KoKgXAi6ugjpjRlyKgFJao+Y0qnrZqZ0nXnOJLu
         YX/Edm5+C4hwP1V20M/KE+E+Jm0UKHqa3D4hnWT6zaMIMECo1kJT8InHsTFRheK8ZvGN
         gYKcWIY4lCWbAKKS4DY3KjpjwT7C4s6En/1aGg4bJkxh5QpjCR1yc4m8cx/QU4JtjeTs
         umm8rIgAPOVzp06UBBBONjOb67cgu5W1ani1oN7oRfBfbYTYnV9Rx9vTbf7ujHTmQYVT
         sVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750695492; x=1751300292;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=08GIWol905Tz9t1Y5KR/Px/0Bj/EghmvZQXSpfLZ3xo=;
        b=uLRm0Ro0YglritJJ+kb8F8MH3Y/hCc9AMIE7o09SizkKht3a73c2un0f5YSUT8wdgj
         ApKJvoRIlYpxZWQ4zniuAn+DGqx2tMdaUGZQx9kbrV6htZZSASR7pS6fBEpfvHaWip2B
         aBNyxzr1+iWzDAVUqXyeYwc6iuxAUSIAXHHBvEMhu4EH0H/0HwJMVfvXN8sGgNn7Wl4A
         +PVQbY+SwJgfcBRN1SRwXtzRJLiDzpk3UNECQjF6w7BKE82rV9pS7zcqbjn8yY6ECtX8
         fnKv2Mba7i6d1JjdnnVUZVC7sPvMXFX0gaKehWSe42wFpTuV6wu8w2GKizwbreHfAlmZ
         VPHg==
X-Forwarded-Encrypted: i=1; AJvYcCUxc3RZIlfqBcIJiRZmOlTxENyJZL92Z5+ynQh7QjB8fFwAwVV9rBZMr56ETDNpIOkHkKPK0zYAcmjTZYA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl7Ntig1JE+gneyaBTNScC3V86hRZSOnn5fTwJ1BQV5qyxyjMr
	NGZUq39yscF1UVTENH5Qyi1BIp0ZiulzSrjSXyHQ0+Q6muR9fmiE68RS2GxfzMy75w==
X-Gm-Gg: ASbGnct9My8NTZEU2KwFrcxCZKzJ9SlT9l/E749ZEH7Jxr45O9YWZ24zq46GiJ9fAr/
	+u2VHnFLSj0ZqPpJvNiOWV/UhaCJz70J7CC4lpPYIaNFN0f3grpatoSlBG55TaZL+m9WlSYRb2i
	cjr8RducqpiT3ied5+6WP4S1OfdcVr/Ex3M3RnDZ7LHwNughFNJWW4XNMsXQuEbEBtfE11HzCge
	VLU4VTh39e69AwMrGOUI8SfWciN3f6K5aM3kjrsjVCtl0kocHDDO4a6EI5XH1Gg7euTDLsaL2gM
	JjhiWAcctUtgKbTDSQEmBa3gvtb65BPWvRFE64cCMNo0eJKhJWxcVL+Ztvz3frjo
X-Google-Smtp-Source: AGHT+IGKSt1ZPvM2yYVioJCPzIyELNHZzrEHQ6g9+s79wuGsECQkKe80vWV6dvdNE+yByyUw8mwsHg==
X-Received: by 2002:a17:907:7250:b0:ad8:8e56:3c5c with SMTP id a640c23a62f3a-ae0578f3e81mr1200596566b.11.1750695491746;
        Mon, 23 Jun 2025 09:18:11 -0700 (PDT)
Received: from [192.168.0.114] ([91.196.212.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209ad2sm741886666b.148.2025.06.23.09.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 09:18:11 -0700 (PDT)
From: Jacek Kowalski <jacek@jacekk.info>
X-Google-Original-From: Jacek Kowalski <Jacek@jacekk.info>
Message-ID: <8538df94-8ce3-422d-a360-dd917c7e153a@jacekk.info>
Date: Mon, 23 Jun 2025 18:18:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] e1000e: ignore factory-default checksum value on
 TGP platform
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Vlad URSU <vlad@ursu.me>
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <fe064a2c-31d6-4671-ba30-198d121782d0@jacekk.info>
 <b7856437-2c74-4e01-affa-3bbc57ce6c51@jacekk.info>
Content-Language: en-US
In-Reply-To: <b7856437-2c74-4e01-affa-3bbc57ce6c51@jacekk.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Vlad,

could you verify that the following patch works for you?

> diff --git a/drivers/net/ethernet/intel/e1000e/defines.h b/drivers/net/ethernet/intel/e1000e/defines.h
> index 8294a7c4f122..01696eb8dace 100644
> --- a/drivers/net/ethernet/intel/e1000e/defines.h
> +++ b/drivers/net/ethernet/intel/e1000e/defines.h
> @@ -637,6 +637,7 @@
>  
>  /* For checksumming, the sum of all words in the NVM should equal 0xBABA. */
>  #define NVM_SUM                    0xBABA
> +#define NVM_SUM_FACTORY_DEFAULT    0xFFFF
>  
>  /* PBA (printed board assembly) number words */
>  #define NVM_PBA_OFFSET_0           8
> diff --git a/drivers/net/ethernet/intel/e1000e/nvm.c b/drivers/net/ethernet/intel/e1000e/nvm.c
> index e609f4df86f4..37cbf9236d84 100644
> --- a/drivers/net/ethernet/intel/e1000e/nvm.c
> +++ b/drivers/net/ethernet/intel/e1000e/nvm.c
> @@ -558,6 +558,11 @@ s32 e1000e_validate_nvm_checksum_generic(struct e1000_hw *hw)
>  		checksum += nvm_data;
>  	}
>  
> +	if (hw->mac.type == e1000_pch_tgp && checksum == (u16)NVM_SUM_FACTORY_DEFAULT) {
> +		e_dbg("Factory-default NVM Checksum on TGP platform - ignoring\n");
> +		return 0;
> +	}
> +
>  	if (checksum != (u16)NVM_SUM) {
>  		e_dbg("NVM Checksum Invalid\n");
>  		return -E1000_ERR_NVM;

-- 
Best regards,
  Jacek Kowalski
