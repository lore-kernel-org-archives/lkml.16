Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC78D271454
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750690131; cv=none; b=DhYWo9Gj/wvfWn3R5+r4kfDVpE2OrFVPe3QCB968pcsGgFF29xG5PsVuUV57f/eJBsrP+gb6ClWKh72uoxs/clboFbHbCh8KE6EtOflu4XMxGMj4fOI9d4kmGoIvkrwskqCnbQ7FDc9WWIXnvQDV8dudOVipu+gumqzG6MIuknk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750690131; c=relaxed/simple;
	bh=DDOc8uZ+ooRGzsrFT2yDNhClGhHSAD5q4wDekg6A4tk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RGK4NFtKp3v9W1XjbabN//kEc/7/9dFkZwqFUWcRbCJn717vLeAlaXU1HfHGsijh7/JWmtggaeLwZ3DiKnGI33PUO2goT6SMa7mINJehl/Y6Mi0WlywrvGXB/doYy84LZFRiYssNNyEtmFJSRZD3KYg3w0yb4JNqK3HwWofzppg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NDOmiEuj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NDOmiEuj"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9UAoL022368
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bZTvShEFC4b3+8jhq/pLhvEl1j+I4GJln1yh/jFqMd8=; b=NDOmiEujLEJlm+jV
	nPQLPkIh2FFlXdgYivocvH5oIbD50XVwpmwavq/6jNOo3EmMC8q2/b7JSLWRwTDo
	eoe7KIhtAiJpxRSjAnMB4mfYXXhGvHJAKoDZFpwbw2svzW7MZy6pqWFXejVClcV6
	y843WQdQ6K9ivDvbOpYjoGr4gyle3RRpDA2omBTNHnuGW8/owF328R5N2zuaYUY5
	Glv0hPPwJWb2QrskxcsV8SxqhY+94+EzKbbKtCXzIAzfKLAKRPPPx3UPccc6M0i0
	vFF3ILiP1YQaJ1kM9CQRCIUmCS81GS/gJKCiOiyXpQOz3dakDNfc+tBz8HXtic5Q
	1PMJbg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b3rvx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:48:49 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748d96b974cso3472817b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690128; x=1751294928;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZTvShEFC4b3+8jhq/pLhvEl1j+I4GJln1yh/jFqMd8=;
        b=t3EtixcU1LjAAMk6K8NYSibnitZ5ij67uvhYrGeWn4RiwaWTp/M0+x1/Gcbb7YOTlm
         930NYXOakDSCrrHGnWqapCkmCTcR7MutXyiHwBZrJzMDk36GfBgB28Yc7LWRYdzZ1Egs
         Yr7tJhc35fupoZ6DzgaIasiiFOReOldE710B6w3wk/NU2SlZDBBUkCHdTjS+6sOs/uvP
         pVCNnL3qTY2JM9vyXCoELeeVoWspnkgeoV9VzsclCY23SOD9HT/pp8ZvztvmV5yxckrz
         FcoohTsHTA0H8v8VGFXgptW57/1oDkap8X4XYFDajzUvzC7SFi42dgOjhtDw0rftOQHv
         gtoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+XOJ2fOgZ8X1vtO1BKeTjogZrsxevDhS+wSdMqvcoa+ZT7qAwyAsvrUCS6wZGjSSIFoIpepngkRvQLxE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5XBMRI/K1eJt8F3sFbygsEdc8wBszDxwq+lbcPXRnVfd+Vzit
	mOkXYeXbqxqciAzmzxIxYXgqyxhxV3Uz5aVj8q+Y/hbtCQiQ+fps6agzGxVOzIJivoGo7vVa/d/
	1JvXh5sRLY72O++9gf3ot9jGxalcUsdyLNvbJfW6Qv7Hknu+v2lw3eytlRgzbap+zHFo=
