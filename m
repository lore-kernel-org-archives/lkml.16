Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F3E1C8633
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 01:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751075914; cv=none; b=Lj7E9LTPJ9m9VRXjG5uLoVr9iemNuimw2zlvOfqLgHqIvhYFTcvBU5Wyo0Y8pwI2urLYmMifFK2PJivq9knHJ1YyTiCptaSxKWeODuXKiNNMTu5V+enAf7eJy+mwe7BJEKuVunSZv5uxk6HbiGNI2QvnyR7d0U7aX6X+uVh/K18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751075914; c=relaxed/simple;
	bh=pWpDZVpcpfLHx6uhsAoegGUK8ZMrlwyUKIRW3dlh0Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hkV+auw/AkxKgb3GKcpaCVDHmxxBn0YrlKxOWbkRg4FBQ76x5GjU7qtfFdH2SYFdhivB2o5w3j8RIkvS8dOo1KPwxmlaKpKyKGTyM2EsyCJVNND3y3hLRRnAelxaOHO5zWFm0WFpBALd/4I6rd1AzqqMErZdO7aLs4uqHi6bGqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kYtymxzi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kYtymxzi"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0DE23004764
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 01:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+pXUtk7h/e9fxB5NYEsdbDb8
	SFpEksY3oCoSMDT5xBU=; b=kYtymxziEtDPUR/DR06fq5P8BiGNvLLfHjXM4qzX
	oq4YCWrtuEIxDA+Rl7mt5CPBs0GWk7Bi3UIMFIDNdcNzREw/NCvFqwYluNHxOpcr
	+Z1I+3r48v3NY3SyuqMAby9eTl6GC9vX3hcN9FpuGSQmbdT02fm6Li8lrRLtQOiC
	StJt+vkddbFxPD0J0aimDPx4rD5iv4Skptrx0Nb0TglRt3yTGMT94hsONN9EUUGn
	gMJrL9WwHc8LA7EhvtpXoUGgX46VAC8Xk8fRU5s0+11J+zrG8i/QKVwrm6IDsEm/
	fHhITWO4azrHqNIMgElZiQfBApmFO3LwcAc4uEgGY5jugw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqxrxp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 01:58:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3f0958112so402163685a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 18:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751075911; x=1751680711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pXUtk7h/e9fxB5NYEsdbDb8SFpEksY3oCoSMDT5xBU=;
        b=jFjOgvanv/d4O1vM7/Lt9FNtNQ3EG687Enu3P9TEeas4KwSohBAD9W24eLWYEvSUHq
         CPPCT58HkCuqwrRBczVWGt1SC73ECmOk69u25+FKpxEuHs/v9JCNZvVvmRp2q1mT6BAu
         i/cM7KAJJKqHr7Sr7BXgMhMiylzV1z71NEnQSfSRO//uZtnbk0cCSiPFW+onCbbpffDy
         NF+mHjJrKTocEnfRyTJ0P4A2XYsqD4u439X8oNMj5GbfbEMcgkWdLLQdTkJbum8DlyoN
         c8HY7+5q8hohjqz38KMR2ekUknJTNIcsOhzTP2+m9NdNIxpIXpdwwmUIIhCgCL246XwS
         3Lug==
X-Forwarded-Encrypted: i=1; AJvYcCWEg9SFZlkHO6AJ2ByMtVlUNC3ycDREs+IIJEkfPZQaQ7b7eji8mo+Q4DJTCRI/ecFrjv+/6f5YQj7+o3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwES4kJJb5pQHrcdtt9s2lbtjsV2zIlwyZhTffOaRPdTkgrCGCr
	Bphn4njVn8j5P+/rHm4VJDWCY2V/jtkarwLNMTBgAu3bUaN7ZsAFw+jPojYhQECrWvfwUyriyw+
	FLZK4v40pFexpcnyEI3sfUZeQnTEHnpl7U6BiCdYXxZ6qkymm4lOMttuC7W0YO5xgzg8=
