Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A781C3C1F
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 16:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738426979; cv=none; b=E6zTT/RgZlhUVAZQyVIpVhiS49Vx2RABxTJTqe/FuJDyeDF5CQMRsz+sZo8WDQpU6mbeOyJZwMA5hktQaRN7Uy6bkbt0oZpsKtXkxlrXoF48Lt3LfB+vmmnptVf3E9ii31KL0zs+vod6i4+lb5iGeyOv0Dp/rYkDtran6d1n3p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738426979; c=relaxed/simple;
	bh=LbDVqPMvfAWfXJowInDbnFGLIDjIttLqtOOQlAS8pGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AIrfWkx6kvhzRxsMiJ3oF7/BQjccmUyISD91ctDyEh3EWLJ2FxLkPFwcDdhIncC3RCBnZRJihu0roIqLjQjnQysHJTW6xYpwnLAPcheZtrMRrTBUvwkmq2hwdlm+Tp46GOc860TpUarWlxh4JPU02mH0u4gWJvLwKYJkZ2FiSyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OX/rt15I; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OX/rt15I"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54287a3ba3cso3707835e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 08:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738426974; x=1739031774; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SB7/q7mnWnKXhmf35fp13ZHl7rRS7BiN5dapcuwGPeA=;
        b=OX/rt15IW29OL+xjayqZh64v6p5R/Z2FGsLEiF4rqPoYksyoTEWzNQ+Qq6WiiqF2R0
         EHocATq1sS7RWNCdaruf7V+3iZieQETslEWNFmvfFbanAPSPeSKc3Tmc3vDfDa7iBkt1
         IOPj5XHSf2Ty0Nt9ql9ekAeFlThafllissmGTWvDmKHdrwvYhk5eYyh5OlpxuHjKzH4K
         6dsQxMUOJMCXYWzs7bFKFfbuyarA2y4okFowqPS8i6PgshBHX3oCX9CAqNKb59dO2uOH
         4AuzQKGkYbK5VxcSKnQIhj9LXEJ3V8vKzM9PVDrx36Nl5bghAuvzJtt51wC8DGpEoJGs
         ytww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738426974; x=1739031774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SB7/q7mnWnKXhmf35fp13ZHl7rRS7BiN5dapcuwGPeA=;
        b=H7it/9PJ8/Lx5aWiX3HZcPTcct63EFOzFEnj8RwI9OGh1NLJpt3nGhL0HkzceAwlwJ
         g1bANo8ARx2k9g6lSjRCmb9cNaP++LheId5CM7XVXbNT6y8hnj705lNSYZ44LimoMoaM
         tTCfq4iMlH0Qi4zfuDmOZVqz4VBONCzcgQMTZyZMn07/+DV9yXjxsQB8cNInddta88El
         Lgx1t1BH/L+f34Ah4klYPsdYvnitJs03+KB9c30wXhcGfCihuYRTfmWQ7t/6TXIX1Gum
         8yjvRmsGocdFZXTxx0RNNiSEfNRRwAKa8kv6mHUEnp+uxr4tBriMxS/0TvMaNxnBxVqs
         LuXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRm5B7WQtZTXvfpa1Z311TWVFYqOcHRMOrmp/bAO5f5Zslp94Zjg2H2Zpnz/Q4EpfMUwcnw1jj7hD5fJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqQrG35FYQnkrdvejJ29jW3iZuyfXCzMdTBgznv97ZskOYsSHd
	2ZtUX+QK3g0awclJxi3UXI43xIa4M4kaJH4A9feV1X7J0utabYg9oI8hTL5riEE=
X-Gm-Gg: ASbGncsGbxAixva2K+c+eDmzc1BAT+Ehif9PgjvV55rqkU7W7F2nGiFMgKoVERLZEe5
	IKRqCyqo3qbZmynd6o9rBoaObIZlBq03j7rkBZesOL97SEeJHXS4mRehM0gytDwL24YiRKS7bn0
	Hqu5lFStk/SM2zstI22pRmR6ST7L7KKJk2MhNv9CX7qFKWMlasn/wiHmTGsHoVstlixDRFTnNqq
	vqdJxj3ooOzDhCsdHb67Zj8r8XPY7pbD0pVo9qDL1QVYRE8R9x0EuaBcp6rske5yHnW/OBYiE5D
	TrhZO+NsYUb6P8ihpqP3vTYUNhKHngCUzKznCur6UeA5hIRecXW6CAbC3Z5qM492K1wpSvQ=
X-Google-Smtp-Source: AGHT+IFY/QJCu1OV6j/yI8VCFmTa4eC9LGUKAVzD6ktYAmvjnDqZxme+ljXVZ2YnCurb6YGeEXAzfQ==
X-Received: by 2002:a05:6512:684:b0:542:21f8:d6bd with SMTP id 2adb3069b0e04-543f0f30d1cmr2521222e87.22.1738426974213;
        Sat, 01 Feb 2025 08:22:54 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebebef3fsm765925e87.257.2025.02.01.08.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 08:22:52 -0800 (PST)
Date: Sat, 1 Feb 2025 18:22:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: qcm2290: add UART3 device
Message-ID: <jc5lpkfhlrz3wwfyl4zrsrgsnwiowrxr6dadqf2vsjedxcn55k@yijjjvteuowy>
References: <20250201-rb1-bt-v1-0-ae896c4923d8@linaro.org>
 <20250201-rb1-bt-v1-3-ae896c4923d8@linaro.org>
 <55195890-b7d2-4df8-b8c5-fa2768e90094@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55195890-b7d2-4df8-b8c5-fa2768e90094@oss.qualcomm.com>

On Sat, Feb 01, 2025 at 04:19:01PM +0100, Konrad Dybcio wrote:
> On 1.02.2025 10:18 AM, Dmitry Baryshkov wrote:
> > On QCM2290-based devices the SE3 is used for the Bluetooth chips. Add
> > corresponding device node.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> > index f0746123e594d5ce5cc314c956eaca11556a9211..5f92eb16482a0ea5f8436cfa7e55849f171ebd24 100644
> > --- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
> > @@ -1239,6 +1239,21 @@ &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
> >  				status = "disabled";
> >  			};
> >  
> > +			uart3: serial@4a8c000 {
> > +				compatible = "qcom,geni-uart";
> > +				reg = <0x0 0x04a8c000 0x0 0x4000>;
> > +				interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>;
> > +				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
> > +				clock-names = "se";
> > +				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
> > +						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
> > +						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
> > +						 &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
> 
> This path doesn't look quite right.. there'MASTER_APPSS_PROC is only
> on one of these.

Hmm. I should check my c&p source then.

> 
> + RPM_ACTIVE_TAG
> 
> Konrad

-- 
With best wishes
Dmitry
