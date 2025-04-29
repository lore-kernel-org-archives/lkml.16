Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53172C10A2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745929434; cv=none; b=rdzChga0RPEFCgEyujlT2tl0asb7PeyFTI+4OYW7wU5UfAu1K43Q5WijOc/nWS2/3cesmgM/Yj7OeL+ek6rsxsF7Oa8L7r1ZC8dE6Rf7mm4u+phRaizRwAsZ0ENw+ej+SRzt7FsCYP4oJBETcfJJfYQSU7qSupHFZZKT76j+tx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745929434; c=relaxed/simple;
	bh=E57J4dCmvgqlt1ThO9CEVN44k9zEWXIKqQnEEIIZA7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sUGKe+Vj3MHiOKOIyvHA0tFhMg8y5ZnH0kY9B5yuBjjADZTnDwMjoEuHBTuxTCRjEOQO4BxaNH4vIRUaS6ZPNAe48Gbn+Xad/ms1GGB0+j4ozpW+wSwQaNtn166TEmIhcdugzRzPXicWJ+Qz281C6wqq9iPCK4vkaJpicGM+CgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jepv/vp+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jepv/vp+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T8G4Tx007452
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mWPI8IBrH7hlnkBmEO8Qt52b
	2JZ2LdgusDzm/ZmxwCM=; b=Jepv/vp+wV4PAFttjELu8cAbXFsPwIV29w+Gx0Eg
	6S+1lTWzJKVUDMIkSbq6iFufXGAxdwdKKH0zRx4sHPHG6oUGySHVy768YCLlOjP2
	rtNOBox+emSg593ZEVQzvX63vlYUoH2ss/j6MlyHNXdUgFAAXIFLffIxRHsue1Fd
	xXRd9NnBe+c9Cjbzjru6lrF677kA5dn2oj5SFr40nVn+fruysjAKcfM4fSLqnKut
	K9tqjhzUxj1ml3GGZ/rTteRcjB5eTMK0W5yu4qKSsWJfuQmfCicudCMvJvnxqN1b
	GNqm4yJshWEACANApoM2uKrrekgVxI4/0RGTkjSDab5XWQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pg9chv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:23:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5f876bfe0so1031686685a.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 05:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745929430; x=1746534230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWPI8IBrH7hlnkBmEO8Qt52b2JZ2LdgusDzm/ZmxwCM=;
        b=gZp0zhMiDjYW8EcSp79V7AAmdXPl1U0HaKTMGU3jNrsJALwGzxo4x0+rPDF4IsoAj7
         dCM5hDnvZkpQcQQB29eB92mOnBYyNxfDpx+PV2KmudR3Ya9H65mxLKm7t+J27o1n/N9E
         Bo1b81dBkqw0/SJjbgdy9lIaskSfdGinSn5dxMD+AxI3a535927VViSudWV206p0i2u+
         IDbbLu8O39LovrL68fj4qLBbqzEOxwWbNfv2JmCHhl7wM5p/xiofLwOprduu1oXQ5Wdw
         l3+wmrD/Rjvm/JzxswAhkCLobJQvC4AOZlTRxN3NGivCUa7X5slHT+26xKmY+vr/Y66S
         Vc6w==
X-Forwarded-Encrypted: i=1; AJvYcCV8RA7x2iX4Nh6yGfCcUokU1FiA4Af+qini8iJB9KosOTvVfxPjlSjzZkqnAWBjb7+tgpN4uJ2UDWF3deo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4ku3z+MPr89YQJ9k+8rf4OTFqjUN0s6NCIQlc1aeh9bdDT3FM
	EFy0nTgJdB4pBI6OKIrCWjrr+GlNNIoVmV8DN+uCtPqHuiJNXJhrMVjLzrDprgMEOziGBV2Ginr
	XvYUF471CB9BeuPCFZZO5ZWluiyN325hy2StOhdyRhSxwLyEpcIgTZ9Zk+VY3n5o=
X-Gm-Gg: ASbGncvb4V3B4f4q/LKlyvQRm2Wd4mdmhRsmJnO5M9753XSadazEH9kn+TP0fOp20Wy
	+2xHpFp5ceT93LkV81ekkhr23ktkmrzzUdKzFYhgS5Iwu+Wpffj2MQPkfBYTraTvCieELWbrYoD
	tZRCvwyF3XOKRj6hU3yKaPX2GJHscfkzXBuPP+7ZMqlx4EIiWKdZKqW5jsJHfzozZNoXg9lDwzJ
	MNSJ2AC4PBArHmiIynclcpIXXekSGBkA1r/9qLCChdlzRcEMdzziZyySQBSWV4QIrUAbSpD65pF
	Y1ZBjmrvnu+zKT2viJdPQXnFs/pCP1TT3dFFzAeO8T7mp8i3yxX0Ea+XI65RkCq2oGnnXNpU5dA
	=
