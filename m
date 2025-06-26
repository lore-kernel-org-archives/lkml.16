Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FB72EF9BB
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750965636; cv=none; b=p6dFI9JhmbsYtj/TZHgQHZ1u3GBQF3gfSYN1qFdSrAhLPZjWZOIIjfGyhshjgyU54otBMGHsXLT1htMNkFfjsap/mJWPMsVgTOVXGReru2vhjC+EA9tJWCIZrtPlSNQUKrDWgqnIL+O8oStHp7EcGk6hPZiefMhMRII3fNHNQX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750965636; c=relaxed/simple;
	bh=5r6q7+0wAzu943Z2jyQlPtPeKr7oOGYM95kHKprWAYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aEqwXTRFO/gIkyWHi33hJ5e+gNkOFkV4L1NDIq5bOrkKg4lxp4c9wDqWyhvW5M2vmWBTghqMJww99RI3M6khEdGzzRrjYT7AByQ9KdVbreDKl4iOlozySb67tkgc/yjwtk0erdkyrYYcWuTo0mGP/0BrZGTSj+SauV8yk93Ednw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WRwBVy/B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WRwBVy/B"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QIJIYI029561
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0zOww6azj3OZ8n4+GX4w7Xx36kLdO3U5ZZUI4FQRwdg=; b=WRwBVy/BtSis8QCO
	+/YTVUH4/AFeUJ6+bhVkZHelz1uZGyqE4xdOZPVNtH8jZmnVxa5jGJcxnCWamE+7
	HBd++lNOOkubJ+YLzLbZcMWIdzkPpq7QPqFRvvPJVwh6BYgZrNuM2xle0Z8tun1C
	yvsn+g5n3fjdpFdpQPTHsxFXBNTsVLhq08jQCrcsrpUjc8vFIWlDVP2arWcJZpBK
	pptfx20PTEbhP45gUMvi6QsCL+wT7YrhHLesFWt3+MJpaGZIb54m1Qe4WmD05oRS
	doqv2ikFoLKbJMvDoRnPaxogFK3s/yDNGGZPAZ3ZcdSOMdOtOv/mivXnwLy4Fb6v
	11zcVQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4wpbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:20:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a58580a76eso611621cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 12:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750965632; x=1751570432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0zOww6azj3OZ8n4+GX4w7Xx36kLdO3U5ZZUI4FQRwdg=;
        b=JbXACXEmdRZsWiXHwH2iUqlOK67VgSIPb/pHODqXtiJJqTbJl7GAyz3BIsRpk3CKig
         0S+tZrlBs4g71l2VztJx8w9NY+SHJtU4KfdCLy6koVh+tWNyTGdwisNK7vwmOqMWFQNe
         5qP2rKyZGudpZ9yRzKm+dvDlRuMaZCYqfsoeU+eZvxaOH2Vi4HwFq8TWWwA0NslXT8XD
         SoBspgscNyQqbAgrYb+KqKD3EuCMcGTJK3VveP7YRUWiPBlBFz/fweVFQVJC9V7VlibF
         fbhajrNz2oH6uzBukLUVBY2/nxf8YTwAFidQOPMtXeGyilUhcAMtR3rObXKi/rn6OB5T
         sadw==
X-Forwarded-Encrypted: i=1; AJvYcCVbjnX2guzEdC54TlifuGzkzP2REaqlliOoW2EqaV3Tt35M/tmXT4YYpUV0CqLcyDJzDeE3nmUZFmeFOR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPxDRvtDVWiARV8uLma2GWznBrRH7c9jpjBU0/A8kVhBYQmZDO
	kvv3M281NBXR7s2+Q2ESCb0PrwHvobnMFyELy4lQ+/EK0gYFtuFlybOCGepbzPESjmTIjI/kw2H
	OtB4TSvjReLATPs21PMZmM3EXfN8VsznBYTOQG1lCCg7CK5T9rlGt6cbJdeeKf62QUDQ=
