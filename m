Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF041A0BFD
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415477; cv=none; b=EXI0Ld+HbhQG91QIHRzSWa+VwgTL8lS9KUEmaXEOGeyUoktvaACq70fveGy2TyQQqPyrx36aRbeU6sqX5V0PtASExke6zildjLI+eFz6lHUPCxdTZOVDh7y3CsM6E2rIB0LWA+0g1SmQ/j38TlB2dR+ZuXs2Uq3YYQ/MWctXjOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415477; c=relaxed/simple;
	bh=Bk1vBly7Gn9wz6+X16ugqS+ZdEVmF8hiBAf0LZPkYjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQOZGuTy9XEu5KbKqT5n+hdrtfYjBXmcRixGMoGVctgQ1jURplw+eAsB44RRPXDzEehJfMMTyfjODvYiHtMIC17d4L+O+DNy2zcj4gsrjo2DHU/qDKF+1F08mzB52v/uEh5XkTSqU0sScvKMR+CTpILqTLjVnvNIAae67v6Z/ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EMq2faP6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EMq2faP6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAMdQQ014535
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+2ze/rnX+AqFYjoGgrqs+s9R
	DoXeSpWH2VHtigOpg8U=; b=EMq2faP65RSDIjkMhd4B/vQC1OAI1u2q4B8h76xD
	bo05K3A2ocZpXMZDt7r/8iq8PtmXUjxoVVsauKPKOvCOisWrNCrKBAA1/fY0Ioo0
	pau+Txpiq+sCHgqfJT0r5wEeLm+GmvzcjuPXAfIOjnj1eOEleAYY/K6hafyWCxfL
	uBoxCQntWvVt689Xcxwy11Ok4ppVL8Hwm52qVNUV1EbFyNO++6dfZROQo1Wmmyd/
	9tmjR5Uw70HUs4Akj7iaFvXMqmImXtj21goy0VVnfU1T0qdHg6VyfXXX2od8KqAT
	VK+E63ecyTp9hUv55QmFN+4AFm2da6ryERG3fZyqV8QKVg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0j8xb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:37:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c572339444so984090285a.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415474; x=1746020274;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2ze/rnX+AqFYjoGgrqs+s9RDoXeSpWH2VHtigOpg8U=;
        b=YpQgpE9jouWrHkTCPJYREG/31kibIqCMyeAjxi/aK5GTM5q2tShS4GhDYqns5bLp6k
         8N+PdrpbF46CyH8Ln/PdpEUXqJOiscslMxef57IVFR+AZMyNgAZkvNbNJZ88Wl0pP6uW
         RY0PonZdesNBbNljVyXnorefa+6pP/XMzHQ7hKZJjkYyjoUXM1dzjw/6HAl29lq5zsHn
         9UlnafbhXD9qrFV3a4bsMpo0gatafXl49UmF2A7Y9p7SWQb2vOvWXZ1jbRdP1xrvqnv2
         PbT98/0vDWFMAhtcKi1rAD/pva/nqPAc8e3QHKCBFBePcVkhyCaYHKTmgTd20Un2yDft
         R18g==
X-Forwarded-Encrypted: i=1; AJvYcCWRecB+dGltr69UqjvNcPg6mB016vjnOD0wdIbv12BHYbdYOIqBu5yMG42apljjtrrq6TJTMT9lp9jL2/c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlpVho7vLW/ewtXYAOpNkpy8+WrquG00qNDJnabWwz0z/Dcc6U
	EEhtYqJk50DWUH+3gp91dFevE5F49589GI2JilM+YgM9yuNQ2EtOCAkPJDZJDZf5BRRTRQYzzZg
	KI5lUKHj/R0YJ2OY022/HZjrDyBn1AE0D5dEMAkvL35M+X3CAoq5RzTP8vJ2VzLs=
