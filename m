Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8202F29A9F5
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 23:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750203144; cv=none; b=JrKIwqUHZ+NcnGzLODfhbPdgnXpBB0RKvy+bL/OPa5+AyGfbCwFTg7s08BwvKBTiowpvfMOLFYK2lz3/CIwdVo7Y8ZTaiA1+yCu/uH2ADsx58isF2aEeOQC8dQqUWow9xX+snNccQ6ICwKp27QEZ826/Vvj9EayAbPKohhxfqCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750203144; c=relaxed/simple;
	bh=kps3vLmnJx3B/yJxyZndcBo7ZEWoTFzb7DPEPjlrTOE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MgOwyNgvzc8iAbrFmNMpZ1XDbYE/s5ew7tCj6PZy3pnYGY1uJdXCUMHKRn9qSdxBpS8ArT0ja3qwWX+cX7ZswZqQprzSchvlIRsuetAn00KDNgesOJ93VVKMzpG87csBXM62/55Z6F0mxdQsWAH/EKJcx3DvZUC4RlwyDAbWovw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fXKJO8FI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fXKJO8FI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HDL9bH020136
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 23:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZ4FdOFIakuXxnQEVyx+5eGfp3wSKPDG7zSbpNvGx/I=; b=fXKJO8FIMXuwCIeN
	tNZrRe9xhGdVsR/sfZ18+TjQqohSqS6pa3Vz58GcB7GC+FX4mZP9JLiNWgHwOKyv
	A2GbslE0RxhymP4UTNIelUUBXPfFLNxREU6nwks2+QkB9l/5hqfG1IfUC/nSaeEG
	KNu/ef+We3WJLKGu+pUEm5xLzRZ3ZidQ6AlL9pxUcyYbcHgCcpG02VE0k7Spk3n9
	HZPbJ7X+ZJahCZ5TUTmBl+ThBHWZ53rxvMMOp2kdD4yvFKxbzYW5NULSC/v3GkQG
	tjGRq94qdOA2VFhqcFB2l+NYTbak7pnAQUukyY5KSZpPHBInvvvMnT476fBYAwep
	Iet/Yw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp5rq9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 23:32:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23507382e64so58685105ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 16:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750203141; x=1750807941;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZ4FdOFIakuXxnQEVyx+5eGfp3wSKPDG7zSbpNvGx/I=;
        b=aKXvHi7B/XOKBGkgxMXiOxbasWogv/ls286xsuDFPn7Mw4HKn4ekeChIn2irCgj4PS
         vdaDOpqHalXr7/7al1vN4JEyHIYOy2ANn8BUvq2nx4xV6bcYdqek0VOFRixpMey9gFA/
         RNE8lcB92J/AFVaLjHeXQWH+PGW7wioCbYUF0DUbWnEdn0er2hWzmjpYMf6H6eNzSVY9
         V6h3S4yyHIaF4ze1tnUvAp8x2TPLMjbJHc8UFlvdL0e78KnyXHrdAT7KX9WFq3eYNzMs
         EsZcxwrboXmTgsflAql8MT769ZY8qrZGFYDmY6g/iij1k3XMgoml8rssVWv4ZZAzj8AQ
         Z/YA==
X-Forwarded-Encrypted: i=1; AJvYcCXYYBoiM11WV/3GiDpu2ZqboKFd0nfsD7y+SrWYfKHMbZGeBV4iZKq/eUbW6ec7pdzcTUbg6EA0SlKk9K8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0lqnGuouUCwv9AOGdFI5KFUln3g9HeLUJAvR4eWCNxDS11F/1
	GAjtBEQTdVZA8yHtP7VrfTcNv77NQlSluL7Vlp1Gs6YMRIu6Lgc63lI9lWiQ/L8Q1FZdd/ZWGY2
	5TqJIrwEXACGOUVCWjnP3OC7kdYJDImpaG03QdUf1r2OP6btG8UiKTfrLwFpY5kqH432F3uUU9A
	g=
