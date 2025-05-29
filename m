Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EC71AF0C8;
	Thu, 29 May 2025 22:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748556754; cv=none; b=CU8g+mhruXl7t6YK2FEAhYOQIzChOeWk81Y4YXJSRF8yKhGmGR1ta0CAnZQM+ddV1xNfuExjjR4QgBJtX2PUje0n1QBettwM+Ypo6EtVAdGfXtROOgnwGA3HToLrEr5GIs4b3wSR/WWHP2dTZctNvKxC1nkMToZAVHeiNYKdSgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748556754; c=relaxed/simple;
	bh=4Iupiln/BgqshBDEn9yBfvIRrelaFb7lXwcLDuVcWvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZMxkP5iKw0sRsljGNAxrJ107HkT46Q11allwm3fV+EeatpCzzZcJRX2Ch4UuMD9fctcMgTEBKMHWluGBkHt8HgnAV9nGO/dMmRM4jmSzk5y33pMdmlgoPIoSLtV7NyNySUR0iAt/6BIfoNK+vodGP0nNja+JljGWpTuyE3R+3HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbZO3H6e; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbZO3H6e"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-60b8a9be8a3so662651eaf.3;
        Thu, 29 May 2025 15:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748556751; x=1749161551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ue6o1C6d/kSRNPWgK84kUQwoXawmCLOvT1ulIKWZSR4=;
        b=XbZO3H6efuHpFpt9UGKzT0BWlCuXDrFpINrJQ835ZqCsU0NL0Q3HX6oTF6M+Z8Q/xd
         PwL9RqPWVLgZVT9UuN+ZJyYbuqRd4mRnVkJSlxgJU98pMcCWxKmgmwpKgHWp44iWzKUG
         DXJWkuWOsdODYOMv2Yi7Y9C5zzsmfbroiJBkb6cALc1WE/tHecpJ3OxLJKLFn2HTvAmm
         yLNYiErz/7RTTiePtIqylDg804xUGlWulri+fF6utiZRMrkDgHHvLTNSLAVzcGdH3ULF
         8gOTwds4Aocvjtm6T+pH2dSDMkNWO+9utrT/Za2Sr+/Qryn56WDzYGVUocBmDDO0Hq2l
         5qwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748556751; x=1749161551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ue6o1C6d/kSRNPWgK84kUQwoXawmCLOvT1ulIKWZSR4=;
        b=ShqcisW6iqeWEPr0NUlWKQdifAvJMszrdnlBJ+/pDQfne77cwdjQj5yc6nAfRHe02q
         /8NCdsliLGYdA+wfXWG0DBZSxV+UlHCszJbu0L4mrDYvm9s5dQW5Schjo+ngEuyewjEa
         EbsMr1pdl1ypWGCKXa7QDr4L1FSd++io1NDzhg5mnA+90Sd4rigHzT8+8sys2s5voqZ4
         wlUDUElEjBlZkAYO9fgiR+wJNdyhT0kKnml3zE2nL+1UHIll0P6oiuQRZv+SmaD2nLfm
         iEI2eQAVgE/wqI9h184CJA7UXJ6r+pA640bBdj41i8NKoZ2yWwVf1q1rXnzfkcTGN3k1
         Nfig==
X-Forwarded-Encrypted: i=1; AJvYcCU0ZsiShhDsHxy8G78qtaZZukR5xJOwzUHhPbwEE/U9sWtXEnOMYjLSqz7xO7k7NMM1gTKgGHi2SP2ve8Xq5sixjW18@vger.kernel.org
X-Gm-Message-State: AOJu0YwFPF2moPlfU/ShGWeLlPcevA4K+f2drowCQbBMrvw1ioltDGqi
	tFOC9Svgx0NHaC0DLZI9812Y0hgm3iM6noJDO8zjg7EqLFfmQwrbDnHJ
X-Gm-Gg: ASbGncsKbZt8FbVZDNxh45mmh5du0NpM2PM2xmkj1r7C9Ot/xfOdmzhOW71+r3dfFQc
	zq2RSW6Xf1ZlXEnsQvveSjHk6etS7AQyRYPCJeNt2G5CQlPbc1ycklVKeNZ1l9FGhZahDcloRYh
	oWzVYx6a/fEIhpx9i/4B+B2cG7getwl67PlaqdcPOtfQkOqwG1gko2aVfFiIK4L2MX4XwYIDE8X
	k6Z4wBLmyY28OHpe+tmAXLTodepARY4s/+HJ3E1vHWqcu1lfoC4xAarpg26kgxr2nClTz/mF38h
	7SQwtPEaG9r/oZNiZbLGl1dJp2LomM3eFJ5cXTehZ6Oi3sRWjzv+bVK6A5fXJ61ytt9+x1VdhD3
	RzI7ji0FbDQg+cAC4NXhAaI0EErrehWEyivBTHXf/J63iW9A=
X-Google-Smtp-Source: AGHT+IGOcQUephSzzgz2CHW+pPQ2opWwxKd9OY10/tYlSUj7AUQB1i4y6lml9sZHFa8PZ3aYyVAIpQ==
X-Received: by 2002:a05:6820:1e0a:b0:60b:9d5b:e94b with SMTP id 006d021491bc7-60c4d729658mr951701eaf.4.1748556751341;
        Thu, 29 May 2025 15:12:31 -0700 (PDT)
Received: from [192.168.1.7] (syn-067-048-091-116.res.spectrum.com. [67.48.91.116])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60c14c6fc02sm164228eaf.11.2025.05.29.15.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 15:12:30 -0700 (PDT)
Message-ID: <9a1a1d6e-4d0b-4c0a-aa5c-31ee9ad65da2@gmail.com>
Date: Thu, 29 May 2025 17:12:29 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] platform/x86: dell_rbu: Stop overwriting data
 buffer
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 platform-driver-x86@vger.kernel.org
References: <20250522200937.9578-1-stuart.w.hayes@gmail.com>
 <20250522200937.9578-4-stuart.w.hayes@gmail.com>
 <b975c429-25e9-3cff-8d43-d2b40f8fb9bd@linux.intel.com>
Content-Language: en-US
From: stuart hayes <stuart.w.hayes@gmail.com>
In-Reply-To: <b975c429-25e9-3cff-8d43-d2b40f8fb9bd@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/25/2025 5:14 PM, Ilpo Järvinen wrote:
> On Thu, 22 May 2025, Stuart Hayes wrote:
> 
>> The dell_rbu driver will use memset to clear the data held by each packet
> 
> Please add () after function names.
> 
>> when it is no longer needed (when the driver is unloaded, the packet size
>> is changed, etc).
>>
>> The amount of memory that is cleared is (currently) the normal packet
>> size.  However, the last packet in the list may be smaller.  Fix this to
> 
> One space is enough after .
> 
>> only clear the memory actually used by each packet, to prevent it from
>> writing past the end of data buffer.
>>
>> Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
> 
> Fixes tag?
> 
>> ---

Thank you for reviewing this! I sent a new version (V3) with these fixes 
(and a module version bump).

