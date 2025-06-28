Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588A01D8E10
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 01:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751075867; cv=none; b=mrWMRKe9fJCAHKr+qBavQiDye6lI7AM0kR1uctYW3EJn0FgihIQ+phQDRT6phj8ZCfLYy8SssxoCX4Gjwvn8tV9vqCi6w21i24FvSbOQHcj+hkZuH9uNx8fbPt5FkWBAzLL4LpG7M/kZ8k4CRzUtufiOKn4Dz7sI6A+OJnCPQ88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751075867; c=relaxed/simple;
	bh=eB2h+WWGUWxTIdXYzQWwwYrg0DgFAVeaboMVJ48OFSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmFH++LpGoQ5emDaSVIJL7/HG8MJF87DUA4WTRTsTG4lJfN4/gp8P4+hqY+a2aKn8qpdOLbH68w3NwP4q2QNZaViZpSHqFvDEFimnVAt+AfgPaC8P4AtZFTxzEg9BlFlSQT2UrJDA5CyOdG6xsFpy5bR5+7xaeo/ihpusQi4SBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a2HEW8b7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a2HEW8b7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0DH7g032543
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 01:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C1cLAjsBclJ0QBWDw60ZW2kU
	AMy0clXSWHYg54xP/7I=; b=a2HEW8b7NwtvWqvduqwrtvZYP2KmDBQihQJw9qF+
	t6OrJ5fyQpJpC+49AyB0QMlth9sZoUNjNPz5hDM894auBz0LGAC91rYKbzOOUM3n
	+zeqEtjULScwi6lMxT4rHy6Y6qFuSfafVD+5j4gydEvOis/VRxO3nPqQ5ExEDsLT
	heF6ksAC/Iul0c8CjaH/XEI2hidAVHG03MTKIom7Gtc9aoaeYnQG0Z7ohTABPlmM
	U3OPmV0y5lP1lsfPV1Cukb94IX6NBlhnqKrldPf5aPCqnhxkDgSPiJpUdgFKpTD3
	nDYmnqjb7TokykvNX3obqz2wS5L9Hl52tlfBvrIWojgn9Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fj3eb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 01:57:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a582e95cf0so4458981cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 18:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751075864; x=1751680664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1cLAjsBclJ0QBWDw60ZW2kUAMy0clXSWHYg54xP/7I=;
        b=CzNw/x3lXnue068AV/3mt8s4jezB52dpFbO4mFKhdoZpDFteB2+pnbkPCPJjLy8BpA
         2ZUtivHnqf54v/2ftZN96FPk4CT2WHjQQBI8DPesN+6LBgQaOL+D7CTkocz++ZRqGrtU
         xrXMK5ypBl2sxFyHZwuJPZm30jDBqN1Yzk89+bOnCT9LHKJRd0JDSiUu5GMO6Kdow3Wx
         bQJMEJvxSgCVdNePvY3AWFaoP6rQqAuM5RrUSUQsPDg671KnzQNqw4WYlGgZoCm1GiHA
         W2ofSKec/4f8vwo/EHCmNp7tk81vdupmUWr3cuNoW5oMIJfsLig3MDuu3IsyrJ26UCZP
         TPyw==
X-Forwarded-Encrypted: i=1; AJvYcCWqsQcvdSyGjUb57gS3yt2/rJxrQsS7nOVw9UmulUZ19DTlcdjwEzK+1PjX++BTtlZYVwPUy6Oi3zeWaeY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVwBHitFGTBuXUQLp5oZphgAAZKrrGydb5f09FQhid8hkJDmeV
	3QlDPKxPw/pXfFQgTqk9+wFozQoybjlv2uFXRx/QhvD3s4VHEEazEwcZERXMLUgBAk+jTC6bBNQ
	13IggqE0a3eGfrNPcVM8RI+pmZhmtVcgCRT9J+GiqfeqpeJ2VHnkwVJSIWZyHSahJcg0=
