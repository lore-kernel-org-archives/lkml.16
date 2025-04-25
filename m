Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5B422A7F8
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 22:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745618873; cv=none; b=pNCdc1Y7kVIdjlB8UpstM2h6JJ+ldGyT/h3UGv0HoNb5ZwVLZyzYPYzXnv3PNnxSHCgRh1j0c2F1ZF8zgrS0nmdb+okNQ82J0t/bp5RabACH3x3Re9F60QPKci/7Z+2/GBXhTXiWfzcvv0DZ0SKnNsiU6VhnaXwyDbPjkabtHII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745618873; c=relaxed/simple;
	bh=p8LsTibyND0DnwADf4r0Tn1HLyKKco2rjPXuinHa8Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZXIU/043iuRghZRD1kTSCFcBm8ruf3xHWSoSimBEZ/VyVaaNWENcLIiXBeL4RTi5qI0bxwxEbp1EPbZ3uiOtusNDd0CjM5O7UWVP2Sfif44aaq6t9MSIBLMS+DADNBqRFrY0hX7iT2vFP4wgyzHOAxfIvzauxDO+bSMnUKMtV9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vzn1l9mD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vzn1l9mD"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJw20032093
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 22:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZjLbgaMb2gzy5ZMtFsZdJBbr
	vlVa10LTxyp/cNI2n9E=; b=Vzn1l9mDKY+0FAfDxIg3twqn7JmS3avVlqcqJWg9
	AK/Ar3aVJim+tqUtLvJywrnvfSvbjnTz9oh99WOf/c8bE3Nf+e5M0Ziz1vh5xe61
	c/XqcwPu/wXhmoV6Q1AmbWuxLD377C7plqoSrONFNuqMck0aT/cUpUI6xF81nHgM
	MJovibB/qP4rOr8dLatizUQiKBBi2/Fw/EZ543+WKhBAz+WNdxifpINmb13MY2B/
	Lfg2sgjryklc7FJ4hh0bx6rk1aVDuCVDMUSH3IEblDpgOzs2pHS0osRTWPk2ksjN
	48zWV+Vsj0Wjy9UW6pof2lCWSzb/sFSqEmtz3k2ADCdtPQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1a8qj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 22:07:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f2c9e1f207so45173936d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745618868; x=1746223668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjLbgaMb2gzy5ZMtFsZdJBbrvlVa10LTxyp/cNI2n9E=;
        b=bu4qRMK4PX/LwLkKyA3MqmpvfvrsAFDtJTHYuG3hjHfnSkBGGqlQxc9wipH3B3YKDd
         kOmUdOT0Y5vVjmBf1oYIZfNZiOc59IHzy8TBhRDXm4WsVk9NM6hO8OZQEIVUsr5l1dRe
         v3KpWLgP5ZOCOYWP6c5q9isi4+WbwWX8H/JNC15SpDCAJ+xRLvS++AAyPMYnZd/MjYEt
         Ne/O8K3Q+TVIvMy6eoAOmocZpH+Qfw6i2+Rd+hOYF0Vwez1jr2pMpjB1uCPLTyLw1ZGB
         8nrk7U64rgnVL5XwbEApjgdRaAzMtVbNx2+FBBLzsEGOml3hQRR2hJm4s6ZYG8nNXPET
         5M7g==
X-Forwarded-Encrypted: i=1; AJvYcCW7gUgtYsG0xwUKRXwzCFq6aTnVdIkTt1tqCC6dT4h/tM1bBOHAYXSFV8NyJhBxO0r1NNMxObDDdqzW76E=@vger.kernel.org
X-Gm-Message-State: AOJu0YypXl9s3DIemQ5MvTfO2y05s/CjuIg4Hy8p57HUavsGaccrS0o/
	PgGnSzB3EoQQYr3UzXq8869kVWd2fFnINDlKBfScos6b4ojOBROsSFOc4nX8gFnM24x7IV6hbhH
	pjUCojUlc3tEUsviy8yYWNE4uun3zopuo7ADyXICwIV2L3C/mqY0cH9tOp+kTW8k=
X-Gm-Gg: ASbGncso0G8oJZBHfUAkjMURXSzUWGPGQgUPeJa+ZpGEVhW3JoNs6Dq0hfvkYgxVohN
	kQFKTzIVDywLWHYtO2CO0PB1jJkQNSVxElM6xpnBX/PpJuIwitwZ63PChs9sgUY3MacU2dshgik
	uH+BekRG7hJFaTmgQeuOJGpYiFR9Kv7AhNTzHmMH3q1hfRF1TO1aq79MIzR6Kb+n23WhZBQKkAB
	EhxZSFygYYJguB87h8gmpg8nuyw2FFMiwij/X2ABA+QHA1B9Jfj7PEKJSVscMvoIi8SblgHoGg7
	Cfw7aLHznVWXKdDLCd4CsDDRMKa9FHCPmj/9Tyq7NI8T7ylKC5l3KE7PthamP+yZf8rHpK1MKqE
	=