X-Gm-Gg: ASbGncuk/2kjXur8m1UzSgPBqSmNP3vDyjUTHJPWYVFmDVAIWb7PIfAQaQ8O72/StkC
	zaPjaNKKi4Qsxto9oXHtYhQtyAa0KikZ9etefQK/+1An3/ae5WRszV1ABIUJuv9WdpoAsXSPOq7
	tnUTyLmpFbZ90LCLlBInUfhfn3yKB4q59frYSy3Rv7FxKdZK3DEzOsPosIJnYYW14iwev/nIayg
	e8M4luIiS6CnKR2Wg/wdNfvCxZWJax34pzrbnkTdwbuwqdYEov1ksERCX1HyqlDIsCaHj89VczR
	lFVW91VQOIvxJSVLOwH2SqmAZcYRQPxtHBvFFwWiNYq5K/JhcOe8345hJb01IEYMV1gjIJyoM10
	H1AJJ5IfbsFpEend0yn1ywQdbuegGC3mV2cY=
X-Received: by 2002:a05:620a:1a08:b0:7cd:3f01:7c83 with SMTP id af79cd13be357-7d443988efemr792723885a.39.1751075911018;
        Fri, 27 Jun 2025 18:58:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPx2U8tFKLDmMfH1PW9cHmmn8qdEgd47qN2RxSezRNQHmEDme59hKTrXVfH0mUq2+T6/o9WA==
X-Received: by 2002:a05:620a:1a08:b0:7cd:3f01:7c83 with SMTP id af79cd13be357-7d443988efemr792721985a.39.1751075910633;
        Fri, 27 Jun 2025 18:58:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2b95cdsm639619e87.130.2025.06.27.18.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 18:58:28 -0700 (PDT)
Date: Sat, 28 Jun 2025 04:58:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 4/4] clk: qcom: rpmh: Define RPMH_IPA_CLK on QCS615
Message-ID: <i4l5dbqrs55e5ydrwpuxjigxsa7esevujhgwpl4qwsgx5sawmw@brcbhbqltlr6>
References: <20250627-topic-qcs615_icc_ipa-v1-0-dc47596cde69@oss.qualcomm.com>
 <20250627-topic-qcs615_icc_ipa-v1-4-dc47596cde69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-topic-qcs615_icc_ipa-v1-4-dc47596cde69@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: H5jYsyk1qFpkMRC1U0k83xLGEMpx3oUv
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685f4c47 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=RBL-HKAeo4RFQYj-4a8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: H5jYsyk1qFpkMRC1U0k83xLGEMpx3oUv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAxMyBTYWx0ZWRfX+R8RrrL8isKa
 JXa8TBjI4oAMNPNj3I+jlPZ3asOtM+yRo1fo+tcsADRcQ2+r0dYBAKVFjGRt6L/vhtIN0Tn8XG0
 0TTtkuY4jvjrtR2cZhKrShd3ktKYtoknIN70Xe3VsIyZXQE/UiYSM9TuAD0a/Q1e/RJiNnEHNX/
 iv+xdNNG6qGiRWv9/00o+jBwlIjJalHF/Ub91GmTF1IoDHO/z1BT1+OxxIiDsbrab6yrMaIJ+ym
 RMGJe5HrxsmNhaZfjczTA+8t/72cVNWSnNYw5SI+OgWWFiV6IcY8NKMW3N3F6Gi7ZdW9a/61WRA
 NjQDojbMbnYxen54fAC+xkiTqGiM/snoHBm/MVeBBj32sa3WZWOO7mVlYA0hpGYX1zIfA/w2BIK
 JY/SMsDV5geARTpb6zV8msMrYMag5TrDv2PFRPrpj9ZwBVqohFnX8pUscTUxBNY8u6mp2rpq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=789 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280013

On Fri, Jun 27, 2025 at 09:37:58PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This was previously (mis)represented in the interconnect driver, move
> the resource under the clk-rpmh driver control, just like we did for
> all platforms in the past, see e.g. Commit aa055bf158cd ("clk: qcom:
> rpmh: define IPA clocks where required")
> 
> Fixes: 42a1905a10d6 ("clk: qcom: rpmhcc: Add support for QCS615 Clocks")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
