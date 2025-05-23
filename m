Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4595229995C
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748024288; cv=none; b=HXe7Vgiumdb3TgdQ8ySkUOs9i1RviBRtvfMeEC7kkMlIMlm+3Ylb3Pm4ArdhliNAHgazviNY4qhikV3MUi9HUXHiCSSh2BDqy7BjesKFru1fsPCHjkvCJsRvWEh5WUaqKeqwpC+pLOkomnyRmdnloHqEAuY39E748U60rpikXag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748024288; c=relaxed/simple;
	bh=QDWzARgH6DI1WqTflEHp5w74dOKGn0f4Qtwd5OTOxsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTZ4rnb7kypyQsbIvix1VN3SsUqKGA/7z143H79pVMS7ECbiWiRDgNqoALjV777yk4c1v3cWwetty6G7vVTfmcyoZSOoenJkvFqJKz8hx1ggRs2+dsZX3MObE23iqcapVdCOVphRmZ/CWDdgRcR/6dpoo0gmudh/hHn5DwDyzeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DaxsL6kt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DaxsL6kt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NFJsPC002926
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AQZd3v4cUfKzFOpAc2pmQho6
	OoDTUzX1hwB/aR2l5u4=; b=DaxsL6kt70D2ncypJJHe/nyChAJav63Bpqjba8jM
	+Kn3vK0Y3DC4XXQwRYF8yz+t20qjzTPRLnRn1/gwFfnBaV9l6TUrKV5Wu00PwDPy
	r9dOMiMW4xJEz3ggLagMHpXMesxZYKwcX/ZV45/3M+SaNuYb/gRedzt2q8SHG32M
	tefMxheqtkQmfgj6hvnQ0EAB80GMzY3tLPUtcAjfCNnzHtm52Zs5N8wIYYeipeMS
	TrkyWJx6qR72TImZmZp6cBxC9+zmSRGnVVhfjaMbvYviCvMqocoMFbwuQGz/UosS
	0v7zZqyo82jZffknehBxFkY6Lb9oJIvsqiAOiPq5sXXkmw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95ts6dd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:18:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8ae49fd37so18993406d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 11:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748024285; x=1748629085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQZd3v4cUfKzFOpAc2pmQho6OoDTUzX1hwB/aR2l5u4=;
        b=ZyImxMzSGcX3FD36VVfl6NpyqHTjmfLMTtE5mci7CRUFVpoWriOZsLkuWtCIxAk9Ao
         xptoYGRx4AnVv3Rbb3GkDae8kAPHG7iyHVwoH7vU6p9gWIQ0bKUNVkaSPMF1ViRuuRLO
         DYQyTjm1sPHV7Ku2k4oDDHGJLqgzH0046fgI+TYTWzbAkgYvJjUWgeYs22FG1ZGMvv5P
         f32t7K10cTFn+OWpSiBEn/sWS4PxtD6GvWl2IuOQlhiB5d55qUk5JsrOgIiD6mdEQDNM
         +mDdtnxkKdWTjPCNgZCfPKJABDjinSb92mRjWFIj0sv8KmfqPdS9VN+IsXtI5QS9xXeU
         h7Ug==
X-Forwarded-Encrypted: i=1; AJvYcCW/11wzL+w35hdTfUJLRNSWlimzPBITxtGNVQycDgvA+k42wq/tAhUFBcusRmWXkYbHlliThr3ksTjC9JE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnWmvOvFjQVR1mIP3TaNiidouMzxQ3l9zZ81SO5weORTVMZnZ6
	QmMHs5zUogyFcuUlUvpwaBq3MztDVtDO+0wKcEcKERRMRnCMS+gO5slE9yXmwoWm5IY4Yw/hyk+
	bSGsKujjgvgoy4RdY4HnGM62/4yzTXp7azwz7WMoPSfadZl2lII42GqSMA7niS/k8iTb/YkVc0V
	Y4vQ==
