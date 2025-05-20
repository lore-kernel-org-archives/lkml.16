Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38FC245012
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747749272; cv=none; b=stEOt+x6huZxf3DBiweMvxGEqi2/b8IuPo/IMAYuOC9k3Seb0H4CLO/EtiWihTdjmB3AxDpMkHImICJBrO6qcTh30Wgykie8oMOU4x71KTae/4xBDeEfQkCGTgJ0uh65RUxJwdPXLiMvwKWI6KTAZIAZ6QWFNSXGLyWlFhd4i64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747749272; c=relaxed/simple;
	bh=nXK9ufiKsqBXb3eX973WRoADBHDdVNJQzE5djvaxmtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=do8Hx2nUYCqsKvmRubuNXcVgLpz8hQn9PSAi0EhRHzRXtSfUgjJIBlCrbIIclXehRLgzxrMosPdP9EJXmNrfcX9D5a5SkuGFCQMhM49KvS9G/RJoi2WOu4Ul4VDzEjmUnw2RyKUJ/1QN7GkIbQIk0VFJVLTYyM0QB74DwUd4u5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHl5sYQP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHl5sYQP"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KDrW1a032102
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DKyB5pkHo1C3gQE7vRQgt15nCqX3yuNMYU7agnp+0tc=; b=cHl5sYQPg0/JV10/
	3rVuyClkaI2rkhPPUikLP98zrgiUleoazGsclNslgvQ5AeO3rRz30+heuBuVXr6c
	xssbcRzYbOulUy2rALRy529WEvAy/DypSPx1b9oP8bGoWTvfFPDyxQ0HeY2djq+r
	HyMTJtxAilD0JLP31uAlw/lkGo+v07Q0+5UFAAptT8MEqxU3ZkFkKuGnHam9IQkk
	4ug1JQxYAPM/+bJ8NkmcZr60yM8Xfy02Yp6L4vhRDNcTNgVVa+hgCLWC4jLXqG5g
	TlUQg4eGDOr6o4bHrauk0AOMLr71iYsgFQ/boofEowemwxAym49x6DA9q7JKOLf5
	FdUYfQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r1atm6rb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:54:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8c461eea3so51228676d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747749268; x=1748354068;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DKyB5pkHo1C3gQE7vRQgt15nCqX3yuNMYU7agnp+0tc=;
        b=QrsOx3egjXjTlzKDHaaDY0ZQMMubZPB4YsQvW/scvejKQfJUTWfAzVoeB0KRLo/9Pw
         tzHQu23hUspLXdv6qL7+NQaiYlby6pnGUJrFsg0wsOpSsEY3kNrfbfAitFvvwpVvDzO5
         6thBWUNGnsQjP+gY8wwP9jcaXrrtXJRYFMJHlU+eVgDqFqG23NjoFC+ehqaVE1FvT8pt
         5M8F0MWOOptc++/y2MOcwCkObAibhwqJkGn8t+DPldjHRENdF3P2oxl7H7CJF9/LIjBJ
         SKIfm0f4vCzs8AJHiwgGianebJwDxduyhUBlD2afFa9v9CkhvTQy4kQFqiFZQCudSD0q
         vuBw==
X-Forwarded-Encrypted: i=1; AJvYcCVrlMCisHGrmx35psxfgwQa4Wv2xYCPBcRmHloQu3Vl7eQxTft9T4Ask4vmJWDflTUoAofz7Lwbhx0gZtE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPijUhC2AJwX83CBtJWiAVVJ1A20dkPUfYkH4nIEVORll95VW2
	wQqx42vdls8fQaOLcPCArlr1wAe1UzfA7pJ2N0fl6PUOZelLATmyZ+OtiI8fq0FPY0XQnnl3JGJ
	Jd0Q1xoxEQqhBc2N0SS6Fl+hJPZkAKrzzan79qHOEek8JWeCIK+XJKzHDEb3XJt8h4dY=
X-Gm-Gg: ASbGncvsT/eK13vLBQonCT4Dl0dPsyodTg+BZusD/LsGsFTqrk+YKYRwYl8AXNOxRGB
	wqfdbVO4mcRgUzabac/6RFcQp7vwXoNlgQxRAxw8PwIi6SoVajQexW+nNAKJX0cD/l7jo9TaCIW
	8xseL1xGVTYZnhZNzyZ1HuYwmMHv9SaszNuVHcWNcL2dzOoLvZpbUqan5S1CzS/QntA09GPQ/cU
	o4I1cTVsyjV6q1HcQzI58ax0i1wNkyNBIduIZZ2kUc+jxJsEN9/szOgbWrxIry8gTA+i+grv6FV
	FaI+ceMkWsRNTMgUSIiH8A0moZIA9zeFLaM0BmBbmTe2tAxuh0mE9FnFybaFVyJfLeYADINxK0A
	=
