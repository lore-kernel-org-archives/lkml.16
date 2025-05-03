Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADBB27B4E5
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 17:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746292904; cv=none; b=YBioxk9+YmfdtfaMVBHC27z620m6+Wre6x53TGWXcD0yYih32d2yqEnqGx39XTM0rpYMZTA5f2xZWDsWZOK7lSObVoRk4LKZJVmYiso1RcLV4BmaXmW6FYNC1olNLmmWVC4cr+bua7I2lw7MYnCdzmcbEw4HNvflyU68AxfHdkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746292904; c=relaxed/simple;
	bh=FkqPTKKa1BYfGmOPnQ1QkH3rInAfKUq2BRkp0CBjjRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EQE4CY1istfItTDSKVxdmNnkGwFTt67+tJ10jsTMMPKTCLIgG54pRdI39AP93WSm9c+biHi+bQ0e4FxNz3kZdYTo/LOZ6sDn4wAGONKIKcTgcqwkVT94iRMcff1djCwnJvgEJ3+YNl1//Ot2YFrx8YWAA/uevmc6HZfbGgyLOng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R2gKFMkr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R2gKFMkr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543C6kgj029653
	for <linux-kernel@vger.kernel.org>; Sat, 3 May 2025 17:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CUPi73K0M4K8c3dJhvQF7DaH
	PF0crJym+waMYMfinqQ=; b=R2gKFMkrIBVeDakGd1qOJMFM1lsPaCsuL1Ou/N7k
	51cL4eIgHohEQVKhFQ/5k6V7LxXGxChYmtnHfIYctDgt0tWTcXArYUH9RlPy1Uwo
	cFq1yr3ge9eHVBNkx+jDCWSnXMWKMygsyc39vVaLEtwcpK6fKiN74YbKkPLZ2PI2
	MNdvXiWIdIkAUU/JlSAICZoKdeRthpFkQ1N87LhHxURqHGww/6EtHslqsi4SMimD
	51Nlf4JveqRfxvTDfYT38w+qJPfhIYarKLqVIs+c0HqrwYFP30oTmx+sTqhdhfRn
	+g0ZuUf4U4rutQMYjTa+VGo28MQ/KvEQ3PL1ZVKleE6BUw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbh78va7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 17:21:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4768f9fea35so79475651cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 10:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746292900; x=1746897700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUPi73K0M4K8c3dJhvQF7DaHPF0crJym+waMYMfinqQ=;
        b=LdQdviutv6+r9B7CtxtOyarMxAWgz5v330XT3xibXXsbnTHujP3Fz4IvP1eNVESIiq
         fbWRGlZonRtTDApFsnBEV8mdRR9pfRRlj7MY06NpdXjV2VWIqARjCaRWEYBB2BJFfZ78
         RxglE6gJt3rwEK1dGE9PHf/LnJ6Ar8btmYHK+9+4/juB26yI3Ty+4HYkdauUIz+DTaQT
         I2XKu6CdCnIzzvGUlVZgoI5vgLsXL1vco4W0YU7gnOTOaBJM1M85Iiv0ioYK9VYuXNBH
         yxF26VLg+IGHzc4MxtaKQnpsJ8A4FvHcM0JbULZcIdiWlqecOhsgG2PgJB+onZGtOdQQ
         MuRA==
X-Forwarded-Encrypted: i=1; AJvYcCWXc3lq3he/VrfXuJpOdI7gy9hOABGZ6mrc2w7AokyJzWHj5ztB69w7RBiTtOXVAzZry5fuoc1V3fkVILg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz088ziZG4EdRky1c6ZdXUk+BDbckzHYXZ7+pyabWkuD4AyfXK5
	8PBd43dcHUCmQq3OKm9jSmSK6NEeQ4tQO+m1LY+VnzuXTl9b/AIgxDMiRKiPvsfgffZB6YO3oe/
	kbCFl7X2erI1tiIII+dhe0yzDSiTO02sZ0AMWUc9ZFPVJrfYRFV/MY8v7Sopriyw=
X-Gm-Gg: ASbGncvVhl43KJRQRyG/hee4p31ygsiBplgfjWX3I6iouTkr/1PLKcbM2nYXwJI2J/t
	bFE8GFdnJfao9HKx0jJoQwm5/Sh5XvthTRclOSuERqq74fmQIdvOj4kFaJB3kubEWc7HSfi/E3y
	btKV+qDSMYGNovzl6c3E9Yhw4TYWnXIP6LWH4Fd9ObWcRJ8UQZGj1P5tNczCvUOx+Qt6MdB6Vx4
	IlEYrVDPsLGMLBuTXpdq7tKLCUoLEVp8j56emkMUYfwJTmgKjrN+hZFFAlxlXT9vXHp/vQhfSnv
	x3511KwMzZYwBo1vblGvz4l9WsNkHsZu97OPzIsc2cedPfPCuL+1VAJq4gfkTEXTJ+eEldchpu4
	=
