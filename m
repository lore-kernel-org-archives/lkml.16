Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDF9297B97
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748021687; cv=none; b=IcRonXoZVu6GwhA+i9yNMnRtzAEdxuVGg3rO2mFec5gfpl87PrN5ea2IjUo1DKnXYlR1Cydq6+Bm8XEwXYU3zVizajtttwSmxwbY7KflRKCmkLdcV8l65Yka1RQiDRdmI2NwshlOjiFZShcmGSTomqJ33v45HJ+VK7gnSXQhx+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748021687; c=relaxed/simple;
	bh=0xH4DNFV3bBm5zPzPQGKn1kNIjsAFK+D2Oa6FLC58X8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nR39j757ER5Y22LBWctaRMjKh5UR5RKpIEh71OToXq2XlFhZiOvPBFJ34I0ismktP+V0U6SxHv+irdQVnDOjfu+6BCk8OjdV/CTpV2mCryqd8bisG+VM7+mGZfw4FSy5aNjFaXHWihk8/tzh4pOuTEu3OFrHpJyo7rYF65RLRGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a1D0XGP2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a1D0XGP2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCaAoJ000873
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hpIQ2HIQmyKL9n0F1Us1KUdU
	nZl8RYntEsnVzXSr5aA=; b=a1D0XGP2KaesVBdU0VRMJ144x4SebuozMtfThx1p
	yrjweHxaMbZBkE1dqTXhokX4SdTX3z6pv6CXu8j/QdG8MsOuZpTh008cE9CHd8vV
	c5HHao2GOiqQg+pfiETGdQAKLOlqqGREb9Sc9xXp776F+wcqrSCA1t8aWT1N+8mz
	NpWnJjbf/4sbShnbJ1n7Qn9HUxswLqAk54CJfR7Kb/V9pK499XQ0jYvDn9F6FOGp
	LvP5g9AtWhHPjxxaKJxq6IXH9hK54sl2xdCJptUg4l10MGHDxpGQIh5B3TIyzcn6
	gPDBBjj1AUwikSpmUzmGFoiznUMucVhSc+Qv7tqDFTkU0A==
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf72kya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:34:44 +0000 (GMT)
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-8649be94fa1so13893139f.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748021684; x=1748626484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpIQ2HIQmyKL9n0F1Us1KUdUnZl8RYntEsnVzXSr5aA=;
        b=ulJek8ZtiCFGXAKy3X5/+gBDtB5vKA8w5rm1ILXvqFR+y1XdEcKebofBer9fHtAScO
         trTudIwHF6aKwbEVnBpkStdFyXL/4A0z6y7IkD0Z5dD3Oig/EZvPKCoga5X6/OVItLar
         nSkUiLjnAy1BH0hXJMwy2m8KXdNZLJ/FXAPBsAW7dq2KoqbUeaLXd52mLv9wxq4c8YRV
         zwFaNti4+p5/m/iTKdry+GD6j14l/cTf/VEyHK9kNGAyhpGR9voH7yzy1ugoym0lyOOF
         ekdtzUS3ko0YPt7R8a1EzjpIy4ZlFGmCWdprKxBGfxsWRRxvGwBAZyiCuMoSuOzRUtih
         0QNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVf2xElWNoKOu1Tur8LfKh5z9eIKmwM3E1uLCMJDoJoTeo9WOU71DHMKWrBMAsDvca2wZ70f4u7a+wFVeY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkLyekS5po7Op421BodR29UN4vJpwhE2k+Ko8uWarjGVVGjBgc
	Tx041ZKfJeTIl7cC/i3ROfJoODbQDePq5fVRjMQ8Wvm8XSYurG3EYYBxnVjlDTHFuFDdCkwQmu8
	QdvR5DtcpisMwD6OBo4TkVs53bBnahYlR5n305cKShrvOTEQtf/WzCWWg46ajwj08z0d6st8bMB
	M7BQ==
