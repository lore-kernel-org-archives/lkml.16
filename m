Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7006A502BE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 17:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745515773; cv=none; b=AgULnBpOotCXrRznRjtDhighbWn0V0ZMUo8NPuTuSH3tAklCTNfBj4rfv2H3J/ubzTNNKcJwrOmcT/4UyxwGXYWKWIRqEhs6c2cbtZ7suwQC79BIeePEuob3/7EJyn9bhZ58HDort0srXTULGL8/g24fowObHg7sEruO4BBOnaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745515773; c=relaxed/simple;
	bh=zDw7BMwmQ7Zzhu3em6h7WuB+uJk8Ll8pW5o+G0j0JPw=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YG3NsooDe9LPESiHnbfXs+0f2OrgGR/hJeQv0/KN32GL/ceo9DFp66kPVTxXJX/ZAMFLyfWqK44lAdiPjoc7l4ki7ilHfsr6JHT7hEn27RR7TdBWioO0QtmXstqWA/bcYfTtuyqP/Z4Y3VlnpdjX8te8cZ/8Oa6aMLGwG0jT7PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info; spf=pass smtp.mailfrom=jacekk.info; dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b=sl8qK1og; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jacekk.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b="sl8qK1og"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso2438352a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jacekk.info; s=g2024; t=1745515770; x=1746120570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JLHhBvGwHoD14XYoD4WUPVU9+Bb1BKcDzuKit79fgsI=;
        b=sl8qK1ogUFiW0mh44xZ/byXLtlKD8jF7YnW6TxN9yYdK+oIVfj8CMBGuv1c6S/kv2J
         E7ahCstLKU4EhFw2AuSSRofJ9PwLCOcz0X82W7loZTXSr8BPFvCOdafiR8n+a3OXEgTM
         HxqTSoamY8Z8Pb8h/toZh9V7Pbk4yKgNxYSdycN1fkbT2cxHEwUY9UHdUuEofwylNjZ+
         czVHmpS8o7qjpbyExSqKVNV1MFXuSDKllNwdmsxPym1tCn/O75aqsTG4vcnOdhUtMivH
         TThXNbDb7j9pUUEKtvuX5qiaBQM+FAVKHFTJugLaP0YStsoOYvjfXUfMbeSNKDjWeg0j
         98aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745515770; x=1746120570;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JLHhBvGwHoD14XYoD4WUPVU9+Bb1BKcDzuKit79fgsI=;
        b=oqOOBZZWak+2+m3DX/nQTpAwNwQW12x5GQ0hF0nLaADxlQTQjjdQ67Pw5o94112mrl
         /SbkWdZfOc7eWvCyQiSaC94I2Gg1pPuof/vnzkp0AwSGNx78ftyMacTAzs8yHv+5uK4F
         F0CAGKY/J5vlEdCEKakytKrIIiJzPYboNG7fWXKBZig3rhZ1hsmuUTGrLnov7S63/aqd
         Y48tqO3I+OzX/Hhp9F7hv5rLDXoYAZf1DwZegA5xiGIcKxaqJL4GtR2DxyyDZKB7a/z3
         WHN6vCpbJo+85Uq+x1VwAmt1/lZvFmxBfg6KpIW2kPasQirtKakTBmpod/INU6idzZSm
         4Pzw==
X-Forwarded-Encrypted: i=1; AJvYcCVlc5B00UUD2HHtNcs+7/+hDgsu9i6fkfaMHRhzPUVa/uVAVaV3ySZLfzlI50OdXOMTJIJxbPvr3HqimMs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9nY/4sAaU2GNYq8jHeoSXfP8hltJTcM+JQeUaaz4Ch3RO9yRv
	7dEI+gibOLVpENng5KHvZHNUB02FxKsQOrzhSCGRmRmJO4TQKsAn7895UJwpeA==
X-Gm-Gg: ASbGncumx+0CYp54d1ObEVtmV4KrJl7Xbg+Je/77idGi25kR1kmk0kK0NtnfZLH5/BV
	EBBxcSj0UfOkbt6TSCnnrq4RNZZdAgp9ZoRlxW0Duns4LKB4b5P0G5uR88HqR1DF3kWRhwtuUtO
	mlOrrdHMqw+KQaZvPid7Kj7q1400hugb2/Vm7O6PAYKgVn8uKXudBQo3ZI4zPTthSFutdS1TWRW
	JcV9wofWKmcprNGISTu5gNBzCNIqN8GvuhlKOtBygw5FdaUFieXx98f7Tt4vKAxWsxWvVa/SmX0
	fWtEDDGX6NPLHVHnADLXqgJXw2iU9tvMnx1OHGY=
X-Google-Smtp-Source: AGHT+IE2ovPWtaSR1CwyZflNLkJWQlZGCejIdOULuu/FjYId4ZaicaBupsaFG9P4tzlR01R9OMB2kQ==
X-Received: by 2002:a05:6402:845:b0:5f3:4194:187 with SMTP id 4fb4d7f45d1cf-5f6de6980d6mr3197899a12.18.1745515769548;
        Thu, 24 Apr 2025 10:29:29 -0700 (PDT)
Received: from [10.2.1.132] ([194.53.194.238])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f6eb32368bsm1383533a12.10.2025.04.24.10.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 10:29:29 -0700 (PDT)
From: Jacek Kowalski <jacek@jacekk.info>
X-Google-Original-From: Jacek Kowalski <Jacek@jacekk.info>
Message-ID: <e6899d87-9ec4-42aa-9952-11653bc27092@jacekk.info>
Date: Thu, 24 Apr 2025 19:29:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-wired-lan] [PATCH] e1000e: disregard NVM checksum on tgp
 when valid checksum mask is not set
To: "Lifshits, Vitaly" <vitaly.lifshits@intel.com>,
 Simon Horman <horms@kernel.org>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <5555d3bd-44f6-45c1-9413-c29fe28e79eb@jacekk.info>
 <20250424162444.GH3042781@horms.kernel.org>
 <879abd6b-d44b-5a3d-0df6-9de8d0b472a3@intel.com>
Content-Language: en-US
In-Reply-To: <879abd6b-d44b-5a3d-0df6-9de8d0b472a3@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

>>> Because it is impossible to determine whether the NVM write would finish
>>> correctly or hang (see https://bugzilla.kernel.org/show_bug.cgi?id=213667)
>>> it makes sense to skip the validation completely under these conditions.

> It is not completely accurate. All the NVMs starting from Tiger Lake are locked for writes, so NVM writes will always result in a failure.

Check my message in a thread of an earlier patch:

Message-ID: <1c4b00b6-f6e3-4b04-a129-24452df60903@jacekk.info>
https://lists.osuosl.org/pipermail/intel-wired-lan/Week-of-Mon-20250407/047551.html

On my laptop NVM write operation *does not fail* (nor hangs), driver loads and ethtool shows corrected checksum.

This lasts only until module reload (rmmod/insmod) or reboot.

I guess only shadow RAM is updated (or something like that) and not the non-volatile memory, but the operation itself does not error out.

It might also be because I've disabled Secure Boot...

-- 
Best regards,
   Jacek Kowalski

