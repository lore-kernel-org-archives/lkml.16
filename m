Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE32221FC6
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375576; cv=none; b=ID8lET4wygJ4zC0D/qFnVGJPP6m2EwY/skE80RfWIGSW2UxWxcd7sHOkiVLRMjByNmT1tyjtLSBR2zbK9fDmi2pLGqa3hrTF+s26C58uWBogZ9dTpHyoQrPj2wWDIGr9WGw1zV0/la8O3mNjfivfhVQ5NYh5YWRmeiJp1LO8IJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375576; c=relaxed/simple;
	bh=qMsaU3AgfYd7npEUcPpNqxwxWZ1VhJND28wYGKSzw0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gRUp0sN9v9F0cKaJZMOmZppfsFBcw+vabz92aPK+dpWlhxvnB3k/iudjBhQDkNO1TkN0PhIefc8lHyfaGenUfnGjc54jpwe79kW2L4x8SyeWwLtPIMzGHS5q9FgA8YiHSDdYh3gTNRFxHzh2Jtcc26djuegCXIw9Feq2PXjmylE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uBdknXfo; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uBdknXfo"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf680d351so17964255e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744375573; x=1744980373; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PhDLvQWbhdTyN2VlzbNDlR4PYDwczdCrrExl7J1Ijlo=;
        b=uBdknXfoDK04p53+p+44C3wW2P1L2yQqQ40vUlMU5CSA7hmeVcasAMDhsuwmf3IA5i
         0CQ0Rvl0KRWGHoMeAMZfhkJkUapkkwhou+G/G6gbubeyQYtVxQkdOwtzUG0sh9QRp3jA
         oBlRXit6BD2dponBXtu+UOOxBynI4cc0beBNlMDlBfh/wS/SpgRMpsa4jSDJT2zKUCBH
         8fHVbWUiUgNPNFHVVjNaPmUkaCfjvJDBpPgcub92sZ5d4LTf1EG/ocdS/qLPqUXbm1QP
         lq0X47+z/tABqagEBkgGE5XD2hpoQ3sa3NKEnPM3KkCCSQVGJAcXyl/DI2tsLxphQcKo
         jZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744375573; x=1744980373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PhDLvQWbhdTyN2VlzbNDlR4PYDwczdCrrExl7J1Ijlo=;
        b=HI/ICgquCV/f9NlOu2xIILwesLBjlH0tkQEpFZ2ACppkafJCTvwLSNQx2uWmV1xq+0
         G5kL4KvD4huPj5PMZ8gzzegadHUUv+QjlVn1ze8rd2+9KaDb577A6VF11V5gxljp9DcB
         9EqjS7D00hr2C3xYqYyIsSGdP6MPYXmQ3/CUSxhhVp5Hg6hzpGamw0b2j79rrO2zpt5d
         T9aH00cndkpSmkhNnL//lAnXP4rDQ6IF9Y1OxoI27y3ii4PdmglqiLG49PpzZsal7w2w
         n9CmUN68ACItq5S8M/VMOK5mivKOJuGDC115ZrlgHI46T+pcyPrayLsgHFwi5ctUnZZ0
         j52A==
X-Forwarded-Encrypted: i=1; AJvYcCWQpKD31RWW3HtqN1zuAR6s8ra2jQgBfbmpAZPeAqIFLc4Wh5pDfQtwSc5mY3SyCEPCHRgXt5fnJwpPPa0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0JCWSeqpvWZnxx/RfxkD+XLx3xPdQlOLlJgGSbbywdeC5ZigT
	b6sCRNmFSUjTAHmeqKAlWii3l1FUffc9q18dXPXHt00kV9JgZt0/n/Gl0ofIknU=
X-Gm-Gg: ASbGncuKQndSVORxmDf/S8NzZheRRjzR5MnRtEcq/WH7izivmu1N5MbLN+oS3DNfdJc
	PRcN/yJGu9d4kxGXmfMfKm14p7IZi0sbdvD/U0lSphymA2DjWsKJhJvIIV/+to6eObmqe8ICZQa
	rQwgnDyb+FuO7BfgO1wUa+fi6eS/M7JFo2W7oa35pqBGRibXzGogmmo6I0Ldwbe2jz+5hz8JFZy
	YU4FtAg2etILE5tl1Dl0cFx2bqgFrxw6MX6JTD6xASyw65ucRBanCeZp5E4xSJv85w7s1IAOdjM
	hx1bZ86kmAh6UjX7bbPcU9hvBuwwjdC7PHNub+W0akUyGCYnnb/UuCcrTaz4Aad29AO9h6ikZfK
	TMYCiOw==
X-Google-Smtp-Source: AGHT+IFfOHu8NpwGY9QeJT4Px/nGS9JkxmRsI2hzwbDzfKKsDsEvu0wZdG1qPhsO1ljPGuw427Xyfg==
X-Received: by 2002:a05:600c:a012:b0:43c:f3e1:a729 with SMTP id 5b1f17b1804b1-43f2eb50f83mr65513485e9.12.1744375573083;
        Fri, 11 Apr 2025 05:46:13 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43ccd8sm1936648f8f.72.2025.04.11.05.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 05:46:12 -0700 (PDT)
Message-ID: <697dcd15-22de-46fa-b28b-0409dd18a79b@linaro.org>
Date: Fri, 11 Apr 2025 13:46:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/20] media: iris: Update CAPTURE format info based on
 OUTPUT format
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
 <20250408-iris-dec-hevc-vp9-v1-2-acd258778bd6@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250408-iris-dec-hevc-vp9-v1-2-acd258778bd6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2025 16:54, Dikshita Agarwal wrote:
> Update the width, height and buffer size of CAPTURE based on the
> resolution set to OUTPUT via VIDIOC_S_FMT. This is required to set the
> updated capture resolution to firmware when S_FMT is called only for
> OUTPUT.
> 
> Cc: stable@vger.kernel.org
> Fixes: b530b95de22c ("media: iris: implement s_fmt, g_fmt and try_fmt ioctls")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vdec.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 4143acedfc57..c5d85936b3ae 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -171,6 +171,11 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
>   		output_fmt->fmt.pix_mp.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
>   		output_fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
>   
> +		/* Update capture format based on new ip w/h */
> +		output_fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
> +		output_fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
> +		inst->buffers[BUF_OUTPUT].size = iris_get_buffer_size(inst, BUF_OUTPUT);
> +
>   		inst->crop.left = 0;
>   		inst->crop.top = 0;
>   		inst->crop.width = f->fmt.pix_mp.width;
>


Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