X-Gm-Gg: ASbGncvXk4VFydS/mPd02ZDR+Udjsj6ylQNCYpAUj9U4PZG5ku3bFEDp+G972T0r32z
	Fa3V14BivFvp569y3MAhCQe5Qktmo3tXzwtDJkkEJowfBqrxY3VmuxEa2lq0MSpTmXN3Uc45NJC
	Tr/bN/SBJ4uOwrIi1/Hp84Vd51LYTEFrOd9jGDmavrDGwUuXsylaeeSh0qBU9p3kXUviK1bbynm
	UbOe+QXl6laemMUTHN7m8KoFle5qqhdN9X+/DjaapCihd7iZafD/rAiM8IMD50ekoGAhPS6qj0v
	E7tzeNEC+eZ9Uo6N6Ihob2wA6Lp95uqNmQruNfYRBZ7Ojq2vuif3gHAOFZAYAIzi0E8a1WuaIPo
	=
X-Received: by 2002:a05:6602:3a09:b0:85b:58b0:7ac9 with SMTP id ca18e2360f4ac-86cbb88b094mr25815039f.10.1748021683706;
        Fri, 23 May 2025 10:34:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4mcSOTkbzzIaBttkmtFCaM96ugRwGpROWNL8PQZqldtcayekhbIB384QPkjqkoTId6vfA0A==
X-Received: by 2002:a05:6214:c6f:b0:6e8:f940:50af with SMTP id 6a1803df08f44-6fa9d2aea07mr4095916d6.44.1748021672378;
        Fri, 23 May 2025 10:34:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3280fe585cdsm35586281fa.71.2025.05.23.10.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:34:30 -0700 (PDT)
Date: Fri, 23 May 2025 20:34:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 07/10] arm64: dts: qcom: sm6350: Explicitly describe the
 IPA IMEM slice
Message-ID: <v43htdhyjujepa7xfyavyeuo22snagy62ujr6cjvqeqsfnedfw@6lyo6osjphem>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
 <20250523-topic-ipa_mem_dts-v1-7-f7aa94fac1ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-7-f7aa94fac1ab@oss.qualcomm.com>
X-Proofpoint-GUID: SEg89gXNSCKPZrf2Ewr0yY1VUOspmNM0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2MSBTYWx0ZWRfX8thMexeEi0eE
 hp6YkzGyaFCBUrCzV8kQINVaORX1zIECtI5UwcrmMDktxDN9Gj1c3mfNHM3bPmUA9lgXImoNDeO
 sCqkDpSRvumPjNMnHwLG4O7NpXHKI/KrzGcHsZrzrMvDkvuuwi3BBFuUSG84FxuhDu2hqVrDmdz
 sQXI6RsUswImB3i4DqIAD/7U4d+Ewo/7DrbU23tCAGCRwcwNCZ9eiZtb6k6HkvCNEpYb5S17Zwy
 NOdhekL7OlQnPi3ik5VOConrn6cWpE/we3hdZ1CckNavnNncbWGcOlJNptBUBcxoiFFz/mEnJHr
 L/Qt6gH/MLCvki3mbVlLVySHo9NluwnaDoCfAq2/BvV7nW09+dnjW05gpejUEmtKaGu2/KfZMTy
 HsMsjaSNiHG2r7k1pXFL17a9o1Fxm7KHn5yjmXgpUmoJB7ls+pGvGWPDs511T0Cuz2rMdnty
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=6830b1b4 cx=c_pps
 a=WjJghted8nQMc6PJgwfwjA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=-1wTwS_U_3AHh5BLjrkA:9 a=CjuIK1q_8ugA:10
 a=CtjknkDrmJZAHT7xvMyn:22
X-Proofpoint-ORIG-GUID: SEg89gXNSCKPZrf2Ewr0yY1VUOspmNM0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=705
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230161

On Fri, May 23, 2025 at 01:18:22AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> As part of stepping away from crazy hardcoding in the driver, move
> define the slice explicitly and pass it to the IPA node.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
