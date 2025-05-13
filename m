Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DBE1E51E1
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747110524; cv=none; b=GIBnjpYHYJVIq6+rsoFTCmfEDMygkwhQ40zbG/pKrwxkLRtKeSgqcY/H2N3l2xzgo76uMFrkFirNPpc9yhHaKV1NPf908MXQPSF9xGmFb8a+9byf/+siczPw3zNIiuKJ7PmJKLBdkvq84lLvmKWtSHO+Ipc6McjuMTr6hAk/B0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747110524; c=relaxed/simple;
	bh=ZqxErHXIh7dPrWcetdQxxPBTtJ2e+XLBRN9zKxPHcDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CNUF0IEXn5hmypc7YLgFdq+kaZiWvuV6hUjmdrECdL0KjIDgilIxF02OcQvrKyK870M+n8LGQnG7QgX7U5duTasSiIPRg41xR7Ki5iZjijuSS20HVzYr7wGRf8OG8srSsVaR2Bpp/yH1aqDqKUUoy6++R04/iQUPmFt6H80AK3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eBy3rIC2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eBy3rIC2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CHYRou024078
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=80VSBrnaMRJ
	WWQG6HQKfwi1RurptGFsnclEszCS2EMo=; b=eBy3rIC2NAX96Zdk7fuJsOzUt85
	6ifwrIy5+rpygd58PYr8tVmvWfS+Cpto09Uu/Sa1OU0/7jmYM1pcq5wkupMT+m5r
	Mh9aVUVXLCqTvmM8k+IVIDE1m6IUqhf9PTw8mwsihps3kPnlMrNOvp1mauVIPkYx
	JlLFxJaYTb0GWnVc9vpOak5iCMQtb7Ldkg9HV8ctBlFqfkZ3Z7a/i8vf9uxhqnso
	6L3AGbHGk+lmwHU+nqNwsqKkgccFH1XnUUsh1ZEg1RrAOmuROOZQX5rfcADN7t70
	XMiF6GDxx6KPYMoos1wLT8y1Kw8MznrGSxTmwOWP7U9YAHn8jS7ePRCqWsA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46kdsp2m9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:28:40 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b23d12e14bdso3954959a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 21:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747110519; x=1747715319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80VSBrnaMRJWWQG6HQKfwi1RurptGFsnclEszCS2EMo=;
        b=I2O06AJeKHNib7yDVv9GwbSRg+xLZZYyVZ+bVPohtO99lLkZWCAUidKx9g60jD/FUq
         bS3n9s6zDSMATq5oFkwHfbv9lejVhM8HtahD2BFAX2mkc4fsdBug9Pl9+i4k701XhYF3
         mUVJzhV5gYb5gMvhF9QDFxAYqeoV2an2cu1KiqVQSPyPfTgCgWz/wA12Q+Qp4KBqikWy
         kGB3UuGrx38DgvQpFCKTod71oBh/aGUsFDE72VZkKBP2NF2fVxVlC2BZfM+2uo7XP1V4
         SxobkMiVXJOTC3i0EcKYLQY/VIf99r+NQhmySSEmkdowtHbSPsaLORR7m4bm8oc9YQiM
         NUMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCQ94oPo7Xv71YvnTYc3PTG0KtYgoqSAKbkGPDeZ+aRg4A98+qMNbuedHflAEzgf2tCBDnYdzPIVQsLdU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4ngjKTf6SZc0mp0h6mGctVhVBG14YeLc2df0IgVZfZMkCpfc3
	CxVUhqRj4ObbvQ0fxznXzZbfqbctVZn4DXYKMlzhegaC5C6fi2Nc4fpWLo1/SQy9TdLCACc8bdh
	DlQuJL5yufEZbXhs4bH0L73dJI3/OR7xNdq157zPJawb69vW++HhiJRyyrkfgYK0=
