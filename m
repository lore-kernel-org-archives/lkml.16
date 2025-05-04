Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536121F193C
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 16:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746375230; cv=none; b=VYsVaLpon64DVcBuGyBV15r8t2tAn20Gu3d9od87aRregNrs4pw+MLaCp/ok9YJ1J5yP+cZrEWYa3/pFAbCyRgw+W8HjY3tmIKT/TAhSdotGgaI45ZMgN501LCncLPcyOqoOIvXx/Z8aiSys7XxfdVO0KcBmRhwHNT0GFweEUB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746375230; c=relaxed/simple;
	bh=Skbd065aT0ZHQcN9uGka7V6r73b5ykLWPWeCTpFhdBE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TiQOddgnPCVimlVl9K/3oVPra8CAbYCGyIysMSfZrROXZktTiKduh36nnk6TsskExNltelNI/ZkroWaTGtbDzXjD2UUCPAy6+t29yDEaeJB6w0FzCr/L47HHdKvmT2lzLylvylgIpT0kRcN0LZ4oKVkTBNChMhqSaYs6gWXnbpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p61HPtGl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p61HPtGl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544AilPF027166
	for <linux-kernel@vger.kernel.org>; Sun, 4 May 2025 16:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UZZqo/joJUMTmddqZvrzyvK+OoeIHz4Jyy9kaXceNaA=; b=p61HPtGlIeEUxjqo
	ybywT5R1PFpAyKPZrQFAiTzHEkkKv0mRm11o7LyHDiys31qJI/nQ45V0w0HEnLwx
	Jc/K2zT6KjvWz7OkhlHVloBS6Q69jmEjaxNIa8wxcMzaGwNE2cpfjF74yleafYys
	2H9n+GA4P3pB8MclK5INKPmMr+tVT+rJ7IDT4wZ586o5OyAjnulK0p0Gpok7jnwZ
	Zohh2mA8Gb//nS99mU5BcKvJKYO8aPujBAaiE1DVjYrvTegcOHS0+jMi7BlIcM+x
	vpIhZlTndetVnqAp3JWyG4pCb4vL60Zq/D9OsRhtacCzexQSUTUiJi89EHyazPXD
	JLDw0Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9nkt9ax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 16:13:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5b9333642so416600485a.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 09:13:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375227; x=1746980027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZZqo/joJUMTmddqZvrzyvK+OoeIHz4Jyy9kaXceNaA=;
        b=FfmayUouh6cpn+pD6S13k3eD20eHn1L/M1cj3iQ2gN89JwSbLRKtecXGzSSB/p6NCI
         gz1tgQkYecSFdHjSGv9/kKFE8pNgFm329uHVlS4n714gl561ptVj5aQhw50hNwgFzWuP
         ibC6H8NaWRhHt9IvpSrvWP4EO537rGWSkBnzFBKP55W5yfQZoZgLHevGugE3jaBjor25
         LueLgINR0mWENLxSk7+niTYu82zE86+Uv8H4U4cDN8iH9HY0C4YdH5sysvSngIp72U/8
         6z5LXje0cjYj91KjAbz/0O2+9vbXUQTpYyF2mk61rJyqhO3D+da2yNXCAFKn7rjLJGGy
         Ltnw==
X-Forwarded-Encrypted: i=1; AJvYcCXgT0UXuzy/Ir3FoITsixfNkd2mTdmXXLydQlw+KUuIHqs1mA8r9gjFllEpXI5MN9nfG9CGfNHkWB2OzxA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8t40DlS4y2po7gkO896AWUPp0QZFtl1Guij/IN6P/IRxsfr/K
	lIdqJuK/7tM7YfvHu3afUMEdxtbcnBaJdUjnh61A9+yC0Oebb+pScMqrid7Se64u/40smNYYw+k
	YuvbqoDQP4J52FyR8nabuq6i/rYJWtaFZybPyAGmDB6krPihasm6aqYAq6gqYF1g=
