Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5FD295511
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 21:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747257632; cv=none; b=DsrqjrnE+T4ABhihJoTdiTfyhrJZvYXIp5Zef1A34Lb2ejjSxVRo/lu1GjVlPSBhcs/czKMgxVirLLsVEt1B2SIe6X6f7TJFqMLUkpG+cMzRm+1OESkiw4FiBvDAJiCVd3kxQ9r2DI8qXC/SXldG/f+erGf9wbzK0UenxsRC4ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747257632; c=relaxed/simple;
	bh=dKXXkyeDnyVFW4grSfvrYpjBsDjCE6AcHIzvzvZQQKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppQbKIm3aqsnM0Rjz8Gom0u6ZqrsWGiH+80C5isffb4GuHgsoedj5DavUc67wV+anpLWAXIYDCQWDxuY3mXxAG60phRZwyGkgzsIH1ESmX9lNxKOE9DddmWJlnvOsLvSss8pWrlXjQ9lyDqGR4EZVRIVkeidToOIf9K2uY6oGUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vx5izDoF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vx5izDoF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJYUvA020112
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 21:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2GCgOGdrnZt0SFcUDKGI7c0L
	8gkL0wloGd+Wl/mh66E=; b=Vx5izDoF4V3qD8sPR1lVadXnS1mchmLGU8f32SnG
	F1tmTs/7Ka8nBbPLZ6//WKOeSXfGHkv8CofdC4zhwyRdLiBrXFX+TfkS0TPvbBtH
	TnV9U4/tkdV/cBeX3k/F2deSiK05S0YUgVb4zm/r4gcYutJEhYvYVkoTRA5zkdt3
	mLHcjJH9YwCUDE2N3GwJVzzQlGx4RGjFvzMeD+P4ARJbAllBChUCVadEj9bvGPVi
	Nz1OSRzvgkXCg4h2FxJhjPJHb1NYzG/+oY3x44v1ie6/kO0MOahIPRLvJ97yAYM1
	im8CkP39vj8hC+Rv/Kuy6wl0asyCyjgTNSdzN/saTvEFBg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnm3sc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 21:20:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54e7922a1so50651985a.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747257627; x=1747862427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GCgOGdrnZt0SFcUDKGI7c0L8gkL0wloGd+Wl/mh66E=;
        b=MxI8yI/JcaFfRVipwrUohOzDN64hwmV/4+Oq9aAW84MFWcFZ4OkAD71Mk9eqQOp8tK
         xZyIYTqb3e+wOCqfHVBva3ZZ4zsgKo7xl+hdF2WQbH2LPFoJETf1Oks06zYXgsiG8PRp
         ek17MA1yZbo63yhLn1g9HfL04koeY0LEdR+/CGMYqOcaH9oeuwixcKBceQRFV35mW52v
         Q2m+ops4v2FPiUQuHWKWAIBci9ozKldfKgr6AZnG0TuCbzRJWzXGP8IkopRQtOuIayFP
         Yh0uXwGSoaQFATLnD2+GiAEY1tJ18dLSax7ClBsN+SF+8d424FkcPyjZmuewBRMivvHA
         ymgA==
X-Forwarded-Encrypted: i=1; AJvYcCV/5zO/nh1vOTw++PBH/JzR4WibRbzbNz5zae9LrIbe9cHqDMf7jBgqe9NkoQoDFnKN/TomBc6S0GjNcv4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp50ACmkeFSRijuZ9IsWRhocy8HlFGfW602Kj1QeSi4wYoWoTk
	BW6xbDPRxVpQltmy/ZEd7m1391FFAKWDX20zOOMD1gnzJC36vaFeYO0HpI2TBhaphCU3lhxNTjH
	fwNfknY/cFLP/OSOyrrQXGdVAFoLul+ItgUWcbZFsqbaJw9PiFUXvX/XZvF1Dc+U=
