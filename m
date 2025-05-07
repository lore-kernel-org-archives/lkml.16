Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FCE2874E7
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746630573; cv=none; b=tBvIYv2kkzj0PpdCGnauRhucqqozFhnJ1z2HBCpTY89ULb70akgvDUv3Eij36QTqAZc/QCv1S6m4g6qoXGz4y6bGb6DW28xF/9UPmjmAOgF6n5Grc6mS9Vxgq5kL5SlVDCnT4u426uYDrAeHJOKEBDPtkRVcA0RdioHihOi8/z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746630573; c=relaxed/simple;
	bh=rGwdD2sL/1x9KvXY/1Ekk6DKMc0m0UXZv2Ekf1BRjnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nwV5mcOsu7aRjagqJ6Udm2cPEwh2idnV4DQaC7nl848cblt/8mGlXwvmo/BDDlRV1RGp5PoANL/7wpmrKhDlGGbiGbEPODmv3Xga1/OAol8Vp8k2N6cqMP9hqoNyr4RuiB7U04p3fEy7SDfyQYlYANFLdfU2c0CVggt6zc/13Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ix9Caeri; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ix9Caeri"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so48433235e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 08:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746630570; x=1747235370; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gnGxO/UH5ZtoslCnotoWi6A0EHXwJ/OCE7nrpX3PLMY=;
        b=Ix9CaeriSAx19CJBPP6Jzx4tLiQ/f0K6bJWuJ1/35K96Gij1Eu2F9xtHSHMlk36vKQ
         GbZovms3ag/1WgKXTP/PMl4ktqPLekLPk711syDUf5IZDrYLMlitu7o4LCH9q5QhgLkD
         SLHQbHtEY/Q8kr9yhA1n66oz1y7URjFEIeMc2oebaE3imddo+d1AxbQLZ6SnYIq90cBZ
         bnCOVlT9zsDJSnoTz5GRZH4ZSKly9GsF2ZWca51/+BsMBVc39XmhlTeWNFIC+Wpe6147
         IxfAmWFIrxWiTKzYEFxiVhRG53kxHE19Hd4GMM+78gt2piVg+PB6sqHGvdxMuImV3Lcn
         KEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746630570; x=1747235370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gnGxO/UH5ZtoslCnotoWi6A0EHXwJ/OCE7nrpX3PLMY=;
        b=kjjRjGfPTSbCbiH5teokNY1Gl9yvutrd1JZIRP6QqxPVQmT88WMlXZaeQZ3XW7yEPT
         VcFK3HGPIwpNFJSAIb1vd8z3dYeBw5UcACEcwMRCI062BeAnsQbg5h+HnFI0OEqtO2S7
         +E8usRf8FCDQS3t509A379n663iSxLnLVO5jqjTY5RMxWIxHqgjUfA81oWV7iS6RCNOt
         xQLxSbc1V3/bO/UBN1ecjW3zFKRGJ47TN8yUZ7z7AbKXsTgAL0J2WSZpPxhar++XUgYG
         GNjgNQdWezbWkgoUFZ9nKhKHgKsNaEmwGnt7W/fOUl/1eQN+OwCRk0GscX0iMPxs++gn
         qduA==
X-Forwarded-Encrypted: i=1; AJvYcCW1SsZZ4yaSIiaBd7NDWx+veWcQxZc/oTi0/L4nlY2RCpVE9hPQoDnIKXEaSSSpOkZgEECuMhWwvvE6q2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSDY1e6Rhj4uda10fWCrmPBgFN+87Unsbmsdfw6YaKqdLfO3tj
	/qEylWg6HCh8nz0tZz/MxWQprQXRYJ2N3OxMF6TyfYOrPOopG1i+Co5FoMWgdIg=
X-Gm-Gg: ASbGncuNaRl2BYagwA/yT+TWv/k0GzNj3I6JCxi5JL3//3Ir+cbwvcq13GanTjkhG90
	gXN2bzjRw9xSThEv0e36xih7OaCTBiJUqnswF7rIWhJfsJyepGaQo2jqVuWZq/V4UliPZakufpA
	oJ3zRkDFnZ4tp/fMzvuzXsIayU7+DIlbsBg6BKwM+iLxbqH2flI86ozRyvXiHKyPdg3bG4W/dWP
	Z35D9YhuMyqeupuPE4qkrkB2t3nEJaLgIjxGKEl5sjsEm8DGJLWMBbZeKWoz5DzCpHV+zmlWRpM
	4xH0lDM4rHafi+KOiSS3kegJrR95qPD3cUVLap4/nsgZncTxlGCKFUrBvscDK1o7dm4XnOt07Wc
	hQXSegQ==
X-Google-Smtp-Source: AGHT+IFdOXDNLQbnntxisuU2JZEe9tB63IzkZJVxK0ls3MwqsOC6APZxiRH/YqCeXjmchonVq6rCWA==
X-Received: by 2002:a05:600c:1f1b:b0:43c:f597:d589 with SMTP id 5b1f17b1804b1-441d44e07bbmr32485765e9.27.1746630569703;
        Wed, 07 May 2025 08:09:29 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b1702dsm16875169f8f.88.2025.05.07.08.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 08:09:29 -0700 (PDT)
Message-ID: <bcc8251a-3bad-4eaa-8dc8-cc63619a6365@linaro.org>
Date: Wed, 7 May 2025 16:09:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/25] media: iris: Avoid updating frame size to
 firmware during reconfig
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org
References: <20250507-video-iris-hevc-vp9-v4-0-58db3660ac61@quicinc.com>
 <20250507-video-iris-hevc-vp9-v4-3-58db3660ac61@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250507-video-iris-hevc-vp9-v4-3-58db3660ac61@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2025 08:39, Dikshita Agarwal wrote:
> During reconfig, the firmware sends the resolution aligned to 8 bytes.
> If the driver sends the same resolution back to the firmware the resolution
> will be aligned to 16 bytes not 8.
> 
> The alignment mismatch would then subsequently cause the firmware to
> send another redundant sequence change event.
> 
> Fix this by not setting the resolution property during reconfig.
> 
> Cc: stable@vger.kernel.org
> Fixes: 3a19d7b9e08b ("media: iris: implement set properties to firmware during streamon")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
