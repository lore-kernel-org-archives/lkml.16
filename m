Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69982DC76E
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 02:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746152225; cv=none; b=uMlDMrFa7NbIKX3O7S/rQvoFQprcjRF0RTCssjAXcWW+6hlNoU/ihz2vy6CSU3xNj3K0FFY/sJxJSOR43dI5cXlyz7YqLmbjNqZq6WP8hMu/HflX3nbuGIcZJ2+fWXYmb72YgkNY0umWDbrojwoVsrDWXZeXQnTky1inZ+JP0ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746152225; c=relaxed/simple;
	bh=GOkCqQSrFxmRvTw53doxoDpQBDGJECghNqwxhhNN9n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WX+cLH+WIRcEpmHUNr2i6dPdo+yMlxhl2sCI5aavxRQYBjyTYhHivQTMpKQGhtQSM1ZfR5tBkmi9atdVR+SbK8PBntGBXCbu12+ogWahwXDU/55xXPuiNDPampBKaf5O9ds7L32h2OZOp99SY4k8egD9SZRs7dzpPTDzhv5un/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iKzJUoLO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iKzJUoLO"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421NHZf015251
	for <linux-kernel@vger.kernel.org>; Fri, 2 May 2025 02:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5oT72X6mwQlfV9dF5Y+1Ez23
	5tgKiUG4lSyv0Z4ZvLU=; b=iKzJUoLOGoKZx0eIE8ElnX9iQMmIGKpUlXajOesM
	/DJ6MKxQy9oRMMGc1GyXekkrauh5LvdOuMDDPwsifUkv6aoZqfIHXqHOzeXJN4gk
	W02wtMToHj5VoMfpmC3RRgihtclFjjFMwsSvsTTc+iRxnEJcLWnDCstlyLAZsIUU
	eGKYHfRsXm6QxQnfnYPBdlG82iirCVWcjUqmNzxBmpvoQcBS3l5YLJ9SLZFW5wpo
	Qbzh9XvDx7Cu60mVrBqcuxQdAQdw92lQJITPASz8oLQAOHZRg9Je504DjKbdHHdv
	oQ5ODdalCGvFWJn4ui0rabmtUqZj1gWuAhl/D9BEyGCg+g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uaxx95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 02:17:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c0b0cf53f3so237104085a.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 19:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746152221; x=1746757021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5oT72X6mwQlfV9dF5Y+1Ez235tgKiUG4lSyv0Z4ZvLU=;
        b=Du+Yk6q5PVGQgG2Oxp7puMYUToISjFeQTmEupFpd6AvERIJZyuIJh2ll16+uDUCjEi
         UnCGi8zX0QmQyaA0uzlzAQ+fQvvgtKUP5F4mYIMngbBgzbkTrUrCB4+XhENgodu7uLkD
         9mucwtcuQhDZCqB0TfGbwfyQ2hqshAG1hv7RyT/gSPHHJGyWJEbbiIZqH4kGdI2MHiLA
         DreX7lP+7gtztMR3/faZmMsNUVhA/SvLaubt5WQrzLXZl70vM9ihcSPq2d5vwtjYQKi4
         GbDrrBSygBLfwKUp5j+FNbm4eHbXR8wWcetdL4zcVsQLijc6gEffoMsrttOIUlNUfRAe
         A8bw==
X-Forwarded-Encrypted: i=1; AJvYcCXAxHCwo+hWfcpvgxXt2ziUZmQGxx39r8Pp61/+S1Sgezn/sJi9Sm6adTSPzEmHOMx9KAV/V6BxGnOUBYg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8big9s8R5qlFnF9A6Gu5rjGCYTzfbwa3lC+f9E9UMig9l/jaK
	2q5j6yKdNqiWfTyHG89AQvlmSk7gHgB7u8sfVEJfiuAQI1eBRyF1MA3+CDaC6nhaZsqaqGtxgub
	rIIrj7YG48R6P72PVh/9+n/OB/40HCjmP1dc4DmkczAfThEBz3OxnpfaeiQOxxkU=
