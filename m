Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84F91A5BB6
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 14:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746370292; cv=none; b=sKPjtwoEa/saE5ZhhFuzPeABoKaRK94DSUEALV1t/H9DD7FKp999tZJ4YwQIU9VvyknX9m72E78Xo5Or/7EVOc2VqTN1ZNj1HfWEu4P++CtKB5DNtJNt8IIn1q/EoUPKRRwaKRa9Pd7irCxG5XVLv4VY6A8vfTykV1zYVO9cvxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746370292; c=relaxed/simple;
	bh=R5jUXMTEI4sATcODUwe7y6lMZm3PO8rLE2ZZrClw+x4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwvZA5PY5TH3c6OKfZJwyye0O9KPF2M/89sGc2XOBKXfVG2ig1novlGAWvgtxV6vuXtLQqqCLrzo9LfBoP5C+r84GUQB/Zho8EtU659qxK33pXT0GQK62Ciy21udj2R+IOiAM9HaTD+WKZWY/Ny2TknlABF8M+RJJLGoCypoL9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=edt2AnNI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="edt2AnNI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5448UPHu016280
	for <linux-kernel@vger.kernel.org>; Sun, 4 May 2025 14:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aT646PFGWgiTNKYSG2kvR0Vo
	KIDIZ8aJQYd5gcs1oaA=; b=edt2AnNIAJ0Ra7AZdI3qtTFlcPIYK49DvI3nwUxj
	ZrzksU50KjzPGvi7+nU5dsOJt2iuH80ubSQUGt8exz5vk4lAAN4lcRMlih9gkYDP
	KCQIDQF/PoEbWwHlsibEebllWcpsZNncvKL12oO+YIcg97crdkrwAMO6A+a5pNDh
	J6+KlXH9q2sf8awnXq2SqfPfug8LJMjdCMJo2pqQm17Im0WHqATsuXjJSro+27R9
	nWWoYqjSdXT08JhLBvHsjSfRJsFY/IB5M1G9frjsPEgoIJEJcM5cgjTxbn4vB4FT
	pjvJ7C9/RarfgGQmtcf1mIc1eKwI+kYOVhVKWz8tok7GSA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9nkt6bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 14:51:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54e7922a1so773437185a.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 07:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746370282; x=1746975082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aT646PFGWgiTNKYSG2kvR0VoKIDIZ8aJQYd5gcs1oaA=;
        b=SrydFe5hhEbpg7sPLuLWNjTsugajL7ObBXAN1+wF+KXU0c0BYip5Lal83cRjIwGc4a
         8mfOCaxl410owji+lUZW4yjehsveLaFBXtlCpqT/bIuhzK9Q3ZAgptaeTODv9qcVmkCh
         KH6uJxJdauAWJF+hUK1XDTcxpqfmn/Thf01IxuKNtPJOll+da/WtHufICFViydxibhhi
         4o76nzrHy8WrWDAYM6bexjuiNnCtqNhBDVfn8PUXCkLfrSZ0VqCHFguLxwK+hxJ7VG/e
         +41cQ+rkQEfEOgwAMebf/zaK+VoT0gO9UWqsc35qZ+8H0aI5ztoiaQ8jNh0904+au29Z
         YFYA==
X-Forwarded-Encrypted: i=1; AJvYcCVMsW6bbsnKeQN6I9HZrFfROKWVXKurJo0N2JsnWo/0lsOWjS2MAEgO4mgLoVcBpv9czaCwp93MuMM0ahA=@vger.kernel.org
X-Gm-Message-State: AOJu0YymJ9PPzK2MUd1pfgYxcyeAiBOB2hMBPqOniRHYXZYnwcKzNzcD
	h252DxR2pKigSa0dRR2pW4clNbWBpZXaPG8twuKsZCMcJhPgGDAu8tBQPqJtDXMOpu3F2s5zEAY
	Jvh5Ot/Plh1ind9A8vipvHM96XCP2QoR+CuXsEfUv5uJcPvBtrf2a12h6Nkz1j7A=
