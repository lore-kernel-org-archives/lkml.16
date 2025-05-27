Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36E520B800
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379807; cv=none; b=Pp76Pl8Ko3c3Al7U9M7Eg5DocPJKhpCh86fI6kSCn3Sc27XTC0i37AMCA/SJ1Xk6tYB5kGsWqDnNa9K7TcncWekAaQCBuEG4d9P1UCJAxK6ZBucHHUui6RagmQQAjI9AHh9oQYKrmJqlbY6kEazrwPf9eDBNzgkDd8FKQJ3JaTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379807; c=relaxed/simple;
	bh=+7lmrkFQHlFAXV0QQyrHiRbF0QoKbYG80oYbBKTNEzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GnHIhPTTODafBbbsjMlLC7iWeNEWpPzN2Qai68A5HKojHzYfCLEtExT5xjNQbQEIgyT5DR/XI/PYEp8TymDw4tMTLNzNGtKkXmF5lyLU/qWu0U9OUOeO7FBBPnY5MRlyF67kZAJ73kgNdIZk9PWxfzEMQREPXNUcT53l8qv5esQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PjMu0JTk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PjMu0JTk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RJiQoX010166
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VsOv4br7fd1T6CcMRlB4v7ct
	hk2voXgCn0Av/3vO9Do=; b=PjMu0JTkWX93JZ3HTHCBYQzd1vRiwiscYkhKM6OA
	vbA2zi8u+QIa9/JxmrbghIdXjk0X5tHm/K01LCekhYvfFKgBPseU7ikZxCmwr/uo
	vTZX+IpPgzJ1/RvuDxkgfcDhgzDeL4J0vCzx9R0FQND8N06wlemN2Gz45A2g8SgQ
	Yosbj58Yqfbp2tRuYzwPxFukE9dl95FCkN6jjCDnN13XnLMYgBEtTKuiXu1nS4I9
	GzXsnzNpL0x+DEHs0k3jROXjl30nydYi8z0X/YK1QUwQAj9oPjBjMuG3e8ELFeS0
	APPgu/EBZlgqQ3BNLAS/+2GE5fvG9lsM30neuc1DaqsTpw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjr8nw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:03:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7caee990721so941278185a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379804; x=1748984604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsOv4br7fd1T6CcMRlB4v7cthk2voXgCn0Av/3vO9Do=;
        b=w9L6tSa0ulwjsJAoYYRJGankbZXSXX+4iE3h8zkY3FCDxu64PX41aBYfHRk78lvIMg
         A9WgLibsv8nLd5VMIjFR3iW83Laes+UpOuuQKlQQTdbmiihBd36i96z3DCOb28DmPqFs
         XQSeukL/4fgmdJoAcCGFGP8O6Jr8Mt0Kfhcwsdlpbq8Dc/oqHoKJzKEF53gVZq2mwn0N
         9UApcUR9++isXAmRNcEDMrtyDFGsARyvCVrVWynMcd9k8s+4iWYLV+YGDOzuA3/cb81F
         dk3ub6jz6shm6kwZ+DaGEBI2U7nW+BJikX5d0FndaNyBX3i7kK9IuS/c5DSeJQwVL0Xn
         k58A==
X-Forwarded-Encrypted: i=1; AJvYcCUeaHb/PfYKmCqCKiSg84SaGJs3iIX6DVgTVQ29LlAlJmuw3RDTlI/WAcVXZIJGstcTKPZaAtzkSd0r3hA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZsymESWYER4XMy8nJlvTdmJJSAaKe5UlIZnFOezTQhXZXAe7f
	4FBbpMcGKJnoPc3ncNWtpZkp2HKzVM2CAgZ5PVMCP4OCIK8zW7uRlayy88H43FvSzPWtAaCunqG
	pYL7apqE10I/Pi029pw1u7JRiBsG3P5o41d22W5SW5YOdHt8lQlNsxy1MYGHiiT/8xl4=
