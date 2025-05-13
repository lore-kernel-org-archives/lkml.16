Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CAC1E04BD
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747110514; cv=none; b=RqZRMwc+vAHspn/P1fcAqRETuCh/5rD5kqiVVYBNUrz9WbH2E7M2D4LtGzh7SxjxbJXYWokjpYt0EvU6NWMcnjTlmhk1hKysx/GIuvXDXJsUESZuLVYWt7iuP/Ud4uG2yeTvJR8B5J5xx9RWYDEzt0T2iIwRW/gtfgojcSvMHmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747110514; c=relaxed/simple;
	bh=8fWZlBxrX+84Os1R7GIMkrDtRg9kA3/5/dk7OLxFvsc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qEYh80EIpCos+77oEWVuT47wlN5HqaLB9nRwhGlhAb6c4E56NDZ6d/0R9CAgdwrayEhwPc5NZWbUs1JQtg1nAAjDlZoP4vAL691N/2pnSDdaIt4PWSoe20wn5IUQq7SbNErums1OT19TA43hn8ab8ARVNZO0tsGnWAYdGp1qN1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pPh9xN3T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pPh9xN3T"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CJNNnn027758
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/B9yr710kPUz2FCgJIjP6BTbuVzSWyCLgI9
	V7LIFO+Q=; b=pPh9xN3T1xK3otRbpft1PFc/2Bzr/8mylX1RawIdIeu3hJLfgb0
	jdvaKcvVTj8u5NPfhU1IiJoEKzEjqFzgsF91fnBjmHQzzWj3AJ/eT1w2x1BB7YNy
	6g3ceKhhl5EvSGtnHc48Oz4Ad9fCW408pshMvdYBxP6bjxqo3pzCWnXqPrMxtPoF
	rCYXk7kiO+26pck+FDPalI6ItLLQcayRSqVOtml+9FxhtQYqLgW3nOA2wFJiSj/9
	Fmbp5oUWZlwqRLRpogaOIDFRg2KJ0zST3kL7Mvmao9JjTPJNYV7MjOmyB+Tq2qAR
	mPoINexeP9nPZxcbYgbz8DrJjd8SOU+0mKA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hwt96drd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:28:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-742229c8d8eso5597459b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 21:28:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747110510; x=1747715310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/B9yr710kPUz2FCgJIjP6BTbuVzSWyCLgI9V7LIFO+Q=;
        b=Jz1FpUtZZnVffGNDRLN9dACcgpmo1acQ/nYrO6hjd6MbjnM3yN56zne1GY9lmFNBH6
         K3WNGjS0iKL6EjzXNfUa/VxxO2saewC9tsi1sAO/Al8OH8hzjjvWSCbL15awQGG6T4Ax
         3Dmea8DyWFHVN1q7nLhE6elvMkodtqxNFhmhDSR/xKw4j1brSvYWMTQSslkad5vRmg0g
         p6t5/kAX3KWiWukKyT41P0aHmK5RfIBtrlE3qzt87CidnUNPCNOKM1xopcE9r/Ezjada
         PF0geIGkthwzMouVq8953ZgEzcrE6RvlOEM5EwRMYvOOD8DQ9Q/7XWJ1MQX7csJ+BcEF
         PqKg==
X-Forwarded-Encrypted: i=1; AJvYcCX5QjX7qfCzeUI62TDgNLd5RYlkNEqmuh22BHNvXfci/ZTQo4c1T7MHlZJ+Iu48WuDTsd44KMEPzOfIZsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIPPQHJe8IRZZ1LRVj4mehuTHXgQMabngCta+NTV4lQ8yHLl8G
	k35FPW3fKTp96D65iM1uJsFw/iyB7ZH3KPv0VM+lSXOr/5mIbOPUfvXo/FrVBaKoSd20x9YqfRM
	ucUjl1gO7HyvD2buAiw/UxByIxuj/TUshXmpVu3J/E/9o3ME9ryhXfUBgUjyJOnitf1OQqic=