X-Gm-Gg: ASbGnct9S0vgoVM2sI1oOB85G9+oYGTPSlzzk0iL64vcuedXzNYUTEC9QK1uUamZOnp
	CrbpOEFZVOuxfLrm6iJYLLI1/cAv+kdmv1RQTRmm+5Eqyogewmy3mqiVNuXSHnFPwyY9Vy+1eKZ
	YrnSNTx1+9oZ2UIRdaaxNyp/CDZLlPgHD9wFvpxMRh0wmnkEQsBYRojP8Q7mOeq2yIAtt025RlC
	8MIWq4FXbS8G4VMNtQFaMNySexHuG3u9dpnqJYqDJFCI5vAvyyUy66DqmdfxFQDEh6KHSAxgbvd
	gN80GVWnzYBXPVtJRqUUIZTXRyyranHhOVlmBE2bgbHkcUrMVMzb20YVt+4=
X-Received: by 2002:a17:902:e80c:b0:234:f182:a735 with SMTP id d9443c01a7336-2366b3acd9cmr218530965ad.34.1750203141247;
        Tue, 17 Jun 2025 16:32:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHRvrUYB8tbc6pP2l3PnvgjQCwiR+ff4pjdfIGh3YBUmg+FQydrVipUHwAYmdF7GwwSPh6Rw==
X-Received: by 2002:a17:902:e80c:b0:234:f182:a735 with SMTP id d9443c01a7336-2366b3acd9cmr218530655ad.34.1750203140862;
        Tue, 17 Jun 2025 16:32:20 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19b84e5sm12731527a91.2.2025.06.17.16.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 16:32:20 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, g <gregoire.s93@live.fr>
In-Reply-To: <20250612-ath12k-fw-fixes-v1-0-12f594f3b857@quicinc.com>
References: <20250612-ath12k-fw-fixes-v1-0-12f594f3b857@quicinc.com>
Subject: Re: [PATCH ath-current 0/4] wifi: ath12k: fixes to firmware stats
Message-Id: <175020313996.3793705.1525991907377461235.b4-ty@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 16:32:19 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: AIO4clAzwktloMDF8dBjDaz6bixWtFMK
X-Proofpoint-ORIG-GUID: AIO4clAzwktloMDF8dBjDaz6bixWtFMK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE5MiBTYWx0ZWRfX3W4Diap+de8g
 VYYiq/9rnXiz4iO1N6srbK0QYgMiVyCBX1zohiil/8Njd9aj1i9O2HTT3g0QQ7ZUhGf3rsja/11
 h55m/qbCLRmGggYBpssS1KM3Y791KCYXGfHknnOInEuoKZxYD4D7HxNBRZATNnMbd5h/EgLuSsV
 TPAngJR6ChqkpVH5gPho6bK8tnQ/QfPD8PxntL0LITLuD+DyxlE6y7MNkY1z3GWtFcLnXt8M1/o
 5MH7pvp8zB6voxwfzg+fNMrc9sBNmkhvodXNN8uMvnzK6fiVu5VmZ1OvGoe81jJk0LplvyLSn04
 IV19ukao6xWPq+RDU32uoC7hf1PfqAiz9LZleruXFlC1L8a/JPFd0q+5kfKSLVWW48IyrUR89Ca
 Xjakevt4VG8B2KtvLDY/YqtCe/MyP8PcHNHopMiTUnihUWdYUzVDdsZloNq/qspnU3p4vT9t
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=6851fb06 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8
 a=EUspDBNiAAAA:8 a=ImaOgrEwS3qXJJwQdZcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170192


On Thu, 12 Jun 2025 09:31:48 +0800, Baochen Qiang wrote:
> We get report [1] that CPU is running in hot loop while requesting
> firmware stats, fix it in patch [2/4]. While at it, fix documentation
> on back-to-back firmware stats events in patch [1/4], and fix potential
> failures due to static variables in patch [3/4]. patch [4/4] fix the
> failure when there is no vdev started.
> 
> [1] https://lore.kernel.org/ath12k/AS8P190MB120575BBB25FCE697CD7D4988763A@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM/
> 
> [...]

Applied, thanks!

[1/4] wifi: ath12k: fix documentation on firmware stats
      commit: a48a931a32f88157db2baa31c10738a7fe660e93
[2/4] wifi: ath12k: avoid burning CPU while waiting for firmware stats
      commit: 9a353a4a11a475578be3c02dd17e70afe3a4a7f6
[3/4] wifi: ath12k: don't use static variables in ath12k_wmi_fw_stats_process()
      commit: ac7b8ff7839ded757806317ab8979be844766770
[4/4] wifi: ath12k: don't wait when there is no vdev started
      commit: ad5e9178cec589bf3af589dc43e638e5a5bf56fa

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

