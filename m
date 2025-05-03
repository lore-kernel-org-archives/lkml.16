Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5053870838;
	Sat,  3 May 2025 01:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746236447; cv=none; b=R7+cVeJO6Vu0fIWO8SElI1oygpjKx9nKhdaDdNxmgSI55nWLVcHSCo9stigaLRtwJeu1kCAAQfyY684In3fXoON3GMwEEgr9xAFLfBvtYWa1GRTEOFzY5PVtYAjGKwGPsy1KIt0B4lBXBujgrgHBfYZYZuCYuWyz4n4tJrh5zeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746236447; c=relaxed/simple;
	bh=BZ5uWmICYB+v5gA/lHF4PU/sqb65jqpbLlQ0crZJyUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gHXBMZ4rrv4QOFFm8f7xbcRQ6rexVKXH2HYfMSezsEdEA3JzJIkn3sDnjL2vKTifHDJySbWzpqhfCGMXGqpqyUq/HdHKqRuyoCAmQJcjCz/org2amT2FIrfd4Uw3PH8O3sifrKrTTQxhMT595cwtu3oHexrJ1bXAHfnD23zejlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LS9xX8lg; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LS9xX8lg"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736e52948ebso3546629b3a.1;
        Fri, 02 May 2025 18:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746236444; x=1746841244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=LBhS251UOKROv2pTXhOVq1nd8d76t1B81jGQDSU09hI=;
        b=LS9xX8lglI/h7gEBmTMOmoeh80TZehfwT79sxyMuNPOE9PTGUhXBwQaQcyo+g24mry
         c489+ItD8PdXj/5phFzlJ+LIxHZeLk9XdqHv4OyFZfnKc6DzA0K5xgY3yKDZ+1w+O9/6
         9UVA2PkiBogr3mhin8RChSEcQe4KBqhg9rTsMuveEMCMHbSjzvQJZajAQW5MPlmubiUY
         tpyBMrj8rfrvq0sSjUlnO6OoZK1Kb7JS+wssrlx4bFXmLRh7Oh/bHXFtGh4gWWajk44l
         8EvfFcBy50/7VIx4E/uHtxmjzWqjuTdK89dUENg2b9ugZY0P/KCfWDzKfu6NuPVKmWx4
         JIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746236444; x=1746841244;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBhS251UOKROv2pTXhOVq1nd8d76t1B81jGQDSU09hI=;
        b=UnlclGOahhMzZOHQWmOD4uV1zKg0R+51JdPyHvLmiD1I5+sgjjQ6ztq9DHFZy9jGsT
         RM1CDlftjlRYWXp35tmXCXf1APDABQI9pT0kjs9lhSBMDpi9kagZTCXAiAaICPYIq+56
         y4I5axyEJAmgQJ9u1Iri7M2GdbGud3v0H8Kuxw8FQ9CUHHjZdGxaYC/edhaB0OpQ4OP3
         jasCJlCxJJxjBGzNcHkVvcE/FSTizgDMUYlsEF0wmpe6BScTvANa1jeGI1V3b6BYh+v7
         G8ci9Y7mJpOdMCyYdWMj/HfzchiJhgphslS8VjoqJMysXWx1vnFY2oQEfaSN2gy+5pn0
         uyGw==
X-Forwarded-Encrypted: i=1; AJvYcCXmXvnvqVzwWUa7kQlEK5pRw2Ac0L7Y6WqITWOq/GQlb9mE26wWxliX5E/EmQa/hhlRyUgC134GBHUJUQ==@vger.kernel.org, AJvYcCXoY9oDv7MCeTt4KkY3QSr8zVRVQ4kj6JwqKGWM3vDgt0ZrWsc00zekNpdYT/8pKwuIaGqNXJTFllCtY4pK@vger.kernel.org
X-Gm-Message-State: AOJu0YzwN7uBPqxvEIJNT3vNoSpUQZh011xxJ3+bWmxv4XKamTUrt3fl
	hpoKM0GCCSxJCwCld6DyKRlE9Y3LhqRTX/dRLqbsTVXpolDAw51W
