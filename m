Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E905295511
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 21:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747257780; cv=none; b=NeN51B4EuSi0xkDRZVWTK0xJ2DLqlOrgi/wi3ik3ZPk19q38nG/NDTtsDKiFdAfKvNEQWcdMs/6/Tp6R5fcb9DEVo4bZ5X1cI0VUOVh7NC61ctj/8E30RGn3ui2c4RVuExH9x6kLKfqVK/Sg5hxqP2g7TkImnt7Lz37Wc/o47aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747257780; c=relaxed/simple;
	bh=c5fFV9H+BSKBtutgT1QIm/vnu9c6kXchdedMNOkK3yU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QnvYDvX0yDdJRePuNUMLKxIpUjRdFnXj3JUMp5ccv+murGqicUEOV8pGqRm7tIX4DBNyrz05iyWNFzFpXi4ERl1e5iWjnAkhXtv+7n9kBekK7Nn62IXnfNJ7iW8XCVtSX2aPImOFlYpCHc5HrK8otvbqQ+jpqhv5nAK1NuheC+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J68amNSx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J68amNSx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKUZQh014231
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 21:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=064MyDQuYylLeG1j0XexCtNC
	r+NDg/CL9KLNtbflBNY=; b=J68amNSxaYN+rmoWT0YtdKQgLO6b24PclCq2ELTV
	+UsMezllQ2hDMmo0TGE6MytBx210XubPiL/xY8e1/U/s2uo8Tsmjp2zIivLZls3z
	3111idzbGmKOjBZ6gYEZTc1ttjV3j1FjJ714qNtO+qN+4HxVuuoKFiK9UEbDSQmG
	CFCTFulhqaW4T6ymqihULcS+uwuCoPuBX80/+ob6cHT8xpTjTIB1Xn3MIwjqI9Kb
	EmoZKLNuORBySCUjI1ZO+AdfP1oyW1hftcg1ItZRY35rwW6/TSoSSqS3zAYfCdJF
	dH+AkD4cMsw5aZpM5zFh1fIDxZMtYkL4hny8biwifVUKag==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmm5ek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 21:22:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c53e316734so43884785a.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747257776; x=1747862576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=064MyDQuYylLeG1j0XexCtNCr+NDg/CL9KLNtbflBNY=;
        b=Tx3PQiL1shbzErA9MPA8XfM5GqXEG7f1XCvIcMReGr3bRV8Oey9+YhUfOl3KO9DX65
         /YpQGVKM5LZbcu4KJV9fvacHyNQrUZdqDZObZItsaU/Xwh3rrfqjhjT3/o4iL0L6eyKp
         g13fQVR6A6fK+y4YjTlq6Om26EBqauLTjdx+QEHDyRY6aeKDk3SAXXfzah+tDJA9+Rin
         YAx+5IofEPJ8bJeiaa7ex6n9bZ8g3tgiSBqpF0KGjAPasoil1qDRb1td7jVv+1TVPKGy
         b3UUjL/3y9jpcHTmyaZN2O8Ueykw48OYFOskIShVdQ5ayF+JiLyVzCWbJHhXP+oLUo9U
         6WBA==
X-Forwarded-Encrypted: i=1; AJvYcCW8XvMVSxgZmvBxa2FtFn4s0/z71ifazBM9WePFlkZW9nsWlgTQD/8o9a/LS0YC1yjMhWDxs7SVJBWJZ2U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb72gmkbJK6ely0e9Coxr69qciKNKvYQ7QM1NsRxlPCV8PTEaX
	lRs4eptye7W29HoICWMkluCawM/Jlk9BPsKmh9YWsy5ZJx4UpDlS64ZR+yCueH/xoSsOyHcdiHq
	XgAuRkx1eLzyEDoQ645JS9z+CCGnTJg6QFsgimGryIWiUYin+btxS5tXJTToUrcg=
X-Gm-Gg: ASbGncv+2+39Wk6ORRBUtzk1FTPfCkbuAJgUa6NqQUZp3I7UjNAYyY9+cYbsLIqOo66
	ScAsXXaYOHnOCZaD5zr9y0WtsxgL8w64gK8I6+Q5YQwtsFb6C7JA9FSqOJGbuZ0MLhh/IyCMl/+
	ZVTqjBIekIPXBACQJWQETuw2sEWw7hyn/1a5kgkJ0KgC/FFVF0ca40NQmb5XNUu3Q2wQ3IUjWVO
	iGhBKwuo7mrwYAQ1XfYMO/qZLuwXSiYG/OaW6iyqStSMjIKqffcxguTlvZB/yPUudKSACBW6J+p
	ICOwRxTZ5tLxe4O+avEXhZajgCUnWXFpaWJEhAlfPFKCPCoywaKO26qXr2STCaLGSSkEX1zXkJg
	=
X-Received: by 2002:a05:620a:2989:b0:7c5:3c0a:ab78 with SMTP id af79cd13be357-7cd287e1660mr752080385a.14.1747257776274;
        Wed, 14 May 2025 14:22:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLV1/2fnJECiXioDxTilYEV8/FDq4Qt+gFh1FFYDFUWJbfrTbaGUfU+3rDWQ45mW4pYh9XXA==
X-Received: by 2002:a05:620a:2989:b0:7c5:3c0a:ab78 with SMTP id af79cd13be357-7cd287e1660mr752076285a.14.1747257775907;
        Wed, 14 May 2025 14:22:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b6f7fsm2368791e87.134.2025.05.14.14.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 14:22:55 -0700 (PDT)
Date: Thu, 15 May 2025 00:22:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 12/18] clk: qcom: camcc-x1e80100: Move PLL & clk
 configuration to really probe
Message-ID: <hymvgbzqup7d7o6kexvigwgdc3r3vlbjfvcb4x2czjuygqbmw7@ufxwky3r7ab6>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-12-571c63297d01@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-12-571c63297d01@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE5OCBTYWx0ZWRfX1pzP23Un3utc
 LBeGuII2M+BgRP87AvZijVn3kCf/UmVm6/Xxxd0v7m0gpQ20WOfydVkNU/+Um2LEhUPe299J9hl
 NLxQDkI3p/S0bb+Dxh8IWHPjfxVFpfOPd8Y+XFaxOkYYYYG1DYIUi9YypYgI6wIl7GRZgD4yEdh
 RNe6Z0l172XyN7u0+PRDcRMPzbjw/T0/bG4qIzhrhxOK98dXs0qORKZEyeH3czgTJFnVrL+OCl0
 reXfuUDsHAcuSwF56VjtqewNrRVgBSfMU/xMBcuARfPYUrR4fH3mwDOfr737TGhKpo5W+kmPDCh
 Pj5kA7lsYoa0/M9oK6+FwtROi3yRmet0DMJ8BIP0QWfLUteUAKVdhrLr/eUWONKTpZXhOkEbT4I
 bMBc73Iu0ADgyU73B0mSPWCIlO/4UJgtc2iRYN6zb41gBahPiDz6DNe4boKqOJW5SObtSnSx
X-Authority-Analysis: v=2.4 cv=G5scE8k5 c=1 sm=1 tr=0 ts=682509b1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=R-MJ-YjwOO2PQHfhffwA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Uy6lSzTm7FsEDKh68kCNGTYsrTqSOkGP
X-Proofpoint-ORIG-GUID: Uy6lSzTm7FsEDKh68kCNGTYsrTqSOkGP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140198

On Thu, May 15, 2025 at 12:38:57AM +0530, Jagadeesh Kona wrote:
> Camera PLLs on X1E80100 require both MMCX and MXC rails to be kept ON
> to configure the PLLs properly. Hence move runtime power management,
> PLL configuration and enabling critical clocks to qcom_cc_really_probe()
> which ensures all required power domains are in enabled state before
> configuring the PLLs or enabling the clocks.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # Dell Inspiron
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  drivers/clk/qcom/camcc-x1e80100.c | 67 +++++++++++++++++++--------------------
>  1 file changed, 32 insertions(+), 35 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
