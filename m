Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FD92566E2
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 21:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750799110; cv=none; b=vANHXoqvJR1QOh4rgMmtKiqvN1mcPBZNDX3Pn8wEset61Hc5EiiiBndJ+XcN67eoxEQQxAxFkO58m7FdERHgxe+mY9DiEWHZtngSZS4r2sdwcS35el+WDliezfRCgQM0NzH0Lpow79H07LGS209rvCqI5itLjSyrX6HlO78Oq0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750799110; c=relaxed/simple;
	bh=wSUK76HyaArC+FP01RvNk9Ak3Y1YRTgr44GodZEKyKM=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dLPqzYEE4BVS3HPyClirsEz+UzmM01Jbwai9qucv+rQDYJaF8TBdth7sZBLH9xv9z+AIR6S6+A/u0M+Q9+PcJL6eKEsIxEMvQNTzJN8BVTPpH5GbK+F5oiORFbe2WTXdoeGzPc3z/Eb2tuu/iVNtTNlAZdDaS7dtGlSANcSB+jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info; spf=pass smtp.mailfrom=jacekk.info; dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b=tPtbX5Bx; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jacekk.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b="tPtbX5Bx"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad891bb0957so157679566b.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jacekk.info; s=g2024; t=1750799107; x=1751403907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H2zUMtRrxbBSd6ymsb7+7OBAUA/OnzJhM/jzHwFjMYE=;
        b=tPtbX5BxEc7T8lapBrGwb78DQQIglTMU1ixDm+bgiV35JKbkWkNBoSnWQM0u9C2IEW
         ml2/Mnme8g+7ac/bDUpnZ3FensBNWk9rqZZxtYmMfFm80D39ALSksbe5lrViZYsD3m8W
         NEfef7kDWBD0uPVrQ8vR6gWH+wV/GMSH5Jaf1BXF1nL1kl9lzfeaIOP5sjjjXN9SFJv1
         iUjhJbu3wRs3W4ypZG9/5szTBreIDLwpWuYbAtegcRJo6VLtoFVTzZADt4Ekt/k/pNIg
         z/x3cG4wE9lbfD9F4IuWXU4Yc/FFfDBMg2sakG8e8a+vr4y/52UIxSQ2mO26CtFFcbW0
         UdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750799107; x=1751403907;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H2zUMtRrxbBSd6ymsb7+7OBAUA/OnzJhM/jzHwFjMYE=;
        b=Ukh2/qop01qLFp8ypRQktbHYszZEjBmr03EOHg3U0266QDAkVug87QudvhUOZHm8dV
         Nn9CYYpeeRmPgdsQ8pW+Lv/wnafRHkkYgqlkDZhSz91esFDfVkROPCMVtdLhGgorZtDg
         ClMIYe1DT1iB9c5Sd61njCQv9Mw1ki+kqtggG/YmRqhrfA8hoN7ajAvxc/EVkLZdu+Ui
         NrTR4VwU+DmE3PJLBaMiV7Gx745OCg6zhIdGYHVDmX/Wr8B1hzVm2ngZDyRKQvvVPt6L
         xAxr96lBhrTtQ7e1J0JIRjIJWakqmClu8ilUKj4yXzaEct95r4oISU+u5iLkGefl5gQQ
         /9+Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1Zw85Sm5eILf/9dtaHqb/5CyaRHH/FrmAH2kHaFi3gSTqdKZ9uobKhC2IODvXNb1eL+Yyz6gYUGEbdJY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yygk/68GasXPxADE5zOQ9/4wi/X114UyQkD/wuCzKaFfCrqYJFG
	3XYN0QO+cd1dpJ70fJ+OPiXCLs922psb1ps9G/A7Y+Yq0lcWwTxo4dD5Ug5f6kzsZA==
X-Gm-Gg: ASbGncuZRa6DsmHpVM/VowfbHOaK0DYTD6JwuFdQBcdn+2iKZPr47JsBkgswo2M8muN
	03X6/kUJ/n2EE07ziI1MOraVl4mvcJlzC+1yWXfi/jmkZAidUhUAHhLUU7dzSci4qoq0kjg+9Ym
	tsye7pTSLBiIaQEynS04XaU1RMxG+g6smFVDRmxESCNjyjbcL0va31uhTCmco+TSqBaccYHvnwV
	RimoS4j+ARFYUBgnDXqzGM+qSHidlEyFIS+LsMZp9UPwZWP6qkQtJHJxWM4zGpqfHCHC1UrywlL
	/k9Qtil9717Qej3wp+drAdoJwVAFWaDLVXXUa2dYR1xjQETebB6/5gVekxN2CsIq3/FYnI4=
X-Google-Smtp-Source: AGHT+IEIZRicbupUDozkVt9UuIKeF94jzcW78MZ2mImR1D+dg4nHqW/ZW+k7y9I1SRWPwxvy6g8L5w==
X-Received: by 2002:a17:906:4fc5:b0:ad8:85df:865b with SMTP id a640c23a62f3a-ae0bee4f81bmr53130366b.33.1750799106807;
        Tue, 24 Jun 2025 14:05:06 -0700 (PDT)
Received: from [10.2.1.100] ([194.53.194.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541bbdf3sm940960666b.137.2025.06.24.14.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 14:05:06 -0700 (PDT)
From: Jacek Kowalski <jacek@jacekk.info>
X-Google-Original-From: Jacek Kowalski <Jacek@jacekk.info>
Message-ID: <0407b67d-e63f-4a85-b3b4-1563335607dc@jacekk.info>
Date: Tue, 24 Jun 2025 23:05:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] e1000e: ignore factory-default checksum value on
 TGP platform
To: Simon Horman <horms@kernel.org>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vlad URSU <vlad@ursu.me>
References: <91030e0c-f55b-4b50-8265-2341dd515198@jacekk.info>
 <5c75ef9b-12f5-4923-aef8-01d6c998f0af@jacekk.info>
 <20250624194237.GI1562@horms.kernel.org>
Content-Language: en-US
In-Reply-To: <20250624194237.GI1562@horms.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> Unfortunately some systems have left the factory with an empty
>> checksum. NVM is not modifiable on this platform, hence ignore
>> checksum 0xFFFF on Tiger Lake systems to work around this.
> 
> I think that you need to update the patch description. As of v3 it's
> the last word of the checksum that is being checked, not the entire
> checksum.

As I understood it, "sum" is the resulting value while "checksum" is the
value appended so that the "sum" is equal to some constant.

But my understanding is utterly broken by this line:

>> if (checksum != (u16)NVM_SUM) {

Where variable checksum (shall it be "sum"?) that includes
"checksum" (or maybe checksum word?) from the *checksum* register 
address (NVM_CHECKSUM_REG) is compared to a constant called "NVM_SUM".


Is something like this fine by you:

> Unfortunately some systems have left the factory with an unmodified
> value of 0xFFFF at register address 0x3F (checksum word location).
> So on Tiger Lake platform we ignore the computed checksum when such
> condition is encountered.

?


>> +#define NVM_CHECKSUM_FACTORY_DEFAULT 0xFFFF
> 
> Perhaps it is too long, but I liked Vlad's suggestion of naming this
> NVM_CHECKSUM_WORD_FACTORY_DEFAULT.

I can update it as well once we agree on the wording.


>> +	if (hw->mac.type == e1000_pch_tgp && nvm_data == NVM_CHECKSUM_FACTORY_DEFAULT) {
> 
> Please wrap the line above so it is 80 columns wide or less.

Wilco.

-- 
Best regards,
   Jacek Kowalski
