Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6421B23F294
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750686864; cv=none; b=Kp1aSCnVhYWKTpcB/7miZrV4bimUFZnVvpqb1wtlp3sSpUc+LUTqNh6iTCRTcXXQeZCfIISDBgOIJS8ARChQtaq/pVCgKUPAPsJqLhihsjhZSaCL4qSIztqfaJHOHw4eaEG3x+KGDi86K65tqUWYIC97aNxMNKBWZ5XZ4ygnXWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750686864; c=relaxed/simple;
	bh=5UaWLeWfA2H3BSBC8mo1Q1o/t/JITNtEQ6bSv7COgis=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AmA0Lus8N/MJechkzO6gwkaRk2r/4JFjfXYNzkOqeiQ80bdQFgZ6z33P+WifSNYcAQxj3UpH8w196MnHTKoPsSm+M+5jbybzu6Yyg3dTZJlfp9+1VMsFBZSWa0P33JfUo1V1org7/RzoL5NRxP1lQqrXnqV3xHkEAMA2/c6YZGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j/XkvTZE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j/XkvTZE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9h6xD015282
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rCjSuQgV2k3XZQnVF3MO5kvl
	tLvO2sISxvZYNm/MRjM=; b=j/XkvTZE+OGSvwP6sz7+kVIB//iRCIoX55EIfmRB
	AVZlY879uDe38R+NFHu0cYAWy5ru1/ta7YoroDhvcAkD+m0Y7XbaTyeCSQD/WZ14
	tsBS38BZUqNWImog+z0+4k7CYvX5gQVbXASWWwqJMdIOHzV0N3s5w0kOAme6uimS
	rLVyiGA+y2Sc/jfEv24qjx5iJ42i/kF+bUlzuzEtkUs2aBvTcYeS5nJ7yUc6jp5F
	L4DEkxEP1ZpI3giv9WVX3GTCmIZbqO9S8KsaC4iA/CVix8Bd5UkfrwA2gpW/hHCM
	oF9zinHBGHRgk1a2ScrVjV00/EsijDGnc/VOhI90yP0+Ug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4j54e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:54:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d22790afd2so559738385a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:54:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750686856; x=1751291656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCjSuQgV2k3XZQnVF3MO5kvltLvO2sISxvZYNm/MRjM=;
        b=o89lJJ/k0e3kr0uIJYs0BVGgAmPfP5sMnSFREQ1PDNh9P81kvF7/Mnq5HfIorCo6jV
         8uQyyaJNdHTPv3MwZqXHxu34Uu9ZGF5ORIPzsxbxisAPBspW9a6cd/v1gJzrY+p1L1Id
         3hefx+oZsPU02sw2coqDJ4IL9ys8v65LLR/stiuCP4u3qXn6Up4Q587Z7+EXQAuq59Rb
         eRaaXnXXe9dyHhuNh0CFtyG2Gqmw4aTEkeYVWQRjA6xidgZIERfCTef9KbverzsBhnF3
         ohreqqYbOazVU2SS0Hg1Sogf5Jz/RwAcsmrsZvNO+6Zb/0U0phBa3szZ43XE6wyIdTAK
         ZiRA==
X-Forwarded-Encrypted: i=1; AJvYcCXECNR5qL1Z3uPGxFtd64U4st3AI0NnneNpyr0hvvKM1D2S9AAlHwxNXf2qiU9EUj8fzlyOIfoenxFWs98=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzng9WMMbkwD9pktzz/l7yktgr8HByA/JuizqO5Pi4WAA8IkBv4
	bkl0Dx0Aa89dws3u8qMA8SXydAQQK2xlYtCVOahcIdwYts3Vr+6FGHxQm4Vc8bYFk9JCkZuH8Fd
	tMSYjGwXN8B6GACjoYowXakegeFCxzJygqjTuH9kappFuMClogX/vcw051GaxVerH30A=