X-Gm-Gg: ASbGncsEy2RKKMceRzVZB0A97PARmhxh9JwYdATe53LMPICDEtk1lcbk+SRog1238Mv
	9fYwArDpuWy2qbK8hTJGWKiwDmOZDcKu6PB+JtThwhJYledqpJ2O3ZGHaWsyn1H1JPHc2tNQHX3
	FKX2In2OflZlWkkFL0BYpzbyKHtPcf6gBD7P0rCw22iX2OIEBKGD5sItfOpdedDV5o6MX18E1+o
	yG1Xw6mogOKBeLxMoHi8Xq0xWI+F8CF6i2kiMvSEcj2Y3uFOp9scztXNqkK4dzUYuX62uMbCgWn
	VT/YybPSseL/9nb/ltCyOKVG2fDQJv5OczlEIzBcIg+pvPczWs55rFjQMKeEC9DUGZ+ZrWybHPA
	9zLYkBlllg3w9KBm4JpmNNAiqw/xkKwwBhHA=
X-Received: by 2002:a05:620a:aa19:b0:7d4:4b0e:eb1b with SMTP id af79cd13be357-7d44b0eec28mr241536785a.45.1751075863747;
        Fri, 27 Jun 2025 18:57:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4Hltdir3SyFuBpeLJoJ4afHk65Pi5pMb3NzWsxG3FHxbeZRywpOH7wvixrcleSdr649yHIQ==
X-Received: by 2002:a05:620a:aa19:b0:7d4:4b0e:eb1b with SMTP id af79cd13be357-7d44b0eec28mr241535185a.45.1751075863298;
        Fri, 27 Jun 2025 18:57:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2f01ac0sm6638601fa.101.2025.06.27.18.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 18:57:41 -0700 (PDT)
Date: Sat, 28 Jun 2025 04:57:39 +0300
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
Subject: Re: [PATCH 2/4] interconnect: qcom: qcs615: Drop IP0 interconnects
Message-ID: <3edj53e2tlwqg265udg7gjk5lfmlwz6higfm6roq6z65qye3o3@wjbjsjq77wjh>
References: <20250627-topic-qcs615_icc_ipa-v1-0-dc47596cde69@oss.qualcomm.com>
 <20250627-topic-qcs615_icc_ipa-v1-2-dc47596cde69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-topic-qcs615_icc_ipa-v1-2-dc47596cde69@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAxMyBTYWx0ZWRfXyV6fWH0lWOfz
 JAG6buc6nDKs0FqN8GarsgB6kF0wdMxrCy3nSpns+tP+vCrht6XZXHEVsoJB02RWLX5bXL/95GF
 fWTlIay5xzSdiTtx3KnuXkv3xEeMU3PMzwNQd7wsL9cz6oyW4YKMFYRE7oPVy6/o2Xh9tz5CR/r
 mh3QbAqvTCM1GhqGntajq4EhPiIXNmLceXZb80VixkSpjDwSMKnaa7VHAhoS6nVfaUqHJuJkZ2x
 bgus1WBBbZx1X91j1306TlKNMulvN+tPeBUMnfkuGTISYKNulXC7fOR0PTHbwTnPG8/avROBiXY
 BfMtNABaaJMFZaMjHOjjPWzS3Oek0Rz08zcOOkAinwS3Z5yRCTsKsIGJU3xhbireKf+wJwLIVuL
 fMZa53U8nnRs8CH2rgeRQXRPXUQQrYvf0DpN3GwdvYRO+ihxuU4DyCDqYdB1+BJHSSZjptfn
X-Proofpoint-ORIG-GUID: BPa9S2hl2Hrgv_D4aZgTGQJZ4ALiZVB4
X-Proofpoint-GUID: BPa9S2hl2Hrgv_D4aZgTGQJZ4ALiZVB4
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685f4c19 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=wxkdqnHnqkY9PcZr0RYA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=798
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280013

On Fri, Jun 27, 2025 at 09:37:56PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> In the same spirit as e.g. Commit b136d257ee0b ("interconnect: qcom:
> sc8280xp: Drop IP0 interconnects"), drop the resources that should be
> taken care of through the clk-rpmh driver.
> 
> Fixes: 77d79677b04b ("interconnect: qcom: add QCS615 interconnect provider driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/qcs615.c | 42 --------------------------------------
>  1 file changed, 42 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
