Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0EF13E898
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747789768; cv=none; b=DjmpvR7LCyPsLydVKePySYntLs6suf6jYBWjZNUvutvydG/Rv2NrIXDGJwDYvlkC0DN313VAclUVs2IuU3X/hd7i3jm/zppiM4D2EzSYaHbptLArf/WjltqDe3tZrbSsYnWtmXTKWswBgI2sYI1rxJkLTcf5a1pDnjYCQ7dylkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747789768; c=relaxed/simple;
	bh=erL/E3+MY8gZ0y43gU8YVp3vOigb4zu+FeVG5mniEug=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=n6g2wFhQDHRP18SEMsImuHWxlxEJSo1B0/Qpw4Lb8XbrZGrHLsnP2JChUpjgwqYVOHOpeDhzBnf+IsDtjASkPf4yT/3qMXGg5N/pD7Ia7LEpMoIgIq1xZMeYsVmZVcZWPHTSYUjdTfXVMdE/R2nbMyzNtTYSCCbIKBJj71au31s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KZ+V5alq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZ+V5alq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGdrMG000529
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JnzNH/ekIOwzZpj90Vh4IrVcEc3dwb4MVaaIDJ7mLxM=; b=KZ+V5alqmG6JH3Sk
	N3fXBo2J73Kf7nXbUnPr6QqmNZQv4eqKfXrgQ3w/YXCGOiEW0bPQX0JMY3y3tYkB
	6oqflmgWB+IAWDPLKOLUc4Km++pHX9/F9/JAWNNjqgo4x4+brH4h3D5iUjFTL941
	nVOa/5wxzr5J43znxsb3VXhvSlT1baCNp/Wdhl0KDhQVixy6WrPBEM4Tn7+wfNze
	3U7tHTa7s4pDJ2A1X5o3vEXMmCJ9iQlmslra6PbjN4FWn8Ufh35C9gR+K6i/ERgl
	3M1f+7tJvZHyH5AXFlTPGFd7K3PRHu7dkDCiSwrRwevKsloqOEOUfi+36nOTrI7g
	raTwUw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf19318-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:09:26 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b1ffc678adfso4011929a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 18:09:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747789765; x=1748394565;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JnzNH/ekIOwzZpj90Vh4IrVcEc3dwb4MVaaIDJ7mLxM=;
        b=dILnS6RUtvpypItxG2i1/8hWwbnGl1dGLUiar3LUKJxFQCsnhQ2kVQkXc/85GEnCtN
         cWLw6mA/A2Vsh1Ipa+n/YO84bd+A0MMDVmMjBtGGxuPQMQXWmE6osxqpS5fqUGBak7hm
         7tGRDkMYIbtc5p2AthTLqu11kYniz2HJgLj9uYlrV74PGHF0bVl4aptRBFufrRcBhdcM
         ruWt4QiAkyNzMEBwVTdVXwtY+oJkyDs/mOWLaUAgNmRDeyc03e6wxiJVL5wTnk2LHezJ
         OgRb4VVskgBsfDOkZkDAYDqD3/jCdgaazP3VYenTQ5f3bUaLQtj63YPk7pzBfoGxMOJO
         iCpw==
X-Forwarded-Encrypted: i=1; AJvYcCUaiLJsr2QvYyFgEYNtjozhkhO6ASj6o4UPO9BoM4gQBPrwZsY0UJEuUN0zI2+a37j9SXi/Vr65oST7lzY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyreelC8lnVcBEQg2vIfMK81iTN6zYgc+lCjbZ4ksymwIP2UWOr
	Mao8n/JeF0Tqp3ticyRBS43ggeBCQq5flUilqV4v83IZmcfd0G2GxcCL6PkPgQ5B7/TjNuYNqIL
	+XZ5NW2xWKAC1Drtc2jmfHjtTRv5ChGu+CvNDdG5nrrRoNA4G80r0Ydp3pbB94EuF6Rw=
