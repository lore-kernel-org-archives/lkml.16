Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD069478
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 18:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748889848; cv=none; b=INJfObMzletjCgFQ3ZGYLzyTbXvxUd4Ce3+nXj1Bt0C1pgkE7PmDWvv1c8VxOYS7ysS/kpsexbDIm6v6qEHigTLfdJdTdyrdpRSVBLgAhc2rGb7+Ytd0r8M5rXI1UnNv9x8iOZQZF0bUW4sRWc6s8P6kQyulZfSDMZBPXSPwj1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748889848; c=relaxed/simple;
	bh=XmtpEbxQTVY0TxB2afkia9yFjnx6FANLX2a73TxZpqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z9/jzhvnyMCYIUut8XqR6Cc3Ngv1yaU3PQVZ6xwXgSAp1xOpUpoy8WI2OCzTINQfqgEXta//giDroYoN8qBknp4w5nzFNbMt1vyCkvwVfJbfDGulA46HpwXPncYvbrPDbG/JgJeAFhpS/1ElgpQErdfhVb370tfC9lmCiEt90jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o2pDPgXx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o2pDPgXx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HJjXt011318
	for <linux-kernel@vger.kernel.org>; Mon, 2 Jun 2025 18:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pkhb0fZJ6685MfzVSA3b9RYxGVM93ZFjX8xQbnaRk7w=; b=o2pDPgXxuqsz+HTq
	p9M/mjJ7D6kxHe/RJz5w7qXbVS8v1sL7+spBWf33WLnQPGBdv3XViIYM22jpUlyb
	Op4c/mcYPG82IGIphJu68et/bwens/v7KZDr1h92tGGcTARFAtNvIJHBER2EmGnA
	CM66vWvuaOPxq+DJ+bBWbXs55TjnJwzpHrCSP5o0otKj/2jlaTH8uMwogZOKm46m
	3lBUrD088yiHQR2pMsNlsOj+MbcDxB6M7MV+vMlwR6oQXDHCcT68mbVvNOENeSK+
	oTurDLGnXzxieqJhB9cn8VGIX6SKImiVCdxIItCwxhW4J5QWa88VOyzol2MlR8gJ
	ojsecg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8q07cn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 18:44:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2c36951518so4473427a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 11:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748889843; x=1749494643;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pkhb0fZJ6685MfzVSA3b9RYxGVM93ZFjX8xQbnaRk7w=;
        b=gAEoIgomcOwArIbaLZ+QMIT/8hV+guDhSinGxDIqe+SjXSAzRQRb8346Y8V6q+VGyK
         1boI6GxycBXM48/mJJMtdKAULHwW/nZ+MRPtDjd2FZQ8bRQBgUsyTUp+PryYTaX87oeF
         YVvHk8srPKBUDYZmZemzDcYH8G/RmNSht/lshPLXBrOnae3b3WM1kXTJZCOY/j2dVc3T
         WqG9mUcrbmsDUs1VJFW0LcNIEL3MDq1IFtubx5WVfAe0ODOJT6IdM6Kagi1kjp6UTles
         rafMxnlT+xFyNDhRkyRgVvVoTLcudISBsL419xSqjiizNG4gBFpv53voLNlXAzgSkEgG
         lixw==
X-Forwarded-Encrypted: i=1; AJvYcCV5KhG2UZowVIsGDqfob51bvQFvXZU6BCsJ4CJsWBaTt0UvvGuR8WptpFdU5+gZXEw1XMxR5kv/L2Z16LI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmecQ+CVeLuW0sJrnlexJVtGLaluX5B+O2w0dtd2FGfJOihRX/
	rhZW9u7hBGzO8fJE334ox1q/TaDs6k8UZoPX4dG6qrwoDGKOTIIKm1m1IkNlkmAhyg0Eo3y82KB
	X22lKWi1WvR18meWYuc4vhIs4D5A85HLT0brB3B1+mpK3cgXkMk72sHNHKq5qAHdlLYu5XbKK83
	4=
