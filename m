Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1EB26156B
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 17:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739295139; cv=none; b=muO6LaNCJWRe/1Dl6v0kBLHLidE89NnWon6qrTAFYV7KGWd7qjDI+gelgWrmKucDpCXVhKOb+knAzQncj0+iMn5St0oWe7iG7nO2JenPY9l5ECr79z58zu3bAGRCAgDGBKg+9bgr7uuJxDezCI2gtyqFns9hke7bg2eN/qAk+9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739295139; c=relaxed/simple;
	bh=myFhEI7olwvlcKDX/vZyne2d/kbazrOb4/046xUxn4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O5A8BT+9S2xXSr1sPPAllBR1eP5GuRMQxZYMSqaAwtWCESpro3foqZ/w7/Jwa6pdQ1tyu/C+vp9n6z0qpGObiK5NyzrxNAw2Y4tUlX5eU1vF+DUutkVNOAqu8JcKfYNPcW+rmIwI9kg5s6/0g0FY+RVzoRbOHoIWoq7J0d7j664=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EqxbXW9c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EqxbXW9c"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BCRSf2030318
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 17:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7t13RmOscMfNDi73nleX4EUfoNXKCb4b28tzUu8aPKU=; b=EqxbXW9cWWmWZDpK
	KJHTfS4BOz9w1wKyaRz4aAM8il3tM5Wz52S/pYIY3Xb9NNCtCE6vl1VMgkSTrXUw
	J+a62IiCeyKEIl3tCWDuXYJgR9n3WPjRMj2xrp0s/MwZt0nxVe1xzm3PB1sRSE0Y
	f5ypUFOn+PX2Z/SaROlw7CwKU1E9K71vrgo1KxOCiG1QOPE1IFD5v1SKZsWPPR0q
	ZBHr5akx5RiKD/KbYgcXvIv8DHMla3RAmGIUWneM74x0pLDvdQWAtH9VHEei86fG
	cY2he9AwYXRXa7gGtfjgkBkgyErF27pk3v49emaiRQHFeH+J8qWdfnFV+PBwzuaP
	QtPGyQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qxg9j84d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 17:32:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2f9c02f54f2so11766141a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:32:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739295136; x=1739899936;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7t13RmOscMfNDi73nleX4EUfoNXKCb4b28tzUu8aPKU=;
        b=uqBbGebxRLmcNbJFKXVUyskVyFE6YIy2eUCYMZ3jo05dC91ZQSddLY+2PcQj2PMK9k
         +0DiJerlZzWnIYXyRTVRFfqWtUrlIc44QL7qWnGq3tiSZDNeTK4yC78jbzM3WP644nCz
         wEAXvvaRcB51maj6IYVKeRA/mOlN9Mh0fLbzD6gtO9DVThnXaNYVa+h1SKuoYa90Eo+L
         ZLOvkB5TaeaEOvE03Znqy+oUXw0jzZd2UmH9cHec5VLiO+Ms/O1ZNraC7Q9iMFdl8YGE
         rDH45fNGeSlAQBBWHVHwGuNnVOqsfTo42FNAXaSkmwjBCvaLtadr+pQcX9z6EqpNAiJK
         wsuw==
X-Forwarded-Encrypted: i=1; AJvYcCX9eYeCBx2ZtuxicSQsr85kMEB/CYOTyxk7Yhc3B8Zj+rVT3x2xJPDRUDaHZrDptDBHvthPlID1GLm8fiM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyowYlSdIL/u829+djBq2Ju1W5dlXLkjzMzqc24unBCJpHnDYkm
	dSGwy4AuiFeC8k0MxihZFZXwlogNAm0iw/gvQNopX0KUy/4yF8yFMtTrKzzMhUxGjAgzZjfrecG
	YFoQrQw4hC9/ShHPPTtO08oF0k0icIBoZlVo/MOT0h8t9V+rSwuSNthGUslhzUwo=
X-Gm-Gg: ASbGncsL5QMFj/nkuk2wYkYu8BbrvR+Q14KcIeOPj3YjtLPR06iFNxB30OmeGZWU+SW
	HIfZ5X2Xs77YOQluErfZl5a/ns6oxIoMWZye13fS1ZNmKHg4WmN1r5r/LsE5puYGbXioSxSn+NA
	lAIijZozzViCVT3YuLMS+JuGBGABdr6z6hZJAjxxpUH0EFEMpEODv1y0YzPvXIyBoEOs/F8v9G7
	3w+MXQflcJu1oY/0+oaF5NKeoOK0WtxMVKQuFLdjasNuKfTN/X8WNVIjzIyAyt2/TsHxk97q3el
	IgYmLTkYEE00JHVdL0vc0jByx4XQ5FwEW8wwWBz6HA==
X-Received: by 2002:a17:90b:4d8d:b0:2ee:693e:ed7a with SMTP id 98e67ed59e1d1-2fa243ebdbcmr25018189a91.35.1739295135574;
        Tue, 11 Feb 2025 09:32:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF21/tLPL2jpe5F4TcV+Wyh9fwEmWRbfBc0shXo7z6JXXJnQmbq2Yvx8LMK31GkNy5SlgN6Ig==
X-Received: by 2002:a17:90b:4d8d:b0:2ee:693e:ed7a with SMTP id 98e67ed59e1d1-2fa243ebdbcmr25018158a91.35.1739295135224;
        Tue, 11 Feb 2025 09:32:15 -0800 (PST)
Received: from [192.168.29.221] ([49.37.208.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c187sm99816815ad.168.2025.02.11.09.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 09:32:14 -0800 (PST)
Message-ID: <9f0b4a6e-337e-4370-a2b5-9aed1887d112@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 23:02:10 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: cleanup ath12k_mac_mlo_ready()
To: Ethan Carter Edwards <ethan@ethancedwards.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Harshitha Prem <quic_hprem@quicinc.com>,
        Kalle Valo
 <quic_kvalo@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
References: <20250210-ath12k-uninit-v2-1-3596f28dd380@ethancedwards.com>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250210-ath12k-uninit-v2-1-3596f28dd380@ethancedwards.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: a6JIRU57S5GakajOUnyjnmVnjQkzb8ZK
X-Proofpoint-GUID: a6JIRU57S5GakajOUnyjnmVnjQkzb8ZK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 mlxlogscore=550 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110114

On 2/11/25 08:19, Ethan Carter Edwards wrote:
> There is a possibility for an uninitialized*ret* variable to be
> returned in some code paths.
> 
> This explicitly returns 0 without an error. Also removes goto that
> returned*ret* and simply returns in place.
> 
> Closes:https://scan5.scan.coverity.com/#/project-view/63541/10063? 
> selectedIssue=1642337
> Fixes: b716a10d99a28 ("wifi: ath12k: enable MLO setup and teardown from core")
> Signed-off-by: Ethan Carter Edwards<ethan@ethancedwards.com>
> ---

Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

-- 
Aditya
