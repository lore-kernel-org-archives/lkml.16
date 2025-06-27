Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A662E88A6
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039677; cv=none; b=qeTN6s5HTEXsPKSrnj5Z8sLpCjRLCgZSZq7gQsaYtNPrPCSaUjS9lq3DNCtynFB3u39fUedI4xSshNr/2Y9GfdB+gipBxdgi5wghHPBLIEkY6CPIz/aSykJr8dEsNtbw+lofjw21ewSN1wdZ94n4zR+/VHPybhe61MP+/IzKFhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039677; c=relaxed/simple;
	bh=S8bnZFwqOefSjfjbTJZ426XN8OOe081rliiCwRtOwVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MYe7JM5ZepdeQbNi637oit7gu3NLvP47eFZWEeq4Z6g03JLGqjMeFKCfAGsQZYZwcADLKcpSyySKbw1W+2rpb0g1wXc/RanT0V7PccovzbNVIcZbOcBSIEcpHuqawl9vCCW8zuQiZ2nKFsblbjlwNKnCSSpawyVPsYnE2ivZCwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nmao1MSX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nmao1MSX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC0JwD009547
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pZr7iAj8/Dq9pOneeMlm+pgyY2ynqbotMAGjlAeCcLw=; b=nmao1MSXUtZjQUoq
	SDTHRsY0Hg3VjpLw/0Ii6jsLVDVb+o6Yohs8y3iHUebXf0FRWOQk/sjhIqZJBEBY
	BSo32OJ3lGaKxUevBvFPf56KEC7/lfJ8pBNAv2D1F7XYnaQcpdiQDhvfhyTtTLUa
	ACryQoaz9l4DhHiiNizuY9qmTnWFmSIdOOZm+Bhwi7pEu78jtRObXxWSPQkzbkr7
	6hLAhByJHsqGgfYv6o4x9hV1eGwsL1pu1qSch+fMTKpYF2mpUw7cbCeVr9XfhuLV
	SdoaqoIPwjllHbjr22wrAx2Oe6drE/2Vv2f0sFHDlO2CaXmEVdGj0lSD6dHuDHmj
	Z8Dviw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b4796c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:54:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0979e6263so3349785a.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039674; x=1751644474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pZr7iAj8/Dq9pOneeMlm+pgyY2ynqbotMAGjlAeCcLw=;
        b=IH/PXd5lKTCxAOYwtOFEwa1BkXahWrtEb1+QFwiem/HWeN79Ty0UHWJ18zN2wbEWNJ
         kV9z7Ti3H0hOg9I9lLvAhRdOsrnGlU3crypKMxdxQ5pECJ3uBKZdL4G5ZesgAdGIr+yM
         onnnYhL8Efc9KfRWjU2O/4lO9o9Z4f9JSYl8waDaNFD9aWGjyn+Ack/8t7AHd2CGbpCG
         SJxxGRqG814a1shgM/FvXSKBFq9/Xl9gnVmyDvG/AM+DZ7+lm6JOCab1oLnwgYeydGAu
         iRuxarZ/KEBc1+8QORXNU7734Zxm3+jGSUkvNZ7PQXKgNhkBq6mF2qJPSm+krkVn22yI
         b5VA==
X-Forwarded-Encrypted: i=1; AJvYcCVnEvGP4Eq6ldWf7bXFBS3NmCB4iTDKeIjHdydC04KHkfBvTpFQGa8Sr0hbHYu5lPSY1yy5RvfkazHjuiU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXKBq7PqSsRkzK8JCk63icDzLYvuqDDlILYMOMkERtk95hfVrZ
	7bX1oyiEc4lMI7SshmzpgZPox5xDNIDNMatMK9vXjwLtaX6JdxS9u5/BqEDZJYkYDnr4WjS2SSx
	mxMglpfE91wUnDlBAbDyQeVy+fxivpuqF81J0LvZG9VuXxMxtdrKANRSlOEeeiI3HUWU=
