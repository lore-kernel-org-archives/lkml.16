Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839821E98E3
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082780; cv=none; b=S0CdM/H1saskao595hPnxCeAYeM4n2C9Sad7EyeuNeORrYFeaeB9Qu58B+zlPCingOgfcmBVXTG5TkXNadWFdrTD4sC9yGGgdBM5V5FHM4P5RCQzoRYOMpdD6Ypv+6Mo3Z+2X3Tdg9ShP0+5KboME1qoqzCD8Ca4hquBle28aAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082780; c=relaxed/simple;
	bh=xLc9ItWh5tpODOaZ69PPZ9EYd++GnaUzUK7aTCACc2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7hVScXaBAycNGLJl27TMI5Fg3pyKo+fCpTWyMKVRCpTxJ/XRv4Z5YM+x4KPdGyq1FE8ZcgncX5QJRqnZfdc25kOxS32Pej24fOzzxfpkT3jHTeYjtaSUGnmpIRxFcA0wPvumuFv4YDdRp2L7LAbGBtc9rtz+QfZDbcCLzLIWXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lI40D6PB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lI40D6PB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8SCBj010944
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vh4hjv26x4W/Itf7e2ntHRGf
	CMDWqmAVMqTQ3fn4agY=; b=lI40D6PBuR/dA9dRvhU0KaCtNGb5cKaTtRJsWh/u
	QOCUul2h2ihPSphz1uWTsDL4tP/hP6vSOlhllZyo1WIeOgTTxm7N3P5yEaEjarJv
	//Ja0t10utkJQj5u1/YGdT7WT/g2KhDK/+MLs7Gx+t+mXO0JPpJHYM0aphm6hsDt
	8nPkuGUI25pOBgeVAkXOmie7PU6ZcBt7hx0acp6XQVtbbjvpuKV8Ggbz7pFqcu1N
	9l0zAzVw8sZxEsr/9sN1WeIE2RFlbbF45TwYxufz5Dir+jmg1B+jWbqSJcvKX5VP
	MMfsyqPdAYPsKxaldL7l5AvEMqD/QBvkpqtMb0OzWUEWTA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp5kbft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:06:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d399070cecso962915885a.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082774; x=1750687574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vh4hjv26x4W/Itf7e2ntHRGfCMDWqmAVMqTQ3fn4agY=;
        b=WgV86sMt8+8T0XYQUMasS5Jj0tlSKT/ydTk9Vy8JQplDQBzsDWJtCBLFOuLt9XmfFD
         sS7OcLcZs2xmI2QXytz2o9zhAtA7eLZgYU7huAtnMixCRSkHDxceMmGHmSCVLdiEuBIj
         MxtJ75MDKL07f4R5tEt0KTCgg66HrvNDyrjrBX/PMs/5w4Bdp5ymuTrYmyrJP2PACtwr
         Ml96VITNBOpHMkXzeempOMhWTeOCTJJIHc7akKtcPG4LZDxNc9LYyqEaqpoSMvektsCR
         GUNXcUMH+VSU1yo4QcDw1EuWvbZkMVdAIsFuhffo1uOiez4ZA28E7jScY5dUY8GU6i6f
         5yCw==
X-Forwarded-Encrypted: i=1; AJvYcCWqrNsGGFjwDqHUDe8qhlNALA5yynZa1bmCpZNZASk9H+iKSepRnsyFH6oF5P2GPOhEEgOb7rOnwDDZxXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsFPqcUoSll+cO8MfzEcDT7DFwqvU1QcDzywP0M8CXaDIRIPQ5
	URqc2CR9gzn22kPDYAKMmiwnTafQ2IlgUYgeOD3tCbPYaLG0M4ZmECMCn6rTL0oz+dOCCqN873T
	X7539GA91MlDJsD7e/sqSzs6qnROwubGWq59CFjsZSe/YWuhHdWxyY1xSZQ879up6/Ak=
