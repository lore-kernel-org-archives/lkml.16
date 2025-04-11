Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EBC238C25
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744371000; cv=none; b=YCd+p9J4ZUZuuawYMQEd24xgqEqdxL1DkFCq4Z+SHceGV3sOtA6LjAJwr/QE/Yatzr4dQFa9/YHdV8lyWHnMTkLWQ6TQK1sTdKgwe0l6Zw9kT5P6UBTJXlcaJGpUvWNOGHdmT63CDOT35IDoPFOP6klqW1zQNrp/czVZALxZs3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744371000; c=relaxed/simple;
	bh=ITobTNBm1Gc5v5V7gvduzfEIZJrc0D/tLtfm5cITmQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CLIaZNy15JHphbaooCoFkJx1qukhfga2B1+0NeWEYOl9y9VkWytNJ4Ig5+zPUkO4VPNT0+rUV0thgtSaSJ/8q8OgmSmOnBDg5vQi+Up25Ta8Q33qs3p7gdEpDf+Kns0xHOR0x9mPQQwrbIayqyI3Ww5utM8dPSJkr+WVGH8IDbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zc1P6Ea0; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zc1P6Ea0"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3913b539aabso1071221f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 04:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744370997; x=1744975797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OPqkV2HVldL4zhFmR5iYsDPH20L6kRmLSe3SyWadxe8=;
        b=zc1P6Ea0UhcjXdjcxTDCo01WrMFHgj6sTXijSS4j9BrdkEmIJllxi8uD93Wdz2yL2y
         J+O9vVmpD/8P+idr0yEXzKr1rYuXql2iTrmf+flIUKT6vpvn8nD5OaqgctjNG81icWpn
         QfWym6DED8aKxwWH3V5ETutUnpddVnI78ksjtHjro2nlcpWPdWjcjTPDId/GwrsDimPq
         PcoaMuhmCO9cXhqaE32tEMJO7HE7TOjbmcxTOC8IOdJwh3kuGxBsRz40jPZN4rHO8Gt+
         e8TXyheHtRi3Kb4PgE0WuzfPUXfsg4Sg2rkb4nsPQugweli3eMvtovnvOJMw1H1z5FAD
         GH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744370997; x=1744975797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OPqkV2HVldL4zhFmR5iYsDPH20L6kRmLSe3SyWadxe8=;
        b=dJ0LlFbpnLRSN6PIBDu/Pfzx4uWQbqdz69pn0DIxHqX/jJA9Kn7qOVbPWDyKnE4lry
         4Bfb3cBFUtUyMwCxDVVV82qydpb381pJmTDf9VNj0uLffZ23qcScYYa+MwbJPlTzYi/b
         4Z2OfFge9SoOR3eo+y/TJmvqklUffIA6gIuq4TfofmX+3Atu9OfinJ2wzC5p24UnLj3a
         dx1MTM5moEj79A+3Q7yPh1LkygpQG/yuPyL29bDnFKjCvrHqM7sWTf1xrxNQoOnBizcs
         lVevOu70M1zFo40Nx2vsLAouNd0pdF0wY3ep0zhk7LavueQu4KD0bP1X8SEAygKi7Hl1
         J/DQ==
X-Gm-Message-State: AOJu0Yz5MlMW+SHCvYk+rjaPxw2D3XoqU80RtpO/WkG5mEV1hICAj9Se
	vem6FsV4FHxGkgDtHnQ+XXroJM+Gz555Bjxxb3TmJhIB9R1KmOvprVrA0rXqvG8=
X-Gm-Gg: ASbGnctHkdk2otNe0ftWtOUyUe5Bxfa+u43T9cLu2LnUO+F94ve0FlXh+Q73iOa4fi3
	qv/RNjFg0wMvuLxtsRxOZ+YLLLaGvawu3ZS0HQYB3LvZY4eLAdy+DO2/wkmdLBqkcFIzxvbuzPx
	qE8W4HPHTI/Qg1tKhH+qU1VVoIAuL0pR92t42tU2Hcl7RcKne/fP0Z8g/rvwPR+h0cOjIbaeiU8
	Z3DPlYW2LXSfmPoN52cGzkJyXFSiYkT7FmMapt3Ch9fYr83XXnXBoxtZhHiQdxG2KNGFJtLBqG+
	FJtwEISn74kYxJCdyNHXD3A5xvUlSTYmNTQzq7r4DKFZe+e82f7RYhfKmzKxBVxGfsvCfnyjGM7
	AYzfNAXng2WtZmL8H
X-Google-Smtp-Source: AGHT+IG3/taatt+v25pIkOfJoKgD5wRRb35FWlNZ8G2ZXlKNOep1C2wahmiGGvzzfmex6GFbSNFb9g==
X-Received: by 2002:a05:6000:18a5:b0:39c:2692:4259 with SMTP id ffacd0b85a97d-39ea51f5a85mr1888827f8f.21.1744370996902;
        Fri, 11 Apr 2025 04:29:56 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f235a5ec3sm81423945e9.39.2025.04.11.04.29.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 04:29:56 -0700 (PDT)
Message-ID: <5f10d82a-904a-46ba-b0a2-b9f1c1d307c0@linaro.org>
Date: Fri, 11 Apr 2025 12:29:55 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v5 8/8] media: platform: qcom/iris: add sm8650 support
To: neil.armstrong@linaro.org, Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
 <20250410-topic-sm8x50-upstream-iris-catalog-v5-8-44a431574c25@linaro.org>
 <919203d2-cae2-4ed8-8144-8303d185d773@linaro.org>
 <8005927b-8a2a-4e7b-b317-8db29501510c@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <8005927b-8a2a-4e7b-b317-8db29501510c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2025 09:11, Neil Armstrong wrote:
>> This LGTM one thing is I think you should convert the sm8250 stuff 
>> into a corresponding iris_catalog_gen1.c
> 
> This is done in patch 1
> 
> Neil

True, patches 1 & 2 didn't hit my inbox.

Never mind.

---
bod