X-Received: by 2002:a05:6214:2a49:b0:6e8:fbb7:6760 with SMTP id 6a1803df08f44-6f4d1eeb835mr17558066d6.1.1745618868581;
        Fri, 25 Apr 2025 15:07:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB3bD18bsnXWBak264Z+N0Kc0M6IK9OC9a86IJ2/ODHBkGasimg2aVWzSSJDDpU5COODxriQ==
X-Received: by 2002:a05:6214:2a49:b0:6e8:fbb7:6760 with SMTP id 6a1803df08f44-6f4d1eeb835mr17557966d6.1.1745618868268;
        Fri, 25 Apr 2025 15:07:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb7f1asm753379e87.237.2025.04.25.15.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 15:07:47 -0700 (PDT)
Date: Sat, 26 Apr 2025 01:07:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jessica Zhang <jesszhan@quicinc.com>,
        Abhinav Kumar <abhinavk@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC/WIP 0/4] arm64: dts: qcom: sm8750: Enable display
Message-ID: <57leox2rgsdbcrgqrghyq7h5te545by33hmkscjdj3ttedo6yk@4nwwtecdw77w>
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
 <w6f3s56gx7psqgweuntqvkzrot7elhc5pdrxhvenukzwyt5eys@fndmaszfbo5k>
 <921afe20-42b1-4999-b5c4-035669dc831e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <921afe20-42b1-4999-b5c4-035669dc831e@linaro.org>
X-Proofpoint-GUID: dmIrDLin4q4DHhsi6f4jcBjjP9gwkO71
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680c07b5 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=NEAV23lmAAAA:8
 a=3GFBqLPdguNaL9GZ_X0A:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: dmIrDLin4q4DHhsi6f4jcBjjP9gwkO71
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE2MCBTYWx0ZWRfX7WB2sEDOs/eT Yk+uW0mvRFVVxg9ZYxAQ31nspjO7uPUI/cb3J2MYf6utF9cqyvMHQ5VFFGpvcUzoQr7vofV7rlM xigluZDBP28iCygK/cmX1Z42n1WuWQwvBgoK20qNnn3CGzbq6mYUfORh9r8pkIO3WadTc7t9L9F
 okNtFN5k3tHnqhlwVM+JUNKe5S1U7XYhQhrjACSbWLG0G4yO6Ei8mmxhsYIkqvnsyYzkgi4rJYu uqjZMW5BwUWKnd7jjyz4nFdIF/eGkk/BC26S3PUyqs/+f4NqENhidkwce/3800gjwo7RmUjwbic /quz48bkvD2BGhRfxRMCSEdz7bxGL02ADYw/w5ZdwRcNA6xzQFRTU2YnM2/Z6og3hYwqfH8WXgC
 T2pLPWddaEpRDOiLfV2qvSEJ2Ceb40B73VyU/KuLABUB5FDjneGtKGd4dKaEk9sYj8hR295k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250160

On Fri, Apr 25, 2025 at 09:54:47PM +0200, Krzysztof Kozlowski wrote:
> On 25/04/2025 21:34, Dmitry Baryshkov wrote:
> > On Thu, Apr 24, 2025 at 03:04:24PM +0200, Krzysztof Kozlowski wrote:
> >> DTS is ready and I consider it ready for review, but still RFC because:
> >> 1. Display has unresolved issues which might result in change in
> >>    bindings (clock parents),
> >> 2. I did not test it since some time on my board...
> >> 3. Just want to share it fast to unblock any dependent work.
> >>
> >> DTS build dependencies - as in b4 deps, so:
> >> https://lore.kernel.org/r/20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com/
> >> https://lore.kernel.org/r/20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org/
> >> https://lore.kernel.org/r/20250113-sm8750_gpmic_master-v1-2-ef45cf206979@quicinc.com/
> >>
> >> Bindings:
> >> 1. Panel: https://github.com/krzk/linux/tree/b4/sm8750-display-panel
> >> 2. MDSS: https://lore.kernel.org/r/20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org/
> >>
> >> Patchset based on next-20250424.
> > 
> > If the DisplayPort works on this platform, I'd kindly ask to send
> > separate DP+DPU only series (both driver and arm64/dts). It would make
> > it much easier (at least for me) to land the series, while you and
> > Qualcomm engineers are working on the DSI issues.
> DP has also issues - link training failures,

Some of the platforms have DP lanes inverted between DP and PHY. See
patches posted for QCS615. Might it be that it is the case for SM8750
too?

> although it feels as
> different one, because DSI issue Jessica narrowed to DSI PHY PLL VCO
> rate and I have a working display (just don't know how to actually solve
> this).
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry
