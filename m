Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB141E8332
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 14:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749307449; cv=none; b=hZoIuE3kj9DrOTAtvuhdkKJzY30vbpyeOArnGfvpwX8+NaGvZOJo6yojIKC1wbQ/hcOHoegYbd063r3KL8St0/HlHl1X0mnaxIeRDUjlN3CA1J3KCWaRg0LXoKH/HGG9sy5or3AHwQ2RRHFeDNqS/PZNJ5htamMhjzi6LQjBtnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749307449; c=relaxed/simple;
	bh=LnaHXraGbIP/xhceE8DNIMIvDlTzfiBhctvEU2EuEOw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ig8pFqr9t+SpIi19w4VfrBqqqPRtf2bnXjwdAoj83kJbXC4giE2T10zwfTYThkoWmo+ngSsrgT+EnFeSpQP7vpVFF0YzMVRSmjUXRbIbJLCYqR9gWxGX3o3in+IVmzotQIxFXD959ex18KxdBtQtLd7NpZ+8zYAEMuuhbr7Ek7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kgy1IkXr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kgy1IkXr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557DP1NI026384
	for <linux-kernel@vger.kernel.org>; Sat, 7 Jun 2025 14:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AKP57LtvpN0o4j8981kkmloCcGjwLJ5jDT4OhefdPHE=; b=Kgy1IkXrftGxepmr
	uc0UArS5i4wrtrf5FZ3Sm/GsO5qk+5F09LCIaCgGbzM1ItDk12kBbnbVOOl/aoG9
	7492EBodHH5H9qU72eshDI7rYFh8C1oOMCzXBS7Hfko9C6NdD+mJGn8SchsiPyAQ
	hwdsQdW+VLrFkbdWX5sa3lGMsZBmlMNjvpfxcvvYTng3PTJB5dr9AWeyC+UkYBVz
	BzBE9kWKBg9CaF+i2OBtDDm9ExgWxzE/jEUW/E/kSyhM3QipAVUywAX0FToW33ZM
	q0QFLrep/xGkK9xm2yxMHC1r0Z7zeX/RWtMCrmj8loTI/03/F7Xy6Q7JSFMJP2m7
	4qAlPw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474b4j0vtq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 14:44:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235089528a0so33011135ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 07:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749307446; x=1749912246;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKP57LtvpN0o4j8981kkmloCcGjwLJ5jDT4OhefdPHE=;
        b=broIqgWDO6psFeoJwH4tw9L2g8Crywvkjne9ciQ85aRc1FlKsyKCF+Wubz4oo9XiYr
         3BBeNQ+7DFGa1+3vo7zNglFvfYucvJh+vrJDAzeJLJa1WSr5EVYaKyyKvBpc5OmMgndL
         ZhcXC5KJW0zu54YGfu77Vy9aRwM0mK3LzXVZRFaUnybN4buiXnnIZnBhCZG3pjcyctVL
         RR41mfQdXthIQPNsYO6mqxttjv8arn+BGkL8r1aK1Ixe9CyEaMBYLQOL7+8881wHHsh6
         LpieCH098BCSM+YXbOsfNuRbDX/aixxXWAua9R0W1j8mtnHCBvR/bL71+MMxaPiCFou1
         f2ag==
X-Forwarded-Encrypted: i=1; AJvYcCXDJcu36oywh+ZFQ6xnMW0vFb6z4DuOPZ3YxIr8cP9wVsdp3Bvb8ysUUurrYrJJZtUKUsdZ24nGUdJMIYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNdP8mo4IjuCg7gV3FKtNfFL/5o4LlG0w/L44x1T2naxawD7s4
	j/al98Gw/iFYrMCXsZE/LvU0vZE9+LzPT1skNetm69aD9FBVFCxZWgFvvW+jGjvwN3P6HHAOar6
	a6RGCG0nx3TJKHaJ/jkyB9sIHKoD0H5Y1bI6lsPMPeO7Q4XR+kGmBKjQNTIFIRVjDAVo=
