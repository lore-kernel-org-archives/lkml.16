Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11061DE89E
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 20:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738785671; cv=none; b=Zp72sS4oBNLE4pJPjV1lbyU5pxQLFkM7GjF3fZxW5fU2SsFQnUZCr8eEOd/9K2SbeRMi+tHcehxkFPaQQQ0yN/bjZi4h3ynorgnbNT/e3UpX3stX/3+rZsf+R1tTEaUDtVTrLnM/hPuA72RQ4HqfTjEzzqYC0OEtrB9nkT1vmx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738785671; c=relaxed/simple;
	bh=sv3dPfsK2lDWUx7YB4khHcs4oRJfXUqlMtha4zql9Rs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NDOLTYfG3qZzTzYaRI0f6OpCAPlf35ot6SQFjpkFOdN65oZCtfnc/3MICfRifprKadLsPUl4HzERoF3oSbCM2smx+dLTRyDSRE1pb+RKztkRA5ipSl0tUYMKkGlJkRwmqhA4BKZAPW5KJP4biczXfWVF5e1m62RO0iB7tToWq6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YXqz21hD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YXqz21hD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515EVYhe025691
	for <linux-kernel@vger.kernel.org>; Wed, 5 Feb 2025 20:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sv3dPfsK2lDWUx7YB4khHc
	s4oRJfXUqlMtha4zql9Rs=; b=YXqz21hDoSq77vSRUr6vpKNzZ5vNQT7prGDH1m
	kMH7ODMPXjswHxN/GsV+erF1IsB5KryENLqkase4ISOp/NoNlKdAjnzxj34tVkCd
	C42GVEiS8Z3jhqkB/qKpjLuFoZf1l954eexdKf9Rc/opos/ro1x7fZtt2Xf8GRvg
	8amMuCzF1LHrP+L96R8v+OzdVgHT2Cuiz0AxbHl7giypOypX986gnigIoKjpLmVc
	68BEejEFsJxjKqYzDT8RYL2cNlWqw686yQi7J7JFAwOYggivEKvNBPlzE7RWRzQc
	PtLR4ZaayuCaYu2UPOGAkuHKSWqO+6vInowGsVKWSqMLZkkA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44m9txgu6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 20:01:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2164861e1feso3787795ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 12:01:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738785666; x=1739390466;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sv3dPfsK2lDWUx7YB4khHcs4oRJfXUqlMtha4zql9Rs=;
        b=HGfNfKBFAzT7IobMgcfmz02hkpQdwbg0JWOsfXP22eX6H1i+08Hobca4/nwoJIwTdr
         EXgXkj+TRdmeHpU3ovGdYtG3QbZBY1R59Cok+ODfJdD0egPRj+t2P1lzBtpOXXC6HbMM
         hSI9Ac+d96/mknyVYNb/MAtmT0bMO6Pp4MwOLwDEz8R+9EMXUPLuKgr3Ne5ZCD+ndAd8
         YyLlXWnhCCZxdneZARwCfAudGA+bzhv9FUUE2d/L9YbQHlBBiYwIVEz6M0Sd3B+5EpeL
         Wzd16brYEBmBx5F+B2rqZd34NnCGJV29Ztt/l7/kTu/os+5doqjL88ZC30LHx1EfNCIj
         wRXA==
X-Gm-Message-State: AOJu0Yxl1GPbUJKjG7x4jcHik6Saaj8LBkIcD1MMWyqYIP3s9HPybmHw
	A5Gyuc/BP0WXUKc8XBGrRma+3P0G2K5LzihYOYcDOtjoIzuuo0wZsEwT0gvcbnTjE9D78Sh6yeF
	RW/vsG6pAHLQ/qofmuZzEPjGeA8ayg6Ccwq3yl1zYGiWuVW1gVCOEGVj70OCVG1BkF+BGzwQ=