X-Gm-Gg: ASbGncuHkw8uOKipoGqkHzNHEuuf9BCjAwTc8T8/j2scwbcrqgaPQaR3gAe+Iu9GpyM
	7c3HRB03nvO89SpSANujFWKbyx5LMEAZn1StwwZF6QztMD6bp3yJ7G+MSS9FVkGKtc6guZuQUaH
	TZZqpJ79LFD+hB308TbvXofBtOGqnX4FsIzw47uuE/QETwt+uWpGgCkhDurj76rmIFghM24ivx5
	6PkCLOx+eM82k1z6i2U0KeCzDgdUtwe2gLiEreeaipfxNAq2I8REchZkYvzkQgYSJV4Hb73Tju6
	+2iyJIe8DjHUeuBt+VDtZHbIv5fhhvdcJPNSDX4ECR3ndkNyyl6U+ygAsyU90mZHhjPH5HGZ3MA
	=
X-Received: by 2002:a05:620a:4152:b0:7c7:bac6:8b7f with SMTP id af79cd13be357-7cae3afd94cmr506218785a.45.1746370282633;
        Sun, 04 May 2025 07:51:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2YEQcg+z4L/QH84IcQi6XWb1BR2SKyeknZAaEyykVIQte4w280JJ17Qto3urIA058pFmO3w==
X-Received: by 2002:a05:620a:4152:b0:7c7:bac6:8b7f with SMTP id af79cd13be357-7cae3afd94cmr506215885a.45.1746370282284;
        Sun, 04 May 2025 07:51:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32029306833sm12338191fa.52.2025.05.04.07.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:51:21 -0700 (PDT)
Date: Sun, 4 May 2025 17:51:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Dang Huynh <danct12@riseup.net>,
        Alexey Minnekhanov <alexey.min@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm660-lavender: Add missing USB
 phy supply
Message-ID: <jujiy7ij63lahrx2opj6kbotglsgbqjqrlcvwlnl2aprj5lbzp@p2tpx7uib6jf>
References: <20250504115120.1432282-1-alexeymin@postmarketos.org>
 <20250504115120.1432282-3-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250504115120.1432282-3-alexeymin@postmarketos.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDEzOCBTYWx0ZWRfXwoX8fHTZwGpX
 EJJj7n3jC/8Kh25cNCoctOOwYl9mjmXsEDM4NhDSdLkRLjmjYKEVbf52Uewpaz70nq5de34QL6j
 hb3JlD/6sRQ0y3E3+HYj5uM5jLfv8biiIex70HCKrsPuJ0KUmT6nBu2o/+9nWKhPjmPcHGcg99m
 /xAM+jZ3UHSyrmAIckoVJqRUg4pWXodv5xLpsrO6mPXmLOi6RrUCd1T/oiXsSgO3VBU8WlkgAdb
 StSfwgIxnTi560LPFQKoH0Jl/e7vHsB6HtH8Vdt1bKnR2RfX6iXMrjcdUkiCAj0HEB9HZOuXI1o
 zY7aaxSl9hXS5/+Fs3ZqdRuWmHMeCwoA222aawFIJJzs+thfj47pXCMrnkmcO8XhUXT0PoiNvdn
 rLa0djDWU24UFvuBp2K0SnxUZzPf8HOBAdqv3CHlY34x/B7/nnkG5aSI4LNIapFSHjOtRTFw
X-Proofpoint-GUID: oUnuDwMv8e7iIoYA04xAQuDEBLasP0gh
X-Authority-Analysis: v=2.4 cv=LpeSymdc c=1 sm=1 tr=0 ts=68177eec cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=uluJzZTdjp9Xle8A0wcA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: oUnuDwMv8e7iIoYA04xAQuDEBLasP0gh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=632 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040138

On Sun, May 04, 2025 at 02:51:19PM +0300, Alexey Minnekhanov wrote:
> Fixes the following dtbs check error:
> 
>  phy@c012000: 'vdda-pll-supply' is a required property
> 
> Fixes: e5d3e752b050e ("arm64: dts: qcom: sdm660-xiaomi-lavender: Add USB")
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
