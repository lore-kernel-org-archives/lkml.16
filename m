Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1424A2797B1
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746718248; cv=none; b=LC1GxNXPDVxsn8a4NFr/jaKy7IA7QilDDx0UPBVYVk5aNQYnGwCxLvOWGu9ecS+hKWkL9DtheG3yLwRB/SB9iVM/3cvDqBuZFZ+4Gpcz7l671XXRY4ofH+RLuAAdBbDPhrMFbWsFnZw20TGaSE3RxNmPc7eN7uGGQNUTt4exOHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746718248; c=relaxed/simple;
	bh=Hwq9EPxp8FC16XFobVGFtBFmz7z8fzoxIcMzVoGcSx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ld97J2Vpx8gRcaP4Z9yxlg79/OrfghU51briESmLvs2UzFgiRk0WgNfGLHxq2dsr6Dvgvk+gFKZ3K9YIKhQUmrLLOTH8tE2mG1VyPGbz3gkz+OSARtuvbnLTodrtYk29RELfJLPSe+KuFkONO4et9rUAXd3znbP7p0B5JYeQsQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c0/fZMmC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c0/fZMmC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548EGKjU016373
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 15:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fG5eq7oCcGLrY9+nU8ZI5t59ab5XGtk3o4t0+xbuPO8=; b=c0/fZMmCTTH1DGe2
	NsD9ace0U2qJN1YloODOXZcPPuTFMbUnIrudzy8bYOgflQz6n+QVeQ7c/ea8e8by
	G4na5bv9SBeUeKYIVTCGDndXpQSy6jOAxraI/dH9bsKqgD/tU4r/SOKLyVLEsC89
	2cFhc7Tj9bdaFuMbppRomMpfzPQvtAo2YlNW9js0VWjafRoXZ3KtfX9xpKK0TW1K
	6X7jF6it0vJD2RpP4LYO2/BMwV8ATb/ozhFZm4ez2/EZVx+COSfuKsKKHksjlUMr
	xzlyKbt7B3HX/lVwu6vorWp2FUEIZaP9ev4HXgVq12BigHrweocIh75exXV6oLqC
	1EmKFQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp8ssby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 15:30:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5ad42d6bcso26255385a.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 08:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746718245; x=1747323045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fG5eq7oCcGLrY9+nU8ZI5t59ab5XGtk3o4t0+xbuPO8=;
        b=FZNjquirShYaStggrlORhrT8ZTQBw4MLajwLr96zDL5vqqd0823zRJJAG/pgWom9qX
         N9MGMEgCnbtJLp5RODyfzojR+nbeW1RS9+x+DEvzTxYm/FlRoMn2SoJWHGrugyEaeVb9
         ju74rXNhuD9jHBRnEUAy41/JN0mHAMiSz1a/p3GuSILZn5+P6pJXXfjhkKmFQ6a2UKW2
         B0fdfZtBn3gSntplF6cQHtgm7CSMVmRZURbF37VJzsFF6giUDbHUkF6bAty/rTphpvIc
         paP3yxr4UNnG3x60OcYJ1JCE8eXxcxjijc0jX6yYA9mci7+TpA8OxUv6bDiMA5anqIqw
         rexA==
X-Forwarded-Encrypted: i=1; AJvYcCV3hbMVbGxrxvbdPMFlnMN0C/trp130KVGVtfqLTUl2KqrdzeWS+MSHWazNQzfW86ppKXDtd5i+EorPhhk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmDJELSdTIefLGcXbOdVWi35wqbkLNrRHnE4032fO7jmN+ovr/
	efpmQ6a4wxkCwxC6Q9OKWpADnPRbvAkpqoedD7003mJOhi0U5kZ9wQ0ay15UPJdpFhlU77Ow0Al
	5pBMTaGf/88vtSLne0UMKNDPz4ZlkyJWfvc54xyf/ldf5t1ogysr+aO6Q6RkuNyE=
X-Gm-Gg: ASbGnct5BXNVetJENSgvdFsdv/vgp6sDQxCiHj1BL/uhbqyhwLwk4JMgVs+gXXEAfww
	6uEOIFvwrRF9p1DfNc2phmWtdVkLgC+Gd6osXi/LoqTmCylC6KWSlVMwxVlzHoIdYno7W3piGP1
	/MvQVkrQs5MPbYOxGyq9lquKZZu0sojW4M1WLU/Lm7n8ZcVg3zhnITZQEPgcuTCJSP/PLjHJwZx
	HX5Y+YDUiDZwpcIHGJtWkLqaPLhVu4u1G0q7U5VwrS157DOGmc4r+QDK05Kl+OWWrEKZ7jUvDOC
	1gokNOAdCxqBGiC/vZqdNebNygrmQI2HVDB3ZC3eFRMUxmiiZbJ4yubym3/Jb0BbOPs=
