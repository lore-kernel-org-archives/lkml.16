Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E8322D4F1
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126969; cv=none; b=A5/8jH6AnEO8BF3VDIJW8tAopMobra5uWKQEQ7cMd9US9nT527Vg5suYceqVyr0RdFWCBmU0q74H7S3GKDv9+qAgX/fDLAZY9MQXLz0s8E2D/E7GUoZqlw99sXCuBQLFQFaRvH8rFr7fkb65A6lwWmGGoZaHwA20LdF9fp6rg5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126969; c=relaxed/simple;
	bh=XmV/aXBh9Veoxhdvl7o8+k6EEukH7iNlTk+HsyVaX34=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CfBVxraoxzdQN+tEctK2eorpSA7pjNgCiywLmDh3CNMY8yxUxecwzdeMMlTSUdkQsg2yWwDDxelnJ+Y96MJ7yqOLD3KMmxJdg85MoWD2KYNVAoAhQmMEXpqtpcmMEeGzNHbre/oKZHKeQAK7AprZ+z+ZN2qa3pwgXofXzUmE2Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Foq0whZ1; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Foq0whZ1"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c58974ed57so589579885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 08:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744126966; x=1744731766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98XHZF4+/XGoFE4w7ezqiz6/KeSNziACB6nFKvABlAU=;
        b=Foq0whZ1ca4h5OI/sJO+bC4AqbZVstECF6chMV5oh4K5KSDEG1/CBPDPXHCJ5cnqfM
         BrbUFY3XSfWBgPH6R1+z+SwP4ASeQD0Ld/xxJ+DuoyhctJ0ozch921rLARBGXbKnWPu5
         oZyw2jVoQzLp0D5Af25NkxDoJp+Xiyw/m3qjn85INmyMyWvgKrHXdbeXNrhKpzSglfB1
         ZjpkD3nsYHyuPB+7RjJnuZ5ZO63byLRafyJtrrMQYaudWusjjvqLngtgCoRVHj8zCmOr
         PW+iNCpWchv4z07iDOp+2AhHFfdYWBGAmrcpAHBu0X63VOMzGMFvHZCuNPmzooPcjNWs
         FvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126966; x=1744731766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=98XHZF4+/XGoFE4w7ezqiz6/KeSNziACB6nFKvABlAU=;
        b=ARFn3aMaAQCK6jUUkuQ5VhkqPT6DNl/cznLfB1ReLGtdW2UuSv8noTmQqaLl937Km7
         zJGeKih+QkJKBaqBt7D3itG3bcZPJ8K5WEC3sF58uQraIs58gDp+JfurcowaVJSXHfbS
         fMsI7CPDc5ID2uJTaXk28d1qJqxFGtabv9WEH0XLTUL4z0cSCnCAysMO1cnB0zeEEFtE
         UcQU+zQ9U9jdCthpAHKcm/puMdChLqS6n3OcrtoPbJ7xOuCYJHXBmlMZeqG4CXDynpfA
         DOEKVVHaJXW4EvWOycOOTuQI/ph+o3f4wS459yo9HgLxUiYLQmnm5NV/DqvFMMizOoms
         nj/A==
X-Forwarded-Encrypted: i=1; AJvYcCVmo9F3yppI+6tuLG0853CTWtnkwteyAMT6rBgPrOAWRJ2nuge2HrgeQcyTQWpdTE6gIdE1svnCZMSxL18=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP3BQYI4b4hWZH37bLXUDalv/wSMhE7CQY4K8a2t4DwygGYiqy
	Tx24rBzgw/CWqBg1f1Lxm42sCEsRaO/lseWKrYtQ7h3nkuwuGRIW
X-Gm-Gg: ASbGncvdkiDYMao0BuTrauyybsZK+l4gJfkrr9OnvPXcSJ2uH7ezpdzf3VGjf4GpQaI
	ny+d5Dlc0XyCy2UzW601Wm5C2HwnqcRllZesbDCPP3FRIk18lTZ5cuC5IfYLMl1pe3rnnxGKWJI
	5UK12cXU5DU22XsfVDREEGdc2WNIGmgNj9RWHidNPtWZlco7FUwuYHEC/tsRfvbSyUW5dAfRyQJ
	yHiIsa4d+79EzRY5yT8vuVYDcwYcHkF/7rYVTj3HEs2+7zU6HPRhbiAAqhfLlJTS+ByZT4KeA9n
	YNn1EP/JogcfieOfXHG6DLkYm7hv0BduVDxmKQcw6mfzHEhrWleKx59flQ==
X-Google-Smtp-Source: AGHT+IE9HMdekR8YtcVFYfgzDBJSYxUotETTUtehVlGaqVEWOP4lzhQH1VzCaKCauCD3Mj4nMirhQg==
X-Received: by 2002:a05:620a:1923:b0:7c5:55c0:db9b with SMTP id af79cd13be357-7c774e5b60cmr2657305085a.58.1744126966575;
        Tue, 08 Apr 2025 08:42:46 -0700 (PDT)
Received: from ubuntu ([105.117.1.177])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e968988sm776649385a.51.2025.04.08.08.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:42:46 -0700 (PDT)
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
Subject: [PATCH v8 2/2] staging: rtl8723bs: Use % 4096 instead of & 0xfff
Date: Tue,  8 Apr 2025 15:41:57 +0000
Message-Id: <930b275f8bfd8a8a0b06e38c14b7c26dd08af200.1744126058.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1744126058.git.abrahamadekunle50@gmail.com>
References: <cover.1744126058.git.abrahamadekunle50@gmail.com>
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

