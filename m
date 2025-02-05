Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4972C1519AA
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 14:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738764634; cv=none; b=oQvrjUCa1VmyKgMPPo52rtQr2vRhWFSczH6wBOBIhaz4R8iMeTRAC51rEtNZzYzHAtn7TQHjrUS4pWOLJj3r129xay9c64uBw0iAkeu9xBBrDpmPCYOSv7x8YxDfenX14jxyLXxui24VImBB/q4wKLiPnT/aFAibN/6VWgKBznY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738764634; c=relaxed/simple;
	bh=yM7HchaJht42EoK4BpDOv6Ef9xlL6sYcieg2jMphz7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ehl2S/YP5Z+0/pY7uXZn9r7vwqBptZBBc4EwkYb4lIKj96HZkbcI1tXBw7EcbKj1O7XMw/vhnfj2UzND0wnf2+rp0VcVsjUcySxMC+xZDNgeN29QefgY7EhF7Gj7LBOdVKxfZAEj9eTIFTEnUzJLvvPFI4WWTteRd9EGbPjYGis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VGx+aWXf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VGx+aWXf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5157GDSi010513
	for <linux-kernel@vger.kernel.org>; Wed, 5 Feb 2025 14:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6tW9PiE6Uggch1rl+VNHUMkhQgUT6+CObpqMjcgW0j4=; b=VGx+aWXflJxuhxt9
	mhcF/vukRqGSIyrfbiBic7DmaEEbsPLQ3HHGadOMXUGfchRcIbqxdFH+Y24B6RBQ
	TPy3Hps5N+XTfTygE+mOL8oe6lSMkixVANeooWVeUz6pjx6mpBOPM6ySPLbBKhtC
	hplNbcVV5LsdeDS9d139wZAMBFdlPuJ3omGBwqb1EGqP9uPYGSVxFpXKAsFIMO9X
	jCtHraSDgP+FvQVxHozx77/ek/swkEPs413Q4GXAH6RETpWzfe+1ZHjMF0+YAk9U
	lPJquQvusw7mMus3ZpEvu9yTGcEFmdd+YaOP/Qsz+r4eWfsdWdq+mpRN55C2iPm7
	0n2GWA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44m3esgy9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 14:10:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ef9204f898so13112467a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 06:10:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738764631; x=1739369431;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6tW9PiE6Uggch1rl+VNHUMkhQgUT6+CObpqMjcgW0j4=;
        b=NoEh8xd/PFDdtJcbGX0QYelwi23+1qUF3zrMK7xXAZRrwwGOAn2g5AX3KC624VR0KG
         1JHFpzjwOtFNQyb3gS6NDHTnLYPaHB2U2APX/s+A7T8kA9ohb6YlTjxX52fXsfoBY7hL
         Q2ZTAvI5WSxr+bna7EQ/UNdaKc/KNGTtINVHHIrW002m1zulaUz6/rIyhCig6uu7sETY
         eHAaY+W430fIqkz7s/UQ7BcAV6+qPTbYO9oT+d6xqCTB9o2NTP9nFZzs2s293xz7/aZN
         TzhLv4W58FUd6QHugpJXiI14P0DnQU+z6MKdTuSADUDV6egH2a8/viGhYeDiMKr90LZP
         ps8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUf8ssCY2FxExaofnRZsPFZZ9IudaoQCA10TcgEUUqfAnkNBbiYlDlGI9j+HEzdXGc4li1Y1vlKV074NZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYbQgSGp7uZF3g0NdwjRSTwt4eXr7Mef4Ic2Zin0OJzx2hJq1L
	OWypKH8qIiPK3uTJMrMhM8TeIxFrtZBpblBJOeBVhD0h8bg4Y9DsPyCK6nzrO5DqT0KtieT1sVG
	QWxB+LBd/nAvXbLOHxAV3x1JCdCTJ0KZtlML38J2lJ6+MMfsNpcwY7sJCzCEq73Q=
X-Gm-Gg: ASbGnctsCS9diCfrShhj1BGzfcEOJGjs8AbxzcNHu63dUt6Yre2RvcHxbN3k8Lphqv4
	tCGEp4YbIkjdOQIig6Fam+0eV6IaqJgIDvynaUHOdSWNCF2zFtERDGcYUJCRHQwFnaS6x4gIqRV
	Ft1SKDtrsIwk+/o2/W5z0pULFhaHOSmO++kIg0jnqes6TpNJ7dsnbMIkZAR2I1pCmYngKMgGUOK
	qikdXw94LloRLkBTtEnpGYvYLyrTOH6Dj2jvC4yCIAfqAtTpZnsJ68SNCVIzWDiqM4TcQoJTZxF
	UyZldRXbH135Sfu5YBwhnr0D6DDRIJHxKdwp3rvDLkTB4mVL+24O
X-Received: by 2002:a05:6a00:a81:b0:72a:8b90:92e9 with SMTP id d2e1a72fcca58-730350df59emr4741153b3a.5.1738764630545;
        Wed, 05 Feb 2025 06:10:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4rFAQZq/54xv51y/JyFYfTwbzoD93BbJyApBVaYuSBCDIVueZ7AgbOnP2zjeFkL8iuAQrDQ==
X-Received: by 2002:a05:6a00:a81:b0:72a:8b90:92e9 with SMTP id d2e1a72fcca58-730350df59emr4741070b3a.5.1738764630142;
        Wed, 05 Feb 2025 06:10:30 -0800 (PST)
Received: from [192.168.225.142] ([157.48.120.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6a1a94csm12984892b3a.173.2025.02.05.06.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 06:10:29 -0800 (PST)
Message-ID: <395ab26e-f7ca-82f4-9bdd-ad69871fccbf@oss.qualcomm.com>
Date: Wed, 5 Feb 2025 19:40:26 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 8/8] wifi: ath12k: handle link removal in
 change_vif_links()
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
 <20250204-unlink_link_arvif_from_chanctx-v2-8-764fb5973c1a@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v2-8-764fb5973c1a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0FPba2CEC_J8qfBBK8svYjZ8dVs-s8fa
X-Proofpoint-ORIG-GUID: 0FPba2CEC_J8qfBBK8svYjZ8dVs-s8fa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=686
 suspectscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502050112



On 2/4/2025 10:35 PM, Aditya Kumar Singh wrote:
> Currently, the link interface is deleted during channel unassignment, which
> does not align with mac80211 link handling. Therefore, add changes to only
> perform vdev stop during channel unassignment. The actual vdev deletion
> will occur in change_vif_links().
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>


Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
