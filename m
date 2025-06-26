Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35E3219A8B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750918107; cv=none; b=mtnuj4segkKSEAoZ/hlkOIw5co2k0sJAmvJpDOdmTZGLcihw63RX4DvgV/yYNR9u0AyTtoNir1VEK2v983vJP86JzgBrN/sxYGNq6wo5RUnD4wbN4HYhiLMcWJPowfnJQ+lnxxcdrqx7abUKeC94wIgYF8yLJTBXBotUR2wcUJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750918107; c=relaxed/simple;
	bh=hQt7Bb+9AHZnoLo9cKQWepwSiZXlnwjoIITYMD6kz1o=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sC0soU262/IYjAlZ/8r6Fh5nPRekgn4sTXIowJmpCdA46D04sqPGTEvqb4ki9H4ndfu414CNFd+IXpkGnK0FHwLkYgBacrcPrPKOG5JSMHwVgBTsXFm0TwrLY0bnWudOmlSAY2qi7l7seRPayeoz6tSgaVw4YWhk8ZiFL63fkyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ctxmq2RL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ctxmq2RL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q0DtA1014018
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JgSSowuZf4akXznD5e5++XsT
	7x22KvtmyyRb459j924=; b=Ctxmq2RLgZ6RxWpMA06IHd8X0JAGu/tBkkA0dPUU
	qrPcAsIM3REiCkumKTxejL6N4onSYH+KAdiRNlz2iSR3twby8ocsisgEgmvp3rcj
	E9WXyKXVEKDKzRhU05K2Bye9A7KnPVpfKylg1YRvuiWf/aEEDxiq/gY8cv5athIB
	HdREA1Xn/pt9yE97iVbiwHJuXaMnkGcC5tfYrs4rh2ELEtwrAqs8YpuM6SOHro+p
	1KA2nLFCZwDpZYVllCJnbiodpQ8JkCCntG3kyRKdpbX1nJIj6nPASfz7K10zRFKi
	kYTaM8BsRE3Uz/c37BkOEFpJrOAQ8J8it/dd9h/G/Y93tA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgj5nk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:08:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3f0958112so94421285a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 23:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750918103; x=1751522903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgSSowuZf4akXznD5e5++XsT7x22KvtmyyRb459j924=;
        b=q+s+E0WgN/sh4gID0wRlZ29n9Saey5Yv0chPGpHV/7YhnHmkgnOnu2Hw/gsPkkOPM9
         FrqdRsEE7LpKQcKOikYgYP57c0GBNvFWC8EiaNMRLT/nHBq/6eeU6LuHNZ1otzX/F6az
         gjNbNqVFXrqdqZDmfqaJKZN3Jll+3psveyGbv8dZeGNE1qCUdF4PtW/Sbti0wnMdLkqa
         dqX2F486JjV9di0TBkF4UMv0PN3K0LXRvu46+oHCMLNNV7kI5Dm++6cyn5sAhzGcSRt1
         ox/r7iGiDA/qk34N1ZqAcU//FtYQ/oKwTtEDzX9TDvFuxtYn5tO+rJBujLBkQxdLcLlC
         nXUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjkKpcI8KCR4gBTIs3qjT/tRbN11iWRicQGwv9krQpEbazCLRzPe1CvNM3gJx8NM+pr2Da8+gK69RxjHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRA5GDMi4WFW2BDNmm1C7zcOz15+1ytFwzIdagfwx77I/CB36l
	c9hPDW1d9IEpQ+yHiCiWYQKzkvGka80VD8CXyUGu2tA9Yv3ch/h3uTWJsMv+Nu/5+c9ie+Is/Sl
	uT7kYZtQnl+Wqt0PKHCQUWIsgYO1F5tg5a20Q4W6IwNHfpx3eYVhm7Z4nLvkslEBccC0=
X-Gm-Gg: ASbGnctEYu4Emiwi8Y2q1jvj9/hauS4SgXjiDtkcZ7l/dxCJlEI9n5Q7k5X/9ToFN21
	jEtRr1Bj82GkMH7eOLxope51pn7ff2asfMoHuZrEZR0gW1sWEIhhJDaCAJOqqD98fw6mmtp8AsF
	9ks4y/sTboPG1O96Taon6iDi5cp2JXOhhQklUTGEFT/J2/TZmwUfWcv46397cZQxsBpS6tHVr1N
	vAZfDBM/SfP8sMUr0tmVCSUMX3D1jfOPW+npsw+uDXNhLssRZle0dF9+cuU7KoLVLBTdK/+lyRj
	e7ch2hgHLJGNn/DXym8XGJXqSJ0SjPCq8x1I+vAzS0VEF4qsSiruITnxxg==