X-Received: by 2002:a05:620a:269a:b0:7c3:c340:70bf with SMTP id af79cd13be357-7cd012a3e67mr102185a.14.1746718244746;
        Thu, 08 May 2025 08:30:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcHhfv1CePMih+NQ7khTsqGDoI3CoI/rsyT7oxNoEd8Echel305z0c+OwfziY7rWKZ5y4aBA==
X-Received: by 2002:a05:620a:269a:b0:7c3:c340:70bf with SMTP id af79cd13be357-7cd012a3e67mr98885a.14.1746718244301;
        Thu, 08 May 2025 08:30:44 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21974701dsm451366b.116.2025.05.08.08.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 08:30:43 -0700 (PDT)
Message-ID: <b3c662ca-16bb-44df-ba68-faf55b1e3dfa@oss.qualcomm.com>
Date: Thu, 8 May 2025 17:30:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] scsi: ufs: qcom: Check gear against max gear in
 vop freq_to_gear()
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com,
        bvanassche@acm.org, mani@kernel.org, beanhuo@micron.com,
        avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_nguyenb@quicinc.com,
        quic_nitirawa@quicinc.com, quic_rampraka@quicinc.com,
        neil.armstrong@linaro.org, luca.weiss@fairphone.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20250507074415.2451940-1-quic_ziqichen@quicinc.com>
 <20250507074415.2451940-2-quic_ziqichen@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250507074415.2451940-2-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kFYR0FI5weYZk58HD1Vvlfdo68XHu8cv
X-Proofpoint-ORIG-GUID: kFYR0FI5weYZk58HD1Vvlfdo68XHu8cv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEzNCBTYWx0ZWRfX4lRZ1pOJr/5B
 wMILACrhcmQddkTkU7jA4oeEaQpABjcZ36VpmLXIaJajZCZvpzVaJn+0kL95PU3LGaeGRNYUb+d
 Np9aA8Y8couzWUnvqvVaTWtSQ4tfL810EbygtzFD81xPfQ/3B7N70TyKNSLltDQyHlJWcW6eJoM
 eUqkJVjCltTPAgrwUfsdx94YlpC0Wjc8pD25RST10nPIWIhWIxVa7dtXU2S5mPYGJwmJisPd5k4
 JACLiHZ4c8uJNyaWra2KNOlbc8knzKEBSaU54v7Mm5Om4D5Gtx8MK/9aE+axE8Qsklp8y3i8FFX
 OcqY6vTG54wzk1KJ3n2l2APzQ7ZQOUmXFqvoyRuhPwxsxgr5S0VRlorCUcF+EnbAag393u2S+o8
 d2jmFqJXL7AnRgHs0f9xpD2UJ4Hqw/RgCO4Btts7o+AqEoKP+BWou5zYRyWqcpBEU/vFfDub
X-Authority-Analysis: v=2.4 cv=e/4GSbp/ c=1 sm=1 tr=0 ts=681cce25 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=ufAJUjbdAAAA:8 a=Ell6U6KZOJ3Qm4-2En0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
 a=rB1ygNaI0PWiOa_UD5GD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080134

On 5/7/25 9:44 AM, Ziqi Chen wrote:
> The vop freq_to_gear() may return a gear greater than the negotiated max
> gear, return the negotiated max gear if the mapped gear is greater than it.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> 
> ---
> v1 - > v2:
> 1. Instead of return 'gear', return '0' directly if didn't find mapped
>    gear
> 2. Derectly return min_t(gear,max_gear) instead assign to 'gear' then
>    return it.
> ---
>  drivers/ufs/host/ufs-qcom.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 790da25cbaf3..7f10926100a5 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -2105,10 +2105,10 @@ static u32 ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq)
>  		break;
>  	default:
>  		dev_err(hba->dev, "%s: Unsupported clock freq : %lu\n", __func__, freq);
> -		break;
> +		return 0;

That's UFS_PWM_DONT_CHANGE, please it so that the reader can more easily
make sense of the code.. Actually, perhaps this function could be tagged
to return an entry of this enum specifically

Konrad

>  	}
>  
> -	return gear;
> +	return min_t(u32, gear, hba->max_pwr_info.info.gear_rx);
>  }
>  
>  /*
