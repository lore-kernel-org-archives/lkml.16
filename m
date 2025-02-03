Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F0F210F53
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 22:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738622954; cv=none; b=MgP0kbVtAV1pjGpqDvz9LnHSiw+mFs4BBJ5VL5DyReSMGKNDJC0KBbrRSaW72LDC7LFZA5cR42tiYwPaQPAcBFN29aKhlLkIBvwLtmiYtHNk5AdtmOu7mvcRh+WRybVfxDBdlKeZo9J+Lu+Kl6MElFPn1kKb/uQ9GUxuqJRMTVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738622954; c=relaxed/simple;
	bh=l5srBsgiU33GZd/b1KzelfuLg2xWkCS4kDrOq7Qb7wY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=T6qcG/XdvIg5uA7tMqZPBYXK+sP+q0xIz3U+Zlz92PjBTf0Yp3dT9ca3rZoy4wo4cPOcjRsQHGc5kVFpzp1xq04ClBD/Qh3DjoIFhhm3/yNGDyzaL1nYO27+Mo/9KsNdQp6kMwMUz2laQKIgJmkfs88+9H4/tgzBfrelIeXY2hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LFH6wbR3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LFH6wbR3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513E6wMx005747
	for <linux-kernel@vger.kernel.org>; Mon, 3 Feb 2025 22:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0A6wgIKxOZI1z3zdXOomFIBddaIAgTmHOiA1HPyAkCI=; b=LFH6wbR3+rOSa9wm
	+FipN1RduRYXLHp5PChCpSAqQl4leKKugFca0P8c1uCXJgYc1tcUKbdQel1lUW2r
	yuIuwNYr8GRyBnVsILaU38MvJNPY5TthMQpyJHdODmLL5l/r23g9ltZJLHrXw7vT
	QH0OvYd3wNMozBYuORMG5M3WR671IyadFZB/rKkfqwsgvoNEXbR1tOE5DcVeksHs
	HDNx52KO28eBmb7rowG0ta3rm45Nlm3mozqnqovsKiWs4ZE0RjixehMXf0j4nQqi
	uggLglTg/NeHHgRlOGo7MYEcaYnk5LXRLg3qq1S/XmT9EeHKxbxGeKlpuqlICrCn
	AIsMAA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jy9g14x8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 22:49:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2161d5b3eb5so101086805ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 14:49:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738622952; x=1739227752;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0A6wgIKxOZI1z3zdXOomFIBddaIAgTmHOiA1HPyAkCI=;
        b=QuSZFhKzByBt4lmBdj1koPqPawzPWyiKWAi/0FY08/817VFzKl0bgJBBBoRFYlVa9p
         GcstvIPC2c51t1sXRFrCH2CzwVrvpwm3pVaMY7qHvOwZmHm/L5cMtyjTPTRl96hdEWed
         ctHGVoD1Y0y08QbqYq3m0kQsbI37AKsA2YjW5MmuHLAytUuOOFMd8SvnJie/hAQVlX5p
         xKrJ8S7lwvmGnZ6jqD6RLF52U4ysdSCGUxMkOXqAIRMGj5cWL4klD93AxyELO4D4EtVv
         cp5nq/tn/0D59qd9m2xT8L7o4qUS8UEwRqjz9AP452KFAfEazWSXF70/lOrPJFd2vIPz
         HgYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlCBS6r3b4zR2KztrRLrFbQyf0KdD1my2kqIuxpXDmuz2slve6DIXk/pLncn5PNKxCXpfmhDU7oO7qM64=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmRQukhxp28l7pJcp3hyujuQO/4n3BW5XeZ/v/3zNwyRX+IKi1
	DlqguIY+2q9mY+N+YjBNS1ko6OT2pqZ0zRhdqllBoMPmI74DrUHiM23VTSeGLddFzsRfY5tcuPo
	Wi35DFLiyM2EWqXuulow/3t6V7ot8x0qaBI+z2jBbvSSYFqjHLZT/VasJn0gqMB0=
X-Gm-Gg: ASbGncsELEWr7jPsGIaOYMfL9Z4dy0bD0bhoPn2EUhT/DwqK/6VGR82e8wV/ks+2iTh
	8o6x4WI+qMw1zs6jggAf1uxU4iQ+ji94PIrzU8U+DSg8UAtosqVDOfNtQymah2srEs9we4iLQYq
	6ZL5I7m0lRrixQX9Gl/CQV4pZgJEGipKgjm4czy3DaXbC5USf0drip0ZsRm4WlxsqWQuT2ZSAw+
	63q2QEGzQjSmaGd8kXOTjnEn4NqWIjuN0r+UZ5lBLuMx0LjL6nfyVUbQ6rRxYcg95MtBsIa0MZB
	jH1xzqs2sAt/PQhdD/8oiSatOG/FJ+HwqRoiTWBIcQ==
X-Received: by 2002:a05:6a21:3406:b0:1e1:a576:aec with SMTP id adf61e73a8af0-1ed7a462f1dmr40404065637.8.1738622951701;
        Mon, 03 Feb 2025 14:49:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGY+o8EhRGLgXC/8FHqBM3Hq6MLun4L+ClAm8k8UyqHdT3OFzYo9so1tpjQQIlwluCscLDM7Q==
X-Received: by 2002:a05:6a21:3406:b0:1e1:a576:aec with SMTP id adf61e73a8af0-1ed7a462f1dmr40404026637.8.1738622951192;
        Mon, 03 Feb 2025 14:49:11 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ba353sm8887444b3a.112.2025.02.03.14.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 14:49:10 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250110-fix_link_sta_bandwidth_update-v1-0-61b6f3ef2ea3@quicinc.com>
References: <20250110-fix_link_sta_bandwidth_update-v1-0-61b6f3ef2ea3@quicinc.com>
Subject: Re: [PATCH 0/2] wifi: ath12k: handle
 ath12k_mac_ieee80211_sta_bw_to_wmi() for link sta
Message-Id: <173862295041.3734728.16749672295096616341.b4-ty@oss.qualcomm.com>
Date: Mon, 03 Feb 2025 14:49:10 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: BT0VGF1O2HnqEiwdLI0fp2ocCIb-_TyM
X-Proofpoint-ORIG-GUID: BT0VGF1O2HnqEiwdLI0fp2ocCIb-_TyM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_09,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=532
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502030166


On Fri, 10 Jan 2025 00:13:11 +0530, Aditya Kumar Singh wrote:
> Currently ath12k_mac_ieee80211_sta_bw_to_wmi() handles the bandwidth from
> sta's deflink member. This works only for non-ML station. Now that MLO
> support is there, extend this function to use link sta instead of deflink.
> 
> Patch 1 relocates ath12k_mac_ieee80211_sta_bw_to_wmi() so that it can be
> called from a function used in Patch 2. No functionality change.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: relocate ath12k_mac_ieee80211_sta_bw_to_wmi()
      commit: 090c645b2acc835cccf52a8876dccec55629f479
[2/2] wifi: ath12k: handle ath12k_mac_ieee80211_sta_bw_to_wmi() for link sta
      commit: 2fc98b24adb93457254ee16418cffa89de038ad9

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