X-Received: by 2002:a05:620a:6117:b0:7ca:c5bb:3007 with SMTP id af79cd13be357-7cac5bb32b5mr25636785a.37.1745929430402;
        Tue, 29 Apr 2025 05:23:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/YVYTF7AsqT0sUlkNbluJNYqiS/QEjcLK0UlrF+CJVw0ltMIa46t+oqSpGCfKt2bt7Fmb9w==
X-Received: by 2002:a05:620a:6117:b0:7ca:c5bb:3007 with SMTP id af79cd13be357-7cac5bb32b5mr25634585a.37.1745929430043;
        Tue, 29 Apr 2025 05:23:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cfb49872sm24408651fa.35.2025.04.29.05.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:23:49 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:23:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 01/11] Revert "dt-bindings: mfd: syscon: Add
 qcom,apq8064-mmss-sfpb"
Message-ID: <igei6wspjs7qetjx7nrhr42kbvb25yaldpfx32hyrjalajmcfg@qcshsrzwejxe>
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
 <20250425-fix-nexus-4-v3-1-da4e39e86d41@oss.qualcomm.com>
 <20250428-prudent-hasty-pheasant-aecec4@kuoka>
 <29d15e93-8f5e-4cec-97b8-8592beb01d6a@kernel.org>
 <CAO9ioeUo_vO+-wuC4JGi4JfSMZx+JZkvLvsi=ppBD_LvuV2ZLA@mail.gmail.com>
 <676324e0-43a7-4227-8b6f-3fec97a484b0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <676324e0-43a7-4227-8b6f-3fec97a484b0@kernel.org>
X-Authority-Analysis: v=2.4 cv=ZpvtK87G c=1 sm=1 tr=0 ts=6810c4d7 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CcgAk7be1liTUAj5SvwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: L7A6di8UlKhuBXxIXUhYOgSac8fdS_EM
X-Proofpoint-GUID: L7A6di8UlKhuBXxIXUhYOgSac8fdS_EM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5MiBTYWx0ZWRfXx2foD+LxpNyX /ONTmcTtC1UGE4OpDB4o2CXm2Cg9IsikQ04XbqobT9zGHJOVS2a6Spz5zDPzPW2Pji2G3a/fCkX thM5Vazy9hJHG0+6wjnQGsbACmgozoynqtjB6Qv8sSlOvJ/XkayCXnZZh5xPFaEqZr6Whf2qpqq
 +pVMIA3jNzP3Vp44FPvBE4QgLPk8BMrPaBCziYv9MmojbKz5uTzettx2ypVnBRxxz6N5tFzBTDm UhYiF8NgP3I/NCSKqEJVov8MTUtTu1CkKaMOP5iM2S4q8tIhpYLK/tV7/DqEf/jNBfKTuDjV/bS 52Q5MlaoO5x2h9uLitKTYll1mpkW+NCXh7b8ae+MI/9wMU1t6hmy9idg/sDPLW46RXvO41LHgdg
 mNt/k6BTkV1FU4IdFE++XN/ijnMdXPaP0KVOZ0gzqEIpKB/dvxjC/gxfWTohPCZqpW8a+yWH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290092

On Mon, Apr 28, 2025 at 07:50:04PM +0200, Krzysztof Kozlowski wrote:
> On 28/04/2025 12:49, Dmitry Baryshkov wrote:
> > On Mon, 28 Apr 2025 at 10:09, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On 28/04/2025 09:07, Krzysztof Kozlowski wrote:
> >>> On Fri, Apr 25, 2025 at 08:47:01PM GMT, Dmitry Baryshkov wrote:
> >>>> For some reason Lee has mis-squashed two commits, picking up one chunk
> >>>> from the first patch and one chunk from the second one. Rather than
> >>>> trying to fix it, revert commit 2c8de7df7418 ("dt-bindings: mfd: syscon:
> >>>> Add qcom,apq8064-mmss-sfpb").
> >>>
> >>> I don't understand: that commit looks like direct, proper result for
> >>> https://lore.kernel.org/all/20250318-fix-nexus-4-v2-5-bcedd1406790@oss.qualcomm.com/
> >>> so where is squashing two commits? The diff markers have offset by few
> >>> lines, but it's still just few lines and they do not matter - there is
> >>> no diff/patch mismatch from that point of view.
> >>
> >> Ah, difference in compatibles. I see the error. Anyway, I don't think
> >> revert is correct. Just add missing compatibles.
> > 
> > Why? The commit that went in is invalid, didn't come from my patches
> > and was produced in some weird way.
> And revert is pointless if you immediately add the same changes. Just
> make the changes.
> 
> When we see a bug, we do not revert the feature and then re-add that
> feature corrected.

That depends. If the original patch went really bad, we sometimes revert
it and add a clear implementation rather than just trying to fix the
damaged state.

> 
> Instead we correct the feature.
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry
