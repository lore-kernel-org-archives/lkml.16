Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6781522AE65
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 16:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746721650; cv=none; b=nq3KJWuLBAbWkfTDtHc9LJpUYPgV7qDgON9Stc6+qsvWa9/3IwbM/UNq9aVcgawGoZ9AFe/7N47QFEhhhCeTJn+6TuXRtNFZheOIR+vBx+f1NsLvZuJyFvgCNMFy/zIe7mDmasE7/M1gB5OwlPZT6Ij/dlhe6t32sUPZnugbsk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746721650; c=relaxed/simple;
	bh=CvBD8xXamqMZ4Sf6TOaEzYmjkLmyIoNTOncSFvoxwrY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=s20ZkCBqwvNHCQiUVoK06X+HEFJfsRJTIFNbqeF4wYPtMleFCBX34+TxsvCBGKB194VABUL16kj/u4P+nOsdq02yPDNVp4g+NkNI2f9Sifj982R7KyX+bioKudPozQ+0juWARQpfbEuL+v4d9IOSrZIAHmVal9MERZgSdvOSvoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HXOpzNVQ; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HXOpzNVQ"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7303d9d5edeso384322a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 09:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746721647; x=1747326447; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/zGq17fficf6pUhy1rwRv7tegMGj776Ql9FSXPgf0TI=;
        b=HXOpzNVQ5rCP4wyKCX9xAI6KrPO86YNPW7iMSgQtuwYNSFqSLWEEAwGTU+9xhad//K
         C8tFVG2xQlhEnUJZa58lSIiuEgSFlh86QZ5ePFF7Rsy8k/b6wxByrJApX53wNVN7eN5V
         VT1rwq4ZdyDCGzlytfU73hxqcnICPpqPfkTIPJGIQyLgaRWinmP/CkNyqyfzxz4Ra0Eg
         1qXdIEtvGNa4eEmdrERPW4mL7wOtbwFvq163afDD9ELMBlcewkbKZ53ZvUBAswEjq5Do
         AHcoTWOd1fn2NTEwd/RUTafv9HNFI9z9xIKSPNxONnRLAfqdCzt2+BA7QtyHt5hfvdoI
         EQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746721647; x=1747326447;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/zGq17fficf6pUhy1rwRv7tegMGj776Ql9FSXPgf0TI=;
        b=rSRQRBZkyGVnTuetwemxRQJvJhpuq9v45/I2pDOHkdhPhpQ82OS9JUp4J+MlwhEkfF
         2lVcJYnKoNbd3jVlnksDq3PkE3diBgjL38UyVh5Lk7WyzmWiJ61yBXhehLuc7YXfhuAM
         z4wKesr+8nl70AU5hgeqASGdAZTD74wweDywsTcULIbpmYPeMMGn+bEKaaC/BTYD9QaT
         SEPv/cVGVgtlI2/BujA+zGkXP6N2E+ZWX3G+xKGYGx71Wd5Ffg3/sEmG81b3fRz+0IPw
         Om1aiZ31Tw1bzDc5Qpg3n7jfoqb6JEiFRpRgOHDEC9K7KuReEFArlTkh9kC9hgu8NRYE
         wV1g==
X-Forwarded-Encrypted: i=1; AJvYcCWCAhSBW3/K9tUV3CSfSaiuhQ6w/uHAC2OXyPwuHREQL9pb+fmNe3gM0RVTRxGKJ5wdX6qGVkfOW0aOKek=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Tri4LhK2F0XDomcXUzvGdu9g/xYCq2ZC7mADVyKhp4BH8uyy
	4MEbNfD7lHjz3HZlEzd0tgtU+dqOroVZ/yM20NU5ZT8EbmUEsm+BkFgng7jf7qxw0WzvY4hxYOn
	R
X-Gm-Gg: ASbGncsP3odhQg/dmn7rSsm5bl5pb9Pfo669Lz0N9Cg88MA00SOHCWGiVJ+3Fnl4PoN
	t57hPlyDzQF3VTEWn8f2B6q0kK9nmEoiao6KFtZ05Nz2I8AztvQhSu59xLlTRizDpzXKyGpM/Fb
	miE5tR2S2PC0mm7ivoaf3Jbzuusg4kU3easGHkihS9L/3kYhxevBQPr+//XLF7ghGJQmq/H0j1i
	ff8WBbiYtpPrWQ2pKabbPWP75Dnk+4eFfjpjF7PT+J6JxqgD7r9RmJFtLrZnVhinIbk7y9uUYCR
	aUV1TH2/H1uexFUiYjmXgaiXFHtbPRy6BIrR6DircxWI43w9IkJ6Z3Jwibs2OFHIHcllVNEcNX8
	ll5tJGnkB2ryk+v9ZjyCY1yVkO4Ce
X-Google-Smtp-Source: AGHT+IEFvELOr2XApDegFF1x2e/Ed/z5Mpe1PLXgT1R2E948sZk6yNyIDi3QfjQ4eU+q5GNDjwjlzQ==
X-Received: by 2002:a05:6830:d12:b0:727:3664:ca25 with SMTP id 46e09a7af769-73226823edamr329483a34.0.1746721647420;
        Thu, 08 May 2025 09:27:27 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:1120:d1cf:c64a:ac7e? ([2600:8803:e7e4:1d00:1120:d1cf:c64a:ac7e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732264d59e1sm89110a34.34.2025.05.08.09.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 09:27:27 -0700 (PDT)
Message-ID: <720e300f-f6e0-4c47-8e72-b3ab0a50fbed@baylibre.com>
Date: Thu, 8 May 2025 11:27:26 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] iio: adc: ad7606: add gain calibration support
From: David Lechner <dlechner@baylibre.com>
To: Angelo Dureghello <adureghello@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250506-wip-bl-ad7606-calibration-v3-0-6eb7b6e72307@baylibre.com>
 <20250506-wip-bl-ad7606-calibration-v3-5-6eb7b6e72307@baylibre.com>
 <c999800bb5f6c1f2687ff9b257079dcf719dd084.camel@gmail.com>
 <qaiqdak4pieewavl2ff4mpr2ywhw2bvnoob55buiinkisacar5@q6jhlb5klcf6>
 <7f5f75c1-7750-4966-9362-2a46c5e5ba3e@baylibre.com>
Content-Language: en-US
In-Reply-To: <7f5f75c1-7750-4966-9362-2a46c5e5ba3e@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/8/25 8:50 AM, David Lechner wrote:
> On 5/8/25 4:16 AM, Angelo Dureghello wrote:
>> Hi all,
>> On 07.05.2025 07:14, Nuno Sá wrote:
>>> On Tue, 2025-05-06 at 23:03 +0200, Angelo Dureghello wrote:
>>>> From: Angelo Dureghello <adureghello@baylibre.com>
>>>>

...

>>>> +		ret = fwnode_property_read_u32(child, "reg", &reg);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +
>>>> +		/* channel number (here) is from 1 to num_channels */
>>>> +		if (reg < 1 || reg > num_channels) {
>>>> +			dev_warn(dev, "wrong ch number (ignoring): %d\n", reg);
>>>> +			continue;
>>>> +		}
>>>> +
>>>
>>> Sorry Angelo, just realized this now. Any reason for not treating the above as a real
>>> invalid argument? It's minor and not a big deal but odd enough...
>>>
Ah, I see what you fixed now in v4. All is OK.

