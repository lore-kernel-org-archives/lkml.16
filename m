Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CABE1C84D7
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750666074; cv=none; b=dJkO/GLMQHBpb4AhBFoyR36n0trdid0qIqBeBb002Y48exymCSTbllUEHiBccXb6xoTizAKbuAuyeM6FGbDRyMpjBHF5GRvg2zoEBe/Xs39RwJ66o4WDzd82Ri3SfV7UaB04MVMnQVxqhVmLxet5A9FaJhBJJm29H7O8Xa+KtE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750666074; c=relaxed/simple;
	bh=B4CPXnWbR9k+Yd3ZeRCcA6SnEKODoVSpqxSd0CBzTHI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ktbw5iIcXn9G/ZDeK+whsAC3izERQN5TQLx+hqnZpF4gSk0YtIt2q/jY7r9hHRmZ9zZ/LkXhn6yQwCrYo+JFNB4JmP+o5lE0Vq5bbzMvf1DNQpLPfKqV7JABSFkjzIpAgnrcojie4s6VluJyrJFCUipIsNapwy/fqf7lq+J3Yrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h5bdbLzJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h5bdbLzJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MMkGjc024219
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oDMFlNkk6v0MChyRljc2vXBp
	h8oq8I0D2cJrN50OSZI=; b=h5bdbLzJPu4QDuQCHnsHoh/lPv24tLxnEWN3lw3o
	4ezIojzvlztW8mHjeopWk7V5mmrauQV89HZTdK66p6HHFPKLsAcgda4OJJASpO6w
	WSSY7amUbWQTXOSBUc7/mmILksnvaRbShCz0psJbfvXGvt3LCjATZFYKDWVVQtLM
	BLbEjruTCBLmfyIj6wzRA/qVOHrbu6uGNZYIx86NIoFrSkj/uCkBCxexROtbuvcm
	1L9FJwrAJFxECu4RBWMYI6+TvtZCEU5+v3+k5wqFPKf1IophVE5M4dnpXjoKbllt
	EkK4zL6mqOMGNxBSuvnumICKLCMsOP/Gupr5DcIFSbY1Zg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmhg3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:07:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d40f335529so162012785a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 01:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750666071; x=1751270871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDMFlNkk6v0MChyRljc2vXBph8oq8I0D2cJrN50OSZI=;
        b=cpjOH9VfKT19hHya2x1rVQeUB/zcdqsUFj7VdUPMxZnZRdvUa8s+qG9scHLoGZ3Lwg
         GLCd4jIRSuxEC2jNV87hXCH4niGZ1OyCez3jDgwkA7U3LAfv4rydNk0WPfZ4r7hxhIWt
         QxZ3vLz8ehsq2Z5atenX2822HjIa3PzaSSTbAft/SmM5NsIgBMewsIIxGGZpkAinOTTz
         0hGIhuAw1LNXzBW8GvroCvHc5oOVF+E0dvCzPX/031XcNTkMGQ9GVEaV0nciUyElVGHh
         AakypNVaRTgQOp9nGhIShV2/OkaV12PrQ1gEit+pxkYSdp79JbplX8h0mNODtjZXym5B
         wPpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2D3o5PHOTf2KTpkbp7nA3tqSFSsFX6ZE3FD0S/Zeqb3X+yJM/s06kvEqdzM2K+jGXa+Gv9xwpmgvmAe4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSM6HwDtDL1o/Zr1CB1+YnSMS7eGLWUjdphdrzQh7qdT/plHld
	DVtbXuNf+dXtgPMMK463bjkdTezDYnhjG/nxwns6xWVKuCkFjaF7G2HibQuXlrf/cMh11NqiQZE
	rK1DiYk9p1tXV8b+vbkkqAQk5LobQV7PjGgr2NC4PsvF6MXdR9wHd4cSf3eCPRrVg9yY=
