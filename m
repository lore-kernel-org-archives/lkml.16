Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2973A29D05
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743084510; cv=none; b=tuR+7NRjGhjProfh+Bf2C7v/2AMyuYKHltDlBzJtHEiS2IX9kYDM4zE0gYw9wat8aw7wPW8oWaQ4wOluPcWRYwncQknfBPavy2wopiZXYE9yPu0rSFazEYJ3cT4jW4+oSwFCfgxhi7I6Z+VNv2jnf5H4P93qc1gmxArujc+CcIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743084510; c=relaxed/simple;
	bh=SEZO9qBx5pmsR70QUhs9LOaTH6O8WpbkUZdAtq7YYMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPJV5D/QUSYe3/py4GXgLOQJuIG3zd1SRouGjypAhoxvmy50Kco+SX0FDjACZcad2XxdsyFvgiSPLWKZLcBOzB+bPvnxRWmTRpvGIwYALP971T3HVC90j+a+bzfErBLsHxSOXwC3gbc4Uo+s3BPiFYfjiF4HwF18/c/PritiRLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NH26j7Th; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NH26j7Th"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jGrH022921
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ljIDS8nBjc2VG8d0ZzZqDDV7
	zEKCh4Md768L4ui2t70=; b=NH26j7ThGzFqPxp06QogCGK3u3Fdi6kN8lm4QxEO
	DkBqU3thpimrfMEUr8z5CNs54LqtQgRUBoh6f9zpqpYjNNtNd0d15SQaNnFQcQP7
	zf6i2NrndfqU33/+J8YLC9TNMnMkzuJCuDoVKa3Klek+4LXPS2Yp0zkneXQ8l/c9
	gmQD84HDeTLQs+Mb8yTWsuK6P39mvKxM33fT/5xIoti88xL4qmcn30P9HhJEQu+Q
	xfx1NOg3aLgN3AP21nz/RZZO0KAjOo/EN2xdN2aoPsLSTkSScnh0uePIN1lFQe9m
	oLGKhcqCAccDp/VSqoEjnsXewm8bUCYUUUw5qBCHJ8NfxA==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mb9mw0qj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:08:27 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-2c2b8a293fcso930347fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 07:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743084506; x=1743689306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljIDS8nBjc2VG8d0ZzZqDDV7zEKCh4Md768L4ui2t70=;
        b=ebpP5Sr6YjRy6YLy9pFiqkc68YUL5wYWso7w1kC5zqw6E2FSPHdw1mQ+fQeA6XzXkj
         Bj0foEN0WfdPVCFzCBF2Fl+On3PwcoIwhOHsQXDIwXYAUhjBpzj6h/vPqtI8EpZmqS0r
         a6E/XqiX3b6jMqj996SvEQSWwpQNrwsKql2sa3Cbn/e8K4+VCJkhFAIsbHxEqRLlLwfs
         ApWyNf8G3aCx4WDWIxvnDLzxEYxUUidp5SKCNat+b1tk52fnapiQU82pQPAkb/XZdjnM
         d+bmNQ2oQN/mcH4dCd68PBs4gxkLuCCJCWeu9X3nTznkaW1NFswPEt/HDGix68OBnJAN
         rysQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa5QYyy/n+csh0VXeXiCh71LRSRrd+IruW1/VaNygdHdY27Gc86leObUOz0CFw9OCH1vZUjAuzC/vd9Pg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF2pivGb6VhwRpEIhowcfavBxcr+utEz6FG5jzKpg/3BCJ4xU/
	8glf0oUWkMFKJeGZg8lLU6R1+ed/HaRfGVoWZcbOkXOXmQV9lX7K5UDEvL+CbqPLVk8sKB34/ne
	73fBzDoqjmiEtPQJ9jAciF7eP5iYScptcCV/ehg1yc0NpMVSBQnXERAwdCcjaDigDbB21vKg=
X-Gm-Gg: ASbGncsAlw0cC7ydU4FHcveehfUSvOoj+fHOEjYWBsS7BFNkBAANGqgezFGlGwNDkRn
	/xzeTbjDGsErc2xgMt4FZGX6YNo9nSixQ4e1ccryNpHakjegkdu9ZZjhRj6ak23Ddlsb+diZ4zZ
	Knpg91L2Z53rQ7HI/NT38OC0Q5w7k5HQNAn42oeImNHoLJdKbvTO4Vy24RjoMXmBoj8FHi7THBM
	QO4rkvjqabi5/0WVxtxUmwnV50ON18YHY/rFK69Z3BSATw57lCKWClQeOX7qcWMpGJgn/eVd1SV
	NMZWzcJ8RsWm5ILDP6DTn1lwIpMundT2gmzT2MhLRYMLxONPfeXVMrrXaC/7owU9XjrstGw+CZz
	Cu3Q=
X-Received: by 2002:a05:6870:5d8c:b0:2b8:5a6a:6f5f with SMTP id 586e51a60fabf-2c866440e57mr210999fac.19.1743084506397;
        Thu, 27 Mar 2025 07:08:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzv3shkUjdIzmBbQcYnd9sMhyUVqFh0YY+uJOnkJ41kguWyH8HnLjBcqHJ31+I4eWoL8bF3g==
X-Received: by 2002:a05:6820:418d:b0:5fe:9b5a:531 with SMTP id 006d021491bc7-60282f734a0mr160480eaf.0.1743084046857;
        Thu, 27 Mar 2025 07:00:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad64fbc99sm2078251e87.125.2025.03.27.07.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 07:00:44 -0700 (PDT)
Date: Thu, 27 Mar 2025 16:00:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        Dmitry Baryshkov <lumag@kernel.org>, Arnaud Vrac <avrac@freebox.fr>,
        Sayali Lokhande <quic_sayalil@quicinc.com>,
        Xin Liu <quic_liuxin@quicinc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 12/12] arm64: dts: qcom: qcs615: Fix up UFS clocks
Message-ID: <753oerdfl5m4rvtpqqvjkd5nhk7gv246nmywtnh73nehh5nhal@s4je6izjuawd>
References: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
 <20250327-topic-more_dt_bindings_fixes-v2-12-b763d958545f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-topic-more_dt_bindings_fixes-v2-12-b763d958545f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cs+bk04i c=1 sm=1 tr=0 ts=67e55bdb cx=c_pps a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=y2As-JX5KrBiNkWRAOIA:9 a=CjuIK1q_8ugA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-GUID: QtjR3U-9nIaWkgYruKNLK70tlFRewLhw
X-Proofpoint-ORIG-GUID: QtjR3U-9nIaWkgYruKNLK70tlFRewLhw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 bulkscore=0 mlxlogscore=788 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270096

On Thu, Mar 27, 2025 at 02:47:14AM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The clocks are out of order with the bindings' expectations.
> 
> Reorder them to resolve the errors.
> 
> Fixes: a6a9d10e7969 ("arm64: dts: qcom: qcs615: add UFS node")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
