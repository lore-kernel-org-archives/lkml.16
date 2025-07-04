Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2765150997
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 17:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751649628; cv=none; b=GEYnv7H8QDh7Xo08rXP2fxeM7qecebYDqhqls8TvLwdCyj5rf+DdfxTyrAhFZJzHIsVR7MO0kQ49B7fgVPEnhSa5JYtHkwYAIxQNU+kcucd+WYB6nfvZA4UChxPrwXkmQcwgiCF/T/GizizwEcvDXiij+Y4tsJl2ilDeCphHTKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751649628; c=relaxed/simple;
	bh=Y+afNfEnr7ionJG6zDs8nJQjqBSEAWpeDKXJjf/L870=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKpavHPk4kVzT64anI+I+Z2ppnSDZYVGJQrXugdcN9Jzrf5bUT8B82EUDBkKeXXRoEtTt7TTf+F2tsLlltmwSogQIckJZOEt3gM+3SNCmTIiHKgtKwOVziaz+8rca22SqQy4Mn0g3oDRTvizlldGU24uS6vN9W87QgEmuf9sVsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8Lixg3w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8Lixg3w"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564BP9Km010767
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 17:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K6S1+P0U6oPDZ1RZYx8X/1jb
	24SS1+osCF5MwjAfyHU=; b=Y8Lixg3w1CDKjxNMA/MgzrwXdW5HrWLeWAsbYsO9
	zQtdH9+ueb7JE8jCTTW1uA40jsbWnSK1jY9B0wVnauar+b9cfqJ3NA4ZhnHE2I9H
	69k9m7ykwed/WWc4m5G1uM5SymKIpsav+65DjNnWJf4Sakb279K57vurjJslmKDi
	I9K4rq47y7VMKN5ra6MyoSiuesh1YRggXa4BIqYv9acVT1Vf6Xly91WnRTRoKtHO
	5QnHCh0F25FEiMSKXx+nfcMBq6URkRmjQH7K/DGSL+UNi2q/PXLn3yaSB95MDdcm
	zrri+QL8ajsVBy7XrQz8BUw1D1T8mRG/oTHkv9ER6iDN/g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mw30hpjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 17:20:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3e90c3a81so88555285a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 10:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751649611; x=1752254411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6S1+P0U6oPDZ1RZYx8X/1jb24SS1+osCF5MwjAfyHU=;
        b=AhUE4n23dFCJToP47fSlzWcUAwFQvreEcxFEc+B+F/V5UJCXtrCCy48t6qbup+6snx
         FKI1EXdPvq/qlWEaC2mH2/9u5Sseyt1y61b7Umpb7PTNHr2L3fPxO0O+LgbdQWxgOqjR
         +w4RA5Cg5VeloEEbKNZRTykx99P04JXQr/S+uUFQ4STaUsr6N083kxJY6lgp3jMdgJ/O
         knylwdS/OfkYDY7dh6/uuyaxmvfiYuIWIwmFksBgYDZcr/JEFR3kUfiwXfo0FiYPExA3
         q3NkfZKSpiKqgjRJKzxiS/cuy4GTeNd/ejiuXTw5Wh5XZfZOBmhiRY3zXjkwPjxDBOvT
         fbDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKM/+NwPI75+zQY/c+cMFUNJaIMNrzGWg18TEZkP9rurnlSPeJAzqOCPTZvGvwp+OBzCS/NRiXwwriOic=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhP/WaQ/aa305a0MtyyGw6RvgDtewQyDdTEyIUlPUIAbErhBkY
	qmgP1/ySkNE5zxdcYNk16w+W/ExJA7IGzO84fN6dPGELNPV/7dK4GmN9G9u0e70tRNjohNgqs/z
	IfQeikcChBsLhTrrQBg28FenhiKaBOM48KHvTHhs/BybZDpEOyMcvJKZeZ5GVRC/HXRI=