X-Gm-Gg: ASbGnctqni7xVUx9c6goDDmWlqWV+9AKwOQvpgisl0MM9slFN+ZGXi/aTZ4fc5dF/v1
	/LCl9w1BM5kI6YruzgnE9gjz92DyZWyLgGrzSkc3Ryg3y3QhBa/cy6BZVVlP5vHu1Vl2sw6RuxV
	NTRRVKomr3VaNkdCIkiFKXi83TKpVX9uO+zygiXO0yVlN03NfgkiYlm6nnLPe09aa5Efj7XjXTz
	QeNSkqIr+dBnAVSPe1elihNW7s5Hyie9i6aeZ9q3g/a3TqcaoMBMG0Wo6Hm2pACwkVya7viJdCN
	iGsVnpnMTGOh9LdwqlYWcued+IiFuBUmfh9ET9BuiiP+GCG/Zx8JNiH41YQGuf4FaLa15XwQKIC
	z6CVrBa/rnC1NxmQotwFaBLfT
X-Received: by 2002:a05:620a:414f:b0:7c9:23c7:a92b with SMTP id af79cd13be357-7cae3a883afmr521803885a.8.1746375227096;
        Sun, 04 May 2025 09:13:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWfqVRImHTF2hlg2i8dPTXb3VY+dorTtSOXnHwH9+M7i4F2YAepO0JanfpdKI8BQ8brOlCnQ==
X-Received: by 2002:a05:620a:414f:b0:7c9:23c7:a92b with SMTP id af79cd13be357-7cae3a883afmr521800685a.8.1746375226766;
        Sun, 04 May 2025 09:13:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:13:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Robert Foss <rfoss@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rohit Agarwal <quic_rohiagar@quicinc.com>,
        Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-usb@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 00/11] Various dt-bindings fixes
Date: Sun,  4 May 2025 19:13:27 +0300
Message-Id: <174637445759.1385605.15383087742490646226.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX6fDGDQpWaDwY
 iIkRGukP12LITdzGSpPLHtroogm0tsPLnW6sRzs6hhPJFiacMDNTdZRZ3822vy+3D316Y+uNVln
 1ikoAY6nyzIdDgRHz9pD2DN+HzTH4fRocfG2DDcSwDF9EXtDwpdPskA9ocX+Ps4OABASbLetDWC
 b6rVdR411figxaidUy2ETNAD0ww6ta96wtFdal1KjICo+SpZBJb2KXfAZkSyTi3Eq8OuGRki8DI
 /rnMuhW89bAnI5y7jEKWcUytHGwnU5kpjDwPohyMu8mLI2Vt6C5RqXKb3Zyjp7EEyqc/Sbmfi0t
 tt0dbjv0B3X5hZvuB8dFFXmm15/cBd9MbFYSImJN+I3hfH1kRd74qGWe5+L9Ao6qN+zma+YgA+D
 hhH2Be4U8Ao6YxeaguYhr7G+tsYGtVf5RUNL3Uc2EvUU2l1v6CtTenH7WDOdGzwaJJt4PuKT
X-Proofpoint-GUID: fgrZkx60Q-_qcQnWmcpuFF60v0hzSu6u
X-Authority-Analysis: v=2.4 cv=LpeSymdc c=1 sm=1 tr=0 ts=6817923c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=AprTATsQUE9CPNEuHX8A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: fgrZkx60Q-_qcQnWmcpuFF60v0hzSu6u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=816 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040152


On Thu, 06 Mar 2025 19:11:12 +0100, Konrad Dybcio wrote:
> A set of not quite related bindings warnings fixes.
> 
> 

Applied, thanks!

[02/11] dt-bindings: display: msm: sm8350-mdss: Describe the CPU-CFG icc path
        https://gitlab.freedesktop.org/lumag/msm/-/commit/60b8d3a2365a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