X-Gm-Gg: ASbGncvDnWq4XeI20zHiqH/VQ/E38NcvNWEtDAR1/WKlANO5WuG/V5Nawu1Ij4HdBEe
	r3QEnwXq69MQlEmqMsd8HhU8A8qbCvrbpfogYyqtpwt4AUqOEM6mzBt8dai0ZikpdPbEjC+Jx7E
	Gg/8XbX7Tmxx6EYTuHj0xqS2eVwdTbfdnwkY/VSgDojbHpW/7+cExm4EeA612O14tXodE34UMs9
	RuPuGceY82cB9cIx8+KQUtLkzK123k46STTrdG6NunL5J1nzMhSp4Oylec6QLF+vZj/NOjrid1J
	kP2KqejMiCFqeI0kCcM6Oq2kL+gSgBgtgVqB+6Cn06vu2ccy+DigRVFR9ASGpNaQ89QggnGtzN0
	=
X-Received: by 2002:a05:620a:1794:b0:7c7:bac6:8b7f with SMTP id af79cd13be357-7ceecc2d5cemr1965854285a.45.1748379803805;
        Tue, 27 May 2025 14:03:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHey2F+1GmRJLbhJPjMP4o/YRYtrCtiGE60Hp1Q7gbuk7nE2RxX+76V8r4hyZF/SGD9E8GdQw==
X-Received: by 2002:a05:620a:1794:b0:7c7:bac6:8b7f with SMTP id af79cd13be357-7ceecc2d5cemr1965849185a.45.1748379803410;
        Tue, 27 May 2025 14:03:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532ee738f9sm25865e87.237.2025.05.27.14.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:03:21 -0700 (PDT)
Date: Wed, 28 May 2025 00:03:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/6] phy: qcom: qmp-combo: Rename 'mode' to 'phy_mode'
Message-ID: <syuv7z7llocqzqsg7k4chd2lejnjsv3fzgif5eumxkp3bdtrrw@vheqjejlyxgi>
References: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
 <20250527-topic-4ln_dp_respin-v3-2-f9a0763ec289@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-topic-4ln_dp_respin-v3-2-f9a0763ec289@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=6836289d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=i4r9q8SyThEWzBBqjdIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: RGrwfR0_l5k94b38P25hfOyTdeja9LOG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3NyBTYWx0ZWRfX3tZXhMu8EDuq
 f1urCdyAxe5cV4/ypSSyYeukCsMJrRXdVUEvZLYTbNtmW1l6v4RlQyaUo1xfNZSeyFDNrxicVFm
 wIibX1UyTYFoC9Sbj3IpiP04u8b7l9hqQECsfrLKoOHSRHeEcjdhM4nrC/2Za+76F3+4NmHXYSQ
 owo29dn1QnzEfj3chC4XbcLvMRc5JYLPv8PdaB1wTPzz5/K9opHv5TGOlxgwj3X7J9NIrJ69rWJ
 auhlQjN6S/fW1joLwtz1xTd/cs7pe3RyTUhKrr05jOLzuvOO79kVEptee/gAE542uJBHmGgdWXd
 NsihsuFQliNz/f/jGfZlze4cAfGuIb7ClcYr2LyfiDoK4CuhyApiRXee4KdGH1Scz4qVkF5lmc1
 E4VnhCLmNA0Q+tARG5uRw6RoSTzMfH19eCwimmMtSpkf2YjcH4A6Y9gUwWWRCRWmrXMEzvDf
X-Proofpoint-GUID: RGrwfR0_l5k94b38P25hfOyTdeja9LOG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=954 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270177

On Tue, May 27, 2025 at 10:40:04PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> There are a numbers of ""modes"" involved: USB mode, Type-C mode (with
> its altmodes), phy_mode and QMP_PHY mode (DP/combo/USB/off).
> 
> Rename the generic sounding 'mode' to 'phy_mode' to hopefully make
> the code easier to follow.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
