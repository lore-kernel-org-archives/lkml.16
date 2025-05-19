Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EAD267B71
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652502; cv=none; b=cjboL78+kYRM/21Ps6XXvv06nADxx+oqCaGD2+E1DIfWN8SV0sJl0wnmZI+zpcSXErl+/zQbMwzI58sU/Qq9mHFHVnEPf7QN/kGUTWjBnBA5xIP4xpXizu5vR0kHhLOJPLTuQ8y4ZI1OiLvhf2CCmfUQr9EXWW97JydzeW9RO6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652502; c=relaxed/simple;
	bh=ZUsw6HDpkokcwzIquJ5+cZ4i6BF4ATZ7/SQJ1RjXOnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u+AOhT2LrNjmR6P/dpxKyTXviRtYmWMqCTo++AF5ThlwWzaO4Aoo6iUG8h1ijx6gtrqW5+VkH0sEqfph9ahi+IQLh6uUp0eOCwu4goO12imO1gojKxGB1kOZVfHzYsBJtIQFujpTeVLp890x59eytWGUeBOYo4UABFxlyrao29A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jVgQlqwo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jVgQlqwo"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J99YXZ009531
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UeyIDj9ITmlg4UbTsleNvBIjtMOcAznKnaaucglFJbg=; b=jVgQlqwo98uDWery
	807Wwz4XzJ56eiN5p0+kE761PJx6+8earbKQt5zkbCNutxgPvS5CrkSNao61fZQM
	0KKw7s+M87jucNoQEdLiHSv2C2J62nur6sqCr9euy2Q21rQUMEJ6TfzOwz6bYbGl
	QhYwuNBRxdCVSGwSamMKHNXOmqaEUeGEhpAx8iWu5QKDjCg7tHJbbharEyyAqIZc
	WwQrMA2ZrcTfNpWrvrFovjPuX3gGBp8tQQLRNZSQ5HD4Y6Zg1BAapiV8+F0PP3cT
	QUQ2B5cm6MGkwPFtyLCd3/cgLMqslo4oeG+D8dWhtZ5wehJBh69iv6Nk8QYagzL7
	T3tpoQ==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkym70x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:01:39 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3db86648a91so24559805ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 04:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652498; x=1748257298;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UeyIDj9ITmlg4UbTsleNvBIjtMOcAznKnaaucglFJbg=;
        b=RDfYwHGbDab2oXmoeEp+FZCENoYgvH2FIbml//snDcX/CEkG+OuUv/XpwcML2msW8P
         BWfkkYC0Apv3sbZgKg3VufYvUrjZ7IE9oRLuONQaG6CbDRHs45pnmUxijnkFs0qedlEK
         IqTwGN07vF1wmt98bM/9gfj51ePkRzE7gioWPYT9jyLLNQfKq8ANILHgZNNeMB/nEeZP
         Q/hhzn1E2WOMi5gsOwrXcDgSjYHRYL10dXcgHiIN0GvAF5v37XBG1c78M5XYsdyiySQI
         +MgEL1v8Vtz/imbP+2dpd6v5x9uKHph9JwzbAi1FF+WH4gb6y7dDi9ZIlJdAsvHmNo85
         k9xg==
X-Forwarded-Encrypted: i=1; AJvYcCXOMaSSib0iFfwt2tIg9tW08hAyYdeH8JYKjLZfxbFR5gQtG1Q77nG9rAH9penVy5GJWf9jVdQdefPsi3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtCWgugETZ3KIiiuVBwV6j6VYf1tuG86dhDHeucjnBE6FeGXZK
	i9Uc2Uo9T4DIi8BetqdWkIK0FCXGne7T4Yo80eNHo/EzQCVnM9rYuHbD8uNd1t9nleAcfdQZD70
	8UnLJ0rwrgDCCXIVyeeIpBjvY6RZgRoD40QQozI47zAWal38LuLWYLhcFG1Ac53n2kdg=
X-Gm-Gg: ASbGnctbUHQJNPNrvT16MdaQqsHLRfJ5HvFQ6xp62Od0AUO0Gxeam72CNwuCagAKlnw
	dRUVQI3XRGWWPbTElQWqBY99AGwW5zirhV5VzSohxO5G2Kt5s6SFPeVpka259a+opLp3xhyZkrZ
	0L6Zo1N/EkhHGq1FHYythbG+HOLwYm3KyiEkA4w4UxI811K+FQJwVm1tjp5X/3TN89jU6GOe0OW
	SA5x+xqFhg3pnStuzMZyA6XeHJA0QlCB9i546bk7vHJuumglcV25Kc9JVAJgJ94yVLQeYxsazG/
	CvirkNGLIsJToISulCy1a9YLaArQh1xnVyRaNYPoDd0BXxhxA/6ek8oQviA6oehwwmzeVnufx0k
	=
