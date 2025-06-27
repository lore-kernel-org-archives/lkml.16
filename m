Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6652BEC3D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751027044; cv=none; b=NZIrIhV3DPRI+j3bHgO1BUwCevT3TSOFOASw/S6sM/0G83vX0WskV5VRuas/LmPxNZJATuxcnH4Rn2V7NVDsFiglzTRfM8jJx2g0OiE0o6ZzpZ9FlIfmUts/AENj23A2XmiimI8koDR9jPuRPmDuvg86X47XNxHKZuEUfyp94JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751027044; c=relaxed/simple;
	bh=uXV4c38ge4kei8/Su56vzTTUphRCp87P4D4dYrJyD9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DZ7Se4vJp5KUGHwclVxdrXbb/J2QGNlRrInwzVoRtH7P2Af180uV165EElarsE0OsX45e39nVzhQqxXdaVNfpPsACUHnarA4JsIn2tEpUdDryMsKz6hOJiD7GpW4sHEAXLd7CuRz2rLi0IismqqX2scyZZ+6lRu4t8zQ6HzD5mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgZk89ET; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgZk89ET"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC82Xo009645
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bnx6gv66AxgLBTUhDkEkIj9uWKneRMRMJeD5Q4kvWmY=; b=UgZk89ETclhOmh89
	bODZDvPo5Ns82vOPLtHg3lhkRjHus/APr0sgQxC8yg14k5xYDTqR1LDczuq/0ENS
	19sDAW68nWf+GZ99/I/QLTS4qQqvhJbZZesHP3uu4YcQwiS6U4SWe9dNhE6stRgz
	NlFLeSu00sPRzOzIB/l7t2XiPTMfRFMQTqRH7OHdNdx9RulQDQ2oMPQRDDeTiOPC
	xlzV2o8jL5rnGFAN2AkPKf7tkn3Sv7dL4VXwmMMaKtJR21fOvpQDITppVUoepbn6
	nt3HPl0PXASvzG/NQwhhkvxoYa4p5zR+ZddugFjHs5dPSpcDdmz3lRYIIcpKMT1F
	tLydyw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b46qgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:24:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a5a9791fa9so7118711cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751027041; x=1751631841;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bnx6gv66AxgLBTUhDkEkIj9uWKneRMRMJeD5Q4kvWmY=;
        b=TcKQX4q+o03fPyCdp3GLBJMyEiCrXr7RqrLEoPKYg/MaxWMVwcWsboyeLlvggC8Ky2
         h/7PRL3SGgtRLHTrCxCu9v2k1ktZfzioQ2MOdOaXG1z8LOJzLbTbuPXSh2UubR5DXMKF
         OA3q3n/aWDDeOBgiw41STROzcNS+ZoJFesX3DRAGC5MqTwb/ifQQscKLYZogB0hZdHUV
         abw9pwZwVq1JiaTQqyqGjbo23sXzkZ3EHcD/CTZmpQcNsnyxi6WwHL8jwJd0Mvkh2Xd0
         4Tb8uN3nDp1iq5+RpJIgQX0TE8IJqUOBh4Fl/5HXkRvhXonfTFD2JaehkcfVjrSWjbKN
         w1fw==
X-Forwarded-Encrypted: i=1; AJvYcCWjTqrS10lhV4g8PVNHpUqzG0EznzzMsYa9XBe2mmL957eLuaOig53G9p+qlX671Uh3KVlgj78ClDQ40To=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKkmzuyuaE1bf1FLXats0PeUdl6XPH/wF7JrQ3troCLD6JdwmN
	JC7ZwLDwAibv7ljLKTG2MKgJwmCOxwdY7m8pkkkKpIbnk96YVRo9h+lwWMoQrYey6/leigzFYq2
	LWPIbcV7NnT9vsfh7NMhmYzz8+JYuTyIfers/bxQXiW+D2KMyP1lulltvMScIxc1qtLE=
X-Gm-Gg: ASbGncsPzQjsPl4xtLpfIb0c5uEmBQRXMlJA093tdLZTDauE0rfiDw3OMrqU3Ivqbrx
	N1VfD53jlqF4tqBIR0eLfBgR8bbTLVncTjN0I0yS9d0EJLzfmldlgpVPwN7WGO2QQ2b10E9W+Km
	NBwxI18+OvPxVVSp0ZlJd8SqGCSUVeSb51s1NbR1RekmDyHEqP8CwtpYv1LrlWlAn/j8RDkcYBz
	zLuFku8JUJWIRm6bK1YFHcGPnfw5rGO0mQl7KGyrpq5/Qrhym3cyi6JbCgpHMapM9jmL2RLMbvt
	EJIARvb5U3GHHQCH7AKmBrK+T6bzShfDaw+RjfBvFH+/IcES02h2jrtAuhjNXoBGige4sjeRDBd
	1Le4=