X-Gm-Gg: ASbGnctgE0aVJlymQ0p5Sq52qpC78noACmBSbv901DdQo8MuEokAlRFaAgJaEn89eDU
	s8NCZONHgQq+SP6O7n5J+Is4BWFbkynuN1yHotQOR0sdK4pS9LtEr96/IkOxY5OgY0CZJB4JK1t
	cMmOihS1Rvt3yF1nkIvDxcexK7X+20jRHjVVjTvlVcCu2YvDfON0aMKjcpSPDdkmUbCowFHus5X
	EOiPwhJSMfR0wzYr7n3BJp0zeYxr9HT0DpyYi9TlS4l8OXilNWpcgfZoRVwf1ijrJL7peVsVyHA
	VywKhhHNBXtkdRg4GMcCQ4WMECZ1PlJD86P+JVPPLWDRA3DHEdIfABRG+NU=
X-Received: by 2002:a05:6a20:728a:b0:21f:74b5:e8cf with SMTP id adf61e73a8af0-22026e47ac5mr20602345637.25.1750690128251;
        Mon, 23 Jun 2025 07:48:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHhT/7HTLqOoGddSf9WDDsTxORjqJ/SfHm0+ETtMJ1rsYsqMcKPrqpqZxFiopZf4JOj4k/SA==
X-Received: by 2002:a05:6a20:728a:b0:21f:74b5:e8cf with SMTP id adf61e73a8af0-22026e47ac5mr20602309637.25.1750690127859;
        Mon, 23 Jun 2025 07:48:47 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6d1eccsm8332894b3a.180.2025.06.23.07.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:48:47 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
In-Reply-To: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
References: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/5] wifi: ath: Add missing includes of
 export.h
Message-Id: <175069012683.3758471.9698383719451711198.b4-ty@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 07:48:46 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4OCBTYWx0ZWRfXw6oRFsEoSFPd
 1VCnbCCy6Jf1Lg1r66yviH6CX37625L8Hbto+5EP3nJ4DCKW6Z7baff2/5umz7X8d1n9N9LBgf0
 PxunPf+0lS8GDlH3/Nh/Q/SIQF+jJVgfSCQCUdJh9Z/xtpiN18OVQO8NKYRvyX1/uoNO1j+VpJ4
 tgxJG44WPjH1LEqKLShJRGqiOcE2TGz1hVirjk7aN1vzj9HhmPJ6YaAcxoEtHMu/XnywIScABXP
 DVoSIjdKCMT54bN1fGOyngzmQsGRsL2O51q1XNPNeQaKn28eQ+v5FxbK3sJBcG50GIGY5GNmFel
 gwtBToOjgvmHznmaoKszBREWs+kSW4b+PJaQgT3fnhBbYuo7rlNpXAyKz3+YN30qLQiZAZwiClg
 +04/f6+uUAhTZKaDVl36ZkqoOYyjvx2T3sHhs8v1iqZOgMv7LDXhDF3t6uTzE7wPmo1wycyi
X-Proofpoint-ORIG-GUID: 0k02-iSzUox0E8DmT3g_kGKlpIRSC3ce
X-Proofpoint-GUID: 0k02-iSzUox0E8DmT3g_kGKlpIRSC3ce
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=68596951 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=1ICI1GVrwY_GNP6_Nl0A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=695 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230088


On Wed, 11 Jun 2025 09:13:53 -0700, Jeff Johnson wrote:
> commit a934a57a42f6 ("scripts/misc-check: check missing #include
> <linux/export.h> when W=1") added a check which is now generating
> warnings. Fix the ones in drivers/net/wireless/ath/...
> 

Applied, thanks!

[1/5] wifi: ath: Add missing include of export.h
      commit: 3abe2740e50f86401aa3518e9b69c6abefaa020a
[2/5] wifi: ath9k: Add missing include of export.h
      commit: e435827f6d0c4ace62cc9dfed5e337fa4549994a
[3/5] wifi: ath10k: Add missing include of export.h
      commit: 32c3a0f8894311c743b2a6a15b50b13d01411ce1
[4/5] wifi: ath11k: Add missing include of export.h
      commit: f204e0377efeb5f42c7c518febf82f4af32567f0
[5/5] wifi: ath12k: Add missing include of export.h
      commit: c19c24c3b9e2c4d656472738f67ffc68a9b85cb0

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