X-Received: by 2002:a05:6e02:4503:b0:3dc:635b:6724 with SMTP id e9e14a558f8ab-3dc635b68aamr48847295ab.10.1747652497932;
        Mon, 19 May 2025 04:01:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIo93Ctw8RMLn2/Q9we0cDjAuETBrcair7HSgGdmyDSyuXUvh0S6+dTmbsrmUeaGWzk1JYWA==
X-Received: by 2002:a05:6e02:4503:b0:3dc:635b:6724 with SMTP id e9e14a558f8ab-3dc635b68aamr48846915ab.10.1747652497479;
        Mon, 19 May 2025 04:01:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085b908dsm18641871fa.72.2025.05.19.04.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 04:01:36 -0700 (PDT)
Date: Mon, 19 May 2025 14:01:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: qcs615: add ADSP and CDSP nodes
Message-ID: <6ysyyj7sn2isoddooj5y5evuayplwd7pzayepnij4ioi7hx2o3@43wd4fd4uaha>
References: <20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com>
 <20250516-add_qcs615_remoteproc_support-v3-5-ad12ceeafdd0@quicinc.com>
 <thtk5vv2hpbnoapmt6j7nlgrcyedjzjbi3ntlyb3ll7atks46n@bp4isaoert67>
 <73a689a1-e8a3-4417-b0e6-374ec9b091d5@oss.qualcomm.com>
 <14091125-20f4-405d-8022-f02ac3c311b9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14091125-20f4-405d-8022-f02ac3c311b9@quicinc.com>
X-Proofpoint-GUID: qDNe6wbHu1wwuxf4K9VGv6Le1ZSlb-wf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX6zQWsnqmSjPH
 q9FTSF34dL8JAT2y2ibxHcdMOts75D3hjJEwmO4iF17I5EE3dy59dkwPqN5pOFG50ZVqZkWh1+V
 zdBAHDZ3Nmh02bj2tC1uD4UziAQMlb+sBDE9a8NOzwJQ1u8HfrwJ/sysxL4bPJ8jIKqp3Nj6Qbq
 il6zyRwTLPjqo1bjMjNKvstqhuZBQqVQZwuB+8A9lDA/1UmhQN3KrFkTkyLmlAflWZ1z3YBGeaS
 T3eVcOWFecuzvx+Q5kXOgQRiujgO8Gw08o9Bw5A5OpWntIhq2qUx+iL+xtKqo+XpYZYHp02jz4n
 WzhrtWWKvfeY5DvMtEMth6M2DvC38NMkuA0+/b82tCjiIizJJ0D5DSpdTLngPtdc4mcCUDMR+AI
 AdDpuJ6JcKKodN/N6T0Jq5ZymTYi82y+gXQYx34sJ8Nw+rVvZRDAmc8+7FqNC8X/PPrHliFv
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682b0f93 cx=c_pps
 a=knIvlqb+BQeIC/0qDTJ88A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=UVS_QiJXTVoWLX6X8-wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=8vIIu0IPYQVSORyX1RVL:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: qDNe6wbHu1wwuxf4K9VGv6Le1ZSlb-wf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=946 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104

On Mon, May 19, 2025 at 03:12:39PM +0800, Lijuan Gao wrote:
> 
> 
> 在 5/18/2025 12:59 AM, Konrad Dybcio 写道:
> > On 5/17/25 12:11 AM, Dmitry Baryshkov wrote:
> > > On Fri, May 16, 2025 at 11:27:06AM +0800, Lijuan Gao wrote:
> > > > Add nodes for remoteprocs: ADSP and CDSP for QCS615 SoC to enable proper
> > > > remoteproc functionality.
> > > > 
> > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> > > > ---
> > > >   arch/arm64/boot/dts/qcom/qcs615.dtsi | 86 ++++++++++++++++++++++++++++++++++++
> > > >   1 file changed, 86 insertions(+)
> > > 
> > > Is the MPSS not present on the QCS615? It was a part of the SM6150
> > > design.
> > 
> > Hmm.. good point..
> > 
> > It's surely not there on QC*S*
> > 
> > it is there on SM6150 though, quite obviously
> > 
> > downstream ref:
> > 
> > https://github.com/ianmacd/gts6lwifi/blob/master/arch/arm64/boot/dts/qcom/sm6150.dtsi
> > 
> > Konrad
> 
> Hi Konrad and Dmitry,
> 
> I have confirmed with the relavant folks, and this variant of the QCS615
> does not support modem.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
