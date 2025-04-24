Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96900205AB2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489926; cv=none; b=pC1BJc2vXVCLPvdEeaqI87o1Q5NzoU0+FZV/QeDwM8VTfmaYjHFX/fztSJWAf9ETawbWGC1Yi39DsFXrrTi0NhzTBfSYac05N/xsVkWR5aXpfhNOESrK6NG7vjZUaP/sluLpvechMc7zjD3WZZqwIu7o1f6UA57PS+hw3sCSqRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489926; c=relaxed/simple;
	bh=VwIF9MZwN8skAcnpaYsKQGj6HgJVPjIpATiFvE46JIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1nsAVzwK4AT6oZleEKVAnXCg0oKMWVZT3PbQnMd73gi/oVjwFKVO0oPkegDgzzhyXW18mEaJRKmZKuHr6eFv4xJeAJCUZTV5O7JLkgu885F5l3OcuheUNZHTHyEwMaHqaahsUyy9auxqsDSilNv6C8g4FpwGMQ6LXea156xRXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fXWNQZKA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fXWNQZKA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0Fkcf018009
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b+CZ5yvanwkNwsrX8wbr0v7b
	U5gRB/4DWTNm7EwR2xs=; b=fXWNQZKA5tt55ydMaRlEOxI8rt25vsq1M699s9O/
	WjAuarD1DKKd/nTTiQg+ZWmsp6YdMHuDoY1nIznIYRQAZ1fNRQvsM4QKTF+Sndvg
	qhAAMFrcLtQRbVD261Qae/tRoQk+oJsYcg/ja0VbIvdRjFriWLU4a5ltySvZM5sG
	wq7xdqsPuiHYVA1F2VLk90hltCiiWf/MADWXYbhM3kOW5TeXA2hqB8+M+NPcEjR4
	Ab9MBQWGe3HJFKcCEav7V5ksv9JmNneYYkqCTBKvRxjIjC8ITyI9YGGbfd2uEEpa
	O1mRIo/TcenQcgSu6mjx/yu8Ug8uKDxmv7CuPBU0SWJigw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh15416-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:18:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5bb68b386so243601285a.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 03:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745489922; x=1746094722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+CZ5yvanwkNwsrX8wbr0v7bU5gRB/4DWTNm7EwR2xs=;
        b=VFgyGwTTgMYgNE95hBBVg+V5MxQkMbM9RyRlTFn7mRrv2xOyXhlXBt50BWFmfBvC+r
         v/pa60LzS7hFUrmVGTigFNGDH8DMhjKsMbtfrDaVO71LBcjbWXAXGB128BdFI0pv9csK
         GJnfa8RkBclUf0VdjeeiZKxWdr8n4fStweoGns5PnJ4lXUlMHH70rkjPsb0TIZfzQ/YM
         Oi08DhQdy2/fxa++VytPvI/LhWvZIYQBE4xkgaapIVZx6fLxyzAHPm1gXgOSfiq+eHX/
         hyj3c4kQXELnDGCtVBQ6x7gPuLDd6utxM/Ai4T1SAb82Fu9IB7s4oeZuaHHQfpieq07H
         tJgg==
X-Forwarded-Encrypted: i=1; AJvYcCXnmDEyO9Zys7PrbTUMu0aTDGr1X7N6RdOOROEzW3vWAwrv7gLGlyUwoQN0tbnGZYQ+dE8s4YgSWzxwr9s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyeg/tYlOuBi1e3B3VwSUGpg3TnETyevwa/ZYf2dY/70l/aV7Qq
	avIRVH5sd8bLOn9A8w1Ze/s/X87nnRYBlwV8eVeVD9do1u3qSC68J2OHc3f69//C8pOmBAU/KF5
	D0oxVlGg/ZJKt2mQAVkRt/S07pMaC8qloM4QnJjcePVTcf7G+mIt2I6w9Pdmq3Aw=
X-Gm-Gg: ASbGncuLrwvTwtAa9m8y0E1cRbmpoqsBxzEoJOg8yoCzL328vIsCuIX91mON03ipxEE
	lF/ggFbnG4V8KxMnTgsIbfWrY6/+9+0kc4gfMnkPObbtOiteHb3p8jyusyBGL/zbYJdKA84eSQw
	+DmVkzaZkhoh5X2xREyYWvKg/iHK6/Xov9KjIK/c1JB3iy9KBAN/JX6VCfJShCH59YoC0TumkiN
	S912OiJYQwQo4vBSmXIJmgVqs/09ccSNexCW93dEgXQF6saRdFBdhlOXgC7vXm23hRnNjSThIic
	4cVww4SFZ0AVe/x51+dQVUwp6OcwKvpJNfLfFnJNVs0yMKOjOD47TAkAgbOBrDyM4sZmtmR0pV8
	=
X-Received: by 2002:a05:620a:2453:b0:7c5:4eee:5406 with SMTP id af79cd13be357-7c956f5f787mr334007985a.49.1745489922690;
        Thu, 24 Apr 2025 03:18:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUyasljwk71lheOvieQO8GWyGCHy47iFL98wqeOfteeZQyBP2cQ9ZJ7ujqmqOzXQolEaEspg==
X-Received: by 2002:a05:620a:2453:b0:7c5:4eee:5406 with SMTP id af79cd13be357-7c956f5f787mr334004385a.49.1745489922351;
        Thu, 24 Apr 2025 03:18:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb26242sm181296e87.21.2025.04.24.03.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:18:41 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:18:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 10/10] arm64: defconfig: Enable QCS615 clock
 controllers
Message-ID: <2gqcoofsvftuvvo7fl7ktkevrhjcsmei423qjdownslucqezib@xpcrhcwnwn3m>
References: <20250424-qcs615-mm-v7-clock-controllers-v8-0-bacad5b3659a@quicinc.com>
 <20250424-qcs615-mm-v7-clock-controllers-v8-10-bacad5b3659a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-qcs615-mm-v7-clock-controllers-v8-10-bacad5b3659a@quicinc.com>
X-Proofpoint-GUID: jgp4bVkSMYvZeKi-XgNL4xBTSTrUlaSy
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680a1003 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=mLCiClLL8ZwIBs7X0_kA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: jgp4bVkSMYvZeKi-XgNL4xBTSTrUlaSy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2OCBTYWx0ZWRfX8vuqw7Hu49PE UH3nmAUlIK88yVi0uvpPCKLT4wONGfV7G2Odd2sFTb+0VvCbsjy7cnxWPJLGDPWij/EtMaI6+aY rKTYpOrUQnygYzkcPsLQoKi9+NtjretgkioV9OExsSba40My75aONl8xpdAgcf9aSeRTliz+Mpc
 a3yPyFnkPjwhSDbK+5feMTPa/6SCw+ldx2pTtiDOUxlBdOJgDHeyMJT+N5D7i1gQ13ZJdD317ds LdOlVufpXf/gp82NINv1tNct5NMvrjvB6M6wKLA7O5HNEWJiVIKEqdxP7vJ/tJ+/AiBRYv0b4zI fyL3vUOJy2831zB8tbWBMpksUbiE96RNBnOY4fWSC7huWFQZyEZ/pFOwJ5tVm+KvL9k4JELHEVU
 OOPhup6k3ZsNZxn9d/sqCPtkMP3mGS2giw7xZuXrCqz8Gm8NVwziTeZrhSDXs1iT7lB3aGHh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=620 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240068

On Thu, Apr 24, 2025 at 03:03:05PM +0530, Taniya Das wrote:
> Enable the QCS615 display, video, camera and graphics clock controller
> for their respective functionalities on the Qualcomm QCS615 ride
> platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
