Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354E52248A1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 21:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744062849; cv=none; b=uFi8eWGpmzgI59+qTL0LypOnphIDfmn2qD6oSxI+u8EiCi9VPVnx2tYRVxcI//pDi4cGcvxOCN5iN0kOsrPO2z/F+tfN9CJSoXmXCggwcGhPrj7HbU6kU+STMC90d/kfQv9R/cxz+N5QpclZ2vfZSFSV0H+XvmwrGNCywe1k1/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744062849; c=relaxed/simple;
	bh=CuJKw85sIB3jPSdbWSjXk7Qh+Qwq6YcyZNhPTQyMLLM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FLF3mKVk6DuQiw9eNCfrsM8bPKOpsXhuoZynGgf9mjB3VRqOCPlp7UhEKIudcahBbthswVLPipsxwnjcI1kkUnfzwenJuz07Vv0MHwM9TSA0SZaFHbv1a2GrXwvn5uv8zE9fJm3kDhBknKyuvBD8ENLbI8ZVZOgflF9iojgvm8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJnu2L6j; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJnu2L6j"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-476964b2c1dso82783011cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 14:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744062847; x=1744667647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6ANoDKw55NxNKPjSEdHj3uuN+vlytdVKuNoT+dKd5I=;
        b=CJnu2L6jXiUvzCH4N+EdCKY/21kg5xc4/iezzM4KvoHOk3TKN8ntU0ti0V04Kk7DT3
         gqBqwmChEkVa+KYRvs26r4jPjrnRu6Neav72+OENG9bgrccLzF382EgEgufxQ7nKqwgZ
         MuEWXYTwfAG+Vi4ESAzf/auhoYAW/Rqc0DHkJlGRv2Z6fJvwlXZUjK3fS862nzCrj0uq
         BkwIqnY7OtT32aH7YTZ+lEBnTDdAzQU6rVNziremHF1xH/A4Vdi+Qyf3CkmBEDYldvak
         2tczqVxfokjw+yIthzpDenotzkSxDni1osZAOipjbcKD2ciLL/YRQv28b6Bq7eATZBlo
         3qNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744062847; x=1744667647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6ANoDKw55NxNKPjSEdHj3uuN+vlytdVKuNoT+dKd5I=;
        b=EpddBfJpYIFGiLaYAi6FAJfBQLA0X62BvLr/CfxszsDXT+eqS3AQNF8bAIimP0D4Ha
         fYTHZV/xhcrIR1HeEtw3UQhOt60Aq0cvt/YV7uwMb5yAmuJFwaqKlBGeiyJ6nZ796xC5
         mwave+bJ/4DlyZ5NZ9YE3T0klj65X3osVR3+oCwPvYKuMMGjz1UkOHIjevzDkMh2+xQ0
         YZRceq4qv81CofooHi49dmeAQ6mk6EPOZdfdCDrp8e3r7MrDD+Y8xFAlRXwZn4WBRk5H
         ho+38f6weS9+z9OTTpUs5VqA9GUzXEX6mvGxLr1PsUqopGhoWPSil31XicKv3zvxgshf
         Z8BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl2JFmQx1PGA5N6yXRXI2+OKRu90PBkZzNOkAB6KZ4uXMURVQlNpiKQojYgSiejLXFvMVpiawVI6OoYus=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLf2ip+7oGzx05vFrzFFMLDxbOHNS7MyRErJhA6EexNjfzIabe
	5o6yGxjXU6nz/y8I9INw69EIedbDy3RKNspqKCV2oyhLFNiLM1C4
X-Gm-Gg: ASbGncsVEN6Lhj0HFIDbnXBNxWlCBx/1n/xC8AfcdkhHPYaDKYmB/2L61r1HZ68PiNb
	HSfe8ps4UMH1ElnuR682ViQQD6I17YMsCnx/j7G1uYdy579wY9OpHSONwq4HR6y3yM8YKPYF6+4
	/Dr0Baf7AGX83GVEvBpWZyhRpVyYBfHOuJWyMhH345kC6Tksmzk7IhnZ6ZA1vL/SimliAAS2/jt
	vE0Q4lQ61lMGnH54Yx3d+wWPABzmdLpLowEE6avmuOgc+Ujz4tIldzMeJ2ZeQ636ZsHnkYwvxhq
	Da0L2mnn6lLeKILOcS7ULCnWIYFffJuvN1rbOs8nxcb4221ZEw==
X-Google-Smtp-Source: AGHT+IE7nyMXX+Xy8qvkiPVmR1l3wABcE2UMSA+MmU+jMLfuz9D+8aIpGyTv5KwqVT0MdKmwqr6lDQ==
X-Received: by 2002:a05:622a:120d:b0:477:5c21:2e1e with SMTP id d75a77b69052e-479249040b7mr237768121cf.5.1744062847071;
        Mon, 07 Apr 2025 14:54:07 -0700 (PDT)
Received: from ubuntu ([105.112.230.142])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4791b088346sm67375671cf.41.2025.04.07.14.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 14:54:06 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	gregkh@linuxfoundation.org,
	julia.lawall@inria.fr
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	andy@kernel.org,
	dan.carpenter@linaro.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v6 2/2] staging: rtl8723bs: Use % 4096u instead of & 0xfff
Date: Mon,  7 Apr 2025 21:53:52 +0000
Message-Id: <27ff98a2d721a19cb09ea5c0d39c7d1616f8a629.1744061673.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1744061673.git.abrahamadekunle50@gmail.com>
References: <cover.1744061673.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sequence number is constrained to a range of [0, 4095], which
is a total of 4096 values. The bitmask operation using `& 0xfff` is
used to perform this wrap-around. While this is functionally correct,
it obscures the intended semantic of a 4096-based wrap.

Using a modulo operation `% 4096u` makes the wrap-around logic
explicit and easier to understand. It clearly signals that the
sequence number cycles through a range of 4096 values.
It also makes the code robust against potential changes of the 4096
upper limit, especially when it becomes a non power of 2 value while
the AND(&) works solely for power of 2 values.

The use of `% 4096u` also guarantees that the modulo operation is
performed with unsigned arithmetic, preventing potential issues with
the signed types.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index c41de6fd897b..5cfb6d1e9dae 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -943,7 +943,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			if (psta) {
 				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
-				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
+				psta->sta_xmitpriv.txseq_tid[pattrib->priority] %= 4096u;
 				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
 
 				SetSeqNum(hdr, pattrib->seqnum);
@@ -963,11 +963,11 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 					if (SN_LESS(pattrib->seqnum, tx_seq)) {
 						pattrib->ampdu_en = false;/* AGG BK */
 					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq + 1) & 0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq + 1) % 4096u;
 
 						pattrib->ampdu_en = true;/* AGG EN */
 					} else {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum + 1) & 0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum + 1) % 4096u;
 						pattrib->ampdu_en = true;/* AGG EN */
 					}
 				}
-- 
2.34.1

