Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18BC2641F4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744103612; cv=none; b=gjL7T3oopbB26zZMJxOpLIgGOq3DCPB2H9sFwjhUvn3bOnr7Vt/wvgpnHD+gGimk11fwQf0paZRD/AxyQHUjtTva3Kdh9irlYwJVrpqUfE/RuWZcjnEFMhzhRV+yZGpvlffY6Bss1La4El0pvN9iXv71aI5xbDK8/nCfJ0phMn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744103612; c=relaxed/simple;
	bh=tCGz5KQVipv/8FujA7ugn+DYGSAc3ViSjrcCSunJYhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IAzfl/H8ekZGQQhXQpCGT+fE2TtTbmFB1o7Q/10gNtfGZGVSbgNQORyoOtiBg2B9cmJnhwvh4cibkrADqGcGN7rrhzrMqywE7hnsS1Q+ivHirWPx5Z3ZA7KoTENQ9bNbNCX+vrOxVqrh3M6XY504H7rkPidPWBgIM2g5v8scDqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LvANpkQW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LvANpkQW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GYY8010566
	for <linux-kernel@vger.kernel.org>; Tue, 8 Apr 2025 09:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tCGz5KQVipv/8FujA7ugn+DYGSAc3ViSjrcCSunJYhw=; b=LvANpkQWiWyboFs3
	P0399o1daRV7I8qGzUPKO4cxiygWiSHDu4rDg/LaV5CU7DyxnPu6qouHIJRvjzzD
	bthKccv1p6RVPlYmD17I6vZ0/3memlN7GURggtSrV+ND88FNky5a+QLIvwaTHtPu
	gZrH2BgJFu/q+KewaQBAjdSvZCLsyTNPw/Reumr59b8rk8Jp7H5dL93bDY0q7YjD
	pn9h4cEAdNFTBfzz48oLbukdF/1T3p3fQi9QZKEwkCnzoVpvN1hDWy+DzIRVXkOB
	UJBFZ/nGAiLrLQ5jKlYlHK/wda3rmrEYT6ua48eth5C7Cnf24E8djKLQhwHZggKW
	8kBj8Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1f3kr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 09:13:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8ffb630ffso80538366d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744103609; x=1744708409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tCGz5KQVipv/8FujA7ugn+DYGSAc3ViSjrcCSunJYhw=;
        b=KV3hrMYYwlEU9JkB5AJt3nFXI9RaniCQWF0iF9/FDHAZ5jdhLdTDdQYyFQm1OUVR4P
         3lxSY1mAJjGGK8udPiZsChoDszihtx4Sg9XD5zH3jK0mc5eqM60/XXDPzUvO6nyrZBWN
         Yg/F9Lo/MzExxO50GKFf3Ochba0XS64yauy68yeKHYXupZjR9UxG27ZLTe5nLKgXO7YB
         n0etyxZs1Hhx3yCkGsPLN0xSaWxxBQJMHzk4OB/eMOIYmGs5f2XFkyz8giclZ5IjovFH
         MlPjZgYeeNaYVYV7ptZk4TMp/BnQYx8X/AiO/vg1kauFp+ddjo7fU5U+MOu2LCBGCmqL
         5kWw==
X-Forwarded-Encrypted: i=1; AJvYcCXDZpfOAgkeLQv82c5fCnk8clQ1UriqIFvMbK5H+RM1yv++795kz9g7brMEXW6BanRWnP4DdHmXchSHsqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQJWpOvR58kd5cV5JTN4b7BtgLfmwLB/XrF916vUytr8CzPHGB
	21oMNEPkSuQLxuC/0IggWaZoH3ZN6Kos7x5Z5EbgMilWoCZcODWBAaJDRuXd/ULed2pOuG7j/Ej
	nrHR2xUyQLDY4p7sN4+pnsmQlqDXovhvEQ0mlExYI6ao9VGQs6oahvpL0vikY5AYeARD2Ek7/GH
	vLZ4i3PcQcjOTha+ZWKUybcP9vfudNj2iLiwTNvQ==
