Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261891FAC50;
	Tue,  4 Feb 2025 01:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738631931; cv=none; b=G6mL6BArqKTWd043JegMPRyOf0cXASZZod1SIP5wmRcrau3U04Tl98fpMTQ4EDkas8YTF6LQe4lVExkEhBBusEwWcNwfkP0RWEkZRD924TCr4JdpwHjACEuzjOsyVGlDSyGAG2YmQFYsSVMXvq2qveijogEpUYGylZ2rIq6Nnhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738631931; c=relaxed/simple;
	bh=5zJsols2oPwPo+u1QQyaPbxBWMy/18F1g3rfOy416iM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ALIv7KiII6CIBHYFtKLUex6g4rJoLUF6XMP93QF0YWWc3Exj6/B8dl8SqeXbALs/6ZSCTNYmLo/BrDA8q7BsLqCevN0AumGd7zLx+4d3IfCsx2i5XIcZbSam7V/2HmoILeLn6sCvjnZ8fSkfPwsK265XUkZsVxkwpOVW7SDWzAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQ4In65B; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQ4In65B"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ef70c7efa5so6810194a91.2;
        Mon, 03 Feb 2025 17:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738631928; x=1739236728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=gihc5T4Jwrby/ejtTq3aSnhBI6SI8igGTU1dboD5N2s=;
        b=KQ4In65BbuxEmwTGczL/74pRBWKosSjH57v81ohnmkH2FKZQ2aE+ra1c7Guq7nwyk/
         LWzs1/AAOWmYjMpWQmR21Togsicw7RVkpkXYhh0PQ8Z86Rrn9Hjkkk6W4ZJncRT2PhVa
         wNYXhBfyqoE/DyZd7UBVCwTD3jbZmLd0+VvYspziYNYFVgDkfPY171sTcFNMVANSuBgG
         zW98Bg2SS1wa5arKkURrMV3nYEQ9TqYuprdoc97wdwlGl8xSPULKEE/oq6CcNmWMpu8H
         IlRB+Y2Oouco8AJBvb8sicJ9HLVX/sdxHPj5W2faMueZfTyh4HvrbKr1Rm7EJZx47oEB
         tuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738631928; x=1739236728;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gihc5T4Jwrby/ejtTq3aSnhBI6SI8igGTU1dboD5N2s=;
        b=wNDyQ4N0OowcozWEEWOjKU92l+Nbp5jyBFECPrGxi4JaqUnsMlzuDS8FWH55Os3WfB
         suPcm1kjo84byw6VZ1jzuJVKKZcI9YOaLVri/tMpKs+i6z4bPGBZZa3hF8zIp+4OnZEn
         XnDlAXXNmBNPbJQ1UraoEc8HKNwgHXJFTYwEaMa5qAjAi1wZ7rYeyyu1EPo9vjRFUrs/
         AyJRf+knQG9ulsYiT4PC/P0u9LoZ17XZ2+3Ye60/xRbzBqRPL7eTfrg9umtPrBWeynGg
         xnl1qUzfhQnR5KNhEb1pvYBxNKAkrvK6KeyjHUPE8tobcsRXCsamxvcUaP4F+ZDJN9LL
         H6bw==
X-Forwarded-Encrypted: i=1; AJvYcCUAT7bDQf/o902UQzcF3yTl1PZZ2MEBwvRo18eHlINf9sYGGWEoAw1M6JI7JBcTWgcxFF2fs16A4DA=@vger.kernel.org, AJvYcCUTi9b2tH+iaIYsyv7SCDxEBCj8rhfXIU24i4UJx8a+iFkOHTYwcHhGJB2H0O/U6qGs9SKb/eRMtsCeh4c=@vger.kernel.org, AJvYcCV0ddDadW5QJoSc6qaGZ9rW5B3k1jI8v8E4/woncYGv4U98/JYrLmXLo2MViWN3MpFvCJpltjS+SJaATTI9@vger.kernel.org, AJvYcCWHxv2d9bb2Yi17whXkLGF2+4kA4yhCZnp1z4Bewoq5W8okmWrHbwH6V+1ntxfqnpewW/VEwnFicbFGXG0Z2u+ORijRwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YycymJXMOtUXvyo3jLzABaKt8Vv9nQwFv9Cj4YmaE4Wh5y3Qr+5
	5zFHAMz7cJwJW/c3rFnog5dGjbEnBPQVI7sWYWxcHLVyI04Vylb+
X-Gm-Gg: ASbGnct4lFjX9bU8y79E8eV9SPH4XNrOBVXIByjJ4YHidX2ZQo9QcsmdogSPQDm4JE4
	gGxZ0YK+44SVQ03TcYtEkW7ystiOI1DNFGeZwoPI9Yw5YxpH4f4zJZZLzWTisa/2djR955crtoP
	SInzQGo2IWQ0G2lMUrQhHINO1TY6iQxo+f8B3YFI5wdafEzfB8FTW5b+zXtDg1i78q1cfPfjFZL
	2REvJaEswtojftLRmb06D7q2v7GxWFjYxrXrai9ifBINCWJY1+fotkbF7ebVQC1vT5OQiHOxScd
	jLM0QFL2oTyGupbgTqpjC+54UGe35qpWZLdglwAliZUivuOK7W4vGam9kmECxjPD
X-Google-Smtp-Source: AGHT+IGbCBSMs8c1XehlYpcWaa0IT9hSAJ+UeleaEfgJ0YoAfuQrUkZABf7Y21YBWmDWeAolEedOPg==
X-Received: by 2002:a17:90a:c888:b0:2f4:434d:c7f0 with SMTP id 98e67ed59e1d1-2f83abe98cfmr42180766a91.12.1738631928073;
        Mon, 03 Feb 2025 17:18:48 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f848aa7255sm9751903a91.31.2025.02.03.17.18.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 17:18:47 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0266e0b1-43fb-473b-995d-bb92662505c0@roeck-us.net>
Date: Mon, 3 Feb 2025 17:18:45 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] hwmon: (hp-wmi-sensors) Use the WMI bus API when
 accessing sensors
To: Armin Wolf <W_Armin@gmx.de>, james@equiv.tech, markpearson@lenovo.com,
 jorge.lopez2@hp.com
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 corbet@lwn.net, linux-doc@vger.kernel.org
References: <20250203182322.384883-1-W_Armin@gmx.de>
 <20250203182322.384883-2-W_Armin@gmx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250203182322.384883-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/3/25 10:23, Armin Wolf wrote:
> Since the driver already binds to HP_WMI_NUMERIC_SENSOR_GUID, using
> wmidev_block_query() allows for faster sensor access.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Acked-by: Guenter Roeck <linux@roeck-us.net>

... assuming the series will be applied together. Please let me know
if this patch should be applied through hwmon.

Guenter

