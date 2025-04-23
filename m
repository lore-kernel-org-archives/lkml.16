Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C54E2309B3
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745416713; cv=none; b=NyvDetyzWzNrzU//KUmXnXbaQ7+fcxLRF74iceY4d19ondAlhxtEkTuOb/GIqGdmx+vBtvjel5a069xNgrt7eb/+dNsRMxdmrU98in1yHBhDjaoLkqhtNVlQAi57f09eGkjGjlK3Qgs+UB6s8ghFRutsREup+Daz2Io4hZEtZl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745416713; c=relaxed/simple;
	bh=QQHtOrdweEikUQHTCxA3LcUXxjA1M6UDeACDwl7O8n0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SrggUGgqaaZFXkQLhF6rnLr91ElDXKT8zldAoXsIpME6ckA9SserR7sP8SSAftU1naxciS8Dla3QqeyQ2vgKx5CX997nA2CvJcYa0TVuyPrTIs0lfVtpN4ywkmHoTlLDBTWv4kdvB6T1MT1kXiU7NOmwnxeRwoCKWJvUPgFywGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UTgqP1+e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UTgqP1+e"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAVHlG015748
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C1pEN0V7ta1blhUvOSjeh8t4
	4YefebhUlQwfthVEXOM=; b=UTgqP1+etb3ty0z6u7O7hwoOAlcDHh5vsbXu8c0z
	rwfN6RHS+54OuaLDkQPttzlnSpLzH/+b/o4UPUfSno6Ii6P0XKAvyFXhBYXRqGKD
	oSVtEJdBFsvlTxZj08ZjWxSvofBfOQGBlTPcY169WdwxucX2FL/eff9cDybipwQg
	L1Qq5AgQRK2M9anMqZeVzx3hPa0NYXdoKRkVQzQDPdtB4qk/1SHO7YQeGZPh2cbH
	IL+pXOWUaZv1EU8Gwk2Q2eQFVCrwM7UQpGzZ7fgl6vaXirhM0sHUheRN9QdZkczN
	MOXHY3NwAEfwsmDAC3N0/Dbj+KHHsbbZ1YErmYLVmef7zg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0jaee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:58:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5b9333642so806344985a.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745416710; x=1746021510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1pEN0V7ta1blhUvOSjeh8t44YefebhUlQwfthVEXOM=;
        b=ubasgIDp3ovGhKhMeQLOgEsak69O8xVXpzultfsMar71iHSTjkxucwAq6H+CzVgD5u
         /z41l2XfZHvXLwmcTarwORd5BtPMz6gQvPgWdRbQSE7r8ab0wIrcNaO4NNLsJhdHdVOJ
         IvIbsCdvinKzqFJkJlk0tfUB3e7/Pt6W7LS/7iysfvpCaWbb1OdxLT1+ChVaWwFrM6a9
         8BNbCglmQoMWQPpfF0MOv7skgL+VMmHZgyUBvfjex5JREiuX1n5G6fiA6GTvqWtF3fcH
         7kK0AMRTnPuyaC7jGOc3CvcAIQOjslLZFm/JqHD9ZI9g5JpllyHBzDm7BAFhaYIbRqbQ
         iZuw==
X-Forwarded-Encrypted: i=1; AJvYcCVtFtKyAqorFttBwl4VS5IQlcjMOj298/kOxv5LmfK9nymuC7mgOh9e1lpYDnr57eJjvd43icqj/XgDNnA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlnqIuKMUKt5bNGCXenqpvMJRSIKzzAvZ61BS2AAsNjfx4weM/
	9QJ085GWKWVsmKALNQB5KoZ5T/Ce/lfta4Y+Nkf1f+BsfXEu0iCvNtV7suSha5CABx8zICPPC0d
	vyvqcBaahGC20K7Mr5BpNvIyoiKomteZTWjd58dzxbqTcW1ovWCcbO4mmse2xLd4=
X-Gm-Gg: ASbGncuX7Jd8YW1bPX70l6bjrHuK6U5ANQCqPXQbY+5pmW38jCn64nXXpDWaBKs/ZhM
	YEypQv1UhSpMIz3E5mFexOckHEP+l73CDnJgdoy+2NT0CoA73bi1FBYJZzrU6X3qHTogLhfM01W
	VVkWpLLoEJutbB2mHB9eqN1pN2A1tmtVVn3E2I+/T2bIz9W2ai+asBbxknpK/14ebK2E0HF50Qg
	qv3qPx12x2QUrBCSj7vaFqPUn/34heJcHLHM+omPRxRiIzCpOfwMXPNFnn2wGkj/K1Yr6coNH1E
	Auctsy1RAAQ7ziujo/9JQaYGRb5gC8FBz3TtaqYQY9fMXsnbD3MUeKj/kIlFNzXMgYmUh3kyo1U
	=
