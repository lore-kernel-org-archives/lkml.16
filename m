Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF792459D1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 22:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751495172; cv=none; b=i6yBdAUxRTnu3escc5HbLgF/L2BQaxldHC9UQDXxAzXDP37EHMW0F2Dbac3PZCxiWdII80PuDuu+gOP7984HEVWg3od6c4EEEzb1mmc2mL3GXZ7bdKf8VdCyN82zBkMhP9mv/xWIGDe2v2eVbXtCO7K5PaGg1KUpIS4++8b2rqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751495172; c=relaxed/simple;
	bh=YXkp32VHnnjpgTsSIj8HLJsEQ/FUBPYm/UP4Naxfbcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJ6q3CH2M6pIEMgLQCxVRl+/z/UzZgi1g3W7Qlpus5Eal9duuzGmNiSSg504+R++c0O42hZZx9+4cWFg/aj5aP5tb19nSOzWhjbJQK1r8VGSB9jMXDhh44HVJzlW0fFkT2T0U097XzFXfJA+xc5W8W0ZBFEe0fZcPj6kc5JrAUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nw8QAjP4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nw8QAjP4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562JFiCb011767
	for <linux-kernel@vger.kernel.org>; Wed, 2 Jul 2025 22:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MK0+Ls5pDqiJ6P4kbBMFpl+U
	Brrw5KjzX55rd6Zmy1s=; b=nw8QAjP4mmLdP1skCs/UEe9pDiknMqcZUfuxL4dM
	de9u0UZbs2ymcanqTweZQ6iQ1OX67tr84CYBAAIdc73NorCpsT+yRLyWuj7PfmWe
	3uB2oINDIVVTSZLHZtl2gATvTCf/FkiIN5FD/Bult7xtq5FVf1rfqp8sHTN8ut7t
	pZlYwIv1cxHMd2RIw9R1EBvYxeCQ1zKGMl1ODMlesVJ2dK8hou8N6x6FU3M4khuN
	VDLsEE7N8yI23Cim8QbuQRwOX/lOKonFTt58fbZbajeF9B/Cw9k+aYnA+XbnTTYH
	+CUixRKMDPxeGyU5tpNG2qy4dfcS8zp4z8pxsy1S4rsZeQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mw30b99b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 22:26:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d460764849so58742185a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 15:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751495168; x=1752099968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MK0+Ls5pDqiJ6P4kbBMFpl+UBrrw5KjzX55rd6Zmy1s=;
        b=Gq15UuJ7auXAP6CyzHwjoeTjz9D8+JCJZkMg1cGYiB6s6k+nGvv+y2I6CbxewG2N6T
         WQzb6+wc1/F3KgI2woUJ4APQp59SAw94lDRz2blW1D1/m79xx2/8Z387gHlPbyXeUQnQ
         dOwzud9eSyLg83MHHTx28gVLPfxsnTKW52IX/DC4GWYo2hnzfh6NJJFg5+4Pt5c2fZCa
         m53fE2WpuHgykcO1GfvkDvSHZflYKJG95uzIAnjRTGXY4FrA8ODkPaq1lUxIZe0SoyqR
         tZb4plmCJxFpKdrjcajD70dvffA5dbAuf6OutVYFZw6Yfit1xP53jIpNJfNrR3V3+xLz
         IAlw==
X-Forwarded-Encrypted: i=1; AJvYcCUqdGPmHF8fy7EONhcfabu5K6ZfAWQsg9xmetEYSPIi/JtEPNcgwi8KkpHwpYsfzlH0Qxrdej/XRP3DeYI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3GhvyetLQWToz9f6KGkMTlzQYS22iuWHlq8Kq7FB1zHl/sfen
	FKvOD/T/D8BjlGGeoTXtjUUqXbkC7MIkKXl6rPRyD6B/Zzqdt0wzSCu4xbeY2eaXu8MwZ010mWw
	ZOi1PldZ/zJjbDBf/fvYV0L7NP/OT75sSxjKNcsAbsDGYS1pUxBxQ2v+ICzLiH5U+wWE=
