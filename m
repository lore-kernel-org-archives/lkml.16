Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52FA86353
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 00:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743467675; cv=none; b=P8p9MtJWJbqky/QnQ0NTSbUYqoE7g3J0JSB8yzXECd5zYjZBAM79UNTtKgAouu1x7kSZx+0H7DcdwQiVp6MdEgtO1ELDe0saB/LhhCG4GXsv2zC98S1TH+KIbz/H17TZ9ead5QBWMW+/IEobKUCw7RL3yu+lRM9Z3ifSyca4f2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743467675; c=relaxed/simple;
	bh=fOlQpUSSFmeTfiqLUrIvrAcMt7JKFWU2/HZ7Jkl+X3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3e3tzObXbBS/ahj6luS81TEI/QTAHGfDzHXY+ZN2DmmJ7iwz1IFzRgMSB1cZs5whiETjHmPt6MBo2RbtIzVWAPs+zQjE/k6WOvOIChBAAf9YtmMfl3yOTbDuhPP3IiexDbGiZ3ToL6bpfmE7miPkW+GSCTdoTDekk+dQfhKZgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vrhlR6/l; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vrhlR6/l"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso602628f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 17:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743467672; x=1744072472; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=89vNL8g9zC7it8oGRZRM39/5HiiiqzaIpAIrxJ8RaKE=;
        b=vrhlR6/lWzwVt4MTAdDrLR/ycEQVbOVTeyECvzKNoDcCaIPMtQozSxYgPLFxXpPSIC
         ATnb30uFLkAHLvJCOJ8sIto0+vkPRe7E9whOJ5nCKS7HoJ3XFPYR5LxmrIGHFbDwqeWd
         247xvTSdiXwQivQUP0yfCpeUTojQgdDXf3tcRf4CiUOnxXZHO8TCrOEbxYq7NjfslBqi
         9ZsnhCt2WpJze4gByJ5ayKwMQf6Qw1SDoZNOnS3JIg/i7Yp2bZf0+u1IJmaeU+edkg3q
         DoRPsaBofleo23SiV5d96fkuxveXlizxLxXnjBDJEBv9bU9fWreB2yXN2YxJeazibNEz
         Yj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743467672; x=1744072472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=89vNL8g9zC7it8oGRZRM39/5HiiiqzaIpAIrxJ8RaKE=;
        b=lz/cMu17ylUCf7Z5sIDVfSm4Wbn7cwDmuW9Y9b0tL0aXnt8o7kc0buXJmfq3LJWzic
         SBEG65y8USFpClHhfP66yN+JZHpanHmbCoRQBI1Ls49PaemgUcp22xKEvJLFlxtX+dDA
         B78gS/w2sTwvtgdAlQQWFguPkcLBNJzq5Mi4Qek0s6aVy/M5BuYETbEqMGS/4nFtJozw
         KB24VmW2SXep7QPrHmq3H+w0WrD0R+ak6XkhvEYaBiXdjoA1zikc5zfHLTRZF8G0m5qZ
         7GbdLjHWjVR2pEd3uib1IGsFyCXeLnSSU4bv8hLOM/1SBOtIic7LJ6KeTPLXE9mJbrer
         o8uw==
X-Forwarded-Encrypted: i=1; AJvYcCWlN1BZKTnW+12UZoa+y8A/JCvRV9VtpH4maZMeZMhQb0p3YEQssJvGTlDS/BlhEQMKgwXt8nVbiiE8PVk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTg4zTzlxrzBlgjfLuz6BK/tTlI5hB7LDKwrJodAkrjNvRMCcW
	ksFYsWjT0k+mr/hi9WT3Kgph9WkWGp0YRhYhfIisOjfXpxll5W+ObBOP66Yv7ts=
X-Gm-Gg: ASbGncvUlL0AvTc79KiBvvlvMRgEDfeX/V6A1Esjsd2O+PEhOaJ1oVPgStkh9h+Bzqk
	WaS/41zch5d/IROBvzfgvkzvcSNtl/joqvuEhd02kiU0lqTE9GZjThNGKkEsI6LAhc5qkN4Jo/1
	Sa8TIazq3UnIwOl7CWQRKbG4dSnQeErb9nDDpDBtDsd3i7sXYrB9SCUV7DaVfgFYwjsvSiAjdnq
	DCdmBQjXCUP3HB83ZXeO3z/kMS44cEErrXRAqd+/pfl3Y7AmfwkplhQs9C6OyHFs8Y7bi5SWhZn
	8JOf5ky5dSUc7edRgxweuqEaS+9/HO8odM9bXfRSau7Iiul/7mebL9SHg+8jKDK2S5qxUqNv8Xb
	rsGEqwQAD7Q==
X-Google-Smtp-Source: AGHT+IF3vbQIXc3zxtPI8yLZqUf7MGgP9lGnUuUw1HcwcqZZjvm2/MxQFl0vZDK902Kb/RnQSDA76Q==
X-Received: by 2002:a05:6000:186b:b0:391:865:5a93 with SMTP id ffacd0b85a97d-39c11b9baa9mr9817671f8f.22.1743467672037;
        Mon, 31 Mar 2025 17:34:32 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a8e0asm12510841f8f.101.2025.03.31.17.34.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 17:34:30 -0700 (PDT)
Message-ID: <47dd7daa-cce4-4ad0-ab57-4c76304b0aa6@linaro.org>
Date: Tue, 1 Apr 2025 01:34:29 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: i2c: ov02e10: add OV02E10 image sensor
 driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Hans de Goede <hansg@kernel.org>, Jingjing Xiong <jingjing.xiong@intel.com>,
 Hao Yao <hao.yao@intel.com>, Jim Lai <jim.lai@intel.com>,
 You-Sheng Yang <vicamo.yang@canonical.com>,
 Alan Stern <stern@rowland.harvard.edu>, Hans de Goede <hdegoede@redhat.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250325-b4-media-comitters-next-25-03-13-ov02e10-v2-0-4d933ac8cff6@linaro.org>
 <20250325-b4-media-comitters-next-25-03-13-ov02e10-v2-2-4d933ac8cff6@linaro.org>
 <Z-UAFkshOgeytfB4@kekkonen.localdomain>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <Z-UAFkshOgeytfB4@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2025 07:36, Sakari Ailus wrote:
>> +static u64 to_pixel_rate(u32 f_index)
>> +{
>> +	u64 pixel_rate = link_freq_menu_items[f_index] * 2 * OV02E10_DATA_LANES;
>> +
>> +	do_div(pixel_rate, OV02E10_RGB_DEPTH);
> The pixel rate control is for the pixel rate on the pixel array, not on the
> CSI-2 interface. Without binning or sub-sampling these may the same still,
> but this only works in special cases really.

Hmm computer says no, I don't think I have understood this comment..

Looking at other drivers, I'd say the above pattern is pretty common - 
taking ov8856 as an example that's pretty much equivalent logic to the 
above, ov08x40 does something similar.

=>

pixel_rate == link_freq * 2 * #oflanes / RGB_DEPTH
            => 360MHz * 2 * 2 / 10
            => 360000000 * 2 * 2 / 10
            => 144000000

If I'm understanding you though you mean the pixel rate for the control 
V4L2_CID_PIXEL_RATE expressed here should be the resolution * the FPS / 
bits_per_pixel

pixel_rate = wdith x height x fps / bpp
            => 1928 * 1088 * 30 / 10
            => 6292992

i.e. the pixel rate not related to the CSI2 link frequency ?

---
bod
