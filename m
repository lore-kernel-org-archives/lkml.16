Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7051F3FC0
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 16:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746375232; cv=none; b=oTs4DzjpbsYbbgmlYidh7TEiFeqU2jbOXDY3F9WuuMQ0pNU8m63fKwvY/CS9OekisePk5tOysFn6G28LqLGGvUSq9u7JR6b062/d2qwLQfbSzW27tLSD+pexcL9LgMWi86wCqDHd2FP48VyL4ckyzCNdAarMghCj+/Rb0qN375k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746375232; c=relaxed/simple;
	bh=97RKXDzDoG8OCb/93VmDNkU0PVNnI64ZdE+LfZVjE8E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mly7pelfqPjSxg6suVyn70u/1BrQo1OjevPoEXXYE2r0UBtUF66A7kV1eUbBsybJBgs69i3TrOwOdFlH+PRk59rfpOP5y9mCb4b/452f8Nodx0zmpKFbdnu+Ips/vl3hokFNExrw1whcUxYddYGB59JoNjK8E+sL+yfD0Fc1/Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aZjDiq17; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aZjDiq17"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544FB1SW003676
	for <linux-kernel@vger.kernel.org>; Sun, 4 May 2025 16:13:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6kXjbNrzMGzMmwsR/qHDXl5YJYMxf7IlPJm6MXrGTCk=; b=aZjDiq17KIhl1ALW
	clqtbi+CIZdf2/GxD1LQVuQLnsOWSN3Sc2+Tb9lKmIKCJHaUzRLENzKHOXxRxdbl
	+kxerPxTRIiT3GSURePl27YOfEoeg4pjbKH4UPMLMbg+7lthLZLzPJOZRxyPk1rI
	cAahuifJ25pVkQ1EUSefDjPRMo/VGLRfE2bnUVYJBXHE6c7uw+LVaNwc1KvsRwXZ
	XfjjKcJ19EeqqmGm0FXFb1yiVvMVTLIF0Djo9VxBFjqZnFJjqCUxm8db39U9WkMd
	stwaAP2O6Jww1Sep7/uHuchriqAt+49mTUQRAZ4T4ofFk23M0XCxGNRZC/65P0cW
	G0btTw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dd3n21j4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 16:13:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c544d2c34fso554203985a.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 09:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375229; x=1746980029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kXjbNrzMGzMmwsR/qHDXl5YJYMxf7IlPJm6MXrGTCk=;
        b=KaIJypucPBhkY4cY4/BP6gKKqaEnkKPcRdnkZw9m+KWgrdKCp9RV1qCacxsoEwSHGV
         yJlpjZsxWNCp+pLmgIl3qDz8uq24TwxsZXB1pKVqPD169GguIMVyFTCew7TfAcCNdNCX
         mHEbQQXMFLv8xNIappm6LTJHC0gPLgK/l2T0k/1CTo0bIhO+/+c0/qLjZ7/6M2fyv8rz
         gfwqQJm6X8mTHPbQMgolkXrjWuJzc5/diomoLlJ64zYXCFEdr7XCJpQakE2x1fQTzqrB
         MmRGvrJwTNbK13Gw9ENdNOclvFmAwJbWlpLt1LNtFUJ62untKNhnHX5n8Tt9AQxntJ60
         SJcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlq7K8iZZ3emCrUQlI7FpUYsvpLfeXCr0v7GEWfUzJrbKijaKCOq12tS3OkdvmfGYsryZaMBGVuxhI2SE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxSapv7I7imokEnPXnUQR4jZ03+BvGeNNPzPy7r/Eak6TU+dsh
	BzbggNzZxpWrJpNJwGxlwl1fqwvyI/0GTUCrgosGjwMr74AGHAA7Q+W+eod5T23LjnAeduw5YIO
	k3W1vAIHrNGKk7uUXaAu/YIbLB+qzZA75WCXcE75O1cR6eMlPgZ5n48Ci9iQaDkI=
X-Gm-Gg: ASbGncvr6o2zyfZXNvY5pcCmh9xgn/E8YeZH0nt7FR/ebKQLaSTKXyLa9yPZy9nCnuV
	ZMZoGoAloYL7E7mXuYO9oxhgp3S8ChwGWB3XTzfm2h8FluT1bdWQVGUZ1N5jtPHJjLVXlo3CrAk
	Sud0GfJIQeoiG0reN8aobfL7vKZV4GtiecDh3tSbhL0CRINGhlTYrRoZigGh5D8BIDLRZZ6k5PW
	YbJSRLp8xQgiXJVsnK0Y7jRqHat5SZUn6K+XO3y6siS5RgRrN3P3BdVFWcj4lwJ/RBBm6RNH7cl
	BCp29JrIYOgWbFBON7VgZsuhutZ+IK4/7JPxcqvZch44+Iqclgd73I+0AMCkqXvMV6/x5/P/n2L
	zUM9ycrClsrJjQL9jYOq5X4QG
X-Received: by 2002:a05:620a:bd5:b0:7c7:bb3f:fd40 with SMTP id af79cd13be357-7cae3a89beamr601651685a.5.1746375229639;
        Sun, 04 May 2025 09:13:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOpfARWuH6M/BB8J4jIJ9/rRDdEqKJLyqrBgH4bY43WfHx9v+3pxeLlRyLuaD9LSQ7iLIxnA==
X-Received: by 2002:a05:620a:bd5:b0:7c7:bb3f:fd40 with SMTP id af79cd13be357-7cae3a89beamr601648985a.5.1746375229307;
        Sun, 04 May 2025 09:13:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:13:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
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
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add interconnect nodes and paths for MSM8953 SoC
Date: Sun,  4 May 2025 19:13:28 +0300
Message-Id: <174637445762.1385605.6437405000222393314.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
References: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfXzhKbSOqHaAXW
 A/vguy67eRf4YeLOTJaxRrS2jcRN8nneANjkxxflvjbP2t2w2qaIEvipd8gF2lHh6BR21JWuaBY
 eGyzrK7VxzJEZ42+6HYsCejlr5eLN3E8TWatlPM2XNa7bbExEsOzg+2Q7iZ7x2Q0fUVEr41Fdui
 t73whbhevg30cn+11QRGdSbpQW6/iM6vr2fj9TlaCiJpC8d8IMLA60VHPv9R44YS/d8veBgOZ9s
 EzE9PxBmIsWXH8yiUvJO38QzoYKyDQpvQq2hTTP84KhwQQB2qtZFDJp+k4YCaTUeXltoQFdNcD8
 y4uf0ZHImmP1e9CEsuV/E4TkrexZgeaso+Kso8ljEpBam1kykV0jMjnojBMWsJNKX0q2DxrxqbD
 yF8R1f6ng3W6NoXif60rmVsoeIncEDvAqUQ8+gwnQWAcZU/Ohbj8Agyn4wus09EfVpst5is4
X-Proofpoint-GUID: furf1WQUnq-BQY79Osp4mBWCvwvWJvzp
X-Proofpoint-ORIG-GUID: furf1WQUnq-BQY79Osp4mBWCvwvWJvzp
X-Authority-Analysis: v=2.4 cv=UNDdHDfy c=1 sm=1 tr=0 ts=6817923e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=j8xinkR703XPaYax9wUA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=878 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040152


On Sun, 20 Apr 2025 17:12:42 +0200, Luca Weiss wrote:
> Since the interconnect driver for msm8953 is already upstream, let's add
> the nodes which are required for it to enable interconnect on MSM8953.
> 
> 

Applied, thanks!

[1/2] dt-bindings: msm: qcom,mdss: Document interconnect paths
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6694d17843e8

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