X-Gm-Gg: ASbGncvMSirkxQ6OSODP+Iqr2GW22IySOiuxnb8KsPiDViR+HjcD+ZWTUwXjk5KLwuG
	zNnysFuYM8//kzSpOrj9fADY6IVOPt422wDVNf2anLxcuYX6wcU3on49al9T7EJq4Chr9wg76x4
	ogWB96cnf8j37n7Be8V1W5fIKnidOU1s8UceafjQ6ojkHx2Vbqdw4fJPU7G394CqmfXJP8vFF0X
	r+DmmGEcG9n/sNdnCZ/ATK/27tTYp4GlaLNXjKVacJGkJYEhG7OBHqHz2WZZs3nkkQ+jEo1tuTk
	4NBRFa2XA6MotuYSx9s/eYj+9AeGFBN8urCRrIOB6WQej/94EUgnc6HGTIKNLRDSphfGJmBc4/c
	=
X-Received: by 2002:a05:6214:da9:b0:6f8:d40c:e3a5 with SMTP id 6a1803df08f44-6fa935f6c77mr68911406d6.22.1748024285001;
        Fri, 23 May 2025 11:18:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWZkiU6lLlMr1LrdN5ST6waLhFFmNiyS0xV9thJicOnto+p9teepT8E2kgB5uR0Pk4uiQ9sA==
X-Received: by 2002:a05:6214:da9:b0:6f8:d40c:e3a5 with SMTP id 6a1803df08f44-6fa935f6c77mr68910926d6.22.1748024284604;
        Fri, 23 May 2025 11:18:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085cf9f9sm36921311fa.94.2025.05.23.11.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 11:18:03 -0700 (PDT)
Date: Fri, 23 May 2025 21:18:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/10] arm64: dts: qcom: sdm845: Expand IMEM region
Message-ID: <uxn7fef774c3c7wzyg726zsr4zc3we6bmhomlappied6rkvkfd@wmvqrcehbcgs>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
 <20250523-topic-ipa_mem_dts-v1-2-f7aa94fac1ab@oss.qualcomm.com>
 <fjx7p2ab6c3qvwakrpj3zsjnhvjzwbfszvuwp6edf4rlehxdih@ucovc3r4fdfl>
 <2bce3b88-8810-412e-8115-bceb73d6e8d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bce3b88-8810-412e-8115-bceb73d6e8d9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=6830bbdd cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=6IpEqP0hCIXZkiAodesA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: tqTHekCPDGfmTIEos5T5GM-lF-k62AD_
X-Proofpoint-GUID: tqTHekCPDGfmTIEos5T5GM-lF-k62AD_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2NiBTYWx0ZWRfX0GX7icG0VcGD
 kJB9sOIKVs40wGopMB6ZTtRf7x4eGgIunD/ySM3xHchCNldf1Y4AaNdJaWpqdH+moTnbarw83JR
 hJxlmgsnONv4HxH1U2d30eFRsDQ+dSieotFJKb3TZKlrsF9YmYwF108Uv1owwzh7YYrbhpipSvu
 DGpuNvQI5Go3e31uELDhhNeYEtk5vn6iNsBlOtV4Jkay95wrmyTixdaJCuL7vR12/9IVlXsLPLv
 /mEJPeKNKlaLZXvPU6F2nK/iUwYcO+KMvQWQsfBuTMSQKjgi3wWNjp9yJ70cDZq4D74gnQQ265I
 9ZIimBqc6tSuZfuFmaGVxIkfUnRgfuXqDMHQoZMRbD9rVUDt3QQdbajkDTWxC8HZMgThekwOQpE
 KvBAnZbkcErcoeVgQRVcPJo7Dmfq0zYIgzrn8Y1Uop/XA/2nMGYk2h7yc+TMof+NlCJpLIbw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=735 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230166

On Fri, May 23, 2025 at 08:12:38PM +0200, Konrad Dybcio wrote:
> On 5/23/25 12:40 PM, Dmitry Baryshkov wrote:
> > On Fri, May 23, 2025 at 01:18:17AM +0200, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> We need more than what is currently described, expand the region to its
> >> actual boundaries.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 +++++-----
> >>  1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > Fixes: 948f6161c6ab ("arm64: dts: qcom: sdm845: Add IMEM and PIL info region")
> > 
> > BTW, are you sure about the address? msm-4.9 agrees with the current
> > one.
> 
> we talked offline, but for the record, it is intentional - parts of IMEM
> are not accessible to the OS and were previously not described

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
