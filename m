Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010A8292B3A;
	Mon, 16 Jun 2025 12:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750078798; cv=none; b=h3A81V4+0VWcZlNEt+N2K4/bhXjHcFTtbj82PiB2Um7U2hfgStY637RkwswrDVetDQmQpwSMw6d2aR0r4TnKPNS6NuEwotiCk8lCQyXsFXihhiECCbsgVPK4cgvmJn6A22IuQiciaOH9OsnuVW6Ae5R91jBZbIxY8YvlnzzA2tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750078798; c=relaxed/simple;
	bh=azXkGLujEcM8p9tFvJASu5yNWqbKO8jdKB5FTpSa5nU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BkeuHx3ueNAbrI/T5Ziz5BM0royTtGC6JhkeDG18d+WomTDFgZu4WnAFeVWniTEOcQx3T3yMDKrtjOQ/LWoBp/ELrib0tUdxvqzTFkUrFH8mB/Ys/qwbxxusv8zcd7+SqkIpRMLeEPH3pqbr1oxsxUHMoch3I0ht7uI55YUIBWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1IB1hjX; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1IB1hjX"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-311e46d38ddso3956786a91.0;
        Mon, 16 Jun 2025 05:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750078796; x=1750683596; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=1NKZCgqJI+Fhm0RriV4E/Lv8oSm/XQzalPIr9Js8t7c=;
        b=c1IB1hjXSmQwy7kQwZyU112NzDU1c+mdOP66Fn5Jd2hWkKtIEcWl2o2uF4BCV5oOdx
         49Ht5X/LXzF+xF9Dib7cWg14xGeoUwcSeYiEImMSg/aZ480K9TP2TLF8CfewicK0zoxD
         UkMS5/w+8kWsLDMxrtVaXA72xL0RljihsqadWCmH9EJ6zQXs08gFk4NJpsWh9g1/9YS9
         p4LMHOzdjjGS+EZjSBCCu/N/IAAaSjBglGIipyqLVq42KLUokaHaTjOnxMN0pbm/3hsO
         15m/OAit3lpAM1FxkLjf/NpDFSIqiaDHagtK52elHOPlh9mH8tzLdzIzCZutWnBgNUYw
         Gdxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750078796; x=1750683596;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1NKZCgqJI+Fhm0RriV4E/Lv8oSm/XQzalPIr9Js8t7c=;
        b=vICsuIfIrFCdPwgmH0PnsOH19XEh8EFeESCzpgiR1Lgm3+5Y8fqZCSgx0B9HShL4Ow
         kXI3xSEvdQ2R3dq6LQEyKLnIGKxb75ZXst22egDdaOp6imEukeiGlYMkK/XDdqqEB38Q
         Hw+Nq72vbfj7ICVb1POxfw8V/RX0a6vR0uE+4WSlOy5VLkVJQuBErvjDWYnsvw9mazgb
         BiPwn2knKRPPY4Gq07t2dlgUQjtAM9L8FC16ZKPzYv8bjXYaa1efa59PW5FAMTQCdhJE
         8nRzyDJR7rJMkiTeBLiAnNcA0ir7nCe+j+l+vztWM6GkahVlYAzk8e3CsnJzaGCWlnBv
         D50A==
X-Forwarded-Encrypted: i=1; AJvYcCXcY5627pAe1mEA/rhzEv9yU1FVzCtQQmZWHRhTSYRZa+G1K/RR5B7Ua1Phlbj0mtt3+d+hjlVYhL9Ww3qS@vger.kernel.org, AJvYcCXjROJ8u7DM40/xZjzojdDmcwrnVo7loaXpLEICSWrxAPL+1wLljMTYq7G4zhvIKufitYyNDap/Pnq/Vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXwOh65GK0xUa5ZR0n9Ofg3a6JSGzARP70jdpqVHhsX52IYTS2
	TgyXYivRwfc8FybwBBg9z9oWJ5A3ncLn2W5NdFCAZDKA/cuuvG8bfyNMfny2PA==
