Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA240236435
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745572082; cv=none; b=GcudtRkXrycs94jg1u3LFnwqvwBY/ck+QPyDvkmDdgL9wn5Ri4F5l8P53/WEUb8Xo4o9wYzliqjU6bHRc8k5xbwOvt+75JCvpouoTvYkFM6BJXFqw2WsnIXOEAVNMeUxyMdssALDAhwTK0UR2IBZCB1WujDkPSGg18lGGT5Kzxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745572082; c=relaxed/simple;
	bh=DsjDnHtiCgBweWj2Z9rRF9NFYYy/5gSoExnp430J+Js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zxv6PLZJTDa7ApSfkTzaCWs2Sqi7IGJ3aMgl7zW9HLGbAX8wNDm2D3fdXaT9tMZXqjcCy1yjXXEd1P4WNh0OgPzpyB80W5xiiM7mRzolVwjCjtI2VTtcVQktjlohElmoaU1CXcCJZeSCDBYIVfYvJ+GtiBOm6enmIRa0TWrkOX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R37HHpOU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R37HHpOU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T6Tm019782
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E7YGT9JoWm91VFNYG/u4ZzAL
	7c7lgU5OKZbu1IKjJ28=; b=R37HHpOUIk4ozHJYiR/Vf6YEkpL6IJnwmqdF+5D/
	Efzded7xua0q/u+CyTp9Zv6jKWBABfo7lgKiFApdm9UcbKC4jIf1amT0KxH3bbLZ
	FLWfEcCHT3wCUpHOqxSJ7752t7yf0yAv6XvetfRfvEKikA3uUX1Yx5HM8+azt9hW
	YQv78cpdaniUK/Bln8YCUxYmNVgQ0UJOsyyrXtNUb3FO/+vSAjCe90T2z5pPzFea
	mU1OG55KJ7uNj0zotoSiZhxPf0x/2Mj4APd9uY+bzL8UGZlotVbymTdvZ8o4b9Db
	zxKz2YpdNGirhCI/apCdUe3tRMWdP2hG2BDSbijWsWmAPg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2geem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:07:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c95556f824so216831885a.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572078; x=1746176878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7YGT9JoWm91VFNYG/u4ZzAL7c7lgU5OKZbu1IKjJ28=;
        b=Vs+xARXpsVJTjCb4/Gs3X/n3I/UGf89FCv0b01fE440TwFZ3qv/rnsgLbPCXzwxAss
         HWz+JWIsUgQrahaUCiyLtHVw1tltBnICrY8poj4c/LBIfmEWotZOG/c2TUiC6IUTFH7M
         9DdxlgvTAdXLAfgK9jBo/d1gFGngqQX9YUO4EY86uv6y8V6UlsjCuoU+ZqXOeZPJ2Bd3
         GVpmA9y6BgQNHI1yGl2ZYVWGCP9EetfsNAPW5JL+l/F3xs8K2slOHLZzyXlKLdc/NCXk
         yzs5zOooSTvDONR/1NyAgqUdo1qacZ/w7YMlPT27+WzyeoN/eWIMqhwvNEEgNCfwajqS
         yBZg==
X-Forwarded-Encrypted: i=1; AJvYcCVoRIWhk5oTbZaYRcxD+Vsn2u/Yh71PxIkKmiw2OPnG8DI17VGkum/aTgbcqVwT7qxx40fYYngxVhKfj5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHbH9PEqklbFCnbrxpooOtta+G++GvXC7DWD35eKkHGwOk5Gsg
	59PgXHpeO1drv+7+MhO6NJSZUcn6NdbaTJUFNCiCT782BrTv89XE6NCCldEi9bssYh9PC9jNrba
	lUidspmFHSMv899ISwbGYNzt8ZJ30fx+KA1OpdfQ7zrYT88P843mWgTbvt5XikyM=
X-Gm-Gg: ASbGnctubSfuotW8Qiwe7mbVtBlIK6M4pYt+IRjBkyhSqfyvvJUyc0AtJzeOEfsKwz7
	se2JagUYyjegL+QNIZE/4ZC83XqFG/CYuSsotrRyQJlFdtiyiHhmruG+yRDHHnU96wAs3BvPFZx
	+zITnAgFF36UG2ppoBIwl9LSc6FAJbilDqR1f3MgTILOFSz3ZljXSomeUICUlpuewgVHlMly32o
	seHGFeMDUAby5DDiurwF8CcWHfjMeF83IqgSanhu/lo1erU/O4PG7z5k3b4Ip+FdBUvigBgy6TZ
	h5bYo//NkT/eQel4vLxzXV2YPe+Bpjn22fAUqH0thCGEdA3z80fH8NqWxXLZhCV0L5XwBRlu2oo
	=
X-Received: by 2002:a05:620a:1b99:b0:7c5:a463:397b with SMTP id af79cd13be357-7c9606e0b7dmr246311585a.20.1745572078684;
        Fri, 25 Apr 2025 02:07:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHpqKgmY/joCABcKakjj51b/bf9LSO5bp8KVEFf7NSYBd5yr5G0Dj8JO9ClMIekjeU5G8jvg==
X-Received: by 2002:a05:620a:1b99:b0:7c5:a463:397b with SMTP id af79cd13be357-7c9606e0b7dmr246308285a.20.1745572078331;
        Fri, 25 Apr 2025 02:07:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb83dasm520591e87.249.2025.04.25.02.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:07:57 -0700 (PDT)
Date: Fri, 25 Apr 2025 12:07:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] ASoC: qcom: sm8250: add DisplayPort Jack support
Message-ID: <cgog34zs3e43n23mkt35swvu2ibuoaav4ccrhjoizg6b4kgc63@36blexv25aud>
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
 <20250425-fp5-dp-sound-v3-3-7cb45180091b@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-fp5-dp-sound-v3-3-7cb45180091b@fairphone.com>
X-Proofpoint-GUID: eilFcjn5PBUQuxi4LsxO2jkKR12XBgi_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2NiBTYWx0ZWRfXxAda/n/egTvU R434xDxnIpaIRyKmiko9OTKq/xO6hax9gjPuOWWYWyK26Vr2Zg6vn2dVCGNesoVjdnQvMDB2Qpk IO0yPQwu6sljKlgwVxC8ZpHHJpQIJulIBNI7osZl3/7yWv94ondjptEf23pB9OPC1/d05el8Fct
 EsBpt+AsgT+2xvYgu+kmALQlbLpQ+FAnqZjPipgpnj9QwPpMdt6k2Toh00Xmxt8zPuBizlrS6df 7YYtX7bhjEFx9LroQ+0h4L+gW/iidHxYIhjzwNCDeWUWKFmhuctaY0Mdy7Qq+hzxZGFUFGLsRT5 TYbwuNEz+zD8qa7HY+5f6XjgO31mHuI5jDsLbTf6c23l6W5a41ZtxBIL9aIukdXJBcrTFCbX3SJ
 wQioC7u+SvNp7M9TbCPNFJ8uPoB/AzM5B9yySeiZ2JFeJ83I2LmPam7mFYm01REm9rYzDX6m
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680b50f0 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=EBsx7UlYEkoSbB8InyQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: eilFcjn5PBUQuxi4LsxO2jkKR12XBgi_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=893 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250066

On Fri, Apr 25, 2025 at 10:07:27AM +0200, Luca Weiss wrote:
> Add support for DisplayPort Jack events, so that user space can
> configure the audio routing correctly.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  sound/soc/qcom/sm8250.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
