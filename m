Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3DD24503B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 08:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749025442; cv=none; b=r2qBhIsLhHVv4Kbxnyb2+DTa6EN5oEiOU7C7QXuvYZPe6UyBw9F5+f0QmdoZxGImx/iWZqKUp/whWyXX+NMqqgF43M0U1clu5YPvvH2PEGxyScQLGcP+yAs7y7FxHYP1g3w54C/ctZKebK3Qq3kteWz9w6n8fbxTufkq2Bs2t5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749025442; c=relaxed/simple;
	bh=zNHoKAB5U9Qmrd5tzPO7HQ0l+s0XRB3gxF4oDsXEwt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lTaoRFEbKG0eTzqklUnGpOEz95WtYNp5cHGd/kFStgXIlwDxJhIpYSSjDxBtcqyjE6zr49+9AUBDagvd9dVv3L2kmMh6l2GQooYDH0yORbxJnRE1uP7/Fyl+BM6XLc4f4czvGPWx4bamp9FCnDmDd3q6g0O4pUvQiW4bJPeaVcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z2uPQTyG; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z2uPQTyG"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a4fdc27c4aso2404792f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 01:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749025439; x=1749630239; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h7s6pfygUdaVGCn3GcQyk6cUhVydm03tR2O0SvKmYUM=;
        b=z2uPQTyG16uLb50UVAGXXsn/g1j2QQFVHuMXxl5viKNPbXRNArf6rY9f741Z9n/Ghu
         aEix6jWPfZwEJYgkC1wcdYxym2jUerr4Lq4bOxJuVtPElHVoK906lJXBVNNZLinExaOP
         LuE5DoViPzc+PTNAIlIlgr/oM3SMftD/z8uzV0rfeqYt8yET8R3Zt+/TNJ0jCuf8KQUE
         raRDGtQfIWGxFZBMqgBszOfRygVDi1r51NvkjAhwHRZFybwIXRAXFK8ERetVAnO6o+Rm
         1uLFdwX1R5/v7jIN+WHfqVegWaCpM54aXRRLWyg7k138EHUQDu5xUZ74nBUdW4dzpV9y
         9VQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749025439; x=1749630239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h7s6pfygUdaVGCn3GcQyk6cUhVydm03tR2O0SvKmYUM=;
        b=E5wfqynHjytklM2ZQJTgPEkwWxqV5SZKC/Gt1eW03oU7fesRq0EfxK6JmKTa650l6h
         ZJqYkD9ciUtqcbbwVe7wnmGHPbAUCSiBMXQc4E8o2u/SCPY+VRSOq0LdxxpLSZ+gmV1J
         nA/2fiAQZzArI1ougRAsb8BzygRCOm9jdka8T8Ye1fC7doW+1BqHkbdHRedqmsvaxXAj
         TFd3p/MM3oGm6d5pSW088fyDdTT7FFEmZ0nsjQyIkJxk7gPLgGW5M8QUCFbJ0cnOCcue
         EO0rjbYkKbh+xVXwcRxI79Vc6W830iMV4fMfiHDAzdZJuoBKCSCtw/zQI2aD8jhv03bm
         gr8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxIHVQo4AVxDd0IeGr432AytWOXgOgHAWRZ2sSlfKBUh7YlbGodwqXvHqEWNtMEwCQmLiVG9I6HsEDRP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVvH2LwWDJgjrvsfKRvELcXumkfl376hU0eNsPfPjsQYEHMkox
	9duqNgvqSAo4f1Nn5527Ptu5BP3lJDBkURKoYuV5Mnvbr2U7yiWD+aEDKL0AgkVOizo=
X-Gm-Gg: ASbGncsJfdTQgR6r0CZQRILACmBvS+3oJFhokNaiMiddx9Lq7b7JeXePPJn+m5y+Erc
	VGLxeNMU8HigCg8PhMcv2EN3ycTnvoJj10qARVRE+Ef3/esESTy0mUfkjxrgMgyF/fo5sxcyks+
	jRW2mEe2WhfQJBHIofFOxutgqJ8AF7fdQuJGt4c2lZx6kW6NS0/iRVZqH1JCbKMgACSY/sXrd9w
	yR/BwSYEDQcWGtRXoIXogM80zUswV6MhDsjZyXw1pPlCysssHM8enXI1ECC6rTuXTvhZtdDjF6P
	PSu1tmD8dAd8zJq1iKKoRpTwPJo/ar5+6l220a6vnjCsEBGUhWUUlLOSsyXrdYDujOdlVbOK13Y
	z04vtNO2COu3oLQGA0zewke1J7WI=
X-Google-Smtp-Source: AGHT+IGuDdROqzATGDzK/jjhYn6/52Bbjegw9C/PQ/dD8jHjdp0OUR+ym1KT/jZkS4osD3Mqe91lug==
X-Received: by 2002:a05:6000:40ca:b0:3a4:eec5:443d with SMTP id ffacd0b85a97d-3a51d961c87mr1297240f8f.29.1749025438742;
        Wed, 04 Jun 2025 01:23:58 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe2b35dsm20745556f8f.0.2025.06.04.01.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 01:23:58 -0700 (PDT)
Message-ID: <c751b9f0-836f-4151-9ad5-82cf4c282a2b@linaro.org>
Date: Wed, 4 Jun 2025 09:23:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/8] soc: qcom: geni-se: Enable QUPs on SA8255p
 Qualcomm platforms
To: Praveen Talari <quic_ptalari@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
 quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
 quic_mnaresh@quicinc.com, quic_shazhuss@quicinc.com
References: <20250506180232.1299-1-quic_ptalari@quicinc.com>
 <VgXAbpS__r4C24FLFz5nqCPgygil3nr3-oNHbL7bQxE0X1GnDStFaWlnts8iSxCeG6TCqa8mzIFqOysqIlWeJg==@protonmail.internalid>
 <20250506180232.1299-4-quic_ptalari@quicinc.com>
 <e6517c54-9163-48d1-80c2-4fd964dac349@linaro.org>
 <pQ70_lZWsA1PB1GdnrxpeWdiDKvQsWaSYURfGNHMENN7uqR7u-OFSZA04GvqAVOu2QiaAaRniqL0kpOznBajGA==@protonmail.internalid>
 <85ba8e7b-a1a5-4f70-9660-bb78e7169acc@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <85ba8e7b-a1a5-4f70-9660-bb78e7169acc@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/2025 08:28, Praveen Talari wrote:
> should i keep condition before assign num_clks to wrapper->num_clks as
> below right?
> 
> if(desc->num_clks > MAX_CLKS){
> {
>    	return dev_err_probe(dev, " to many clocks defined in descriptor:%u
> (max allowed: %u)\n", desc->num_clks, MAX_CLKS);
> }

Its up to you if you think this check is justified and/or necessary but, 
if you decide you want it then it should be an error if the specified 
size exceeds your defined MAX.

---
bod
