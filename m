Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC721519AA
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 14:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738764597; cv=none; b=r2euCu/eL47GWv2NKoji38ArsEYvuudxmfQXr2RSJ5AbIHAkHHQRQcknuaPmVym2kZYcgzKR48LK9lqZ843aWclohfOYPCl4cGfxnAnIgk84gKWDkUgTKtDcLOY25rCsjyxCWevcgZ9sHoY4CS6mOek9f5We5b8lhY2DKnPDFS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738764597; c=relaxed/simple;
	bh=ELmu31UuOp7Jf8KIRvMw0zed7+2IwMJ+t0XkXdIcNj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MFhTPwfqqxMgCl2OsHsQuwzMgVm3klYb6c4l9oYBNrHcpksxwYEK5O3rRa2qW65yDe5ywlQhHVyGXc+6H04x1Tcj9GWhdUR69IRW5Vz3NfC0bhiIBkU3q/zH9eefWkwRRB78ul/bi/IFecjUmSkgC7QJozonAsazzw3CUzD9F6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XsbWZ5t7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XsbWZ5t7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5157FqS6009769
	for <linux-kernel@vger.kernel.org>; Wed, 5 Feb 2025 14:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7w3JP/cVcIEQr/swGtrAUB5rPEohaiFbEvSqpR+lohc=; b=XsbWZ5t7gLN1iOlh
	zhpC7Yl5Hxox1Raeoi1jS+a8dhUYhNxMqrWby2kBtItE73Ex/WW87zxRt/WdDehR
	BrwKvEkQsvOND4QtHgGNDvmFcbHYkLVfLgt9hGCO7002aN5Ml4mJ7+tZunJFP0cV
	XGC06RFYtfZfeWXemjX2U4dHw4Kh/pAJkfUS8BzzpxlFagODOX6q///MvZY8GT0z
	P6McwJPzyiaZo6hotZhiqmvJhYLXOFx8VvbbAnJn3EUhzMhpOH9YoxQbW2JgewNy
	7VhtItGQSdVdu+rlJcCML3v5Wi43ffZf1/NZW7cT9vWb5JAGLj957qObufjRj3up
	0yuZPA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44m3esgy7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 14:09:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-21dcc9f3c8aso106051385ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 06:09:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738764593; x=1739369393;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7w3JP/cVcIEQr/swGtrAUB5rPEohaiFbEvSqpR+lohc=;
        b=JqSdiN11qJIGYb1xpNbfaktLsiBOrGT7JXxI8xtZRznpNfCmb7UC7Z6OnvJL0ZrUna
         r9sY7b7TcdbKrpLacVAGDw7F1gdOiD7gZDEYUArPIwPVnV7snRiWX0fKCJylQaX8fm2I
         W6DCJtfVluZJ5ZlMMogeXlfF8e+jwGURxpuvjCQGL5+Er/Kf6kDWQdHNwtNMfLT2H2aQ
         gCNqaeGwwzKrmNZueBaW1+eDnDUZGWZ90gn6Xc1imt8NwocSoleEhrGOJcdjAShqcRrO
         hgzOKQTfq/N/PKJsg/hxWhhZdIiKR/uOAt8a5PLV3h422EPDC5BVYrEWvf07kurE5cjl
         Qw3g==
X-Forwarded-Encrypted: i=1; AJvYcCUX5k+XSCrRzocZg9qyeSq7FcB6I97KsfIjTUPE8n/IXwNVF4xT8/5BSbos8MYfEPIVH2eosfdtX/Iz1RM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNpG4MUjrcNYkCDWqcUFKbDPty8dLdh8FtyxyobWpUmGNtQUgr
	XRcIfC3o2Z3Vck/Khtx6oWzdcy9dVxxeUJg0lqeWuYQOgsjWGIrzZRbV8iW+S/rkTimYZdLnxqK
	6Zgp0iRjPBmBQR1f2gLPROKFCOafaTwZbBpdyNeGT0cJ7Ug7TJSxQ52PJWIjoQ9I=
X-Gm-Gg: ASbGnctYBZ+Exz+mqwxJn/yKmeAW81JKpWN46bTq9EoSees/3kOPQjSBdmGuJF5ZcAw
	u2++cMG3Kosh520PPH8kIhH93JpOcUxPvt5N986HG2xybeUE53b6jzFy2SiE/tqy+QaSF5536wy
	1iqYgpnhLeiifpi25tBeB0+i4ExcmWlqPCke+uCkmsn8I/hN5levm9EoVko9CXSArWhpGv7L0qL
	Xl/u7ZD5mPySJL61130U88JCvDfTsdhZ3TXZbofybAcyIVOhbfGtU+U4HtrGUFnW5w4+Css4Jm8
	xeUleteLGaTKMJOdY1yCPRvGrXjOv6E1W39LiaaQZBTfPo1ntNem
X-Received: by 2002:a17:903:1cd:b0:21f:1521:42f with SMTP id d9443c01a7336-21f17f2a696mr48122815ad.53.1738764593463;
        Wed, 05 Feb 2025 06:09:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbeFDdmyITBvXL2yRLiW9RtO0gymcSkv40yDdn04oMY3HCR8afEkO7vTit6UHSub9bSjzYTQ==
X-Received: by 2002:a17:903:1cd:b0:21f:1521:42f with SMTP id d9443c01a7336-21f17f2a696mr48122475ad.53.1738764593072;
        Wed, 05 Feb 2025 06:09:53 -0800 (PST)
Received: from [192.168.225.142] ([157.48.120.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f052bc69csm33220165ad.183.2025.02.05.06.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 06:09:52 -0800 (PST)
Message-ID: <c1a8143f-4b5c-e6a7-c1a8-b294b369ce39@oss.qualcomm.com>
Date: Wed, 5 Feb 2025 19:39:48 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 6/8] wifi: ath12k: relocate a few functions in mac.c
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250204-unlink_link_arvif_from_chanctx-v2-0-764fb5973c1a@oss.qualcomm.com>
 <20250204-unlink_link_arvif_from_chanctx-v2-6-764fb5973c1a@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v2-6-764fb5973c1a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JbklmVZ-Ezlhgr_Igia4hTpC3U8oQa0-
X-Proofpoint-ORIG-GUID: JbklmVZ-Ezlhgr_Igia4hTpC3U8oQa0-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=685
 suspectscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502050111



On 2/4/2025 10:35 PM, Aditya Kumar Singh wrote:
> An upcoming change will invoke ath12k_mac_init_arvif(),
> ath12k_mac_assign_link_vif(), ath12k_mac_unassign_link_vif(), and
> ath12k_mac_remove_link_interface() from a line located above their current
> definition. Hence, relocate these functions to above so that these can be
> invoked later on.
> 
> No functionality changes. Compile tested only.
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
