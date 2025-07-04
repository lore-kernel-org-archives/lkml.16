Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57752D8368
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 16:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751647702; cv=none; b=VSqipCAYHnJ9qQwWCMsBVKf9mhEtZcZAe3P4sC2BF6vthoG7wO8sTzxBPDrPtrTjqNt8itNCHbYHwPUBioYhhbI2aEevvhpAlUNz18YWT9R0OuAtcDz8EiCqEtzAxc3OQaM3P2XGjpqCwwcEQNqrPxNDRzyxjkmeZAKwo5p2Qq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751647702; c=relaxed/simple;
	bh=M+Xmi4lwtsMazAKYGSV8Ut3Pp220PPmHBgKKq2jnaWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brCfSUpYoMrxBFhdZiV020Mtysl4k78YWaYWHe79ja2mXRyRvVlQ8jvRMj19M6hBcz7sVL80AgWeI+XwwJhkT0xZ4wMT8yJinjHZeiTUz3wDthOje3LXY6lGVat0GsND50cjzq3orp819SgfDFMLCpumbrDYTT7yVT6YOk6w5DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W1rkR00m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W1rkR00m"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564AQSpY009995
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 16:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+ZA3Iaf+JIUQxzbRmYR7aqyq
	GxiwIVe/fI7bAKvTQkI=; b=W1rkR00mj7WYF+MQpjqTnCwX1XLrTbgL7qh3MEoW
	1ciMj7rhD1m/eZDUdTWj2TjihPjMO9v+P/8zaF7LF1lyMYTMQ/hiGyzfhKzitpLX
	Q8mUU/RgE54xxZ6nIq7ysv95av+Q/Fh0mutwqOCv5+Ibzfy4qFOh7abCJwtQAapa
	VzPpe56FFqodaVFVlZ69JP98Yc5P++EH1Iz3JQjzoCGmVeeSmpJf63JUptrD45ar
	yG6tDUXMN8hwbRJuE3OPk2D2TzrGln0gvyftY5Ae7ALJCPz86+Ev7fXyhhTIR4AL
	NFy4niiXWZHM/H1ZACLJmcH+9XkqDQDMYva7dtpU/lBcQQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pd6w0yje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 16:48:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3f0958112so153442185a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 09:48:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751647699; x=1752252499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZA3Iaf+JIUQxzbRmYR7aqyqGxiwIVe/fI7bAKvTQkI=;
        b=g6vQdzHGKqnQwKoQUgrvu46ZJvsas/f+emFEseGRCPqdsvQvTLdpvn+I2x9VgWembH
         zJly2MkE/uMSsBgbsp3aKE6Td9vwA75thO+7ePLhPavZiOoOZzvv/eA9ed6mZn9IbAGb
         F+wVm4zE6oi9jlY3can11TfdbQu7sTLZqR7kOYmG3m2UiMwpc13TTXluuQfoeiYXRpOq
         JR4A5csEevVOo288FrjXKwL7OvW1+u5O77BxqDcXaHUhE3KnynnSxVDOXbeLorBEWzSQ
         swTYNTbjTgZ5m0rppd1ToThjrmu/WUTTA6ddB3FetHIIjVIASa42ZyJDEQTMrmIt7+o3
         7G+w==
X-Forwarded-Encrypted: i=1; AJvYcCVRvsR1NAuyvTTgY16O+0T9EEpKG6blz+PbZvSJ+88CPJEM6JsXvp3QHqNvvF8Nk5ytFKJdx/K5bnfDpec=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQsb5QhlEMMcZeuwENHFeEzNwRCInwyA1+0eA/mC2Nazxv7XvG
	nEqyhE0cdmbyMBpMWSLAaiwNi2VbbBy71wZohBDljMyZS3q05eFekYvtjIZP2HnWmk3+bywxgiN
	BzTP0ahrowDRB8rhlm2BLQw7sKkslx1FVahY8xObGvD9HUQHkjWn4WVlmeZ6Y50YOIYRZjUdQnY
	rP8Q==
