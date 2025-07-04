Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522F43093D9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751641668; cv=none; b=m/CL9+6YGseJf9w4Oz+60oqcDAlIyREFWaypBwkfnhTeddJUXjZNWLetNg0JVugO9HDu8F3+UdsDQAIpO762tTqfAj4mC9z4qGh4uVVqtuqkqJLeSFCz/GQPwkvl3pMJL2M08+4VhjzoyqX4ERIQNBsS1vA/IDpW8tu8q3r4L4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751641668; c=relaxed/simple;
	bh=q2PI2I6DpmIBa/PZTooLY5T7w0VsVRO6mzyBLjxOd2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MX7jY/TpW8Zf4Xqu3sTFeYgrHymAUM5PKL2LZ6hIJnUSAh9bqWNVuDPMlCGOjoXToGEnG51x2tQHCPug8U2vFM9xwiRU40t/7dSRbHcRdUu5FCRSOuqXQNLJwfJst2KsUKmRLMDWrMPb6OpZ1te2X0kc5Z2gSHUHYHDoVRUpmf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wT2OD5+I; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wT2OD5+I"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-453066fad06so7372045e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 08:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751641664; x=1752246464; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UYKMtLCQMU9Jbn/Hf3wX+1NuY//33AgfBI91LQJ8MGY=;
        b=wT2OD5+ItIoGdf28wgmaYorskH/4msq9z6DCuxt5QCfhhTARvnlPnXncZlGOa16p5I
         vJRnqgSdPZXNH8jeXQC/qH2A52A+czVrFr8x4Pv1586GivLRaISaWyLmY/0dTYUzF2/5
         H9mvVHbjhxEFtkn9oeOcHUHhSP8tmTNiJDJJGKIRsVZf6DeNAFrOC2Y6TbeK1Boj2gGx
         JkuRqXqNXQf3xwp3mmWdsryxc7y1+XAvKhPxwdXaCNfpOrcp/3M++TisJeOVsN0STLEP
         PsaHdsaF2aw316Es3AGs1dj9trrFf4kKNUPoJEJugIdOh9HeBsFZ+jvO05LLLKakPnwb
         /M/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641664; x=1752246464;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UYKMtLCQMU9Jbn/Hf3wX+1NuY//33AgfBI91LQJ8MGY=;
        b=USEEkK0HCanzIflt5lduYexXW02vILhehILs1IxCg3SGiU999Yok3hYIRN17DbVPz2
         zSY/pwmozxN30sEWh1hhg4GyAHzVtbj0WcJY5lqgUtjwC6UtTHRHN13kLr9ySZxfnsTf
         ahcqe3piZ1dXh/Examc6pUdvn/h2uGX6uISwxzrxstT6CwS/RTeCHWlvGahPErXeAH1q
         sdcZMsASP6aNrV4aFzgStfr+whIkoIg4w4uT9f5awiPIRYKMX2gGDxmQW5224++AOHu0
         N626Zm1QnsBo30nWnJA790k45xboheKsO0ezdtO8gk4HbBiTSyQJJlMA3z4zovKd/x3/
         aAoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkrf8MspSS+8oTb4Xp21aHa+ZhXhge16LIOZAmDSPQbEB35sn/Ir1xbn11MSEFxSqtgO1L0hh2Q6vs7+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHaikLKbGuEkYbNfkIvVo0hqwCd3nbNu5mpizcJbQzMI4xwWuE
	nvudFZLtFXklaB0M33+mHJld8Mdc5DnLnPckxVx2quwJs53ppXEh7HH+uvBO4x3KEzw=
X-Gm-Gg: ASbGncsGodHfRfXsBYYAnfbE6vAP8PFEGbZlY5ES+LmcJaViEINev3Xu1bMDJMclIvY
	0YW99SFvdTYQejg5RNqOiriQ9ga9fwkRI2Sj5dGz6fGoTa+Mz/4byknUEWz53Fwzv3yMCONuiWl
	1n9i5kSh6jK2GUl5vJP9m+CT+4wJTS+nEZXUgBQMn2KpDCqV9Fe2WZQnB2ZURjQcaYLERWJA8Zl
	PFUzyYXZnLKVJSpJFuLQnUACi10gInH3EhZCgaSgXiru+Shej/7KeLYYeEr3vBN1Ikzs3rgZwsH
	CNao87KOfnkY9Ng0Z8/RO8Y07cXHVJtzDOVdYpgfV31UADb80NT5JG2+yq6hl1/8Ph3tYThQ6UB
	Se9mvRZA5Fv1DOCm5fBN5rUz/W68=
X-Google-Smtp-Source: AGHT+IGCWK6GEjyuYgdWySF7UumkNIAA260ijlRTJDfE/t1th536V8nTvCURxmWZM6UF6IOMpNbQjQ==
X-Received: by 2002:a05:6000:2890:b0:3a4:cbc6:9db0 with SMTP id ffacd0b85a97d-3b4966046e2mr2935145f8f.51.1751641664468;
        Fri, 04 Jul 2025 08:07:44 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47225a2e8sm2696936f8f.75.2025.07.04.08.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 08:07:43 -0700 (PDT)
Message-ID: <96f2c5af-9d42-4fb9-a468-ec4d22a76198@linaro.org>
Date: Fri, 4 Jul 2025 16:07:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: media: qcom,sm8550-iris: Add X1E80100
 compatible
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Schmidt <stefan.schmidt@linaro.org>
References: <20250704-x1e-iris-v1-1-c3137d979e43@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250704-x1e-iris-v1-1-c3137d979e43@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/07/2025 14:38, Stephan Gerhold wrote:
> Iris in X1E80100 is pretty much identical to SM8550. We can use the same
> firmware image and the same definitions in the driver, so just add
> qcom,x1e80100-iris to the existing list with qcom,sm8550-iris as fallback
> compatible.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> index c79bf2101812d83b99704f38b7348a9f728dff44..9504d7ea23f4a30fd2d03e8683721641f8b1a115 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
> @@ -20,6 +20,7 @@ properties:
>         - items:
>             - enum:
>                 - qcom,sa8775p-iris
> +              - qcom,x1e80100-iris
>             - const: qcom,sm8550-iris
>         - enum:
>             - qcom,qcs8300-iris
> 
> ---
> base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
> change-id: 20250704-x1e-iris-4a5d033f4a2d
> 
> Best regards,

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