X-Gm-Gg: ASbGncuWqGt0SbPmPPFDrq8rbu1EmuLRD7j09zmxrMvg6Esa4lnxYAPbhtBqKBY0+UV
	rg+enERwrpUiqSL7ZR831ka+xHD/3UBOCllqIgPohvuCZ4PN7aWfCipSwJjirXrUwr5xtIsExAi
	2HVUEgfAFmlujVoAVn9aeC/4BHd9dafFuIeOY5vrS6vgjLRlgTv0UtuGNf1eJ9iBt2MwDX9KSJ4
	kDpFYd+dstWcA/EXeGXbYRrC9C7u2oPwfetflC6yLC5vz4ta/TukRmAzMVk9ZvMBX1vkCnV6Hsk
	0onoc8OPodXW/Fp6dLstFrKqb5dFLFeA8vU2phr4sBxY/jBsvOaXi2YbZdZcNtt7FTOMAkyZozv
	NFOX6yDNOWfSBdQ==
X-Google-Smtp-Source: AGHT+IH37pyz27Y/SI1ecHviPcUVcDQnobofwsmhze6iRO6HHcRLP43p5DqkkTuF+/ZfDZS7rw+Kjg==
X-Received: by 2002:a05:6a21:7103:b0:204:4573:d854 with SMTP id adf61e73a8af0-20cde46de0amr7698691637.9.1746236444366;
        Fri, 02 May 2025 18:40:44 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbb5besm2303460b3a.43.2025.05.02.18.40.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 18:40:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f1ef9677-2650-48e3-834a-fbe9e2830b04@roeck-us.net>
Date: Fri, 2 May 2025 18:40:42 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Suspend/resume failing due to SPD5118
To: Luca Carlon <carlon.luca@gmail.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, lucas.demarchi@intel.com
References: <4e0827d4-137f-465c-8af6-41cc68ddaa8b@roeck-us.net>
 <20250503005828.6128-1-carlon.luca@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250503005828.6128-1-carlon.luca@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/2/25 17:58, Luca Carlon wrote:
>>  From the context it looks like the "sensors" command was never executed. To get
>> another data point, it would help if you could load the driver, run the "sensors"
>> command, and then try to hibernate.
> 
> Hello,
> 
> yes, I did not have the sensors command installed.
> 
> I removed SPD5118 from the blacklist and I rebooted the system. This is what the
> "sensors" command is reporting after the boot:
> 
> spd5118-i2c-1-50
> Adapter: SMBus I801 adapter at efa0
> ERROR: Can't get value of subfeature temp1_lcrit_alarm: Can't read
> ERROR: Can't get value of subfeature temp1_min_alarm: Can't read
> ERROR: Can't get value of subfeature temp1_max_alarm: Can't read
> ERROR: Can't get value of subfeature temp1_crit_alarm: Can't read
> ERROR: Can't get value of subfeature temp1_min: Can't read
> ERROR: Can't get value of subfeature temp1_max: Can't read
> ERROR: Can't get value of subfeature temp1_lcrit: Can't read
> ERROR: Can't get value of subfeature temp1_crit: Can't read
> temp1:            N/A  (low  =  +0.0°C, high =  +0.0°C)
>                         (crit low =  +0.0°C, crit =  +0.0°C)
> 
> [...]
> 
> spd5118-i2c-1-51
> Adapter: SMBus I801 adapter at efa0
> ERROR: Can't get value of subfeature temp1_lcrit_alarm: Can't read
> ERROR: Can't get value of subfeature temp1_min_alarm: Can't read
> ERROR: Can't get value of subfeature temp1_max_alarm: Can't read
> ERROR: Can't get value of subfeature temp1_crit_alarm: Can't read
> ERROR: Can't get value of subfeature temp1_min: Can't read
> ERROR: Can't get value of subfeature temp1_max: Can't read
> ERROR: Can't get value of subfeature temp1_lcrit: Can't read
> ERROR: Can't get value of subfeature temp1_crit: Can't read
> temp1:            N/A  (low  =  +0.0°C, high =  +0.0°C)
>                         (crit low =  +0.0°C, crit =  +0.0°C)
> 

That means there is a problem with the I2C controller, and you'll have to
black-list the driver. I don't have a better solution, sorry.

Guenter

> I then tried to hibernate. Hibernation failed and the output of the "sensors"
> command did not change.
> 
> I also tried to rmmod spd5118 and modprobe it. The output of the sensors
> command does not show spd5118 anymore.
> 
> Hope I did what you asked properly.
> Thanks for your answer.
> 
> Luca Carlon

