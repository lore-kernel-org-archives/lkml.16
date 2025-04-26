Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87171169AE6
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 05:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745644010; cv=none; b=HCGxlIynlqX9DSXWw8demI4Urvyq9TPWPmEIQbZhr+05SxLmjqr66MtSXbE9OV/QRv9mWC84l5JB950uVKkE8gxos+GImt3ODIsp5tBlODAjFwi47Fi05cCIzAVhdwBdGV+hslj/tzlbFr7MZnwruBUyZQCt3nzBurrmGRtnbrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745644010; c=relaxed/simple;
	bh=Q1gTwKlCAG4xFRHE8zkb/zQ2XTPqyY5iTVOl99pSpFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rn6WtDJCpRnjoiZfnFWBTeKcZS88WvP434lBf1vAX9oJvhB+AVVlsTV05DHo9h7c/odGAmG5Xi/OzPeWV2U4D4K1TG+OM1eVMQFYwBTlH7lcjdLXaB/BAy6r4K0MrrHX2AqObV6EiSZ8eBNx5q7s/dFi+QvGUzL8vsJBNDkwSl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UwiPqJcW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UwiPqJcW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q0hlQW024574
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 05:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eIL0w0SaX4fEgbdtMZSS99AU
	nD4HN81VW+RR9ZFL48M=; b=UwiPqJcWeRfXKGZLlT0agSw339wTDg3PCCVj8LQH
	yA5RINtNoHEdSVM1JsHflF+FPX3yiiaGkso7Zz9lz09vSwtO79HJQ50Qh+g8nZX/
	vHhrHJbs23P3OlGSTxLMtHWF3WGTZXU7YZ+MxbgrRvJBuW8D/jiwHBILVxoWvCx6
	oLpQT9fRf9hSZrYbtlFjcNDFg9gAQ7yGtliUCQzzTopF8pV5qpbYkxAYVK41hg2m
	SyXa3VebwcVirsIOEWrc4NQEOOZMmb+yzcfK/nWpZla4JSm/dGtOQbiMnTkGpME3
	T4poN4r+p477qwePiZpI2s5rXEEQNpwZ569C0nlIG8SxBw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468n6j8dqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 05:06:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5c77aff78so852601185a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 22:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745644006; x=1746248806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIL0w0SaX4fEgbdtMZSS99AUnD4HN81VW+RR9ZFL48M=;
        b=RisguTaV5KZVBXCqo9vPnDVaxzGpuaUnIdPRZYqp2o8AIG+OCoSq5zUFl/xmESPt6A
         esIr9FRXEB3DhfcTWBkcvPgWTHRIULVlDZHXkXAVxD/634IvfIhVfKiN7bQUo9PseAEk
         mOFiRT3Un0zM7qEFzwEeX90rFfFQJRdwC1fWdYVqMBQUTJ2xh5QWRSQ22uHaIGOS1yNw
         GIMzpSCxfUaF4dJbmCS5RpNSeHnIoHsewZHwwS3dAixUzci1ljQvoqQtsyaoTteWSpvt
         tWLog3o3wmmpOWffcuTtNDy9ELzgr4/IX/RX9t1F3ArXkuX8JvyGL0iKrM5vWUfgXlai
         qtPA==
X-Forwarded-Encrypted: i=1; AJvYcCW2qyl4Dba9vcP4p53IKDBa+Jv4/VtzTYqdkR8q/sRV5WjFcMQ9rbuXlDa5VLi8Yi6EfKUiw2jmBfeOo98=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbAXXP9tVgmYwd+RdGHrvZSLLmHPLwQysk2sgvr9lpfRfCiWy6
	0/FnLDWa/ih5SvPGKAqaNJMp2NMRv7OH6nTl1L1zFim7/Ei7LjO5yn+i42oqhC/6wcMrTIh8rrc
	sQChoT19arOmX2YLyXsH/OM9JHRTgbF/XEa+5bNew9A+8W+n1ZGcS2ZztjwK7WWM=
