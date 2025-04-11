Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE7A27F4ED
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 19:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744400484; cv=none; b=dM/k3BcES+BygmYwsbwwEmw1KnKc3HAymUKkXbaWNdCmWMLlEWFieiM79srFGf4bcbf0vkRkhnyLZUkfAZVA2jYu8XKNd7BMXi5yCE3K3Of0KfXZaDjmq6SNDNdWRNrJ/vXHVgpdQa5bNiCEkczxq8cTYDAkR58oZcccQdH/KhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744400484; c=relaxed/simple;
	bh=7tuF8mS/RBiXqmBPIHQCKgLB4C5lh2LqoT+PdNMhZKU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bjC0lZCitnQWnJMOJeqx9fS6bsQ6Z0QRDTeVaJ7nba73Lk7Eo3orDsbjYX7tXP/BeyAaLONIa7h6a1UUkaDkbAi4SeDntcv9ObuzHQhT24E4UjvEr7EaLU+9Jd0WMF8DJiohG8Gl0KHk90XzYsoavzE38BDqfSM3jHaB4/d4fy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLTxUzJC; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLTxUzJC"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5ed1ac116e3so3621712a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744400481; x=1745005281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7n9MYWIYdQKtlJKSmxfHZ9iLzwcGKDDGvLn3OqdhaMc=;
        b=nLTxUzJCoEM/TXQBq0YJeT+a/o29NmdIhYUlk/zsXmLSc62equHI6gjX3RxjUm00/L
         wZG4jNNcYw/3BVoCutV+xnq7ZmH8Yx6eAI4TK62v8NStfATghdCrqNRswPcVzck0Zv8E
         rUDggGMEikm4BinWIeFNOHtULJa5AG7OgmE9dAs2un3TYJ1798S9WERBVr5Rrgp9ik9d
         SqWo664HsJg1ZpSTquZ632PetwemKieJ91618GyrOAdtxxCyBH41PVC7GULJrSk8MV4F
         wYckFAd2SHkVs4TyD/8zhfas4glIXYk2fxvKg5n3BqM1pq1Im0w6mc1Y+01x9Yo4TPPu
         e1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744400481; x=1745005281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7n9MYWIYdQKtlJKSmxfHZ9iLzwcGKDDGvLn3OqdhaMc=;
        b=Do0/8bmYkk7GjcgmJCU4/4jqZXAFLGk52v7A++bl1lTYxMbYoBbnjH2s9XnNopzSch
         09SYOJcpb+Ox49fray5wgUJsPruGSCFx+WG8aWgzEJHeVRxwTd/unuHC1O+yHzg3PVcG
         GLbLhhdFaVH+GWlystOGCyk7o/J/Yuv7RBeepSYuAmY9xLnWtcsrIkAbcMn0gQyaEeo4
         QF4RPdy/SnPq+VheOnUrggpkMYylv1S3iwldNLqc+3zXB61jt8Ba1gmQkHWtVY4Ail5b
         aXt8jZF+X3HS8fnHdeW0AL0V4g6QpRxFpeaHFp5l/omRE4LD7QTqsQpwFKx2IKPJkbN6
         5pWg==
X-Forwarded-Encrypted: i=1; AJvYcCW2C+2VOsoiRE76eoIwuxtrLWn3moq+g8iPZJItSzF5/ISMwTRXmxBI8B83gAbAfc5LDmshxu9seVLwORA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/RKwZdP/8TgQT9tA702ctuVBCT0g1o2yQuG7dE5lW8tPGT2Al
	I5I2hwWDy2WjJTAaIYsu81S20BjVeGk10SEizrQXhXGa4f1BZueO
X-Gm-Gg: ASbGncsHNQkNvTmFzVk/62FNGUFqG7ejXGoUyJGtg2vhQwezKYGmOxJOiJZ82p7iyoD
	/UQGV1wFoeIFWBJmp9YOGaNI/znoKlhSI73DT/whM6DEpNHzZ99zkn26HaXOZEJCSgyNM1NIX/l
	YUUf0qEY0fwGh2t05Z1Gesa+2scEmkT07DftBqabttle4ZlqQ07MQ4KnH6F9CPu1H8U5cZh5o7b
	UHuXdyqOZPRbUUje6fD7+GRnnca3q2VMIPnSYwaVJwos85n/2DZTjtaOxgH8zEaYZ9/dEF/zq4o
	I+7N8rgkcZa5PYdd8Lla4pkgnqVT04HVetSyi+LptxoN+XFWWpvEykOt
X-Google-Smtp-Source: AGHT+IGt3AoRGVNPAKlc6uxxRB1jAKP+g/demaRn5UgtHXX3Ck+aUYGy4cGq1fINfFtf8iVY73M/OA==
X-Received: by 2002:a17:907:7b8e:b0:aca:a163:aa3d with SMTP id a640c23a62f3a-acad34394e3mr295387866b.3.1744400480623;
        Fri, 11 Apr 2025 12:41:20 -0700 (PDT)
Received: from ubuntu ([105.112.122.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd223sm493810166b.133.2025.04.11.12.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 12:41:20 -0700 (PDT)
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
Subject: [PATCH v10 1/2] staging: rtl8723bs: Add spaces and line breaks to improve readability
Date: Fri, 11 Apr 2025 19:40:23 +0000
Message-Id: <3b9a0572ad56699b095642fc169c9603e08616e9.1744399612.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1744399612.git.abrahamadekunle50@gmail.com>
References: <cover.1744399612.git.abrahamadekunle50@gmail.com>
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
Reviewed-by: Andy Shevchenko <andy@kernel.org>
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

