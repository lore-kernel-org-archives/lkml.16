Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7E32C1A2
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 01:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750814796; cv=none; b=tIj0hBQi3xYB2Mb5Nr1j4R6n4ZNtDu9tl68MJX8bhBpo5bresZKMabUZAQ5VbAKcz3lPRIAN87oD65qL4P+3hi7vHNzc4vwwrlFcXMPktAIGwAI0iHu9b7z/1TEbC2NEDw4/CObvPdzhxenWsaXDgb3FX2YC3uyZEjkeJ2mLRyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750814796; c=relaxed/simple;
	bh=SuHl7o4L7AbswnbamqjbFE0wNR+4JLv2OKr/8ygUQdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o6/85fEWdrdtNaP4faduq8LWv0zmmX13WOpjbuvwj7DWLF2OBut3DPDaFC4HQGNXqe2EmKatPaikugMuX80SEC6O+E5/pIgedw4L1GbBi6LRU1ov+Za4b5ENTAUHx01KlSmBbXEiV4a+DDbVqn0dzponvS/Ao/q5Fmvmo7xu8XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G/bIgZDd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G/bIgZDd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OGnrgH015264
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 01:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=neS6pVbYsjxvaqbgnbCdrETG
	LYElrBS3ThCl68fWGKI=; b=G/bIgZDdzNsWRuTdtXAaWRLV0s4nPFljziW6oGKz
	0050DcsyJfNAz5v1+EcS7HIqWdqSCojjY3Ma3EI8vKQdCUD8Yn4SS7Vhf1TnL8st
	sSkPfJgxdZ/NhirsuWZBIWMbxkwntJ7dOSgfaselBaOBFbsMF+jXrDX6t0EiK5OL
	7xVIbZU2C8wvj4eBglYS0n0W7ObSMIcxEiiOhBkrFLwCYgXW1PSDyYBG8iPmuTzb
	usW+LR8Yjb/2m4Ip4L0NafnmlyYm8DK63+MmwDrkUZrrXHE9S5yaz6LGSNK1kjU4
	JQmAwGCQJ9FpoQC+iYEys+yZaTcbliTSivqXApqd/y0yyA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqmjyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 01:26:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c790dc38b4so74366085a.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 18:26:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750814793; x=1751419593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=neS6pVbYsjxvaqbgnbCdrETGLYElrBS3ThCl68fWGKI=;
        b=ejsClSTTayDpNOysQMaO6c+ofPgFRVaxYESvr9ss1fEUYCUiTS02IuzYLT8F3q6JI0
         O2MNERHaEGF8C9VicRJXQsMxx5Vl5f2edsteWeyb6nfPedhlzaGgr36nG3hIlr1/IEDR
         eERL1HtDN9XlR8XDG7P58zaHx76bg+R/sbPND1ns956XskF4/fKvJEwNMjlA9pT/RBxe
         EKEB5QC12gjVdssFtBV47zC1aOhpQEHyrhCD4LPYCc8xVDxC2A1soI4gXOMWzC7ychxH
         2Lu5q+bSBmO6DRYGdXNATgIn9Yi8rdMB5nqUe/0U5wmuesnY1R6n1DYdSMmrylfdUJAX
         Z0AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYG2bIidqgbf1XYw4QNLPhKqRIWOfamRwjm8H0hk2E7f00Gh9CLpGl6MMZMD/f82J2S8nzC6qqIHXMCTM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxXitiWquYeUaOnlJYSsfo8408YKkN/JtVuiqpA3EGAD4E2IxH
	soOhNBG0tkw8SA7uLpzGdVjNWYevFDsd3B2zpzAki/WGjMR2/9G3+qV4gqCdGU7LOUluT33PDAy
	AsktLlN6Hc1Nbs8qufU9/Rn9w/RNLdtH+Gje61ABFeoXmIv0AQ9x1FHuKqR8uJ3f2qBw=
X-Gm-Gg: ASbGnctXDRGUygUjEL3KHI9RpGaA9qjRA67yD7tW4k5TU7uZeHlGpZXLYacphCiObQ1
	iB40NcccBaE62jl4SGees/Pyn7A1kF/u6mCvGICF9EQtRDFg3o6L/7+TnVX8Wf+Ydh7BRhU99rX
	gHSRsCfcE0bR3kbrjtnwvCFYj27biNv6BbIEeGMJFtYzUtama58EK2z7DIz2J9e0/ijisg9kLOU
	ojaJxATqI0ZoA//3yU4qHeMSfQZO5KTZoAsOGQxUlkGa2CAIpoGpIDJYCrRB2tYU29Ot0JdRxnM
	P4Uzivnaicl4UZgczKZWh+eQCDMKds53JZhYkbl3WjrUA86Ly9ea/ZZevuT87SupvNNAxxJSgOF
	xb1MplQW1OJnnnpzGbQ2h6y+udzLrj07nSTU=
