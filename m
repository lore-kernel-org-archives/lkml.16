Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12460221721
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 21:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744062845; cv=none; b=DTj7Yq0xrcV9bm2cg/AZ9zTCOesFndmTFssNO8VwXQ/KGgFK2dG5I5MEUL4fUBvO+atYrn/aLUx+W0Gu8aXbzG0FyJTJhx5pOJtAsqD2YInEvrNxGBAsREBJEXE5HdTKTxU7AdCfjaSigE+6y2Y471FKsNyOvbujEWTqvtRxQdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744062845; c=relaxed/simple;
	bh=CxAlPAdfHF9SCdrgxSt6LTMGsRjEdqf+DPORV3qKOIs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LwbO8whrQ6mXr9im0cYy6wUkXUA2R+qdYFba45r471X0qD+Qih/ukac5jHFgZPRY6w0XAIioCr2sI55R/GAsB2QDcH5WBuPSmkKxaTepfwZmIp3Mm/3pVrDMFN9D1OX/ZXKMDdL+uHKjFjV//Qfzo6NnTJZ0xWd7KyHzfaRZpn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G872PjGg; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G872PjGg"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-47686580529so51872201cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 14:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744062843; x=1744667643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=niPceQCTeHJ7vtDpns+YHZrKH87gdGexFeeW8Ejww9Q=;
        b=G872PjGgFsUdUMJNb/zbSMb5A33exJmCdNy9UHjNx0T2/R24lBRJfq8gvatCiF8eNd
         C17lySGmQcE155yA0Epq7xHWmnVjMVmRGQlfh1XneOxqXfvETXOQKYfJ7kt5NhDouo0B
         3cbeO/X5zDcjF8YafHJx6kPk2KauNHZb3sJ7YiNXdShCLQGLB6uMvQsBrCXzZ+fOZlQk
         t0xdtsrostrk+gcj+iNon/IZIwpa36Eutv/fDbludUvo1FjJhEmhCIzf496xi2m7mExI
         5re7dsqXdpDaxE1u5LhKhPu6pztMCkNPHwCIeRMUwYGLDnVwBouC1WPh6NwkTmW/s8sS
         6gbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744062843; x=1744667643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=niPceQCTeHJ7vtDpns+YHZrKH87gdGexFeeW8Ejww9Q=;
        b=pwUpBmCZYfTJGQl9KsrM7+3I4aa37llVfhntRI4HdsgPlDZtKvTN5YlEIA+sM9uQug
         N8CUAb5Iy4qCLE/qawGVe+Ty2D1K4WndMgLUNbT/hJdKOOvwE9mgb5kSDXLLoHguGuRn
         0H7aPHaNO8iG8xyVLVGXl3kWmD4Xvwnc/WgArmIKpX8f+w5vpIZcHRLnWLv+G6JBJEW2
         k2QwpeCXr0DeNlY+QAGz2ENGL5oV9VybsYzfFA7Dr3HO7vzbE0mwkJiRrRHj3oCj1S18
         TUFCU8COl0Ks3xBrHuGADE4cTm5UQIXbRg03pe8PU8ZVbdjH5cK+4a+gi7OAH2nOtAsT
         x/ng==
X-Forwarded-Encrypted: i=1; AJvYcCVjM0x3V2PDFihd9JoYImch/T6IIYD64EMeJ4BQeMBsvXG73XmbWoHnONwpF37d2H8vZQwLLlZMSR98t7I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0tQvn6ax0GpO+BziWTyfxNZhuJ8bOqLUGaepPr8Klpb0xOU5u
	O0M87nIzonS1RyxT3YjIiSceUC/u1LGB1Ga2AQe2qAaspGbLfoio
X-Gm-Gg: ASbGncvLOor0Stl+XzmM3cRoL4dozIaF2ZWRoe53HSr2+WbPjZVbSSq4e6DDKk4MNys
	ZSU/DQDLHiPMa22MAb9RVioX8bAhDbdJpbPUaOioJx/r6ytDve7yYiF0WHQQ7hdzqWZCvTci/v0
	bwVr+CFR7KTttWzZvjmQi0l+919jXrdWqR0xkjOw+ScbSaOJlL4tXm1CoVGnd8AyePTk/sgYlbO
	yZ0GpmQsC7RkXWIlKqwlnotvTghjrbaZhv044zJAebWnwvCWLwfSAUJENdK8GBV9awA7T7U1JIM
	kyHgqWQBJgzqZKVK50Pt8JZgISx7biqqQ7tTRqc1IAF4UKuBR+B2gWbtZrn9
X-Google-Smtp-Source: AGHT+IEuC+ZszV61UGBGwxDndYGW/DtNDNbYQiTlO6xLG1075WS4o+qrZdIPFvWNlxEsXkm+ImPymg==
X-Received: by 2002:ac8:7d95:0:b0:476:ae71:eabe with SMTP id d75a77b69052e-47925a777c8mr255279851cf.50.1744062842955;
        Mon, 07 Apr 2025 14:54:02 -0700 (PDT)
Received: from ubuntu ([105.112.230.142])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4791b07226fsm65766491cf.31.2025.04.07.14.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 14:54:02 -0700 (PDT)
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
Subject: [PATCH v6 1/2] staging: rtl8723bs: Add white spaces around binary operators
Date: Mon,  7 Apr 2025 21:53:51 +0000
Message-Id: <4ccdbfd3e8d74d99679927f294f71cfb694fcc6c.1744061673.git.abrahamadekunle50@gmail.com>
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

The code contains no spaces around binary operators making it
hard to read. This also doesn't adhere to Linux kernel coding
style.

Add white spaces around the binary operators to increase readability
and endure adherence to Linux kernel coding styles.

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 297c93d65315..c41de6fd897b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -963,11 +963,11 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 					if (SN_LESS(pattrib->seqnum, tx_seq)) {
 						pattrib->ampdu_en = false;/* AGG BK */
 					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq + 1) & 0xfff;
 
 						pattrib->ampdu_en = true;/* AGG EN */
 					} else {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum + 1) & 0xfff;
 						pattrib->ampdu_en = true;/* AGG EN */
 					}
 				}
-- 
2.34.1

