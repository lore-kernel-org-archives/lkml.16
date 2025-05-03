Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373DB78F43
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 05:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746251198; cv=none; b=qEawQD8cr3fTePNGfgCb3aRDLf63lLK4FQ08jmC9gdmcHusF9D1xu4+IDCGl/pHoD2TTeDNDOn//xHCUzc/vvJl09VtGvEmA2HkDWWbbZdLYLXnuf78IRLqPHHK1zHpF7KRwepSLsEiLlPA6HM1i5rWvpBFxDIRX6aPZj9C8EGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746251198; c=relaxed/simple;
	bh=FZkziwf+DNshxofsJT6BEaExHEp9WU3/A33fWGZvXpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQvYlF5yu9mn+S53fA5Ku8XibZdBARStGH/Yelp868wwzZnah4yupvPymWTsAWhGO7dy7taEbTUNJ8qX1YEZiys5npTSlBr62roZ/cZ3CdoDxTE8YULMJQ8gnGcs0gx9kAKxZxUXyn9j1hwEaI40LnXjPoFaEHoLecuh1+szydk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzhZkqfs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzhZkqfs"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5434lcYe006376
	for <linux-kernel@vger.kernel.org>; Sat, 3 May 2025 05:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MF/so5t7HZgWT3eWuH3tumGi
	2Fh4xLxU/AxIoXWE++Y=; b=BzhZkqfsgSeMovLa1hzrnq/tT0WtuOTPshrJJ7No
	MkFhJQSbbVtVLBVeC0qBdKlFiAtj1A9sNaQ5sn7QLqHcek8G2EY32NpfPSrjYD1a
	/Anw+zDNVnBTlr1zYO/tG18SRW7uOFRoY+jV7NYmOFGdHKxCAZk/nNcZd2CfoFzP
	GHseGOdB1aJ6kE8LJLqPnFReeMzRonobKimQL7xVlO8uRYUMaSZVfJoj07l+Kgyn
	ITF6f5JhQAuKjDaJXS1YoI12XHfskVO59q/gx3NFz7svleoeJvmo4JXItdFTk+BB
	H98UiSmvWxwpJ+6tgTq7GkjdMzrS1e5g80gu+InXhz+AqQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dce98237-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 05:46:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c793d573b2so386716985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 22:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746251195; x=1746855995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MF/so5t7HZgWT3eWuH3tumGi2Fh4xLxU/AxIoXWE++Y=;
        b=a3Fuy4toPXgvj41fNw0bMcVFrEK5AsXazRpGhbsBjH2xpWRgD7AcRnpiGds2LNUV+D
         t9S8QAtePjNZxWHtQPLXPNPaJr/zxRa4tMNZKkjIl3P0pdGDScKYSLYPVZDCNI/kkTVu
         fU5eG6k84dm6NECFfiR0XHJsknaWOT/JnlGy3XrEOAaE2LLga+zFdxOQSjEDPsGNBjQg
         t/VPhvk8rdVdvd66YDbYGbsKuk+gfHz+cagMdhiSfJKYVtCqc5c64QyILD5aVkcjYJIC
         NmmSxdZIZuTsv9rWRZreD8pC49kmxygPR/qhLOfRcyOyX655woeRxVQBf4vfXP/sV5fs
         k8nA==
X-Forwarded-Encrypted: i=1; AJvYcCXnskiGylRmAtotObf1SU+NTlZZwEF8Rf80699dcZBsJfBaT+UIpxz5D+PGWcuAxHYSpJpwNUTpGHH8Rf0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5oFa0q2zs0h7GchpTchye/nMdrRyMvQhAnkQIax3gIVcDQCAD
	H9E4/yBhYB8kIQmbG09BwfxwNEpyk4A/6smRVY3BmTANGGSt5CUEavEqCEETWW5uGPZiPN7CB01
	gp2I10CkmCrbIoNQhoHIT8Gf4qX6FZ5zKQ/Y38SYQVa/cJJrTwoQUxFImblSq8Oc=
X-Gm-Gg: ASbGncsG+e6i9cczLK/glVZdtU/pD85aXJIp0YQr81IM/zz5QiS0itWQx/tXA1E5kjV
	le++ZeE9wNRiikb/g0FI6lhrUH8qwKRhgfzlELj9ZU6tq6oDTfEgfbD2wofkiPklXEX6lTMbK5b
	73QkfC7k4br+u1f95zAX73owol8qUKwxH8WcBWYnKyA95ra4t2qHhrrEFM4lX0NXg6LcnC+vwqn
	2Igr1gnWrdP4aq2Wgji5I7gK7rwiniUeSgj1lppChqt1n7aERQoM2MArj6a+QzwTIsCD9Va266r
	XQ49suWxCXtVIpMsCY198jxQBdgvteHSDekc48mOj419riBWWCYbci/CvAIwgUd200EdXgmnomw
	=
