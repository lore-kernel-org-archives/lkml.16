Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726AE156F5D
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 21:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748036595; cv=none; b=txuk7bkpOA2a+ASTIJvLO9VLhNKuKX0isxKG7f3eYUXa7Qu7BryUlFYIf8DtVRXtSeT87PtShiaiiwGB2c1BHYX6Zzmo7z473uk6RCtpQLgOayNcRwq4PafbzVXREHegAloUgbF0K71eyTHIy5msJq0oKIhaSFd9tE/ga1lwKDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748036595; c=relaxed/simple;
	bh=zmqc7w1XQdZKiY9duDOtn6FNuNtSt44PM697KAQVHGc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=m0nwt+/4B14jnu+DLD3KyeApbyFADskyKTjMDzi4uRa1DUtihpwJBSyq0UJ2cBj1XqLyugJ4Zc6Lxmn6qLpH402jt0JBwJuT6N3AOdApwCPceQnwdcElbWr9v4is1FJwtFjaahteN2aYm/ruCBB9byU+jnC5eEiaQkewfaLBOhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nnPppKdC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnPppKdC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N9cMdw021878
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 21:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x+0WOrSLVzx1QmMfqvPr+uPofC1Unku8ELEwf6xozuw=; b=nnPppKdCeEdY/aTT
	gObDXhuTLh6YVJWaP+otBQmd9IyrT5JDAuLQw4AATwIcQnAyK4aqbcTZZLDU+ptg
	zHK5unRflPwBDMFaqjtUSsxAPdhbMEgRR63lQjKt0wDwsHhX2ZZTVok5KtPuDm/B
	Gqs2faL/o3bOZpUP7ZbBTHbwDPDx+Imb41at8U1PkC4OHNfmIU6Ga0/OJjQL4l5A
	ktfYgXe4HsQrOYxaicQYG+PW8adXCn3Wea1XwxDjZH+Gx34CUXENwREVOERKdGvF
	Rqt+VTZpJCaGdudCQXuv0X5JdyNN4CXpJyP6zm9UJBjPaTCB8emUVG4Lar19llVd
	IcHmZQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfbb44k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 21:43:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f53913e2b6so3526716d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 14:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748036591; x=1748641391;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+0WOrSLVzx1QmMfqvPr+uPofC1Unku8ELEwf6xozuw=;
        b=onUH0M+SoGkp6zVuxaXlBmUBVD2xc2tefWNvqigDs5DshSek9yp7mrlNT5S3fpK2dx
         8bVjKVbam2guv8zKp1sf2kLhsdUQ5V7GB0jOH+yjw+GiwwVJakJbOwIMK+z9Ke8UNq7u
         eSQV//IDZ+6C109m8vfE2HiGmq4DNDe3EbQHIZ7GQXp2svmYJOS3ixS5ld2fPl/Qqm5X
         zyc/olGbdHpi5OG8/oioo8wHv24EbaS41btleei2U7YmIMmngzTkv+a72oLG9r4A1XMs
         JALtywgYYDRER6frNAwK4EBeig4iYEDl+5dgiYnaSJVQFZ7eTpyxi7DpfgbeXLtfKqf8
         /ZLg==
X-Forwarded-Encrypted: i=1; AJvYcCUfv7GBRARIwCalFlYT/HWpN73gFtLJBpdHK6HrfmZzmJTfJ2bCqVbDIWJwGsWSdb79IVxrhWIv9QNUhqs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywis+WdMewAt7p9yNyNMD5CPmqS+jnOwAU6Ly/q4zopqjLWBTEp
	9YgdCYJmvCCZaOfxasSaHaBj4L/SO1vKDU9S2zVShXuO6q9rqfZZTwQBlBrTRe0hQYhWH1pRiNI
	X4q4YN1RLZOyDF3L/VQOpjK40K7ZKXh25udNnXKFJVGm/L3Ka32MsI6P3eWS6d68pEdc=
