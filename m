Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CCB28C843
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299242; cv=none; b=BPCjoiQV+/xb9eoV8qmMbBFttTRn22wT3d7jtUQtgdPb/AFu6C8w5yIO9UUz9E4pP6EnwBDb/W8/AKCSQ5FUcvxhMdE1dh9DQLju7ePtxm3CKpQ+xICTjxYp03jluVerKZND2etWMpuhK1X+yxeC6tuzBfU6/PhiomzSu4q/X8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299242; c=relaxed/simple;
	bh=2RoVilq28JLCWveVcprN0momhCfAmtJ7VfZdpeHBMdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gvKbHo8n699sk84JbHGfY3PaSWv6uLDWyIom1E6D3jxNq0kqtC5f3usXWn64479AqURiIf7vpHmlQYDJBAqHV9T5SG7f6w0UBvedv26LJvzoddl6gfr/amcFNnJMaiedwI2mcJzB4KMZQZFiAO58ZP4OIy53CG+yAGljVfu3AoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+KDVveH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+KDVveH"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54F8YKOs016097
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wsltmdmRVij+n287lyAX8Ikh
	bl8eexKvi2wlFpqccWw=; b=Z+KDVveH7PPZEHqFeBKYb2ZZ5xWBL3m8p1zQz6A3
	QSoaJxgtwzTBACEWBbuSSlQuOKtJawmCC0UUFzus8LlRUxyZfiadS6CSyYezsqQt
	4i9N53R9evkN/xcfA9njHHCObIcarXopOPUt8/B+lR3khAtdkBmOzdyUEwuIIYru
	N6XVBAhQXNNkPW2kW4jzsQPDdB3I4MCmTZ7iOh23yrcIo0PNmG5tUfOWz++Y2HiF
	/iSSzf8YcAagWa90q281QPKRJute7GQFyKoSx/Qv9epdxzuzYmWL/Op4nXySiIkf
	UCehLl36WfEbBF0hJzrdVgTwSoaF4MRIgyjE9If31j9uSA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmwp67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:53:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5cd0f8961so171989185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:53:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747299237; x=1747904037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsltmdmRVij+n287lyAX8Ikhbl8eexKvi2wlFpqccWw=;
        b=LBgiW4ziLzXUEpfvOqKlF3Se/CBmEIWGPd4m7vYOzpO/wAoSNXfwmd3CYu3z0dIG5v
         A3Lb8u6OydXQ/nzjZxkQGDD2pZ+aXXKvEARhae3MlWgXNRjiHIx3zE54EzW27jofYpxy
         /q+6JtWJrcDuq+01Eu+tOuQ9qOOWh1mZY+ppVoM8ZinbFtnCHzXGdN8SCtt8P+x8KLPV
         S1EwrQxP4Syl7d0Nkq+6GzWSoTeFAAnAqrdFumE181QBaYKD61Tt/rHHZx1E4QK3AffI
         6rcihomTM5zVYEktdmHqX/aCo3vznWhPjUNhEciWQft2afs75iuIy+fe/bQCkDG/hT1a
         y3kw==
X-Forwarded-Encrypted: i=1; AJvYcCXa/bpgsH9ejX1N8z52CRuz3OYmAvwXQPqRWVZw9UxWDeFPbCU6yKOWMRKmh1Df+OKQBr7jf1GgP5fMNXM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj1d7WQdE9KWtBbeynKhb3fJ2VHLjZMOWF6TgG/LDxSicyioFp
	DDgzZo5c4Q0+kYXFgt1t/Iql5PPOWVpYneRxRYnOZjXaUV3fiI1jzEh4yTkQPjIgE4s5GpBZOSq
	ubb7iurgiiytJb6C6EhlamZOX8qhcukbFpgLXFTnc3zDM+T5czp3XowcrKC07074=
X-Gm-Gg: ASbGncvgtWuZ2LbxQvnJ4TjgeKEx3eTeE6eSQ8+zjo3ACyLXbZZ92jlGhzwJC1+UzSO
	HWqramVJ41PTd4dwjtM5otK6W+eH/heJ/G3Rt7bjK7ut46ji6B+o3DFV6rlCNlp6KoSVW8c2dx1
	KcT9nK7NsQ2HBYXt1TmUibq6HR6gqKdzRPCX1xP1l4RIi4CDHsYsGWTjkAbBSdtLKuD+PfBBNFQ
	VVvMf2fOWgrE067HadVoAyWWa6B1tdFwbkpW+fjbPrPWtQk1VdpoxUzpJyWVD4Y5SiCBptOVdtR
	QxYGhYx23TLdIOJD1z/HZ9dnROpcDCd6KsoOD7l8IU4y46jUgvM3DvkQdijEaiCcSSrxrh7q0Ls
	=
X-Received: by 2002:a05:620a:1713:b0:7c5:5a51:d2c0 with SMTP id af79cd13be357-7cd2885d11amr1070576285a.52.1747299237254;
        Thu, 15 May 2025 01:53:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAhtHxB82XttHE69UTemQ1V/dS0+iRE/EXXu/EjukfFzXmiKEenxKCuoij+gVRK+gVuXtXkg==
X-Received: by 2002:a05:620a:1713:b0:7c5:5a51:d2c0 with SMTP id af79cd13be357-7cd2885d11amr1070573785a.52.1747299236913;
        Thu, 15 May 2025 01:53:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc645cfa9sm2556379e87.68.2025.05.15.01.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:53:56 -0700 (PDT)
Date: Thu, 15 May 2025 11:53:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sarthak Garg <quic_sartgarg@quicinc.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com
Subject: Re: [PATCH V2 2/2] mmc: sdhci-msm: Enable force hw reset during cqe
 recovery
Message-ID: <2frduref6loba4knl73aryr3a4kdtuohm3m74tdkrv2tl7oxqp@clyp2bkqfr5t>
References: <20250514111155.10896-1-quic_sartgarg@quicinc.com>
 <20250514111155.10896-3-quic_sartgarg@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514111155.10896-3-quic_sartgarg@quicinc.com>
X-Proofpoint-ORIG-GUID: e-mE_UNlYIywdC-Om63HG2NJKAsI8qVp
X-Authority-Analysis: v=2.4 cv=HZ4UTjE8 c=1 sm=1 tr=0 ts=6825aba6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8 a=WP5EXEGyC8KvHHVvJxQA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: e-mE_UNlYIywdC-Om63HG2NJKAsI8qVp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDA4NiBTYWx0ZWRfX/1IaS7yRBDQo
 KeC0oRFtIvOulGSe7wjTz7ofXSyzxfIp8u/UkIIGOuFjawoqKt3ZOw3pcbsLRP5JcaUSyzscyuu
 66hmGOZntHWoZE6vBQiGJvYbKEUkug1e71GMNAenHKyjoowhYm+m2Z4vE5c9G2SUAd+RGn/c39F
 HwoOR/T6Fw6iNTSBHH5XfPrBvehJh2PD3N6lyPnuQH4jNU1qmC28rpt9ZzhfX6CFB5ZycAaWKnX
 UROWunwU0DSG8r+5qpEcq03Um2nV8NDTQfbmEdnqtojayj/fBGWvNqj7f7bdhsTlMQ1JhNHXxEE
 BRl5rW4N19RITRKI5JLcqj2a39ripNQb2iBr6Fa/1UK77VF7EQ858xwYUHVwT2n2mlaG7xCi9Aw
 oHSrUq5MMpSQ8rZcd/SJoqOiHLjjwHTjtes+rZ/GdALcayk3gvogTuvHG1kV+goXgmpr2zyV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_03,2025-05-14_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150086

On Wed, May 14, 2025 at 04:41:55PM +0530, Sarthak Garg wrote:
> Enable force hw reset during cqe recovery to make recovery more robust.

Nit: CQE

What happens without a reset? Is this only required for certain
platforms or does it apply to all MSM platforms? What are the
consequences of a reset?

> 
> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  drivers/mmc/host/sdhci-msm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 66c0d1ba2a33..711252ad24a9 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2730,6 +2730,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>  
>  	msm_host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_NEED_RSP_BUSY;
>  
> +	/* Enable force hw reset during cqe recovery */
> +	msm_host->mmc->cqe_recovery_reset_always = true;
> +
>  	/* Set the timeout value to max possible */
>  	host->max_timeout_count = 0xF;
>  
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry
