Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA54C78F2D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607774; cv=none; b=ealG5hsP6udUG3YOmRM8ZF1isgHi/vnKMa6cvjlU9fUK1sFA7Gh4WkrwBXm/xI/OrcnVRK9vkGTNwfjhHDLL8PN61MN/vVWxGsmWigiQ5/TSG9OHW6TGwjdOZtX0IjERB9yVUN92w6YVGo6Us492aH+H0DlEd8K01oRJ3iL+PRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607774; c=relaxed/simple;
	bh=pYCkWUjNE3NuFqcQEgnTKGicdGzX1if1k7WgCb8+6Sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIvyekDbHnZ8POlWj7z3CQYlRU49Ln8UTZpQmVFRxX5vOcN+Wll2uGqpV6YmSyTy9o4xAQx2CbzrVpqbBCD4svG5WqC5gqh7bbIIqz423eZz26kLXk9YxSE6R6Va2Sind2F9UF2Sa7Ynp5QwG2QOXv2p8mKHEpjvDMFco2FLaTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A0MPwPKf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A0MPwPKf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJv9f024846
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nkUUiT3ss6IH9EIAP3uPnI28
	FMp0pQeC3xvyjBzjGrE=; b=A0MPwPKfawqBaD6ROdG6oY3SGx5ZePkWdkE3TOJ+
	6va1AZ8QH/ZtqM+hQXghYzF4Z2Q7sPaxEehgHwvpulGN7AIwHQxsWLnEoXxB+MP6
	FZ4Ia3W9hKe61mUxgbWFGA0Cr5+3QPlZcZmuufEMf0VOE0Du5iPpA95QKmBDJxLG
	w9RYOeck4ixQuldhuL7Q0oxM/giaE423/PyFxK64LL7axYrSZbC9H3QG1NzBtcnF
	pd0yNRAcPMNjvLqf2xCMDjkzelIzveOqxqcuy8sHet3xIyUvO9tADWbOSf0ZI0hu
	XefuWasLyULaY8k5IPIWA1SdXqbHe18ajF9rdRjOfvcjcA==
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0swyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:02:50 +0000 (GMT)
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d91a0d3e15so28293305ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607769; x=1746212569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkUUiT3ss6IH9EIAP3uPnI28FMp0pQeC3xvyjBzjGrE=;
        b=opVXjAae9SdrReb2NKBJhQD+lD8uuuktJFsKktdjSrJmkhjg29BvDzTUaO1c9sKwtM
         5yvaJnXg4KD0sYC4CK++diFuzsBVbDyoAkZn7CiTXe+l/ONtrOIsCSA6r2bQCjmS/Rlg
         lPc/h0ZdpZk2+fm3AnuZACfIuUJnnglfavUTSWM9cpvwGl4UZW7zWMz4hF5LCwU8NJTZ
         0HrbUjsmMNSX3ef7OSB8WxOC2+D/yRIg4BUrNdgqhYuj14EOa1H5g7OL9rF0eMbtEDJQ
         XS85GCK8lpsj8YtSh64NZsN+Snh5p5BOwess5RWI0TbY2lvnWl6DSlA5L6zN4tWxRrDA
         CwAg==
X-Forwarded-Encrypted: i=1; AJvYcCU8GNscVeUsg1HnEuZkeWvtfwCOP4J+Cnv7orL7gULlFvvX8Y9ysFN+7D1VEydD7Awt5jINbxpOAPF/Q7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRsm/hKJAzkFvxQdfFNHPOFlpdOCnOMpMtjBxEqBOm8H4lqSX2
	d8S1CduxGhxn4hiFyYdJeiizfr7mFZD7JPMbqAw5Y+pk6mqkWTspuD1jan7atT6tUBSyxVC4qlM
	ixJWZYsxHIDdQ8wQJiZVUDAyBW8mjyCzm0hogB3kLMh4U17tF9512wA32OfhCO3Q=
