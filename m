Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0FA2641EA
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747731527; cv=none; b=DuKHU/UQnTjGIvT0k2TYQ2Ed2lhK4eO8yn+boT43wTIKW0nerBEYi7uWuG19kBirFyUHAfeXWRRsaByYEtHG1aR2LK/mTqplaCO9l92jdQksW2+zGXMnNE7grwrDVMlzg1tfPOp0ncOd/3iN0+dP8R9OTcsGpJ8OmHnPEWKquqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747731527; c=relaxed/simple;
	bh=bf1OCOCLNBzUIvvt1b9haLd3ttKbEV0f9ypFDGx5gx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pv9XAefWCA0WP8+U+K2k4XWvBEbhypYqwWbEVzK4TfYF/eTKJuOFojvIuTK0w/TDdpJD/O1HS1HKC68B93ZYGVXsqgcUfkSvdqYK8JOP2PTClF8SOJsqyyQ+xCcNIUlpremTFTrFpI33jfC+3wmGmsQFtZ+cswiCJLrkBSxjlOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fP0CrRiG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fP0CrRiG"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-442ea341570so35998935e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 01:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747731524; x=1748336324; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3RowTrq8qqAN+7p9l0+ggeiDpMOLuzD/RTIdH6EbWgw=;
        b=fP0CrRiGfy/KfjVA1W0JVF5qMwNJbxIROkE5EJfH8uEZtzRB+LimLdUnW8UA/eZc7L
         mKyh1Up1dIb5yxk2XO854tknHa+dr4Ghx9CO3Xmn2Db0xMjvxWJfi+8bdJ3c422QkXRQ
         r6gavbWEGzwt2IEi/OCq0IZM7eVWI8tCN6KMG91Aeme3koit/lud5GZVbKEYbZu8xoEZ
         lugPP69ThHxQFTaw/OKJt6xrYaTANCmZ0hMKYstAOn//GbSQdmM5NcBRCNXSv8+IYvfv
         WxeGCb5pYDHOcGGSV7Fn9l806lg9Lf38hsLSPiQDX+tfmPd03aASJP4mLsJR2gmcSNap
         u82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747731524; x=1748336324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3RowTrq8qqAN+7p9l0+ggeiDpMOLuzD/RTIdH6EbWgw=;
        b=J0txZa/a0AUDKzblQ/yrnrk+jH14x1Yyg/EVHOnpTkM3XmYxICLf4kzVBMep44sCOq
         lEQ+FbEzBe85+de6jkJtxlc/P314Osu/JMCSJD1D7Ct2VFbXASsZeiOMIdhfy28fOso2
         dbstvNPJl7GJ13MIt/0JRgP+Ds7ojeA2GCmjCbUkI3m2S8eYYPrzIbkEPWOrmF0BAG6E
         ty4akcp66nZPnlq5wQ48dNQKBdOTeH3fLhpGE2gbDA0/HAIUoNoWJ3wNQuSZCaQHaWUx
         lYAOg4SHybhR+H8IFQZ3Zj601Yh+lBPFVunpTy2xfd56nLIVkN16NycEnLjJ4hAMO51O
         gDlA==
X-Forwarded-Encrypted: i=1; AJvYcCWie52VVc0w82P6OehNBZ2IHsZTo6zGbEldeIR4IAi1lYy42tPjdNOE49JWQJ6d3N/ry2DB0WzcAuQL7Y4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2pgHE7PKb5azkfx8a68pzeNjO7XcxJBQ5wNSDC60EM48vTt7U
	MWYfXsdgubioFWjyOBN9R5rAgngmUZ2Aq5Zi8jEaiPKZk7pN6XV/0z16+wrIw8z6knk=
X-Gm-Gg: ASbGncsdW0u4fubG6pc4Q4bdgAKiun0RLJ6SZ06U7MWMLfcvXONaWQFPvCH/8lPSpew
	W4r4Ad7Pw8NE7jC7H++Fpp2/TZ0alhSxMX5Z3rafKC0FoizmqmKZIzb9deEgZ340sYPUmcawmND
	8x835rBe5n3RvjmDNIMVf05CmHoKjjU6493CF7uwLzSikPex6oDesi8Msz46UypBncX2vlMLgCR
	yXe/NWhZacgCRxLQvFLPOyr5P0al1nEvWAKvn0JxjMjop4JpazhOToNaCmPaF89TsT6grryqHTg
	tTV94z/ZAyJGSHyk8KrxnfYs7D1z4vUjh9aVafOE6/1pZ3B8jChnAVf97yTIKkEREFrNAu8khR7
	Ibnbob9gZSpthQnxB
X-Google-Smtp-Source: AGHT+IFz0Xb7M39rJRyATRi01d+v5QadYL69KQG7LA90wBt+cqRBDROhOesZhB1/XwCIaVYshGfR6w==
X-Received: by 2002:a05:600c:4e0f:b0:43d:649:4e50 with SMTP id 5b1f17b1804b1-442feff05c2mr142923525e9.13.1747731524052;
        Tue, 20 May 2025 01:58:44 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef0b20sm22912905e9.14.2025.05.20.01.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 01:58:43 -0700 (PDT)
Message-ID: <4495a6a7-7b43-4c22-a415-55b346528a7d@linaro.org>
Date: Tue, 20 May 2025 09:58:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe: Stop spamming logs with
 version
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Johan Hovold <johan@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
 <aBHQejn_ksLyyUm1@hovoldconsulting.com>
 <3e34ce09-1207-4dba-bff8-38c01cad9b78@linaro.org>
 <4d942a6c-cbff-41ac-af8b-12a1ff5181aa@linaro.org>
 <883eb54a-fcaf-443c-a4d7-e1278fd43f5a@linaro.org>
 <ea9f570c-b135-4a98-91ea-ceeb2f48a0e5@linaro.org>
 <aCw09Vci12txhYj-@hovoldconsulting.com>
 <190100e7-8a59-4cf3-8434-bcb6292cacb2@linaro.org>
 <aCw78CRda6VS6ost@hovoldconsulting.com>
 <8a2f2269-d07f-42b2-ab6c-dcff30a1f431@linaro.org>
 <f4de3ab5-b40a-4d87-916b-8d1a1fb607b2@linaro.org>
 <d81de587-7452-4fa1-836e-9e30b6d63c57@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d81de587-7452-4fa1-836e-9e30b6d63c57@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/05/2025 09:51, Krzysztof Kozlowski wrote:
>           qcom-camss ac5a000.camss: VFE:0 HW Version = 1.2.2
>           qcom-camss ac5a000.camss: VFE:1 HW Version = 1.2.2
>           qcom-camss ac5a000.camss: VFE:2 HW Version = 1.2.2
>           qcom-camss ac5a000.camss: VFE:3 HW Version = 1.2.2
>           qcom-camss ac5a000.camss: VFE:4 HW Version = 1.3.0
>           qcom-camss ac5a000.camss: VFE:5 HW Version = 1.3.0
>           qcom-camss ac5a000.camss: VFE:6 HW Version = 1.3.0
>           qcom-camss ac5a000.camss: VFE:7 HW Version = 1.3.0

This prints the hardware version of eight distinct hardware blocks VFE 
index increases.

TBH I still find this useful when debugging hardware.

My personal preference is to print it once on boot and skip subsequent. 
Which I think is perfectly reasonable for DEBUG scenario.

---
bod