X-Gm-Gg: ASbGncsTy0UjRCWGk09fboIXywZOCv/IHmB18Pqn3fUt4L6BtofuwTT1VbnvYj07nTU
	KiXR6IXsgx4fXSrB8TN6VbM4L+e0ywzJGe3hbmrNfQ0PlelLb3A1RD/bPKXq5QL2aURPFzurnig
	Vzt4W+cCYR25bmLWSKBQrg+7v84/gFU/omqwoDGKpOe8z+Qfwr3nbYgjWtAxC+9B1AKWWxl6aG/
	3HNYMx4S+dkihW1sUpXGeMwbJOGGvSCGi3MbKEoYMTlwFTzbHbhtvC6sH2Dm/thHVVlyWTZUcc3
	2Ba0Q4ioXnI4MJgEul+2OozZk2BSeBY+YjGlO/eUng==
X-Received: by 2002:a05:6a20:9e4c:b0:1d9:2b51:3ccd with SMTP id adf61e73a8af0-1ede88105c0mr8149928637.7.1738785665183;
        Wed, 05 Feb 2025 12:01:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEb0qC/EtAAEEdu0uSVz4i3oxZWIFN8vzHdgJCEhclARF7Y1gptWZfwZDp+u0Fqxxuv75R/tA==
X-Received: by 2002:a05:6a20:9e4c:b0:1d9:2b51:3ccd with SMTP id adf61e73a8af0-1ede88105c0mr8149651637.7.1738785663232;
        Wed, 05 Feb 2025 12:01:03 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ce076sm13333716b3a.138.2025.02.05.12.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 12:01:02 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Wed, 05 Feb 2025 12:01:00 -0800
Subject: [PATCH] .mailmap: add entries for Jeff Johnson
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-jjohnson-mailmap-v1-1-269cb7b1710d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHvDo2cC/4WOQQ6CMBBFr0K6toQBW8SV9zAuBihSAi12gGAId
 7dlbXQzyU/+e382RsppRewabcypRZO2xgc4Raxq0TwV17XPLE1SkQAI3nW2NWQNH1D3A45cZjK
 /QFEIcW6Yx0anGr0eyvvD5xJJ8dKhqdog6rWZVw/TpFyot5om697HAwsE6MfWAhx4JhPM60sty
 0zeLFH8mrGv7DDE/rAwuaT/PKn3FJVQgBkI/OrZ9/0DEZA2Cx4BAAA=
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: Xfw3BdGCGay2F_b7iz1_oT2Lshd0Ytqk
X-Proofpoint-GUID: Xfw3BdGCGay2F_b7iz1_oT2Lshd0Ytqk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 mlxlogscore=458 clxscore=1015
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502050152

Map past iterations of my e-mail addresses to the current one.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 .mailmap | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.mailmap b/.mailmap
index 48de71154296..1cd63879fcf2 100644
--- a/.mailmap
+++ b/.mailmap
@@ -303,6 +303,8 @@ Jayachandran C <c.jayachandran@gmail.com> <jnair@caviumnetworks.com>
 Jean Tourrilhes <jt@hpl.hp.com>
 Jeevan Shriram <quic_jshriram@quicinc.com> <jshriram@codeaurora.org>
 Jeff Garzik <jgarzik@pretzel.yyz.us>
+Jeff Johnson <jeff.johnson@oss.qualcomm.com> <jjohnson@codeaurora.org>
+Jeff Johnson <jeff.johnson@oss.qualcomm.com> <quic_jjohnson@quicinc.com>
 Jeff Layton <jlayton@kernel.org> <jlayton@poochiereds.net>
 Jeff Layton <jlayton@kernel.org> <jlayton@primarydata.com>
 Jeff Layton <jlayton@kernel.org> <jlayton@redhat.com>

---
base-commit: 619f0b6fad524f08d493a98d55bac9ab8895e3a6
change-id: 20250115-jjohnson-mailmap-63678199554f