X-Gm-Gg: ASbGncug6MGx3BzivzP+qIzcDqFor9RLiaGX95qsscuqddE+Y6HKII5872qley0bjD8
	bxwKOBi/z8WYaTgJS6qjfu+9HxLNWVI2ltHrl7jheMr9NkUr6YH2b9SlhDcT5TI8RolKWbUXki5
	ozZkPVk5ALXwdMplCXHNsmzq7fr4Jo9ujwCBvsXZcCKjTDnPUXwxE7pxISHNAf5VnXxRBHtNZkT
	p3pNy3X+ja7o7n3IgrSI1F/E05rRU5WBaVpt8O8rEGLhifRbQXlcrTCgPGEQKqHAtNn5TCAW2q+
	Ss0OiTiEz+xGi58dL+l7XRtgjc9Y6Tnd23QB80s5UNfObfjMSwtWjskxqhlnHsDPDcci5g2gHsM
	WW3MlLI5YzBt9dyi8DS2mEtrKzZ4mNaO1F3o=
X-Received: by 2002:a05:620a:1a9e:b0:7d5:c2ba:bd4c with SMTP id af79cd13be357-7d5df16189cmr323257185a.27.1751649610700;
        Fri, 04 Jul 2025 10:20:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo/MlCYNc+2uOnhzse2QKjigyvirO7UV8XPRf1Nz4++jIkIKFLOYbvO9lLcaeerpkVmk5Ukw==
X-Received: by 2002:a05:620a:1a9e:b0:7d5:c2ba:bd4c with SMTP id af79cd13be357-7d5df16189cmr323253185a.27.1751649610205;
        Fri, 04 Jul 2025 10:20:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383bb3fdsm307083e87.44.2025.07.04.10.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 10:20:09 -0700 (PDT)
Date: Fri, 4 Jul 2025 20:20:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <quic_gkohli@quicinc.com>
Cc: amitk@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_manafm@quicinc.com
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: qcs615: Enable TSENS support
 for QCS615 SoC
Message-ID: <zuczd27utiu562fexg2oemgydcbe3fs22mjeb26xiocreqlncy@5nqhixgcdhdm>
References: <20250702082311.4123461-1-quic_gkohli@quicinc.com>
 <20250702082311.4123461-3-quic_gkohli@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702082311.4123461-3-quic_gkohli@quicinc.com>
X-Authority-Analysis: v=2.4 cv=CY4I5Krl c=1 sm=1 tr=0 ts=68680d5a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=GSS0VzHe2Y3C4L18hMQA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: wiHe5MIuUGxLJeZo-TQkop2e_PzXlnsx
X-Proofpoint-GUID: wiHe5MIuUGxLJeZo-TQkop2e_PzXlnsx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEzMSBTYWx0ZWRfX6u+bsDx/qG0f
 tWuQJKb2aXnOiEhh9x+jTkAfxvUyawo4CtBCdA+kd6FZ81tQ6oemqpEhHH7tleRX3dCtUpifnQ/
 cgKypQ92XUyhYAbhrRHAMLCBMjrD1mTDe7A4z/nRtwUDsBa64DELrztcaSMW56B0WhDzTO5nR2w
 YTwL7oe9rySdhPgHI/b2fne2DI8X3lPayod1Pbb55nRXzMgUoe3hknl6cgRKlGW8JshDXaC6+QO
 iDOWxeDqgS6IwOCr/EtcggqG7RMrVP4qEXJaK2qxOGKKx1f4PTf6obxpqZmlxlrWbob97nUE9FI
 ++GAEdTaMMJDG9HJshA6MJsxiRXuN0oIKpZBnEwKl03diHdxtRgBEPPLgzqScsK6sq5RGIBo1FD
 ZC4W9qlq7/Ih0YHbrUv0/rj6KzaWcLbGxdkR9HrddxjjV1nb47rYUOPARNdGh71yIhZjZxLC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=717 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040131

On Wed, Jul 02, 2025 at 01:53:11PM +0530, Gaurav Kohli wrote:
> Add TSENS and thermal devicetree node for QCS615 SoC.
> 
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 205 +++++++++++++++++++++++++++
>  1 file changed, 205 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
