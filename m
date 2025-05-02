Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9640E2566FF
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 14:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746197669; cv=none; b=H8m+m9Rc7WIfwDZcZEV8EI7K0u8utxgQI+3fmmoacFW0nq8yUWxzgRLfaCLRe2oll8FoMGMA+jbBU3say+vhZaxiIM+eQ5O/O1pN/YLxIqj4+CF2SZD7eC8O3ZPpwfB6nBC+8xvNKALnElWpz+KJ84QC4cJUXguj2o2skbbQ6oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746197669; c=relaxed/simple;
	bh=n5mbVutTTdA75c430IqNM7iDH8/4xuyXNJAQmbwMjUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oT3uJEcrmL6Ib2gygdGkKm+a+eu9VdsoMA6Oq7uPm/DWmlRzHVOAk5VFc9qvIJvdx6Yzk1pAG+mRyoN18GNJrkbaxkeoddhla3crv/0F2IJD1XLnR+pS4giEClg9Jifj/mGa7F2uzN/6FtGAFjapcE0ojvC2FHazQtkG0RZhcXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WcbOSsGN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WcbOSsGN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542Df90t015024
	for <linux-kernel@vger.kernel.org>; Fri, 2 May 2025 14:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qE/jsvPg905w0/spqoOjWTuo
	z5yjxf8U+JSEYe0nzlo=; b=WcbOSsGN/c0sFyFBfIc5Rky471HlcoA7imjJ4rFb
	2mkJtrF04Z7h2SROOTRBXgOtwZ3THkJxS/l/rZmjQfypV9cuavXASaKWyjyAfhlo
	h/kDqWDeBfRFxSqH1Bju3iVnqdwQCaToGB3/eK4S3ue7t1VCb0qVR6ro+hjM11bM
	U7D4snXDPQ328LcNksud4dGaR66HKKM9IqX9nTCaEWaQt+qtAmlE3pB2GrsgQeic
	IA6lyZGe3PTZ+qcgZsRpa87qat/t35uQk7WrkDfjY7zQyiKMOX5shduWcDMdV2Vh
	N15uh5ypS2QXJ3vDGIENrF8ql0qFclxDgFDdZaFXWfrtVA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ub0jwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 14:54:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5b9333642so253917885a.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 07:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746197665; x=1746802465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qE/jsvPg905w0/spqoOjWTuoz5yjxf8U+JSEYe0nzlo=;
        b=KIkfx2DPAOYEROrr57g+Q3SNIeVp1JshizHRmmshktnGEQaXKvw8UwLsh61asmP+Ph
         UXGSbxNK0dClbMfCsxgfBU135NJtcrLkddaixksuT/3TPb+R5SoKwyWenaMmiTpwzLAC
         b1DwR0eg7InTF1UbfDxhDZj7i1uaUosaswnFP4V7qkORxmpWt8w/aiBlMle1wFalOb0T
         wSCKuWswx/7uTVK39qWwt7zMHlpbtHz3iLtdE24OKrcHDC8XFPwQikZEfhPT2lFeHEXU
         3gGkxfdEUv6pSfqBdM7Z4SNgDgyja4zGCVUNY45S8/2WxykNBTIwsvX0xJbQagG89Pdj
         v3+g==
X-Forwarded-Encrypted: i=1; AJvYcCWtXvVi7MvU5AIDREAU1cbxuMvhcossDZt02/DfAdP0X9krKvJJHZsGvouIbR/qVMXgxYDkdnVkmm1qKww=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQC4yRNb+lghJntNQyAEt6w1w6aH/wdzEIj5SiAvsYwkhanSgN
	MoI6Tf0IE8mnY8s73VnFmrL7iVBXdgfFJ4jqsVk1dEZJjyCwR0OTmFrjz5NrvRd1pB5MjjC6UCU
	4mYYY9geHPDGi3KV9HV56LChvQsKgXdrr/g5XEEh88E/Gch511K6JeCf68LpCNzAmPhyxC7kBKg
	==
