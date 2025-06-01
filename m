Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634252DCC0D
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 07:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748763642; cv=none; b=qXdsiZxhzBEryhv9OV+U2+/Rc9/tfIL1ZD0oBkDneVwa1piIJrUGD3JKPJFwA5gTLsQOthk1YoEFX8O0FKgat0iE6wFqk++G7LaeSHjf/HNuz0kj4EbRk0u4yMWwigplHm5GDsgFp18BrocGou6weT1BkcsXory1bFE0wYB6yBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748763642; c=relaxed/simple;
	bh=c2Kd/vHDZi6zUJp8VpV+4TfsPz8Ez6EjXDsGFv3p3AI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uxVjGUxdkuT4hl5cur1YA9g66DIJaGYoFGc69qSKcK7OkqScWa9EOIbaRRhFLiVwEvst+X8lYC48ySoSbH9SzoXUfIXeW5uYuxeUYrSozmsaPQLHUyKINWJAbQh5CuqqpXxXnK/py0V4BsWq04oGLrpUBjijXrYQwVp3SjhcfWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=STgqg+Ir; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="STgqg+Ir"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5515cNiX020688
	for <linux-kernel@vger.kernel.org>; Sun, 1 Jun 2025 07:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2TPRUsm8psQRqZTnF9CJckvC
	EpIYayXZFgazKyBaVgk=; b=STgqg+IrBbkWSSAdkjpXAjHjChm677m62XsDH12/
	0mHjQLKludmBDPmJl8Dg7n9Nf2QbFaxNFh3zVf429pM9Il3/JJffDp3L6FPIrDQc
	2Pglnrdf8aQCciRIijL9SoDoBlWEH8lBBe1ha4ZvV/dkFwVHcALD4+SJiTRcXzwu
	QyY2qF6u1EcRpCdOMGxy7iyDbIIgdyjTIZDtu5gsnSxZ5EUHamZmeRnqsDPnpOQs
	fD3iS78F9ddX1BI0r7FWB9IffDqblZdHm8Pl1c14Xidf2FXyoC9TV7nwSM/F/CiE
	B09hJvEqamsap6PlyP7IZoCuALkOo64cGooyt9LmizVUnw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytkwa25q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 07:40:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c92425a8b1so379151185a.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 00:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748763639; x=1749368439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2TPRUsm8psQRqZTnF9CJckvCEpIYayXZFgazKyBaVgk=;
        b=rG77WwDsL2XrM2h1Yvzlngk1oAyTVYaFojMIxtKXGL1gB4KoOEIJZU1fUjua3/zr/f
         13F/bLRXPDsDYgN42FuZ59L/bsOrKUOpUHhOOGgwi3OPElaHFSwl7l9nUKf3jAjYu1zE
         Dte+Gv30sPzajpGpzhBdakvcWhbhnc3TPHDzGS024OAgx4NGJtARxdHymgNYmFOKADP4
         lqwtFXWcvVUGjtjJy+HZv1LxkZXtTRHN5mq5kFKuQyz9lh5k/Wz8eLVuc9w8iMj4/o/J
         LkPPEnW0lFbR8O61DG4E6CO/Me7aqDq3ZoFjEE0Iq/RXG/osRQrLEO8x8LDG8X63h0TE
         3P/A==
X-Forwarded-Encrypted: i=1; AJvYcCWNUUbbVqoofmig11HJa4/vZB4u/0lTNflk04HEL169m8r9psVQKuKnyD2Zeo44M3utHLsPl78kKGjirt4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMsEyJHl6vxq5CVcK/1zcHtKvEbebW8+3h7RRlEBGIajXdMYP0
	g7PCVN2Ca2YvxWDYJslpYs2mG6x1EEofqEGU8xRFPkWusNg7bX6NNdoHuglk5PM50mTBvnhzwxy
	SAo4luR22BqQ4dJkDPVwx4N85nNsuh+UJifL42o6H6pLPg2RdGsdXCpCjbHS7mYZ2Syg=
X-Gm-Gg: ASbGnctbDVsleufiSnUx15PDQDPtoKbpUEVFkH/xsifAiDXoZdggrQgk9JkZIeP7zYP
	6by/73oz7DYmGNksr/4kW82OyNT4LQqG1Vxt7nDIPlnTa+3WdUEErnpJrtq0k5Yj0YdRMhrWF63
	eU6N9QTH5TielL3qisLwCfSz8GU3D4h9y+ruvD+iOc8p+E0sVJsxZ+iL7IiCqJC8YhRYy0ET0hJ
	xrll7M8GwQhqcjq2RkvDb5x+ilfNeBxxAsbR5TfG0FCh8y0QsjoVEbMDK3e3vx1HboNFusUtR3b
	sUX1e1gMeeHlAB4f5NBOzllt0vlzO58O8R2Q30bSb4VaCtl0T3Lz0yWHXlj2yMfbQSQS61R5D/k
	=
X-Received: by 2002:a05:620a:2483:b0:7ce:ed0e:423c with SMTP id af79cd13be357-7d098777f3emr2039778985a.9.1748763639301;
        Sun, 01 Jun 2025 00:40:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGRrw/U4sl8C3LM2p+TsZ0Htgb/XfNRzYHoD1LwhDIj62ogYv83HavYT1ZJeTy3y4R2wbWzQ==
X-Received: by 2002:a05:620a:2483:b0:7ce:ed0e:423c with SMTP id af79cd13be357-7d098777f3emr2039777485a.9.1748763638981;
        Sun, 01 Jun 2025 00:40:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85bd29d7sm10801441fa.99.2025.06.01.00.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 00:40:38 -0700 (PDT)
Date: Sun, 1 Jun 2025 10:40:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sdm630: Add Venus OPP table
Message-ID: <5kn47uzlfihae4pxoglivuyyv2lchunoq72wyps3mqguthwhks@k7obux24cv6d>
References: <20250531-topic-venus_opp_arm64-v1-0-54c6c417839f@oss.qualcomm.com>
 <20250531-topic-venus_opp_arm64-v1-4-54c6c417839f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531-topic-venus_opp_arm64-v1-4-54c6c417839f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JIE7s9Kb c=1 sm=1 tr=0 ts=683c03f8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=bnwqEipTlhqVJVXZ2T8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ZRO5vxUDq8EpHI9elTEXyEnx61eC_5Lc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAxMDA2MSBTYWx0ZWRfX8JPf3zRUBsNJ
 Cr46dlRXGa1Ps0OXadFTxKqY9qXuHhnKgJ5+7C0cGtvengSMd/Ad3MyFpcie3vu0SpuJDBU6lPA
 S6RqoiIrn2/ofYIMUQ1GnnRRrwqDqb70IOulOe9m3UJYOgndLzDVJYbvpazmysyYjiDYNe9V6p1
 yJlHYXKZWc/P9ZTX/K58J4BU9zaHL3A4dvZjlIJIJ/MAxZT5BMvo+mQp9x1EKIvAkPwCDkaYwFt
 6hPsYfl8mcn7exFkxYIjKwRQ//VoisK1oQBmWewKisxq7FI0J3kENxhKlQQgaXdL+B194aqQfQJ
 /ibJbnJ1D5x9bqWf1g3fx0GJYRz3VPw5jioQSiFGi34TKykL84Bhwp1YHuyp2WHW1V4OxpJdH9Z
 gCICdWVTLUC0tKNo+97FP9ZUXvrVttgzFSNxs4Gs+4zNAncqZoyiz0ym9PqlS5cLjuXzWjI+
X-Proofpoint-ORIG-GUID: ZRO5vxUDq8EpHI9elTEXyEnx61eC_5Lc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-01_03,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=809 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2506010061

On Sat, May 31, 2025 at 02:27:22PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Describe the DVFS levels explicitly.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
