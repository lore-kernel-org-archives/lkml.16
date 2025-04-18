Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0715D204C32
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744972142; cv=none; b=MCGvFJElxPoFgI12dLwV6vKFNBnq3sET7+vAOXKUuyYgcsYE69DMq688N3Q1mygcJs7+1t9tHr3bUsQoQBwWA5eTmS41nGqjaiA8Z4o+E6zBRJlEiMw6EGrI4KurFBaNhWK4JCMIx1EdA6IImWUeeLNPvElj6iSs1XyGfjKYlew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744972142; c=relaxed/simple;
	bh=PXjUbokpUcI7LlH+tMOmZc96wIGbaznXSlWcnx3/Za4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IbRBQOrp8EzM3DzDcKTlkAz5nRD2woLq4YfVYfrbBXWtMeniEwCMclNceLTKhLYqp+c25iCRISq1QLepl1unyi5bXfIM1kbyWzuIVq81WJURlx52WlrXfDWMgHJ9UtfLw/5A6OjojLY44a4AV33Xyvp0l5gkFunrGI+xaEiEGXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BFWIAJvE; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BFWIAJvE"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso20219645e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 03:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744972139; x=1745576939; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O7HleWCohYPjMIRO73sV8qZDTMfJD2N23urCmVc53xI=;
        b=BFWIAJvEgNkWTZJrQwsOWWqaSmPJBcRta2Ei8DZ2Anq+hBHFa79MXDdug6IIdxOeJ6
         RVfbOfMRXvGxkHbvZ7LwOV7hupUsvf0ouOq62agRNUlMac1jPWJqDm/R52qy2N0nTBGi
         fwczznx3yIQFYJBtMbl1ztcxQvez0HTntx1EueCe2P9Uk+0olXQWi9tLhjrteQh47qit
         O5rD/yXhvObBnJ6xUZ0bNSCcTtAZMfHwOpHGafd+ME0rPcyAfCfRDR2i/TGSVTnqUV+f
         KN2cBES9xDKsAFd7JqK4nycou3yPuI8L8Ut5HnCpZs4QLF8z23j3aZksKZJD+4YhH/6n
         L/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744972139; x=1745576939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O7HleWCohYPjMIRO73sV8qZDTMfJD2N23urCmVc53xI=;
        b=VN6ywA9lPJO7a7RIYlqiefXwBjH/lzL2N6Xiz+4mEgILIWsf9KWdkkMojyTX7DQSAa
         5H5zsCcD3uo4GimJNyqdE7C3mxdirVAVJDHY65krjxgCNpMd+bxjD/3f14cd1sfrZSjK
         gUcu0PMp7dwIlcsp98dp38VpcVi+S24WMJXzcH+Dshqr3JpYErcS0OrfuTDXWmamnsBu
         89zTgAzhTXmY+1xcPMB4jt256gPNAJuXxIyEfJh18qSDfz3K03HyTQC+ff/HGWVmGEsv
         orDaU0fuTADpt2x/c0r52VZIFZpBjYHjVgULA3gyf0cc49idtloG78bYg6VFhSLqXVPh
         LiNg==
X-Forwarded-Encrypted: i=1; AJvYcCWLP8j9W0BmyZmHCWx35M26I97v4J8ySy1YLzVPtCOeKrLQlV3vTqoGJy4zCPRjXnwdpVmcVYqzHpcTrhs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWahhN6jYLYn/+ULq4jQA4U3j9SbzGjg1VqpRnkUOLHLmyK0km
	LEQ37p1xQMMQAjzoQAImor7GnH7gKSIROBEuoNV/cfO3HfgkMf99oz2wWrS0huo=
X-Gm-Gg: ASbGncsZHjwyvfpk9ppUHfLCbKHomUAHOV19R8/ZUiBUN60Gk/tlbvEy0pbp+thecgl
	q6KJynlN4Mrc9WLLI2tWXwvvBb5lzJHx5XdJ/7XzKnCBN+wiezrs1sRwTy0xnmtzV7DjJYE3q4U
	tlt1pV8mumuLBVKpNrO++7jgEMC/WVGFRonj6xYrNVqkOA6Fk/HKiUdwkG4A4Z9t20hym3+0Y5C
	haFEaFxJMIxMhf276fwRf6yq755Un1lb45BkGji6Uld5fCb5LUqAr1WeZbrJviillLiP0g1h10r
	Ifu1F0u6YMOjVrOrSJfM0/Kh3q5KiEBBNJKnMAcbo2BNMqVtpn4oP19z/RDxB4+2Qo4WCD7U/dp
	Mgzhykg==
X-Google-Smtp-Source: AGHT+IHJxlKM+V9zjxNju1detD9GdxRElBAn2xumwvGV5gII8CVWfwTLrPeirgJsQNjdQc0gV17/RQ==
X-Received: by 2002:a05:600c:8508:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-4406ab93c98mr22161755e9.9.1744972139340;
        Fri, 18 Apr 2025 03:28:59 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa421c79sm2337770f8f.1.2025.04.18.03.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 03:28:58 -0700 (PDT)
Message-ID: <ed3f537a-ac1f-44c8-952d-42a5d83c3a69@linaro.org>
Date: Fri, 18 Apr 2025 11:28:57 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: qcs8300-ride: enable video
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250418-qcs8300_iris-v2-0-1e01385b90e9@quicinc.com>
 <20250418-qcs8300_iris-v2-3-1e01385b90e9@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250418-qcs8300_iris-v2-3-1e01385b90e9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/04/2025 07:28, Vikash Garodia wrote:
> Enable video nodes on the qcs8300-ride board.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> index b5c9f89b34356bbf8387643e8702a2a5f50b332f..87114a349fedd80296abaf3d2f5f284b5adbbdfe 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -285,6 +285,10 @@ queue3 {
>   	};
>   };
>   
> +&iris {
> +	status = "okay";
> +};
> +
>   &qupv3_id_0 {
>   	status = "okay";
>   };
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