X-Gm-Gg: ASbGncv3ImchIXBxtB9bhU31tBAKPZmECcv2MHj8KsClWLJdpU678fuTztKP4yX3Ze5
	lowF+Zi3F5GgSSITTWurZGS9wibVRfYYZnIZaiXzpBUfxplCXCeGqYOOTAxPA+3IrGIwtDon7w7
	dVk57KjYQy/X+QelpjtM9YaSpDwtcSLTzm/cbbuTcI5nhyDbGPSb+4icZQTuNvHKPTXWwnu+wkK
	4xnlj3khwMjONlzxs/R/RJox2TDkIiBYmd8/a/ad5UdSCxlsgyBl0I/O+UVCBxTWUVHRBNVj0bo
	ajkq55zhbt9Wj5LS5OPiVRXkRxVdYqtuVBwOO25w78TGAMJVypt13jzHfO5vfGpg0X3MIw0K5rM
	=
X-Received: by 2002:a05:620a:488c:b0:7ca:c9cb:abc with SMTP id af79cd13be357-7cad5b4d180mr417140985a.33.1746197664701;
        Fri, 02 May 2025 07:54:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFet1ZO0otbj5B/aLa36yQdNFxhUTegLhRDS2nexQF821IjSj7e9HTywZtuVlJ/LbIApJViog==
X-Received: by 2002:a05:620a:488c:b0:7ca:c9cb:abc with SMTP id af79cd13be357-7cad5b4d180mr417135285a.33.1746197664163;
        Fri, 02 May 2025 07:54:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee6c1sm370305e87.110.2025.05.02.07.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 07:54:23 -0700 (PDT)
Date: Fri, 2 May 2025 17:54:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, bod.linux@nxsw.ie,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
Message-ID: <gmoe3ykmns5hmmz6hdyxgzxiejb3nycghhvt3pgjysq6xa2zni@wpqyuz2pj5vy>
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
X-Proofpoint-GUID: ii6c0ChZL6XemlDRdkf-Zf5AUXY8XneY
X-Authority-Analysis: v=2.4 cv=KtlN2XWN c=1 sm=1 tr=0 ts=6814dca2 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=d-kK87IHMynt6gTeNOsA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ii6c0ChZL6XemlDRdkf-Zf5AUXY8XneY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDExOCBTYWx0ZWRfX2gWS6Djs3AsX hMrdIrrDSGLjEq0xWDEEWJku/8qAhEb/WXT0AFCkqI0UgJCGi8Sq+mzHIAkK/G9dOQiDy8D9hUK 1pOr1Ts2b5fqCEvOJxmeer+p9WcgpT7CUYbVuGfBL72/heJklzFt86k5yMueJ2ugU1rI5M9G60H
 iAaFZ3mt5FtK0pUP7SBJvfuJY/1eqQZtdxlAzGSjNoZaprDQ1YvffTaejxzQz2fa+D39OiEMk9+ x00x8440TskiFeRufRgnsKct7d+zB/0az3v2AkcwpESqOeeqh23AuAIuKjEE4N/y1ufwNt97EMT ZuoT/c8ad2IaL8jN0cZHzACcxFxTTPOPESsh8jjS7onlda9Ns3AusW8rZ/1sfPSphla58EPalRE
 HF+vgopNGKanOohOIqEaty5Os6AAqLsWqmopla5VFCxxGjyJM8AbtXql1e3vS7AakfFANhVB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020118

