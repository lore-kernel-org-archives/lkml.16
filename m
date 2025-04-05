Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F92366
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 00:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743811809; cv=none; b=eqG78YvJNqY47K8o7zlNtMw3AcrtbrZMKKe6KqEW0ZYnV5Nz8BchXAjZ1luKDlZHVWnEWftb0caDbZkQNhQJ2CtFNmMbTWXIvRX3PvpAqm/ugdREcKAFnY9j2ik7nKQwFoH+snaEZ+yDbql2bfl13BOkxPkCvwmQrhIDq07I0xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743811809; c=relaxed/simple;
	bh=pmmaRqN7rXALYQH83hlqR8An1ishV5jBJzRY+eC4NUE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cDoitd7CRlZNCcwkU22Kj4sfhRYppCW2286bqh7UF0OGmGcTZsIVh+POURHA+yEsBM0qVKaVv851NVBT4h/s5ohER0NalX6V0elwCwl0mxT0ULceQtEPff+nYRrFXVTSuN/XlgTsF51G0xFOxp/N38ARjkIQd4cTh7ZABE03O24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LPkvwtOh; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPkvwtOh"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e686d39ba2so4832807a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 17:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743811804; x=1744416604; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HEjVc9ejEgtKhgMciej+qKT5ntFRA2f8i3TphBlRWL4=;
        b=LPkvwtOhtJ6OMsgrCBUrwFSwy0/aorNJCzqZzz1ldY+ICTFRFccd2HlXJQNkBxm1ll
         RBv1bFZCbkB7kvZqrUDek/64Bz48gpKYldwhyCMBRyJvJlSg0vG+YNbJPl4v4BOyDdWA
         9VgEfCzd2sf8c16q7Ye04GKdxjQdDycJhYUjSZQ6Px9esnt0UJXW33LCc7C/fz0pC/P2
         5nI9ogu4wHjZ4vTMnYXFK+Lr7zJFLKlIN67xW0DUakaFxw+3Eayzmpv+6Q+6WzwXMbs3
         DUXr6LE73sLpliLuiycgXvoSV+jHMMaKf2uVQEOlFUtTwqUzkZAfVKZJzZEacMu+uQVP
         9YIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743811804; x=1744416604;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HEjVc9ejEgtKhgMciej+qKT5ntFRA2f8i3TphBlRWL4=;
        b=ktFmAx0AeApp2H/14uAprG6SFcodna6K871uzWV4yAWMoAkx4adcWAqzRE7L4E2eTZ
         dKSDlSVazfYD8YxOSeCq25zpvbCfzR9ngBeIU341rG35jNG9C7VCkr8pjR5mvGvcGzOY
         8haCbhNlGEYSy92AdwAueBg+C2rGfZqf5+l8ieK5d6uhZOYvC/qxET+snbj+UK56kFMK
         e6/w1pfPTPV7f9/zgKFqFs9RYcwjC+p1dlCU7MUMsP5KAPrsQ96wDlZcWxQ9OLX5oP1y
         ZPCt/IaJqFDljFFTkBmoaLAOcI68vntF7KJOiLjZUAPGl3Tqh5FIYoHOeLyhNhHJkhGo
         Ppsg==
X-Forwarded-Encrypted: i=1; AJvYcCU9GRU+/+hLTkl9OxwMEwNaDLFErEwKW9OSXjljeSyWc1M4vRhnq5KY2Q/svYH2y46cs3GZVqaemLqZosc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXL6ighdvz09PVEGZhiLjELHtX5NFbeKW5x3TQPaj8p5dDpogs
	Qj04tq9d9Z72E1j/DBarBdpkD6cwq74gX7qF63kK6rUn6XGKEJBv
X-Gm-Gg: ASbGncsTRMYbBPD6+kk6tVQxqO5wXafp+omXhhnn7OPj5Bx+OstcV3RPJb2injQHINp
	lDxd3/842RJ6vtCt5bMdYJMgMhhRr/6Z5V3J8tObSOjI75zPPtjvNvuKjgxFOImlvHzoontOExL
	NtfavnUbxDstVO2Pp3tZX9l/bs0BmQWq/bJuNLzQL+7uWSmvH8nbieQnmkRr0N4XblMscwh0df/
	Qqdjyqpjcn8/Yo4+U9zTWpYu5rf1vNeppNkln36skeDKFtQLzbqivPlI/+jb7S37Qk4gY5D+T5A
	gOG0ge4gB6MAidDY7NHPkfgJTtf8SpIRYMMd70XUxdfyyd6GpQ==
X-Google-Smtp-Source: AGHT+IE85esx6A4PJTGOWVHuGgOO4I7v2jLl1nJD1tUzIsDLj020wHzfyh82c5B1ItMJEym95jd1hA==
X-Received: by 2002:a05:6402:210c:b0:5e7:8efa:ba13 with SMTP id 4fb4d7f45d1cf-5f0b3b61098mr4010902a12.7.1743811803658;
        Fri, 04 Apr 2025 17:10:03 -0700 (PDT)
Received: from ubuntu ([105.112.234.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087ed19e7sm3039854a12.20.2025.04.04.17.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 17:10:02 -0700 (PDT)
Date: Sat, 5 Apr 2025 00:09:59 +0000
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, julia.lawall@inria.fr,
	andy@kernel.org, dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH v2] staging: rtl8723bs: Use % 4096 instead of & 0xfff
Message-ID: <Z/B019elTtKG/PvD@ubuntu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace the bitwise AND operator `&` with a modulo
operator `%` and decimal number to make the upper limit visible
and clear what the semantic of it is.

Also add white spaces around binary operators for improved
readabiity and adherence to Linux kernel coding style.

Suggested-by Andy Shevchenko <andy.shevchenko@gmail.com>

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
Changes in v1:
	- Added more patch recipients.

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 297c93d65315..630669193be4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -943,7 +943,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			if (psta) {
 				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
-				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
+				psta->sta_xmitpriv.txseq_tid[pattrib->priority] %= 4096;
 				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
 
 				SetSeqNum(hdr, pattrib->seqnum);
@@ -963,11 +963,11 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 					if (SN_LESS(pattrib->seqnum, tx_seq)) {
 						pattrib->ampdu_en = false;/* AGG BK */
 					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq + 1) % 4096;
 
 						pattrib->ampdu_en = true;/* AGG EN */
 					} else {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum + 1) % 4096;
 						pattrib->ampdu_en = true;/* AGG EN */
 					}
 				}
-- 
2.34.1

