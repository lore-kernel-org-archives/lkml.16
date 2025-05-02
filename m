Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DAB255F32
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 14:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746194629; cv=none; b=tRs6Qbn384Oto+fl+ocI4JMAPfl7pKyQAPpPCKhysSdVbB/IHkHfkJB8Q7IvfF9+3ihZ4oPdBVmPDK6d/HBvwNo01nqiV4vNEJH04xyzZGd0lXM7cr7Rpql/itjm60M18Xq/QXkYPTAfu6WdWxgJOEhHB69Jj6TlPvxMotz6mog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746194629; c=relaxed/simple;
	bh=LgutJA0lJhombQJ4lvFFMTu6PtaO4DwdRtdemX7aeNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=un3feqF2grFY2tJHYbyKtGzSPnl64Bqse5aFEoKXI1YKHIHRlOiHBFje/Td4KQvckI8Ayn5pvLJjh0vYlshp9AXgA4LWb7jW84VSCqY7N5SsgF2wBrj05X5lYJvR18Y/aOFXGoNig2HwQK23d0g3/L3S9l9nPNM7Thz7ReL+Ogw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LrKit6BS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LrKit6BS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542DReDn001436
	for <linux-kernel@vger.kernel.org>; Fri, 2 May 2025 14:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oyxo2SQbtPaQHibZb3IFvrcK2jBkjO/BXe2BArjhyn8=; b=LrKit6BSeqeNAM5x
	WqIgVeTVuQ2LaFnqwkgUpSW4qdyMZtvJ4L1EK4JBuf9iyUDpomGEfJwNNiXXMMUo
	TC9KL5JiwkfH5qMOXd2pJlNquscGbzLXy7GETkDwhNpbuES6Y7KhOZg18xOieepq
	URcUejLWwQbyhFwGkKk5v6TmihrdapI5KeCE84MI15ddUIa2WqMXKhziJ3XDO0MO
	qP/YnYCRITFrRl1BuYFcy91QiXf4sMhcz3+FKVpz6hIMDR+f0HN2asCqGwgwDkeW
	H1lll5AWPIni7i+e2MnPzfjBd+iklld8B1SymwqHo4DV/5E0GUjUm7tyy2qs7fC8
	sVJCcw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u2gj1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 14:03:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f2c8929757so5329886d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 07:03:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746194625; x=1746799425;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oyxo2SQbtPaQHibZb3IFvrcK2jBkjO/BXe2BArjhyn8=;
        b=ZWmUCBDdWoPaWwFyAlhdXV8J4gC3+L7qTVAokMRpDwQ7PkpNZsiLjxSmvLPTbOrfs7
         Lej2cUk9LLJyXKuVw+5OJoV0IMWzxCy127aO6p+5PXhG5VqOcAUolhr1OErSTtbDPRev
         KPH1gqmA5ZXliFiU469zyg/llnnbKrPhxa8T/7Ksat4lQR6Vb+qcSl6VWdast5aQincC
         2Bm3I1lXG/cLlqcF76YyWWDJnlbA7oLHNpSPXK9mZyuI070ewfDxMC4NEk4rdcnRAjVD
         ZMssMzpbOleeCqDScTWXcqQ3nUnuduJUS0FMXD9BUhaPWrmxatGNHek7TcJYoaaaaT8B
         J6wg==
X-Forwarded-Encrypted: i=1; AJvYcCXM7h9t5wGDFfaEDdgnfrk4dW/DmFnso7DxxCOD2rD+ZvqnOsL/rrl3M5M7mySE/Z087rbO5+G1AEcGeto=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza0cZHA1r7PRCKUcV/rLXnHAgskEiEbJJOL3tbynm7kz26FDhn
	au8zhcCu9BfiWbAzksPs9Jx0TKwsk4ZenpnIQldmeNUt5SLdKMVbsCQtK31E5oqCqQMz1Ltkk9I
	LDZU9SwBazsS/bNpo3rQxR8Eqr5uNEWPVUnPyyyFrX5S74Cbncoy8ywn1eB+Vb6s=
