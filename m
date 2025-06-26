Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4360615B971
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750936533; cv=none; b=FQS39o+WLf1lvyO0t0ciQAL8GWtKvGk6o2APr48BqzP+RZsOEj8SA3bkZJiEk3i0LiczD1OqGEv+LGpzfsHU239t8Un/iyvUcYaDpPviDT/jINtqAWgsUziEJEP+jJZUHyYZWUJnX6kmNbQMIWHrrKJGoSlBkpKkGFHhtXxOdlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750936533; c=relaxed/simple;
	bh=32XSTeEJZcISds9DTA+DR+OV7Dix3D2J+SHP5xIR+Ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gaf2qakFoYXMZO7nrCZ+hT5VqeR/kOgPr//9F2su4CKxcFMdbpwdAILATG+T+qI7dZUUk00fTqdxekMJhcuOutK1N1s6hs6er7x5tIN+15h8pm/rlSwkl8KHz/xvebPQQzGrgHJ3zHd0fs78Nq9/50gv3vcFfHt0A0mYL/Z5PJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pJC14zyL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pJC14zyL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9fxO7018859
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:15:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yX2bTATYBJ3NZgM8w5gxCAy9
	tlE6wz9SQyztWxSWqxs=; b=pJC14zyLetOqOQkfVFVIWR4kRcR9ISuyan7XajKP
	J29GuxWuvz3TX6IV3kSTZWw/YiUoTL3g2/FPPM37PQbnu5SiSuH/coMnvImyPxsa
	5XctR+fONpIxb4ytYqXxLLb8yiExl7AwJ3RAahd/ZeFMsMuL2nKU3ZGbV0Althav
	OfdoW2GjMMkg2qLJz30fPSVHhTPHXwKeag1u3L+vem0mpG0HcMa8/71g2NkqZIPk
	+OPlCKYLf30hkIlWzZzRjWbrLzqvw9GzhCLOkXxfpmUHyLQ7Iqu2nfp+xfCfRZFh
	XgTJrmEo+ujxuhrXWBcYp/kTjuME44hLUEEcj/mKnx2H/w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdd0q6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:15:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d40d2308a4so131273785a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 04:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750936530; x=1751541330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yX2bTATYBJ3NZgM8w5gxCAy9tlE6wz9SQyztWxSWqxs=;
        b=qC+a1pwlJ42CTTYuzX9l/mMpq2nDkdWiHi4VlAiEb05sOM5z/i+tFIXMJKzIHBbZBW
         AAdg8oU6dWGtBImI+1H1IVrCTmwJpx5o/lzxS7Hfmo8mZFQvpQfGAbuqc9vQ1vR7+GUQ
         yTyGpkQHDfQOPwV1uqo1VthrSy6vWIh82wq8LroD1byWeidQYZwb8S8Bfp7VoHk2/l1o
         fx/kzqX1StINNwUuH1Sgyyf6zMMd8if91kTi/M8km1uI0/uyGmcCdaQmrIA20Fem6BcI
         xnxAIudSK2vtM9pq0JSvd0ZeXRCCsgqh+LslDUsOvDZ5QjOe0ADfo1NM6jHMdpNf/NS4
         4JMA==
X-Forwarded-Encrypted: i=1; AJvYcCV5Zn+wOPRlvrWvMGaUmRL7xAt1m55pImYDURA5c4tbY0A9VU8ywWnU9uJ/cEKhJ3sotBrQdzml59Bas5E=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj9RiHAoJQjz1FhoYSejzXffZsgXHTUIqB/VtfmxpKWJtqNo4g
	zxW4lQux9aTbmova1xV2qSG3dflRNKbrXXsg/Bi4aDDA0s2UzwCybAYd5ZUlp3pMudkXZYRQoUS
	B9+XtEB69yVo7cg2HExgtz4oyiiztgSN3PJ6cttovnO+crurtCfJT2TX0+8EePnM3LZ1kMhgeAA
	QRSA==
X-Gm-Gg: ASbGnctmilx0VKLC6I5Hzofr+ggVt3uptJmls6WqqmgS9qRK+8YrtI3f8oftI0nqaHo
	PueKHwlpxY5PyLaEf6PAwbuGxxcIq50OnOFsXWLrNrV+UnVWiis8u0mcBcdDmDkmx+DKjVyO2Iz
	Lz0OvY9YxS+edspmetfgqiJkuZX0VM+SCrNOOUBJJUf9n4bL5RqqYPqJ7X6zxD8xWfkkrUBfLMd
	RmjkmuPutqbMckbSBqv9BmU0xyXOMVWfJbkVkBT9bQUEZaasFkAKzOuqEsElb4nV8inQgH8cDFR
	eeDn29WfHv6zie0UkLR9Xt37cqFbKl0rvE3xonWlN415bpWh4/ozDr12LrZ5U61ave/KL1hZ7k6
	VrB2HllKgwgyBpCig9QvpJsRRePf1Oh0nkTQ=
X-Received: by 2002:a05:620a:628b:b0:7d3:c4c7:75d6 with SMTP id af79cd13be357-7d429743dc3mr986147685a.47.1750936529335;
        Thu, 26 Jun 2025 04:15:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFctx73pTCKHtA6mKNt7OeTyPjiWUhKOAyFo+qoWYU70OgchfQGmJXs/kzhbu09xU4sks2pVQ==
X-Received: by 2002:a05:620a:628b:b0:7d3:c4c7:75d6 with SMTP id af79cd13be357-7d429743dc3mr986139485a.47.1750936528687;
        Thu, 26 Jun 2025 04:15:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2deadf3sm1866441fa.13.2025.06.26.04.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 04:15:27 -0700 (PDT)
Date: Thu, 26 Jun 2025 14:15:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] firmware: qcom: uefisecapp: add support for R/O
 UEFI vars
Message-ID: <zufyvg4hoxxz4i45pynzta3gyglqvecrmeslnpphsgwmtujivl@t2zbdtejt3x4>
References: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
 <20250621-more-qseecom-v2-2-6e8f635640c5@oss.qualcomm.com>
 <aFloifxONXnQbVg6@hovoldconsulting.com>
 <aFlps9iUcD42vN4w@hovoldconsulting.com>
 <diarijcqernpm4v5s6u22jep3gzdrzy7o4dtw5wzmlec75og6y@wlbyjbtvnv3s>
 <aF0WGmnN_8rvI9n1@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF0WGmnN_8rvI9n1@hovoldconsulting.com>
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685d2bd3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=TWiC2UeppOsHrghBY90A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA5NCBTYWx0ZWRfX/u+zaiqWQ6Eh
 TY/HlPC58I1sc0xnLTkEeSfswhjHJdaMgpyUrX0IFKGluoAitKVPdAL57R2h1H+BIWEyfHDgRrk
 gSMeM60BCaxY1cryuCADocgawiNulUbqDg/EBFI8JOEjr+Sikpzbc/437D4XMD77Mp7ectIVJpf
 i+2F+AzOIn5TmEcA5M3m2TD84ZBzmTxp4+Cqm4fLSHsslcsRvl+ThABujtSNDwlLxQmV+OYPzPU
 46xa0Jqyto9isOuq08vZwczJyhdRqD02Z2i0rY/1gXS87tnsgeHvzsDCGDaDWZzhoW+8IMnbvAY
 YgMVnSoN08qStsfzEyykEbpSP+XsW3Ku9Zugoh9LXwnERxP4XGJ4tioovv3nP+CGkbEoGdKJ9wX
 iuDmKOr6g6hAXNCf75/TRtIAWcdApZFN7ClFy01njgZu8shjR6CjJ6CMa27eohOXDxQC64Et
X-Proofpoint-GUID: TUwos0WxZ1AYA2ePye4n_5lxDbKj8RDa
X-Proofpoint-ORIG-GUID: TUwos0WxZ1AYA2ePye4n_5lxDbKj8RDa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260094

On Thu, Jun 26, 2025 at 11:42:50AM +0200, Johan Hovold wrote:
> On Tue, Jun 24, 2025 at 04:13:34AM +0300, Dmitry Baryshkov wrote:
> > On Mon, Jun 23, 2025 at 04:50:27PM +0200, Johan Hovold wrote:
> > > On Mon, Jun 23, 2025 at 04:45:30PM +0200, Johan Hovold wrote:
> 
> > > > Also not sure how useful it is to only be able to read variables,
> > > > including for the RTC where you'll end up with an RTC that's always
> > > > slightly off due to drift (even if you can set it when booting into
> > > > Windows or possibly from the UEFI setup).
> > > > 
> > > > Don't you have any SDAM blocks in the PMICs that you can use instead for
> > > > a proper functioning RTC on these machines?
> > 
> > I'd rather not poke into an SDAM, especially since we don't have docs
> > which SDAM blocks are used and which are not.
> 
> You're with Qualcomm now so you should be able to dig up this
> information like we did for the X13s (even if I'm quite aware that it
> may still be easier said than done).

I'd rather try to find information on how to update UEFI vars on the
storage. Moreover, using the UEFI variable doesn't send the wrong
message to other developers (if I remember correctly, I've seen patches
poking to semi-random SDAM just because it seemed to be unused).

> > I think the slightly drifted RTC is still much better than ending up
> > with an RTC value which is significantly off, because it was set via the
> > file modification time.
> 
> I measured drift of 1 second every 3.5 h on the X13s, so having an
> almost correct time with massive drift that cannot be corrected for may
> not necessarily be better.

For me it provided a better user experience. Yes, I'm using C630 from
time to time, including the kernel development. A drifted but ticking
RTC is better than the RTC that rolls backs by several months at a
reboot, because of the missing RTC offset info.

> 
> > Anyway, let me pick up some more patches in the next revision, maybe it
> > would be more obvious why I'd like to get R/O support.
> 
> I'll try to take a look.
> 
> Johan

-- 
With best wishes
Dmitry
