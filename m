Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411BB2C08B5
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750250038; cv=none; b=b7jN1jlupzRZIaKgYCqYiK2Kn2xrBlLoo1gxZogiiO9AEk9GNqOBxYvWGKvQLsZUsO6Qn97JmedMRHDwGQJplbxjNzqgyeCDCSp77JDODDPdHR4K8+m4h5P1fGcxaSdef1pJhojlXKD57t91R+BuDTFkjY66+kbRs7XCp6lFanU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750250038; c=relaxed/simple;
	bh=A6NjSmVsSO2npuGJxvk9PvX0G4YIisDe+7dizzTEci0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=f7/yICXxhCEaaig1WaI+I0tSv4InqcJhXvGnZuHDXKtuaapzHsF329snKEFI2dzSB2XgnK03Odq+61lqVjCCKyJAuGBUx3tDxubUOqt2Tepz7PNR/lgDHqQ0AToDnidj04XW7lAvIAikBgN7JMmN4GMSg9C6Z2XprXONf0OsiLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SFMg8b+J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SFMg8b+J"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I93Aem013835
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g0cZJ9wdJVEr+Iy5G1RNIzGoPSb9HC/vXx1omHgkSqk=; b=SFMg8b+JtCUqNQb5
	AEGC9NXcyWl8/LBX8K3W/UHViMVdau80S6KW0FsXvtNnnU5arwf5lB3xkMSkSpzM
	cFU0VtV7W/DQRb07I0JEh4kpmrfX6STXmhYCC1TisSdawLk510lWViFrjEVlptfN
	6+CZ2FU0nO4SjMkqOS9fUr9yKC5OLq/NjuvvT6wa00L1s6jr6q4ncWVGQhvIGubu
	JbVI3Tbx/b1lbElMlOu1kBUOc4FWQoDrPhO7m0iw3EQ8moUInvX6NXuJLBVYZ3hH
	lO1d/FrkFRHu3Ifi6OtEWPGROl2EjYK+hZ5QOK/JN0ObGCYRoLFijQqlA5WJZeKZ
	4CbnXQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hd47au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:33:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c53e316734so156462285a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750250035; x=1750854835;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0cZJ9wdJVEr+Iy5G1RNIzGoPSb9HC/vXx1omHgkSqk=;
        b=MBZge7PBRf3h3kYVMjHvN7lcOYBdmijHjBoNB0C5UM/p/r9VFmdZ3GJF8MF2xZ1jL/
         gu1HVC30DUxG8umdccHjAdHnYDOOAdJszF9W9gPpl0CT35RB/uXUb+iCfzUG9/scbD/Y
         kQRvUpmxrzmlSUn7BKlTlsPCv0g3OX5nn4gsgIntharv0/9pTzGlKNdrZPGG8YKN3tUv
         28e7SHODpW0tz5AIbSqYZRzhjrq7IRy2aP6pCxY1x8s72Ldaxcc8/QIQcodFjXms7BsW
         ti0fB6YaQsc82vQ/Mv2vPJ6SXFSqOM2NJ0P77+sT8M4IRre68EQna0agxoVybdGMStKB
         k8sA==
X-Forwarded-Encrypted: i=1; AJvYcCXyQcNhbioACLjswSZ58zM2ToVEEwpLgWp8HRm+0SiZzcQcYnsh/Vw/X0bg6ivjU4NCOlJQ5PUs9J7vARQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrAC4JpiImAO7LAoPNIDHe2LeFjN+XRslV4fWGZ0FpN+uWbsfr
	7soTJRO1gM51ilKq1sWDwkJabpQgKtnDfyhKQgcFWzuQgBYkVMo99Mnf6gYEjrRXjHHqW1FBlqf
	OgjY3kDxaWeyk+XuILKG3x+0FGsYdRUCBv//qX/q4E+u0q3T52XqFg8EJ2dQklR7RQ0c=
X-Gm-Gg: ASbGncvsZv3JmvGKdDowcxDZdoUJr6Nb2lEg5LdgNh0wcnxdqamdx45A0FXr0fuaGj6
	ctIPteZOvASue24vPVJMJdEahp6bbz2IyIqwTGj/6Fvwod0ilZBzDcOMv6yRrRsKmua9IfOPVMB
	XnLG+WtAIjzO9oWVC/fLbEXoywWtQ7RM18HnnXXKhVcO5QFyI5C/xB6GYke1E7ZZVuKxRwgZWa5
	JTvoSSyxb/svbl753OyIKmEdQYpw8TsNYT9JJtJLU6dY1snHGk6+NK+vDU2Jr68BVWEksHRF9FQ
	RHUNCx7xSwqQCu5z+BEO7pMZm+RJ74z3LeGXxQagCulit1L2
X-Received: by 2002:a05:620a:2983:b0:7d2:1930:52a4 with SMTP id af79cd13be357-7d3c6ced9e7mr2424726485a.46.1750250034864;
        Wed, 18 Jun 2025 05:33:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEI+AWOdi/ZgaHOvkfAm6gX6AJORuDaq8N+TiWh2ZVfC8kbV6/9mB2L8oD1BL0NI9UN0eauDw==
X-Received: by 2002:a05:620a:2983:b0:7d2:1930:52a4 with SMTP id af79cd13be357-7d3c6ced9e7mr2424722885a.46.1750250034480;
        Wed, 18 Jun 2025 05:33:54 -0700 (PDT)
