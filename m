Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B8C200B8B
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747254808; cv=none; b=dG2XnDp4Owrlo5B1F0fSQkXzsJVHXMedQCU0MBNVVe/LIlIwKimTvUeYsBQyck7sany07QlIynYLqOP2JcCWy5w4T9Et/eWtzjfGp9emyGPnyFrauXhm9MdZwor7DN1RCC+27qePPV8GfVIgryWndVZqIyPfMgSZNNW3+VqSVMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747254808; c=relaxed/simple;
	bh=Zlw6KukSqy0MoALoUU7w7NqQrpbT7N1NaFkIZMziFxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CG5J04J6J3uuu60Jh6N68Sstv1nWiL/kMwBENHsCwJNBZWVh8YbKDW3MNCXqpRfc+LqOS/XUPpqDN4arunDvIfP1oENmsUFrjpS6e42pohBz3rnsWuTtHrIFH5RRJAcC4gO2Bfh3pFJEzOBMXFk6UTI+64R057SA02GqiZs+8KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fonrt5dx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fonrt5dx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJREcY025425
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dRKzmwRDtNONnFtD+GVYYT/F
	68o9yjtA9WFV64BwRvQ=; b=Fonrt5dxtERAHoX+tk4nVcXN0KbJukF0i8LppNj8
	BiiDSM2ha0u32DOZgPVwFc4q+5QUKgVxB7C+TqRcNHBeqyI/0MJ3ZC1SJ+VF32nm
	lIzXZa6eze32HAtcYmhuqfLo+z5RPR0w49fdVo035mksSwAxbSAVxmnF7F583VTA
	9G8tDkdTF5ueqE3Gonx25GL4ekwcqtRiTm83oUZzQdTvM6yGErODVlYfscips3Kz
	F2J/OwsqeWVGBba18/Ldn3v2aO6nSXAuiFFbSDUC8wTAtmEnjLpFESa33Ho+ANlJ
	K35mkOngTMGL3IHCyzr5IPbutTfBWDg7W5gbx5cWh3vRIA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew3wym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:33:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54e7922a1so39865185a.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747254805; x=1747859605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRKzmwRDtNONnFtD+GVYYT/F68o9yjtA9WFV64BwRvQ=;
        b=VTwV9lj5tyiH7LCRHxJByMjCFQby+tHHPiKuddoE8Kd2DtnslrOM7fZC5VBIaVIYRO
         ugJ9LuSV3k5R1N4i0uam4j7orcBrHW6EyPW29nz5cXJuIuD6F0K2xqUFuuJS+gLY/0UE
         ezDoWP96mEWXzUvetyEnulU2jt8GraGPzHSQVYPo01fUe7VSAsERN2dhE2owhui71bYV
         30/qSwcqXEq1Ou1YgAuWKEy7tfwbO19dRxHfAtRILlzapl6AmqOhz/JBQvjQozNEtGyn
         8gOb/RL6BpdW3qgrWAsq5KobjUXULf2fVpFw4yaUIwfz3yCEPLvF5mJ5jj2/RUTDXsrI
         lVAg==
X-Forwarded-Encrypted: i=1; AJvYcCUfz4f1oSBURpC4US3uovZY9xB3zbEh6Ccrci2+FFAdHIRLHRUwCJp/73sQXuL0iE0j5o1HLplZyeSzsAI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmI0LcDbvC28t7qotBf72NzXUGvxW6+4WQW9gv9w+TSZcR4Ggw
	mRu7e0hXKyl5mPEDCfi+p4K9V2RuTk85/JBB2Iq2UVSZuYhcWXPutrkLWY/1MzKTPO2BTgfdYjh
	TVC2ueipMjaPQHyGoAB0Z6BQRPTPnz7wuMCH2n1B3IZ4XnaVT1PCk7bIcSnZn3Pc=