X-Gm-Gg: ASbGncuU7NIXtkkBE0sCrhLN+kN2tOrlne20+Llul26ZCE2Nmeus4DNURhuWkoCPxDm
	2mWTgUQcEgnpCaeD4e6mnDnvc2Cv57Zs+tpap/OMraAERmNaPkwwldR457WbLMxBnZb4FODsdbw
	==
X-Received: by 2002:ad4:5dc8:0:b0:6e8:f166:b19e with SMTP id 6a1803df08f44-6f0b7467892mr134571196d6.17.1744103608680;
        Tue, 08 Apr 2025 02:13:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSkFpxkTp6UKXrMGOqDzSHCRI8idixQPMSOhESHrDY4X3H1hJ24b//y74f+Ln4swPrkCsOsZCgPU8gFqAASvE=
X-Received: by 2002:ad4:5dc8:0:b0:6e8:f166:b19e with SMTP id
 6a1803df08f44-6f0b7467892mr134570936d6.17.1744103608381; Tue, 08 Apr 2025
 02:13:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2703842b.58be.195fa426e5e.Coremail.slark_xiao@163.com>
 <DBU4US.LSH9IZJH4Q933@unrealasia.net> <W6W4US.MQDIW3EU4I8R2@unrealasia.net>
 <f0798724-d5dd-498b-89be-7d7521ac4930@gmail.com> <CACNYkD6skGNsR-AH=6TWeXLqXeyCut=HGJeWUadw198Ha3to1g@mail.gmail.com>
In-Reply-To: <CACNYkD6skGNsR-AH=6TWeXLqXeyCut=HGJeWUadw198Ha3to1g@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 8 Apr 2025 11:13:17 +0200
X-Gm-Features: ATxdqUEoBkExVAitZg50FMHZyf2yBpbrCvO1TJcyi1Ltlp1T8oTppXOz-QXED6g
Message-ID: <CAFEp6-2_+25Z+2nPOQtOzJPgfJM8DAs2h_e6HTQ4fAVLt0+bwQ@mail.gmail.com>
Subject: Re: GNSS support for Qualcomm PCIe modem device
To: Muhammad Nuzaihan <zaihan@unrealasia.net>
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>, Slark Xiao <slark_xiao@163.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        manivannan.sadhasivam@linaro.org, netdev@vger.kernel.org,
        Qiang Yu <quic_qianyu@quicinc.com>, johan@kernel.org,
        mhi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: e5vpwSJAy704FgpEfCRFjoG_tCynftsL
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f4e8b9 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=mThdVl9iAAAA:8 a=9d_Yctv7ZfaLz5H8tHgA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=GbkGdI2Iuv6_No-W-q0B:22
X-Proofpoint-GUID: e5vpwSJAy704FgpEfCRFjoG_tCynftsL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=787 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080065

Hi Zhaihan, Sergey.

On Fri, Apr 4, 2025 at 7:42=E2=80=AFAM Muhammad Nuzaihan <zaihan@unrealasia=
.net> wrote:
>
> Hi Sergey, Slark,
>
> Using wwan subsystem and it works without issues, maybe i might miss
> something, perhaps the flow control but i never have any problems even
> without flow control.
>
> I am using gpsd + cgps and xgps with a small modification to Linux
> kernel's wwan subsystem in the kernel to get NMEA data.
>
> I had posted the patch previously and i can post the patch again if you l=
ike.
>
> Attached in this email is the screenshot of cgps + gpsd.
>
> Maybe it should be in GPS subsystem but it's working for me even using
> wwan subsystem for months now.

Yes, I would strongly recommend doing the extra step of making it
registered to the GNSS subsystem so that device is exposed with the
correct class.
From WWAN driver perspective, it will not change anything, as we could
have the WWAN framework handling this properly (bridging to gnss
intead of exposing the port as wwan character device).
Sergey, is it your plan?

Regards,
Loic
