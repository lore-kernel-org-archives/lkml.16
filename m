Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAE719D8A7
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 16:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746463066; cv=none; b=RgCIzZbSiAyS5K9ALc+Cdy0lNOFgV2zUvENnOfnSkkpz2bRUyqLSHutFo3va4ur/2gJvFLbf4Ds6V0M8SoTpBepp0KUKPassz8QMAyXA1EkGnohHMrY3DYG+qLbhWyZQAH3WVSqZSJT5YIUGsb/8eVsI6O0PJjs1SQylb1O6juQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746463066; c=relaxed/simple;
	bh=mBshjPZ3/6P82KSQc2M1yyZltOOhhVEU81eyexwjKaI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Laj6mKaszjV6W/k1ac1LHKBQt2BtwERIImSE0k+Ka/A6FKAGiiBu5q4iyHdiaH0z/7eLyBSE3nvwuuK6WfHue6Y8zTzYbIs6Q0TmIzHmhsfdc/sUmmfyFxcd1tVmS4FRpso9ejiTgk2CQg/Zv4EQyOA4j3VjyiKp1Rfb5phb0TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kZuMr0C3; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kZuMr0C3"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39ac9aea656so5023147f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 09:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746463062; x=1747067862; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yr8TswpY3A6Dc4L25cPMCHuCuSSJ0UUr6HAbypQjy60=;
        b=kZuMr0C3x+dkRCg+mRDlNeIWFhgiqpt58HOwF5HxdwgLXilCfu6/yQhV795PKqdLCr
         2+3+yCvjJYe17LuOOY29Wjlxost3u77J14aPcYqYzuX7OVljEpCIOLes+UWC0JPQmnhp
         B9EHPdu/Z4PuB6IajwJ5w7l39M0G3PuFran2VRrtyM/mloF4KrwZ+eWWy4dwANCYHioR
         mgJdDfLF0un2dXLW1c0oTc3GMYasGQ3WsmGD1pdoqcJ3td9tg5Nw57PQkQdwXMcfwRhN
         O9GwAANL3fCe4tQC5Zs3P4LvaqKZslPF/bBxeAvoPRb+yLee8kUAM5vs6a3H0WWSuWqv
         JPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746463062; x=1747067862;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yr8TswpY3A6Dc4L25cPMCHuCuSSJ0UUr6HAbypQjy60=;
        b=jy9IsFg7aqx99Gs2ACJiBHf0kZkU4CLS2ys8mbA/qdNIHN1utOrTE+eqZeFUF7J+W1
         nlr1++ttPhqVeF9Kh61vb8qcVU2oic6DAQwVLQ435zC+PSjQffe7wV0CfVlPXvPbveE7
         z9Z7sesH3/yDRTQvyhMTWU3Dwrsfd7xbTMMYYpzNAtYRW0KgpUEKkPSEEnM1lL5v13sU
         ejFR5yrLpsbW+7/DresXNMhRMT8Kd7OcxecEGz1hYRMLYBkrMLCqklEhImaRLQ/SdZ+g
         xH0/0hdhkvHW7afPxdD6lfyN96VfTwKsxmpw1w+zcqnsHzAUkE2A0PETmkwoYxxILcsU
         n04w==
X-Forwarded-Encrypted: i=1; AJvYcCV6hxDMAVUAdWr1aXdIeYJhB9TxI1O5rfK6HpUNkTVVt1degNrzwgjeRe7Plx5YBhJBQTA067x159/smCA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8R3TX1uVvET+zst9qrOgOJ6jGeM31IGoLBKSJT9BH7nJWVENy
	nxK8kIiE1iCi7aj2Y/7tr0Yn7ftMtr7eug9mqR5GWKy79d4K3DPkhA3IbLKs1w8=
X-Gm-Gg: ASbGncvUbUyZI6k86SVD8haQwLNNizhwav8jkToQmW8xdKg6odmOXkEKPkFWZjc6nNM
	7HGdeqf/XU6Y+VSRu+buPDlNrvSjHpl46IFRLqpYvjva36FQLSI9UfSCakub6IPYoEqHVXJ7MrR
	4d7283F0FKnmPVIpCeASaAJrMIt7CHb8tB9BRj8A0Kh8C5S/S8U3jRYnzTgOj44wUjrh3/GHgzw
	jqoOlAj+KH8U48AI41MrP/W16RGaoZhTswceFfSfLaa6Ii25VbUizx8X/8v2HAsgPaBXHLdfsj6
	YJiW24EPqMgBGuk4wS2HpWSvKwI9t4HsPXQa7/lgaF9/W80rENXyUQmLvsLhuvrA6yT1D1h9r8w
	6Rb6TAMQ5S1CGMA6nYQ==
