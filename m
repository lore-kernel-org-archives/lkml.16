Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4F5269806
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745843948; cv=none; b=oxinDuX3dWCkisfydndUvktFY3OOthypxEDfLz+5EphmE7BeGYOknWEvct+obc9tH3t/hkZuUldzNr+m3cSnXmDV1IRt8VtiQBwqGn20Ii70lYui4d5hXu+MSvdVFHzVA64rjXDfrHDmDkmIGhXeQvVb4VcHkfb8rfe3mE61E54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745843948; c=relaxed/simple;
	bh=5RTpoGxd0yln+rD+iVZT7mTbh5dja30gF/VvmJMuPCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VM2q8atUlsPyfywIz9Vj6ZoCX9BBbygwWDw5+7B5FfRYHcNVenfKwuNtdZfKOPd7BKuaATuZC08aCtcOxqPMzVdHLULP2bWt1Ox50XuP/S9J2bNqKdl+PTFgwiQ0BpgtA6rP980VLcYXl5MQCrYPU5WNOic94Zo88gg6T1OrEyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U/dOVDX9; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U/dOVDX9"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso3276021f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 05:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745843943; x=1746448743; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kajF+eLdT9ofXGeTd3YYf3HoPa+dzTPyEOJzZGW/Z3k=;
        b=U/dOVDX90X61jKy2N4cTdr2CnkzS3Dy9WHu8I7fD9N38vjtdThOlxKgPVAXJUzQslK
         E13uqbf4sX96mtBHnTxX1SRf0flQ0YWr9upe+IgvnkLYM9PyqKOVGlDgYyuio/EShr0l
         jH0s7pz2iYR09N5niQDUvKtmG3f+tawBTErbuQTM4h+YTtnM/+/DWf+TXoT1FcJbnLoH
         ltitcxRSY7eK6lT9vS21llzRSo05eYE4/4C6+a9uOZkqXrMcaWv1sso9W6IxToh74FHI
         Q5Db0MhSB7pYQI9xMOspOgkSI86h9/6kZBcHBk1gy6pzUKJoOIvF76bVRupCjeYcDumL
         jQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745843943; x=1746448743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kajF+eLdT9ofXGeTd3YYf3HoPa+dzTPyEOJzZGW/Z3k=;
        b=gYw1OTT4JkXuYcYHbiVPt0R8ktoyUHnW4EBoNmNmne36CxFOeyk3BV8LezNhxrUEq8
         HZLmXim5EU73NzOiMuWJf5yQTCOsOKQFJpHoGcfSLJ9bLyRacymv2zz7nvOa/14CC41/
         rIuSWw9EU4pWspZyP74WCeOwcDO6chOBJxrF7salhToX/K95pFv+oOzX/IDxK8F1yQe7
         XOMFFsmXlfMkdVaGZxJUvreYu3+4Cty9SMhEM5FMaIV1FP6utj+CfSVK74r9Zod76vzI
         koGdQVXL3Ko0E1DORbZSNJEfKPXbeRrxMgLLuiDe3//K2I0UcxjIm6ZP0+wqLHGWu+K6
         U9ig==
X-Forwarded-Encrypted: i=1; AJvYcCV6oXbSEqXluhbnT8V0E7tF6EbAS+kn/b0dBL+vt3BORF0ELNP/CnS1bxd8SBNslN0cB6hE+uQBPQPWQWw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2/45/5uFlJlzEyKzdsaWqO2o3BzCHFhBFXwLImMIEdU2kUVVT
	cX70Um/wpxFjuHvoQi9lPSqUOx1conooMUdcdEn4OoDs5lxOQLtoLtusT02tX0w=
X-Gm-Gg: ASbGncvutqouhwL7/W6ibYitN4Z7f9htOZTMGSdcl+d+OyCzwjhkLjh7bk+AeZGwB4z
	b1eagJyDGx/eC5wnqb65nMJpBAEgJtB4xq83v8VsRmzTgyKJoNpecZyY+wqYPExwgNka+L9iq6/
	QjrRyHQueo8hr+/WijORqo7Z+J2zED4GxRfXqJRznadmaI7WYyFlq2cDBW01k+XBnHOM05RPu+K
	1zjD2Q4ZPzHOxvfDD76ebO6xpkpWUzJSxyJfCrsSm2isADqgTTyTPZOf8kxiQNJPcEU/bTCSW89
	wV3nti+SBrkwULs2czVrYUobU5bSaswMMGITxqqCj+/+ow==
X-Google-Smtp-Source: AGHT+IEZDN+foaMYfgyt9eU6rOly8IkdyLaoYyUZbXxe0vM6gzcu4bTy/soXgGRLxAd0ZxJ3sOA5TQ==
X-Received: by 2002:a05:6000:1a88:b0:39c:1258:2dc9 with SMTP id ffacd0b85a97d-3a074fa73c6mr7995850f8f.58.1745843943130;
        Mon, 28 Apr 2025 05:39:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073e5cffasm11177664f8f.96.2025.04.28.05.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 05:39:02 -0700 (PDT)
Date: Mon, 28 Apr 2025 15:38:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org,
	20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 14/23] media: iris: Fix NULL pointer dereference
Message-ID: <02824759-c468-4907-b0cd-554c28cc4de1@stanley.mountain>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
 <20250428-qcom-iris-hevc-vp9-v2-14-3a6013ecb8a5@quicinc.com>
 <7f37ec27-0221-4bb2-91f9-182244014b5a@stanley.mountain>
 <7ef2daa2-a6fa-2285-6619-b2f25baabc55@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ef2daa2-a6fa-2285-6619-b2f25baabc55@quicinc.com>

On Mon, Apr 28, 2025 at 05:40:01PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 4/28/2025 3:10 PM, Dan Carpenter wrote:
> > On Mon, Apr 28, 2025 at 02:59:02PM +0530, Dikshita Agarwal wrote:
> >> A warning reported by smatch indicated a possible null pointer
> >> dereference where one of the arguments to API
> >> "iris_hfi_gen2_handle_system_error" could sometimes be null.
> >>
> >> To fix this, add a check to validate that the argument passed is not
> >> null before accessing its members.
> >>
> >> Cc: stable@vger.kernel.org
> >> Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
> >> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> >> Closes: https://lore.kernel.org/linux-media/634cc9b8-f099-4b54-8556-d879fb2b5169@stanley.mountain/
> >> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> >> ---
> >>  drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> >> index 1ed798d31a3f..cba71b5db943 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> >> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> >> @@ -267,7 +267,8 @@ static int iris_hfi_gen2_handle_system_error(struct iris_core *core,
> >>  {
> >>  	struct iris_inst *instance;
> >>  
> >> -	dev_err(core->dev, "received system error of type %#x\n", pkt->type);
> >> +	if (pkt)
> >> +		dev_err(core->dev, "received system error of type %#x\n", pkt->type);
> > 
> > I feel like it would be better to do:
> > 
> > 	dev_err(core->dev, "received system error of type %#x\n", pkt ? pkt->type: -1);
> we don't need to print anything if pkt is NULL.

Okay, fine by me then.

regards,
dan carpenter