X-Gm-Gg: ASbGncueikH+R5WSa76WKcnc0z8O8BJ1STDmTYHZpwUqTf6fQVSZNVY5kfwd05jRVmi
	21Bh0DEk2bjh38a7+OvPlMkGDotwtGXuThaX/p0t8uiHwGY+gK9ObEpeMRSIUYlPag3hR2AiaY/
	zNvtsEnjGNUAIwzJBgRPQdVBT+Sm+HiezT5uOZjKUAugGvxFVzj8Yi/GIuagiEIL3/y/Brc+1ID
	z1Kc9I/HgynhCFh5d4GtfjQSUpgyAyaf6V2nROkS+VRSu2661Gi68E1JIcATyE1o84Vyt38NGMy
	STion8r47fUankxGeGoVYNDQ+hgNLJJpLwx7lrNKbRiMtgZ97+ecE02P4AtfwwBokDz4/x2Ue8o
	BX5mfvM455PqdrJLks3vFjY9F
X-Received: by 2002:a05:6214:20e5:b0:6f5:ea0:3c1e with SMTP id 6a1803df08f44-6fa9d16bd31mr20049106d6.23.1748036591297;
        Fri, 23 May 2025 14:43:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsIyi1DNeSV0ltsvQnqAPemiYB/XrfAMLNhKLi7K1DXufTbnvw9fGiXj1zZXip7xUmJkWnbA==
X-Received: by 2002:a05:6214:20e5:b0:6f5:ea0:3c1e with SMTP id 6a1803df08f44-6fa9d16bd31mr20048706d6.23.1748036590929;
        Fri, 23 May 2025 14:43:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7018349sm4016945e87.142.2025.05.23.14.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 14:43:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
In-Reply-To: <aDCdn9r_ZAUTRpWn@stanley.mountain>
References: <aDCdn9r_ZAUTRpWn@stanley.mountain>
Subject: Re: [PATCH next] drm/panel: nt37801: Fix IS_ERR() vs NULL check in
 probe()
Message-Id: <174803658983.3675779.2609702556913509168.b4-ty@oss.qualcomm.com>
Date: Sat, 24 May 2025 00:43:09 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: yoF8BCDlFi-wLy8g4wgV7OBu25nJKR6D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE5OCBTYWx0ZWRfX7rHa5n47q6bD
 IS/6xDRurbwoUXyjBpWttTaYMPBULI/6uZ2bEb+igRVX0QNihhwJOnIPGb2WGHJpsKApc+rt1aC
 Mx6tG3OY9VTQJj6MEu0in3BaIE2KiWdTG8BhAju/0chAc4f7zXON9WqDA/GI1cu8DMsY8KIuGZ1
 OhbWWtNYsChuRD4wde278+pLA1U2aopZNVz8PKYBfqgfb2A3b4MZZ/H+tnUf/H7kzRszArUJqnK
 QY1LWD/yb3WeyLYFyLghSHqzh2Ijhr3ooks1Rz5q4PPHHMNkBlv2qKlB8hFt05PNnKAPbVa6EOr
 t1ylJfQGEdPR/AjiCfZJQKJUOp5OPfg5zTPqeaAmIhjMosDKejLHnKHmZtUNfjfua0y5rsUmEBl
 oyEbxCbzfsjj3h6YEVAT1Hbba2v9fmFRCEdyfzpNs5wL8lj8AYvlpQETYfB+Jd8nL3sH49ge
X-Proofpoint-GUID: yoF8BCDlFi-wLy8g4wgV7OBu25nJKR6D
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=6830ebf0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=cxelKPMm3W1_tlv-AlEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230198

On Fri, 23 May 2025 19:09:03 +0300, Dan Carpenter wrote:
> The devm_drm_panel_alloc() function returns error pointers, it doesn't
> return NULL.  Update the check to match.
> 
> 

Applied to drm-misc-next-fixes, thanks!

[1/1] drm/panel: nt37801: Fix IS_ERR() vs NULL check in probe()
      commit: 4673dec88da803fa23f1af9e04761683a30dd6aa

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

