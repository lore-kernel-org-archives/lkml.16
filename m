Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0417A1C861F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 19:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743621039; cv=none; b=dDR0Ph53NzpCybdGeEpueklXybyf6TP4Ar8J8F6LwLjf6jZmDy++JwNBmVXYO6YIdhOGNjjVw8cMah4B+TaRLsySncAHm0930NMYcRjEHne4ufaamMSrs0iB8qEkHnDUSKIyiIO10EHupLpLyOXIGaBGPCMGusyM0X+ycV+ESCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743621039; c=relaxed/simple;
	bh=1E9NIKB6kiWWxGO5LFe//013qn2YvkEVBA0RtrkzOrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LzMX/kkn/JZzjpjy7MWQARIsC9phv+lNn17iXWqv8Jm31PvsTaD+SL59EvBv4JSsPg4HtTlCTebQkMPpaqcxeuoOdDfAC9mU6I5Dufl8I6TkwJLdscpwTV7kt0i5Vhfo++QsylwH9bhdMoXoBVMOOkwswjnqjfkyX+aIDTF+RPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jjwq2uGF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jjwq2uGF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532Auin1023449
	for <linux-kernel@vger.kernel.org>; Wed, 2 Apr 2025 19:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zmUYkVYqvGzbPDQXyu/mUYb4
	7LYlnrBBpOgNv+07v8s=; b=jjwq2uGFX3im1U8tRkkH0D97x1TydXUWEqQVwtV1
	gsnsIRkjMTvH5GSU/zjcOSj8lJnANasDKqM39G0Fk5O6q9ZHecUvrxmIucamsGAd
	VQ16CGgzkPhQqQiFwLgoz0Kn7y/yFuxsfjtH9bn8v/k7RwWYjhcbDXxwD/U/evWg
	gnXUIiVd1RRBKFvJ6DXy0v9LXW1QqMgG2C8LkEgkXzBI4ht/RJqUxAfgoOPxAqxF
	yCCHbSFKQwVxDr4TFfpu4wOpx3WdALaqob9X1wEHaWOlTxLM+TqBRu+I6GQTzJWR
	MtaZwnzWgnGhc82YXAO/IySu3uZwCdpDYzy7saATvcB/fw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ruadtt87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 19:10:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c0a3ff7e81so16075685a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 12:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743621021; x=1744225821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmUYkVYqvGzbPDQXyu/mUYb47LYlnrBBpOgNv+07v8s=;
        b=ux58L9JYJQeJTfOw+8KnPSdzzbNND5jOZitBFjWmxTorLs0Pi7Xx7UdS53+fBis1kK
         y7fmOZi/Ii4nU80dPX0ZpTBE3FugX6ByIyInpx/5BK+4CnAoFb48peUekrswMkXZkqL5
         tYR7cZJGKZqO7Z3D0klQk8MXY1/gdJCkfH5tAVabzIkNI0E+FwQ/TZ/3zhpt5pI125cQ
         TCQaINAbvanPF6SYr6eQYkiWppJN4YxRYpj6DN2F8wqq1QFVQ1t/q3Tav/nM3NhlF4xu
         3fNBfzWezk0D50Sp0XMxwKhAtZz2ilTTQM/bx7TKI1gtmpmceNI7msMZH1+NWPc4P5fE
         uwsw==
X-Forwarded-Encrypted: i=1; AJvYcCUE/qZfRk1hZeyyzGn4Fbq4/vvq3pEXL4AambdQuEJ84fXqkVgyUCQ3Jv+iQiGlgWm5/0PkcxGVyYMVNJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuKwdzL0wmVWXKxVOP3nrR1fIGdy8NdCEH1hl9LyaKabDSA0mD
	7KmNze+0WKIuDPsS+5cUPS0w2CEABRR9OvAgivkyiQFKOPngm04sHj3a3gaK6Hvf5hFwP2kZCoP
	GP0rNs8CTMYs4hSlE1g9lu0F6TZvJDR0dppiYyM6Oh2Q2KQXIMGyDeNs2FuqaLT4=
X-Gm-Gg: ASbGncuAIzFmKRdPndl/bTH+wflEKjWIcgFSRGpsW5awWrqfs20EzSVv6T8vD8kCn7L
	ngRtySqMcNRiUOv83rRsq3wDu6do76GX8vX8n3PeNPSJ63uFEiQG1oMeXzZ2ush/mePwcD/V2nK
	NeSdj4vNbCjZPw6i2Cqhn/7WcWou9iuxg9d/XVt/IzDudiednQYI7dSlzNOXeSuxfq7w/Pf79tw
	1PLK8qYl5RJ9lLKWdoylyq5cZSHDAs80h81bf/BFkaGYV8pqAVdqtCTrbCjhrly6tqbUWHbo2/w
	W81mzgBNvlO0y9Vcjes8CCK7Miz/N2XePVBdFM/X4YaksiujuY4PySeTQtV+ROZgflKLTVg61vP
	MHxA=
X-Received: by 2002:a05:620a:2685:b0:7c5:3b9d:61fa with SMTP id af79cd13be357-7c69072a6ffmr2450035885a.26.1743621021598;
        Wed, 02 Apr 2025 12:10:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL12WrxSm3dTTl0ltF+TFscnVQIRQop3TdWFVMRKTPWUPSA00Q+ercIZwKI0JKi3FN2ZJRbA==
X-Received: by 2002:a05:620a:2685:b0:7c5:3b9d:61fa with SMTP id af79cd13be357-7c69072a6ffmr2450032285a.26.1743621021206;
        Wed, 02 Apr 2025 12:10:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b09591191sm1712994e87.193.2025.04.02.12.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 12:10:20 -0700 (PDT)
Date: Wed, 2 Apr 2025 22:10:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: x1e78100-t14s-oled: add edp
 panel
Message-ID: <a4wlwnhgxxzgarkbwtpwqsh42ksmp63xgqwewgatg43esc37zq@wc4bbkjvlpjn>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
 <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-3-ff33f4d0020f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-3-ff33f4d0020f@linaro.org>
X-Authority-Analysis: v=2.4 cv=VI/dn8PX c=1 sm=1 tr=0 ts=67ed8bad cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=bmQPT5UhyNeoAJmEc28A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: q8PNnWqyS-UxA6ZiOTJe15W2rLOJqeSw
X-Proofpoint-GUID: q8PNnWqyS-UxA6ZiOTJe15W2rLOJqeSw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_09,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=737 malwarescore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020123

On Wed, Apr 02, 2025 at 03:36:34PM +0100, Christopher Obbard wrote:
> Add the Samsung ATNA40YK20 eDP panel to the device tree for the
> Snapdragon T14s OLED model.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
