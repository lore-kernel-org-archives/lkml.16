Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2137221F3C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 06:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744007459; cv=none; b=BsFztV5Ip9kLEpgKK+bB1mQNhY7wl6Hz2yq/0KCdnty9oMqwaMDfd/m0XlNdP+akU6bYFdtK4P/ZaIRIHztRJbiLk+qqWFVHNHgADVOT6BSPUfQUdW/q/MzmrPMB0d28l+0+QYL3gMeW3kXuJ+FlecNrreCsaP8dMqdeA5/UcCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744007459; c=relaxed/simple;
	bh=AmxwkfNWnTqg4Gr3/bu+ich7qIKM/RNuPTFe3HF24B4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HF7fIqUd09HRsuXffQ2x6ylArUv5uvLmsbigr788q8eyAVmbY++fjDjLbIyKO0zY2VvWKS6ccJ02qRGAlmZKyFUSTE7nS09PGjZ/yuEyrkbpORuylyUrK6l1JLkJCGa5zq1borMYbL7fv/tY9CjK8acXlHc85lIahMtL6vOy4eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XT13x3I9; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XT13x3I9"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abec8b750ebso678682366b.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 23:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744007455; x=1744612255; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6CZ+9nJvtU7EchwepTb4lUMtEiDIUa7OIoD5xm6M59Q=;
        b=XT13x3I99MyNqpZCujbbA65pPtHEQhPmNsq0RH+tlykhSHNhFi3LpfxSEa6MbRr/u2
         IOL5FrlWo0cZhA3TxYTmq1S6jhIPlsaUo7+XSFbc7pJ46Br67vMqvNZ/W6xRye6FeuHa
         01goLB6YT/s3EAtePecGrcGtLLd8CVZ8LhnhU60LvJPbqlk+bLTOUJLfK4UhMHDukOZT
         1H6wdrG1BluqQgt7zglClkThfih6edk380Qwfk6SK2ICaZ0fmF4wfLtJHx/j0ITxsfHK
         Pe0qN7Uv7pxkYAjVHL1uwwtKPb6R3nif04a7WZ1eAIRQXmSNCp/l55/jSj7QIRBumgzZ
         uGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744007455; x=1744612255;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6CZ+9nJvtU7EchwepTb4lUMtEiDIUa7OIoD5xm6M59Q=;
        b=bkd07mJSltOKLSkDRM3q2IxvtGyGQ4IBx5EhL3ol89WZDcNSDQHDXxMEDzMlsU/zIw
         aFYQUo2nNiEe6ZtzzwJczwykcJ/TQJGzeFDT3WuYLNEr40cSuiLoara/xgaZ5SkvWmu/
         BoexmOBABZP/Gcj9DQaThSAN8axvvfV3JV5BC0TN+Qj9DmGxW47NcSyQIJjCAdV7AVW0
         3Cg2+AQQpCuiAulC38vXpsRAEUJybdexZhfYWrApkaUJHAOvewsPaZujkbhpesvLfhL6
         p8HBKPuLQz9MeqpJVZH61ryx3l5iskQ1tQafOqakJhxilVgA3bhuzgSCwpAI/mPo0I6a
         6Quw==
X-Forwarded-Encrypted: i=1; AJvYcCXWocvbSlYaoahzWddUpfkHBAiPRqMz114IeKu2ErxbFYHzC3o5h8iwG2ZyK7T1oN83xJXu6oDFewXCRA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwizwizZac0mF5MpYPSC2nexoy4Dq5C4PUZCP/TAc3T1j4FiNJL
	p73b/WVhTKimNFo7kkS7VOgHcxqv40iPQrDPeTCrwqGQQ+Nd3N7b
X-Gm-Gg: ASbGncvYjVIbFklrSev4wn5/B0hvo9fFnaYDdZB5sFR2Zd8zj/mATgAzeK1hu7+1Lob
	eYxsQsTzPXBbniftmTI7bjqIVmCJlyMgbju0ppubCcvdOHNiy7PzwfEQ4wo02KA1wNkAiblM/lp
	uvoF3ntMog5pZOdmoiuw8qDfOYPH3AkBOAzkNWZpj/HKdvDgTAUUf0isNuCYeV0v0SP8Jrg/9NO
	0zQJXWJImxtASB8ufH/HEYRO0PLQM6i9RIl+cASGF6MX7h/FjcGegNxjy6oZQxap9zOtyz+ANWG
	Cz4Ahabs9chpyWDTri93nnclJzxoCwVJHAi6tD6m3bfxC9iN
X-Google-Smtp-Source: AGHT+IF/44BzJTOSL5Y5td5z/Uyw0Rj7IdwztQAzzywUWn7ts4FkRQirCuBekw6dxMQ5yjBEXdnh8w==
X-Received: by 2002:a17:907:2d11:b0:ac3:413b:69c7 with SMTP id a640c23a62f3a-ac7e76232e7mr470437466b.39.1744007454655;
        Sun, 06 Apr 2025 23:30:54 -0700 (PDT)
Received: from ubuntu ([105.112.123.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe9ae46sm705764166b.60.2025.04.06.23.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 23:30:54 -0700 (PDT)
Date: Mon, 7 Apr 2025 06:30:50 +0000
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: gregkh@linuxfoundation.org, julia.lawall@inria.fr,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org, andy@kernel.org,
	david.laight.linux@gmail.com
Subject: [PATCH v4] staging: rtl8723bs: Use % 4096u instead of & 0xfff
Message-ID: <Z/NxGilPLPy7KSQ3@ubuntu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The sequence number is constrained to a range of [0, 4095], which
is a total of 4096 values. The bitmask operation using `0xfff` is
used to perform this wrap-around. While this is functionally correct,
it obscures the intended semantic of a 4096-based wrap.

Using a modulo operation with `4096u` makes the wrap-around logic
explicit and easier to understand. It clearly signals that the sequence
number cycles though a range of 4096 values.
It also makes the code robust against potential changes of the 4096
upper limit, especially when it becomes a non power of 2 value while
the AND(&) works solely for power of 2 values.

The use of `4096u` also guarantees that the modulo operation is performed
with unsigned arithmetic, preventing potential issues with signed types.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
Changes in v3:
	- Added more description to the commit message
	- Removed blank line in tag block.
	-  Added more patch recipients.
Changes in v2:
	- Changed the commit message to a more descriptive message which
	makes it clear why the patch does the change.
	- Changed the subject title to include `4096u` to show that an unsigned
	module is used.
Changes in v1:
	- Added more patch recipients.

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 297c93d65315..f534bf2448c3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -943,7 +943,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			if (psta) {
 				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
-				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
+				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 4096u;
 				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
 
 				SetSeqNum(hdr, pattrib->seqnum);
@@ -963,11 +963,11 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 					if (SN_LESS(pattrib->seqnum, tx_seq)) {
 						pattrib->ampdu_en = false;/* AGG BK */
 					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&4096u;
 
 						pattrib->ampdu_en = true;/* AGG EN */
 					} else {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&4096u;
 						pattrib->ampdu_en = true;/* AGG EN */
 					}
 				}
-- 
2.34.1

