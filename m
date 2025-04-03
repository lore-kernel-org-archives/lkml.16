Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5FD24BD02
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 11:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743678497; cv=none; b=Gsxzq1k9D7ss98fUn+cq1W3v9r+cUhQu87yVzluAnbvVZEDlG9163FkgbmJJFtiZCh+DAEhvxyKUB/SVRE86y6QC03XBX9QxltvLlHN6AJwXxYm2f4j3XU2OXDXOxGHbhLI5MoMgGN0UvTPfYYm5dcMm9aiGS78ft6NsBrdroWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743678497; c=relaxed/simple;
	bh=+INaQNpJ3+McLmQ2WaEXeW+09PVVAxkscQ51hTKfPaA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FO2SpZZBnMtJc6T36bjd8xn2czqrYlMvWk1LULGuf4MH9lS2zichooeUlGskCl273K2saNAvZefp5ZqDc6KJRUbMw8rCFnGvm1wMpmZzr5SebS67XKY16Fb58j4wbOY6OkaUtMNwzl2cz2Ud0HX3t4uiaCg4TdBqjRrWT8aYu70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QDt7TI6y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QDt7TI6y"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5339rx1o000546
	for <linux-kernel@vger.kernel.org>; Thu, 3 Apr 2025 11:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/5UjTdO9fQkm/+gRvN0hBPemroKS9w9Zn/s
	PI47gMYM=; b=QDt7TI6yRLQBzZRK01NIWc49GFgRsc1WP712ZM6eXq54BseGlVS
	mYszHzE4fUeaHdleaK/tui8xq0EoLXwaF03i1Sin+Oh3ZAeuF0rjybl0cu1lbuKh
	M6Q6QnDIFN5PPkxNxwNEshU5OEr9a6MMsWCbBOWMc0cN/AzhEJIH0txR/mrlkd+j
	uBrRS25HP3efjZdHkD69NgYAirKQfcnq1OnrlvmurTA9fA+b4BUTe4wUSnOnJhIw
	2j/X9VxoEbwsqaSUsIrmyBWcDmFSgOnMTw5hcBnsPLkbuU2KIlyQ0ddLg9k1N7NB
	tEpxw7wIyKb0amMsmEb2VR0GD4sRKLlc2MQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45s36a3e9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 11:08:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff5296726fso1276721a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 04:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743678492; x=1744283292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/5UjTdO9fQkm/+gRvN0hBPemroKS9w9Zn/sPI47gMYM=;
        b=r/5qEJNiVASi6A3WumP3zsmfDJPPxhP0qw5nPowh4jWxcLmU7uAswULltqsAREKoAi
         44nHiRTqegqPIff8OmixQqWpVAaV2amX8jS1iS4fvaSMimQvW/i/eY4jx+Ph/tGqbn4d
         Opk3Zpn5D8EThr/QIHJdArlTgt9YMmdAKGTeAGu+JcpUKatwwqtStAvx5a8BG4bSa6YB
         eR+hqKs5CYcPlNFAb2mPMZxsprUNNeaX7wM0XFZXohHimFpT8bMCR6ffB/yMdvkovvQI
         LUO9MCjgBL6LoLwibhtGed5K8Scxz3sB847vV4pCKtJNjzswVgCOxTohXttwT/fmsCHw
         etuw==
X-Forwarded-Encrypted: i=1; AJvYcCUUVOd+qDfBTmBJj0glErxur1LOJgYo3LfQoxr4ElU0TFU75jKKsmOXBIN/xrZZQIdnw/c+2HYTpwEOc7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxvdwFyxZPWdt0IC4imExSewBywjbnumdPGgrD6el7zKsUVwN8
	gxTDbwZcoL5NIJdCTzQ0Fj7Bu+Mbd7xOnWc+L6I39u010h54fEtq6kCRMIdAF7w+KcjRjGguA9x
	wpiQKQ/5KLGu7TqxMGEAcrVDXMf6TXAkxXTnUaLutaWKi2aYQyuLjPVCIu2ehZOU=
X-Gm-Gg: ASbGncuEeRjsyqATVJ9Ma8JaGnsqooZajR5tA83xcJaKu/L05XWg8Y2uO6Splebr71S
	ew5cdopTnXUW/4N8ht9y2aWl2oAdKgxeR4vBPZdyPGsfO1Lba9OVjA9hr2AMgNxQ+SGgRuHvm2y
	QYB6wV1XCNWQlo1Z2ZOA5wlNAqPP5hMOLHQxHIhlC/AbKI90Uv749kj9Nf26SxDc44+xDKihhKo
	LF/UaNUpRhy04QLmt8AtvELKqwKY0sAIgmEy/MtR8WQDIAYtQbeKuSx5SiPsQh5Q7raQdT2NnXl
	hJul5uozdMUX+ZayLGf7hiu/su4qyXMzs5gMboXyuD61
X-Received: by 2002:a17:90b:5408:b0:2fe:a614:5cf7 with SMTP id 98e67ed59e1d1-3056ee232b3mr8035837a91.3.1743678492064;
        Thu, 03 Apr 2025 04:08:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkhAXnYOwjvj+ZraBFfoXaC3tWp9r16uIiKUeutTaKxnDtMCGTZqKvlqYWH/h1XArkbkcsDA==
X-Received: by 2002:a17:90b:5408:b0:2fe:a614:5cf7 with SMTP id 98e67ed59e1d1-3056ee232b3mr8035814a91.3.1743678491686;
        Thu, 03 Apr 2025 04:08:11 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30588a3c3a8sm1185414a91.28.2025.04.03.04.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 04:08:11 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Kees Bakker <kees@ijzerbout.nl>,
        William McVicker <willmcvicker@google.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH v1 0/3] Fixes for USB3 CV Chapter 9.15 tests
Date: Thu,  3 Apr 2025 16:38:02 +0530
Message-Id: <20250403110805.865311-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W6M4VQWk c=1 sm=1 tr=0 ts=67ee6c1d cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17 a=XR8D0OoHHMoA:10 a=PWc0uLnFobKSz-olugQA:9 a=ZXulRonScM0A:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: DtAkdnNdbkHNH3aqxz6gmQX0YrNMSFxv
X-Proofpoint-GUID: DtAkdnNdbkHNH3aqxz6gmQX0YrNMSFxv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_04,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 mlxlogscore=870 mlxscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030043

While performing USB3 Command Verifier Chapter 9 tests, failures
were observed during 9.15 ("Function Remote Wakeup Enabled Test").
This is due to the following reasons,

1. Interfaces were incorrectly reporting as remote wakeup capable
   when host requested GET_STATUS.
2. Remote wakeup failures from DWC3 driver due to timeouts.

Address them through this series.

Prashanth K (3):
  usb: gadget: f_ecm: Add get_status callback
  usb: gadget: Use get_status callback to set remote wakeup capability
  usb: dwc3: gadget: Make gadget_wakeup asynchronous

 drivers/usb/dwc3/core.h             |  4 ++
 drivers/usb/dwc3/gadget.c           | 60 ++++++++++++-----------------
 drivers/usb/gadget/composite.c      | 12 ++----
 drivers/usb/gadget/function/f_ecm.c |  7 ++++
 4 files changed, 39 insertions(+), 44 deletions(-)

-- 
2.25.1

