Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6DD1C8633
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 01:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751075740; cv=none; b=KjivYUut2AFGVE/vbEghKxG/DiLi/ucZZ9X7eCfCiZtSsZvMk8CIcstPUNh9wx5ilxzgb3jowMjqDaWP+CBvmiwJf6Fshwloyhzn+rrwP2D6rVAF0tDYcFcYayuKaLu8Kw+FE3ev5zOybvYLydiPNpQqwRzhVJEOojHrWdbNrsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751075740; c=relaxed/simple;
	bh=Yj4HqbTO+hsJVkoO5tBN3KU0UwRywL0zRbgyWn3HDWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwCDyjTCWZuGeVdff025skj9vu7OBYqtcToRYeAGxxyyyGoyVALooNpVcuUX/aGqlhhSQWaHB9tBCUrfELcx+aNIK6sjjIL1iZcsBuw4vgscjNOj6prZEDplEZX1kldAX+YerYK2bI5WcPxCt8FWG8HN6MDT9dofJfyonwuaKA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BixOOQ14; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BixOOQ14"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0DDw5004693
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 01:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=It1FpRXOceRECWa3Bwdhslvh
	PP0irZBQMnIJ9MHFFPo=; b=BixOOQ14Zw1BRrBwZSFhHjchS17b3drzrnaKuJh+
	jL+74BS+dkHcuuZ4i7GvJ0oIGav0dCPs4gqEE9tlYHuKCn/gCEO05GqGdUFpMM05
	OyELt0kTpE4DUa2FKGpaX2UxD7OnLKT8RbkPpXEA4zFfdjxmjiuGbK0ETQwbQLKU
	JYUBbXJCSU9DRUgoFaxxZnEB/eMk0F1TvlX7PGyW2+bKMfJz5vsgRzzFt+5RMh7z
	KdlezfBon0JeFO31AR55GFDm0y6FAr/ai4d1JI67WQ4k2Jzgv1ihxmpNgIZDOseL
	6gbHTebLZ4067njGpjd69rM0iu+WvhHlnHWNGbft0jIZsA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqxrtf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 01:55:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5cd0f8961so65745785a.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 18:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751075736; x=1751680536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=It1FpRXOceRECWa3BwdhslvhPP0irZBQMnIJ9MHFFPo=;
        b=YoJtNPri8Irr+rT4OyHuFDVQTwS1SQCcWx0YhyEUcLD7XJZi+mYj7pIk7Mux4vD2PM
         UiUkoHYP6ubsFzVTFrpxFamUaehXkR6RPGlfZxGhnDgQJ1w1Q6uZDZ0hAkiTgZyQLpWZ
         By2nooU+i+6BgRN9L9zlUv961gzdj5wa9+9oxCvLfhU5MuZrmpu6X0/i68t7uUxHOBup
         fGbu3O0vwUex5mlQwVxPK/C/gRP/kBqWWrHnhiwwDl6SIrkTFXI66+rp+Vx1PfQs3Xob
         nK6JcwcqUGOFK9vorS11CfokgSRO9AH1hvRpV4+x8h9cGQO6ZNH9npH0ArIMlz/Kkque
         Ri7A==
X-Forwarded-Encrypted: i=1; AJvYcCU0GkVlhCj/v/qtL4mDaDCiKu+6JxkcX8C5wYioDO7sUnvqpNPZxG7uuOdnqhws4SMqcL69MQyWd9+oBRI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwynFKu56JxhVUb+flRTJjPiIrn3F/cADtpLUpiCFS2qG/AQZLN
	C4irrNWi/An8L6zAxHiu/V+MTNDAJIbtn2+Q18TL+FaVL/nujJBCf8u2av1aUyORUl8/iw8TzVI
	5Num2ui2aaZk1xBX5RxmAV20z9fsDzXRSns1/orwAhwV/O86Pxriq0bjPD7zua0ciAEA=