X-Gm-Gg: ASbGnctnjsEQx5N8iq/RQkurMxohoD0rpCi7C/OHKZcRjZHPhM2xIDC6JojdO1VQ35i
	CozKCR41cqZ91YXPS9TbBTJQjFZ93fCaIRc1j3hCMpfl7UlwPJ4Npz6zLYanf7TkY6bLbEx/NUt
	lWwUi43rNB1fuKXvzHqlZWKTGDOEUiDke0aG1XYAs1FnKh23Qvw7KFiEQPwxgn+zvCXtqhJ/ffy
	E85LyGH+FFIlkq54YLqKFjsG/C7/UGUwTRULJ4heNeVHexWwZ6ZdmkYXbpJhdEUB0zNLrNYrBUs
	gqZBqv/P7XwNL4JUU0NzzR4Owr2XRhRud1DcjRmzCnjhG4i/MZ1Mrb1VhKKmsmELPyDBAcVvLPM
	=
X-Received: by 2002:a05:620a:d95:b0:7c5:18bb:f8b8 with SMTP id af79cd13be357-7c927f63367mr2730405485a.1.1745415474037;
        Wed, 23 Apr 2025 06:37:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHQxjyT3iMSomg5ijBHCAHqMp5xzTzundL8sqlTqkPCKrDcBt3wVLGtMzpfLC7BB1RtedrtQ==
X-Received: by 2002:a05:620a:d95:b0:7c5:18bb:f8b8 with SMTP id af79cd13be357-7c927f63367mr2730399985a.1.1745415473543;
        Wed, 23 Apr 2025 06:37:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5d010dsm1533420e87.120.2025.04.23.06.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:37:52 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:37:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_nayiluri@quicinc.com,
        quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com
Subject: Re: [PATCH 1/2] phy: qcom: qmp-pcie: Update PHY settings for SA8775P
Message-ID: <tqzmof6rq7t7k3jbdmay7dplz7el3c6i3ehesdiqnp7iq5f7ul@3lnf3awj7af5>
References: <20250423-update_phy-v1-0-30eb51703bb8@oss.qualcomm.com>
 <20250423-update_phy-v1-1-30eb51703bb8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-update_phy-v1-1-30eb51703bb8@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 68bDsJgZymDthWZ_Ku4Jgl4u2PG8cOC7
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=6808ed32 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Vt7sqbXHGhqwYxysgRMA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 68bDsJgZymDthWZ_Ku4Jgl4u2PG8cOC7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NSBTYWx0ZWRfX0joL2YD9fFeY zzgMGVsN1AnayWzaTDrU+M/ko1ih4idDWPwWA76ZNxdu3Oi/r+/vfvOnHYT2n4TkI5QjGJKw3g5 EMbdf4MKLQsgSK3anZyFEoYR+pswYoTmPwiJZyCx4o9+RNOfPILMD6Wx0xKqsiPkqJUjcA5FR0l
 kl/oUZJ7qWRXEYcg7ujExTf41NrrpcpWi9VBdkbl+3QjoiORkHI1n8w7Ey1rsfcnFQBjgnI1LoU 8LbgjlC7auNo8zva7xb/K5E/EwY1+HEpf6mXOTB82E2ahaKRiqhW69UWqa62KvFYgRpQvD1dz03 fvTVGRKsBAdMIlcelt54TIeVntgRl8JGhlKRIj3EOU2i7c3dT6q3tIw0gCjovyMbw5elirKgzAV
 iehR93DebBoSbg+qSGt2u5t7sWXehQipnnIIRJ4wWgNrYNJAc0EG2seOGd8831xYvE0HN5Lq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230095

On Wed, Apr 23, 2025 at 04:45:43PM +0530, Mrinmay Sarkar wrote:
> This change updates the PHY settings to align with the latest
> PCIe PHY Hardware Programming Guide for both PCIe controllers
> on the SA8775P platform.

Please read Documentation/process/submitting-patches.rst, look for
'[This patch] makes xyzzy'.

> 
> Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 89 ++++++++++++----------
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h |  2 +
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5_20.h      |  4 +
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v5.h | 11 +++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |  1 +
>  5 files changed, 66 insertions(+), 41 deletions(-)
> 
> @@ -3191,6 +3194,7 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v5_20 = {
>  	.rx		= 0x0200,
>  	.tx2		= 0x0800,
>  	.rx2		= 0x0a00,
> +	.ln_shrd	= 0x0e00,
>  };

This does more than just updating PHY sequences. ln_shrd-related changes
should go into a separate commit.

>  
>  static const struct qmp_pcie_offsets qmp_pcie_offsets_v5_30 = {

-- 
With best wishes
Dmitry