X-Gm-Gg: ASbGnctR+in91ToNlfZX5YpUvFzcl3nZkXIuZZhLRgp0kEspTUvc/i05zJtHtKbxAKB
	zPEpv3YKHBSVJdYcW8U8oaEyUDz0DlpCOA1fV3MNsM7QP1Xn236T2V/wyfyHbZwGJ2Bs7CfGDhX
	yrhKhpsoIWxDFeRLDIKiSuG2oMrMzJyTIaYcaNwCJuMDh8aqLjzLqDQiajJNMqSkvRf6Gz+asaO
	nMzpjkWComNx5CIOIwFQGGfresciEt+8yehoKaQbPsF+pv9lqO8KntnNKbWGzVlI4JP4LxhM5dB
	zqyJjrp3767VRbZlfZirOEZCbjeOuGld3ie3pQfJgimAOI7Dwbu2+7WHagPc/2l3j7oQZ0Z59Od
	sUnnRbFYI0+e+6/XYKRjBeiWwQRysn5dv+Rg=
X-Received: by 2002:a05:620a:2988:b0:7d2:fc7:9572 with SMTP id af79cd13be357-7d5ddcaec7amr434042785a.57.1751647699289;
        Fri, 04 Jul 2025 09:48:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZV9Tkpiv5v0m5nwKUeJs1ptVFEx2pDtiPHeAB7ZT3kzhlOjIW650b3BM5UPnwmVpnu/SrTQ==
X-Received: by 2002:a05:620a:2988:b0:7d2:fc7:9572 with SMTP id af79cd13be357-7d5ddcaec7amr434039385a.57.1751647698851;
        Fri, 04 Jul 2025 09:48:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c8f24sm292469e87.238.2025.07.04.09.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:48:16 -0700 (PDT)
Date: Fri, 4 Jul 2025 19:48:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: qcs615: Add CPU scaling clock
 node
Message-ID: <2vd5wge5hig2ilcih3gvvmzphm3ptkqfklg4ctsxd2pfqdd7gx@trzoqq2qk2qk>
References: <20250702-qcs615-mm-cpu-dt-v4-v5-0-df24896cbb26@quicinc.com>
 <20250702-qcs615-mm-cpu-dt-v4-v5-3-df24896cbb26@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-qcs615-mm-cpu-dt-v4-v5-3-df24896cbb26@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNyBTYWx0ZWRfX3Xc3yykgAZLP
 Jc/VBKJWwt1B3OfJAhQXOUnZrP7QrLcwCjb8uBFFPArkMnpM++eLcDW2I1NaKdUKQ/px6VuWs+I
 1sxTRXhS9TGISJWzJVXGcs3cZN6UDMLUQS7dDgqI6VvYYcd1cVUZsgDp5TgZqy/hVLr0zIchQli
 DhLT3z6+MbB4lXWJV/g2MMFDBUf6r+ZFZ3YTANNtWbxTKZRXRotVP5hHuZ0fN0Phma/APtEyGXN
 cwzhNoeOt1bkGgQkkNXHvt53xEC6Vys0W9N90X+h4Ua11s6UkgbUAQG4hW0vWzLl+6iPm7kl/WI
 a1DkOP1Suge/XuObhgyIOBLOlN9UtpSNZAPobAzzB22cVA/owh73ECHL5CRDGActzxbuLLxzaRj
 TJ/c+57Oc9XsyIZl2TKoWKYsR5M+Xm4OjrrW907i3mEyvRnwGBHe9bZmm/Y8T5dWc2cQNZts
X-Proofpoint-GUID: 21JSwZk2P8EvLVIur08QvD_AaiiAaeEd
X-Authority-Analysis: v=2.4 cv=UPrdHDfy c=1 sm=1 tr=0 ts=686805d4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=2bv_n5k-JhLVcNsY_rQA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 21JSwZk2P8EvLVIur08QvD_AaiiAaeEd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0
 mlxlogscore=839 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040127

On Wed, Jul 02, 2025 at 02:43:11PM +0530, Taniya Das wrote:
> Add cpufreq-hw node to support CPU frequency scaling.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
