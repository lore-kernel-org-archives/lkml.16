Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CA97F477
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 12:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749816362; cv=none; b=KBiMdf1ydlu3tQD4j9GUqFs3z/KDbTP4ciOHK2P3kiN2x0xJqLbn+c0sp1FO6GFxWtpj8rQ3+Z7V+9el4Sn1zAz6jfcl9HDp8F1W0cFGtWF5fxrlpnrXAbEm7k5OenmV/tICvC3qydddgaAT0YX3B7H5SusMLV58PDTOWN4E850=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749816362; c=relaxed/simple;
	bh=2UrFFgOswSPh2C5dGzSoD42CxvehITsQmFtkJbw2tfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JgKkTkQL4xvIyJWsAZu+IcueiEZvBFNiU14KZQSYeSL4f9Nml8LvaompsijRZKPip8BCQS6oZPDwjZnfOYFr01knBdx6tA5elhqVPMVT/FhSoXKXrfMc/MHi9WMZ5sUAIXXzxnzb0wt4z3FI1yuSZYdAZVZwEIkg1yys0zKlZd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DYg7B2dB; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DYg7B2dB"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a5096158dcso1787988f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 05:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749816359; x=1750421159; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ezZ3om80+8wTckLGLk4euno4vPWbqfb7vjKUnBPCItQ=;
        b=DYg7B2dBHc0pkboS/9H/yCjCBCMgC3PD/UkU0GqYe2g9TijD0ACOPheaN8YliwChzC
         5yLtxMHsIMC0zesPt8g6+uqJE0Cvr/JAefZS/8U3+NoL4Z8VA/jg6sSFd++IHgMlli2d
         KgHCGlI8DbTePBL+OUL8OS2NkF8qtuV2TXmWyYTW6tWS2HZaqqS1808xqk4UlBX83+nU
         m0vuf0Ul9CFtJ8998FlFN3SCvv26wCp1WXoHBIJ5Ex1iB/KokvSGYpmXsJoibGOamxfu
         lOJG2dzhkefSh06S353uTL09WVXaB2V9zpFNj9G9hslVdOKIjbu5Q9jofhgCpnx+l4zx
         EQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749816359; x=1750421159;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ezZ3om80+8wTckLGLk4euno4vPWbqfb7vjKUnBPCItQ=;
        b=Yd6bXQa76bN/aJ8xc4hf/KhQ7i7KNqjHMLqFXI60vhj+6z+aXjKd5AmlWdQMy0hr83
         9yDvF5s8e9iALEp5kJI3//K7tDG1ZnkdewBLpkghx++9EZdQ5UX+g03moDDX+qw5En98
         2FHQ/lSe1i4JnWo8tozovH5NY1VxIX0lNpKkoVSu4qV3fcWDL+N1B1PCt/KjsAk6cjuS
         9Sg30eKljKOIN0OCC1HWCnz7w4DoDIMfvS5smCGNvLQDNWKWkofMQ4IE7z7HCMwWwFKO
         ZgOT3pBxLXA8D3QW90nz6TUbgbZ+ShUXtPDlIhhZDbgoTBDZaFqVIGb0EwQnhkn43HH3
         bvyA==
X-Forwarded-Encrypted: i=1; AJvYcCXQCi4e8FVJYcG466cxTMr5dR5f5MBdVrxfcul2g/Rpuc3SMgyakMt4NR5p//MrqXw0OfCsOnFIO6kZ9bc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKdIKZV4973ajyn35j6aUT9yBdAjQVwSXwIwNmbhDy/pz1cKNQ
	K+x4YPIFzsTxv0ChboAJenVOJiRU2ys66K00w/FhawGb+WbUB7cgPU8zDWbBC9cpIp4=
X-Gm-Gg: ASbGncuwTS88RXZERw/cwqh88y5AhVUK5D6R5PW/Kh/yf+fjRmAaWvgBp0wBaM4pzcV
	YaCfWrAVwFTDNFBnqXqhMfJ+1x5XMkXo7Fud6ZJzPWRSHsnJNrP20quU3ReV62YgfSUwU6HqUKW
	T2WucpZ8IdKWUkKG3NP3IntqsKASWtCUk5CorxwCvFlorUX1m6C5EMtyrk5c8m1SN5Alu7G5+TZ
	nkJXgmbGyBvcLVDkYxKnuhsM4PU+MtGYvg9s6OcVgiEWz/u5REHB3JmHhq+aj2ubItfMBEk75VF
	KGs1BKwxHKKczAbVIGMDvc6giGMOycNHJ76iXEv5Hrpc7ydUg6apUFtL4SJNwGS3XO8nnBd+3UW
	QybDMGzmmAmug+uxSJhqJru2P+bw=
X-Google-Smtp-Source: AGHT+IEhgG6sw/MTwwpOekg0psaag8qHgVPHdditd9mh4vmyj+KCnkStsZpDGIC58gJqzP6xAf1AhQ==
X-Received: by 2002:a05:6000:2304:b0:3a3:4baa:3f3d with SMTP id ffacd0b85a97d-3a5686dfbcemr2203429f8f.6.1749816358606;
        Fri, 13 Jun 2025 05:05:58 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2522b1sm49614825e9.25.2025.06.13.05.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 05:05:58 -0700 (PDT)
Message-ID: <37eec3b5-1e57-498d-8ead-891d1e5f96d4@linaro.org>
Date: Fri, 13 Jun 2025 13:05:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Hao Yao <hao.yao@intel.com>, Pratap Nirujogi <pratap.nirujogi@amd.com>,
 sakari.ailus@linux.intel.com
Cc: mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil@xs4all.nl, krzk@kernel.org, dave.stevenson@raspberrypi.com,
 hdegoede@redhat.com, jai.luthra@ideasonboard.com,
 tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.chan@amd.com, bin.du@amd.com,
 grosikop@amd.com, king.li@amd.com, dantony@amd.com, vengutta@amd.com,
 dongcheng.yan@intel.com, jason.z.chen@intel.com, jimmy.su@intel.com
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <6a49eb11-d434-4315-8ee9-0f8aa7347de2@intel.com>
 <174981257597.425770.15369432320575770694@ping.linuxembedded.co.uk>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <174981257597.425770.15369432320575770694@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/06/2025 12:02, Kieran Bingham wrote:
> Quoting Hao Yao (2025-06-13 05:55:46)
>> Hi Pratap,
>>
>> Thanks for your patch.
>>
>> This patch is written for your camera sensor module, which seems very
>> different from those already applied on Dell laptops (some of "Dell Pro"
>> series). Looking into the driver, I think this version will break the
> Have there been existing efforts from Intel to upstream support for that
> device?

FWIW +1

Qualcomm devices - Acer Swift 14 AI, HP OmniBook x14 both use this sensor.

I'd expect though that aside from OF bindings, regulators and clocks 
that any upstream configuration with the right number of lanes would 
"just work", including this one from AMD.

That has been the experience picking up OV02E10 and OV02C10 from the 
IPU6 repository where its ACPI binding and repurposing to OF/Qcom.

So how incompatible could OV05C10 be between different x86/ACPI systems 
? Less than the gap between x86/ACPI and Arm/OF you'd imagine.

Getting any OV05C10 driver upstream would be great, we can work from 
there to bridge whatever gap needs be for !AMD.

---
bod
