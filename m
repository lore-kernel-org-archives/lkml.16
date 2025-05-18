Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C702066F7
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 22:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747608481; cv=none; b=ntwz6e53l6t3B+9Z8mBMP8WGZkk5uYlLimViJSqDPsceGRgEA77YxCaRlqO4za4JY3Dtm1j/IxYvdPQg6dpAz9UbZVqrPNsNfBYaZcHuA5elJo1c2a9dIeUxL33pxBZl/SuLBlD+W1kcZldv5Gvqk5N1KaFDDtuosno2w9Fbgvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747608481; c=relaxed/simple;
	bh=EQZRvDoYbyCh8DGSYdm5CNwcqtzg8Cq6+npMxPhenyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/m1nw4eRO7SuQ5c19y8F7xWU+ChyvA3yDGPV6IAhyZ9mmtN8gkn4xfyJU/enSBm2JS2pOgPAjjR/k0T05GAGv3mMYEu6LVRVtb0t4HoycdPLmNIFcAdhvmT6KMZd4qz3QHtA/BW+8GMA9HeeXBGQJlKK7s5QG88/1Xve3yclaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ykbak0r1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ykbak0r1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IMbthZ028784
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 22:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vc3WSizhU9aSF7EbNasyVlOQ
	hot/U+WGrlUH3vMwD9s=; b=Ykbak0r1yjLI/irIIR2MXUgQ7UAgqZAIlyjljHMv
	DTJwaJYjWkYdB7Y0Ptpd4FG9fEtoG4qIHJLeY4ocNKLIhUlp+WJn/uoQ/nR0oVyv
	eUUmzod8lsQJtCmFii8kuBELuLbXGkml2qFI2tZMD7ki+9COdu/OxJWYxUtGE6LM
	YtdanqKqidGaE/sgLYNMHzCxdpSpFS0rqXGgyqyaO6h0RIyfu9RfWZrVkVt1Kw76
	ElqDII9P/ASiQa+J0pEaZW6Rr5egWUeq4d/q2LpBD+/nzB47UqkKV1OiD0eKMtcw
	UQmQGH7txNO+57mLJhM2zHIh8/DT/LzHSRvAYulx05IBVw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkmmafbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 22:47:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6eeb5e86c5fso39840526d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 15:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747608478; x=1748213278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vc3WSizhU9aSF7EbNasyVlOQhot/U+WGrlUH3vMwD9s=;
        b=ALkVxWFkeOFSlUOBbXcfWMEvgguQOy1TH713Sz7nhNl7mdtBXWWzleBM4jyBDawHFf
         B1FSPF/GaX4e+PWhtpU2kIXAf+NPXMoLX7ENKrYoiH8//nkBj/oferEnegJt+5pBewVQ
         Eac0GKQZgwlWkmItgAhFOWEpOs6dzqX4K86+Qn2Qh52vqDx+0ZHS4V4NCxxSQsDXeZ8e
         GTyptZdGvFbMvL4h4jcs0vkjFO7JqwStgIKvB3OyvzGk8HENlIZlAhPsJEbbhf4FMnKM
         W55sGi2moS1QS+jYCpueyB/5b2oosuPCMdswwQu/4ZrL4KaA2sPufcZQSmy0h0enTdrE
         SdsA==
X-Forwarded-Encrypted: i=1; AJvYcCXTW9U9E4CnxqL4zf9NM2iHT84jMgZrdyUznvoga16UlzHND3J2JzdYkqUAGKhBj6LhUN7EDjX/BZTqChs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5CkrQbQyVvnZV1f3UgIIbiJBiW/De3PV4lu1lOaI7aozzWg4n
	SazS/BF6z3hJWCRulrFi3fsouPdmS2uf6xjKtVXSNjouRxjWqQJciEI4va6ZD9kneT/V96GV/q8
	9pcOgKiOkhqm0ew26VA8oZRTCZxzkGxFUH6x+HanmWNKHg3wmiaZ1vUzZcLXLRwBjXw4=
