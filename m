Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B0F79F2
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745835446; cv=none; b=c8pZxY8O36dKurz7F4rtmxJRNJTI/Fx6+4iXT4/ZueZbvraVelyAVA0yYwMxNSxYpqVCtSU+yDGijx4O806scm0RYyXejF7oARkvsU++c4A8m8WvZMaR8s0KO6c1itRAsUnr01UtG0JNZy+DdjnEiPDBNQYzR7YUswFGqNaE+yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745835446; c=relaxed/simple;
	bh=y1hiKClkkEJlEYkzZmsa+w8bv94l15Lipgs60J8J1mc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sw5Cp7K4nWDonDzanODKpeMq18x+vC3fSz4yAUtuFcVPnReRFM906o/1xjbZY4zNwr2ZNtIYeLkXl4FFPjKC+pDfex46ENHvguR204wGkd7QIHNp602wjMqYRZi3FFKMcVQ1ay2KQwXk9K0mf6cL6AJzs57Oklac3+/VwuWblnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RpjNWBCQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RpjNWBCQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SACalx019432
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2Pxtv8aSr8lPsn9szEAcL96+
	tyHoCynhCC+imycmD8E=; b=RpjNWBCQghFnkVznLenbzGQ7FGNRi4epvrMeyjVF
	nEr/tyfianNYxVaNMuotOAp/T8tX6J3Y94/rNtdLETf3cR4mU+2P3H4ZQG6x1KVc
	eQS/tEFyEnZyj8NHPvptz274q7rNSLw6hkz+1reFFHCXEH+pFbf4/MCySR7kdaud
	M8I+GUhLM7IJrSDyYT4gAykLYuYJZUV8gAjyNqku27Bv+YNQrFEdmCowpKE1YXQA
	B3AtMGkLgPb4pdh02QvKM/sdDqStEkVr+4uwIFMum+E1b1+dDYXNBe6sI2l6GRVK
	XLiFcNcOgnLd1D8RZ4ymS9nMS1Qdp+qdC9rF3h19Dainhg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pg98tmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:17:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30828f9af10so7531028a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 03:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745835441; x=1746440241;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Pxtv8aSr8lPsn9szEAcL96+tyHoCynhCC+imycmD8E=;
        b=FHvdV+OMJdDJzt/rB5mfyOPSO53aqTXh4GoO7YjDT6QCKzVhhehFgX2/l9JnA2kCwR
         uFkyUa7Klw/pejQEnXDJK/To1t3cfaGBicz2+KqVLqwAPGpu6r60GGLaN2r2q2rLvJie
         sPaPAqtZb3BoMGGh3cvwUR7qSBhfndEomZFzKZeDanHI4H1JT9mqAKtv9ZnxrPuhVpxM
         zCzS56RjzGh3BdK5isHZJBXnM+SRpnyjqZW2ALvbwf+2i8ukHL57xxOkMNUjlb5oeRKQ
         /LUIn12TMp3q5xsLYW1SJN+nc8zn00syK64Q3TtHKAK7c8jrHEdJZ7p9oCzcuVbxX6+q
         1Qng==
X-Forwarded-Encrypted: i=1; AJvYcCXwYxq/2EtZOspjU3J+pYDkTHgcAqfKskCkIqlfagr2QUQlxfyMzWudQYPYbs4R8tDvxM2jrbXz98XUI5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlSIPMYFqSxHnT1xDeKVRB/9Hus6pl7hXK0a4XLp6Z2inaltHN
	2HRxAHuD4ap3bWTv6cfPfvzsDAXsu0VwyvOgk21VNG65gUJI2q6XnAHcCr4zx9dcKtfr2+5UIGk
	BKc4hyS/I1Y+sha9O1aTdOLtjl8nvMIr7CU51yG2bXhHwRUIs+xFYf24Qd48HslAqZyMq8hDE8x
	UQ0gMj8ub9kBvl5uo1qG8oUCOROmusezQfDT7omw==
X-Gm-Gg: ASbGnct9DqR7KehBnaFib/Qv0J/mG4Dh1TW/kZd840+zBXm0178Q+TGvpNyJpC2W90f
	Q6Ls/J1hOiFHSODJZB1pKrGezh/7pZ8bs0G2NRLg4A9AkdJFIYVEezUTZpj/9Ka03tuiEIK1VYq
	PgIbDofS4tt7Gy2ahM+3RMqFqg
