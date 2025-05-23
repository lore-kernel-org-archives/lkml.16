Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F86229375E
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748021345; cv=none; b=qLX4bMQJGQ5HsHAr1E/cMVxFjpAawYAZFXCp5auTfKzIOSGsLK7tVh7ZBK+fH/MML5f9vj4PppnkykABFD7C5zU29cS9yc/wdJoYcJViB6+RXuZyQSMkzq6V1tsByc7dj5W7OYjlp8MzWdxJBc3YICXsU1q9HcT+h7ObH+ugl0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748021345; c=relaxed/simple;
	bh=YE9iOCasxPJapt7KcW93oC/yS0GUZhvFXPD7y43bNBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8X62RJ3qw550OXuBrrsEuYZE7LfWK2tCdZaMRycTsxSz3iyo07IlNkmhYd1pwJ4BP6KNJ/yekeKD6jHAD30qy79ik7wjtcxb1sZbHwsrkgAk/RbXsK7DNJLoPrq8YZBv0yDJHT0fYkMGXLBQtUtt8mWKVdSxmcLsTCPBaIDyFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WMiJikqt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WMiJikqt"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NE2QJs002269
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wFa0vdA/IRTpVTPty2QP+/P6
	az8rnekAbo9UM4G7jm4=; b=WMiJikqti+OEnzKlXLAL8harbintk1VTQiGB7xG1
	8/cHuWXt/X92OIdkvhwY/k9SV8ExfuIpPtxsCqCJyvX6dXNi7wUvQKYyiSfcqf05
	RaeKt7hw5hyarWPJHKddrG7SDsnKXs2fzyhMjsmbALZrm7ktzR/tdPao5liOQg20
	dK+gdjDr0PW77wHYU5kz/dGE5Oc6fntm/p5dFu1e65Fa2aeihL5hENUGuG4mLZd3
	fWuBF6Slb9Zip6GXLUS19/k08KyQlO8ygl6s8RIaNMI0+Jf/9S1nE9FIRTmRpXSR
	JIFGkfJ7QIQQHaNHmQ8N7YbM1Pp+QEPg06QsIARmD87KrQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf72kg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:29:02 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8e23d6657so1281346d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748021342; x=1748626142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFa0vdA/IRTpVTPty2QP+/P6az8rnekAbo9UM4G7jm4=;
        b=mstIuUY1HpAHtueG+WyCRur4EVjaK8Y5ybB0/IKzwtNx3eqM41lVPMrkFDvNcrutzF
         tTLgZQpIvYAWzL9zpNp7twJTcmPmTjXogn1qVPIH21hLugQbMQ9EM0TMvbZw7WmQCAnA
         6X4oo5Fw5W3W0Bki4ww79Ok4CDVPUNMBbt+tufPVVSfFzJzMQ+yHVQOEYGhvYs4RkPzc
         aNY17OVZbINUIae6bYrsELXfkEtHuV0sAUu8/u3Zo61GAuCHMo8AVck+SfXtzD9o7K6S
         Xlb7Y0mPCzvLycvatpgp1S9we0QfLnACYbDb5hJ8WPYnj1iv61andpUpzjIxNDS1NGlT
         46Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXZrmT5Cp60NVmBI9UTfjtvf0tWGCmm5ScZ80MTO32pgQoVwk1v12lo8U+fiyJSE9Q/iDHjHSEWeIqJa9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpmEPQNpAbvdby/UXU8DktKKa9WhBvVdE6U+8Gk0p5rR5hxv2B
	8Nq/ZaDMkCytiH/kC3/teiGpLc6mK0sDqxZ2DI8TEkJ91Elz4mUpl0c77X1LFhZuT9WJdF56ZsN
	JmhJV1hs3cFZsnLylaNLxVjDKtkRa2fOYUQOlX+Kce7nmjGUq/R9kAR0EOwaI9RD9pQI=
X-Gm-Gg: ASbGncvo+pMrvjMnU10nZJ04D757FFTy0nyHSoUm8+U42s67fIF2WSGz9cIL+o9IRjZ
	zmNXB++CJJ0mIcSZsp7ut33UMpUt5U7NXRIUs3zhGvY6haVrbK607Zz+74qSOndn0He6yL2fMe1
	J6avnH4gCUVvQQckXmDrzPLortqrhAzeCt+upAwQhbJ5mEFY1YNo7ifVmDwpqHQQmYlACezq6LR
	EiqiglGLd3tgsoezaquQtiQL+RiZnnbb1IHvLd1gdU2CNUW4zQeSSmmHz+ukQA4yiHBbwT2YESY
	zQcTNQFUWLFbStHhQetET+fTnRBwnuhbuoPzhPBkNAK7MJ+TzDKn8SRQ2zQo4N/n0hPHSNAS/dw
	=
X-Received: by 2002:ad4:5ce8:0:b0:6f0:e2d4:51fe with SMTP id 6a1803df08f44-6fa9d13380fmr4709756d6.26.1748021341958;
        Fri, 23 May 2025 10:29:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYa7Skl7n8kgzImuglUnL40cCJvrlZBl66a+j2go4me6lwztDNnIag5vwQhcV+q08HK0c0VQ==
X-Received: by 2002:ad4:5ce8:0:b0:6f0:e2d4:51fe with SMTP id 6a1803df08f44-6fa9d13380fmr4709566d6.26.1748021341671;
        Fri, 23 May 2025 10:29:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550ee87a795sm3549913e87.220.2025.05.23.10.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:29:00 -0700 (PDT)
Date: Fri, 23 May 2025 20:28:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 04/10] arm64: dts: qcom: sc7180: Explicitly describe the
 IPA IMEM slice
Message-ID: <nm245key56zcfgmo353bfiw6zrf6lymxnx7evqxzimvs7muxpj@e3yts2awiwkk>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
 <20250523-topic-ipa_mem_dts-v1-4-f7aa94fac1ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-4-f7aa94fac1ab@oss.qualcomm.com>
X-Proofpoint-GUID: vaPh9TW3C78HTQYlXfDWqJ_L85a8wCf3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2MCBTYWx0ZWRfX4fXvDgVhoNpL
 iaOc3nA2ozAiqinvDjXsrfoHw/GNzePUbhDD0JsUSSwMcDghVsTdifz4WActYBD6IO5XFHm1idq
 WvZCnn2FgjnZOYbMedZipuwsoqYEjcXi2E4eU8AceSvaKQEHDws/i3/6GsctbAotjvXIJ+lh/oQ
 y0aryjKewJdtH2P9kdVuP1NcxzYJ46eChI44DGNNIfl8sGAelEcm1vJpt+ROt6u1TVvEeJyq74B
 Y+rOY0ifLQNodtKD+FADwn5G6OIwU+UivadVtmCixbIHuLrOGY7u/A9Z+w4oAeOz5dcu9nRQjIf
 ZdxqGKCNcWuL0Rubhk9KPyVEpJrxHhATiU4KlyPo5suiOzxQ5B0pmfutMdSnBMFvsvqs7nEyjMO
 UNDiMJX/i/hg3UXLpgsca9H1gLzzeuoCcTjf4JnSQae1P9CuyZ4w3V6v81Gj9ET/KL9xjlYf
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=6830b05e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=CQVN2WYv2dQaG0RyAuwA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: vaPh9TW3C78HTQYlXfDWqJ_L85a8wCf3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=705
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230160

On Fri, May 23, 2025 at 01:18:19AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> As part of stepping away from crazy hardcoding in the driver, move
> define the slice explicitly and pass it to the IPA node.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
