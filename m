Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E765219A81
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607890; cv=none; b=gCEQGlCwsWOBMbNcXm/7hSqE89EngXWWe866L5/s7jMYBejGp8HWXujexU/7YyLFp6GAKbAOQjmjC8jPKl/wVjdZBFP0xXvdVo9eANUQ6M21/rpDKGyOmdYHphZHRc0oIFXujk3guP0cm6mYS7ObiaKsgCyC5pPM89Vszvf2Xis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607890; c=relaxed/simple;
	bh=E2hjGvLcucqnKXKjuuQ3CnCnwsMBcS9NdWsLIqt6V98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fGAXrZNvDsdpJS4H8GSn/17sw1MkHpD34NdkuovcNt5sn1hPS5SUMkF6CT3WDj5S/8q/PksUhvA1eNgNJ+OVhiHyKn0HZvD5fhp81Y1Aa6iz8gCEF6knT0SvNrT2LW6Vh/cDrCHZ2V4r2T1v8qTJn5GcGwu0v/VhSO4ieyTY6jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JCHPGRR/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JCHPGRR/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGKcdh009746
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UTzHeXKj2eXf87DCvDjyBajj
	xp2tDmChSLk0o/h0qAs=; b=JCHPGRR/gTZ/Wbpy1Pb6ekIKGy49k3oWOTDpjlcz
	LLTDWFmK2hB2OlQgCIClXBBqylqPKgw8odjcbQgGvqZGmghUWSrEUMTuX/DjUulm
	iBhzM9SjJSih1Uba3Gk1a1FN0VXGz0xp8C73GY/lLEMm002lY4bwBIUHSXddSX1+
	G8ILPR2jdROKKx3oYKxDBOufXnahF6qjq0Fzj0P4yNaNNXSstekcncRoRw/YDHXX
	x8JOXVsN5fP/RGo27C078sbIrUZFWbizUXm8S6yeuA5trY2uQm1WDpdP1VL+ySrO
	j4bVpg4Zm4D1hp1mOU//L3Pz07JxTPcbimlJeuoo858xWg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2j48g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:04:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c7c30d8986so724155085a.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607887; x=1746212687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTzHeXKj2eXf87DCvDjyBajjxp2tDmChSLk0o/h0qAs=;
        b=ZlKePFP1VM++IihhwGE+Ydyny1uwX1EjE80I05+p1LXcJXNy3bE2cW104F9dUu8jmx
         pkknVqlONUh2vhsf5Zjid/ROMYsS2Kw1vEc3JBWlje4a8GY8pCb33ld7N5HHuO4Ngd6u
         INs1i1Is/y1y8Ov5OxCj6Q6P1wzbdH3QHyFrR8XSRCc7deBHgCNLazEPAhVcroH/vXwo
         xQUIV+lGdZNj5ZEt6S4RnibOkt673Qx4bivvtNlIFr7sMUnTAEBl0yCQKuJyPR4H1wqd
         9FUXnkQpOXjOMALE+oqtB84gUYo1AxRSsq5KiC6o4JYlHZgrzYE1eRu8ZBR9K3ITUWTN
         aK4g==
X-Forwarded-Encrypted: i=1; AJvYcCXFL94T1UFAXWIIzEphepGfA7TwwaPzIZZTOMDHHcp1In2OjH0k/ZTqnG3J9RiV5F6V5nVE5vt6KwLUB2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz23DzwpnhWvpAhhpGEjjR0SrPAzh76HslsJ3HGOYV/asMkTkEe
	y08xyW9kj1u+3+bj3/STnfmPnycqz6xkF21tQ1U3tqJCGmgFtO6dAgp2/836E3g2IdMhV5KxJku
	6e7d/u2UMUoJd7g6quU11yt6HZdzups3MKCyOHd45YCRwJ6s5w8mmE+629+tU8XeY6W3m83c=