X-Received: by 2002:a17:90b:2247:b0:2fe:baa3:b8bc with SMTP id 98e67ed59e1d1-30a013b0fe9mr10022788a91.23.1745835441410;
        Mon, 28 Apr 2025 03:17:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIaELZcY1AshO25NA0l+ttmZJfXNfsi/nEo/9o06JBJB434i2TbdXrkARPRYRTyvmK6A6cuZ9Wjsgk5Ys7NMc=
X-Received: by 2002:a17:90b:2247:b0:2fe:baa3:b8bc with SMTP id
 98e67ed59e1d1-30a013b0fe9mr10022761a91.23.1745835441054; Mon, 28 Apr 2025
 03:17:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
 <20250425-fix-nexus-4-v3-6-da4e39e86d41@oss.qualcomm.com> <3094b6e7-0de9-43a3-9678-4b1844aa600c@arm.com>
In-Reply-To: <3094b6e7-0de9-43a3-9678-4b1844aa600c@arm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 13:17:09 +0300
X-Gm-Features: ATxdqUEUcpx2-hktcO21OhqmqQqXyNUMMYDgeGivjswWKla-vpUY9os7A0P_Tug
Message-ID: <CAO9ioeXhFOn=YPt0+zA_C1WRcXQJheLo-nkVDUk0+87+0YM=NA@mail.gmail.com>
Subject: Re: [PATCH v3 06/11] dt-bindings: arm: arm,coresight-static-replicator:
 add optional clocks
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=ZpvtK87G c=1 sm=1 tr=0 ts=680f55b2 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=m05Zng2Y9WU2dLnq8PUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: kc_-6bY7yU_Vi1V7Lg-jOkp39F8wuxi1
X-Proofpoint-GUID: kc_-6bY7yU_Vi1V7Lg-jOkp39F8wuxi1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA4NCBTYWx0ZWRfX8+zeptSR8P54 TO7Td+aLW2vrCIRhMBqLa0wHmCAuOrDke1UC5yurIoHp5QHSsHZN0A0Z8Ks4WOgH7qBDkygF2WS +RIycXSNEiYPeSN8/nM+LBSEBtdmUCQrUZr1VUVP/ASohH0iayGE+/V26dDhyzBoPr6sHEDfmp1
 SvtYaNIMCndqXZ/SOC/0177+Odf8TesmtAqO1ldJFbnkk0JTykawCFjJcrj3D+7tlrHFDQhKfam PZ36b+oXCHEcWR1oiWCyjeH7rzI3CpJnDDHLEAZ50jQkDmWmGb4+021pOa+kg6pSa0cUCnfw0jf FXQmyRTAe0XezmjMMxd2tJ52dHXStNEK7Kaun6paQEMogEPmEoNoXdXOJIi8P/gHzwNO2udd7oh
 f2LbjD8OK2L6+X5+OhS785ms0QspfCvd1rXiCe6gfqjoVUrfSvdN539xRRROSqJH357bYvaN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280084

On Mon, 28 Apr 2025 at 12:06, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> Hi Dmitry
>
> On 25/04/2025 18:47, Dmitry Baryshkov wrote:
> > As most other CoreSight devices the replicator can use either of the
> > optional clocks. Document those optional clocks in the schema.
> > Additionally document the one-off case of Zynq-7000 platforms which uses
> > apb_pclk and two additional debug clocks.
>
> What is the plan for merging this series ? I am happy to pick this patch
> via coresight tree.

Please pick up coresight-related patch. Each of the maintainers is
expected to pick relevant parts.

>
> >
> > Fixes: 3c15fddf3121 ("dt-bindings: arm: Convert CoreSight bindings to DT schema")
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> Otherwise,
>
>
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>
> Suzuki
>
>
>
> > ---
> >   .../bindings/arm/arm,coresight-static-replicator.yaml       | 13 +++++++++++++
> >   1 file changed, 13 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> > index a6f793ea03b6c193fc0ff72a45e0249a63a2ba3c..0c1017affbad2f03892b250ad864d9a5dc8d02f1 100644
> > --- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> > @@ -30,6 +30,19 @@ properties:
> >     power-domains:
> >       maxItems: 1
> >
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 3
> > +
> > +  clock-names:
> > +    oneOf:
> > +      - items:
> > +          - enum: [apb_pclk, atclk]
> > +      - items: # Zynq-700
> > +          - const: apb_pclk
> > +          - const: dbg_trc
> > +          - const: dbg_apb
> > +
> >     in-ports:
> >       $ref: /schemas/graph.yaml#/properties/ports
> >       additionalProperties: false
> >
>


-- 
With best wishes
Dmitry
