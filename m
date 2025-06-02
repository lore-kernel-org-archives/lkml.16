Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96D718787A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 06:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748845068; cv=none; b=WbBbcC5c2RbkfHKHrZWLzDoOPLXk5mmkqIdA/YuKi7BxHu7u8vrjr2VkuADg+TbA/6eGtAoa/BzO4dgKWDc8AX/35E+k1ytL4DckgOxY5XwJzSFg9rHg06LYGOT4XJ6PeI2WDQK/onHO0ez5YdCyTV51WReMJR/T7UTLxYnpfb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748845068; c=relaxed/simple;
	bh=CPZaR4EI368+qAI3lHWNS2wXQVdHRdGqRCZIxygqlUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GpY4JqoqR/6kdkW9HVmBflpKoNH3+2ITDN1Fm2zCON/QmXb7Xk0NmNRG+imt9ghU1bNUuYF817vIfs4scQ1Wi1ohMbBhHcKdJA8rQdo9cxXxbt4SfWB5FJ3iXICOKjrcaU3dsdeKvWKwSvKNMTc6/HAWw52yOrSNxAueo0z65Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=euq5XaOu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="euq5XaOu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 551NKmLb019787
	for <linux-kernel@vger.kernel.org>; Mon, 2 Jun 2025 06:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uWhhuDrzJ7payPyIOKXiW673
	AvOva7B7U3C0U9pnehA=; b=euq5XaOuYWh86iSwhgsrlsNO+OuI8kL5F+GKjV3n
	mXv+Pn8XGh5G014Z0gKEkLqTpNe4rdYWblFrUl4ZPYsaOxnJU9pfIVqQ+8+0oFIw
	E9SkRUU8abO9Nn2ECJ9/26keA7WuhrUFBV9WANWBqg7V9Tef+kot032a3D+/GHHQ
	pXG314+MxTJUAXlYOoFQcW6Bu3Zq34ecomILrMZrVMMYW7mkXJSpnq4nU1aiUVpk
	D0/OnHMbwCtJhJyJgNx90kxhh9xzDHYSUCtTJaOPk54wovX7oWoBEFnZIZmOHGGU
	YZF3pMYZM0RL4uGchiaxBuZc/HKQM4w5i3vBeDKmYT6XLg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46yu2a3hfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 06:17:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5cd0f8961so848033585a.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 23:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748845064; x=1749449864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWhhuDrzJ7payPyIOKXiW673AvOva7B7U3C0U9pnehA=;
        b=kcybRDA9qsTnUXcUuBJMHw5urxaL9uddoSctYHgJ5eApf2pbjUwGT11vf499IwgF3M
         ZAjXSbbFk7ruKg4UiQs4PWmj9bqwGZHHFplhe/zvr2R2L9tTcvpWktGEMbGC7FDiQljS
         dwlqcJh/MWwWZgWzEqSrGzxItkvDnE9WlAOvsHdGGG3eIZ3UJfnzPUsDaAqO9wIyYFRT
         QoJWNcoATJUl5mzbyqRozvK9AoRC7PiOi7fJnEwwkIwWkp2CyhKtI3K/GM6+axqoYwqk
         r4DPCqDxivHWjeWT+slm3MGsm3ZwmfR9kkKMZE3fZuQU0n2Ob2yqpHwbH6Hfp2T1IHhH
         1XJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdhX0UYd1kOAM3aZnPS54mZhSfXd+ONIKkXkLZJoSi9rwSwrdqAET/yj7gu0CyM+VSb+KhxkSGSNPuOho=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNypuj+fC63uj3nv2PUGpS1u6O1k52nPP9yC1MTZbwkxtdvbjz
	STrs/rbvM6eggoR8OxjchziykDQ7JNL+wOXjoADntFwRqPnPXCVphfS2NqqFrVOkL0henG9LmEk
	nVDj9dPTnx2Z75qX0F9HyF91/M5vyjMCrqFYmvUFX8pvD3dsbR1xz/6SCZF4riA2y2dM=
