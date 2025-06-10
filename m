Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCC223AB8B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561290; cv=none; b=TNJQtpOhzj7U02A455dsPPQV+qUGlSmdXKn0PRrGNq04Xz6djj23wQkngWL3VYuSn7OrQBWVTELFX4ZDCEokolybyFy0hryemZl1sM6zqBf2XktXWZtXYHNLN4jZaRMJinBAbwNKaafUqqdXVcRLQq55px61agKDSycn5c0MUU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561290; c=relaxed/simple;
	bh=AWosMa9QcTrhoG5oBkH7hkxBD59mNOKn7GvbXL3TVGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=otsgKpdN7QBjF32Oo+XYLuelPzsdkVYlqUVii1x83qEK6tA+zr2hJuRA2xXjcPWblBFCHhIy4UemZl1c8gAarrWJCmELDLecrm5o4VxxI02dTw6z40wt4H9HyO9/wBbzW6lym1v+3cWE/s6KrXXOi0dnd6ncc8XlzLQgz2/SX18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qx0NUSpL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qx0NUSpL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8lfga017676
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g6IwQRxCUScwxoqS0e4XHRFL
	lV7pUybK/kFVnN3gEOo=; b=Qx0NUSpLbFRnnJwDivnuJ8s4sTgo/boEDUuXyXQO
	Hi3V1oGCKilWewi9Kvax9DwsZZrjE/iDYqJokwD8VleptqpE8QTEeJAMJa7qiwNO
	TAoL83Y08TAcNzd7J8zkiSHVT5PD2oWVUpFK0uF09lldeLvhVdab1RqQn5M87ASE
	T4gxcUO4jZ1lORlFqVaJDBPpkiGYFLSIvKwQjte9AZ4/rctHDy/JwvBuCNBfoic4
	IoBMBOeFPainOeALttPyrefHeGXPcwAe/N7ekcfS7VxFb1WAyGc69bG1KLlVmZaJ
	kRGzGhbIme2+B1E6KVlmNYC0trNKTGBx7ZuW0iSenhvonA==
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com [209.85.219.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4766mcj99j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:14:47 +0000 (GMT)
Received: by mail-yb1-f199.google.com with SMTP id 3f1490d57ef6-e819c3f8861so6452057276.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:14:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561287; x=1750166087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6IwQRxCUScwxoqS0e4XHRFLlV7pUybK/kFVnN3gEOo=;
        b=cgWm58Qx1GaYY1vIdlqM7n2vFe5Lnj/2XQiEtAUBWL9d+9XVhJ3CXWpf1D8wVN0YCi
         RUM+9/PBsuR9l7/VCQdTF+iF4TrpZ/yxyyVBbQSu3GcYdsXjnAk9b2M+/mJsGV7JFFN4
         2ui7T5uYxTR85paaz33C1CPI0RE0PvPF4m09YfIHCoxbeepL9yOsdqaI9eB+MFEZx1nd
         51Gi/C6z4dSMyP9livxx5HrYngj9f3GzwecNea+Ll5YbYesWa7PbQVjxejIpXocWTIco
         kQ5holClnMelvP0+MfgVZgtqQGI5SQUL2Eo3An+DYGVPRTpLUFFxYv0pWTshpaC/uhom
         nFGw==
X-Forwarded-Encrypted: i=1; AJvYcCXOmx1dy53Iyo8vmFRx9KZrMZXni0buQZih6R6HJYRMAr/ArTNptmhqy2tFPg1kym6LimymjQlLp1coaMs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUVTdvNZq6xstZGqmOaMUYxJcYm5LleuPHvhuWdpw7IGW3r+Mv
	NK1Y6kafAwYp/7eSGSqITzuWFmS8nSumnwCGB4wdp8leqF70KgO3gXVqby+LNqOVBEmOC24cLt7
	Nz3jiLRpQbAcl5pyTI+h/202+0tV+yB/BUTp6o+UkcqJ2i6nYN0NCdKrB4vfGDaQ/fEWv+OfQvH
	0=
X-Gm-Gg: ASbGncvH0RXe/1E70TIMmQt5Q0jjGfZt3y5g8r9jUBB0W+w2zgiJ/zynHKM1z1F4xi9
	4s2e3k2mc2WtW+hjHbey8kAdb3OE1ClpDpiHoMsYpTS69VYL2Qp7UeVEMWiRTdLQyZBg6c/785O
	hQXnIxsZTO9yafzoBADPp+t3HmPiBNmN2xTrV1zE7d+0mOAy74wQXZ8lfa58j3EUy6ncaCdkPva
	xB0lbDs0fqefCjH5tH+Sz/vB+wqZc78ETTH+Qw/xUm9gpI6rtagbVXFiyf1n/9juN4e0VaeY5aR
	s0Ya+qYpY3AilcpmNqJjlIRlrPpFdoTcwo4E+2CxxYVpQ+vllVs4/tldWpZ4C7L+ZDseMjHLGN0
	A0wKPn2Vj/OoUzqVkc43DktlqU8ksFoKn37Q=
X-Received: by 2002:a05:6902:c06:b0:e81:45ca:7918 with SMTP id 3f1490d57ef6-e81a21edc55mr23342701276.40.1749561276690;
        Tue, 10 Jun 2025 06:14:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYQC8rt3kTrusAsNuIp+4RWIrv68jhYVstYuYleyxm6ZO9onHgFJwUJlqd4EmrytlbgstvxQ==
X-Received: by 2002:a05:620a:28d4:b0:7ca:f37a:2b4e with SMTP id af79cd13be357-7d22987fcffmr2356233685a.23.1749561265466;
        Tue, 10 Jun 2025 06:14:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772a3basm1520440e87.155.2025.06.10.06.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:14:24 -0700 (PDT)
Date: Tue, 10 Jun 2025 16:14:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm/dpu: Fill in min_prefill_lines for SC8180X
Message-ID: <skvwhicmdzewywoxm2bims4e6geandodztd6apmrolzqpzcibo@fqnjrs5shp3r>
References: <20250610-topic-dpu_8180_mpl-v1-1-f480cd22f11c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-topic-dpu_8180_mpl-v1-1-f480cd22f11c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=T8KMT+KQ c=1 sm=1 tr=0 ts=68482fc7 cx=c_pps
 a=bcYUF9iMMBfaiOy0M+g+3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=HWQ8LJbAKwhtnRb1DegA:9 a=CjuIK1q_8ugA:10
 a=4AvBJ3eyfGLrynxe6Eyb:22
X-Proofpoint-ORIG-GUID: XpcUy5ZsoIPPiQjLhMWKTOAhW2punFEJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwNCBTYWx0ZWRfX0lfjV324YRb2
 ACtGmkAs7UAos+2UW5vi3dhFxWvSPNHflaUltUZSOZl47SV4Or6zfcMyi4EvMELUNq7gIiJlvzb
 sVkYM+BPz+RbXO02j524BkiMhj/OHCzQmJVDgRjYM5/YkSvQzK37FGSkp1AMFg6a1dJz40tSrP8
 KovX84qgkKmF9JR5l6wk+AVLGj/xsjs8MFN7smWP/wfRFXkHPHAX+8xKjntQOdsyfyg7lCGCKXF
 fL8AM3I3hNFCucE4espXv+kTQSRPHi9lk21WALti21S4FYnw1VEJ6963Pso3abrvMUOQxZ1T3TF
 /jDgG6/NtH+Ijo3W1KPv7AEMV2hEn8vuIwMvZKnW1Cu3qsuEYiEDtx9/CmhCz69VpZiOiEI6a5a
 TZNdAdygnfWDnFNhtGuiYYrI44UgZXwzyLfZCTGh+KzIHchxdZqL22mr35xtUJAXhEk9lYVC
X-Proofpoint-GUID: XpcUy5ZsoIPPiQjLhMWKTOAhW2punFEJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0
 mlxlogscore=773 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100104

On Tue, Jun 10, 2025 at 02:50:03PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Based on the downstream release, predictably same value as for SM8150.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 1 +

Fixes: f3af2d6ee9ab ("drm/msm/dpu: Add SC8180x to hw catalog")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

>  1 file changed, 1 insertion(+)

-- 
With best wishes
Dmitry