X-Gm-Gg: ASbGncsnAXARBLdbH0qYUxj9hQp87XnXUztgtLP+qgvH8IW1yLHA3H/n8GCnQygNcz7
	03dzyxYT5LKpaFAGghL8YKKIlxvBTSrV0J42k1EeEjqjwle4MsFxIfD+ahira66PcnGTkgGL8Z/
	xb5Ysj7f0D221iNLkD4H1l3X99fxkocWDOuuLZT0pAluOAkthjWeEeXMzLkpZbqLv2h3jByWBc0
	7sl9czpNG3P7lqobnqCaFZXKSjek00f53HgTvc/cEWqsXjtp85x0BTy41nChbzVKVYJ8oPhLEqe
	NMeXIgt0p/nb6rWF18HEOkx5cukFxjdk+e0K8WLAWRp9mGGf7qHWd7DlX0Cx+Xc5lWD5XWQm4HR
	x/TGDWJCunjJN1aTwy6bjmQGRZ8lIN/z13vA=
X-Received: by 2002:a05:620a:1a0c:b0:7d3:b8d7:a9a3 with SMTP id af79cd13be357-7d3c6cd8471mr1278004085a.29.1750082774028;
        Mon, 16 Jun 2025 07:06:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErsy0AzGP7wZvoQHWt0vDtH88N24PAi2+rnq1/4b7VJfb7Qwiz2c7LeWxv+Fli4AzjyHe3og==
X-Received: by 2002:a05:620a:1a0c:b0:7d3:b8d7:a9a3 with SMTP id af79cd13be357-7d3c6cd8471mr1278000885a.29.1750082773641;
        Mon, 16 Jun 2025 07:06:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac135d8bsm1570805e87.70.2025.06.16.07.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:06:12 -0700 (PDT)
Date: Mon, 16 Jun 2025 17:06:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Doug Anderson <dianders@chromium.org>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] soc: qcom: mdt_loader: Ensure we don't read past
 the ELF header
Message-ID: <5u4vb4wjqvc7zlcwtyeixfhb6qnx5vppgnscvt3ypft5olcnig@rmbscleivq3u>
References: <20250610-mdt-loader-validation-and-fixes-v2-0-f7073e9ab899@oss.qualcomm.com>
 <20250610-mdt-loader-validation-and-fixes-v2-1-f7073e9ab899@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-mdt-loader-validation-and-fixes-v2-1-f7073e9ab899@oss.qualcomm.com>
X-Proofpoint-GUID: uYk2mVRA-mCJ70lYf8HXyom3k76pg89l
X-Proofpoint-ORIG-GUID: uYk2mVRA-mCJ70lYf8HXyom3k76pg89l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA4OSBTYWx0ZWRfX+gYcHv/ZuAl9
 wawYulk4VgxEe05SsGmGfJUhnprvLKpTYeILeQ5YWyA3D29fJk7v2fKdUAus71ABZq2hfmZYau7
 xKHzlAhkAhUCRG7ve7Xu3yR8mITFBmEeFMKWG08gx69URtwS++9ukdMTQaOnAMxn6T6wTPok5jA
 C6hOylz6dC47s5n5lmi+9apAMtlloDi1ObYWpxKdjEgiYHfWZcmkrVRvUxBQQEQBVDqZsfqPMh6
 aE8Pb3Admo/H52EfXJBZfPgDiWRSNpyv1ecqZ5oHiIDwSC1POofvey/jkjijTSmnsxNUq+RFjHs
 AZH6SMC++1dXZOf9zw6o3VG8qsPYABmCuOUaaM1IaT2fC+NtyGH9+QYzH0ialJr0RDXgoiF3gXw
 SCUu6lTt4FXi7LsIrqVvQw5eZzKuJCs8TgTe001sA/HEfw+Xz29z+3flIWrpqF7sJ9LSl7eP
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=685024d7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8
 a=_mC99nTGYcsxCmVRH_sA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160089

On Tue, Jun 10, 2025 at 09:58:28PM -0500, Bjorn Andersson wrote:
> When the MDT loader is used in remoteproc, the ELF header is sanitized
> beforehand, but that's not necessary the case for other clients.
> 
> Validate the size of the firmware buffer to ensure that we don't read
> past the end as we iterate over the header. e_phentsize and e_shentsize
> are validated as well, to ensure that the assumptions about step size in
> the traversal are valid.
> 
> Fixes: 2aad40d911ee ("remoteproc: Move qcom_mdt_loader into drivers/soc/qcom")
> Cc: <stable@vger.kernel.org>
> Reported-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/mdt_loader.c | 43 +++++++++++++++++++++++++++++++++++++++++++

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Nit: in theory we don't need to validate section headers since we don't
use them in the loader. However it's better be safe than sorry.

>  1 file changed, 43 insertions(+)
> 

-- 
With best wishes
Dmitry
