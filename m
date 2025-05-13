Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1C31E2823
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747110517; cv=none; b=Ro5r07sWbajDRP/Q2k3wA9zU+YohAvgn/YGGhBady+4STL0T7hCq8SyVohRweXGJN/3nCmRKFv71gMt4lkdo+bJJwschZaB93U40O1oDK2BG8Psk/VHAMSuLWD4xGvaOddzSDcR6eQqIIu4fY1jDEBlbRqTTndALg1VNkQCMBJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747110517; c=relaxed/simple;
	bh=lVZ470qAXY14EXPU6lTKjuSsb5rLHlyTi7oAECx0L/g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ahbcvFyIOfLM5AhxvZ/le8mhP7fRYb+AMwmpsMI8n2ObaI761tU58+ILxAHrzYllQDeLAbrDEkxDdmYUxjDsSnIqZ6wBvCrOy84XkBkg266NmFsvcd3fsXifNJp83ft47ppSllGul239FG94zKpOWO3BTpZTqIMUPeHQcijCar0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fyERwcWy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fyERwcWy"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CJY29Y013136
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0Wt0GbBUNwU
	U3CBX0BKb99qSKLR+tWyMkIzj1AQsy0Q=; b=fyERwcWyxHKMuCu8oqpW3wonN4B
	9+mQ1tI14fOldzaUEmrqzTsn2qabSdnVCBtrNDL39guRPjh1A4ITtTgUgAL+ABwP
	PgqyOhaIFsUqtGfXYti67R7U2TE6vQBxD6sG7Yio7cia/sdM1OeHggJUflYeTSWx
	1h137inJP4oTVAolZ/yI29NrKreEXO5iXeQ4r+KIbPnDrzdhwGCh4u1SS6M/u+Cs
	q1GGJxfILQMmWFjzcKDmU3GQvEEQH7SkP6JCAvJg2xzJPA0HiuhgVdzB1pcTdnmV
	yWXZPup/XU5iMQWnqocsOQiDBVF0HuW7qF9GQODGv3JK65sIjllO8OuefNQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hx4k6e3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:28:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b26a7303e15so1011585a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 21:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747110513; x=1747715313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Wt0GbBUNwUU3CBX0BKb99qSKLR+tWyMkIzj1AQsy0Q=;
        b=LWDY5ix+B75Z2pD33OOmX2yEPap0z3KEuAUkcRZbDtfNXAFKU7VoeEUy+guwpUJaG3
         pSiRAFiBXBtdFCMeH2JyUpHEG/aZPkCcncYvEAaCRkJikpwV/qvZ0xjw/j+My3WTwl09
         1sL+uTK4iL1Ig7z/BzwJG3PNAinmmd7t+DaXxrmNAXeOML4/GBDhR1U5ARA3J2IDx6f/
         IfNEmwUH/SxgKKOBEYWyxtv60b3IoorK4DkpYIsFUS7h+1Qhnh0cIDFYnK4Ks5eZBuCj
         wws1HT0E1Nj7CuzTElFCrE7swbKZKHz6nUYJJYBtkkKWF/6aEuTv8TqMQHaYICuFey9+
         hByw==
X-Forwarded-Encrypted: i=1; AJvYcCWQNAu25oGpKYH6XLz+lvUB73NBj6gm9xswUNU3rs+aWvKDh5u2tqfXEx5uIYxVuOoz+OvmCqP5gJDDxHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvshQG/VNsoQLvjC/xyuyWuPo8MQaUOL7pYIApQkf2Ey61YSlv
	D/3mealM0GjlG+8ZjyAVe6TASZvFdmQOQxo9V3pZR2YsG4R7jlFtTB4N0YcsYV6iukVMGKQDJnm
	zUr9HvPlLSL7FqQxkI/pyPAkSLpgBAv01WaVT8S1VMfJo6Qu3A1QK1N5j4BnNjMc=