X-Gm-Gg: ASbGncvyFLgDthB7acVniTnX4esYmgzFakz1pHJd9PmRgciB1QTd9KqFlHVjearolxz
	D7pmOAX0PSdMt8R6p2q5ENoajm+kktvNfBvzrvpAC8ke2HFP8zRsvrHdxkRI545bbM6GDJuKeHx
	DXZ9gCQ4tANvfQ6upzlrAcSCuRiutzkTcSjziDJOxUd2djqxvruoFPJGFTxSiC1T/DUuAQAA0xn
	RiIPxwUpRRVhxn7xYqmzB5dR7ZYxnFgZxpGCyvpiqSMQ5fG2h/cOKCR4/UsVzm5i7Mktlm+al9O
	Cac5C/bVSj50e1O3Ps5PJxYUXcjeviKRn2KmbZ0AGaDKuviS9FtcJC40M9c=
X-Received: by 2002:a17:902:e890:b0:233:fd7b:5e0d with SMTP id d9443c01a7336-2360204e078mr98779205ad.5.1749307445915;
        Sat, 07 Jun 2025 07:44:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXJtHzI0iZsOHPoQDPNghXFBlVaVQi0Q2yp3wgPLwZoHZhFseuzZTHToiow1f1iVUEDMUQng==
X-Received: by 2002:a17:902:e890:b0:233:fd7b:5e0d with SMTP id d9443c01a7336-2360204e078mr98778935ad.5.1749307445571;
        Sat, 07 Jun 2025 07:44:05 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030969ebsm27626415ad.72.2025.06.07.07.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:44:04 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250604055250.1228501-1-miaoqing.pan@oss.qualcomm.com>
References: <20250604055250.1228501-1-miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: fix uaf in ath12k_core_init()
Message-Id: <174930744425.154748.15678214019639234293.b4-ty@oss.qualcomm.com>
Date: Sat, 07 Jun 2025 07:44:04 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEwNiBTYWx0ZWRfX1/fURJi39167
 9mLOvLs+8iWZSBzs+J+A7oOvHf3piUsApoGOROVA1JfSyTK4JNK1kkmKBjY00XMx5DqwUEQkvvX
 fShN2eqfCHf6BOF/p7TK7rqEhk2boKu6If4kkRebec9qK1A5RvWinqoG+EJ+tC1WEamBTluX4X+
 LGWl9fQA+osfQXsc7ruOx0UIhLY3//rinCjtbQfYQkKWvAFX2mjwSdte6bBiQc4ZGwdzvXNYS4q
 wkjv3r8Umq+dT0B2tnB7Xby/f0qB9kWcyD7HMs/LUCdf9MaAiUAU1r6m8zw7uw2/ZjkQ3HcdRjA
 qvI+3aKJKyDRHininUbVwObPjnXoTOtWgv8TP2H2fKLl8yZCGmIOcPxWPZVSYMZ2jlgGI3nKJeN
 Ut+xWAONRKxH9A9keL1CxtzdDWhhTbnjAzrkAcMyEHsqR21ut+RYl2OuS3/n/x2fuOd2cWwW
X-Proofpoint-GUID: tE7kUpm2380KWlgvM3YRfhgEKW2jxPKT
X-Authority-Analysis: v=2.4 cv=Te6WtQQh c=1 sm=1 tr=0 ts=68445036 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=SO4j_8h2HUBQMcU2vEcA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: tE7kUpm2380KWlgvM3YRfhgEKW2jxPKT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070106


On Wed, 04 Jun 2025 13:52:50 +0800, Miaoqing Pan wrote:
> When the execution of ath12k_core_hw_group_assign() or
> ath12k_core_hw_group_create() fails, the registered notifier chain is not
> unregistered properly. Its memory is freed after rmmod, which may trigger
> to a use-after-free (UAF) issue if there is a subsequent access to this
> notifier chain.
> 
> Fixes the issue by calling ath12k_core_panic_notifier_unregister() in
> failure cases.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix uaf in ath12k_core_init()
      commit: f3fe49dbddd73f0155a8935af47cb63693069dbe

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