X-Gm-Gg: ASbGnctPjVI/aRtMzCaZ0g0sSgOH5IsjI/gRc1eNhaw0nlq0M9GRHfge5R5klB/l23b
	YV3U6xMVuVTIOW6IS1Tt+sjsiVlNMNFHOkDCIGoIm8pzKr+3QcVQZFI7mFztg42/m2PxzQo3YmY
	4zzb37Vo35QBkl8iKPZgI0Mgwck6ZYUnTNzEyjSPS2QdMKUfSDYVx9J2HE+HcXTWTXuqj2LS3qq
	TaykXjxCvwiFgtAnXqkyGHgOazBfsWmfhfFESC4/iXbNDY+nAciVmPv9nkwuKSSgYdJrZLoJAYt
	C45FO5OtyhSbkun4+ouqbnZe8+WUzAOWdUX9jAFp8HG2Yc+wDY+XymXy76ewm1mNSyc=
X-Received: by 2002:a05:620a:24ce:b0:7c0:be0e:cb09 with SMTP id af79cd13be357-7cad5b618bamr159158985a.7.1746194625474;
        Fri, 02 May 2025 07:03:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAZdoEcF4muK2lzyA+04Q12B61EG9ZfRedb/HviJ5YwpupYBOF8I/+YmpnDf2FCTkGY1aqPQ==
X-Received: by 2002:a05:620a:24ce:b0:7c0:be0e:cb09 with SMTP id af79cd13be357-7cad5b618bamr159156885a.7.1746194624883;
        Fri, 02 May 2025 07:03:44 -0700 (PDT)
Received: from [192.168.65.113] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c0284sm53569066b.120.2025.05.02.07.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 07:03:44 -0700 (PDT)
Message-ID: <2036ef2f-c7ef-4f42-858d-8d95c430c21a@oss.qualcomm.com>
Date: Fri, 2 May 2025 16:03:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, bod.linux@nxsw.ie
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6D7p-y-7XmUPfy0OvygttiydRcMllc8a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDExMSBTYWx0ZWRfX4lMHKEubFQir bRWJrYnWHwkHNhWL1RusJ7UJuY09AQCxEu97gG9o2FHB8WJrtgAEZG6+oH/3iPqmfim4R8bCaPL U9/wMOmJJo8Zu011MMjK/Rw7KeFCb+CA9q7tzCu5vkYP6VxQOGSq6Lcwh2icD3xTG5nYpILfhqw
 tSFag/2kkhSNaFbZRjSfsLW1fL32O3JcHadtbBF6YGrK3wf+xKu5spSYmvGIl7q2Z+CGv2foByI nkAusxtOGSdSzmK2yOOQwF/uri6dIkz3jL944v4bQ8GssZLnBr8RYVBClXhLMGI2/S7Kb8NLIUN A4HnYw6Kj0Ivc8RFLcEmrB2LVDNN5jQ69JMwW0YGIhPXMlrNTx8IRJZXqBPhMKQ1PTCQNEtsnol
 fO4/QfNWQbLLO48hV17SHNnNWMuYP3d4DAYZJuPqex9gAfnElf7RnuRJjQ+f/td3kDKeZ+i1
X-Authority-Analysis: v=2.4 cv=b5qy4sGx c=1 sm=1 tr=0 ts=6814d0c2 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=nDYdJfLhOtoYANEz9-kA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 6D7p-y-7XmUPfy0OvygttiydRcMllc8a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020111

On 5/2/25 3:17 PM, Kathiravan Thirumoorthy wrote:
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

[...]

> +static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
> +					const struct qcom_wdt_match_data *data)
> +{
> +	struct regmap *imem;
> +	unsigned int val;
> +	int ret;
> +
> +	imem = syscon_regmap_lookup_by_compatible(data->imem_compatible);

Try syscon_regmap_lookup_by_phandle_args() and pass a phandle, see e.g.
drivers/phy/qualcomm/phy-qcom-qmp-pcie.c & phy@1bfc000 in x1e80100.dtsi

That way all platform specifics will live in the DT, requiring no
hardcode-y driver changes on similar platforms

Konrad