X-Received: by 2002:a05:622a:4a09:b0:476:8225:dac9 with SMTP id d75a77b69052e-48d5da48b21mr26804891cf.45.1746251194790;
        Fri, 02 May 2025 22:46:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMgvUFBcAgYiEH2v/8tiGWbtw2LOg1LR2AfqMw15DOu+nL+S40ZYWy5mZq0KGU7+YBjPKWMA==
X-Received: by 2002:a05:622a:4a09:b0:476:8225:dac9 with SMTP id d75a77b69052e-48d5da48b21mr26804721cf.45.1746251194472;
        Fri, 02 May 2025 22:46:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202a89f450sm6249821fa.80.2025.05.02.22.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 22:46:33 -0700 (PDT)
Date: Sat, 3 May 2025 08:46:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Srinivas Kandagatla <srini@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH 0/7] arm64: dts: qcom: x1e80100-*: Drop useless DP3
 compatible override
Message-ID: <qgojusp6c5mglve35sgncwpuft2flnvfysstbyieysktdlxwp3@lp73etm4zzai>
References: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
 <wsdhqocld54ygjrnn6etydorcg6j6uko4ner2dawoomflvu3bp@tq5jbqcahip4>
 <aBHvwUAISo2JhYSz@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBHvwUAISo2JhYSz@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA0NiBTYWx0ZWRfXz8xXOh5d4T8G
 NSQ5uTSIGkqJf9projXcHczOnw57s6ULAyatNBlSHzmIoYKIqMCa5u+Kex3aKQ0KA7wvX3ZeGYV
 hjVxq132BvMbDRj1ELK5QtBSbJBQTOiwjf5Wx0T+Z0AXPB//BsXD8QyJznrQJnLQlQVquygSxIu
 rI+X1SrOZaaSdz0lVS0RPAa7ekW0Jj5ou0jIuBCmX6ofeqA9WqB0Drejto2Nq66QPPkYoehlsh4
 fX+4QPmisguT+i+10VxFyQTC+7thr3QlBJvMVR7TywhZc4xluVbxF+jrszm0dJ7h2oqAasAXQE0
 gqADBDa6tmtlWMf+g1+r+FlvrUTihK4UhchLBRsahyOpHVbmMkk79KLTCa7jXm9wtz2EArlTkYx
 c86qeyCGDrYQ/Hdrc3uKYjaI5I2+24QtEDBiHiB8LHoPiVOt70VyIrjI/BvEbcdgu6IPguCX
X-Proofpoint-ORIG-GUID: WSHo-p0dqGSGT9kMewN5u3EuPPPFHjS9
X-Authority-Analysis: v=2.4 cv=Qope3Uyd c=1 sm=1 tr=0 ts=6815adbc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=ZJu6mct0EmN0ZqeJLYoA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: WSHo-p0dqGSGT9kMewN5u3EuPPPFHjS9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030046

On Wed, Apr 30, 2025 at 12:39:13PM +0300, Abel Vesa wrote:
> On 25-04-30 01:26:13, Sebastian Reichel wrote:
> > Hi,
> > 
> > On Tue, Apr 29, 2025 at 10:42:28AM +0300, Abel Vesa wrote:
> > > It all started with the support for CRD back when we had different
> > > compatibles for eDP and DP. Meanwhile, that has been sorted out and it
> > > is now figured out at runtime while using only the DP compatible.
> > > 
> > > It's almost funny how this got copied over from CRD and spread to all
> > > X Elite platforms.
> > > 
> > > TBH, the best reason to drop it ASAP is to make sure this doesn't spread
> > > beyond X Elite to newer platforms.
> > > 
> > > Functionally nothing changes.
> > 
> > Looking at the diff I wonder if this part should also be simplified:
> > 
> > /delete-property/ #sound-dai-cells;
> > 
> > This is done by all upstream X1E boards, so maybe just drop the
> > #sound-dai-cells directly in x1e80100.dtsi?
> 
> Yeah, I'm not sure about that.
> 
> Though the DP3 PHY is currently used as eDP, I think it could be used
> as DP. So I think it makes more sense to keep the DP3 controller as is
> in the SoC dtsi and delete the #sound-dai-cells property in each board
> specific dts. Don't know if it will ever be the case with this SoC, but
> maybe someone will use DP3 with the PHY configured as DP rather than
> eDP.
> 
> Not sure if I'm 100% right about this though.
> 
> Dmitry, Bjorn, do you think that is accurate enough?

Yes, this sounds logical. DP3 is repurposed for eDP on a board level, so
the SoC configuration should not contain any specific config for that
port.

> 
> > 
> > Greetings,
> > 
> > -- Sebastian
> 
> 

-- 
With best wishes
Dmitry
