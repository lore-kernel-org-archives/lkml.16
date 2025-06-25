Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DC525D522
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750851420; cv=none; b=pPgHIFrDYS+jpWN6uJdatx4Ymvq7hLyUP3wu2whQVYEkZ/AWOjrnuKoAAWk8Rl8SpeUX5nNyt60pQTSlquEAPOI5YvPcE6gEoqcG5zBCn/WwigeGb14FR0GbK6tbGFgSOD+zvBrFTBiPAiGY01kKcXM3Z+vtgioDyxpqbsMkh9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750851420; c=relaxed/simple;
	bh=3G/GhvP9CCG6uuuKkuhD3JuQieFN6BszJVp1oTAvZLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nU4Tu5eKLA9qR+8HO6DvXassF7qe50363y96+W3/2hqRJRw5cSyI0idsDqExlemW7ncC+Kbw9Upd+358tE6r2PrzsRXTCjWg1MoyjFZCg+1KXF2oZvzeJZzn1pxfVFtmmJvBWzqrzhDnNwhiYkOBch+D4hZVhEYciP4xmQQPlAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pglZHMNI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pglZHMNI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PB4qZn023175
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z0ZqMF2d605Wbo0XGZMg22hb
	R4jx82qoLb+yqyotR18=; b=pglZHMNIrsejUr3Im4fsTAi4rkmddbRlSEXsk1Rp
	CrW7ME+ITJASBFJOZ9xnPicrFfTACBCspC8krJCXrYwaEewCEI1wQymsUHSOfTBb
	RNyNp5IepTPyP+8i2VRwHyR0rCxqIIbW7gi+d5WbKIf/629BnMhOyTZAjmwTUg0R
	gUYZlJZe2gMqBqdyImnlmocMWD091w7yp2aj+SJenDn4rMtTnOq5/kZWjgpTx3jg
	yCrQoufrnbhiok5ro4I4O31NrGe3NOdSI8i3+zHbenaQH9SwJ2Bdn6cc/jhjlbf9
	Ww8USOwP9DMS+8Ysri0uJQX6Ybl6NVNOu7FmeecU2hLULQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88f9f57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:36:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d40d2308a4so236869285a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750851417; x=1751456217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0ZqMF2d605Wbo0XGZMg22hbR4jx82qoLb+yqyotR18=;
        b=PkUUZ0Izq3lTSV+fFwbySXZ5XZIGneto+mw4CELho5UtJYNjolO71tozonwdHdYT9o
         /t8dMxmN8mpSwJDR2VyUc7SxjEjJkK/JtcHEFJCupXo2ZSPlPTLJGWGpqMKhnvC14LgT
         Jdo6LoUVYA2raLoySrARZtzOUIivkBXCSj4dtK8DK8c+lVkcBAy7SgS88GnXzmiHOBq3
         fp6zpi/7A0UzsBZ1vBRo8KQCPmbkF2+tLq3D3/6QSRpPFiFVCbE5aJZ+m4U0ZUrjO9G5
         5PSGJfpvoQuZDcQo7CBSoz/fli7v5dSg/nIv/u/yghMG1hkclURofyQwZu37HAfRzPfH
         YI9A==
X-Forwarded-Encrypted: i=1; AJvYcCUhfxNfKAj7PcWczpIDeLEFet2hzDHDp0XiW4VQTp4bHxAbYDBTzpgoK74lcM++hqmYCem2UwAdKGcNg6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrOwzCe/EQoBWjRMlAAVJqmPKlijSNrGVc6z+Wv5dp0MhRZx2y
	ZWVHDB1/GqRHVg1ff5ALWImrERBu00Pdg4ZL159NSNWe+7qgbSWSQhxR9daWZYlGTqYaFRA6RI2
	zpacrnT2/OTPQNGIaICw/J61yb2G/j2mwTGvBvSSeoNS3XE/Sv+KJBbIKSkPwBVzYOiU=
