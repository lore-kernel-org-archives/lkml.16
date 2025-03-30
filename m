Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A938F5B
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743358299; cv=none; b=tvWoaD9vQRYLUGpGSOCpmrWVtW7O7YtdKfTDCEkR/8YRlluQknPnw2NGExd//DtbQfFz5PW4rA0K9pmbVZxiIQREfYaluy2uBco0ELJXS/uiprVk/KS9LzEtvhVjdC01i3xoabmv8vTZlSjik5UClzAZdSOTvyHuwppr+u0in78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743358299; c=relaxed/simple;
	bh=seO8jyUp3229Hcn6+4owzadoI1ijb3ZNSQ5729GFqXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uhRYG1KI/JPvLbum6ZbGwssL7eBTQsqjFo70TzXkF7yJvDhbH58qG1ukHMHk+gP/4ts5poUPsvJFCa6qjuHbLdlF1e616MXjbqyfVrh7WDDffbyWZ/xMB9xp/nhQJxXSWlHB6r+u3W1USQzea7DVKx5IHOrhadpG1ES31bgkDZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ragl/Hij; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ragl/Hij"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UDlNor023365
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vVUKLCIEpo206oYXZqtYL/532lLPSl4dW8ZhmmRNjnA=; b=Ragl/HijPeAkHk37
	VULHizWZt5LEXj9cVUkE8adHuFhgdMplH4A2qw/QNyxeHNGp8t9Rdryzk/ujUycI
	1RouVw70STahMdY9mI8s117MxGESOtUDHQ+NhLz4/VIKgdpWHIqyQqLiDwfzT3KY
	qqCHHGkAIUmS401ziT2j/PVaqkGqqbzi3ymsvNtsUIuseD+SmFohiwkx6nxdI+CL
	cJNlONlAa4jvTfPmLb0lNh1cNan2tzN7Y3j4iH8k9zg738ciEOySZi94H6vDGV4D
	u8dlmehF47Msek3OL8yjgNMDlP9894J8iTiS7tRVCPvasK8JU2gOeQIylnyqmSJ2
	5kycow==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p8f1amtu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:11:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476b2179079so71262651cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 11:11:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743358295; x=1743963095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVUKLCIEpo206oYXZqtYL/532lLPSl4dW8ZhmmRNjnA=;
        b=MON3l2YxvzIBRyXB4zuc3CKnjHwqAqu5z9N6CMb3Jx4eB5F/W8u9GQ9oXS7PdUpn77
         fJjv/Me1NNDlVDCDSaDroukE7pRa2JGbvaWZiuIkUsV/Ny0sPNhLk0hhhFYq+U4dHrS+
         n7vAtKrvXOeup16urgG0CrmNum0dQk68ZIgdoxBut6E6c9gCQCIO9vFw/3ESQqhYZTYs
         ldKmpuVKDjvcHWdLkAFsNgeGKJuBRFZ8V+OdgSEcAvfE1HnnwC5qCydqPGoJoeRspsSE
         RrU8lBreA9d24jkqwf1RcP76aSwLPQ3aXh24f7s3XwauxyXmzJghDMLzILk+PFIp2624
         vsNA==
X-Forwarded-Encrypted: i=1; AJvYcCVin4EYUokWfl5gajfy3VO4waBsfS4FFw4hyvyLkO0aUGVmQFCgBLIpG2eKwOlcoziD3T3ka0lJ1yeQz6g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUhXNRvg2N4o+taCBHxrHR4dITFdt4dn7ALpij9W32szExxrp/
	hGd+06O7HSJvkgOgU9lWnrq4amrlE7GMFWZTF2HKiPpBvVkHMufADcgTQytynRSuL1RINoNXrp9
	h21l33BqQnIll+O31jiBORHMURf+Kj078b8hHUwVVJATO4ax/9q8hvr/Eqs9Q5pk=
X-Gm-Gg: ASbGncuQjaEpQx5l25vQ3A5Jz0n5RrvrxANB+cK5zw7zpHee3woJRqL1FctF5khSpvT
	/7yviLzzfYGu9y99rHKAzfOUT33MpLQwbognbe2UulzQRJse/Ybk+zY9jjpoT+4/0FqCMCdr7ve
	MCajvA/05N6c4dPe43LEO9TkCrkvWQcI+0KIHCwds9GjHZTVBVtsyDUEATJaHflVR9lkEMuRcr8
	lfrMAfMx+9YWxVSVWom26KmBFjX7bThD+iprg6PRZAsZ3vXZPiaiF5AwC2hpx5PZnZHQze/D5/C
	C88348npskTREv+omITbq3gGTQGhny+l0jptmEMU4CLWWze/CK8fKKOq2qFZGsl79FI=
X-Received: by 2002:a05:620a:4152:b0:7c5:53ab:a74c with SMTP id af79cd13be357-7c6862ebd01mr862965485a.10.1743358295529;
        Sun, 30 Mar 2025 11:11:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/4Ayu0px2bsgfwGlasLAeI7cob1w2ZXmawFYAbJ+6bPKbrGT1NUrtNEzMcRulXVA9Z3WOew==
X-Received: by 2002:a05:620a:4152:b0:7c5:53ab:a74c with SMTP id af79cd13be357-7c6862ebd01mr862962985a.10.1743358295232;
        Sun, 30 Mar 2025 11:11:35 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2aa9c56sm11478831fa.4.2025.03.30.11.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 11:11:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] drm/bridge: sii902x: Set bridge type
Date: Sun, 30 Mar 2025 21:11:29 +0300
Message-ID: <174335828699.2569365.9085452563273162039.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250326101124.4031874-1-alexander.stein@ew.tq-group.com>
References: <20250326101124.4031874-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AsDu3P9P c=1 sm=1 tr=0 ts=67e98958 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=QAnTTyjkLDB7MCdMeLoA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: PBZZt1XKY5aXgUtc4ZvstdViGpz8kSKt
X-Proofpoint-ORIG-GUID: PBZZt1XKY5aXgUtc4ZvstdViGpz8kSKt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503300127

On Wed, 26 Mar 2025 11:11:23 +0100, Alexander Stein wrote:
> This is a RGB to HDMI bridge, so set the bridge type accordingly.
> 
> 

Applied to drm-misc-next, thanks!

[1/1] drm/bridge: sii902x: Set bridge type
      commit: 586831a417c9ffbcac63cf1b53f05d15024fdd56

Best regards,
-- 
With best wishes
Dmitry