X-Gm-Gg: ASbGnctXQDT3NLU+kr2zztPHm5twvIF+1BM1OfAj+kESYbBB51iPlGHBpNfw3GPUCLG
	Stb4J4sB8Q4M83+jf3e5RSMxA0Va8syTnSTOK9vVUsLptbDaDFoRhGJ0AiT5cEoJyI4ILIQxfoc
	kgHmSWx/S7abaPMoGp7f1mhcoQo0GRFsxJ5X5s5pFf0vNAj+b9Enb00sQBXNxSfUcLPKOrh3vBI
	t6V+IhIiDZvl57ccGoc9PPeI4SnnxzCw7HguwuRKpz+dmqv3nYLDEoR4OjiGNser0wYBjSMBeOv
	QmsuFiDNuwAdD4jv1J7VNtvi2KU2sGiMQQYKk/+zVNWTpp1hNl6SxY6SpNx89Yeow/Kdo462QC/
	PGL8=
X-Received: by 2002:a05:622a:178d:b0:475:820:9f6f with SMTP id d75a77b69052e-4a7fcab375amr4100631cf.9.1750965631707;
        Thu, 26 Jun 2025 12:20:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpEZc+VDoThophGjf8eCV3b76cou4xRyhNwgBBJqRGzQLg/M6WUxJq4j+uB+jHeRoCTB1C6Q==
X-Received: by 2002:a05:622a:178d:b0:475:820:9f6f with SMTP id d75a77b69052e-4a7fcab375amr4100491cf.9.1750965631159;
        Thu, 26 Jun 2025 12:20:31 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae2140d91aasm44338966b.64.2025.06.26.12.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 12:20:30 -0700 (PDT)
Message-ID: <3dd39700-4fa7-44e6-8893-b46c601d772c@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 21:20:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] remoteproc: qcom: pas: Add SM7635 remoteproc support
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-sm7635-remoteprocs-v1-0-730d6b5171ee@fairphone.com>
 <20250625-sm7635-remoteprocs-v1-3-730d6b5171ee@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-remoteprocs-v1-3-730d6b5171ee@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685d9d81 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=qm_u-Z9MdHEKZBNG23gA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: SXN9sZ2o3WehAf5r94_6K1Y7J2qRWZsn
X-Proofpoint-ORIG-GUID: SXN9sZ2o3WehAf5r94_6K1Y7J2qRWZsn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE2NSBTYWx0ZWRfX2YRRI/pRQKln
 NuNwfCjeJqgExbX7yhgKfcEE50FwLtFRTUHaddZ9bCfhfjNdqbQ0/J3vCZFyQBxZpwf8Xb/9t2D
 xiGt3f9JGcpy1Nldu+oR99ktJ54xM0Xld6zIs/flUAdU2N+txttMhmEGX6miFiiPhtFWvH6e9wj
 74PdXaudM4YeHRWtzOOrIFFxNX+KMy4YUe3HXPCT1M4oGxmSY95TDLOw7sSqOZXZEcTNGnkbmxz
 d8USz/pIedhJA6xbQXwuDPWTPevodzP+x1OSlVMz/Keziw2pOEm8CqD7/lvxuSFqZ0BuyuUCkg9
 4d0dfx5fZmHxwoOj4fpcwW9QwQEi071TYLuIKkKD2n1Y1o5uIEpS/oXfoQ6nUicR0FUSLqaC/L+
 WjLmRuKYwsyuJRWIq4HzGJrjmMHx74rHwb82RiWOWOyDjAxuUcLOfCkEWtnbThjK+fr5SUfD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260165

On 6/25/25 11:15 AM, Luca Weiss wrote:
> Add the different remoteprocs found on SM7635: ADSP, CDSP, MPSS and
> WPSS.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index b306f223127c452f8f2d85aa0fc98db2d684feae..6aae61dea8d0dbb9cf3ce84b9dbebb77b5aa1d52 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1261,6 +1261,26 @@ static const struct adsp_data sdx55_mpss_resource = {
>  	.ssctl_id = 0x22,
>  };
>  
> +static const struct adsp_data sm7635_cdsp_resource = {
> +	.crash_reason_smem = 601,
> +	.firmware_name = "cdsp.mdt",
> +	.dtb_firmware_name = "cdsp_dtb.mdt",

I wonder why we're not putting MBNs in here..

Konrad
