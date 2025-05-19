Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900DC288C8E
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 17:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747676894; cv=none; b=kSUtEB04bupVn/BixJQFZpTnLBfd9hln16WHyLO1MqelamFiWlB5r6+hxBFSlw6jy0K9hsximCpkoFBl1KtEACTcfmZHrscpKnVIYh8V6gXbQeEmVuzpvY2gwYRJsTHnOAfB0GXJYXyX5akwid9r2Chye1QXaroy3Yd/77P2uNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747676894; c=relaxed/simple;
	bh=yTLBi2JfjilFHuvzH0mtehz5/98aqUg+Xjww+lLuHsY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rapBMfX1Z+424+wbW0zBbGWkFQAwmj0wvfrAmH0QxgcxhY05c4ngtjEei7nWiyhkN5/NSH2x6LN1v7By1Y1SNEZjSCSq/wAA/h+CKOcrbflWH77YyrjiCsUGwn15OM6y9KXm7F6PoTeKcw2UatFyJo5VKL1VSy0XookNIhfXY/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DMrcCWiW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DMrcCWiW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JA3Wcj031155
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 17:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4EvE717nSURiHJFlzxR4FQmeEPs6Iqvr2ySq5HbVy9s=; b=DMrcCWiWYpRTnJ5Y
	Nii4FXwK1pg1FaUeVsVgOk3OQu7e8sFyb0MmVfarOci+9hKrBklYLOrAeL0SAKdt
	2/r+8h5NFXGfa3daU1smsxXXQSY4XJwXffkx9FpR6/COnB+MfoPernVkpTEl5FKQ
	06JZqZB06iYXMUwdNriht8WUVTz/S6rM/7LOebSOb/GFQxzlNUHxo5iWtDdamvAK
	qBrB5qRozCwThnQskWrFPyF1vb8kSczmJlE1oh4d181xkYlRxM7/AZIItSVU6QoH
	ipVC4SIGOeJ+CxV2+QK4Pd2Rzk8uY0FRmBtnFWYDTH+UsPWDMQixtmoOokxtgPa3
	XA4GNw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsw4j2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 17:48:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2321215e4c1so15595615ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747676890; x=1748281690;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4EvE717nSURiHJFlzxR4FQmeEPs6Iqvr2ySq5HbVy9s=;
        b=t4hvyoNgtctNoQdG2Z1VaqeuqzLEoid/SsNeB6y/cb1f3C6E3yNw1x1CnIrbEQd2/q
         rrzoDv3yfh2JHzj/aeAW6N8KsJMPid/XWTYbdQSW6XOyynp5FlBthHDUKViglNjBgQW5
         +dHdUzCitgk1H1kEK7sd+yf5k1jZBUVEFvRbt+Od4JrpSvd9Zh0OJqaH+Na8k7tlvsQ9
         T0frU7jR/hDUHdllirKrNDeMfCWL4Wp9foJjWJQnL0v/6S47keXb4jQAEtBHn5PPfdTo
         DTHc7rGCDVkadKyWyYGXR/MHimkS59LuHWNy8H4na0Iu7WVZrY1xQUxNRbiYtozfe50X
         kz6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtBs56kc7KD++oHJePXOTHLUdUVGItA8XBRjmmPNARMP4X4EM7DDZckr2sA1v6fvvmB2lkwKBX48YCjZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhRrnL5rWIav9utV7N+C2aCwpqbXOjEQCDZBltTzhhzwJJjM4F
	lvHcldbn+8y9Azoo4dy8E5gqdOvBpq4Z94ZGcEnBvR5tAbQ+XU6sOlNIjD/aAo2L1txpvQkPYFO
	uPE1pMC0TVX7BzbjTGhv5IGBjQpVwUX6+I9HR1fVfprEK3Nq0Z1UuGudMtHSU8KzJdH8TgLMbCb
	k=
X-Gm-Gg: ASbGnctXu3w6XMyuXplIoPdrU89hu5pnpsrKvZfU1AEN8ghXwV0cl+1JwDX8g+ipbkx
	f3NKWyMxeg1wSuUbdn/w5TN2urzvaEq73gYG9HWEZzJ8luZcfMjm4Wz5PDPJVnNjO9e3ZSqK1DH
	K4l2bAhOK/XhRLECjcvuolYT3QcfhEK46AZhJnzyXGkWs83S3yE14NqdQ6MSkeQ2AukhrAIZmyi
	IFebhpE+bvRwJ0O/oKrjUc9L6JgMKYUWvG6folUVDtd6z98GWBlpN6nbu7HQkQ/fDPVjvl/Vy5V
	n4kVYFyrguajjYbpsnXR8B3QB8EsCFWFQaW0eUSY5yYH+ROe