X-Gm-Gg: ASbGncsqKxPlDrSJJ7wvUOTzZN24w8mMgve9SqYfywY3Stfb2OBkSo7yESZaMMHP0dq
	XDIw5twKoINswZmlYqvrEQwJUyxGx3CTw5FDYU8r5rH+cK6Ob9xzYeD//6H1aefg3hcoomPfffu
	aNX8hQ3nKd4gSxuMfQa5gnlY9pU3Am3AwXKVwHOgKDj9VzH/tPrgx3A+jPX/LYUB+scO24SYEks
	Jee1utkFSy+3XuBs09/n0E4egQyAqlDErko4AbLyGEHRYCkhgskVMYsVr8qmwmZkIgCgIYTPoa7
	S8ygcpeQP1UiPB7QAJaWf9ncfiSfLUTvHgPbEWYhYGEL
X-Received: by 2002:a05:6a00:a13:b0:736:35d4:f03f with SMTP id d2e1a72fcca58-7423bbeb32dmr19989914b3a.6.1747110509816;
        Mon, 12 May 2025 21:28:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE70Gr+yrpOtCcR7nL5udcSWL2S3FfHHIHR6OnyBoeHKME3UXPIKKmiDUQAqePTdJkn/YoF9A==
X-Received: by 2002:a05:6a00:a13:b0:736:35d4:f03f with SMTP id d2e1a72fcca58-7423bbeb32dmr19989890b3a.6.1747110509398;
        Mon, 12 May 2025 21:28:29 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234ad3e9f1sm5486101a12.35.2025.05.12.21.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 21:28:28 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: [PATCH v1 0/5] misc: fastrpc: Add missing bug fixes
Date: Tue, 13 May 2025 09:58:20 +0530
Message-Id: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDAzOSBTYWx0ZWRfXwi+/kxxrv9dc
 +xNYCaDa5B6JQnO3S09KmRZ68w5AozUo5lM0i+LO5zodJX6H38NdapFNmf0aLPLChpfLJbjybtO
 22vrGChrTfAKjQFC24e3vtNtEu8I0//tGSZCcIbeISZBLJ/YR4EqknWMgpw8A5P34EbXXKnlfJw
 Obxl0I6x5DYsg3hZvmd7lslus2VNsgUc3+2vgUfW4xLwm5y1+KBXd/Al3wZVkeBO6q8PXgP6qt4
 ChKBq+R9suubMdQRuedmnA4CQ3/dy1njfBDsiMqmRlyymv9kg5lqcKcQma0/dTPCUGOaANyKHuv
 ikjc7iLn9wLMCZUsz82JrGdSoCG6BClawUGR2Qr291SFLjh3NNjNSBaRFtoSs1o2pZrlf1jx7b8
 Q0/gTlu5MMTzvHetlnYT8+NhdnH4FCCLMnEFkS1kZAz504eIsCyT8VF4nOWkBDRRAtk3Ut4h
X-Proofpoint-ORIG-GUID: Q6a91-lqDvEazuWBv4RtR111gf6JygfG
X-Proofpoint-GUID: Q6a91-lqDvEazuWBv4RtR111gf6JygfG
X-Authority-Analysis: v=2.4 cv=a58w9VSF c=1 sm=1 tr=0 ts=6822ca6f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=3nwid1PSdH_ZJRXHEEwA:9 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=687 malwarescore=0
 clxscore=1015 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130039

Add missing bug fixes in memory areas. This patch series carries
following fixes:
- Add proper checks to fastrpc_buf_free to avoid potential issues.
- Add multiple fixes for remote heap which is used by Audio PD.

Ekansh Gupta (5):
  misc: fastrpc: Add NULL check to fastrpc_buf_free to prevent crash
  misc: fastrpc: Move all remote heap allocations to a new list
  misc: fastrpc: Fix initial memory allocation for Audio PD memory pool
  misc: fastrpc: Remove buffer from list prior to unmap operation
  misc: fastrpc: Add missing unmapping user-requested remote heap

 drivers/misc/fastrpc.c | 182 +++++++++++++++++++++++++++++++++--------
 1 file changed, 146 insertions(+), 36 deletions(-)

-- 
2.34.1

