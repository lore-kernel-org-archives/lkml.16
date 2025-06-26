Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E5F2580E1
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750979728; cv=none; b=LKC4bur6W79aYfW1HF5yQVe2jnvA/TR0AwwbFrWiyfozIfjxvEJTIuEQjcpugGLrtKMyMXM87lSEuthYYuci1X8c+hl/wj+g/2Y2QqcEVAdmAbIHtI74nYUefs8Rs7UO1/7SkyhM3Di4H2sl2iTQW8J4sBqqj2jQbvD/Mm+tsrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750979728; c=relaxed/simple;
	bh=aSc0tl6N7FxaMkghN48RVi2dPCCABt5TI+aKtGozcqY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LJwMCMFo1SgbEAFTZzfQbZoQye3Wir/6NrzjAFt+pS7pl9jOJevZReE7dcWFhsWe8NKBiSPbsyxM5ov/FhbF9N0Z5KukymQLN+z/Rc1z/Oog02rvkjgaPxQPUPSGiAfTutRpiICudFybuUuAmE/9wwTjU5fvas02v4b/hH3Qa/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AjRecQy6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AjRecQy6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QJ9D9V008309
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7qeZ7GCDwUB0wspAU08ExZecso0WhfdKZDuLxMXJ7fs=; b=AjRecQy6cI8VaFS+
	SE2vE1IhdWAg7TpT7iUi1GWw1yVwM9GDdkk2rPA+ruQegG0lvKiKCcztDh4blgj+
	HtBACWWnz+mVm+LvYOA979gt7d4F5CK8EmIvKw3fWFSnNlubaRobU59Gb4IN4eeN
	1UkbAe4AKr6K4xaOc5ac16cicpz4PG1YPBTi8E/ZfRYjKwir7WrpofuOBkv6wY1n
	FsjOIvn06JiMZ2gSe7gSCtOxX3lpdLZ2V7v0HhhRC/e2ftRXh99XnSktg4463nnw
	wfomzo6Wc8DQL94cIXHVzrYMbT5DOihlagxpqosx/l+kl3nIpq6beyRi0xmo4yk3
	Xzvliw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqu8j8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:15:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23638e1605dso9852445ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750979712; x=1751584512;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qeZ7GCDwUB0wspAU08ExZecso0WhfdKZDuLxMXJ7fs=;
        b=xRPyLKDY5/4mfXJf0qCKMd7BxCKng4V1g+/Ui7UCIIYmbDPbo45Mc8ntppNckgYiuc
         6GOkUHqjYVlcitm2TKBULFQFZJVLRrXl7BGLP/ds7t3vV4s43yHxiyHLBH53lmEyqzW3
         Wy9MnSsTPp2qwIYmp28PD1WK1l6O/wJtKqzoySe/TzbCpr/SR8E0kBWPgLtET/FAZbq3
         2fxFOb7Wpwv7DGXyevQ0k/O1BwGpkTdRZvPg+oiqF1bLx1KDVNAdY+iIPa5Ve1QhCVvZ
         f/ArHF9Y0OARWFKdliqBdc1VA1ZE15fqbgINcXR5u37Sp2VrUtZVhf8ehP618MlUw4cz
         lP1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUp3PhNLqVFPZc3fMfaMtKtymvBTxLjY1egI2aicL6NcMKNM1FsGaMZkfkht0pajJKkN2GcxTo7p3ABpbU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjXsSmh4dGFRb8Xjfd0PVJiq3NbiVGfddqUkvqHve3hHBtlUNJ
	q1ZEHgU1GLxHDcYqzz7MLieHFAE3m5p9gohbpsv6zxGBLWPAN5pfryx5qAglfpg8rFeM+sOKb7a
	1fU5EHgQ2hFcvCsLHq8tzLERXTf5iejUiOUSRQN8NHxgwoxzMsIWOTkfuzVWdU3IJRntkK7CBbH
	A=
X-Gm-Gg: ASbGnctagY/lZz5G0nnfUjwwo+sm4ypEgVTv4idFH93MofU9WB0ph6MaqTrDxSBSqwQ
	FuCB+dvB6z/orbWnCvT4De2V9VMcP0l/1VwQPvpi9I9gXgDfaF/d+y6NTqibqjojHhhII0YVZlV
	GC+4lEAPD7zBpCpE/CeDFXWC/DwE8f/Er3rNokfV6P2Ixosz5gl6gClhBiiBS7FYvY3B4z73qYe
	WJiFML9j9/iskNHBS8xuwrknDDK1/ExNFW2N1pLPCDtuJPsIZDWPgte7mf/SNTq7ml62gwb8SNh
	g00HBRrYAoyY0SiPwbskLlDyMkTrDup4BO0KVwF5hPREOw3bOjLX9fRbVDg=