X-Received: by 2002:a05:6214:20ab:b0:6f8:aa75:311f with SMTP id 6a1803df08f44-6f8b08285damr273661316d6.9.1747749268405;
        Tue, 20 May 2025 06:54:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGomUSZPp4L/pimh93YiRqj+5vctgnj/TKj4nxkAd6dxpcpxYijLITd5pRdwhPZDWF5haTR1g==
X-Received: by 2002:a05:6214:20ab:b0:6f8:aa75:311f with SMTP id 6a1803df08f44-6f8b08285damr273660956d6.9.1747749268038;
        Tue, 20 May 2025 06:54:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6e38f19sm2391303e87.0.2025.05.20.06.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 06:54:25 -0700 (PDT)
Date: Tue, 20 May 2025 16:54:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc7280: Add dma-coherent
 property for fastrpc nodes
Message-ID: <jlyq4byybki4cwjxjtjvr7zrjrr52ytu5qahvztva7zvxyw6xu@outa6whwpxa6>
References: <20250516110029.1637270-1-quic_lxu5@quicinc.com>
 <20250516110029.1637270-4-quic_lxu5@quicinc.com>
 <isvo4c2taozzlovqwqvgfu2v2tbvntkaw4bdpzmiuir64avojl@3utwffmzmhq4>
 <70ffec25-17c9-4424-9d0b-da6560f7160d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70ffec25-17c9-4424-9d0b-da6560f7160d@quicinc.com>
X-Authority-Analysis: v=2.4 cv=OfqYDgTY c=1 sm=1 tr=0 ts=682c8995 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=jUXpEXVJKfHLzrcEBIIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: EfEh_8D7LQPQwtsg3aD6v6PNCEo9s1TP
X-Proofpoint-GUID: EfEh_8D7LQPQwtsg3aD6v6PNCEo9s1TP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDExMSBTYWx0ZWRfX3C4AXIoXa+zD
 KFhu+dj5pihkI5wp0VBQJjoYNrmgfJhvqFnN9JlNpbNh8d6N+d5otmH4EbUjqw5qWYF7t9j3IL8
 azHrVjXuA6sBZkYBZQbcEksrlNNOy0CUWhjWoVJyOkeoRJD4WaRAUrac81qLGAS2YIeZvkbwNnC
 SQ5775Ny0ogLxoYjX4OtmIgTz63YVX+mfTBd8QlHWQvTELntf8n9BxxPuf+lyQl49eXlvHzNnvx
 bB5jhwP3J8C7lcWaJqWYYemFMS0TF5X+oGBtqCHwfWvWvUnurat/yrFcLepJ6HuSWvD4XApajrv
 qNlao8EWeqHDL3V/agJ77+1RVFgFgvLgxGAUd3iRjI6KV2bd/LL1XIEE7lCEHCa1cEOogJuXmZU
 5ymlOG9Jex9nKVy+zv1m2YWYmtQ4adQJaI0+yZsR05+pgIAf6zxmR/M4rzc3c3ZvPMAdk3Qx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=905
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200111

On Tue, May 20, 2025 at 02:47:45PM +0800, Ling Xu wrote:
> 在 5/17/2025 5:48 AM, Dmitry Baryshkov 写道:
> > On Fri, May 16, 2025 at 04:30:29PM +0530, Ling Xu wrote:
> >> Add dma-cherent property to fastrpc context bank nodes to ensure that
> >> the DMA operations for these nodes are coherent.
> > 
> > Does it apply to all firmware versions?
> 
> No, it's not applicable for all the firmwares, especifically for older one.
> This is only applicable where IO coherency is enabled.

There are enough platforms using sc7280.dtsi. Which of those have new
firmware? Will this break FP5 phone? Herobrine laptops? Nothing Phone?

> >>
> >> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 15 +++++++++++++++
> >>  1 file changed, 15 insertions(+)
> >>
> > 
> 
> -- 
> Thx and BRs,
> Ling Xu
> 

-- 
With best wishes
Dmitry