X-Received: by 2002:ac8:7dc2:0:b0:47a:eade:95eb with SMTP id d75a77b69052e-48e00f625abmr15879601cf.40.1746292900330;
        Sat, 03 May 2025 10:21:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmoBZgMqriscERLtLJYJxOOTXkywtkwOsXpQzulxWIgQLOXUAe46ItjymMZEGDMLwcrBNHcw==
X-Received: by 2002:ac8:7dc2:0:b0:47a:eade:95eb with SMTP id d75a77b69052e-48e00f625abmr15879411cf.40.1746292899907;
        Sat, 03 May 2025 10:21:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f22a8sm878183e87.176.2025.05.03.10.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 10:21:38 -0700 (PDT)
Date: Sat, 3 May 2025 20:21:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andi.shyti@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.or,
        andersson@kernel.org, konradybcio@kernel.org, johan+linaro@kernel.org,
        dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Subject: Re: [PATCH v3 6/9] soc: qcom: geni-se: Add support to load QUP SE
 Firmware via Linux subsystem
Message-ID: <vpm4ee4bjuqje7zrpay3pllvcghh547yce4nbqgbeujgdbu3lk@fahrgwfjbrzy>
References: <20250303124349.3474185-1-quic_vdadhani@quicinc.com>
 <20250303124349.3474185-7-quic_vdadhani@quicinc.com>
 <58f46660-a17a-4e20-981a-53cad7320e5a@oss.qualcomm.com>
 <9cc6bdf8-ba4c-4561-962a-74ceb09b72a8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cc6bdf8-ba4c-4561-962a-74ceb09b72a8@quicinc.com>
X-Authority-Analysis: v=2.4 cv=fMY53Yae c=1 sm=1 tr=0 ts=681650a5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=vrWCv2ldUtsF7w5ASE0A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: lJxmzKdTzIqYznxS6itpZH8P_p1t0D0P
X-Proofpoint-ORIG-GUID: lJxmzKdTzIqYznxS6itpZH8P_p1t0D0P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDE1OSBTYWx0ZWRfX5Mhlffx6gQIg
 s8THBq4VoE0y6kxrOgR1iT/8fqnPLY5wCeQgdEqImSt+iWO01rY7QhrUA0SxGVJ+/lBYlkfj9rp
 LEiMtyMo2II15CWMU4kgciApN706idMbKonH6Jk5o80+aLNdHp9+Fg/QGO5NXVve2LyMpIj6zGj
 eUUfhQ87TLbp5AwFzT/Fa+H/SfLAneksTPaKJb+VfwmWUN19eTG2U7hPuqenWAPbyPpQx3rPSvN
 Cq0DOZdTetJQlb4/MsMu23t3KlRSnrroUfhpftOkX0M/jIBFWjnwf7hC9aa04BOpG21X0MwHOWq
 EYQ+AZ6KoS3DknQCZeevRAO3MOiqtgvULznDhf2boWrOTdMHY3EHrY7ntTJVohnwFeDWRHtpS9g
 7/5hz5cSlWuk5VDWhqkskln0VWP4M2nx7yiaMaYMQ+m6syOUHVsEjzrmL8VLGaRcXNJmglCQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_07,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030159

On Sat, May 03, 2025 at 04:47:52PM +0530, Viken Dadhaniya wrote:
> 
> 
> On 3/8/2025 11:36 PM, Konrad Dybcio wrote:
> > On 3.03.2025 1:43 PM, Viken Dadhaniya wrote:
> > > Load the firmware to QUP SE based on the 'firmware-name' property specified
> > > in devicetree. Populate Serial engine and base address details in the probe
> > > function of the protocol driver and pass to firmware load routine.
> > > 
> > > Skip the firmware loading if the firmware is already loaded in Serial
> > > Engine's firmware memory area.
> > > 
> > > Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> > > Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> > > Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> > > ---
> > 
> > [...]
> > 
> > > +		break;
> > > +
> > > +	default:
> > > +		dev_err(rsc->se->dev, "invalid se mode: %d\n", rsc->mode);
> > > +		return -EINVAL;
> > 
> > I wouldn't expect this to ever fail..
> 
> Yes, that's correct. But including a default case helps handle unexpected or
> invalid input gracefully.
> 
> Please let me know if you would like me to remove it.

If you are asking for additional comments, please refrain from sending
the next iteration until you actally resolve all the open questions.

-- 
With best wishes
Dmitry