X-Received: by 2002:a05:620a:29d4:b0:7c5:642f:b22f with SMTP id af79cd13be357-7c927f780aemr2925736585a.18.1745416710325;
        Wed, 23 Apr 2025 06:58:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbMHBNHoF6fiuAveTacg+V4AVRjDSJG6H3O7cmW3Wv+n7Ux0OzCJ4jiXurojEiqthLPkdZuw==
X-Received: by 2002:a05:620a:29d4:b0:7c5:642f:b22f with SMTP id af79cd13be357-7c927f780aemr2925730785a.18.1745416709828;
        Wed, 23 Apr 2025 06:58:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e721ab8c6sm461722e87.232.2025.04.23.06.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:58:28 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:58:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: Ayushi Makhija <amakhija@qti.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
Subject: Re: [PATCH v4 10/11] drm/bridge: anx7625: fix anx7625_sink_detect()
 to return correct hpd status
Message-ID: <5mbgo73lfr5yc7nmdgzgdogdtog6cfhqya7ekjjd2guhmogtml@ngoial7rsmrh>
References: <20250417053909.1051416-1-amakhija@qti.qualcomm.com>
 <20250417053909.1051416-11-amakhija@qti.qualcomm.com>
 <g5mrn6o2arkbt356xtisszqtiokxm4oq4gkwa23y3f3aaahbfr@umcg5ikf5qjb>
 <783a80d6-63d7-4c00-ba09-0ec07492103c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <783a80d6-63d7-4c00-ba09-0ec07492103c@quicinc.com>
X-Proofpoint-ORIG-GUID: KKk0qP_Sm2K7KV26-0bLObNEtPkpa2ir
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=6808f207 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=TmeSYMYVi8BcKzM9Xd0A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: KKk0qP_Sm2K7KV26-0bLObNEtPkpa2ir
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5OCBTYWx0ZWRfXx0Hy1v+bB6ei HCtxsJIuXsaO89R3wvPsFqNzRn2Ht/STZvP2rh+SlQJmN1M3g3PrsxaDtNJ1ub5UXeig2ilhvf+ RT+ehcuBPAwau+mOldOBJYIBWNCtlcA5VwsdIehHoxg2ckB2dGlOi5mqbKo0MSRSwJefzlKhbH6
 bo/11Wb+BA047maHHUn0GjpFscXZz88qUzTdemIfudMXG56NFoqovmIMRKO80dywheGF5JciqkU h91NfZ/WQn/IBEvu3uTHYBJfJ+UE1peYlhlJb8quBddLB6okwxJbmPMiC9NQNcccEioERu/hIdu GCJXL7QDi7i2ONaosIhYFYTraF6uiGkSGR97SJK3J9LwGal6dX+v+aS5bfQkaEK6EwL6Pp1Ic3V
 GhiIkuEPIV9Nud0huy7PX90Xrf800i0J7yiQ2fW+9ammL7WV9dQiHhPc6Fo//5nhzaS68Iku
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230098

On Wed, Apr 23, 2025 at 03:03:02PM +0530, Ayushi Makhija wrote:
> On 4/17/2025 4:14 PM, Dmitry Baryshkov wrote:
> > On Thu, Apr 17, 2025 at 11:09:08AM +0530, Ayushi Makhija wrote:
> >> From: Ayushi Makhija <quic_amakhija@quicinc.com>
> >>
> >> In the anx7625_sink_detect(), the device is checked to see
> >> if it is a panel bridge, and it always sends a "connected"
> >> status to the connector. When adding the DP port on port 1 of the
> >> anx7625, it incorrectly treats it as a panel bridge and sends an
> >> always "connected" status. Instead of checking the status on the
> >> panel bridge, it's better to check the hpd_status for connectors
> >> that supports hot-plugging. This way, it verifies the hpd_status
> >> variable before sending the status to the connector.
> > 
> > Does this work if the Analogix bridge is connected to an eDP panel? In
> > such a case it should report 'connected' even before powering up the
> > panel (which might mean HPD pin being low).
> > 
> 
> Hi Dmitry,
> 
> Thanks for the review.
> 
> In case of eDP, anx7625_bridge_detect()  will not get called, because this below condition
> in anx7625_link_bridge() will not get satisfy. anx7625_sink_detect() is getting called from
> anx7625_bridge_detect().

Please mention this in the commit message. With that fixed, LGTM.

-- 
With best wishes
Dmitry
