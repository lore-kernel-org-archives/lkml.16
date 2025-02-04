Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BE12063C2
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 07:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738654627; cv=none; b=PNCfZCNGZp4OToGD5fIKYg6WtVNbpnWRzyPlFtL1c//VwLcf9X1TepOOObFyvXZvGoJQm5U3bS3Dm3rm9OzsAjCh9PrJIi/9B/6mVqfoe/Wuzn+FG1GSsEeB6xHl6RRK3mq3s5adpEMZK8y17caozmkgGF7YHB6bAjLYbTYltU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738654627; c=relaxed/simple;
	bh=/qhtMuNIp25xxiq16ZgjxPc4+4xcPynyS8OF7VvDGFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I5JQ7xPEE9EADuVB2QFf+ohqk+BE9odAoilePMoNkikrXGqQ+/HGEG+ChtK/1MWrTTDg0LfMPFykvUAS6t9GtHLF5OHU8TSU1Gng36H+hAyph73lGputmztlDdKj96K+i/tQd5a8NEGpvGaQ4rSXf4mqZSM3NLNCwFBIRY0Gffs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pDWLo6Yo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pDWLo6Yo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5141RoCE024821
	for <linux-kernel@vger.kernel.org>; Tue, 4 Feb 2025 07:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xbwStFNGk9ZhRMrgv+Nm5kTajVLbIXujL+q9pSKJ5NI=; b=pDWLo6YocF4LlGCt
	sHAeq6rD4m0Y21g20iibOWPabm+doVQR449DUm21CZUKW2/1GFr5g/R9W15HM0vp
	oE/kOkoB5qhf6srnTo0Ydyx+HEi69b644D4jrhswBfoWFgR5VJSCFKiQ7VT3u0gU
	qoRSo+ZbQiO78TBzD42J4pc6OCKB1yFzZQFMdwEqqVZO26Vn0HsiN7x1QCi3fqxZ
	Ij+z9MEUUwr9WCHVMrbMtPRvTJIvCZVP8P5kxQZfZTgsNhazCTUdx4J545Hi+kqJ
	BlP6YCJTyd43oAQNdbRrxVWNINNsZS1tX+w1MdSwd4jRbJmYsFajP91GstdchsBd
	tOkCYQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k98jgn71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 07:37:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-216311faa51so98112265ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 23:37:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738654624; x=1739259424;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xbwStFNGk9ZhRMrgv+Nm5kTajVLbIXujL+q9pSKJ5NI=;
        b=Dp8uLw1c4RAwt/JRPgbLjkHQuDsm8BqhJPhXy4EU7p9V0FKGeeV2SXKqpR9mDPTnUZ
         1A90BQvic4qpm0Wg0gkhH/4APVWZbxbb7/WJS/2gBEPwCHXN1xVh/wzpfmpDgtxsQVLr
         LFiPZipedUooAz4XfQ/O1N4oy6dzhANAIXUBCqRu6OE8sjQsaDjLd4CHj5O/9V1NIiWY
         x3sJTc06NDvymuYS3AH1Ii3BAuUK88tL8de92OvxHvRPLB+MEBEbCulGLCi0z+SfZzLX
         nIzdvJfUfBnziguICMcmazWChQJ7Bm5h+tmxPE00Fs9YskBFa/bIfaAcczbQNqtvrJ7A
         YrSA==
X-Forwarded-Encrypted: i=1; AJvYcCVFP9PZc/9MUOHpfXrA4nd6H4gw4OldQZNWEvifO+vkXiNDCqgS2cFvbIUMH3ozVcPyo4PAz/OnHVY+Mk8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvl9SdEWnB8wF0JViGQoxPBidem6i0ni0e1mHmSECbIVZtkhwV
	ffk4Bv4cfRmk86QjLrjU/KrxmTzy+LItTjIrcciBqJZg/hYYqZM/4kj2b0Nrxukje0/Qhzys9gv
	4qDRBKWWrU/p1uVDGOmr3LVYXhHAsc5OjVztBzosUS9+2NydPigo1XVgtayGdlHA=
X-Gm-Gg: ASbGncvGzdTRBdzD3HW6CDaMMKnYFVJM3VNEPhXzCavxm5slh4iB61z57O1qrvg3N5B
	aLE7urjYZT1HMRYvbXkzTn3VHu7lF/oK563XsaT5aNkGccOllVv/GuhHfOpHLggVyg+Yv0EUnh3
	qYI/0L7mEvDGUu9SCpDVjLPabKHQi+dhOhzEi/EGpoHupQ4uxFGawSATVCWKsKmHn4EYzOOIq98
	Dp+zBALe2bBs3EoIwv0clkEBdrA5PTvbBfYkzUleQQshCLQtBn6tJ2CNXfXYfJU0IqNTLCJ1UWb
	wkLXKg7ffmYKnhn5eodHQaGnyVxfuIgKGxm3c4kwnhX3tMs=
X-Received: by 2002:a17:902:d4c3:b0:216:4122:ab3a with SMTP id d9443c01a7336-21f01bfe787mr25218465ad.1.1738654623921;
        Mon, 03 Feb 2025 23:37:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuEU+vfG/VEyomAMLpVLBwLsqanyokCnh8B0G+p9cv2aesNTSbKyF5VnvwOJIU0lP2it/1cA==
X-Received: by 2002:a17:902:d4c3:b0:216:4122:ab3a with SMTP id d9443c01a7336-21f01bfe787mr25218165ad.1.1738654623579;
        Mon, 03 Feb 2025 23:37:03 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31edddfsm89276605ad.8.2025.02.03.23.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 23:37:03 -0800 (PST)
Message-ID: <70e67b9b-1ddd-b306-595f-7cc6802ba803@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 13:07:00 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 8/8] wifi: ath12k: handle link removal in
 change_vif_links()
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
 <20250204-unlink_link_arvif_from_chanctx-v1-8-675bd4cea339@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v1-8-675bd4cea339@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 585kxCGxbRkpNMazZOp3wpzxhi-e2juP
X-Proofpoint-GUID: 585kxCGxbRkpNMazZOp3wpzxhi-e2juP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxlogscore=763 bulkscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502040060



On 2/4/2025 9:53 AM, Aditya Kumar Singh wrote:
> Currently, the link interface is deleted during channel unassignment, which
> does not align with mac80211 link handling. Therefore, add changes to only
> perform vdev down during channel unassignment. The actual vdev deletion
> will occur in change_vif_links().
> 
> Additionally, since the link arvif is currently allocated in
> change_vif_links(), to maintain symmetry, add changes to deallocate the
> link arvif in change_vif_links() as well.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
