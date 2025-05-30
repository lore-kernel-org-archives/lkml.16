Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC7D2192EF
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 08:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748594134; cv=none; b=knv4sXELcWDQD5nKQsUVmsLQTXUFvVytCBWa0tDgzOBUbBBGnXQxH6h0HQFm3+b3Ke4lZEItvgrWTECrhAudhV0/g15mGT7ZQ9NfAWQs6pQ91iurJmIn3xf6N4yjTUkJo0AEv8E8VLSQ2x18AhRtfEQwR6kJqXgwfkg4UH+jj/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748594134; c=relaxed/simple;
	bh=h33LQrSnZ+i8qVEFwmpF+DBn7mv4bG9TT0CnxcqbDcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QbUrAuDRpEBoTrgVJu+gQKAi43YrrUDL90zIUv97tIXsBWfPD04VU3f3kaH3fM0wNfk+Jrh7CDUcVzXvd6B1qJCHA/eF7l32zp1wkcFiass8pAweerkgRgjGoGSvJdCrQVW6cp+0uQbUQsTKpipDTuiNAjJQhOJsEPoMNN6M2mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aYM3JQng; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aYM3JQng"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf257158fso13176645e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 01:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748594131; x=1749198931; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YLQbWS2tM1c5F0xZTSwzJwZIihpwvcGvimBEFrvn6y4=;
        b=aYM3JQng0blGw3SmaQI5JmljMBday+4uJAlvvlTqIlSYT851VrQDqpofaGRYsEmrTk
         92HsXvbpqk5Q/t+TvX1rT5lNNxLwnPPmFIp/BHhDqf1Oi44ZGVaJUXTrTpI/FitO+Qmy
         K1PYALKE1wwn6Gk8bxvCOPxDUEp/fsM2AIOd0rPzbpvvGIetIHA0WMIK/DmLkNTZQCkg
         YyPg30fFCD4ZPA+eSDK2BV0ZopWlDhwohe4FhV7av+AZMq391q2U5+y6b/oqoYqA9Et3
         H/42pOp05GjQ4e9CUixM4tIGuRObzCAuXxnPj7qAQHrLnUTzdnEEUoy2j3qSnXsYMDmG
         7YDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748594131; x=1749198931;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YLQbWS2tM1c5F0xZTSwzJwZIihpwvcGvimBEFrvn6y4=;
        b=DzZtDXsnFVBcL+ymTq3tIILLqYI2uUjNACeyKwjvtRtCbpIrI+sAfKgAjN2fN+Y/5l
         y1rbg4BawI15Pgv0sehRZC1VVv/38O9gzxCCjN11HBllXROaRGiql8qy8W2iFFOEL/52
         HkMB0WIr6MyPmVhFYF1xP/La60EWgJOytKxJ+CYKrTYJrtJwyjZrDfmf8aQHJNJqZmsx
         x34Dj044Yt8AbYyxtVzVGodJQyHGEsHpmi4v700W6ql5KbJhNV8hev7nQkZIb6pEyBcY
         X/STpmhEq+TkMvg02fgNK0wbYsTkJqJJQSbauPicRhSlnoq7tN3QuEd+c9WqbJ9vxTFh
         BvPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb+KQUZ/dUW+lo52me/VDier0K4Dv/hw2Ti5vBoXFcnxalU1lskZdbbvXnN0Gl7iWGPUV+Cn3RO+gmnoE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkXQ3qPB91A099e5JV9hXNFj7CWMzsgpG7rZ3W0YkTEdldYkLy
	8tmWSk0mFV9P0Q1fxpkuYhCbzEl0zPodoD9PlLx402Pkby8z20U4nIM6gRfAOD9rGmw=
X-Gm-Gg: ASbGncsrmokpBQ32tP9+pXB1UrmkVVUJPWcr85P2UMkmVUG7G5ZzwKvXN8RSN5len52
	aGrLF6Ivj/mMhykfRQqAwaSoeTLvsscW7AYc5kmxg2WhGhirl3hMMGiY9VoNB+6wjFRJ1SDHKQS
	Riuzg/UZwNiq1Lv7c/Yuq0x6sy5iZu9YmAMNaSw5CExTxVcN25WsAOnXOqb2dDrtavP9I4iWuCy
	iSM1b7DD7V9ZBaiSgkxplOxA0IWu59Hrd28Eaw31Gu2PA9V665PN6navVFKk6a8CA3+rejkUQG1
	Db2+UsKolz4M6nBKPbR7oq8/epD0sUkenRZJlOOfkoJWs8+rjDQ3DVLqXYL8Q05/fXQ1NbiVq8y
	6vN7RZF8lLpnsjVoZ
X-Google-Smtp-Source: AGHT+IHehfnKYCHEwgQg2UA1/7tKSJAulXBmZ2VniP+tL7uxdRKGux7eY9b2KcvJXyj56PkW8C6bfA==
X-Received: by 2002:a05:600c:45d0:b0:43d:26e3:f2f6 with SMTP id 5b1f17b1804b1-450d882b456mr9757105e9.5.1748594130712;
        Fri, 30 May 2025 01:35:30 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb80e9sm11450035e9.27.2025.05.30.01.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 01:35:30 -0700 (PDT)
Message-ID: <e8f3386b-de5b-447f-af7d-5f521662ba31@linaro.org>
Date: Fri, 30 May 2025 09:35:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] usb: typec: ucsi_glink: Add UCSI quirk for
 X1E80100 platform
To: fenglin.wu@oss.qualcomm.com, Sebastian Reichel <sre@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
 David Collins <david.collins@oss.qualcomm.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 kernel@oss.qualcomm.com, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <grJaz_699sNeLfZ0Kp0u8e13em1Y1VWTlH3dSqSpQE_mHdD7iVKUwHkrvjZ74i3nDzn9c5_Hwg-8IAW40N1iPA==@protonmail.internalid>
 <20250530-qcom_battmgr_update-v2-7-9e377193a656@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250530-qcom_battmgr_update-v2-7-9e377193a656@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/05/2025 08:35, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> Currently, the Qualcomm X1E80100 is treated as a fallback of SM8550
> in pmic-glink support. However, the battmgr driver, which uses the
> same pmic-glink compatible strings, has implemented charge control
> functionality differently between SM8550 and X1E80100. As a result,
> X1E80100 is no longer a fallback of SM8550 in pmic-glink support.
> 
> Therefore, add match data for X1E80100 separately in ucsi_glink driver
> but keep the UCSI quirk the same as SM8550.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

Small suggestion for your commit log.

Call out _which_ commit makes that change.

---
bod