X-Gm-Gg: ASbGnct/37uy8Tvj34guE6QBshCFt6pGZkU85XyDAAe0XL7vXC5udmbBKDCh6sjEpJF
	Ob8ZqKFSWA8sSk+HFqrf1pjd7mUk09bWPDf00Smku/EW7rElokMT2heKpV41yy4ziF4WHR53gVU
	Hyjeoga1xQHEZK47QP1hXZqkRCUhA7uHSje5PQcOObJQMrRuif0AUiQYI1jasbfkHS0sIqNWr2z
	VJPZgc3OZyfkVVoOyU3zpCEDMnHDXXmtHSTm43Ws86oTSYdlzJilaWvC8g5s7+7vWWr72Y2o1ZG
	5agU4AaNBdnxM3UfpZwibYZPXsZT/S1Tf0zHNJCixrMnAQ85AKdHZI9xGmcmzqX4xzdCZcZbadg
	=
X-Received: by 2002:a05:620a:2894:b0:7c5:5e05:df33 with SMTP id af79cd13be357-7c9668cda1cmr346615385a.51.1745644006424;
        Fri, 25 Apr 2025 22:06:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMaVXLId8fuUgq9yIofTuCxPmggQOFvjAUGTOfOuo8GXCozhFMNKAnbZiG2Wbb5ZGjE45ggQ==
X-Received: by 2002:a05:620a:2894:b0:7c5:5e05:df33 with SMTP id af79cd13be357-7c9668cda1cmr346614185a.51.1745644006052;
        Fri, 25 Apr 2025 22:06:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb7bf9sm837712e87.215.2025.04.25.22.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 22:06:45 -0700 (PDT)
Date: Sat, 26 Apr 2025 08:06:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: msm: qcom,mdss: Document
 interconnect paths
Message-ID: <cmmongeaqwfsfnhpmwdsvozhjzkbdqncktiski4jvqgn5sjmsj@2lw4vesrcwjc>
References: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
 <20250420-msm8953-interconnect-v2-1-828715dcb674@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420-msm8953-interconnect-v2-1-828715dcb674@lucaweiss.eu>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAzMCBTYWx0ZWRfX1a7iIoSHfRaG Onpw3Pi3LmenA3eD75vFuyxAZSnYu+lvc0lCI5rfxnTk3XsDrtYHoY8wsr7fvt2xpFx6Ty9TJoN A3V4WmpKac63MbywLWt2/sFPj97tBpOxgrdgUZc4ZIhUazldj/0Zh+XMQPDcDJgyzvnQk1mwhcX
 V8KEZXq5oJ7aflNIP/PKvQRacn5o8vdbwSJ693KjkQuvFllMeHgc1P5HXRk/D3zCvgamz8mgQps cV4WV3/iSuFHDRxDKwp+Wztt0J20MZPaHnQB61Rs+klA/hrMH8CtidX3kv6KJ17OzLXp87iDoFb 1B849SCfT8L25PgxNwSzwnwzG9eSjZBsEAJU5NnpCZb4p+3eYUJOyDV6VJdMYwbtxYeAgkPXMpI
 GL/t83dOL74o8pAm1CPkVQ869QEhfTNlHDySZnWTwm/cSNPXp3euQjydbr2Y8CphxgPQ2Pr9
X-Proofpoint-GUID: AurxnnJaFyOZtbs4O1cDAqn4v0ZJpiD9
X-Proofpoint-ORIG-GUID: AurxnnJaFyOZtbs4O1cDAqn4v0ZJpiD9
X-Authority-Analysis: v=2.4 cv=C8fpyRP+ c=1 sm=1 tr=0 ts=680c69e7 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8 a=z5yIEXyMNdJ1grE4PEwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260030

On Sun, Apr 20, 2025 at 05:12:43PM +0200, Luca Weiss wrote:
> Document two interconnect paths found on the MDSS on MSM8953.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
> There's also some interconnect paths defined in the mdp5 schema, both
> drivers accept it. Newer mdss schemas seem to prefer mdp0-mem + cpu-cfg
> in the mdss schema instead of in the dpu subnode. Since there's no
> cpu-cfg defined with mdp5, I've added these paths here.
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