X-Gm-Gg: ASbGncsQQBCvKdrJLx7D6UehJi0gEMl4p32SOdbQ/yba60BD/9dLJGY6jq4TiF80fgx
	6pQC6xo37ayMIpAp/GsdLu0FB06kuJD7z5Qrwb0AfMZr2sy9gRK5pUe3qbY0AR07duAa6bodTOB
	DuEVxfy4Puw3puo2L/C/UFeCL2mtOFWx380EQGsYAULON494fm4fUXeqqcEy9JIUvGG1dzexQgI
	seFjM49f2a19biCVaQS0IvRqiD7lo3nK+aXECrOFTu8DxGg9hh2gtHElaKhrbcv03OnytGlADZO
	uv9qcoSPHf0j2URCL3LkLFkN9fMBTY6cuyMVAEZ1eYSsRpF3YPYBb5F8kBmS1/Cs9nro+JIyhuY
	=
X-Received: by 2002:a05:620a:17a1:b0:7c5:5d13:f186 with SMTP id af79cd13be357-7cd287f8e7cmr636195385a.10.1747257627370;
        Wed, 14 May 2025 14:20:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3q4xP/KFiqPpFuTzMa6gUHpPuBPwILvvqRM11pnp2aen1rdHKlrCCS3ZIbWjmOhuvvWpyUA==
X-Received: by 2002:a05:620a:17a1:b0:7c5:5d13:f186 with SMTP id af79cd13be357-7cd287f8e7cmr636192585a.10.1747257626942;
        Wed, 14 May 2025 14:20:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c321f2d7sm21110781fa.0.2025.05.14.14.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 14:20:26 -0700 (PDT)
Date: Thu, 15 May 2025 00:20:24 +0300
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
Subject: Re: [PATCH v4 04/18] clk: qcom: clk-alpha-pll: Add support for
 common PLL configuration function
Message-ID: <s7ekugpsfdzxvz4wm7axshrvjudpsjgh7dlceyqtqtts5kmwba@q2rgggezzf4l>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-4-571c63297d01@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-4-571c63297d01@quicinc.com>
X-Proofpoint-ORIG-GUID: eNrekMSb2a-6zh8YzIazxYQFbSt5tPTJ
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=6825091c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=mbcL5m-RS8wsDEqdrk8A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: eNrekMSb2a-6zh8YzIazxYQFbSt5tPTJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE5NyBTYWx0ZWRfX7wmMc4MZRSYL
 VrdPJPFKdv+e/g3YYS24iwjFYYIg0V2Q6INt3okomMSt3XLoh9oS+exZrdyrL6bBBVqWxpiRBFX
 tiJyqo4VHLIQWMAGvOmIBkzZmL6Y+ndQ+821mfkQ8wsJeoae9d3xoi/8DaSHj36LOFlmO2goKJw
 FLSoGdYkeHR+XGJFeriDQIYczchSdWDSeirG7TAtoNOUOC107qseitExlabt/hg/yaGfq93G135
 ORb3IZNySSboE7Ahlc8r86bHnaJe36r7vbgFiU0vGlAL7Z2ubgBzuTv2LPrrQ/6xs+92DBkuoDk
 cxB5CGiLz5lo9s+LBmQL0r5i9Aj4twpoE0er2dmq6xgDxa1tvcgYM0Y2Dm0jadV96BipoZjl3qJ
 b2COWWZHOJ7bfTAvJ6jo0SMjTKY49JVmVjb/5vvjCzZbsdmRagG5SHy5LZDfjMnDjXflMOxk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140197

On Thu, May 15, 2025 at 12:38:49AM +0530, Jagadeesh Kona wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> To properly configure the PLLs on recent chipsets, it often requires more
> than one power domain to be kept ON. The support to enable multiple power
> domains is being added in qcom_cc_really_probe() and PLLs should be
> configured post all the required power domains are enabled.
> 
> Hence integrate PLL configuration into clk_alpha_pll structure and add
> support for qcom_clk_alpha_pll_configure() function which can be called
> from qcom_cc_really_probe() to configure the clock controller PLLs after
> all required power domains are enabled.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 57 ++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |  3 +++
>  2 files changed, 60 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
