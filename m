Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3704222CBD0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126965; cv=none; b=BTM7/3MHBuBzkIQg/cCk8FG78a7DDgfSlYjGblOrGLH2BCYswxzQN/YN9ZkyglM0XetGHfkE26AcHpc/GAhgx9N0K6JejdJPoH5+htT9FIAxGM9yooPQFd6EjG0KSXN5ueY3eREqbkBz3QS3VUn4xjRKgqjQujbqXtWuvQ13EPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126965; c=relaxed/simple;
	bh=SNY+xfg7xuqeKo0bASauwm4CIB4Hh1IX6M085ebqjU4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sCFO+RIi2u4B4IMjYszoeLDfBiEsJngCM2GwzCDwc+V0gEW31VVV0nzEON7bc4HT1Tz4WK+3yMKSDu5rucsXrZy+0OVf75zU9lo0Saa1jyZbb6XZoh1NrtOtNGl+uUouFRs0QVLe0x3JOKI67MgGEa3qClxQxuVFHScftme6HMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HcQ+qC3L; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HcQ+qC3L"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e8f94c2698so30068916d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 08:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744126963; x=1744731763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjpOiArvf1Z04uOUqAGMUvVN32k8PuPE73FHU3En8hk=;
        b=HcQ+qC3LH7V6WjMAbVxBAO09yhJFo1itc+/siuUl90AlM4c2c5E6aSXAj0nfL89Nuh
         1qF6zdEzbqHeha0IGQAQaWoidpGz9xpYIZle5YcgAKel0k9naKUE3HLa3Q2D/BfLq1CZ
         yq0Q5YwzBC05NT+46Ty6fOhkV2SYd1N4qKmQgbQPoIFSjc/mry/NpKc+vSwTOdwp7jFe
         p8aqSuhtZy+iIvue3PINDqDX2gkDrTIdInNk7LJvWy2wvKqfXfuK+cz49M5gE0OMEo3P
         v78n+VWfFij0PJrG6uoplXh2pZ3MWE5Wv/KyFQQ/BK7/xz8PDp0VzOS7Sa6zG/tSN2QX
         Mm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126963; x=1744731763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mjpOiArvf1Z04uOUqAGMUvVN32k8PuPE73FHU3En8hk=;
        b=xNnoWdmr/L4N1T3RdFHTcX6c7exdXwzw5zV7W0mmhlcSBWaD3Hq6o0GkG5n7+ZeqjR
         zXiGGq5c8tbUet8gi/D591YmmSOOPZQ70cuwuYQFu9egvftrrEqWE3zGzFHj5eEye1fq
         hgVGDe9kS+mYNNU9kQPfH/8QzjVhPuMArBKbSmPoKJkA893RohaPF5J1ZtLRldCtAFbu
         JQwxgzGp9EI4YgKoprmjh2eOAxRhBET6hnuks9D8E6N+cfPnBoMqBWM0/lQLT5wrGQa4
         9qAVdp0C6fimMKzcwnmea4nnD+Dykl2agDfZK2hIHH5GynmUAUg0pMuV6LPgQEBDJ6Ln
         qShQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPjOc3M+ngQ8IEh7r6UFd/+lepd2cRLYtz+tQA7uW2iec9BPWG07IpeLfcCSPwzvbElKMn77LEdBV9/lY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeIwakFpW9zqeO7hxxmSqEusbF6oev+FkL4btP1ONqC0Pt8Q/u
	zAdvwKBVT1h0de5Xl9A0TjJeTfw50FV/AWrsz6SMdl3SKGc7uSQN
X-Gm-Gg: ASbGncsCRHQCjoRMK9f7ajlGgVNncD0T3RRT5Ha2ZXZW+X/MsgLUJF+iR+pbYEMAPoj
	aCq4/lCTY40fNl1I20ThoNLjSbboQ450BV0mQ/BSus0Meb8dCl4KzCxuC4W8/OvuERjvQyeoJls
	gDBi4bALZmLlqRLslCkFydupLH+sc2AX/zZUETzkNqAg+d+LmRD3qwxJJMPcfdMEDpf2USXd59X
	zuN0iTlLIR+xru4ZA4MTXdyxQSu+q2pQ1Gj2s53Hmdfq8LRrfLV0jYV7xjYQIW7bg9qm+Sbwdcp
	uolRRBKbjl3kpr1Y1e6DZrYkYKzP4gqPODgWY2dsFfX1Kk0=
X-Google-Smtp-Source: AGHT+IEBOFu8DkxETzJ/TQ79/F8iZyj7apjJ9thtow93hUktf75LJrMwRZAQnVsHhdWqm842dQ96yA==
X-Received: by 2002:a05:6214:1bcf:b0:6e8:f2ec:4932 with SMTP id 6a1803df08f44-6f064b18b90mr238930066d6.28.1744126962967;
        Tue, 08 Apr 2025 08:42:42 -0700 (PDT)
Received: from ubuntu ([105.117.1.177])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f0483besm76229386d6.67.2025.04.08.08.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:42:42 -0700 (PDT)
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
Subject: [PATCH v8 1/2] staging: rtl8723bs: Add spaces and line breaks to improve readability
Date: Tue,  8 Apr 2025 15:41:56 +0000
Message-Id: <faf8f6f9ae2b0e4ca37ece39a33db6ea79e025c3.1744126058.git.abrahamadekunle50@gmail.com>
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

The code contains no spaces around binary operators with long lines
which reduces readability thereby not adhering to Linux kernel coding
style.

Add white spaces around the binary operators and use line breaks to
increase readability and ensure adherence to Linux kernel coding
styles.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 297c93d65315..5def2467f42b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -963,11 +963,14 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 					if (SN_LESS(pattrib->seqnum, tx_seq)) {
 						pattrib->ampdu_en = false;/* AGG BK */
 					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
+							(tx_seq + 1) & 0xfff;
 
 						pattrib->ampdu_en = true;/* AGG EN */
 					} else {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
+							(pattrib->seqnum + 1) & 0xfff;
+
 						pattrib->ampdu_en = true;/* AGG EN */
 					}
 				}
-- 
2.34.1

