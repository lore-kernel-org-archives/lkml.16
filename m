Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8442A1D8
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748376024; cv=none; b=RiN3VGvoWYuK1MvYBNjAlfs1w35usIp/f3ADJINaufFTCYIdy/hcUhHRR8k4V+rp5kSq4SaPTW11nOFRJEsDAPZWpqpHvRZzSrEvgTe94vm/po+YYT7KlW6PXgnWCrcMdfleDKix/43miWN4NDKMrefGjzjrN0VPvuaXfU8lTXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748376024; c=relaxed/simple;
	bh=r+r3Ev0TVh+OQFJHNFQ5imeQ6CgXND4LddHcuerf/BY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZjgmRZyi3ctgbh00L3h4kUEzI6wmc2rCjxcTRp3KYTK5bjQRL3TVNNAXcjMqAh9O5ft5a7o4BAzYY9itu7v9nLN8BNPonnw/H9hVGxGURskbq4ffiH9jXEISh2J1bwhoqk4+eeuX5mlaN0qNg08EhMl/Q6MzlQ9WcNLTEMbEhIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XPtrrEcz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XPtrrEcz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RHTbdg028914
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/hQzHID9K/GQqrpL0xslyVn1
	e1R+sKoEQ9p0RvNHIao=; b=XPtrrEczWNZc+3TmBNXkgqvIqvOKxVnS/0AQ3ZPH
	XMgJRg1r34Z6DBtpxSM9Pz1pG8iLX9lNwPBHxK4BOfgh1Pb1w04JKx0oLQdwEotc
	kWD7sGtWnQ1WkudY7SeN9WsXHG9XOQau2SYv4yL3b9HSIH5lU+x/pOgoYO8VFent
	LVcZBxFQSwsNOPZnhr5TgDDl6ZEVW04G0EwWKG6ZPA8NsAW8ISOSUpOv+hdoqH41
	hj6HH2g91BTQbljwJRK5mze89cqjsvsfHmheoztx/+CzAYhwzob+23tRw3v8AkUB
	4cQiSf02XRlz3osHdJFit17gkaqfMeAOCFIWFOeW0bJUbw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whuf0eca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:00:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54e7922a1so804737485a.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748376020; x=1748980820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hQzHID9K/GQqrpL0xslyVn1e1R+sKoEQ9p0RvNHIao=;
        b=TOqUOxh/Wl4vGObflNqNvBQmXDSJ5Wpivguq30FvezIlcd0BPORrjJiJYr79U0BF5K
         5uy9zMEi7V23Th084XbJ1woyLp5CUHEuAoBmUywzP4mStOSuRl0f6BmRSJ3+MsVp0v7I
         2eg709iYO5h4arJ7zMFimirg87JnXRlIkv3U8frRN3itTK0RycWrawvdGEbRfnW8jnAS
         L85/vyv7uT0KY/QaQS03XyoCwecvq1Dwa1fW+ZVO1NNjXZaqbtIJROu/IOrdo9x/fclv
         yA9vV4XyNqDB674eW3ERHDNZcVkKojtF870cBz0luRseCm+l3+k8iUZwdZpjRkyhN3tg
         wbHw==
X-Forwarded-Encrypted: i=1; AJvYcCXHu/Kp5ZzJs2tiPmD83PXvIg5M72raDtNlG+T8C9lSaZATUBN3owZDPgZDAhUCOlB/NxlPFbRoYfPqxCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVUIyoz4UdFgQJIqB7YNN8iUpxBchuZRv8KiNXsR1vQeat0+mA
	OjQitPL0FNvOHBPgJUsRuPjUMw2XIJ8UWCUd4yG9xpQ+U6wZUvXp4WcF6lcOK1yXfFswYixaxg+
	T9vfIMUofLylcJOxCmCVGAJETi5vV8E9I8cboOA7fYXevSl0NhTK32VoBePOT7y+zoGc=
X-Gm-Gg: ASbGnctOFGJ9PmXdElrKrzO9Vtg5729/KvF3YJSxmmUi1BtsIPMzXc8ZbG8/HikNthz
	Edl1E5POYl7AK+WBDy5+NErwiuXrAiXHBZusw25aDrAccWqvC4GKT+BQUxtvNc9BTP6XCEHCM5E
	zctXxVwX3xuvAA3w66e/SPPg2s/6UcRyCAnu+zellsX0p3gA1ohw/MMyjiPEQXhYYDy+ddElG7b
	6ImwotaGnkI2l2Aa9rGhw4HPI1t/Le6FV8caCPT4oRcXkrf15gtODcGdbp/T5byJRXbyXXW7Q8h
	/RtIouFRdj5nD1Og+xB20uA7Dy1auBnGqi0C563OceklcsB08k2B+pAanH9GnhvfmAMoQaQWIDI
	=
X-Received: by 2002:a05:6214:764:b0:6e4:2dcb:33c8 with SMTP id 6a1803df08f44-6fa9d287827mr222638206d6.29.1748376018699;
        Tue, 27 May 2025 13:00:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIadGV3qXoRtlRWm4E/ppziPIKI08C68tushmJjy66kSMJ7emHgGlulrNCKBk7DuSuJ0hw0g==
X-Received: by 2002:a05:6214:764:b0:6e4:2dcb:33c8 with SMTP id 6a1803df08f44-6fa9d287827mr222635146d6.29.1748376016581;
        Tue, 27 May 2025 13:00:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532ee57cacsm5746e87.120.2025.05.27.13.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 13:00:15 -0700 (PDT)
Date: Tue, 27 May 2025 23:00:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Add interconnect to primary
 USB3 controller
Message-ID: <sgm2ya5h3dp2rnsowhjxzmdby4qxljnxq3eyalo4fieorkfnh2@u6ili3stvwjn>
References: <20250527-topic-x1e_usb_icc-v1-1-43b604cb0609@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-topic-x1e_usb_icc-v1-1-43b604cb0609@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=683619d5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=vqQ__KNFWrN3ZOIeZgIA:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: L43SrUNblESRfqfDtQ6U_xL2-93xtYJU
X-Proofpoint-GUID: L43SrUNblESRfqfDtQ6U_xL2-93xtYJU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE2OCBTYWx0ZWRfX6b1pxVYC6l/e
 NePMo7HZ+l0i8PUspNnJcmOfygF5EdbRtzzo3nxsjYIOkPs4lfnUPef/tFpr7nNfsbonUA0iOcn
 WmDns9E8oWJxRBLyE5+DfpbRMMbuZpCRPeiGfISX+8lH3+M+Wfzvg4QKDQQSXCxr2z7TdNBaPRa
 bLhdThuPymiRd1CS3jelzioBpMiNmdH2SGBt0H1hPPJcuS1lfW+pVmgivel34ANzuiePVOQz+HQ
 s8vczAxdC0G8gEo7Y9A8ky1OgupjXGGam42jIAmeNDcMoSIgi6RUMk2j5Q8sIz6QdUQ/26gDJkr
 9gO9FKLLddJpHSLngiBPVrU848Je0JWC+prDj/34uz06uiP2TgH+vvnTpLAqU+NuxMukeKAjEdI
 94s8Lf0Y4ih3mj9QqLvHNdeBFHHBSFNjBMj7NcXfVZdq4UJDrujd50XIVpJq+IE8lbecJgaG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_09,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=728 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270168

On Tue, May 27, 2025 at 09:26:17PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This seems to have been omitted during the initial bringup.
> 
> Fixes: 4af46b7bd66f ("arm64: dts: qcom: x1e80100: Add USB nodes")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