X-Received: by 2002:a17:903:1a4d:b0:237:ed7c:cd0c with SMTP id d9443c01a7336-23ac2d8b52dmr14889115ad.11.1750979712460;
        Thu, 26 Jun 2025 16:15:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2tnvUr5R4y05/ayA00IpnhQO2OSLo2b43usy4w8q5lhNvhwx+xftIt+XJU4+l2F8VfIaP4g==
X-Received: by 2002:a17:903:1a4d:b0:237:ed7c:cd0c with SMTP id d9443c01a7336-23ac2d8b52dmr14888735ad.11.1750979712045;
        Thu, 26 Jun 2025 16:15:12 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3adeeasm1548105ad.156.2025.06.26.16.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:15:11 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250612084551.702803-1-senozhatsky@chromium.org>
References: <20250612084551.702803-1-senozhatsky@chromium.org>
Subject: Re: [PATCHv3] wifi: ath11k: clear initialized flag for deinit-ed
 srng lists
Message-Id: <175097971130.153431.12728903041387632447.b4-ty@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 16:15:11 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: JAnLnlEbbXZIPwDjBhcUllEGHVg0U5uz
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685dd48d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=pd9zJXUkC5-qadN-W_4A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: JAnLnlEbbXZIPwDjBhcUllEGHVg0U5uz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDIwMCBTYWx0ZWRfX/8nsFSLh46TS
 5O+rlk4cPxn186gWOKDaV74HWRsLhOm/V9UNv2I/loUfiBWdZzZ0QUkwJZKVwkE0i52IyH4oNui
 2LjOSMNn/bzGMVEc99UYmALRTY7P9v7A4xOaRhIJPEwJj/9sdp4Cj2DqsAmOeLus1FhIMU2+L9K
 rFVqVvNyKYMMT1ONDaQTp3rd47XZhRZzjxTg1C2zHyAyt4HFZcgTQ0VkZVwEZfhzpkisBLbImja
 fnstsM5czM7eOFafzOjZWHMxzbHEkMcwucVrNR4X3WxxPEfKVPzpB88EC7cRUKbeYsmTJY18DWP
 1QUq3g8NoLrT5lEdGlSuJ+S75j0fg3b85HFrwcWl6NcuZ/tUV30hy0rFJj8wjx4725Fy2p/h+jz
 HIeH0FwbPyCW04xhVxWGuCJSMw5iqPj7fucQndDKevO0Q5AW7gr7CTfIUPDyL5w5qX62vNyw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260200


On Thu, 12 Jun 2025 17:45:06 +0900, Sergey Senozhatsky wrote:
> In a number of cases we see kernel panics on resume due
> to ath11k kernel page fault, which happens under the
> following circumstances:
> 
> 1) First ath11k_hal_dump_srng_stats() call
> 
>  Last interrupt received for each group:
>  ath11k_pci 0000:01:00.0: group_id 0 22511ms before
>  ath11k_pci 0000:01:00.0: group_id 1 14440788ms before
>  [..]
>  ath11k_pci 0000:01:00.0: failed to receive control response completion, polling..
>  ath11k_pci 0000:01:00.0: Service connect timeout
>  ath11k_pci 0000:01:00.0: failed to connect to HTT: -110
>  ath11k_pci 0000:01:00.0: failed to start core: -110
>  ath11k_pci 0000:01:00.0: firmware crashed: MHI_CB_EE_RDDM
>  ath11k_pci 0000:01:00.0: already resetting count 2
>  ath11k_pci 0000:01:00.0: failed to wait wlan mode request (mode 4): -110
>  ath11k_pci 0000:01:00.0: qmi failed to send wlan mode off: -110
>  ath11k_pci 0000:01:00.0: failed to reconfigure driver on crash recovery
>  [..]
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: clear initialized flag for deinit-ed srng lists
      commit: a5b46aa7cf5f05c213316a018e49a8e086efd98e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