X-Google-Smtp-Source: AGHT+IGs6rOJBnDj9UoUwhP8ghCAx8JImm1LfeczGsYdnnjRsWRy34NkOumegI2DPDbTRRqAp3oJng==
X-Received: by 2002:a5d:64ec:0:b0:39c:12f2:2f86 with SMTP id ffacd0b85a97d-3a09fd6cd7dmr4748116f8f.8.1746463062457;
        Mon, 05 May 2025 09:37:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:88d3:1ad7:3ae1:56e3? ([2a01:e0a:3d9:2080:88d3:1ad7:3ae1:56e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae344esm10716888f8f.25.2025.05.05.09.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 09:37:42 -0700 (PDT)
Message-ID: <4b2a8c38-fdff-4408-88ab-fbab385893ae@linaro.org>
Date: Mon, 5 May 2025 18:37:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 22/23] media: iris: Add internal buffer calculation for
 HEVC and VP9 decoders
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org,
 20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-22-552158a10a7d@quicinc.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-22-552158a10a7d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2025 21:13, Dikshita Agarwal wrote:
> Add internal buffer count and size calculations for HEVC and VP9
> decoders.
> 
> Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.c     |   3 +
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 397 ++++++++++++++++++++-
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  46 ++-
>   3 files changed, 432 insertions(+), 14 deletions(-)
> 

<snip>

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> index 62af6ea6ba1f..2272f0c21683 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
> @@ -13,6 +13,10 @@ struct iris_inst;
>   #define DMA_ALIGNMENT			256
>   
>   #define NUM_HW_PIC_BUF			32
> +#define LCU_MAX_SIZE_PELS 64
> +#define LCU_MIN_SIZE_PELS 16
> +#define HDR10_HIST_EXTRADATA_SIZE (4 * 1024)
> +
>   #define SIZE_HW_PIC(size_per_buf)	(NUM_HW_PIC_BUF * (size_per_buf))
>   
>   #define MAX_TILE_COLUMNS		32
> @@ -28,11 +32,47 @@ struct iris_inst;
>   #define SIZE_SLIST_BUF_H264		512
>   #define H264_DISPLAY_BUF_SIZE		3328
>   #define H264_NUM_FRM_INFO		66
> -
> -#define SIZE_SEI_USERDATA		4096
> -
> +#define H265_NUM_TILE_COL 32
> +#define H265_NUM_TILE_ROW 12

This one should be 128, in fact it was right on v2 and seems itr got wrong on v3.

Grepping in downstream also shows 128:
$ grep H265_NUM_TILE_ROW ./ -R
./driver/variant/iris33/inc/hfi_buffer_iris33.h:#define H265_NUM_TILE_ROW 128
./driver/variant/iris33/inc/hfi_buffer_iris33.h:#define H265_NUM_TILE (H265_NUM_TILE_ROW * H265_NUM_TILE_COL + 1)
./driver/variant/iris3/inc/hfi_buffer_iris3.h:#define H265_NUM_TILE_ROW 128
./driver/variant/iris3/inc/hfi_buffer_iris3.h:#define H265_NUM_TILE (H265_NUM_TILE_ROW * H265_NUM_TILE_COL + 1)
./driver/variant/iris2/inc/hfi_buffer_iris2.h:#define H265_NUM_TILE_ROW 128
./driver/variant/iris2/inc/hfi_buffer_iris2.h:#define H265_NUM_TILE (H265_NUM_TILE_ROW * H265_NUM_TILE_COL + 1)

And fixing to to 128 makes HEVC works flawlessly on SM8650.

Neil

> +#define H265_NUM_TILE (H265_NUM_TILE_ROW * H265_NUM_TILE_COL + 1)
> +#define SIZE_H265D_BSE_CMD_PER_BUF (16 * sizeof(u32))
> +
> +#define NUM_SLIST_BUF_H265 (80 + 20)
> +#define SIZE_SLIST_BUF_H265 (BIT(10))
> +#define H265_DISPLAY_BUF_SIZE (3072)
> +#define H265_NUM_FRM_INFO (48)
> +
> +#define VP9_NUM_FRAME_INFO_BUF 32
> +#define VP9_NUM_PROBABILITY_TABLE_BUF (VP9_NUM_FRAME_INFO_BUF + 4)
> +#define VP9_PROB_TABLE_SIZE (3840)
> +#define VP9_FRAME_INFO_BUF_SIZE (6144)
> +#define BUFFER_ALIGNMENT_32_BYTES 32
> +#define CCE_TILE_OFFSET_SIZE ALIGN(32 * 4 * 4, BUFFER_ALIGNMENT_32_BYTES)
> +#define MAX_SUPERFRAME_HEADER_LEN (34)
> +#define MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE 64
> +#define MAX_FE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE 64
> +#define MAX_FE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE 64
> +#define MAX_SE_NBR_CTRL_LCU16_LINE_BUFFER_SIZE (128 / 8)
> +#define MAX_SE_NBR_CTRL_LCU32_LINE_BUFFER_SIZE (128 / 8)
> +#define VP9_UDC_HEADER_BUF_SIZE	(3 * 128)
> +
> +#define SIZE_SEI_USERDATA			4096
> +#define SIZE_DOLBY_RPU_METADATA (41 * 1024)
>   #define H264_CABAC_HDR_RATIO_HD_TOT	1
>   #define H264_CABAC_RES_RATIO_HD_TOT	3
> +#define H265D_MAX_SLICE	1200
> +#define SIZE_H265D_HW_PIC_T SIZE_H264D_HW_PIC_T
> +#define H265_CABAC_HDR_RATIO_HD_TOT 2
> +#define H265_CABAC_RES_RATIO_HD_TOT 2
> +#define SIZE_H265D_VPP_CMD_PER_BUF (256)
> +
> +#define VPX_DECODER_FRAME_CONCURENCY_LVL (2)
> +#define VPX_DECODER_FRAME_BIN_HDR_BUDGET 1
> +#define VPX_DECODER_FRAME_BIN_RES_BUDGET 3
> +#define VPX_DECODER_FRAME_BIN_DENOMINATOR 2
> +
> +#define VPX_DECODER_FRAME_BIN_RES_BUDGET_RATIO (3 / 2)
> +
>   #define SIZE_H264D_HW_PIC_T		(BIT(11))
>   
>   #define MAX_FE_NBR_CTRL_LCU64_LINE_BUFFER_SIZE	64
> 

