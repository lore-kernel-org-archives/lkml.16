Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8871F8ADD
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602496; cv=none; b=UE325vX97PjFtwAHNTm1iq7UeN+UffazVWwruBYQsHoNiXaT6Ebq5DgtxJLi+UN7c1DXS3d1L62k2OS2J15ngDacjXWVcmJgSdpf8awuVhN6MqqTTVX6bjee7f9EyCyem/TfQMZf97NFzJvJLEsMS2mXBkHKIpTWZaQ5Km+Bm7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602496; c=relaxed/simple;
	bh=TFEdMlNIoiQqELt0JCQQPUgIJevHQRS2Vk04AlYrV3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXUygdDLEZLy2XFVQMl7El2bX+AXSUklJ5tHj1UqlS7vwxi5BN1WdXs7UcVeBg15yzkH8mhMH6/IKqH9cEM0k4rStqvvMtTmmJJy4CwDlNW8erTTHyNUQ+Ed/dxpwFG4bgHNmmKVmKC/P25dCXFaj1uyDvqfA5fLrKWirZQlhOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LHUmUr9p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LHUmUr9p"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJrAG004016
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hLwVTepjDVXejNa1tCFYvYXy
	WyUbn6X2cQd++bAXZOs=; b=LHUmUr9pfAs/bqL9pLDuq57EncJrCRHzEseO84Vv
	a82s0WHx+SIy46WdNQzPmXrvMIPqcdblp12K0z8Pb2bcrMtZ9DqCkfHXuF7aLcFQ
	6AfTX03NYW8uuSMwl8HWjXuVC0tnA/eyNCMkfvceMoyZzghC2Z9kM7a9Jj5rj2Rb
	DR37x2o/XA8f6VWmdk3sDKRcIAr3tvQ5CsV6Md7fWocjhJfezioc06GDCJSyWgbM
	NJ9nuId6HQJ9st/GuJSm2hOfFyzNZShys5xW/UmGrlJFYEUGmd2BNz/9rR1irQYK
	BRI/1aB6NC+XG1Qv5rcj9ChoCo9+tYVnGpoMbcUxbsJOAQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh29wry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:34:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6eb2480028cso42097526d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602493; x=1746207293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLwVTepjDVXejNa1tCFYvYXyWyUbn6X2cQd++bAXZOs=;
        b=jrNDc9zAKC8KSPPCf53X/wvm3KYAcpVJ94LRAGiRCrdgNXtYZvZqXatgCtHMVIBuh7
         5wUVHqcw5EMZ8TdeymNgi1/skNFm3FiDCZabKDda8cWnNP82mD05qjUl1izmZlTPloim
         +86jwJvrbEutUxxzxPYCLks9YQxlstuOpR4VIdqX40n5whTK8nNFQM0/Jt44IhItqZUb
         f7d0SwqWbSQ1ZyPtNCjEtvk51trSsIPQvggT47WVQ/2dnINlFtO96NHqTjy1BGAWeAjz
         gtFHeo919oObxKVsz2nqdA63Ww3k3zmTRArDBy9faJVX1bSz7mpogM8aGIw6ZA5KgMjB
         YJ1w==
X-Forwarded-Encrypted: i=1; AJvYcCVgja+Bxvf1fGxJQ8uZOIEThzsgJzij6beixZW/xZoGBaLN33fMtgnoLkZtlfIwGAVCMHVYHrImghnCWIE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAkMzR0g3lCwenjHIaDlIU2wOei5St52KsVjMjUn83C+Ac+mk+
	aSkSlwYbls1J8aoKWTp/kgMI5aSTMQ6WkxZP2m8YWQxEkvLsgHi4ErGqZzgjgblFCuKzDKIJzdH
	tV9WodJrJaMLpSikW22+LZTH0z1JPwTTobg0UtI6U4ZwukSMQP6e5w6ol9Y6ayqA=
X-Gm-Gg: ASbGncv50VOctVFEdbdFBAZLqSRmF10w2Vg0bSha26krHAUp13nqnm5S1GlDbRpURXt
	2F+MvmB7F32bdSC1fEXKkIDDSOc2uKpar/y0XpxyHa7tmdOQ3XIvKhd1uvh2oc9hcYMoiL54Mc3
	l+4pjoexsFw44ESIwtloaQqx4ovlNjO/Oz5QnDMB3N0yqbTrF39k3jWhFGvr+WkbtpoLMJWTNfj
	SLEslZt80w+8ENsgNbmQK5wJIq4WBioAD2/yPqc+dukJ4kRV8x3wmahnMEs41BXKEjmcJ1TbEkc
	It1gjgGj2JAbnlAWvldeZKE3nlDWLlUJse6pEY06c0YhNVqV/HxFmctKu803QV75mHoU0/dn2dU
	=
X-Received: by 2002:ad4:5c66:0:b0:6e4:2872:45f5 with SMTP id 6a1803df08f44-6f4d1f16818mr4509186d6.25.1745602492720;
        Fri, 25 Apr 2025 10:34:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0SyVjc0RwTNTmuwQe3VVznnrOs1x0zqUz05amuo9krdS8Yw9U8i0uKqP+X/0Qq0cUkmLviQ==
X-Received: by 2002:ad4:5c66:0:b0:6e4:2872:45f5 with SMTP id 6a1803df08f44-6f4d1f16818mr4508916d6.25.1745602492411;
        Fri, 25 Apr 2025 10:34:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d0019d59sm8153871fa.64.2025.04.25.10.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:34:51 -0700 (PDT)
Date: Fri, 25 Apr 2025 20:34:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/11] arm64: dts: qcom: msm8916-modem-qdsp6: Use q6asm
 defines for reg
Message-ID: <kwvouq7elpyzktrwqdzjg7omzzn76ocxtauhlmpwgv6i2ca6wv@gpjksblyphm3>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-2-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-2-28308e2ce7d4@fairphone.com>
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680bc7be cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: NDitk-EGvakdRx_brOU4QAjUgDhaeOFs
X-Proofpoint-ORIG-GUID: NDitk-EGvakdRx_brOU4QAjUgDhaeOFs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNCBTYWx0ZWRfXzLE0uYtlc/EO lwWUi1w6eX1zqx0bOGi2Hj5/HuJfay/AjxcWcwqwQajd7Q12bTtko23+TP+nB4JvmSpaQ+7dswI cgc8G8O5Cx/P2QSqI/pFzLdW7SJWAWxhlxY+NEqaLZqY7QsvzbxKOSe4kaUU5lm70YfOV4d2NCt
 lRuGxiZYKQi0eV7fgFvEzxK5g//3ZtFoKFfLNxKoJun+vm5frLB2G801h/hVGl4gFMQjXd1u4IK bWlgrhPv2Z4aqpBEoydLW4BOHCvPp4kIPIAdRBmxDBsI8gSBEQ6tIZYMvvKT1nogRS22yMEt1nl DRZJxkow2Lh8JQ2ECwN+3Ud10E96J8BtQNRr0hBkjUmyLwxy5lS4OzAH2HE6C9oSuU/n2qUv7wf
 o4v5ETaiipfH4y97/JpIdZ4Li2hPyCNyPt5Mi9PGvDV8VVeNhNV4aHqqQGq9Ckpxm+OlCcFh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=686
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250124

On Fri, Apr 25, 2025 at 01:53:41PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8916-modem-qdsp6.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
