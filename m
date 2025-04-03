Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA48A2907
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 06:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743661160; cv=none; b=lGKi661jJRujGeUZ+OUxwoxVaTuxyI2B+T6PvvE6jMlj+XNcCcWqZld9IeQ3D6mALxfgEmMOwbVdtIBqk8mEZhfuqe6k15KDoAmWUM0je3T1UCm0DTB55ruIvSkk2DlOmQmANAUPcbXlK5MhRpstT3hQPhbyZvIF04qN950cV7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743661160; c=relaxed/simple;
	bh=34E2t4Sy5QDlAz136J48jB3GUWLPXgke3zRjYo/V1eY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OW7P7z75o2LKPNJAB3z/yekxwnwuFVF7RbxFyDGaQkQcYBFnE2CPSM2GjSmhFzMlfn/ONAD1/6UF/KCo4eXI1x5TdXD+VAWHwSo4WM16KOMWDxH3EQ9RgSoCbYsA4IljjQ0S58zQwlurbyarBIOqFhF55qGBBvCTJ7NBxaMAOPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lDfSMSNw; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lDfSMSNw"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3914a5def6bso289974f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 23:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743661157; x=1744265957; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4hMx6SEeGvAeTt/gW/t4ifk30FnOIAfJuMp44OHabpI=;
        b=lDfSMSNwsoi8x/FudbrdbnViNxY6XM/n70ryA1NHwCdjlNB/wWkXTVEpYGn0vtTCOE
         z4e605b7gp3ryu6TIosihDAB0GzqNlaq98ffvn39gijQbDfwrHJA2VyLvIPchisv9zC9
         vDh19xWeHN2odMkBzkLMRILKmX396YLLPG/8IJ/Q7mV0Qg+ULHXFnAD+b8TbNS2p6nlQ
         YzFYWguH4IW2ptw1CvC8g5ngm+ayQ8MplQK9XMA9omHD7cj6/ItSRMHqCrSTxkw1ps2r
         r1oxvcWHYINofPrdS2YqAGJN6XOnZ8zuY/xMVdr/jyGWwnlzHPQ1M4DJO7kdwgDfuayB
         In3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743661157; x=1744265957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4hMx6SEeGvAeTt/gW/t4ifk30FnOIAfJuMp44OHabpI=;
        b=jr9R+PnMKO2JxfCOufbN1HonDWte7i/OF5nZSEh+gjH0a1ohHzX+AmMoB38DvAa2Uo
         JkudYUTpmXj98RwqX3VvHd5q8BQa3pmsOz5JJ+UNZHer1FlY58U0TVKYlyC1Zo6ThVnW
         CIq4Simn9sH0nnoY9uh17HQuaK8R9RrQNu7LPQ0hojZZZO1O3sv7h8PzdqD6Gprf5ezQ
         4fw0yIZhPpJZ/BvMeR2cpTtIX/sPehQNMxBeCIMVwH7HaUjqxdxCQQfM1PRzYPRhJf6U
         0LKny4Co5iHbu3vM0jkCQlwOxQWksW89cttBjt4ywOeJ4UUAiIS6vNSm87cee5HjGn7T
         CGnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC9ZH1ifN04lSoD4NsO+DvHVcIBrjiEwYtagTiftJETmijMLGtzqF9B5rELj+ga0P1+pvw5UQ0gwyHaqY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEpSal42LCNHqrUkqoqxr+xifL5dAziOcHXsQRwpN51uhpy/jc
	HrF5wVGAkpby1+WAR7rBc6S2vaApnWsdMtusFxrJucpH0hmcI5kTX+PQEfSqrTk1V+RlDuHwC1l
	k
X-Gm-Gg: ASbGncufNxPTJS38yjjK6jNY+n/bzXlsfsaOYS4lofpLGcJ6Ok6TSgxaEBX28UFxX4p
	QynS0hVxRez8p7RNQF90V9WP9CKv81d7b/cY5lqYGEZh6L64UneIxEa1RcAypPtIOtXj3DYXTeT
	Rdvt8pBJkccAd1mohzNdnAKGByWekCL2dPQs711VjdWuldJ1dYxk14Yy5kBm9OahYL4P5+DZrXA
	egmWhp/MCxoW5QTwbqPfJAuSZjGfKzKnGpmOnDHNPXGWoaKGXci68xEVM+hM2hQzhUlhZMFpiVT
	9yr6kThu4tSdafKgVPJk45rCDR+ODqzz/pyJdbR0sSN/J7j4+WvuQA==
X-Google-Smtp-Source: AGHT+IEXLGJhxZC80I6dZhEzixmZFPKOcjX+LixzCOppdHEq1mZk+wbowjRnvFMqjnJz0bgWZJImyQ==
X-Received: by 2002:a05:6000:1888:b0:391:31f2:b998 with SMTP id ffacd0b85a97d-39c2f8c62e9mr810532f8f.6.1743661156922;
        Wed, 02 Apr 2025 23:19:16 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c302269a2sm840986f8f.91.2025.04.02.23.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 23:19:16 -0700 (PDT)
Message-ID: <5463acad-ee29-45de-9d22-16eb7947002c@linaro.org>
Date: Thu, 3 Apr 2025 07:19:15 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/21] mtd: spinand: winbond: Rename DTR variants
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Santhosh Kumar K <s-k6@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-15-45c1e074ad74@bootlin.com>
 <3ebd53ef-c7fd-4c8c-96f3-32e97b355b6b@linaro.org>
 <871puaqz6m.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <871puaqz6m.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/2/25 5:57 PM, Miquel Raynal wrote:
> Hello Tudor,
> 
> First, thanks a lot for the time spent reviewing, much appreciated.
> 
> On 02/04/2025 at 16:19:00 +01, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> 
>> Hi, Miquel,
>>
>> On 3/7/25 3:08 PM, Miquel Raynal wrote:
>>> -static SPINAND_OP_VARIANTS(read_cache_dtr_variants,
>>> +static SPINAND_OP_VARIANTS(read_cache_dual_quad_dtr_variants,
>>
>> why not read_cache_single_dual_quad_dtr_variants? I see single dtr too
>> in the supported ops.
> 
> That's true, but single modes are literally always supported, so it is

literally, meaning from experience I guess, or is it mandatory that
dual, quad or octal dtr to imply single dtr as well? That's fine either
way, just curious.

Does quad dtr imply dual dtr? And octal dtr imply quad dtr and dual dtr?
If so, then maybe name it by the maximum IO dtr supported.

btw, not strictly related to this patch, but for the overall
architecture picture, why do the SPI NAND flashes need to define their
supported ops? SPI NORs for example are capable of discovering their
supported ops by parsing at runtime some SFDP tables that describe most
of the flash parameters and setting. I see SFDP standard (jesd216g)
mentions SPI NAND devices as well. Have you or anybody else played with
SPI NANDs SFDP?

> not very discriminant, and here my goal is to differentiate the variants
> supported by the dual/quad chips vs. the variants supported by the octal
> chips (which are not capable of dual/quad transfers). What do you think?

I find it fine to differentiate between the variants.