X-Gm-Gg: ASbGncuDqM9gBWeLxIfaBGvCN0NHj84rAii++mracaxMB44skISkiYd8G0F+MPCPjfn
	gJp2J787tXFUeXvib1OeOfoQEFEyLTOehkw0hLWhlFsWqhph+6m6XhUILdPtrDNBT77m4Z1uVZ2
	q62Hp87aesTyATP8uUdQ7/M12Z+BhoGIgT5XZTG5SwlIRNlQdOPLouRpcobb/SMswOOelxL7uJh
	6h3B/IQ8WdhO+YdSusaIewR8Zzw+Yk489as1h270Ictp6Zb5AMUBR/i58yle3szcb8dChSlFHN4
	8VBXfAAaBMPp9jg+dNSgTEfc9hDf2gXo+iNOkEO5NMxZOaOC0sg5Ql6/AYaNvmM3cyFWOqlxtBA
	=
X-Received: by 2002:a05:620a:1914:b0:7c9:6707:b466 with SMTP id af79cd13be357-7d0eac3ef5emr994659585a.11.1748845064628;
        Sun, 01 Jun 2025 23:17:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCTsG7gNV2L9uzFU78EGu/HBkU6UsfPpuVFGPKTZpetTg4RTTOeadhiy1mD9FC/+Ns4ZATsQ==
X-Received: by 2002:a05:620a:1914:b0:7c9:6707:b466 with SMTP id af79cd13be357-7d0eac3ef5emr994658285a.11.1748845064325;
        Sun, 01 Jun 2025 23:17:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533791cde4sm1476155e87.192.2025.06.01.23.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 23:17:42 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:17:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: fenglin.wu@oss.qualcomm.com
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 3/8] power: supply: qcom_battmgr: Add resistance power
 supply property
Message-ID: <4jnxp3pnr4aqy6jaqxnh7ki3uhf7q3552jxs3ixd6imtqlmrei@snohn5bjyt5w>
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-3-9e377193a656@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-qcom_battmgr_update-v2-3-9e377193a656@oss.qualcomm.com>
X-Proofpoint-GUID: p4-eL7bu5L9Dfr5NzEzLzmueQPUGUtgQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDA1MiBTYWx0ZWRfXwhYESJNnLlEC
 qLjPDcB7Q088VvW+ruyfV106CrqK5KSz8KSSaWpSpnxXe9DzwMBUMtnp6EpXO2Hlmcib7mplzkw
 gzKAarrSIJH3TUnAacGUn3ki7lKifqf7aqW1Twb1BpMjOjHV8zQPMJkjwsh1wGudM1L6M9UOiT5
 FD4WNWxDXen9kEz4FXhHoJbFUSwG52jWaBaxMyv3zmef5jpYVF7mlHAT0CNyCnFua/hQkj64ENj
 AaJoyOx9f7OyP5HvQXc/s4w0kXm9Xv2IE7Gf0ZNJGE7ZzyJ+/lMQeiUfC6plT/OhNUODRTNRlH0
 eoNWhHl9P6LwEC3eBMTCFntWR5azoKM+1VG+yNeiwoNqvCGOO5d64HWF80XO0AcPAe+SGzeHX3g
 l6kXP1TUVLYaVh7c49WKxUvtND5c0rouSAQ81XiSByyOWegttCZ4cpiH57AhHcli7FX9cRWv
X-Proofpoint-ORIG-GUID: p4-eL7bu5L9Dfr5NzEzLzmueQPUGUtgQ
X-Authority-Analysis: v=2.4 cv=WYIMa1hX c=1 sm=1 tr=0 ts=683d4209 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=zDes-GqUf9req-RX5QcA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_02,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=883 bulkscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2506020052

On Fri, May 30, 2025 at 03:35:08PM +0800, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> Add power supply property to get battery resistance from the battery
> management firmware.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  drivers/power/supply/qcom_battmgr.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
