Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B009207A0E
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 07:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738654611; cv=none; b=pt1i2w7AvIcjz6c5LbLqINVmxwxBUoamCX9NEku3Z1zVj/SKXPnVAxu+l67ycV5AJ54KnJnWr4fRvzw6ZT/Ajl94XY2HqwyRDB2NvwJ/EZEKrKFf0sjq17M0J/lFjdgFDQszufC5CEITdZdxtPEMTWpYbf2suN2oa0WPneXZh1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738654611; c=relaxed/simple;
	bh=4HmXnr3hLreo0CVBDNLXxhlbNI2Sa6ZqNHXn+D4bMyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RrMN0OjeodAWmpEe490sg93TkqzQzvG9skEv1gyeAISUPIxNEV7ZI+U6W2dM7bh0ZNC5Hc3dqHwgwHME5vYbWdCATczBCj5yWgAK9PuKXoXEGn6VM4qNOSnhG/gijj0TifqE4Qghah7CyA/O7UcoNXbg8wz+i0D6VTTwhHQM/OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HENYCoN9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HENYCoN9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5146Nrbv016316
	for <linux-kernel@vger.kernel.org>; Tue, 4 Feb 2025 07:36:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pbAWOdRveCbpzhH2pzN+O2kbwmqTXxZLpGezB7431Tg=; b=HENYCoN9VdwMXpqE
	LryL3nxGibOOFH4dHNkY7licAGv2YJWVDkumMahIr8EmnAX8PHvP2wA+1ElPeIPx
	jMFGh/B1jMZ5cxnv5zVwes3y4z38FJDuesj6yqLK3C5X8RHtaPJpeK1P7pO/1FxT
	lGmV6ppvCwnzoIBF/7yaM8nh4/84xazrz4A75W2SWe1JIuTELo0JnluXkSjGbSF5
	HI7pprvVrEzwp3GMQAg8Y8sH3OKkZGeDVMr+ReeznOwrHjudm+8Bbfl+YFw2b+hm
	FGNkUhF8XDu1n3+eAB/TBAVCI8xAOrYGSm/596K4tCgxnM2I6R2d1RandKxNIXg4
	ys/f9w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kdk8851a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 07:36:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2f816a85facso9965126a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 23:36:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738654607; x=1739259407;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pbAWOdRveCbpzhH2pzN+O2kbwmqTXxZLpGezB7431Tg=;
        b=ffhmUeAc0edno96YNcabDFOGoplQWENfqlr/oTLVQQkHDGEwllBvdlq+7jZi2CP+Me
         8pxrwbnvMZKLk5CNbKNq4xABrfD2/kcZInVu7UM8tXlE7WmjjRZDWGlyZfAZiJng2wkU
         fZjP1+yEPk8+j5PB7Hyfbzyf1uoOu6UjuqkPLHMN0aog0rziUwZihJvDVB4VqGtC4OuF
         VlZlrGM+sIBLm0nKFKOuVuxS2Wxcz1yFMcKtQAS1dvfOQI2OHISFYJ0tD6RAx+4BQCHS
         RELqssdW4Iql2+QuuhecQd2+2A+dbpVO5G6jdf87V3zzWx9B6AZksI+ar6X8IzJuehA8
         sdJg==
X-Forwarded-Encrypted: i=1; AJvYcCX23aUJ1WgFOK11fdFltPKdHRoWDRFCuAEY5HasXJTQYBUXM/rnyyJQBmd0ULiZaPScHxOuLTVsiAKVgBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YybkwGLeloRlFpLRIQCqCGnreDlznqDv4egMHM0VE9Xxn+DA0PN
	HrFIf9AMduRFeSUREzxHkZIS4udsCz2J0nYGE5C3TdrULARUrnVH2Bflur9X7zPjCTpJwONkgMm
	fR8eSRkiHB7YT53iGurmB3vBhoC6bUSFBoAHuEzgVnJSdKzz9C1qW04qeY/AtDYduutGg3lQ=
X-Gm-Gg: ASbGncu5787s1OWshqmLD+vxlKAP2S2fgZLBTFwUSoRTd30VlRnglJzvt2YJ6CPWEG/
	9s4Jnf6vyJFfPJNUgY+9FH/oXV65vLZ3x1GY5ATHv8hggleX1PF02OJD1X5JnwlC3S97Y1vrml2
	mN7+jnrN3rLStKLP3cBSYDTKXHziYIyc4efc2C0ROwpAGXFXXzQgnMxoUDp2/ONAtXOG+x4ktm6
	AtQEcedqHm9RwFJM3XcG0gvwu50wDogbNx7LjBO05DnZLlJKNdUCj32NGuj3Yf/gjxSZVIt0QnB
	0agNKF92/FrLYIb/5MWeuVe6DUc+798NG3/5NkCxYT8pUVE=
X-Received: by 2002:a17:90a:dfc7:b0:2ee:c6c8:d89f with SMTP id 98e67ed59e1d1-2f83abf3750mr41483084a91.14.1738654607384;
        Mon, 03 Feb 2025 23:36:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7Xutuk35lQ6hPLOJ5yqhph9zSp2c530B4uK44ZIzrRai7sqcKP/ZFgEZJfc3lJU+RJtITsw==
X-Received: by 2002:a17:90a:dfc7:b0:2ee:c6c8:d89f with SMTP id 98e67ed59e1d1-2f83abf3750mr41483035a91.14.1738654606986;
        Mon, 03 Feb 2025 23:36:46 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bccd590sm12752169a91.12.2025.02.03.23.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 23:36:46 -0800 (PST)
Message-ID: <c2169141-2449-16fb-55be-8145854ebf78@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 13:06:43 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 7/8] wifi: ath12k: allocate new links in
 change_vif_links()
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
 <20250204-unlink_link_arvif_from_chanctx-v1-7-675bd4cea339@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v1-7-675bd4cea339@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4gh19_fJDTX95FHtFcww-qkzNBgdqd8B
X-Proofpoint-ORIG-GUID: 4gh19_fJDTX95FHtFcww-qkzNBgdqd8B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040059



On 2/4/2025 9:53 AM, Aditya Kumar Singh wrote:
> Currently, links in an interface are allocated during channel assignment
> via assign_vif_chanctx(). Conversely, links are deleted during channel
> unassignment via unassign_vif_chanctx(). However, deleting links during
> channel unassignment does not comply with mac80211 link handling.
> Therefore, this process should be managed within change_vif_links(). To
> maintain symmetry, link addition should also be handled in
> change_vif_links().
> 
> Hence, add changes to allocate link arvif in change_vif_links(). Creating
> the link interface on firmware will still be done during channel
> assignment.
> 
> And since link will be created but channel might not be assigned, there is
> a need now to test is_created flag in ath12k_mac_mlo_get_vdev_args() before
> accessing link_conf or else link bring up will fail.
> 
> A subsequent change will handle link removal part.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
