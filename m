Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF091EFFA6
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750979719; cv=none; b=FpyJye++wFrNoI1LjhpF97U941P/OaI7eKYcN5qRC9G2Jr58ffw5dv8+KwlbscY9ZxLmGiFK8boxOWRcf33L38+JtXOfe7cfN8PfNSAGuNj2HTZx//HHOTcP6rcyIwfoYR9sQOtpA8bGXjOQwkHt5dwncmwVtDdVvOY+UI+9RE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750979719; c=relaxed/simple;
	bh=aveueRTbQdMdrNGSej3joup9HDcIGAK8ibNMHhk22ow=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kYz9OkJ9SBytTbrNlA6NGMypBJ3Cd6FNyfoGYe9chNk8umep+6sQraEZ38PSBt45yF1rIyl1eStTh0TWW6+AWsTpBu2jQZLC//Li4ra7iGiiieqKNM6TTLba9YE6RejIZD8vR6DuwZjn4Io7zjOiu1ONoeaWoGTJwRUZFdEERFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jb6U9TMX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jb6U9TMX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QJ2ocW029528
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QNf6psQuaYs1sV2z+eOJEJrYUuj36k6T3cjWzvS/EFE=; b=jb6U9TMXB/Q497gK
	Bvw5kweEaXJVciSI5cJvzQb/BbH0h0Xv3YQY3O1jEHHBUbp5wr5GZ++hoeISz9bn
	EeMf3iWV1T+Pd0/YstoItKt/meYED6KT6EPFFkWAFhuelQ8XU1RPvFryh9AYk6uc
	xb4TMSHn6fIoOYZTn1qUSmmbDEGc2TmcRpLDKZyai2COAwANKcs+YpCer4gTKzOu
	UMB0cuUk3ajzFe58oy0P/m0BCYfebuSdO/k7a4Vi5RuY5+3CqWbhVo/LUxXHiiuw
	356jThXVgYow9WtEivIToWvLDwOCdwyphdzK8WiFfKCinbGc22NJ8Q637AEX4ZIu
	mcuM4Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4x3ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:15:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2369dd58602so11742025ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750979715; x=1751584515;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QNf6psQuaYs1sV2z+eOJEJrYUuj36k6T3cjWzvS/EFE=;
        b=YpMGvtBx0sh23yvus2XfWOGVOcT3iRJgO6PHusb9uVvG2WfuiZQLqtXhN0IwnBn0T5
         /Fp1yEGD2BCzFJm+fxRKODs7Disbl6FsL/nRYFGgc0DfNZ4Tf9+SxVp7cgDXyWm+/J4j
         Y3xZxMGHnSj/sfT7V8SG1Sz1cA41sumiJMZ88nIsgJaa7809oDqPvJK211hTtjjg/j0p
         GC/pAF1Rgw6BXwYKfllvWmaPvnXl6D0JXq6W6R2pDHr8lXkW/RLMBBdb4f6VlBlL9Xx6
         BU5+AP8u6CHd1QfdxW35HS4YVq6VTswTdEeuwm8wMklyOHaRtRjY9NVHtcGoA3iwIa9s
         m5iw==
X-Forwarded-Encrypted: i=1; AJvYcCXaYNp6tgP8oOoC2NVofgTVEFAnOhDhIlDYEDNTW/3ntkQ/0SXcRURTAHUssJ/5lDaG0zC9jD5nSEA2sWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpsbteVdc21bAUgwmozv3lXdxNnixBSaMcvKITwMaUP2UKnqXo
	SFtaWtOUH3hP/Wg1pgNoZMwsVUF25ggkAdRi8olgwMNeYqxB6cestZfVHs6ZeKMxVy9O7hz4Eab
	xtgqO/kI6hg1U+TavWGT33q1EsfItyGENfnFkQpO2QLN5LUEr0mwcoBXbFI+3rS9VT7NLxbJeQk
	4=