X-Gm-Gg: ASbGncvPf3RvrYGxs1JV39IjprUyUWNJF3mYpfq9wvIRQ1aat1FMtBgOXDsWjKX4KkS
	ainYDnyeclepWjz9z0zBEEEzv6z11KSihP7VScSxDUat86MX0LWXO3FQ2blKRVwmlfuDuwbL1BN
	T+CnLxgVmVcgD5KGGhFuJsQaUQLXoiei+OJP61L/F2AOpPWNlVMIIsaLHHEA+PS+EIETgP9B1t4
	kZzMLMmrfLv8halDjS7erD/kIlt+9V9x7WxAQctm6c6GZAKSlWgVa0oz1hqwaobST7+112xj+in
	yKzIUlajhBfm1nLtnWINZUdP7BX318plgeizDDCHwn3S
X-Received: by 2002:a05:6a21:458b:b0:1f5:70d8:6a98 with SMTP id adf61e73a8af0-215ab883667mr25224173637.0.1747110519624;
        Mon, 12 May 2025 21:28:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkhTKa1aIjIDArtHetshGQTFyREicJBCEr0fG8qbpWn0Htg+JAbubSWvVsCfvyg9O9E3J4Ww==
X-Received: by 2002:a05:6a21:458b:b0:1f5:70d8:6a98 with SMTP id adf61e73a8af0-215ab883667mr25224141637.0.1747110519205;
        Mon, 12 May 2025 21:28:39 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234ad3e9f1sm5486101a12.35.2025.05.12.21.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 21:28:38 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: [PATCH v1 3/5] misc: fastrpc: Fix initial memory allocation for Audio PD memory pool
Date: Tue, 13 May 2025 09:58:23 +0530
Message-Id: <20250513042825.2147985-4-ekansh.gupta@oss.qualcomm.com>
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
X-Proofpoint-GUID: 8VroCzUNP1mtEMCcZZx4_0kXvrdKOyje
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDAzOCBTYWx0ZWRfX59N48Tem3Yvk
 pxyQJOhgNKrd5USYAjjY8KyDEYAG8xB7/GSmY/JHZbOhQNS+aSpppX+f9sROw9u+eR2n/p6942/
 Lzu6TO17oUucbxUiQF7RFDi3A9s/7DTkkB0rJ4GnUrKl0DhQudrc9+0zn3oCxCsVaxNYxZacMbm
 Uy0rhSPDCNrp/EJHftWH6LEvSuMzJA45PQhyYQiKGgU6pTeLzbsjj8uMbkKQ2voNHOI9c4G7QeX
 kZkU+a0Hckimi4D2wr7RNZ1KNuz47mIqJhFROjMMabmTS+q4QxDUGt8SS1EuA/xKR1Yn1JpGImH
 mRK7K3hB4uqq/qhRpKyQerryGzl0SQZgx/WaZb7+tCHZOoAl3LN1JpfY6Uxt77108umDU7zcNuC
 YeuZRFVLBTUBab3V//1ex6xoHE8G5Opyziw7uykEUADB8eOLMf4okaGjHTDxdLDnAugGihD1
X-Authority-Analysis: v=2.4 cv=TrfmhCXh c=1 sm=1 tr=0 ts=6822ca78 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=l_23c2mIThvE2ntJpuUA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 8VroCzUNP1mtEMCcZZx4_0kXvrdKOyje
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130038

The initially allocated memory is not properly included in the pool,
leading to potential issues with memory management. Set the number
of pages to one to ensure that the initially allocated memory is
correctly added to the Audio PD memory pool.

Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
Cc: stable@kernel.org
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d4e38b5e5e6c..b629e24f00bc 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1311,6 +1311,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 		goto err;
 	}
 
+	inbuf.client_id = fl->client_id;
+	inbuf.namelen = init.namelen;
+	inbuf.pageslen = 0;
 	if (!fl->cctx->audio_init_mem) {
 		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
 						&buf);
@@ -1335,12 +1338,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
 			list_add_tail(&buf->node, &fl->cctx->rhmaps);
 			spin_unlock_irqrestore(&fl->cctx->lock, flags);
 			fl->cctx->audio_init_mem = true;
+			inbuf.pageslen = 1;
 		}
 	}
 
-	inbuf.client_id = fl->client_id;
-	inbuf.namelen = init.namelen;
-	inbuf.pageslen = 0;
 	fl->pd = USER_PD;
 
 	args[0].ptr = (u64)(uintptr_t)&inbuf;
-- 
2.34.1