X-Gm-Gg: ASbGncsMUVRoUBTdrkHLx8qpaQNctJgxAIVsVPu932Eu4U0q1v6BzTPWLmG3OFEZf8e
	FkMcI4XrvW+ZC5r8Een3pVag72m4uoPn0JuFLOMiqM/L8kFhnwY2h9sbZGfFtPBm//tMPchnSpw
	j5Ich2vnkjNfVs6zWu9PAM2JspLh4teNzLcVXPB4dLEnmiVWvEZ9oWWsnUF3ufTKAPT6kDuuwxk
	QHF5rv6FZqXeikAPdBkeTDa1aSOZHvM92UAylugfKNA52h3ueXscMKfWknFfflpVWqZmSFZdqoM
	0q0NcBwgEp/8CaM1lPrNeq8nAFs9l4AgPoEozn2XnpD3UK6Z
X-Received: by 2002:a17:90b:3846:b0:2ff:4a8d:74f8 with SMTP id 98e67ed59e1d1-30e7d4fcaafmr26803813a91.6.1747789764972;
        Tue, 20 May 2025 18:09:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlBcm12UmHUrZVAJrludvd35l7XDNp9+GiLylWDS5+ASFS3Efqz2zKncP14/cvIGgIU6RBzg==
X-Received: by 2002:a17:90b:3846:b0:2ff:4a8d:74f8 with SMTP id 98e67ed59e1d1-30e7d4fcaafmr26803789a91.6.1747789764570;
        Tue, 20 May 2025 18:09:24 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36368bb0sm2423125a91.10.2025.05.20.18.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 18:09:24 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Christian Lamparter <chunkeey@googlemail.com>,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yury Norov <yury.norov@gmail.com>
In-Reply-To: <20250326155200.39895-1-yury.norov@gmail.com>
References: <20250326155200.39895-1-yury.norov@gmail.com>
Subject: Re: [PATCH] wifi: carl9170: micro-optimize carl9170_tx_shift_bm()
Message-Id: <174778976389.4010925.15782045495793263335.b4-ty@oss.qualcomm.com>
Date: Tue, 20 May 2025 18:09:23 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: AyluTaGkozyYeUGmxayhEk2bwVjVHtAS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDAxMCBTYWx0ZWRfX4F7jzvYNxaAC
 BaU4QQriXxmfDSUqdroqJK7Yh9yuQGz6KpluVrwW9B09TY0U0ADfN607IkKXXPMR//4lyV3xR/A
 nSA6B1HpV+6VtLL09EyICDmrfSoVOkGf0vNTLkRCdbIGZBjqppLathDIYGuqI+b7D0iWa+5THM4
 H/P8pPRMRrHK27AooV2wLjMBL+aPLMgxl6iNIoYecVffTG2Av7xRTGssbU2tQWRFSLZCl330IjI
 Deb2GdjB+DcC413YB4jsRK2OwvToK7aR3Rqcykt3FYGon4a35KOhav914l1XIVei2FTZbKpUs4Q
 TUmMp+qTgCa1J8gyGwcwjI4pO1Y6leTx8lSfEsUP5ZDf3Pc7weL76WxaS6dIh/pd5mu03I1DnEZ
 gZeeTro21Csoev6CVGvgTwaBfiCs5CgRFCepgSpbqE2ZYVO3StPzsb79GJZ5C6hJ47AuUnR0
X-Authority-Analysis: v=2.4 cv=F6JXdrhN c=1 sm=1 tr=0 ts=682d27c6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: AyluTaGkozyYeUGmxayhEk2bwVjVHtAS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_10,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 adultscore=0 mlxlogscore=435 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210010


On Wed, 26 Mar 2025 11:51:58 -0400, Yury Norov wrote:
> The function calls bitmap_empty() just before find_first_bit(). Both
> functions are O(N). Because find_first_bit() returns >= nbits in case of
> empty bitmap, the bitmap_empty() test may be avoided.
> 
> 

Applied, thanks!

[1/1] wifi: carl9170: micro-optimize carl9170_tx_shift_bm()
      commit: 08e3cc13b0d050860f41b4eaaa21c789af968b98

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