X-Received: by 2002:a05:620a:178d:b0:7d4:3bc6:1df4 with SMTP id af79cd13be357-7d43bc61e4amr309276585a.16.1750918102929;
        Wed, 25 Jun 2025 23:08:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/nANbsNfBPYKM6JWc6VRoFZoFTj2niADtQPcOroE/JQv3VpyDDjmmolr+6Zi96Ucr4lEHUw==
X-Received: by 2002:a05:620a:178d:b0:7d4:3bc6:1df4 with SMTP id af79cd13be357-7d43bc61e4amr309273185a.16.1750918102498;
        Wed, 25 Jun 2025 23:08:22 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453822c6b9fsm39477585e9.0.2025.06.25.23.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 23:08:21 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 26 Jun 2025 08:08:20 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] media: dt-bindings: venus: Add qcm2290 dt schema
Message-ID: <aFzj1LxEbxa3rHhD@trex>
References: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
 <20250623105107.3461661-2-jorge.ramirez@oss.qualcomm.com>
 <cbd6b7e3-850a-4bde-a1f9-393c291c1ee3@kernel.org>
 <aFlHlxO/V3MMARVK@trex>
 <73aa4738-6730-44fd-bb26-451ef49d588f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73aa4738-6730-44fd-bb26-451ef49d588f@kernel.org>
X-Proofpoint-ORIG-GUID: XRrE2IL4Ju2e2ebee_CJGot7GmUM2VaL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA0OCBTYWx0ZWRfX7cK08aHX+RwE
 w9cJsZeI7cIWe+di23nJoTdrXi0BANCOWip9l2knRnquzYsNURL7+6FemkyNdZuMT4sOH4qe43k
 ybXrRDALp/M9TXWBQRpkVhkiIP7ztGsSy6TngqYjGU8pnyn+RZ/W6CnH5VVo6hj1FGOf+2dkdUK
 M/fMPCEhNizLhedLyPPUxj+kt44DS0hedtXB9bQWLEsDp1axw0OOm77ZZvx4AQU0SHdzTMcqu+t
 f+Ydi6UaEh8plVD4FUHlg3fUSxn3+Mtoio0b12oocqs8SSqlWkHecw4LaH3GWUsOHH+nqyRU1vr
 UOXAlOmYC8vvid04CMlSB1h4eaHIJESl36JIPCkEgdqp1ZU218RIWRriLYa59EZkmEf0W4TQSDf
 q896hbEbMrIMo3v9ZmlzChXkOZpfhYG1udLoT34O632OyHhHJ7r1AuMqkpkRhYtF9zSxZl8R
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685ce3d7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=LfWDrbMk3Fy7126_j0sA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: XRrE2IL4Ju2e2ebee_CJGot7GmUM2VaL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=887 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260048

On 24/06/25 08:03:46, Krzysztof Kozlowski wrote:
> On 23/06/2025 14:24, Jorge Ramirez wrote:
> > On 23/06/25 13:49:21, Krzysztof Kozlowski wrote:
> >> On 23/06/2025 12:51, Jorge Ramirez-Ortiz wrote:
> >>> Add a schema for the venus video encoder/decoder on the qcm2290.
> >>>
> >>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> >>> ---
> >> Don't send multiple versions per day and allow other to actually perform
> >> review of your patchset instead of sending for every little thing.
> > 
> > No. this is not what this was about - I already explained to you the
> > call I chose to make. You can disagree but you should not misrepresent
> > it. 
> 
> 
> No, you did not explain me anything. You sent v4 with only one little
> change:
> "Changes since v3:
> - Fixed schema commit subject."

um, I dont want to delve in this (only because the conversation takes
longer than actual changes but just to close the loop), I did acknowledge
that you had trouble receiving my patches - since they were threaded -
and that I would be respining on the same day in case others were having
the same issue.

> 
> The same day, also skipping review.

yep. will repost later today and thanks for the persistance (dont think
I dont value it!).
