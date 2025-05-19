Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A7728936F
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 17:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747676897; cv=none; b=dOdYwk1v7yOxD8YuSmSiw2KchT2YsM1hPvifC/zetepRvSHE2Xw+GrtPJJGFc4zmLkLbeiAySAYGu42N5ODwS/QFgEEkH+fSx02mCBErRTtTp+q/kPxT7TQDS69aZj1VBUelIOT7hEU927GwTXDoIsHWHaRl1UBSOnV2erwIBDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747676897; c=relaxed/simple;
	bh=vsNkDDC8i8tSmyarv5U2ns1Y2U/vMMf6WrDvv4lrWCQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dEXSM1KoujL7TX5aLR+xUM7F6iQqPOu0aUA5SUG3KcdhjANRpSWlJBXLCI+mjaKUdoCye4vtkE7P9X4BffDmZ1GzhgNyzwVGKHKmGHNh6hkVK4Z3XIhMx76eupju7KF704MrUwsspEYWIML6KSVxVp6HM5JRMlyrK8rWGdJgZIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nBAZIacE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nBAZIacE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JF02NB021371
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 17:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/iqUYcQ/ZKzUE0OzM5wAJzodMofqq4SZ0eyOXeP5OsI=; b=nBAZIacEk1H+H/rM
	JhG2yO5ZBzJOpq7N5vO+eS8FI4zCu3ZVE1z3+ia5nfBp+7qBE7kwfBknYowPhouK
	ajPXRi0mJq97G6IjQJwhDRDxVxgiJpbNog01EZdV0xw3DcPfxFVp6aCDl8uLTPEK
	Lnf3iDrcKEZi3tPLCpXo5tTQRG0zfEBm12PskkkxZLHOa2srcOKujig6i1kKD7dk
	0oLsG/vMfG8BkrSDbicX4NJeYPPu0P7oqMMdhjDef7InmhiZ1gkho8Q89IG/MpOZ
	Hi4qsSXIMIy9JEasvSl0y1lcU3hfMYU84INVMYEAGZZshUhC9kuA1maawSYF0ZIN
	Fl0SRQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r6vyrepg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 17:48:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22e3b03cd64so36231435ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747676892; x=1748281692;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iqUYcQ/ZKzUE0OzM5wAJzodMofqq4SZ0eyOXeP5OsI=;
        b=nIs5iRnRZmvY87pMJzTCYvb3S/vreR+pOirO768TuDDqcHG6qV+Uo5PK5oNnX6P3IX
         t+skw4AvvaCOFdFsjI1ErCxlmK0vH2qMrU7addZFvu/PrTatyLyCf5jD1M6F2a1jn4o9
         AY1+peKRIPpMHPvW6PnxcO4D/euvO8KmQPQohHx8aQqhLRTClEG+7e/plorOSoYD9cnL
         acBsfioOxatp26ldE2v4WXu7Bw8rZSYVEqpPrzt+VqjHS5edcGBSFAv+P6CXJOePXWSA
         PALY0ygOi+hcDFyCHMr1N7aw4XIQCeR9IE2sTdT+ggDtDalAyq0rVjqyc8YiHlrAUfO8
         VPqw==
X-Forwarded-Encrypted: i=1; AJvYcCVOkOgXBwSRmtomrVHUfc+X16VtGM2I4m1Ag5Kt0uqKC7nGpNcqcJhd9/4sFK1qWVW5qggOQOLbcoBaeXc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyiz9ewK5HxQj3r1OLrBvw6hX2AZWqOL95MIQcf50xg50XrgeGL
	ScpAGaTu2v5lVKPXms4iLegzEqoPMwWyaSW1SKEJEUlO8CXqWdP3eH1gLfKHK4si07XHb52MMLj
	XQq8rbsCQU0tbIHdMTjLd1JadmDbayI4fyRPZDoD0AtctChZUmmtv+Z0nSxicp9LiXlf6gvw4KN
	A=
X-Gm-Gg: ASbGncs+4nMjftx8/QZNniNQChNzSmwYWHY7+7w0iaob5gznxLujT93MDSCIYYYjidD
	elRq5dyb/Pjfp5kvvP0aJWmJwfc7lwQFvL+Ep1Ns3momKpnMckWAP+ob6RsX6wvPX2PNIkx1tnn
	xlIMdvsb2/hzYOWojMhtIFmT1TomyQC7CAuQXAI/ygTWOxoijNrNlPkJQMHOEIiN2Xrd8p2iKL0
	p4GxU8vf9YwcWVvbu3aT/N2jcNCzLoEsovN0kkHkReRrNyZOaYm4F0YzHe/Wu1tUmrOZDteZIsG
	w85tuKEfG3gb1+9S8wOu7fXps/kYgBQjBanc/5rhtfFxQG6o