X-Received: by 2002:a17:902:e84e:b0:231:c9bb:6106 with SMTP id d9443c01a7336-231d4d057camr192248295ad.9.1747676889869;
        Mon, 19 May 2025 10:48:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNW2vCmCXCEGgZCIscf+26785zhmH3GyWS4omLFzEgXb2bZGYtEkjCKGC/tS8DJuBz5Qr+LA==
X-Received: by 2002:a17:902:e84e:b0:231:c9bb:6106 with SMTP id d9443c01a7336-231d4d057camr192247985ad.9.1747676889486;
        Mon, 19 May 2025 10:48:09 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4afe8b0sm62651425ad.89.2025.05.19.10.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:48:08 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Rajat Soni <quic_rajson@quicinc.com>
In-Reply-To: <20250430-wmi-mem-leak-v1-1-fcc9b49c2ddc@quicinc.com>
References: <20250430-wmi-mem-leak-v1-1-fcc9b49c2ddc@quicinc.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: fix memory leak in
 ath12k_service_ready_ext_event
Message-Id: <174767688852.2567051.14152574284720219609.b4-ty@oss.qualcomm.com>
Date: Mon, 19 May 2025 10:48:08 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: iCmd9zb1JcgbErcxsxkCioN2TPaaaXIq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE2NCBTYWx0ZWRfX/ji681FooT/1
 CJ2uxqoWDiweNWlQ/UM/IOdUO2sZrr+BEW7lPhcTVBYeFqqq8jh317EhfpMiqRjFeYRtdzUnGB+
 EfafLGqfFev/1AEfnKva0E5kn8jWmWn/f7hFyZTU/98ULKYbUi6dOjjQ6XI5eLcAZ9qu8XbZh0c
 BLqiKbhgjygNaKSPJUO4dRbBou1zG30mmU3JNtZotFqHON/xv2DnXGHSgUgjAXvmV3iUDiUP3oo
 eTKS4ZuEtAjXg5fGWXsnaMsIzqdBQ5YdyfahwMPsSvtEy595L5lqpHQUkSaNCij6qA/g3fwLv80
 qzjnBv1XnvAxF8/G56yc15kowD0WiD2Xk3bRp0QcwJ6b5l8Ue6GJsD6S528oy/bX8bl4XOpMmw1
 u5O2aUiL/EE3n76pZzbmHnmk7Vbm3uuKXmyAl0lTQysvYqPJDo8s02MQSWMk6loJW8EONtHJ
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682b6edb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=FhvEbofts4Y-0ieg6voA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: iCmd9zb1JcgbErcxsxkCioN2TPaaaXIq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190164


On Wed, 30 Apr 2025 10:25:38 +0530, Raj Kumar Bhagat wrote:
> Currently, in ath12k_service_ready_ext_event(), svc_rdy_ext.mac_phy_caps
> is not freed in the failure case, causing a memory leak. The following
> trace is observed in kmemleak:
> 
> unreferenced object 0xffff8b3eb5789c00 (size 1024):
>  comm "softirq", pid 0, jiffies 4294942577
>  hex dump (first 32 bytes):
>    00 00 00 00 01 00 00 00 00 00 00 00 7b 00 00 10  ............{...
>    01 00 00 00 00 00 00 00 01 00 00 00 1f 38 00 00  .............8..
>  backtrace (crc 44e1c357):
>    __kmalloc_noprof+0x30b/0x410
>    ath12k_wmi_mac_phy_caps_parse+0x84/0x100 [ath12k]
>    ath12k_wmi_tlv_iter+0x5e/0x140 [ath12k]
>    ath12k_wmi_svc_rdy_ext_parse+0x308/0x4c0 [ath12k]
>    ath12k_wmi_tlv_iter+0x5e/0x140 [ath12k]
>    ath12k_service_ready_ext_event.isra.0+0x44/0xd0 [ath12k]
>    ath12k_wmi_op_rx+0x2eb/0xd70 [ath12k]
>    ath12k_htc_rx_completion_handler+0x1f4/0x330 [ath12k]
>    ath12k_ce_recv_process_cb+0x218/0x300 [ath12k]
>    ath12k_pci_ce_workqueue+0x1b/0x30 [ath12k]
>    process_one_work+0x219/0x680
>    bh_worker+0x198/0x1f0
>    tasklet_action+0x13/0x30
>    handle_softirqs+0xca/0x460
>    __irq_exit_rcu+0xbe/0x110
>    irq_exit_rcu+0x9/0x30
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix memory leak in ath12k_service_ready_ext_event
      commit: 89142d34d5602c7447827beb181fa06eb08b9d5c

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