X-Gm-Gg: ASbGncuiwXEDgOV4QrlPbhXhsSEMu22yJUgwRwPITCBGDz5xkL7cIbLCTq45kZZmlh9
	dlbWeSmwcq0ZJ7FldD+s5j8eS3rUYPyggWSr6gyEgBrazozzpR6D/rf6M2FsRu2Hd3J59e9d6zy
	+NQBR4imQqG1bTbds4z3HWho0ku4QM5dv+dY3Oo0vAaNd2c1JBLSN+xhxI4QslYLRm4XQc11YBO
	Ci6Dgrhdosw0UwQfyy5kVBzEku39hyTiuysAXRFTMLCj4vnL6HRG2Qq4gRFdoDTb2HDhbcep3JV
	fVeq4ifzhKdUqAwvjVaFt1QaBWkdf5yp1R2XyyYea1fy8LdNvx7L1aQWskqgqK+wYF71OY974jW
	KCV2wNZ2nWA9BjPVrgoVZo+qEeKq+3iPXOtU=
X-Received: by 2002:a05:620a:46a0:b0:7d3:9012:75d7 with SMTP id af79cd13be357-7d443976abfmr871096785a.43.1751075735689;
        Fri, 27 Jun 2025 18:55:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtab+OtC4EBlk9U3wu7wzT8L0Rv1HTjySotQtNdoIMLlCUeXq6oWJfdAb/GbiKRGr/Dg4hNQ==
X-Received: by 2002:a05:620a:46a0:b0:7d3:9012:75d7 with SMTP id af79cd13be357-7d443976abfmr871095685a.43.1751075735347;
        Fri, 27 Jun 2025 18:55:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2f007f7sm6835311fa.94.2025.06.27.18.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 18:55:33 -0700 (PDT)
Date: Sat, 28 Jun 2025 04:55:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/4] arm64: dts: qcom: qcs615: Drop IPA interconnects
Message-ID: <b2fpasn6ki63yxgtjuxpalpmdlqjaym4fjmzw5mupeifmxzrnk@bdfdnxfaqj5g>
References: <20250627-topic-qcs615_icc_ipa-v1-0-dc47596cde69@oss.qualcomm.com>
 <20250627-topic-qcs615_icc_ipa-v1-1-dc47596cde69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-topic-qcs615_icc_ipa-v1-1-dc47596cde69@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: RLRvX-9JXR3L5Em28e8fjVLN37fVQ23w
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685f4b98 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=phXncWpSF8SbJm8Som4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: RLRvX-9JXR3L5Em28e8fjVLN37fVQ23w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAxMyBTYWx0ZWRfX8nybOuR+Ldn/
 Tl4lyvXrFDM9DzyO/GcjghgGHhpVr9IWpOMyGTymr1RSRU64Y31sKdRr9c7FHsTQ1MBZowL3qPv
 D6fG1mBJJE6BjmwM8FlRDvWD28PPcdH/v2louuqEmv9nNSYApJipS4VWz2X0BXq/rdqXCdoijNZ
 V8V3nWbk+8CrbLcLF2ZOrPwOn+rhdWwe9TaHU2wZJagrKDBX41oByNEZ9CIA9856peZNzozlJOC
 2loGAh7SI2kp1g4Fy20P/D2vgafDhrQylnq6dSwMef95bWU9YP0Zco/S3fM6qik2Hh0FDljR4tM
 nQr20fkh4pb37y9x+h2ZEtB3r7peRFpVqVekE8lAVGkNXCnDXkVD5jRcUIyXV3iFOe0lP/Ol1Pu
 1qpP2foxmKPVW0bF7Y1DSnGYgTd935envfghUEMusKgjkD5tftd9IwnrRrdniTpCUvrt5n5r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=732 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280013

On Fri, Jun 27, 2025 at 09:37:55PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> In the same spirit as e.g. Commit 6314184be391 ("arm64: dts: qcom:
> sc8180x: Drop ipa-virt interconnect") drop the resources that should
> be taken care of through the clk-rpmh driver.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 6 ------
>  1 file changed, 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
