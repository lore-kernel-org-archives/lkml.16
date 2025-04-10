Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0261F1E008B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 21:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744318920; cv=none; b=vBZaOCtzFx6BHZ1OfTq4ZiNvBWJ6I1wNrzptxagXSwtRQdE3AqauUmoc7FukNX7bCX5DbYfLbYywL+l5O8tnkLuRFNNPAzP5QXymGojqP9PfFg/EAnAfynIMYnyh+DPD3VD1Gr2kspoB9rNccg5I1kk5DAdau7c3ub4kamDq3GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744318920; c=relaxed/simple;
	bh=Bp6+mDq5oMmXkzUXL1kUpCmqYnpORysSLja5cHQfqko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqcU8NoA7Ys+QuirnzbfQDwArez6LzeClErrSXytcytErKozEExhmuU8gEQgmK3jiKGluZ5OvBSv9hADyij0EJGqo7Hzx5/kl19rwFgaU2fHpAzz34fjD5gn6KNIm6dL/juX64/wVCZdQLR5PwxJpoXMB4GTw+3NomxM8su1up4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XDTaYRtN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XDTaYRtN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AD2nR6006985
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 21:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EAczs4DgsEXDn10TzeEXpsxj
	GDsTEgsnPDFYAZGDppQ=; b=XDTaYRtNGakvPh5wIcPKRrqc//FrVnluzievkDqr
	4YXunzjTjFI0Uz5TEDtY84vc6dDoJf3KPW7FWsqPIDIUyPCtprp47tH6s7UNpFe+
	jptYSFcsbynAJFc0Nn1hV0A053T/pkNjYrz3pjyWB71w/Ns1SH5VoijBBb/E8rPl
	5MUga9ChweZxPO8z6vUYwZooOyELMZevWOeVgr6BmsYjyOOlNF1VB8UKpu2xfs5V
	y8kpN7c/g9LxcF/nkiPaifFhOPVJnUnw7s+ByvLfWW82414u8bQY83SFy+ijoAvr
	25RxV2V54aS1hPtF2NH+SSylkA+70s2AXvxHfF5crpQr3g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45xeh3hbhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 21:01:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2265a09dbfcso19444185ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744318916; x=1744923716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAczs4DgsEXDn10TzeEXpsxjGDsTEgsnPDFYAZGDppQ=;
        b=Smc7wAerwGHZFAxnXnTk0XptkoM0kM1nGOH43DaB9lEypbO5G1nxS3L0QmaLJJch4A
         /EknDmGkoQvcAEYBVbhQco+cMPUgMjJs1X1rWDiafYDxkoZVHAq9lM1jA5vihvx3zFf+
         bP820fQKQVw02YVw2kx6WReIGGuk/GcQ1m+717gAxJk0+GZrYLfyYIWQ9POrQUEL6Bu/
         zacKL+r/W5bml9IM1K44kzB685i9PhqLWtpeaRzyMHtv4Wa9e3EZgA6PEdYYtA0ZQqCC
         1cXGh/H4JhFF/Mkb/S41cWkFiDiDcuH9XK76N6EE8DjtD8Ig57j2/Zpo2jEAbei21/R/
         KK4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUM0UN3H8A3es3EfUZvtbUa3KarrwXhS49/osAvkixWk5sdXqpnFlwxiy0uNHaFuGHmt8AQDC6M93pO21o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2FYu1QLNY3jvsSYgjsmahVFykQPoO0JwcUDjWE48t5rB4ar3e
	F4E3n1ucmQTHLHx+rObmze4SkL/rDCrVLyryELNHq15H5DUDB0iyrkMulvAgxsnu30t0xLfyNMB
	0k//JkUq1emcERiIDHR24hqtsljTWO29rUE37kiIkxIjtg2hXhZ/wi3cydS+NaBE=
X-Gm-Gg: ASbGncupGeyFQYk5u3wyPRJ13ZA0ZlAiHCpuJbZesKwwZv3WTG8onhkAQDOAPHkqhjb
	Tp32c0Mh6oJkVcE5eW1OSi6EvxhXsZAeCIjdLGbwiDaJzp5NSLOtw6ZHIq7I4l7Td38nfDuSkdU
	K+NSvlnaIhXq7pLmuzWwsEqGskhz34a52uyY+IMjNJbQ/a5ydZGEEFlRdYdAg7Pv3fD8m7EqgrR
	lTdQYOUsxYbkaqh8FJb9+BdlWCfu5Y/PjoDU3hNPMFRhl8WdwpytMuyqOfB/wnBNVyaL5pIKpux
	j7OFmglVVW9C2zzrofTQgidAscq+lE7U2KDbiLD1ic6d+bG4FD9ETypVOqx+5/XyKcrjfmRJE60
	=
X-Received: by 2002:a17:903:228e:b0:229:1cef:4c83 with SMTP id d9443c01a7336-22bea4956e4mr4390005ad.4.1744318916399;
        Thu, 10 Apr 2025 14:01:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2LTJB2/RY/DdqKTkh2gKJbx/x6EreWNzJjdMoIjeJhs6Ywk/JJ+CEjjTpDEwY4jA5Y4atkQ==
X-Received: by 2002:a17:903:228e:b0:229:1cef:4c83 with SMTP id d9443c01a7336-22bea4956e4mr4389375ad.4.1744318915867;
        Thu, 10 Apr 2025 14:01:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f4649d70dsm5790861fa.22.2025.04.10.14.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 14:01:53 -0700 (PDT)
Date: Fri, 11 Apr 2025 00:01:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        david.collins@oss.qualcomm.com, srinivas.kandagatla@linaro.org,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v3 3/5 RESEND] thermal: qcom-spmi-temp-alarm: Prepare to
 support additional Temp Alarm subtypes
Message-ID: <vsxqfagv557jiqmpu7dkt5ojiltsc6bqhgaiiccsnamcsn7eec@myowjpia5war>
References: <20250320202408.3940777-1-anjelique.melendez@oss.qualcomm.com>
 <20250320202408.3940777-4-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320202408.3940777-4-anjelique.melendez@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=67f831c5 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=igDgIpU7c0FD-4j4V8UA:9 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: AZ0w1zX9yVt95R9anVlERHrvSK2Q4rls
X-Proofpoint-ORIG-GUID: AZ0w1zX9yVt95R9anVlERHrvSK2Q4rls
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=972 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100153

On Thu, Mar 20, 2025 at 01:24:06PM -0700, Anjelique Melendez wrote:
> In preparation to support newer temp alarm subtypes, add the "ops" and
> "configure_trip_temps" references to spmi_temp_alarm_data. This will
> allow for each Temp Alarm subtype to define its own
> thermal_zone_device_ops and properly configure thermal trip temperature.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 38 ++++++++++++++-------
>  1 file changed, 26 insertions(+), 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
