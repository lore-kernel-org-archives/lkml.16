Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C59525FA0E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745833221; cv=none; b=VON2Wvub9ZplDfbSDOoHgBh9//sKmmYjLcfOf97JBcLGY8IcQNhxwjGuUWMFMD17xv7lRqR89/Fi/eYfQTlBroytWWmEV8hngVZykGUcMzvtXhRWZ/uw5fbbcV9MSXkjU7RdWJNdczUm8XxBfIbJtdRzBq12v3H585pnaDqLhUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745833221; c=relaxed/simple;
	bh=p4kNQdwzmDnZta4PbgZFZq/U7oDnPl8MzQlY6H2Scpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fOlKaj1KHbGfMuRjRXBRzbXCPuPVa/k/H8RJEC3rFGCO0xoTPVgiKV3QkY1W+m3FtN9edQshYF6XSaB+tc0shTOyFdMfrLm+DtUspKj1J57HtRAWrcJqroodlNdsiZIyy+mNp1N7u4OIO0YLS8CbbCVHXx98Y5Oxcz7Fxe+aTfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KfL2A6KF; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KfL2A6KF"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c0dfba946so3288089f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 02:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745833216; x=1746438016; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/tZd4Ypk5BJk00OTo7JvTXUhxLykKpGhTfHWhdUsfHI=;
        b=KfL2A6KFL3AMx8D59wiXmSEln9e363SZI7GhY2v0eq0EjdfZk2Ru6wFuUIFTmv6yFV
         B3NXKlGnXjtPBtp/kaFtMVovlJ1xbqOY9V28wpsZh/+YSMgScR+4GkGkDtqSt29dqrSX
         MK4eXdXV7s86RvywP+QLar1+/rOHHe52egXH/hcJZFl/E7mmoowGtBDmMe5imkx8shl6
         rmN3kr8hLVJTSbMi1ajwQl1cPkjkRzE3T6ljayNsdJA0nwkGHjYhbV+pcPJqFazMB2Qa
         BbzSZOnGcn8OFmDMQHvOHW6JCeA8dRXc5V9V/UMrXh0xxHq5XzsgngPJLXoTDXgTAqdp
         pUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745833216; x=1746438016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/tZd4Ypk5BJk00OTo7JvTXUhxLykKpGhTfHWhdUsfHI=;
        b=vpDssqUXHuggyL/tceOzNsI4s2Uf1UNDoie7PAwfYxKevkkkxEgjTVq05wvI8pywAP
         z8ZY4QB+K0eL72UeE1NgQk8Q8Y9NSE36HbW+SCzJeCgH7K91Hi8wFT0RzUGPJOwE9Lu4
         DStPjYL2b6RMBYsX4Yd5UMxLmT7vup1jM4UOT+4xL+V/RnFW5BvNYgRY/pvWP1J2hO0j
         QdtrrLW9PAbGyJcWufb3B48n6tnwYqo1N6zIslJm+hlloCMC+HKtvqmc+FGPEwFwFENt
         eyh50vB6OaI4lyEC41q4fN8mWwONXErY5opPrnmpHzgRgmZ3ySeluP4aHqqVHsQ1ksdL
         JpFg==
X-Forwarded-Encrypted: i=1; AJvYcCVYBXM8hYORytHRjuz3MhmYHt/q1OqjF/DXinzKWwPD67//6j0q9keYrVNwecyX0cJlcoB9KS6H3k7+8Ec=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjOM8C1eScU3qXjhxTkg+nKLQBLRBYNC02IQZpwBs8ki2yESDV
	/B4s45HX8pKXTRw3o9ta8qGr09PAL7bG+iYbsqJQGmdNuV8761xgfjq13dEWXS8=
X-Gm-Gg: ASbGncuQU7s9vKE/UlDfGpACade3mu0wDIrBBzEbTZbKBOkF8o7CvW/n368On90a8Zk
	IYotq9dNCx9qcapGEVPcXEqmVRlw2DILS8T8BJC3eidU3HD3LAQbZ2bpZgSBYcViJdvew5x96iA
	vPc41zvQFX2FmAJws1W+XLotUNzBLjSpTYut987/2WMwutAvoI9jVjBrWIwlm+aRdqg7AWyVAAM
	52UsOX98ksbEu00xqtR9hw7YlS48U5i7hhn2dZ+CvQXbGm+4BpJMcjP0JoJBlyzTBWmQWEz0o/g
	V0bFYcUu1T2Pa86lGfjyMOj8P3bAfX/6PptUcnuRqrjQIg==
X-Google-Smtp-Source: AGHT+IEmllBzyXjLLf+kiGyB+WclUcZwpuBSk7Lzu0+1JVWeTqkNy2mJ6U8hjuYfUNsLgR1qBxihEA==
X-Received: by 2002:adf:ec87:0:b0:39c:1257:c96f with SMTP id ffacd0b85a97d-3a07adb1766mr4500559f8f.59.1745833216549;
        Mon, 28 Apr 2025 02:40:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073ca543bsm10716844f8f.34.2025.04.28.02.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 02:40:16 -0700 (PDT)
Date: Mon, 28 Apr 2025 12:40:12 +0300
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
Message-ID: <7f37ec27-0221-4bb2-91f9-182244014b5a@stanley.mountain>
References: <20250428-qcom-iris-hevc-vp9-v2-0-3a6013ecb8a5@quicinc.com>
 <20250428-qcom-iris-hevc-vp9-v2-14-3a6013ecb8a5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428-qcom-iris-hevc-vp9-v2-14-3a6013ecb8a5@quicinc.com>

On Mon, Apr 28, 2025 at 02:59:02PM +0530, Dikshita Agarwal wrote:
> A warning reported by smatch indicated a possible null pointer
> dereference where one of the arguments to API
> "iris_hfi_gen2_handle_system_error" could sometimes be null.
> 
> To fix this, add a check to validate that the argument passed is not
> null before accessing its members.
> 
> Cc: stable@vger.kernel.org
> Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-media/634cc9b8-f099-4b54-8556-d879fb2b5169@stanley.mountain/
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 1ed798d31a3f..cba71b5db943 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -267,7 +267,8 @@ static int iris_hfi_gen2_handle_system_error(struct iris_core *core,
>  {
>  	struct iris_inst *instance;
>  
> -	dev_err(core->dev, "received system error of type %#x\n", pkt->type);
> +	if (pkt)
> +		dev_err(core->dev, "received system error of type %#x\n", pkt->type);

I feel like it would be better to do:

	dev_err(core->dev, "received system error of type %#x\n", pkt ? pkt->type: -1);

regards,
dan carpenter