X-Received: by 2002:a17:902:da86:b0:22e:50f2:1451 with SMTP id d9443c01a7336-231d459a6f7mr183152685ad.37.1747676892201;
        Mon, 19 May 2025 10:48:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkfT627Sx+Y3lijWGrgnOM4K80G49i9mNQuYpNlnrPDaKycAmPH3/wNvhLyeyCLDdXtTPxaA==
X-Received: by 2002:a17:902:da86:b0:22e:50f2:1451 with SMTP id d9443c01a7336-231d459a6f7mr183152505ad.37.1747676891821;
        Mon, 19 May 2025 10:48:11 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4afe8b0sm62651425ad.89.2025.05.19.10.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:48:11 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Mahendran P <quic_mahep@quicinc.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, P Praneesh <praneesh.p@oss.qualcomm.com>
In-Reply-To: <20250507-fw-stats-mem-leak-v1-1-8d4d1d8ec0e8@quicinc.com>
References: <20250507-fw-stats-mem-leak-v1-1-8d4d1d8ec0e8@quicinc.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: fix memory leak in WMI firmware
 stats
Message-Id: <174767689082.2567051.3798725859514530074.b4-ty@oss.qualcomm.com>
Date: Mon, 19 May 2025 10:48:10 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=NfHm13D4 c=1 sm=1 tr=0 ts=682b6edd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=D1emlATrmXGj1goK3P4A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE2NSBTYWx0ZWRfXzai1/+sE55Bx
 jVqNlrICYK/YlV/ixGelAkXVYaacyqj4ty+V+8laBwTUyowQBPiqp6HYcx7WCotJMrIH9/7i6f2
 83nI88PappFyYTXda+zCvkuTPLZ9BuC3DM0sJhqMRk7XmTGzYqXIfBo6i+t9nhzrIsGqGJGXqoD
 4O/MBQEssXep3MqmILlNBobtg6prfPC9Cl9202lronzI+Elu1/H7xwfPEdYxn/kZNs00MjnzPbQ
 5WUUJIPZHtuAhRAUWqRxG1nCaNGvjlGBDGNW4wH4CwoeyJfF/zsHO8H1aEgQC8dtCBEXwcbX+al
 c9PS7eXm8pmmF4e/IbPvKj3ocFTuVpVYsX4xzvcMfDwSibPuhJbNj9T6klIjcRnOMvGS0D3m8wz
 5zXC9XdBa2y2udJ/j/q2K5O0/jk/6XHa+E6jUOKNH8jwhClW8UdX4yVZ9qSwXkcA5UZJjkAz
X-Proofpoint-ORIG-GUID: vQo5_hR6qbYu79r-BHMS2QzMBCT48TVY
X-Proofpoint-GUID: vQo5_hR6qbYu79r-BHMS2QzMBCT48TVY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=932 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190165


On Wed, 07 May 2025 22:41:19 +0530, Raj Kumar Bhagat wrote:
> Memory allocated for firmware pdev, vdev and beacon statistics
> are not released during rmmod. Below kmemleak trace is seen for this
> memory leak:
> 
> unreferenced object 0xffff8e76aebdfa00 (size 256):
>   comm "softirq", pid 0, jiffies 4299272453
>   hex dump (first 32 bytes):
>     28 19 71 c3 76 8e ff ff 28 19 71 c3 76 8e ff ff  (.q.v...(.q.v...
>     9f ff ff ff f4 d4 03 00 aa 88 09 00 bd 40 23 00  .............@#.
>   backtrace (crc dfe1b440):
>     __kmalloc_cache_noprof+0x2b0/0x370
>     ath12k_wmi_tlv_fw_stats_data_parse.isra.0+0x44e/0x730 [ath12k]
>     ath12k_wmi_tlv_iter+0x5e/0x140 [ath12k]
>     ath12k_update_stats_event+0x85/0x300 [ath12k]
>     ath12k_wmi_op_rx+0x624/0xd70 [ath12k]
>     ath12k_htc_rx_completion_handler+0x1f4/0x330 [ath12k]
>     ath12k_ce_recv_process_cb+0x218/0x300 [ath12k]
>     ath12k_pci_ce_workqueue+0x1b/0x30 [ath12k]
>     process_one_work+0x219/0x680
>     bh_worker+0x198/0x1f0
>     tasklet_action+0x13/0x30
>     handle_softirqs+0xca/0x460
>     __irq_exit_rcu+0xbe/0x110
>     irq_exit_rcu+0x9/0x30
>     common_interrupt+0xa7/0xc0
>     asm_common_interrupt+0x26/0x40
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix memory leak in WMI firmware stats
      commit: 246eb353fbe9136ab3dd2ef979764a13984989e2

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