On Fri, May 02, 2025 at 06:47:52PM +0530, Kathiravan Thirumoorthy wrote:
> When the system boots up after a watchdog reset, the EXPIRED_STATUS bit
> in the WDT_STS register is cleared. To identify if the system was
> restarted due to WDT expiry, XBL update the information in the IMEM region.
> Update the driver to read the restart reason from IMEM and populate the
> bootstatus accordingly.
> 
> With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
> as below:
> 
> cat /sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
> 32
> 
> For backward compatibility, keep the EXPIRED_STATUS bit check. Add a new
> function qcom_wdt_get_restart_reason() to read the restart reason from
> IMEM.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v3:
> 	- Split the introduction of device data into separate patch
> 	- s/bootloaders/XBL - for clarity of which bootloader is
> 	  involved
> 	- Mention the sysfs path on to extract this information
> 	- s/compatible/imem_compatible in the device data structure to
> 	  avoid the confusion / better naming
> Changes in v2:
> 	- Use the syscon API to access the IMEM region
> 	- Handle the error cases returned by qcom_wdt_get_restart_reason
> 	- Define device specific data to retrieve the IMEM compatible,
> 	  offset and the value for non secure WDT, which allows to
> 	  extend the support for other SoCs
> ---
>  drivers/watchdog/qcom-wdt.c | 40 ++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
> index dfaac5995c84c1f377023e6e62770c5548528a4c..f2cb8bfdf53a5090bcfff6ea3a23005b629ef948 100644
> --- a/drivers/watchdog/qcom-wdt.c
> +++ b/drivers/watchdog/qcom-wdt.c
> @@ -7,9 +7,11 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  #include <linux/watchdog.h>
>  
>  enum wdt_reg {
> @@ -42,6 +44,9 @@ struct qcom_wdt_match_data {
>  	const u32 *offset;
>  	bool pretimeout;
>  	u32 max_tick_count;
> +	const char *imem_compatible;
> +	unsigned int restart_reason_offset;
> +	unsigned int non_secure_wdt_val;
>  };
>  
>  struct qcom_wdt {
> @@ -185,6 +190,9 @@ static const struct qcom_wdt_match_data match_data_ipq5424 = {
>  	.offset = reg_offset_data_kpss,
>  	.pretimeout = true,
>  	.max_tick_count = 0xFFFFFU,
> +	.imem_compatible = "qcom,ipq5424-imem",
> +	.restart_reason_offset = 0x7b0,
> +	.non_secure_wdt_val = 0x5,
>  };
>  
>  static const struct qcom_wdt_match_data match_data_kpss = {
> @@ -193,6 +201,29 @@ static const struct qcom_wdt_match_data match_data_kpss = {
>  	.max_tick_count = 0xFFFFFU,
>  };
>  
> +static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
> +					const struct qcom_wdt_match_data *data)
> +{
> +	struct regmap *imem;
> +	unsigned int val;
> +	int ret;
> +
> +	imem = syscon_regmap_lookup_by_compatible(data->imem_compatible);
> +	if (IS_ERR(imem))
> +		return PTR_ERR(imem);

Why? Just pass the syscon directly via DT.

> +
> +	ret = regmap_read(imem, data->restart_reason_offset, &val);
> +	if (ret) {
> +		dev_err(wdt->wdd.parent, "failed to read the restart reason info\n");
> +		return ret;
> +	}
> +
> +	if (val == data->non_secure_wdt_val)
> +		wdt->wdd.bootstatus = WDIOF_CARDRESET;
> +
> +	return 0;
> +}
> +
>  static int qcom_wdt_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -273,8 +304,13 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>  	wdt->wdd.parent = dev;
>  	wdt->layout = data->offset;
>  
> -	if (readl(wdt_addr(wdt, WDT_STS)) & 1)
> -		wdt->wdd.bootstatus = WDIOF_CARDRESET;
> +	ret = qcom_wdt_get_restart_reason(wdt, data);
> +	if (ret == -ENODEV) {
> +		if (readl(wdt_addr(wdt, WDT_STS)) & 1)
> +			wdt->wdd.bootstatus = WDIOF_CARDRESET;
> +	} else if (ret) {
> +		return ret;
> +	}
>  
>  	/*
>  	 * If 'timeout-sec' unspecified in devicetree, assume a 30 second
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