Received: from [192.168.68.111] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4532ddd29ffsm204308935e9.0.2025.06.18.05.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 05:33:53 -0700 (PDT)
Message-ID: <1317c3c5-967d-4013-9c0b-f68844c63908@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 13:33:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH RFC 1/2] ALSA: compress: add raw opus codec define and
 struct snd_dec_opus
To: Alexey Klimov <alexey.klimov@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Patrick Lai <plai@qti.qualcomm.com>,
        Annemarie Porter <annemari@quicinc.com>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        kernel@oss.qualcomm.com, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
References: <20250616-opus_codec_rfc_v1-v1-0-1f70b0a41a70@linaro.org>
 <20250616-opus_codec_rfc_v1-v1-1-1f70b0a41a70@linaro.org>
Content-Language: en-US
In-Reply-To: <20250616-opus_codec_rfc_v1-v1-1-1f70b0a41a70@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDEwNiBTYWx0ZWRfXxFo3+bd0zOyT
 ASNnnZ6jLZ2atYOvc8esIcm/BwJTukBvqmn7p9MeV0wdtYruJfGFKn/BEgAFqU4YiEipfX2fP5c
 Z0b6O7fijw9vXZ3eF+mgLPqRcBLrpYYskIiGpG9ZEx/VGG7jvk3lWXV+GBYK4IfLhcz+fw90g8i
 qtj/3WtSxm4hbsQR2tORoN89rVWIPcBsfx+zMQLdeRSwRGGxZ/CPrvzwdrhDuV4GYgQM2VacZql
 sdkODyoVbmCxrj4eXOxS2B9wm2AoxGwz4y5eiDqjVaK0WCgeofVMs/1DZxlroObBo9yqGmh0JM/
 E1vFxZ0tg9jfMbARijfRX0a0lw4xfBDraMbTbCfcnzg/DhHRTgJYpOQk+hUtMYHbJ3XtEJu4WBe
 8bEjeI8PXDqX4133ongCsBv0Vg8oGQHo9EphD7NXszJU1q5BqDoDPIE2YMMMSlm3RgdPuv4H
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=6852b234 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=BqEg4_3jAAAA:8 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=LhU3g7bnflL2ouMbDHkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=0mFWnFbQd5xWBqmg7tTt:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: SBuFBGIUwQe5C7i2lABz_u0abexhETdy
X-Proofpoint-GUID: SBuFBGIUwQe5C7i2lABz_u0abexhETdy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180106



On 6/16/25 4:26 PM, Alexey Klimov wrote:
> Adds a raw opus codec define and raw opus decoder struct.
> This is for raw OPUS packets not packed in any type of container
> (for instance OGG container). The decoder struct fields
> are taken from corresponding RFC document.
> 
> This is based on earlier work done by
> Annemarie Porter <annemari@quicinc.com>
> 
May be co-dev by would be good option.

> Cc: Annemarie Porter <annemari@quicinc.com>
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  include/uapi/sound/compress_params.h | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
> index bc7648a30746f4632ecf6695868e79550a431dfa..f80989f7bdd2f1bfad843b1dc30fa263e083d17a 100644
> --- a/include/uapi/sound/compress_params.h
> +++ b/include/uapi/sound/compress_params.h
> @@ -43,7 +43,8 @@
>  #define SND_AUDIOCODEC_BESPOKE               ((__u32) 0x0000000E)
>  #define SND_AUDIOCODEC_ALAC                  ((__u32) 0x0000000F)
>  #define SND_AUDIOCODEC_APE                   ((__u32) 0x00000010)
> -#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_APE
> +#define SND_AUDIOCODEC_OPUS_RAW              ((__u32) 0x00000011)
> +#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_OPUS_RAW
>  
>  /*
>   * Profile and modes are listed with bit masks. This allows for a
> @@ -324,6 +325,23 @@ struct snd_dec_ape {
>  	__u32 seek_table_present;
>  } __attribute__((packed, aligned(4)));
>  
> +/*
> + * RFC with info on below OPUS decoder fields:
> + * https://www.rfc-editor.org/rfc/rfc7845#section-5
> + */
> +struct snd_dec_opus {
> +	__u8 version;		/* must be 1 */
> +	__u8 num_channels;
> +	__u16 pre_skip;
> +	__u32 sample_rate;
> +	__u16 output_gain;	/* in Q7.8 format */
> +	__u8 mapping_family;

This is where optional Channel Mapping Table starts in the structure.

Should this all these channel mapping memnbers go into a dedicated
struct snd_dec_opus_ch_map?

> +	__u8 stream_count;	/* part of channel mapping */
> +	__u8 coupled_count;	/* part of channel mapping */
Comments are bit misleading. Either we document them in detail or point to
the rfc which has this documented in more detail.

> +	__u8 channel_map;

Channel Mapping is (8*C bits), one octet per output channel.

The way this is represented/split in this struct is confusing should it
be just channel_map[8]


> +	__u8 reserved[7];	/* space for channel mapping */
Any reason only 7?

> +} __attribute__((packed, aligned(4)));
> +
>  union snd_codec_options {
>  	struct snd_enc_wma wma;
>  	struct snd_enc_vorbis vorbis;
> @@ -334,6 +352,7 @@ union snd_codec_options {
>  	struct snd_dec_wma wma_d;
>  	struct snd_dec_alac alac_d;
>  	struct snd_dec_ape ape_d;
> +	struct snd_dec_opus opus_d;
>  	struct {
>  		__u32 out_sample_rate;
>  	} src_d;
> 

