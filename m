Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C353254869
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 12:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746188312; cv=none; b=XXz2t7fB9GIKiM++57M9xZJhKLW5YObtGRLepnPRtf+DJOZo3d+N4eDir6vX35hxac5WgRmfWCk6wrjPuTwtSyiR1A08/owroALbQdNDux1Lgef+Rx+HbkIy4XFohCg3yOhxibVntCuElS3mUxrEqENt1Z7couoxgziAaas3o0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746188312; c=relaxed/simple;
	bh=dZCp33kBN0Q18ikutt/A4Xr4aDmA70Q3LWkZ9y/t/yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sBsG46WK4lssmuVKgHy0FHVREL0Ewop30v+c5dsSL30spXRRXpQX2DNKZjZ8lAZdXbgd0KVFEMgys008eRMjf4xno1lJj/TXRTR2mPQMV6Gwr1mbj80copezvwXRvzJGtnih8bH735YccG8z3MIOkEqjVm4GCO7WtorCMlDXkkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qI2hsB/o; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qI2hsB/o"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf257158fso9772255e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 05:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746188308; x=1746793108; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1N8+l8M5FlFCClqgtiCzmH9ZrH4j2YuHePm47Kqoteo=;
        b=qI2hsB/owjtJ6nLSlxkQxnGQmRi4NX6iLVXPpX7HAJVRuPqdCH5zYeeUuezhOqFNOU
         yn1FNfqV9phQ4y7U9zZnJ8qKbURYJyA807LID0Lu1LV3eh3xJmO2yWD4D1CGmKiR0+th
         J9SBn/uwW2Wq1NJ/YVyTH0wtPFh84GTCXpeMzKNdlhyeM3yOPRArAhjod8CiIWvIzb7K
         mO2iYMqDiaaD4kNfHkeWnGbwJtdatcfBJk5AmWzDoKJZdgYzeGfYBdlMGYcvQm0OSxIT
         1VTP6J65Ap/YJBwLY7OmOVtLoVqp0ooST6kN7Z0DmHaax5xVFme0ORi0MCkWT26LFAlX
         hzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746188308; x=1746793108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1N8+l8M5FlFCClqgtiCzmH9ZrH4j2YuHePm47Kqoteo=;
        b=r1Crn7TQLDQ/b+StRyyEFWebmXGlSgzkde7e9waVcjaSRk0jhgSKXMUFA364lVqwir
         hW9CLGIi+PjpEOs7M17h+ECjMlz+TLWQVKLM8Wglzf5UlF9qEpo4bBeL6yfMNaFjJAc6
         uPoRbZ0RT6ALPkUJKcJphfRfhuzvr9+c5Qc6rS+WHYQVGh646mq+NMPoDaEV7bOyqDBR
         xRhLD6rcZQ6pU/aR9JK6d1ODoAjwH9osWCfC2tTxxz+qAiCzwE71W2t3rLspeBvLEnNF
         j8mVt9KtJ4ADVTT49WBRR0UQ76tFQ4OTEBp6H8V2+9qSBhJOjjaJD1uvM8V8B1Oo4sIb
         Hppg==
X-Forwarded-Encrypted: i=1; AJvYcCXRfSL6r+Nxj/GwpdKO3aYwIy6b/suif8DXJ148FsQY+BBDPeHacL2Qrvq12T/dkIpdRletiE9+BbGWQLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvvtTCeZbxt4Ha0i2XEU9TdCNwEX6ZSejNYkznNHg2wPjz9qZX
	r3l9HiAa9X/n+n1TiFNEKQBS2oBNo2hLFIsHJU6Qx96HJkh2gIFfx6zMTK9ynwA=
X-Gm-Gg: ASbGncvubJGfAp2ze0Lu3eJ7tjWhLyu61e0oR+sJjmXls7Ax5y4FpyYwWt45Lu/V/Tv
	OnbTsbp00+uHGebdMyP0PP3RC1Nm+LW36/YHKwY/TItts4dLmpLl6h9yXNsPcGKOtxKVmNp+PEo
	ZUWBffnKeMxDKhpQVSer/k/7FrFcDDhdq9SmrIvFWDukXQcfHrwXesJfJ55cZ9qQ5A6mtlzQ7gI
	vrWKcQZnd/kAFJh49J1uCi9HlRBl+b9s9uNhHs9rXdkHGmoD058+5WS/CiD+lYf/zq7rRC+4hUZ
	vyea8WQC3G3qPUUme+oyd7DmPEvAP0RG+u6gcDhffeGfHmrdK7Us0nBR35NJDBd70+Dahf9iK1M
	leI39FQ==
X-Google-Smtp-Source: AGHT+IGycLOTZlvkotfi5COKFzd3MV/rJ1at7iSHEF0LrJp3NZNcKFI4IZK6OMtutAW7B+8/HT8hNg==
X-Received: by 2002:a05:6000:2501:b0:391:3b11:d604 with SMTP id ffacd0b85a97d-3a099af0f94mr2000619f8f.54.1746188308640;
        Fri, 02 May 2025 05:18:28 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0c3dsm2071414f8f.12.2025.05.02.05.18.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 05:18:28 -0700 (PDT)
Message-ID: <0c09f19b-dbf6-401b-bf4a-8e416487a34b@linaro.org>
Date: Fri, 2 May 2025 13:18:26 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/23] media: iris: Avoid updating frame size to
 firmware during reconfig
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org,
 20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com, stable@vger.kernel.org
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-3-552158a10a7d@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-3-552158a10a7d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2025 20:13, Dikshita Agarwal wrote:
> During reconfig, the firmware sends the resolution aligned to 8 bytes.
> If the driver sends the same resolution back to the firmware the resolution
> will be aligned to 16 bytes not 8.
My question here is why there's an alignment mismatch between the APSS 
and firmware at all ?

---
bod