X-Gm-Gg: ASbGncuI2O1RtqUuK5/hmv5M0yIgT3mB8WK74LTnGJUtW9H5yfF+O1MwD2sSUOudQWj
	vkKsnqP4GVvjgUZQlMbPXZ1b4GYA2M5aqfeQVJ6IoCqr0X8USXKD3S2n43ngK1/RnqledgKM/BB
	84rJIrzXiOUYtJjY3P8aOhUtDkDXS9SQqBewEA+V8sSdHi5kwFDDqLiWyxsZIebh9wpgm2JoaQ1
	u2Tr4IhMEhIa/DAcyceVjp3yZwW+retLqjyxMDBdnfI9/VGaCNGfMOCxr228oa7fniJeAk/0IXS
	b/phEhooP+pG0XISn6eCKJmaXRqSZJ2K1384iAdwf3qQxnGzptGKFhJvLdUF9S75qdwBaLBzC+w
	=
X-Received: by 2002:a05:620a:179f:b0:7c5:50dd:5071 with SMTP id af79cd13be357-7cad5b383d2mr192391885a.22.1746152221674;
        Thu, 01 May 2025 19:17:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRQI9OZkpJjJTMAHtR36kzYsQGo/Ucv1FSwGGm5TGym9QFJ2XyQKGj5FI6uUZZkWFC5pMDtw==
X-Received: by 2002:a05:620a:179f:b0:7c5:50dd:5071 with SMTP id af79cd13be357-7cad5b383d2mr192389985a.22.1746152221324;
        Thu, 01 May 2025 19:17:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202a89ef1csm2328001fa.66.2025.05.01.19.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 19:17:00 -0700 (PDT)
Date: Fri, 2 May 2025 05:16:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        quic_ekangupt@quicinc.com, krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add adsp fastrpc support
Message-ID: <ovokvdc5vd7txnrcnljsibbvtyukp33ml6c4xk5w7kf2vd5g4d@2sw7r3xmvw3n>
References: <20250502011539.739937-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502011539.739937-1-alexey.klimov@linaro.org>
X-Proofpoint-GUID: uu8SroPTeMcHl1SDOfEG9i2g77mkz0ym
X-Authority-Analysis: v=2.4 cv=KtlN2XWN c=1 sm=1 tr=0 ts=68142b1e cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=4kMaQRGzCb8m52ShnMwA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: uu8SroPTeMcHl1SDOfEG9i2g77mkz0ym
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDAxNSBTYWx0ZWRfXz8jzXkq2W3XJ JUK/SPnIQawWCNlFgewKVWjmAU0+Kn2qp7InuqwyTHcC6ynmm3Xa6YZz07RteynUPiHhgQMoG7t n8eUwixX/bQI0SKZytuEoTCd013xpnT++HDYWY0+I5lZDBFyPbkR21APlMZx05zZyK0zX68OLGY
 6WeFF63e6XFJASnTOIQF1sEdT7OOeJiRaYMqDvnIzy2icTZgPXzN+zN0Z7DYW3idSUxP5bqpW/Y TUCDjS4e9hPwX6mkVoulQNeUK5+F4p07bhrXm1VaYZZ4xkNVE42FNl0/Se4Yr2gKhWjNoUW1PD5 Dt2NdBljDSfV04hUtnPB7ExMzi6fUyTQpDiGlATWGB2IC/JRa/0gInKH9eSed40mePNUL/hHCy6
 LV3LEsUOeCLO3jNVZb5UBQhUPhW+p9E9TUuTKMxQee9nAVUwefHLco46gnr8YwB/mDn2lSwZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=698 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020015

On Fri, May 02, 2025 at 02:15:39AM +0100, Alexey Klimov wrote:
> While at this, also add required memory region for fastrpc.
> 
> Tested on sm8750-mtp device with adsprpdcd.
> 
> Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 70 ++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