X-Gm-Gg: ASbGncsOKLpcYbAINNcVEqvYRD2LLCcyaOAV/XwA0Ch2i5Nzfo63uao77elw9Ak+Zcy
	9PJBSo1GyZvNq9qk78pmRGNZSZZ+/m8t6DFUgjGDm7AegfeEDgaUuN0PiBls5EcmsQ7xej7UD3X
	GhGc+KGUh8CZZiAEBLTYve1rfogvOIotMTUV+xCWIFj/6eXAdMRrlO/2ipeTipbLLfFX0uAk7hm
	d6sQHL1sBGITpiOYZnQZHOodzC4xna/FWN0rmZoLzywYXN6sb7jD/sk78Bp433rc2mAQ95VmZQp
	9zzQA+hRqO4rBZGYUl+lB/Ar9CZE95kD3awtMlLNp0ZdB6m0WGYdnknwDZ86fldYv2AtBMkFsrk
	5xJPfoRB2Q/CEalYty0//kekeIdA4p+anEno=
X-Received: by 2002:a05:620a:45a2:b0:7d0:9782:9b05 with SMTP id af79cd13be357-7d4296d72bbmr363648985a.25.1750851417041;
        Wed, 25 Jun 2025 04:36:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOfZlbSBvtazR55cWZRcy1/iEICqUADtznvjbtKccudKrNWAEvLrQQjTBY9oFp1Z0U0SCKHA==
X-Received: by 2002:a05:620a:45a2:b0:7d0:9782:9b05 with SMTP id af79cd13be357-7d4296d72bbmr363644885a.25.1750851416606;
        Wed, 25 Jun 2025 04:36:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ca8f46153sm11902241fa.63.2025.06.25.04.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 04:36:55 -0700 (PDT)
Date: Wed, 25 Jun 2025 14:36:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs615: Add CPU scaling clock
 node
Message-ID: <xkvn3r7yphlccurdqzncz5qegs7xc254xc2ou2dzuilatk5f5j@eq5ynce4aepg>
References: <20250625-qcs615-mm-cpu-dt-v4-v4-0-9ca880c53560@quicinc.com>
 <20250625-qcs615-mm-cpu-dt-v4-v4-2-9ca880c53560@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-qcs615-mm-cpu-dt-v4-v4-2-9ca880c53560@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA4NyBTYWx0ZWRfX0ERs+CNEhawB
 tc2F3zuVBvfG+IOVRlxyZ08yT3uIlbm6fOFv9+WJYu6MWvVSfH1k0koR0OIkpxyfJfhJM2EbvlS
 G8v0GQmsMzMSJbE/w1gmY9isJWrHps/3ARUhYGL+L1wuuAacQSr6o233L2JnW3NT98dnR6Q2MgX
 ekiWJZz1kCSaI8POlY5t9nVGG5r/SBkXLkplJ50C5l9rvEmTi1gaqkeKtjg6XKV2GBD8131JfvW
 Xomeqzlqcyk38krIT9+teb+szLBYOyhFQ8qI3RTj8MHp14Cl8f4++PNVLKhDm3VXhPzKFjmb21q
 2+LqG/4yliWt3EN51pNye5n7LnmxLQWQpnReP/OxsjA5xhW61gYU2ff/wnBlZzRIO1nUfXLyCXa
 i8otOOG6B2XFuWXjBNSEJJau5Q3h7zPVTPNWzU28mjO+YnX1fMWImaogOQi5Z6TPO/gPDNPm
X-Proofpoint-ORIG-GUID: loJ9w51bxvyTKlOXXE_N4q3jpJhhjREA
X-Proofpoint-GUID: loJ9w51bxvyTKlOXXE_N4q3jpJhhjREA
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685bdf5a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=A1pg4z-Cax2pQkPbWCoA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=852
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250087

On Wed, Jun 25, 2025 at 04:44:01PM +0530, Taniya Das wrote:
> Add cpufreq-hw node to support CPU frequency scaling.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> @@ -3891,6 +3907,19 @@ glink_edge: glink-edge {
>  				qcom,remote-pid = <2>;
>  			};
>  		};
> +
> +		cpufreq_hw: cpufreq@18323000 {
> +			compatible = "qcom,sc7180-cpufreq-hw", "qcom,cpufreq-hw";

Why? Other platforms use a true SoC as the first entry.

> +			reg = <0 0x18323000 0 0x1400>, <0 0x18325800 0 0x1400>;
> +			reg-names = "freq-domain0", "freq-domain1";
> +
> +			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
> +			clock-names = "xo", "alternate";
> +
> +			#freq-domain-cells = <1>;
> +			#clock-cells = <1>;
> +		};
> +
>  	};
>  
>  	arch_timer: timer {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