X-Gm-Gg: ASbGncuKclCIQeDVWOuLVdInEms3gxtS3o60tqDGSJH1gbRoAq4epdYT0avxnypHa5O
	CCnfYBO8inFclTqoHpfiLth5NtrutWM0VGTtV3IH7eSNLhTSwrx7Rdmk+PJAm2J6T0/Al6/gFth
	uiftGDL/eo5qPx57JrSGQHEokc0fUQ8ELdBjAlafcJcH7AzWZHMlHm1RV1HnyLoZq9CqsMwsJtX
	4+C/nrCtKLLF1TLoyEyWstDd6oF8NfYvpRJrCTLc+ch0CWQc2JmrUHXUlj0dGTw9du3flTG12nU
	f7132+fGCI6JS2BqLT3XKK6ssmRH+AGjUcmT14g5/cvZiAua+K4ImHAfMnU=
X-Received: by 2002:a17:903:2c5:b0:234:bca7:2920 with SMTP id d9443c01a7336-23ac45e262dmr20098895ad.24.1750979715403;
        Thu, 26 Jun 2025 16:15:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3UyoHUikHjCEajXKJptSGnRA5N5qfhMM6/xXUltul0UA71goc5dUnQg2TIU9Lxbb/GwXUeQ==
X-Received: by 2002:a17:903:2c5:b0:234:bca7:2920 with SMTP id d9443c01a7336-23ac45e262dmr20098145ad.24.1750979714949;
        Thu, 26 Jun 2025 16:15:14 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3adeeasm1548105ad.156.2025.06.26.16.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:15:14 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <20250623-support_real_noise_floor-v2-0-974bbafa317e@oss.qualcomm.com>
References: <20250623-support_real_noise_floor-v2-0-974bbafa317e@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: use real noise floor
 value
Message-Id: <175097971429.153431.7513339241294145921.b4-ty@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 16:15:14 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685dd484 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=-iIeHy2jdy7NZ5vI0E0A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: VW6pizTTAI2wEFt5NzxdtktWXcNZJUZe
X-Proofpoint-ORIG-GUID: VW6pizTTAI2wEFt5NzxdtktWXcNZJUZe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE5OSBTYWx0ZWRfX/bTNiGwCeyas
 vrQ7ZFlU2JUuHjSClqMBEucw+ECKgTl7t8SqbBndUfD1p18kaVV4eUMh63rag8DK9sWznRJnoof
 b5iiMdBti0UkJnSDk+olfozPsJgx19bO7hWJIC7R1++/ycNob8zSuwyx9fpznSfO3Mh0LXkl4mA
 RO69T392wFpu442tOuIfwQ5nyehguwYd7lOlrDcz4HiNKq30tKCd9omBRyBppz98OSgPQP4Vofd
 nsM/McHYgtLTh29GiJ6RnzKfF0VQ/uYtshocR6CPv6oiEF8yvylLl2AaqayWk4f97+i/KHbGR1Q
 L7jzmL5WHnhZWF4fHOOTf6H+QRfizmBRFkDnZroX/XNmH4yYmOC8qCQO3NuOwLrX78SG3X0mlsU
 z1WG4Bame4OrrFRTcXGD1O/PPTNuNDR9gJlwlG3Y0sl0Yxfbo0JAmWd+4UALgPYqz+hMTXW6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260199


On Mon, 23 Jun 2025 21:19:08 +0530, Aditya Kumar Singh wrote:
> At present, the ATH12K_DEFAULT_NOISE_FLOOR (-95) is used to calculate RSSI
> value, providing an estimated noise floor value. Consequently, the RSSI
> value is also approximate. This works but however, using actual noise floor
> value will enable the reporting of the true RSSI value.
> 
> The firmware possesses the necessary data to determine the actual noise
> floor. This data is provided to the host via the WMI event
> WMI_PDEV_RSSI_DBM_CONVERSION_PARAMS_INFO_EVENTID, which includes the
> runtime parameters needed for calculating the real noise floor in dBm. This
> event is triggered by the firmware during channel changes, temperature
> offset adjustments, and hardware chainmask modifications.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: handle WMI event for real noise floor calculation
      commit: 0314ee81a91d22366e8ec6f5a993d75b246cbea8
[2/2] wifi: ath12k: use real noise floor instead of default value
      commit: 662e9032140fd92662142d4bf394916cf48e426f

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