X-Gm-Gg: ASbGncuzbl5VjOxu/9Sj3P6mTdEhgmQuHAb33htXDQClk/LwZUJSn5px6ALZKpPcaQ+
	uxVM4+DntTh2Hs1SVz+reMuywuavgaEqXpe0YWKniN97fa+ardXDV/962i+ATKAV61mLZtFAeSV
	6xiMvnRNL6MUwnXQKlg6ylZ+t4UOvJkjDvZFIN34Bnh1KFWEtxnjBk63wOXikTrzUxT00ade9nU
	GYQ9leKg7piZ5fewVpY40q2rPQ7ZrYZALIW3vbYFuJTD94lDRlWiAsmKg+ZpY0+L8Kzq1t0+Nlx
	F3uHWqDljwlWFFvjesc5aSrGNH298tckUZ+6Ikzwyztbj42GEiokgq1T3vXWPwz7Wz3yFeWuw2E
	=
X-Received: by 2002:a05:620a:4609:b0:7c5:6a66:5c1e with SMTP id af79cd13be357-7c9668cdc37mr114285685a.58.1745607886755;
        Fri, 25 Apr 2025 12:04:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJuNtckHYkPs0zr/QJ4//NPzQGJTdxk1+Bm0d3d8S6mcxCa4hGs/NU9dIoIE3YcXQ7Drt/qQ==
X-Received: by 2002:a05:620a:4609:b0:7c5:6a66:5c1e with SMTP id af79cd13be357-7c9668cdc37mr114280585a.58.1745607886221;
        Fri, 25 Apr 2025 12:04:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb7cdesm697699e87.210.2025.04.25.12.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:04:45 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:04:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB
 audio offload support
Message-ID: <gbys5x5qefrep3igd6wwcxqycmvjzsceqt2d5p64znbtjj4iyd@up4fq2cib3tu>
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
 <20250425-fp4-usb-audio-offload-v1-6-f90f571636e4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-fp4-usb-audio-offload-v1-6-f90f571636e4@fairphone.com>
X-Proofpoint-GUID: yLrAjlHrWN0M5-veTe7paNXDYIV2e3j9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNSBTYWx0ZWRfX/T0WiZehkhep vfWXD4ahs2QbwM89vlg8iJCxQ8Es8Plc1x/hvVr8Oa3EIk3caGHzvBsu3b7DjNjJ88PynuOZ2o0 cbcitnisON730hfnKV5H9RCZCQehye9mOewhqTcM+q6ElzlWcMiJ5KgmkW2eybh1XQzUobi+bqF
 6Y+l0X2RLotKMZdfUA3OQ3SJfGE4I35VMUgrkdn5cHeXeXnhOruBnaLJCxlJm+aAmisfRq3E/1g 57emYfI6LXjMQel26BGnKEgkIBTQB4Q51YcsVs8Kx8MpbcPpNU+HIoOamtAuS95HJkkk+4huHs8 EzhafilbOZyo0gg3zDJmcoz5EvB09gIfjwYQ/NL42Qa/55n08vSVNsjdwA8T4tqU6U375vyUm58
 F3fLOsKUYidXq3ZJ9J0Y5c+xeJPL4vGGznnL8iOLisM/B2WwqK+ooGkxpOR7MpvxUntYC/yO
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680bdcd0 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=-qJDoccVa5BqKm_QHDoA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: yLrAjlHrWN0M5-veTe7paNXDYIV2e3j9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=926 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250135

On Fri, Apr 25, 2025 at 12:44:56PM +0200, Luca Weiss wrote:
> Enable USB audio offloading which allows to play audio via a USB-C
> headset with lower power consumption and enabling some other features.
> 
> This can be used like the following:
> 
>   $ amixer -c0 cset name='USB_RX Audio Mixer MultiMedia1' On
>   $ aplay --device=plughw:0,0 test.wav
> 
> Compared to regular playback to the USB sound card no interrupts should
> appear on the xhci-hcd interrupts during playback, instead the ADSP will
> be handling the playback.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi              |  3 ++
>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 37 +++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
