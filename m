Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC019246BA8
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749562733; cv=none; b=N2WFi98dAcLG/k+TwBA7FDrslSNkp2QFyvkgw7odGDPwnXrPZ/7IZkIcAmMBJ5i3pRywMzHN9EsohxsNcToB4a0o1ui1fQXV3qIyKeichN5/i/YdKxcwZXCL5Y/9v819lKzmDHMSBJA5OjZePJAzyu7WemB7MUR6gHruofWxveU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749562733; c=relaxed/simple;
	bh=55DDuiOaro/SoFIoPOAKogqoXdCBebxNBcecJkFZFkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JpRseIKbM2h7XPbA3KbcIkiU5Wx2/84hY/wLocwIKavkZwsQXHSb/sPNQZIGZ8cM6CEK8czb6XTItgNWrbVa3uFjeFn1T98KlxiT5N3W6OeZmVTFIKFuV2MCpUbGzWUV44sS63vCUdb1Cl3U6qa4Qe8PgvsEGVrqWgc6vY/yjvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CFh9PXzw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CFh9PXzw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AADDL5011182
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VfbkD6ITLHOjUUf6T2RvScNE
	AhIb47h0hB0wTslzk6w=; b=CFh9PXzwrTVv/Q10p+cexE7FbpiJsTVYv/g5AZaF
	RSII9mhJCewX8smSnBB9tbn21xjEvB5Ir32l0X8JxTp6adUO55yBOq9TThZMQouG
	xxPfcjtP9uxsoZCBKg7dodhztJQ0E3OoDoESu5XtAsHj2CY39MUgAp7uSfKjAvQy
	434nyCOTyJ7m0mfGTa3X9H0rZlTJDzis5dTTZ38PA3Vng7wFIy61ktOwwVOpERI5
	QqJk4QcUYl8J5xfPop6O0HW4zm+2MbGa580JjErEX4PBgWvpnOb+cc/rDfJMuiCu
	vCa+aDkNoW++5TlAm8XoBETJk2A7IwWY0EonK4vfFWUPJA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrh8jqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:38:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d099c1779dso988806885a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749562715; x=1750167515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfbkD6ITLHOjUUf6T2RvScNEAhIb47h0hB0wTslzk6w=;
        b=t1eONPbDOWNA0tibS1mz3dwhfO9G+5346JLSLSL/Je8kCCblCV22kqii9ky2FtCqVJ
         A/XZH0iOjhzm9S2Eq688KvTkMtX7jQGb9ttwkIq1BC3OelAeMNMzn91gfMlLLSMYEWE8
         kFf69WirRRfTsfJ6LysLyFIUISP7v6MIbcExIgO6oOrca9aSudoqyKluv+23C4s9TQGK
         pVGyL1wlErjmjdviYNip5U3RYs92Jie/bFwxXe+Yn6ieheq9Pn47uoWm4NwkkfB13tzM
         TI4ZQm4BtnGYzFNo3UjpO9QOUFm/LGBsnpFpS7x08tdX1ol6KArcdNtEJ9yafS4gR3wb
         aTfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1ezPgrGKtyCMOH9I4vTSmSpM+QDYopjqsqGO043gzcv4cm9ez95JFBqxOa3fNJdfSLl9KBZkn7rWxK6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YysOe6Sqyn5F2jyc5uo0tXVFu1yx1ko4BSrNDmFIgJWtNLThCl6
	wEc3hGZ+Xv/SUEw5WfBsqOfwCoEOC8UH3hD8iRUWVE+2ObcNyFsOW3PDYv37M92pITRCPoAq6I9
	vFAPKd/GkArMG4lJidZHJfFlZjlTBVbDqPC27WzcrWjVzI338Ai3lQN2b1H+P4vyPBaw=
X-Gm-Gg: ASbGncsxRCf3N2mS98DFu7Nsaqd6MQwA+ar7vBUw5L7H+ZMnYpZSibD4ZQvrB290dvE
	xDuEJ7a7Cw1QwDShkb8oeal3z1wqI4Kx9Lij5uJ5MdM/0E1z4/J4/ApU9KXjyPwYm8RZ2Sp60E9
	k7tRpRFBou3RV/6CPqnL1DBv3sM3uoOsVXTjj0RgNxUnxPfs8h5DYq8+9Z86xWmYazx3FRoaZHB
	2dpQcg631I1ByxHYSy1tjIwBJRzSidIdFNfa+F4rV6ILdwN1MSJmx8DOt61mJTCcnBKUux+l6Jb
	dpv8lX0I/RZAqpZhUGCY00VJRhn5G0/fayz22OSSy0+cGauGBrEftcz1QBXhqxSDlyExUPxnBr+
	Tg4kluryr0fW3YqZPq0Lr2F0Ma/xeFys0W4E=
X-Received: by 2002:a05:620a:478d:b0:7d3:8dc9:f438 with SMTP id af79cd13be357-7d38dc9f43emr1021648085a.17.1749562715435;
        Tue, 10 Jun 2025 06:38:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfAM4VaNuFAie2Y6pq7R5HM0Fh9jAG10QS13nVqGILa1cGlh7pr3Ew62wRyjOoTLVSFBP2WQ==
X-Received: by 2002:a05:620a:478d:b0:7d3:8dc9:f438 with SMTP id af79cd13be357-7d38dc9f43emr1021644785a.17.1749562714967;
        Tue, 10 Jun 2025 06:38:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d04e9sm1548162e87.5.2025.06.10.06.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:38:34 -0700 (PDT)
Date: Tue, 10 Jun 2025 16:38:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sachin Gupta <quic_sachgupt@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_cang@quicinc.com,
        quic_nguyenb@quicinc.com, quic_bhaskarv@quicinc.com,
        quic_mapa@quicinc.com, quic_nitirawa@quicinc.com,
        quic_sartgarg@quicinc.com
Subject: Re: [PATCH V3 4/4] mmc: sdhci-msm: Rectify DLL programming sequence
 for SDCC
Message-ID: <sar4bvjd5ntniucgrqvpnorywlyifuzvta6h2nggqodxinj6d3@5zwwjjhc5ycn>
References: <20250122094707.24859-1-quic_sachgupt@quicinc.com>
 <20250122094707.24859-5-quic_sachgupt@quicinc.com>
 <nmsm6bb5biptmzruggs4f3mweq7d7hcmwqjdidf6bi7gyoliw2@x4yitguzz6zx>
 <94f3e5e0-f04f-ca4a-6133-513223919c72@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94f3e5e0-f04f-ca4a-6133-513223919c72@quicinc.com>
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=6848356a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=9sPEnqXd4bbI6Z3rhAAA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 4BbaeIPvOt3lmdsOAyzTHkyq23-w9cVi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwOCBTYWx0ZWRfXzQCRgJg2CWwc
 kNg92dc87C4owIvE9eG+H23OPsu1aIEZs0SxAtz4CLLq+5M1EBHPha83ZXtPXvxrBYWlQ4jL6Yr
 BwfyRu96SnD2QALgy8fWrJpy1Ps8BM6TM1xzHm35OcG9rtyKm8SYT2l+hz4VA3Z3+2IWuO8JRn/
 61b9NA72bQJYr0DPWcyjiqz47G4MHmi+02DzKsr9OBV6DQIdW9YPXJQOELt1RKIrTcJmLYIbEOZ
 9YaVPWvpv3S7Dn8/HDMRd0ZBqOFFnK38lXM6yGc1jrolBaxNacmj1nsAyrbe2TvdYoHH7q0yGrV
 /8K2t8if0hrlMHH5gWFoutNQzoDb9nycIREdkYMIfm6zZqopdyn4MvWdQiVLjOnarjfzJ6rNfIY
 YrX5YQ3Co1LG4HDHq2zXJ0jhslEY4hxNYykFEGbjpanlXfL4X9Kbs8cqF9mH3Pdbmq/f3Ux4
X-Proofpoint-GUID: 4BbaeIPvOt3lmdsOAyzTHkyq23-w9cVi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100108

On Tue, Jun 10, 2025 at 05:52:02PM +0530, Ram Prakash Gupta wrote:
> Hi Dmitry,
> 
> I will start on this with addressing your comments in previous version as
> suggested.