X-Gm-Gg: ASbGncuTtzWp/T7i55LHToqP+BJiaAw9l6/QL9+cGEluJgXLRQv74Iha5hKHi863iEA
	NXqzXIDEzOJj02iMToV5Ip99a2kesEJyd42UxeteLttItHj6KY/57BiITlhInicYutfg1uk0PLu
	fU6n4tAAiMUiFaOSN8tpxhgAo2rfqgcU/YEH4/VqU98OFal58//wfQEuZOinLR0VyqjS1t9jquQ
	juQ22suxShG4GUcfDJ+5zGAOmHIN0ZtIq+pZau7q+IQtDbO6820pTHdQdA9Rfrcoe/ZkV6YgdIe
	jUKBuS8vncwmdD2TlbU/0+ohPKdKOltMgSlAftUjEkdWSw5dADGyxqWiyQ==
X-Received: by 2002:a05:620a:1920:b0:7d3:c5b7:2511 with SMTP id af79cd13be357-7d3f9920e96mr2207550885a.36.1750686855817;
        Mon, 23 Jun 2025 06:54:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9qQcWJAD/t7Ve7pZBwfhZjG7ipvKtwIHDAMc1m8aD0vO6qb0UcAOpl6wYycIHRg7QbyXceQ==
X-Received: by 2002:a05:620a:1920:b0:7d3:c5b7:2511 with SMTP id af79cd13be357-7d3f9920e96mr2207545785a.36.1750686855360;
        Mon, 23 Jun 2025 06:54:15 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1187cf0sm9480249f8f.71.2025.06.23.06.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:54:14 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 23 Jun 2025 15:54:13 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/5] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <aFlchcdWjh4AvWNr@trex>
References: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
 <20250623105107.3461661-5-jorge.ramirez@oss.qualcomm.com>
 <53aee5d3-ac5c-4f6b-aa01-9c2d5060b17e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53aee5d3-ac5c-4f6b-aa01-9c2d5060b17e@kernel.org>
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=68595c89 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=JM561_q83E0Icr2UghcA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ogWcy_fCBXLz4pNLYK5HzgQbFf4_G7g2
X-Proofpoint-ORIG-GUID: ogWcy_fCBXLz4pNLYK5HzgQbFf4_G7g2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4MiBTYWx0ZWRfX7vHZHyXzgD9e
 Qec8Q5dYkJcU6koDyxvi5p7oZh/XglEiUW68gNXsJ2MYy6VKsJwx3LUa7dNHv67iJWSy803NEcg
 3SaNiES6+bZ8oqWZoH+/adUsVjtFBwYwDnfbU4+QYYNt6p2+Pt5vymMIF03mc6bo6Xb77ifNy46
 nTEM7TWTYg0/9+X9MBi/l2+rZz4buFn22ACOJ+G/suG9ksQfQPw+gynAfgMdXU0VuG5DBGjEKI+
 EwAYSNsf2jlb0E7SHSwWPbPPXlO8BOCnoj8gwj8Hxt+z95cMleT6SxCFfj0ssZT9f7s4cME2K1N
 jepThJTOzfmQasSfVjUPJTFmzaL8+3Cu13KTaVLk9ABHiPwPgmLUPyXrvA5pzzJWL85O73A4bn7
 f6rGoM2yoe020OvlL3iPshdkHXGYD5W5Cwr3y6rxFw5BpkPvmXQYo6F0MJDKfVnxCreLJFlf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=755
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230082

On 23/06/25 13:51:51, Krzysztof Kozlowski wrote:
> On 23/06/2025 12:51, Jorge Ramirez-Ortiz wrote:
> > Add a qcm2290 compatible binding to the venus core.
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Wrong order of tags here as well.

but of course, this was not an oversight - I followed what was done in
some other commits (but yeah, I should have remembered not to use past
commits as reference)

> There is a direct example in
> submitting patches, so it is confusing to see something different.
>

yep I remember now when this was pushed 6 years ago (you can find me in
the patch - I was part of some earlier discussion on co-developed. ok
will revisit this doc).
