Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366AE339A1
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 16:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749054278; cv=none; b=jd6mpGfPHsb6ZlTtIBNJl7wsS9vjeF3PnUEGEktw8CSxgkAnTWdoWLi89O76zGuaZCHNSubCk2OVifby/D8igjrO8rKoXYLvXvgryQEwzKBdGRf3Aq7iloKwpi1JFcr0xZgNjwf7an3/OYafXEQbiM/GHYhQVqDcQTXNWLqnG+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749054278; c=relaxed/simple;
	bh=PO3jUPStlFmT1m2wkC43j6GeI16ajnRuXqsKw7nCnHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ku3ib6b72uFUKwPKFQ7X8IuV30Z/jA9kSg2szEY75NlStO29+VZN/0krDaMdM9TNhZMhkZ+jAfI+x+TI7hkeK4IM7BxPv8n2nKuFu5qxoNtK2CLkLRgyzoPnCnu3tfb1b8/lJ5WB2P2djPstBzsxjrk36P8m33mPcyk7D6upfGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KJfXl3ER; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KJfXl3ER"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5548B4Ns027453
	for <linux-kernel@vger.kernel.org>; Wed, 4 Jun 2025 16:24:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UmqjCOK/2PV+3jpeh7XZghC3MKfY9pGurM7qJBU/Zyc=; b=KJfXl3ERFqlZhjj3
	21STEtvBdDAbkpQsizC8Gvb74Fv8Nse5ic109dL5yKJ8iNC3iOoIFq+CP3iOrC1o
	wEQEq1qUJdXVV/jDWF3WlfpysKmCxf04km6UJRU6/RxRKsoj11Aigttyp7jwcR/R
	Cdbm6AnzT0EVPlC6uHfswTs2rAWCRks3cxKpmFy7AWedXgbHqLU+6lABjF7lp1Xj
	pxmDEG8Nq/Ze0tSnAeWoggdg2D+0v9BR5A4iowj6cRLjsMLCkaQuXRb+BPn6Xg3a
	1orNNQx+eRrZ7iREFvp/41TkodY9XfWP+IJkSGDYjWAUyRudElRWQ/FBEDVWGvms
	GKO+Kg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t6q8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 16:24:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-310efe825ccso14995a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 09:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749054275; x=1749659075;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UmqjCOK/2PV+3jpeh7XZghC3MKfY9pGurM7qJBU/Zyc=;
        b=TTlftSSHfwTZE+IC5lbq/QI2ENwpEya0NChyTuP8l9cFLN7xoczW5eu/W7+4D3m2ZU
         Z+B58H6izbrDouKJPj6ef4kna0zcWgj0uC7WMJmopmVWqKtYX4Rko+ZHpdHrZrWOvAtx
         rpRYf8gffR1u+4SF+wdb0zBwynmG195DsBNfAD+dV8TF6kc+LtvqSIdTpdRIit9k/RgC
         k9hF1+f0gGAPBUFeDKwk8uwjQ2n2BXAUTxRPm5A4wep+HyYVmPlG+nAS5q/G/giGRaux
         M+KQW+L8HYAktN6GTZj0f3gRIXJ9/L85Igy8FHb03se2Ou4PKFrT3rIvvrvQ6T4T5hJJ
         M5PQ==
X-Forwarded-Encrypted: i=1; AJvYcCXi/Y9mRSMONbO7m2TZFFqqqWR+itm33NsEnwbWlABxuttcBj4kyzH+KJCsydGg0ET90Yl+n65MZ++G0vY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJWKr+rSlONlk7+FxarF0iR+XOLCNBxbWxGK9lffBqdls0fYZO
	Wgwunxzm2qlKqHTIy1196aQ6KpL+318XkEl8hzkcz0T9Q1Z5rH4Ch95zmCKNDAuV1TIdziJLl0v
	6uSPRhgc3wE3Llvh5B/Yks7nydeh65VNjyfInzIEyGPyespa8xIHxhO8ZpzIJ3QtCaa4=
