Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC093294A1F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 17:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745861966; cv=none; b=gcxQ5WytUj7Ewvs+7zOiZx1+S/EQtcajKQcMxGaoePTS5JZWtYlLiU9NjUEXtaINeqxsVmWla3vWGmGinF7xTMjNXQNVmslOxWoxcA5XT4atysa7niuxOST6A4YC5reCX6FeBwKQb/VRhgrhDVpSSSo/FuHyqlkbXx7wLW5mSbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745861966; c=relaxed/simple;
	bh=rMdgH1z5b0XG645DmwX7UvsPvQa6FdO63A/yWAGC49A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GiBwA2j/Qh26ylkHnelemGxPbFZFCNrby/1YJWZx43NsNWAuXMuOszWR8agj2P0FjVuEG0TyHvbYDpHn5FqtAd5JzYCZtrkgVezQZ7oU6wzHSNFSITAEc5SSML95FqvDlXSXFUTWSuhHBM0/zWtvGs+EXo9KdcDmQhfhMxlnRW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XRn34Tw6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XRn34Tw6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S9GRQC024699
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 17:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mI/HiKaz9KZWlPThwibrKI2Qv9tQ/yegSAkRcgBvHnw=; b=XRn34Tw6gst9RdeJ
	WRCDsskTUaVVsaraYKEiEir6D1c1Tm2kuXswuytZ3MrWZIyA9OK3GnxAGvSBjqXe
	hVKaud5gZJi61BobRXh2aowP0CzI/0NAmquMIzoWvNDa68WRpy2AseZhQCBVtqlI
	m4bb4q+62IqeNJentXx0RH4cgprsupH8p66kKk2paZ+x1LBE14FOpZXqJsh+PfoW
	chxayRC/FfciaMYTlcaVPpD438D7UNJrsKbCzwK3wQEA3QXaEXvDd0kRx/Kd4myF
	rmPq36JDPhgvo5+XupUotSGrYwAE5fJrQwG74UzE8INacgyAEXiMCY1L/XuOjkAm
	bW354Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnn0uug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 17:39:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-30566e34290so4630406a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745861963; x=1746466763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mI/HiKaz9KZWlPThwibrKI2Qv9tQ/yegSAkRcgBvHnw=;
        b=udcdulF6RaHPl9RUQws3iyadxfdl2ePHI1w54PHepZu1SVm5eEH/9gDNwMm1bJk7jC
         r3UdG6CB/iC4gEi748RNUTceuBgjDS1YeDLnf02Bf/3eJIvekgw0EMhXKycmXx2nubS3
         WuMXm3ev/5oShKxthuMgvmYa4GXRBiMey815F+0oYtGE7vlnb7CuVUSyinJy1IRjd5dW
         fxtLAulbRBBSL2/mL8vswWzwggwvXhh55XR2X6vDRq+yZ2mI3PQQFCQ4L1lthWGDSmyK
         QYKyiAUVYSdU2LLTGxL6NOW5VU6B0bNKvhrVgJ4YdRyuSO1qR7uGp3he1IydOaj9wm6r
         +fVA==
X-Forwarded-Encrypted: i=1; AJvYcCWYZSumFzb+RSpwL7QLTJnjSuf48y3J18g8FU9UxUwwA3AKOUG9fV5xZyC6FC0STVffp/2USnkaBkQrim8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFBAvKSfRRCR2wgGFoOedayezBUI/PZ+nsVmhTSzpmmzYj3HCm
	De2u+zcWlq8cS9+eNT/A0dQJGoGAYH10PV6FAVmbve6dfUL3OembMN7UbcdoxeTSCxKeJ4W5D62
	ER0dxNw4OgojtfXuyv0NC3S98k1WLbx7vd7ryqhP9FwlTew6EUsLtzT7ywapDDCg=
X-Gm-Gg: ASbGncvcrE7nmfEKjrw0aP+ckRPJOhp/5tWwYn/Qe/V3LWB2GG0ULbxP1B8KobXx+HO
	FWYLLElxUbYTMDh4IbkTzgvoOzdEMOKc0Z9QNYvgJW3KUhkrkFV62Qiqzusmq/YS/SiibRD6udR
	9JaL17+HkYdfw2nodoDK//uLxB+KZHQBG25Uuy7XLIs0pA+Glu9QjuZ5F+VwRfmMkBh9KucgrZA
	f9msNW9eq6kPw/RApHiev+7Y15hU9jfsPWHIievG0ysWKOBF3pCuWryhoQlZF/tuYy7P51r2pEq
	FF6YwWCyJVTmVAGec/j8gb3TiFaEDifSxCLNV12c
