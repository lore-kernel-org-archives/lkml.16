Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DC325D904
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 09:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744190068; cv=none; b=SiuDPKnkecg2PUyIx+11+8SYSyO+Ht/m9tewI4OlkQVpuQhFRUWdOCoMsbBtr34jY+8uOVtYeNw7kAu24qgUIbN6nbbg5yDOhHqT5vm2m/0ZgZm9kJyJTQbpbuxpzS3xe9jmeF5pxBXCzD6GzQYcBJENPdchl8qWNm1T7We8mVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744190068; c=relaxed/simple;
	bh=1D5iZVjmIKarwRYdGD7MtKz/UH9NKBv0KmWvvei4cMw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bYKHeT/tbC2OezV15O18QuxTKmzqMXlWui/GB4i2zd+H+7RP29TdZnFw96PbSSe9ZJCWY6QKYaFUMVTicACydrbc1RnACYfiwrXUzKFuWrTnL30CfrT1NqS3OY9XPYElovYuuSaPQ72Z7E3UzRBrda8sHmbNJhxHZiyIfSlyAI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YoYwVDrW; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YoYwVDrW"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e8f8657f29so53597296d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 02:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744190066; x=1744794866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJ4R9s+Smn1DtIHoE8sXkA1kzL8Ka1xkN88DpPb5/Eg=;
        b=YoYwVDrW2iEMirBt77NlownLR8qiSTWNt7CvcgJzG7WBnR882LKIdGJMGxlfhFa+i0
         F0T0UOricDhTe2sTwaVgmMZ7T3gf+59t06soW8A8LyiKszpudctDXd3GXyUN6mrBYvWK
         qupvqacjHOJ4g6+YtzZmh8jj0/bWRhQFSz3ZgBm0KGGCCEcbay0Q3R5LZj/vbVbeO5zJ
         XjU2++7+/5MtdEFVA/KysLBPgsQnUPOkCpDFNvXLuq88IG36pomMDUhkf94gtQksQPo7
         vWtPE9HBME/yaMSvmdb17RGX14n/Yp9GzgVVjiuVQO6dIFHk6GnhNeAJBWlS5690n8lP
         iePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744190066; x=1744794866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJ4R9s+Smn1DtIHoE8sXkA1kzL8Ka1xkN88DpPb5/Eg=;
        b=iGpOH0UAiAoywqNXK153FOKyIxJjIYEm1kqtV6xirfJmf/5p9s5rgm861tzGfQwbUn
         DXbGtXzShLn8IMw9NaX8Fq1biz9uPlW7hOd1tt27jbTO3KxVDY+axZIaBPrAG2XC3foo
         2bSqn4fgr7VETn+njJmtwTdom20hT40kAZeI1eDy0oQgw6IcRmFXrB2h+5BlhZoh5HaR
         EmwKwhwzltiNBd5XWXBW53MmoPPX3GeSl+FLDwS80CbcALiznKM6KzL+m23guVwe2e5M
         ZAm3pIoeU+9NhFHfQRn2rmRHu4Oyga+Kp0a3mg61ByTjTnu/7E75kI30tHuT0g7JvfkY
         KXKw==
X-Forwarded-Encrypted: i=1; AJvYcCX6zphfSpQyM7749hhsldrVpItqEZfayx+wiIHnRxHOr2pDKXOaoMDFwRi8Bt2dq0EiTeabTGFln8U/YU8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9xpklYfsDbwalUW3QkIE2OehFfcepOyze9+TtWqXQfaumZAU/
	v/vb8mKmXmNvQh7S1ivBcw76kfmUk2T6N8w2W/REOQCNUCw3vUhq
X-Gm-Gg: ASbGncuJw/d378tob3nDxLlHHfOFyXshgoa7laihKLphH8+1QjmihZLABLRgDalpIYi
	o7wAORLymplzM889XVmwuuJKIeEotKOW/R7FIcs+d1LJbjMJEjAtmgimCLOdXr1A/Nkx5+dKXK5
	ljU2W42h5uWG8J+q2PHKLc1len6NQfglvLNs9eXfFCC/KEVmNk+GlcjQe2RYQ70RwBEBHRFRpmV
	fQuhcQa6MChX/4Cf5SVQbYJQhOvTicrXQSwMn69FQ5+VMv0o2QBRrmUPV2aAWBroaqpe1Q0VWTx
	p5cfq3Xx39MlM1g3waR00QK/ceTHdgy/fNng0GZn8ZN4SQ==
X-Google-Smtp-Source: AGHT+IEt+/uef1nd1EUQSOIdciPRgiNmmp4psQdY7P6wpuKI3PKyWfXaaQtxpAU+m9n/rZsfa7iUZg==
X-Received: by 2002:a05:6214:40b:b0:6e8:9e8f:cfb with SMTP id 6a1803df08f44-6f0dd0ad2fbmr20136336d6.24.1744190065911;
        Wed, 09 Apr 2025 02:14:25 -0700 (PDT)
Received: from ubuntu ([105.112.112.184])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0dea07c50sm5073136d6.77.2025.04.09.02.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 02:14:25 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	dan.carpenter@linaro.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v9 2/2] staging: rtl8723bs: Use % 4096 instead of & 0xfff
Date: Wed,  9 Apr 2025 09:12:55 +0000
Message-Id: <c590448d7cdef06dbc5af06090581523f8247212.1744189500.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1744189500.git.abrahamadekunle50@gmail.com>
References: <cover.1744189500.git.abrahamadekunle50@gmail.com>
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
upper limit, especially when it becomes a non power-of-2 value while
the AND(&) works solely for power-of-2 values.

The use of `% 4096u` also guarantees that the modulo operation is
performed with unsigned arithmetic, preventing potential issues with
the signed types.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 5def2467f42b..76f25ab6a779 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -943,7 +943,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			if (psta) {
 				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
-				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
+				psta->sta_xmitpriv.txseq_tid[pattrib->priority] %= 4096u;
 				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
 
 				SetSeqNum(hdr, pattrib->seqnum);
@@ -964,12 +964,12 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 						pattrib->ampdu_en = false;/* AGG BK */
 					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
 						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
-							(tx_seq + 1) & 0xfff;
+							(tx_seq + 1) % 4096u;
 
 						pattrib->ampdu_en = true;/* AGG EN */
 					} else {
 						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
-							(pattrib->seqnum + 1) & 0xfff;
+							(pattrib->seqnum + 1) % 4096u;
 
 						pattrib->ampdu_en = true;/* AGG EN */
 					}
-- 
2.34.1