X-Gm-Gg: ASbGncve5FOP7HR++5t7mhEumORxD5/v63mCLEP6WNAdCs3znpXqoxvpYwhOgjDteV5
	w60B+t1C1dpXsdiRjIS1yyydl6+Mgwdo6YLaQYC4r5S7nhD22WaN/ERMys4xIaSdIH8p0C/2Hkm
	wu7WT8fLL+ta1YWdXQKt8zIUtY+a0g4Clmt5odYauGqVZdE5vffMKrP+WvtQdhN561Gjzqfc+V6
	lvjifDc0U+eakKKIIFNaZKE3nOmyl3seAqbkkEjhyq60E5PpHpTgKdqnzZno+4Gr4HMWR5pZZfT
	kmTA/f3a7pAkvETgJrH49QX1TSC6UNeCGEtH9+zaa50tj6mYFHUF7d4ZxZKFRI9Y7NU=
X-Received: by 2002:a17:90b:48cc:b0:311:2f5:6b1 with SMTP id 98e67ed59e1d1-3130cd3c193mr4541065a91.22.1749054275293;
        Wed, 04 Jun 2025 09:24:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyeX7AH3Z2qmV4RyPhkzwExHjRAMbx65+A1uhcePobw4T+CSD/5pREJy2bkxvhQy4rzQER5Q==
X-Received: by 2002:a17:90b:48cc:b0:311:2f5:6b1 with SMTP id 98e67ed59e1d1-3130cd3c193mr4541044a91.22.1749054274900;
        Wed, 04 Jun 2025 09:24:34 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2d1689sm9089572a91.12.2025.06.04.09.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 09:24:34 -0700 (PDT)
Message-ID: <50555c1a-c200-4ac0-8dfb-424ff121b41d@oss.qualcomm.com>
Date: Wed, 4 Jun 2025 09:24:32 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] wifi: ath11k: fix dest ring-buffer corruption
To: Miaoqing Pan <quic_miaoqing@quicinc.com>, Johan Hovold
 <johan@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
        Jeff Johnson
 <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20250526114803.2122-1-johan+linaro@kernel.org>
 <20250526114803.2122-2-johan+linaro@kernel.org>
 <026b710f-b50f-4302-ad4f-36932c2558ff@quicinc.com>
 <aD1axxSAJsbUfnHH@hovoldconsulting.com>
 <5268c9ba-16cf-4d3a-87df-bbe0ddd3d584@quicinc.com>
 <aD7h0OOoGjVm8pDK@hovoldconsulting.com>
 <01634993-80b1-496e-8453-e94b2efe658c@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <01634993-80b1-496e-8453-e94b2efe658c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eJQTjGp1 c=1 sm=1 tr=0 ts=68407344 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=OOj_HejH6eEqbjqsXVoA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Z9YjwYEsreRyweYvuuPSjgcNH6lQ7fpC
X-Proofpoint-GUID: Z9YjwYEsreRyweYvuuPSjgcNH6lQ7fpC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEyNSBTYWx0ZWRfXyXiue4fuHgjZ
 UVkQ6g4GTY/+KKZP2/W+u4bvZnNU7Fy5ZWup+/s7GAZUXgS7I1Nswc3EzOBJ7a5/HuEucXwTXhz
 zjVzu2D52zwCesVGAd3eDrKTqLdFTVrdHzJ1LVqwzFHAK/reTmj2e01LgSznqvx/WH3XDXyWNPM
 J9Ut8DlOaonIG6IM6gN4vimR2NY9N0EKEV3rhFnVwD0sTmMimP8KGSRqGYXOxyVMxv8BUBm6jds
 jzRMXrRaoVWZ6abQ4J3mQpfUZQkjBhPVrSjuLzAZWEJ8NkZ5fJDJ0rTLQowlFkuSour7r23y/+I
 nccbgfbV5lIHcCkXLOxUtLnKOyGb2B7f0oCTuVQ6+05EzEkMSq5ZR5oIHlvuOt9y3v+rb/reEyl
 7Q8aAeNNaWVl6/oG7nhCb5cwlXikvHbTb4sUiHVuf7otUwSpNeNYSQTROkbPQWUXiInftUDa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040125

On 6/3/2025 7:34 PM, Miaoqing Pan wrote:
> We previously had extensive discussions on this topic in the 
> https://lore.kernel.org/linux-wireless/ecfe850c-b263-4bee-b888-c34178e690fc@quicinc.com/ 
> thread. On my platform, dma_rmb() did not work as expected. The issue 
> only disappeared after disabling PCIe endpoint relaxed ordering in 
> firmware side. So it seems that HP was updated (Memory write) before 
> descriptor (Memory write), which led to the problem.

Have all ath11k and ath12k firmware been updated to prevent this problem from
the firmware side?

Or do we need both the barriers and the logic to retry reading the descriptor?