X-Gm-Gg: ASbGncs93zNW2ielprdxwj8oQTBwiDSTMxVaapvysdDZSVq2cZcIDCwe5znOzHaWXES
	O0lQ4/LF9RXQ1MQJTI4sefiORKnpips2/6oU5M3PpEBHzIiiqC66vnaIxu80XMEmoA0YzfTxiUW
	9aAU+6t7ebtp14/IeJrilakH8cogFeXuWEmGLnipDUedUQ7rMsTbl9OADeKPeeGLU+9vFawQjH7
	z9DBnFNkdTmTQmhkm8QP1CNni7m8ukOckSly730/fdo9UPwxtsMW9zeFF7xIPSw7o/kGiQaeP5r
	JFgP/W/S21bixK+CL+7MohrTgKkIT3fK5nqBtyV2NK+C53mnRFF05JP4DLSR4asptS17OPFCU9f
	6Tk5gTtdHOUIyvXatbI/whHlThlIqPv4otjo=
X-Google-Smtp-Source: AGHT+IFh1PI8kIXBm+Qvyrboq5xS/gbU+TeRM7OmNfUaUn1DATftPe1r/wy6ZxEMJDWb1rgSypzFvA==
X-Received: by 2002:a17:90b:4c8d:b0:2ee:d371:3227 with SMTP id 98e67ed59e1d1-313f1d580e2mr16370671a91.17.1750078796214;
        Mon, 16 Jun 2025 05:59:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1bca4c7sm8510574a91.3.2025.06.16.05.59.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 05:59:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5f774072-9d85-41d1-acf0-cb95450a16fb@roeck-us.net>
Date: Mon, 16 Jun 2025 05:59:54 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] hwmon: (isl28022) Fix current reading calculation
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
Cc: patrick@stwcx.xyz, =?UTF-8?Q?Carsten_Spie=C3=9F?=
 <mail@carsten-spiess.de>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250519084055.3787-1-yikai.tsai.wiwynn@gmail.com>
 <20250519084055.3787-2-yikai.tsai.wiwynn@gmail.com>
 <CAMuHMdVX0risng0cgUp7uOycv2wUNsZ3SgCX8sq=14j6NXjNBw@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAMuHMdVX0risng0cgUp7uOycv2wUNsZ3SgCX8sq=14j6NXjNBw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/10/25 05:27, Geert Uytterhoeven wrote:
> Hi Yikai,
> 
> On Mon, 19 May 2025 at 10:48, Yikai Tsai <yikai.tsai.wiwynn@gmail.com> wrote:
>> According to the ISL28022 datasheet, bit15 of the current register is
>> representing -32768. Fix the calculation to properly handle this bit,
>> ensuring correct measurements for negative values.
>>
>> Signed-off-by: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
> 
> 
>> --- a/drivers/hwmon/isl28022.c
>> +++ b/drivers/hwmon/isl28022.c
>> @@ -154,6 +154,7 @@ static int isl28022_read_current(struct device *dev, u32 attr, long *val)
>>          struct isl28022_data *data = dev_get_drvdata(dev);
>>          unsigned int regval;
>>          int err;
>> +       u16 sign_bit;
>>
>>          switch (attr) {
>>          case hwmon_curr_input:
>> @@ -161,8 +162,9 @@ static int isl28022_read_current(struct device *dev, u32 attr, long *val)
>>                                    ISL28022_REG_CURRENT, &regval);
>>                  if (err < 0)
>>                          return err;
>> -               *val = ((long)regval * 1250L * (long)data->gain) /
>> -                       (long)data->shunt;
>> +               sign_bit = (regval >> 15) & 0x01;
>> +               *val = (((long)(((u16)regval) & 0x7FFF) - (sign_bit * 32768)) *
>> +                       1250L * (long)data->gain) / (long)data->shunt;
> 
> Isn't this complex operation to convert the 16-bit register value to
> a two-complement signed number equivalent to a simple cast?
> 
>      (s16)regval
> 
> isl28022_read_in() has similar code, but as the sign bit is not always
> the MSB, it needs two additional shifts:
> 
>      ((s16)(regval << shift)) >> shift
> 

Yes, I know. This could all be simplified using sign_extend32(), but I really
wanted to be able to apply it. If someone sends me a register map, maybe I can
write unit test code and use it to simplify the driver.

Guenter