X-Gm-Gg: ASbGncvGzD2wkdxHLRsfEAYbpK7bEw2hNGDuPnkYwVQ4qYI+P0ArOoph6m5masMd2KK
	/sEsRg74XcCxRP48c6adod7kQthYh54UMgenQ4uQyif2fr0JhjaLs0xHkHUIqwvJFvExW6QLwfA
	r9h1AaVY7Kh+2Czc9hh5GmpDxcO/GRCBrdZKO9uaxH2z7WLHy5gaKsk7zIBEaJhpxuC72K6t4G5
	0Q76vmCD3XnG8gl9UJrDHoSYrkQpzFGK4riIllDPSKGSmnmVtJfhUzIYkVaBJfkAfuzfUKo5eLR
	3+r6LKTyYo8c+cCkwAJ4ArTEvEE45LWsoNFjnR7j9q2u
X-Received: by 2002:a05:6a21:648c:b0:201:8a13:f392 with SMTP id adf61e73a8af0-215abb3a036mr22831423637.20.1747110513041;
        Mon, 12 May 2025 21:28:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtAZDS57gaeo6+l2GKtDyxXJDhvCrMInic2QuKuXWsVSU5v5nDoqK57ZyLXWaJ0MLUYJUb+w==
X-Received: by 2002:a05:6a21:648c:b0:201:8a13:f392 with SMTP id adf61e73a8af0-215abb3a036mr22831397637.20.1747110512674;
        Mon, 12 May 2025 21:28:32 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234ad3e9f1sm5486101a12.35.2025.05.12.21.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 21:28:32 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: [PATCH v1 1/5] misc: fastrpc: Add NULL check to fastrpc_buf_free to prevent crash
Date: Tue, 13 May 2025 09:58:21 +0530
Message-Id: <20250513042825.2147985-2-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ReqQC0tv c=1 sm=1 tr=0 ts=6822ca72 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=y_gjuFtE12-Q3iuIhokA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: lE8HjN8rtn60k00DH4CKbZFwAErzRvJ8
X-Proofpoint-ORIG-GUID: lE8HjN8rtn60k00DH4CKbZFwAErzRvJ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDAzOSBTYWx0ZWRfX0q0x+poeYAMh
 kISeojFP3ulOrScp5q+iSjSu5dl/CzqAOrZmHoQ4j9Mr37BoFeVGaSDrYUxtC7f08Tz/xCvgDys
 jnPxeHz2xYLapz0d6vxBRrfWO3LuuUrxI2U+s2WxU7CjVaRhlnXW0uFs/5IFH6342NrS+9Vg3xt
 mZ+vshS7435NFGaCXAeC95/pBTvBNRMO5UxNqz+jqDRqP+Hs/SRnwDbd7Ul3kyvJyJ+M+hyLGIZ
 ozha/pciKKS4NSojECUF5F1rgfnapfGTsuq4iGVSRyNl1oPcou8a+uyKAnYZGkPBFHasf8UpRoX
 u5Av6hlCa2SQqUWi+CU391NuwDfcYHmxrFsXhKlWIGQXSruxMHeOu+VLBzVBEQDggU05UHDtx4K
 +8O2BRPrHx0K4xZc8dHS3uWoP3jXM/qY2bmPWew+V4dJnDirlhQ8DdGTZAIRv/rcss7IqY7x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130039

The fastrpc_buf_free function currently does not handle the case where
the input buffer pointer (buf) is NULL. This can lead to a null pointer
dereference, causing a crash or undefined behavior when the function
attempts to access members of the buf structure. Add a NULL check to
ensure safe handling of NULL pointers and prevent potential crashes.

Fixes: c68cfb718c8f9 ("misc: fastrpc: Add support for context Invoke method")
Cc: stable@kernel.org
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 7b7a22c91fe4..ca3721365ddc 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -394,6 +394,9 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
 
 static void fastrpc_buf_free(struct fastrpc_buf *buf)
 {
+	if (!buf)
+		return;
+
 	dma_free_coherent(buf->dev, buf->size, buf->virt,
 			  FASTRPC_PHYS(buf->phys));
 	kfree(buf);
-- 
2.34.1