X-Gm-Gg: ASbGnctxBZmvztJjCQhRwep887U0HSf8d6zsbPOhsERbEwQy1Q6lN2O6bZyKR7y5Zlo
	ObsT3/jlBdV5diKIOrMCQepHX+nrSvTDPxMbiCcYXgFQbxh3xwW4ZIszkuizR1QYO8O4G4/c1Uj
	6RyfT0ov6XxRHvgSBI3bhdFcZGufhvCXmgVNQ+40D6gATyAQJZdSHyb04u6CO+2ehxyzo54WvF0
	lQe18LCwKLlSqO8xAZZXZ/U+c9jGPPRVqJypTq0wZ/baIDrU7ZSF2RzF30qhPsVqiup6cV5x+z0
	J4AhIskYy8CXp/etPuEn0kMweC1AQWKvt21+eEaAzL2a/9GugsijkKd/qi1p2WQjpD8UsBPxSU8
	=
X-Received: by 2002:a05:6e02:238a:b0:3d5:dec0:7c03 with SMTP id e9e14a558f8ab-3d93b479e3cmr39269205ab.12.1745607769319;
        Fri, 25 Apr 2025 12:02:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhuXvdR/qmg7RMT82loQhMhHkY1RAz50Xasf3Q8QcQs/adSctEEm2ILPuO8VBKeb6d+RFAAw==
X-Received: by 2002:a05:6e02:238a:b0:3d5:dec0:7c03 with SMTP id e9e14a558f8ab-3d93b479e3cmr39268695ab.12.1745607768937;
        Fri, 25 Apr 2025 12:02:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d206b703sm8497861fa.114.2025.04.25.12.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:02:48 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:02:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 4/6] ASoC: qcom: sm8250: Add Fairphone 4 soundcard
 compatible
Message-ID: <rhfklvynn27x2lwyygk5rpjwvx7p6bhbkmc5jehuy54ilhnzbz@wuhcndngavbp>
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
 <20250425-fp4-usb-audio-offload-v1-4-f90f571636e4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-fp4-usb-audio-offload-v1-4-f90f571636e4@fairphone.com>
X-Proofpoint-ORIG-GUID: 0QXnqYiTIkCHbTArdOiNzQvTIH8xK0V0
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680bdc5a cx=c_pps a=vy3nvQW9C2dqy/lMnN3IYg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=GtLuwp1ogO1-ZJmtaBoA:9 a=CjuIK1q_8ugA:10
 a=mHQ74H5e8mo-RpSg_uaF:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 0QXnqYiTIkCHbTArdOiNzQvTIH8xK0V0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNSBTYWx0ZWRfX7fbg2jO2LASW m+HUAvLWzxFisoX/AdVnqyuFid5zgel0bbR79q80GtJtlUTgjQwObG2SvHlReBvvWvGkbzJ2zOg bYE7e8JkXC66sGTAnNyHSqJ4UjO76wGtTh1zvn13aLNox5npMZnxQrngYdV+getpOgC1wki/D43
 CtDl02k1RMOYxKR3XqmXvPe3/la/gjNsjDSU/6l6TSPbRZbgE5R8RWZmyU5W0AQQUOg8g/0RGRH qXaJuWkKBhycPt9U+GKpXZyJxui+/s8eQJQILLQXd9ndsnrwMnmo3H6hC4CkoVCTW6I5o8m6nA7 vmrvTT+urHPZS9wKTrIdh0tcoU3kDwf0vQBMy5I4VFhdcoElK3m6VNM9EdWHY8HbgTbvIxKAojW
 Sq6+kVabFcuWL9S7pKTqWZ5RagpR8izMRKPxnUMq02LYO1XL9AtjbopTCEW56QhFnSf00baY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=871 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250135

On Fri, Apr 25, 2025 at 12:44:54PM +0200, Luca Weiss wrote:
> Add a compatible for the SM7225-based Fairphone 4 which can use this
> machine driver.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  sound/soc/qcom/sm8250.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