X-Gm-Gg: ASbGncvfCgG8t4gv4sUqJJYZNSBscFPFsGCYsaUlnTL9pqHx5TF4dRlsIcdtAl5Jc1J
	AiJXcKJ/x2+TsTIQL0mrnbRI6yPz4zOAVLzZQKhZEFWVxWQ6e5LEgrfD0IZR3lHrqmPTGN8Qy65
	6rwT4x1esV6yb2kexpsdtBb7xyy64Dwea5YpbJ8jWn/2GbM7PHcpN3dLQul8MXelOlMW2ovbQVf
	dd88oeudKAas6kyuR4JPLnks74RtuO9CwnWi8b4x+qcxywe9tZNRKz6bgbf08YkirNso22AaoE4
	nm7HtAnlcWACtwqrXaGRfJQxyZ/Ca9YI0lnJpH4GP4V4PSM+DOgUeL6HPLYJgkeGFA6UewE7jKk
	DxBT3
X-Received: by 2002:a05:6a20:4393:b0:218:c01:ddce with SMTP id adf61e73a8af0-21ad98bbc8amr24524339637.40.1748889842917;
        Mon, 02 Jun 2025 11:44:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh3f/0lMirOc3pBNrbZ8B3eldkYX/eh0mNVpbeV25DRUU76oAwll8v5eq7/Bs5wPVnGhE+Dw==
X-Received: by 2002:a05:6a20:4393:b0:218:c01:ddce with SMTP id adf61e73a8af0-21ad98bbc8amr24524305637.40.1748889842573;
        Mon, 02 Jun 2025 11:44:02 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affafa64sm8208743b3a.93.2025.06.02.11.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 11:44:02 -0700 (PDT)
Message-ID: <1a5852c1-8595-41af-9a9c-282bd508842b@oss.qualcomm.com>
Date: Mon, 2 Jun 2025 11:44:01 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3] wifi: ath11k: validate ath11k_crypto_mode on
 top of ath11k_core_qmi_firmware_ready
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>, jjohnson@kernel.org
Cc: ~lkcamp/patches@lists.sr.ht, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250522200519.16858-1-rodrigo.gobbi.7@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250522200519.16858-1-rodrigo.gobbi.7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: udbP9a_wm-rwVuO6T2MuRTHL3IYXJb3a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDE1MyBTYWx0ZWRfX/z0vsNyYjgvi
 8/iCnNlPs7TaBTETBWs/jZyIrqqDjcxRF69oA061Gq4qkXc1jTc6ZdVqDQtyZD0gmpTolazpqdQ
 h55Mb6MlV3uVWgBWE4ON7pGgSEB4i/7ycSf1AndeDUHpCd03XzmP92cBaXywprRFtwkb4b29o7z
 yf/bAz8YzISi5Bv9/oSeUZrKxO4W5TOIgW9bVj2mEURt9+VhNNRyCEFhMY2DT0Tr7WhyJvdd++C
 htRe7vwBjg09mDSQmi2xBMZfJoA75BeP9sGO+2S95qiHGnxJx2U/kf9Owc90Bu85vYSMHxn6Q3g
 cj5az8vlMeYLH3xLFiI5HUmtl0zxUlSR9mh4E49N02Ypr2VoJGn+DVXpcR8bLk02/wkIbIms7I4
 q7Bx0c4inZN++2+zyZSxzgodGvuVxYdyu1yoszFjjbCqvTTlSYvzCUlhrf8jWVwXBmp+WpwG
X-Proofpoint-ORIG-GUID: udbP9a_wm-rwVuO6T2MuRTHL3IYXJb3a
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=683df0f4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=pGLkceISAAAA:8 a=7IIfrU1qyLA2P-n2L4wA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_07,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=921 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506020153

On 5/22/2025 1:01 PM, Rodrigo Gobbi wrote:
> if ath11k_crypto_mode is invalid (not ATH11K_CRYPT_MODE_SW/ATH11K_CRYPT_MODE_HW),
> ath11k_core_qmi_firmware_ready() will not undo some actions that was previously
> started/configured. Do the validation as soon as possible in order to avoid
> undoing actions in that case and also to fix the following smatch warning:
> 
> drivers/net/wireless/ath/ath11k/core.c:2166 ath11k_core_qmi_firmware_ready()
> warn: missing unwind goto?
> 
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>

Since this issue was previously reported, I'm adding:
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202304151955.oqAetVFd-lkp@intel.com/
Fixes: aa2092a9bab3 ("ath11k: add raw mode and software crypto support")