X-Received: by 2002:ac8:5d4c:0:b0:4a7:4eed:6764 with SMTP id d75a77b69052e-4a805a7b2f3mr1098311cf.15.1751027040716;
        Fri, 27 Jun 2025 05:24:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCH66K+eZ7+yWjG8u2nzdrIuteoB2hoHigmzqTcWK9g8hs2x5qZkLnX1JOh7Tx1aoKb5mzqw==
X-Received: by 2002:ac8:5d4c:0:b0:4a7:4eed:6764 with SMTP id d75a77b69052e-4a805a7b2f3mr1098021cf.15.1751027040169;
        Fri, 27 Jun 2025 05:24:00 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c831aaa5bsm1394459a12.43.2025.06.27.05.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 05:23:59 -0700 (PDT)
Message-ID: <084ec69f-7b52-468b-8561-de4c1f517a21@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 14:23:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] misc: fastrpc: Refactor domain ID to enforce
 strict mapping
To: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
        amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20250627103319.2883613-1-quic_lxu5@quicinc.com>
 <20250627103319.2883613-4-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627103319.2883613-4-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwMiBTYWx0ZWRfX20MiusphVNg6
 6X+hov25lBH+lFnX84CHsfA+iN80mHuoL/rLOvu/Mdl6Av25KcGFJDJCN3R0aWXDIklPFE8Fm4W
 c5NR0h5cJ9MtwdqFHBwhtW95WUvfA5sWj3+PLXuH635YOROyNhdoV0gUApu5xNKsp5BT0XgMOyR
 tf6DcYvOhuL4h4hngsica39XLqiTyekD1zKtXfI5hQZ6wQpUT3CnmTSUTqaJZlTgGXmr+qUOA/G
 akkMfl7NS4WH9E6Q6SyubOaC8To7tukkb/7vUyLQEFXn5beDw8zJPsOUaeOPNqX/Pc7sUx8yTs0
 K9i/rNclUfcmopld6Ay5BzZUsmXSm4jEjty6Kv+q53vpvXAXrB+qUOuLiIgplVdaRqqlXHPcPhW
 wd4Sm2eBg2xHMuPqisuEE1bXeueNp55JNyHfSxyt67XbjTE+Em5y6rAyhyxiFjc44wiTkTCq
X-Proofpoint-ORIG-GUID: zNZ0jNoEX0l_GLY-RTRwTyw1IflbefrT
X-Proofpoint-GUID: zNZ0jNoEX0l_GLY-RTRwTyw1IflbefrT
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685e8d62 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KOtGWYD313IA7KdcrOcA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270102

On 6/27/25 12:33 PM, Ling Xu wrote:
> Currently, domain ids are added for each instance, which is not a scalable.

's/ a//g'

[...]

> -		/* Unsigned PD offloading is only supported on CDSP and CDSP1 */
> +		/* Unsigned PD offloading is only supported on CDSP*/

missing space before comment end

[...]

> index f33d914d8f46..b890f8042e86 100644
> --- a/include/uapi/misc/fastrpc.h
> +++ b/include/uapi/misc/fastrpc.h
> @@ -18,6 +18,13 @@
>  #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
>  #define FASTRPC_IOCTL_GET_DSP_INFO	_IOWR('R', 13, struct fastrpc_ioctl_capability)
>  
> +#define ADSP_DOMAIN_ID (0)
> +#define MDSP_DOMAIN_ID (1)
> +#define SDSP_DOMAIN_ID (2)
> +#define CDSP_DOMAIN_ID (3)

No need to include parentheses, as you're not interacting with any
variables

> +#define FASTRPC_DOMAIN_MAX    3

#define FASTRPC_DOMAIN_MAX CDSP_DOMAIN_ID?

What I meant in the previous revision is that you can not move
data inside the fastrpc_ioctl_capability struct, but you can
definitely add a comment like:

struct fastrpc_ioctl_capability {
        __u32 domain; /* Retired in v6.whatever, now ignored by the kernel */
        __u32 attribute_id;
        __u32 capability;   /* dsp capability */
        __u32 reserved[4];
};

Konrad