X-Gm-Gg: ASbGncvXyRv8dNypIS6Xad84u7VePRNvmEuNJTFmie3zXgV4+l7VS5f+SBbr59Jlj/y
	Di8hJfFyF6CYOpgM2SETz7F8+d37eXwVAdmSs4chDC7xyPJONFSk8yxQTfcx4BZPrxSEOsfmrQn
	DJaFHxZYJv71VYAMXUyTzdmsp8Zs+i3+oZid1s789F83Cbnj+fAmsK+qaq8EQ+HjLJsmHlRikzg
	8nAqMImE5wd9A22AE7DXnfSlQrYSKkle5dQ42DqPVXSAK2crXiK4Yn7pnaXO+6tnyhWPpYyG/HT
	l0sqDq2fiq1EciG0AC9LidkTZALmLd2CV7TzOy+3dgQHKFkuHqG/SbptYVbEmvRwIe0Z2e4B4sg
	h4IA=
X-Received: by 2002:a05:620a:404c:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7d4438e31e4mr210379785a.3.1751039673895;
        Fri, 27 Jun 2025 08:54:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnVBSJATURZomyb5icuOPlYo1v/x1ajNUslEnC5Ai/XTvP7ZKMpfHMiKxOU0P7qaWYMS3lXg==
X-Received: by 2002:a05:620a:404c:b0:7d3:b0a3:6aa7 with SMTP id af79cd13be357-7d4438e31e4mr210378085a.3.1751039673452;
        Fri, 27 Jun 2025 08:54:33 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353639bfcsm147793566b.11.2025.06.27.08.54.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:54:32 -0700 (PDT)
Message-ID: <68c06500-a776-4f56-8514-c180b23f7715@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 17:54:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] soundwire: bus: add sdw_slave_get_current_bank helper
To: srinivas.kandagatla@oss.qualcomm.com, vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250627155103.441547-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627155103.441547-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyOSBTYWx0ZWRfX9OPIvukg0K0T
 I6iXvAFRg+XuOmlTHL9G+dJjJeTQe/SAEZ5f143n1Vww0fbd6dZApli6ffdS8raqMbbs4O2YLhn
 A5SGmS9kTuby96Ht9ZqkDx9O8bu9R49EFDK5D9H6C+IFR26f8jeTrx2i3h/OFCvyKrza/aOSZ4E
 Ff+ph1t/9rUMv45+3VzkO1FlkTKdp5Od7FVWc6Yjub0wPDYQu3UgWPs27lQRRMRF8WPXHIhdbzI
 CTV0n1BcKPMTJ95aN4ayt+6rpPiKZcW1eTvJApr5WROLQte1ujrl/ejeH6VLUkBQs5pX8r2vi+h
 7jwYTUyn4fV0/k5kZ/1QH13ZInVhxwYD7C+fMIWqb/+ylhLpBOvEQCKD1ohNwLanlO1ncL0bgzL
 f1eP1HM1FCnMkq6W2psh0lb1zQDPp/EiLcQnHXfya45PK58Ncu59GSpe53ok/9uYzAH3K68G
X-Proofpoint-ORIG-GUID: pK39CbzsQ3WOWrk8gRI82uC1bKk6V4Tp
X-Proofpoint-GUID: pK39CbzsQ3WOWrk8gRI82uC1bKk6V4Tp
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685ebebb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=7h2XZbHhf3WDBbgsTHsA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270129

On 6/27/25 5:51 PM, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> There has been 2 instances of this helper in codec drivers,
> it does not make sense to keep duplicating this part of code.
> 
> Lets add a helper sdw_get_current_bank() for codec drivers to use it.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  drivers/soundwire/bus.c       | 7 +++++++
>  include/linux/soundwire/sdw.h | 8 ++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 39aecd34c641..58306c515ccc 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -1363,6 +1363,13 @@ int sdw_slave_get_scale_index(struct sdw_slave *slave, u8 *base)
>  }
>  EXPORT_SYMBOL(sdw_slave_get_scale_index);
>  
> +int sdw_slave_get_current_bank(struct sdw_slave *sdev)
> +{
> +	return FIELD_GET(SDW_SCP_STAT_CURR_BANK,
> +			 sdw_read(sdev, SDW_SCP_CTRL));

sdw_read can fail (miserably)

Konrad