X-Received: by 2002:a17:90b:2750:b0:2ff:784b:ffe with SMTP id 98e67ed59e1d1-30a220c47c6mr285893a91.11.1745861963249;
        Mon, 28 Apr 2025 10:39:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR7p2L8d/2GX19iNf1giRAg/eaumctlcwhuhNojkhH3I0ZDBZ89gVbUpJkpWFzmeY2sqOP2Q==
X-Received: by 2002:a17:90b:2750:b0:2ff:784b:ffe with SMTP id 98e67ed59e1d1-30a220c47c6mr285857a91.11.1745861962896;
        Mon, 28 Apr 2025 10:39:22 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.26.142])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76cfasm86047575ad.47.2025.04.28.10.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 10:39:22 -0700 (PDT)
Message-ID: <59c49a34-5bf3-4f10-a98b-bb63dfd58f40@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:09:18 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: dispcc-sm6350: Add *_wait_val values for
 GDSCs
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
 <20250425-sm6350-gdsc-val-v1-2-1f252d9c5e4e@fairphone.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20250425-sm6350-gdsc-val-v1-2-1f252d9c5e4e@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TmDU_KEebs2SxZOGWAWrMGHqbzX5M_Oo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE0MiBTYWx0ZWRfX6TYMzMDtFLBO 0ZZIlxjI23zrRsg5H6RG2bB21Qah54IYYij1mCgBv6EPfzfQ8EMpcqxQseikd8qHYksAigugvPx sLoaWwFBc3TbVHcE+3U/kS1acp7I9+SIdebtdhANmIb8sontH6LHxccGp+RyBHBvd1QUMR29tjP
 d5Sqwqgu1BCYSd3U0PF9jFFMqypV/I3MNpXxy+X4h1teVfePfq7QIAehNbO+2PE+ZgNVGQCiqkA Oa24FAYmydgaGo3WHZ+yPmd+kVAUd2EXhStZN5LYBndV4jJ/hMvuQmnoYdy49+dkdFsXgAcdymw HssgAKtYfuHvu1uuDK2qLs6fejQ5byMhM6KhqCw8k2UE0uiC/opnie71IUZmpffdpXBeRjrQ1A1
 rXvSk+Oc9Cs5KaMg+Q2psKvTL/chDIN65x/bnOEn77Qe60j9GFKPkvpmg2rAKJIHXUFQrMpD
X-Proofpoint-GUID: TmDU_KEebs2SxZOGWAWrMGHqbzX5M_Oo
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=680fbd4c cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=Svr01UFivMFfsnZ9dZkWgg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=COk6AnOGAAAA:8 a=6dQnf3u2Ryt8jKbU0REA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=Soq9LBFxuPC4vsCAQt-j:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280142



On 4/25/2025 5:42 PM, Luca Weiss wrote:
> Compared to the msm-4.19 driver the mainline GDSC driver always sets the
> bits for en_rest, en_few & clk_dis, and if those values are not set
> per-GDSC in the respective driver then the default value from the GDSC
> driver is used. The downstream driver only conditionally sets
> clk_dis_wait_val if qcom,clk-dis-wait-val is given in devicetree.
> 
> Correct this situation by explicitly setting those values. For all GDSCs
> the reset value of those bits are used.
> 
> Fixes: 837519775f1d ("clk: qcom: Add display clock controller driver for SM6350")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/dispcc-sm6350.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm6350.c b/drivers/clk/qcom/dispcc-sm6350.c
> index e703ecf00e440473156f707498f23cde53fb7e22..b0bd163a449ccd2b27751e32eb17a982facf07d8 100644
> --- a/drivers/clk/qcom/dispcc-sm6350.c
> +++ b/drivers/clk/qcom/dispcc-sm6350.c
> @@ -681,6 +681,9 @@ static struct clk_branch disp_cc_xo_clk = {
>  
>  static struct gdsc mdss_gdsc = {
>  	.gdscr = 0x1004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
>  	.pd = {
>  		.name = "mdss_gdsc",
>  	},
> 

Reviewed-by: Taniya Das <quic_tdas@quicinc.com>
