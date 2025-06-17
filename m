Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B0F28AB1E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 06:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750140063; cv=none; b=s6Jw3Xho4Zoz2bAuLysfA6DZQjTdw5/I2e6Lymuy/ESQ1/ogN8hrqnHv0jhvx52tJ86T+gDbxAQ+BRP0SULkWpE7jQK91bd0uERE1gSPCkysCvBBa1mopMB5E5ezeH0U0ucu7zIEkyN/iwKaRnI5hWV5Qs4I0fvripNT8/+M02Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750140063; c=relaxed/simple;
	bh=yyo4zxa6ygCm2jtGfnAQ1q1FCeDbxttdenfVykbqXAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ok65IVTTJVrFlSnYWX3PZLRF21eF5oujYxCIKwcuKHS6Tw0K20DvjcMOb2FvHgOb77pBqfXkoMxXhWEdAOmGFJpa2/2rLNJO6v2gId12/bPlbbYlK9cqQ8AlarREFAm4LWh0NsJnyEgqqBjpOV6C0FUluLW5ArAb7IIBtZ25tL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hZRRVO0v; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hZRRVO0v"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4e575db1aso664437f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 23:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750140060; x=1750744860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3amWnYYOsSXKV1aGWt/S6iSzIIDj1ujFQXJkK0yqFPs=;
        b=hZRRVO0vDuLD3HYjNKpTONA9XdiOc6uPF3hnw6z3D46IbsG+mGs0bw4/SJWlH+0T9m
         iC0K0q9UbrmPXZFswIIs9cS7HnRrEe429GX++EgMsWI3NYlXU+0DgfhE4JLhk/qncPd8
         KZsfwI06eEpWuY0cxxLh8jUV2Zq/8B1CmPozglLhelGKJqCIPGGeWCSt6N/zWxItVeII
         uZXv6kGsLP1j5sxSv4vS5I0E6KHgDIhH59qrWQrFzC9i3SjVZJlVXf3z8zB4ygxmVSm9
         3K3oKrqHRcNCaCMpxPeK1KlWGy+SSyG9ozqIUG20QS8IRYK+Pv6BsiZ1LM2jP8RiNehw
         RqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750140060; x=1750744860;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3amWnYYOsSXKV1aGWt/S6iSzIIDj1ujFQXJkK0yqFPs=;
        b=VGWc9g3Zw1lLsYSZi9e+xEzkalu4FtfsnjFOdnvUQOwDjZ9VcIPLCCRul4N0xPgQKO
         H177DrRJD60cOeM+Hrzf6b6VIkllk+pujuG3dk214QnksTu+uNsk7/w+SYWp2g/x6+Bx
         ftpyCexOt3PfOJs5f/kM3ML/aiQGrWM97+WTzssNrvBJDPOoPWwgOym2dzmVU6iWDYTb
         2/FZ7lZV/GklE4/Fcho51GRqN/3cBzyNFLUAjj7sodJDrp9JnSj+GdUT572ykLlWzN3v
         KajgeA7CldLDo0YSjjNHzCHihhLzcjRBWoVgO4XKPBY0O6U+QW9ffv8ybuSYHNolSsUq
         KqxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbjPdwF2HvnFVU0aLrrhPHfi/I5RFG6BbQIdjQcpnpHPQn5Sj2ZH+9Hy52uTbuLn+cpGV0C2swyNLhzgI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+KuSfGnC3kkkEqukmDNBKPBSxjdZlzVcCl9B6dTCqg9CY6r4R
	DwCJ10/N9coTYZojKQvwIvwvkZd3edsTeBDW3nKe6iKJ8PKNrxusKDwbmbSgW5jp/QM=
X-Gm-Gg: ASbGncvdNkCCBvFWXTCCy2+WY/u/LhV++dITLKHc4IfYtHR9H+KbQtM6D9iyEGwzTOr
	JlR7LHH4iclZMRsoZF6+zLGA1G/9YkahtKJ3lvv/eol0jjn8rPuGx0wMjv0i0C1rK+oMjb+P1/J
	tw+MEsHX9tft836QUpC7nMqKXBUaTAXrMxLDY0eoyq4iSm70jBvAOQRtGMG3K9Q+FW6V0JxP69O
	C9le52HibG+kWu+PcIrdcwKfpXH4r4Xl7XUV58cIpw+IWkebZYI3f6JFYzW0p5/p1S0z1WZ+JYY
	ww5PpRGG2ZiJOzcZcixJLdmLXXiuof94ttVCHugKIIWkOUy0vQj5GAKfEjQI0ZGz8jrjamQSmbU
	HnLYTZPE=
X-Google-Smtp-Source: AGHT+IE6/ujC8RvWh5QEdjZlVKo5xpSWeWU7pqeFIYtGV6IlnzxpN1wOBsHwS+VTpsb7nAoRLJMnOw==
X-Received: by 2002:a05:6000:2701:b0:3a5:7991:fee with SMTP id ffacd0b85a97d-3a579911341mr1949524f8f.14.1750140059996;
        Mon, 16 Jun 2025 23:00:59 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b4ba58sm12860919f8f.84.2025.06.16.23.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 23:00:59 -0700 (PDT)
Message-ID: <f8222e9e-0c0a-477a-be10-a340fb5fa4dd@linaro.org>
Date: Tue, 17 Jun 2025 08:00:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom: qmp-combo: Add missing PLL (VCO) configuration
 on SM8750
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Melody Olvera <melody.olvera@oss.qualcomm.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250616062541.7167-2-krzysztof.kozlowski@linaro.org>
 <aFBNxvggJXYKQ4d1@vaman>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <aFBNxvggJXYKQ4d1@vaman>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/06/2025 19:00, Vinod Koul wrote:
> On 16-06-25, 08:25, Krzysztof Kozlowski wrote:
>> Add missing DP PHY status and VCO clock configuration registers to fix
>> configuring the VCO rate on SM8750.  Without proper VCO rate setting, it
>> works on after-reset half of rate which is not enough for DP over USB to
>> work as seen on logs:
>>
>>   [drm:msm_dp_ctrl_link_train_1_2] *ERROR* max v_level reached
>>   [drm:msm_dp_ctrl_link_train_1_2] *ERROR* link training #1 on phy 0 failed. ret=-11
> 
> Hey,
> 
> This does not apply for on phy/fixes
> 
> Can you please rebase

That's not a phy/fixes. It is a patch for next, as pointed out by fixed
commit.

Best regards,
Krzysztof