X-Gm-Gg: ASbGncsEQ0DHDLmPuTQUL8MpebH//vC7J/J+7yRaUWrvEM/SY92aNoez34R25c3INQ7
	KeFTnZ7hg9A6YO2t/ypbzm4VEQ7wuqqQXezc4I3czXS/LDPnnLlGDJZb8sGBGEu2m3gMWU0g87s
	1W+63gHvjr5ucFmhk8vURFCMBQEdBAr7mpJa7gVDnMlmms0sqLCfp00dN1M2se9FUzTcEgo47Br
	kzVHZnJFtAJJz20xXCS8yyccf3N/rcYD0XCx76led7aUk3/iQlup8d66bJ6aJazB63t8NPjKrWV
	u5QfhgcBnQ3J+V/oQ89cz6IWmxbThSq5qUW3YmABuuim42ULt2Uzfo/ehQNQs2nGmK73sEwEoyc
	=
X-Received: by 2002:a05:6214:2a83:b0:6e4:2f7f:d0bb with SMTP id 6a1803df08f44-6f8b0849362mr157924616d6.4.1747608477706;
        Sun, 18 May 2025 15:47:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7tAYjxfd4r1T1qjru51NTM2HHKxx0e0C/hKdPW1JjgLuLcFbRWRts+BYv+uzd5ciQqDnOkg==
X-Received: by 2002:a05:6214:2a83:b0:6e4:2f7f:d0bb with SMTP id 6a1803df08f44-6f8b0849362mr157924366d6.4.1747608477350;
        Sun, 18 May 2025 15:47:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328086220e4sm16437111fa.111.2025.05.18.15.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 15:47:56 -0700 (PDT)
Date: Mon, 19 May 2025 01:47:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com,
        quic_cang@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH V5 06/11] phy: qcom-qmp-ufs: Rename qmp_ufs_power_off
Message-ID: <hur4ttih7f44obug6e6p7x255yt2wrif6x6maikc3w7llm3ije@tzc3rqswzyrq>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
 <20250515162722.6933-7-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515162722.6933-7-quic_nitirawa@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDIyNiBTYWx0ZWRfX7vQtWgUGgPHN
 +psCjsL7aUdwHH7p35OEypF0fzCkb/nNrpsdTJrKgmcX+4FV3ZBWHvM8LWDFHFLiRAhPv3mS4Sw
 OINM8a01qeffwhF+s83KN5dsIEbqo+TwZ/Pldb+tuAZDPteQHijML5OTEWa1L+pEmRii7+GxSv6
 WdlGM+TIYtj5F0Q47a2C+1c59SOIGmfD5YAWWCvf/G0ts1P8o5T4c059ewblE0q6c6GR6QM1UjA
 7lcs+qmoBYOibRWjc2naUDunfUHg+GMSNlo/p5YLfbCuqwYEbjOgkh4gy0neaZSXtyXxMhXkiRU
 unimX3drfK8Q2ImRGtd3+4FduluS5hWZM9whXb1IL62sz8U/dPLOMR980d9ixjRWwAJqTS6LwXk
 IVfSvish1d/jrjlByLhmH6z3/qPzkP2JjqiOv8pkcIia4euSSQDbZ4pql78ZUS/T1bLaNMd2
X-Proofpoint-ORIG-GUID: WAZ84ZIjgNp7cjqfh9qoUndf-y2Fl52i
X-Authority-Analysis: v=2.4 cv=PpyTbxM3 c=1 sm=1 tr=0 ts=682a639f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=R_7yDYiI5xYpdCZW9wQA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: WAZ84ZIjgNp7cjqfh9qoUndf-y2Fl52i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_11,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=807 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180226

On Thu, May 15, 2025 at 09:57:17PM +0530, Nitin Rawat wrote:
> Rename qmp_ufs_disable to qmp_ufs_power_off to better represent its
> functionality. Additionally, inline qmp_ufs_exit into qmp_ufs_power_off
> function to preserve the functionality of .power_off.
> 
> There is no functional change.
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 19 +------------------
>  1 file changed, 1 insertion(+), 18 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