X-Received: by 2002:a05:620a:4041:b0:7d3:904a:30c5 with SMTP id af79cd13be357-7d41ebf39aemr795527185a.4.1750814792670;
        Tue, 24 Jun 2025 18:26:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/yWMEKNXkQ13xAyZYxnqt6e/Lh17q5mfQR5L0vqtyXb5a8XTw7F2B1T+XQ83I+IP4+2EpBA==
X-Received: by 2002:a05:620a:4041:b0:7d3:904a:30c5 with SMTP id af79cd13be357-7d41ebf39aemr795525885a.4.1750814792185;
        Tue, 24 Jun 2025 18:26:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41bd227sm2032691e87.93.2025.06.24.18.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 18:26:31 -0700 (PDT)
Date: Wed, 25 Jun 2025 04:26:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, lumag@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: Fix 'l2' regulator min/max
 voltages
Message-ID: <qbet26mwfas4ymyy3ozl6f3a5yhgcd2e3euvrn6m3gdvnyvugh@c6yl2u2pcshz>
References: <20250623113227.1754156-1-quic_varada@quicinc.com>
 <465751c4-a45a-41ce-ab65-ebddb71dd916@oss.qualcomm.com>
 <aFpA4mk2L/sxlpO1@hu-varada-blr.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFpA4mk2L/sxlpO1@hu-varada-blr.qualcomm.com>
X-Proofpoint-ORIG-GUID: AYpYrYgY5VM0uL4vp3Gp19ULzg1QmwAQ
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685b5049 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=DhCOG8gjuL8a17dk0cYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: AYpYrYgY5VM0uL4vp3Gp19ULzg1QmwAQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAxMCBTYWx0ZWRfX1zPTx3dur5BQ
 Ar+D4b14g9XuodNTFP2+exczGJfZUv2AqYS6/sjCOU0/sIfWuVKBu0ipTZOPwTy8QhZpUPCqNAM
 gip6y2r8lMJFAbyNjy2edxazFTF7TZgFkEaMKxFyajCbqbz56myVdo9p8ycFkrxOiN3l9DMWRaq
 7wgP2kYlCDwOCY+Q82Szy+bemkPQeL2Zb9bMbRWY3mSuLp26CBzOPhPZDPrKFzUe2CMl3bq4CTH
 HgvB7f8iWpjVnCcriZ3diGGfiPPRxORwPdp1DPRmKKMjaatGctMjqBFRBDpPU+G0p4w5N6HepxZ
 /LCSFRwGYYt0Til7q9SMN+gazN/r4CtHuaaqTacNtV2Iui77FNuJmwbinnJrEwJR3lMdNSZQC/8
 Y/Vt22NdBYkrbLNh1+GnMXoNjvQ8yFluInQq/odq+9Yn+D0D78w3oeYtz+nMdtwPgzNB2JDr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=805 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250010

On Tue, Jun 24, 2025 at 11:38:34AM +0530, Varadarajan Narayanan wrote:
> On Mon, Jun 23, 2025 at 01:34:22PM +0200, Konrad Dybcio wrote:
> > On 6/23/25 1:32 PM, Varadarajan Narayanan wrote:
> > > The min and max voltages on l2 regulator is 850000uV. This was
> > > incorrectly set at 1800000uV earlier and that affected the
> > > stability of the networking subsystem.
> > >
> > > Fixes: d5506524d9d9 ("arm64: dts: qcom: ipq9574: Add LDO regulator node")
> > > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > > ---
> >
> > Shouldn't there be a consumer for it, instead of it being always-on?
> 
> The uniphy block is the consumer of this voltage. The PMIC configures it
> to 850000uV based on OTP settings and s/w doesn't change it as uniphy
> doesn't do scaling.

Please express this in DT terms, specifying the regulator as a supplier
to the uniphy and then making the uniphy driver use that supply.

> 
> -Varada
> 
> > >  arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> > > index bdb396afb992..21b04a2c629d 100644
> > > --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> > > @@ -106,8 +106,8 @@ ipq9574_s1: s1 {
> > >  		};
> > >
> > >  		mp5496_l2: l2 {
> > > -			regulator-min-microvolt = <1800000>;
> > > -			regulator-max-microvolt = <1800000>;
> > > +			regulator-min-microvolt = <850000>;
> > > +			regulator-max-microvolt = <850000>;
> > >  			regulator-always-on;
> > >  			regulator-boot-on;
> > >  		};
> > >
> > > base-commit: 5d4809e25903ab8e74034c1f23c787fd26d52934

-- 
With best wishes
Dmitry