X-Gm-Gg: ASbGncsHhFDQqO7qPqwGZHb2zzHON1Z9IImtjTWkgYg4tZyeU1/nxbm+sJCa8I4tI0i
	Hj8dOmBM/Lz1SbdEEGH14X7mqTH081y11ncKeAMYKBTmizoqQ/L/H5o6ka52LTyPn4ckgsI7TF1
	F8m+1BNPwZPv+TLUbdkaKV6/DHvDBEea1ycyAUwPCmiYkb22/TPhW+2oeAGxIkYljnHH0AQGw53
	u9polfgs+TUisOkMVNGvkLYGIV8PFo46jNzE3anJ6XMLsP4pzasv6yHchICxuJGKCINu23pIfQb
	+spUb8AhQ2/8iuUq53dTT+lbf/ynfgKuJHA5rW3sfYLxI3xMD/hCgLOxSg==
X-Received: by 2002:a05:620a:1a91:b0:7d3:a4fa:ee06 with SMTP id af79cd13be357-7d3fc08e0c9mr1465761885a.29.1750666070911;
        Mon, 23 Jun 2025 01:07:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFq//17PLWLmNDldBebAqb7W7yo4ETm2ruyeCSlQOLTbSM3x4JTuSom1Eiu0rZzeYj/JZsz3Q==
X-Received: by 2002:a05:620a:1a91:b0:7d3:a4fa:ee06 with SMTP id af79cd13be357-7d3fc08e0c9mr1465757985a.29.1750666070346;
        Mon, 23 Jun 2025 01:07:50 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e97abf6sm134859675e9.6.2025.06.23.01.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 01:07:49 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 23 Jun 2025 10:07:48 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] media: venus: Add QCM2290 support with AR50_LITE
 core
Message-ID: <aFkLVOkYZMHqEMrh@trex>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250623074940.3445115-1-jorge.ramirez@oss.qualcomm.com>
 <8c8bccd6-9a46-4ebf-aeaf-01f52570c0be@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c8bccd6-9a46-4ebf-aeaf-01f52570c0be@kernel.org>
X-Proofpoint-GUID: mGA4LLvIza4RWo7OJqzWwa08fvNYrJkD
X-Proofpoint-ORIG-GUID: mGA4LLvIza4RWo7OJqzWwa08fvNYrJkD
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=68590b58 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=25ryw9l_FqF9xFXmehgA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA0NyBTYWx0ZWRfXx/oi/DbFkDVR
 uIOHQf+90G3fFgLEJoAdV7jMadvNWg5G1jissxL9U8saHd6AnUsu/2wQI3SUKw73YenpvfSOAc8
 WL+fNgaKDIqI0NxFdMifJhoNNFGJO60PHBo4fX+G6fjH1aAHaKQ2kj0Qc/IHmQ+pOSPeUrH+/rD
 r2zHJINCOvGD/vJDFeq9yK6UzTHOBDCQPqBrjnFpXSK+g9kRV/v4x1kSOCRBRUo3fd1IqGRVQiE
 oAzoU8yr3ySSlwNBxrvdkR2BucSy8+r1qCf4DQh9dOWN2yXtPGlKhvilE2WJ5JepUyoGwvbrJCn
 JCQCztzfBewUTNK+fyZnuRnkZIBtpHoT513em6a7DknX2kuTcBGJsRjceCl8t565W9Hw2jje8Dq
 UXe78ZiozvWb7kLtOWYZWhmLfCflqqMuH5heboXA2vB19tjdwvkTAigeKniTrIeyi+Lh9vA2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=868 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230047

On 23/06/25 09:55:25, Krzysztof Kozlowski wrote:
> On 23/06/2025 09:49, Jorge Ramirez-Ortiz wrote:
> > Changes since v2:
> > - Removed IS_HFI/IS_VPU macros
> > - checkpatch.pl --strict fixes:
> >   - convert macro to static inline to avoid argument reuse side effect
> > 
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets.

ah interesting, I was reading somewhere that sets should be threaded.
sure will stop doing that (found it super annoying as well)

> 
> Best regards,
> Krzysztof