X-Gm-Gg: ASbGncsABDcVNCq+H61kILLevURhAXEx8f5WaSTE5Ozph2UyllWoLNd7qbVf74G6aC+
	iKOW3sTRHxNlMvYVwgHD9f7SlEnj/bYKnWwusl6uIDQFLYMh3kvCXLsB8xDY0vMI3nEuKwA+8Yn
	VoEAku4DC0RekXZEqnPlizRpfWKZbyUFXWyv3IyGJlsxrdxvet0rOpcF7eL9OzXls3KOtcPYJpv
	oBB16zXb7QPOr6Ss2m4yErD0zuOLOB0uowryzR9JYxRGnI4SPr96k2LBLfoY+847phpsxu5QGpM
	2z038BqPN5FdbjT5FXLY5fw/GBmArHwvRCw5oVNpncchfPQZWXv9CNh4wbjHzrerAQ0pBgGps0s
	=
X-Received: by 2002:a05:620a:17a1:b0:7c5:5d13:f186 with SMTP id af79cd13be357-7cd287f8e7cmr618135485a.10.1747254804681;
        Wed, 14 May 2025 13:33:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsUrt5xuy6IhXhWS73X4G6t/mH1OxTdsbAV8OsEnGFxtr3ke2Igx0BWrmUw4ortNrnKDd8Gg==
X-Received: by 2002:a05:620a:17a1:b0:7c5:5d13:f186 with SMTP id af79cd13be357-7cd287f8e7cmr618132885a.10.1747254804305;
        Wed, 14 May 2025 13:33:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b6e08sm2379780e87.120.2025.05.14.13.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 13:33:23 -0700 (PDT)
Date: Wed, 14 May 2025 23:33:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFT v2 14/15] soc: qcom: ubwc: Add #defines for UBWC
 swizzle bits
Message-ID: <rxoefvyob7enrbtdpmsevw5wzatk4dwa5jomscqpxim5sjmymd@dblxslxy7q5v>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-14-09ecbc0a05ce@oss.qualcomm.com>
 <c3txdoumutgk4exshhyi53ef4xziu5bbe3ib67hw4gsvulh4yt@522qphwu3ocx>
 <c8517af1-5fb9-4350-814a-85ce26e5e334@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8517af1-5fb9-4350-814a-85ce26e5e334@oss.qualcomm.com>
X-Proofpoint-GUID: gox3c0fWz7XmR2GSZoINWQZRl-JPV9hz
X-Proofpoint-ORIG-GUID: gox3c0fWz7XmR2GSZoINWQZRl-JPV9hz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE4OSBTYWx0ZWRfX9ElPez2I3N4K
 USt+8YCQxQX+AI7UL2aupGpfQAPHyVf4go3atXuirBFcNkz++U/Shrwbl5mRvtbdQzxQIOq/cg0
 15QM6mnIsPWJb/A/RQq4MdMiX74QTy8yfj8+4wK5QyrEGodNYSV39t6Kwm5XhZ58qoJXbquJpIj
 5f8mrEbaHLzqlJo1MHOz4ie53QSp/J6OpLsCs0nIOj8lldhmdj/UXFJsU0N66uHX2qejrb6UNFo
 IcLlRxkc836Q5oJihvsu3ODkxaQ92f1APvgR8isDRBCoOZQFSJLeG/+Y1o7zF90nbgBDyAAAB88
 zvigyD6O/zSOkEJMGWWJ54i9MPv4puDllQikC2XrqlzXn6ZDOZ+t2/MGI0Jb6hIPQ/cHTlduif+
 GUaZ2rjIr0jT5/3WxgMP1Ouj9bET7K4UL85Q6wcfnxrO47lN0cgQxCR4WvKQ7sUxT8Hw6JB9
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=6824fe15 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=V6yTId3DeqrxdCHudOoA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=730 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140189

On Wed, May 14, 2025 at 10:09:35PM +0200, Konrad Dybcio wrote:
> On 5/14/25 9:24 PM, Dmitry Baryshkov wrote:
> > On Wed, May 14, 2025 at 05:10:34PM +0200, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> Make the values a bit more meaningful.
> > 
> > Not sure if it's more meaningful or not. In the end, we all can read hex
> > masks.
> 
> 0x1d7efc35
> 
> magic constants are no bueno

Ack. Then please drop UBWC_SWIZZLE_ENABLE_ALL and list all 1-3.

> 
> Konrad

-- 
With best wishes
Dmitry