X-Gm-Gg: ASbGnctS8CMpQEGZMq/masuT20JViKxrvDJTT/ticI/QyaBTY109uNfB5UGOaVv+B1b
	vePheShXoG+/TJ4wR9IQgL3NF1QUm3kN9bK6L7Fk8mpWMmlekFkif9jblg6EanltM5LVXCLo9va
	pTQEQCMwonKbmBFwwopn/xKIIp+RodF2JiWS1qGmShZ/e9YSV5sLRzz95ZcPW+wnKDQmaRSFRvK
	Lc/7IWLgRhh2/3VjzC6e1jKJpF+qNzuOxeoU0KqiyAjcb3RCoQ2WUoLpzzSiJw200V5L3rcazWZ
	c4OOAsVUBTmJC73V360sR6P6YfWsAIlT27AVw8dvSi7S3RJmw6ZhLMdkPbP3giUx2YI2s7SaLTv
	jOBplIYx9duA1E7W8Bxe2cD12b8baPWQsP5Y=
X-Received: by 2002:a05:620a:2546:b0:7d4:3b37:7bf0 with SMTP id af79cd13be357-7d5d1482a5dmr197263185a.8.1751495168419;
        Wed, 02 Jul 2025 15:26:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2X5tx2tZqNp1T+kumsXTFd+kd61L9urkmpDGTTHsoabTZ4LaAF8wZPfA8E/m43TRPQFGOUw==
X-Received: by 2002:a05:620a:2546:b0:7d4:3b37:7bf0 with SMTP id af79cd13be357-7d5d1482a5dmr197258385a.8.1751495168000;
        Wed, 02 Jul 2025 15:26:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2a73f6sm2262230e87.138.2025.07.02.15.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 15:26:07 -0700 (PDT)
Date: Thu, 3 Jul 2025 01:26:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
Message-ID: <5qsgbqml367yq6g5vb4lotrzulojqhi5zlwwribze373a63qrn@rxi4kwyt66m2>
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <5f90547d-945a-4e26-b36c-75f2d8a1af97@kernel.org>
 <eab8d79f-7188-9537-9176-3e4d22f0978a@quicinc.com>
 <5ad418d9-8199-43c9-a477-1e3b939c054c@kernel.org>
 <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <f5ebf0d6-2f0b-45cc-b99a-b786e5df9edc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5ebf0d6-2f0b-45cc-b99a-b786e5df9edc@linaro.org>
X-Authority-Analysis: v=2.4 cv=CY4I5Krl c=1 sm=1 tr=0 ts=6865b201 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=1XE270qXan2-a6Ey660A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: M9txXh9hbNwYwITK84OSseqgOmsG84sk
X-Proofpoint-GUID: M9txXh9hbNwYwITK84OSseqgOmsG84sk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE4NiBTYWx0ZWRfX/qb13hRYV8nw
 L2+ajjFkE5TQ0KV4e56v1zyKEs7Ymn0lej+HWpOnlVBPdzJAgPru5jKVimKIRwYP87mev4edscy
 MwAeAu8G4vj6NWLbBu0II+cRawIGiNRQLuP7z/EWU7yJV2NPgHWIxbxybeawKDzuBpki31+SwZK
 aHw+nJWZy+1w+Vwb3arsMIVn6Uww7iySKwpeiy9ybZFYVNLChdfxzykRBHXsE+bdBImw6O1QkYB
 qimw2H24AEw/4vk0urHczXF8+8cQ9J3GHlwA/C3jEhch13oMzyh7DpBS4tvwGlxe+udi87uTezE
 F9aobtYlhyrZgYeMAwjqZH+THZWKqZzeRT00AeKYAdHsyMmPBFId79662d/SahBa2+G3GTI4zu6
 OzqUeX+Bkf0x5bqdf0G7jr0tgdq9buEUwjvXTb0B72ZDefMgkLktu/NnDWrnURlM2wmmAIu6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=731 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020186

On Wed, Jul 02, 2025 at 01:06:17PM +0100, Bryan O'Donoghue wrote:
> On 02/07/2025 13:01, Vikash Garodia wrote:
> > > Anyway, in other messages I explained what is missing. You are changing
> > > existing hardware and you clearly must explain how existing hardware is
> > > affected, how can we reproduce it, how users are affected.
> > Exactly all of these i have explained in the commit message. The limitation with
> > existing hardware binding usage and how my new approach mitigates that limition.
> > 
> > Coming to usecase, i made a generic comment saying usecases which needs higher
> > IOVA, i can add the explicit detail about usecase like 8k or higher
> > concurrencies like 32 or higher concurrent sessions.
> 
> Why not make this change for a new SoC, instead of an existing ?

Because we definitely want to improve support for older SoCs too.

> 
> That way you don't have to make the argument for retrospective ABI changes.
> 
> ---
> bod

-- 
With best wishes
Dmitry