- Please don't top-post. Ever.

- Please provide some actual response the comments where they were
  posted. From the upstream community side that's more important than 'I
  will address comments' announcement.

> 
> Thanks,
> Ram
> 
> On 1/22/2025 3:30 PM, Dmitry Baryshkov wrote:
> > On Wed, Jan 22, 2025 at 03:17:07PM +0530, Sachin Gupta wrote:
> >> With the current DLL sequence stability issues for data
> >> transfer seen in HS400 and HS200 modes.
> >>
> >> "mmc0: cqhci: error IRQ status: 0x00000000 cmd error -84
> >> data error 0"
> >>
> >> Rectify the DLL programming sequence as per latest hardware
> >> programming guide
> >>
> >> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
> >> ---
> >>  drivers/mmc/host/sdhci-msm.c | 270 ++++++++++++++++++++++++++++++++---
> >>  1 file changed, 252 insertions(+), 18 deletions(-)
> >>
> >> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> >> index cc7756a59c55..17f17a635d83 100644
> >> --- a/drivers/mmc/host/sdhci-msm.c
> >> +++ b/drivers/mmc/host/sdhci-msm.c
> >> @@ -28,6 +28,7 @@
> >>  #define CORE_VERSION_MAJOR_SHIFT	28
> >>  #define CORE_VERSION_MAJOR_MASK		(0xf << CORE_VERSION_MAJOR_SHIFT)
> >>  #define CORE_VERSION_MINOR_MASK		0xff
> >> +#define SDHCI_MSM_MIN_V_7FF		0x6e
> >>  
> >>  #define CORE_MCI_GENERICS		0x70
> >>  #define SWITCHABLE_SIGNALING_VOLTAGE	BIT(29)
> >> @@ -118,7 +119,8 @@
> >>  #define CORE_PWRSAVE_DLL	BIT(3)
> >>  
> >>  #define DDR_CONFIG_POR_VAL	0x80040873
> >> -
> >> +#define DLL_CONFIG_3_POR_VAL	0x10
> >> +#define TCXO_FREQ               19200000
> >>  
> >>  #define INVALID_TUNING_PHASE	-1
> >>  #define SDHCI_MSM_MIN_CLOCK	400000
> >> @@ -309,6 +311,16 @@ struct sdhci_msm_host {
> >>  	bool artanis_dll;
> >>  };
> >>  
> >> +enum dll_init_context {
> >> +	DLL_INIT_NORMAL,
> >> +	DLL_INIT_FROM_CX_COLLAPSE_EXIT,
> >> +};
> >> +
> >> +enum mode {
> >> +	HS400, // equivalent to SDR104 mode for DLL.
> >> +	HS200, // equivalent to SDR50 mode for DLL.
> >> +};
> >> +
> >>  static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
> >>  {
> >>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> >> @@ -793,6 +805,211 @@ static int msm_init_cm_dll(struct sdhci_host *host)
> >>  	return 0;
> >>  }
> >>  
> >> +static unsigned int sdhci_msm_get_min_clock(struct sdhci_host *host)
> >> +{
> >> +	return SDHCI_MSM_MIN_CLOCK;
> >> +}
> >> +
> >> +static unsigned int sdhci_msm_get_clk_rate(struct sdhci_host *host, u32 req_clk)
> >> +{
> >> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> >> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> >> +	struct clk *core_clk = msm_host->bulk_clks[0].clk;
> >> +	unsigned int sup_clk;
> >> +
> >> +	if (req_clk < sdhci_msm_get_min_clock(host))
> >> +		return sdhci_msm_get_min_clock(host);
> >> +
> >> +	sup_clk = clk_get_rate(core_clk);
> >> +
> >> +	if (host->clock != msm_host->clk_rate)
> >> +		sup_clk = sup_clk / 2;
> > Please resolve previous discussions before sending new versions. Just
> > sending a response and then sending next iteration of the patchset is
> > not a proper way to communicate.
> >
> > NAK until the discussion is resolved in the previous thread.
> >
> >> +
> >> +	return sup_clk;
> >> +}
> >> +

-- 
With best wishes
Dmitry
