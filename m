Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819691FF7CD
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 12:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748262044; cv=none; b=X08FH081kh0/0lXp3SblSKrbX/OznoqYbkdqHGOIm9vJJ4U801Dyaq6NEOCkILHfrznGvcLqayf8r4Weq8Dv6a0Kgh2vfxxPqRf9yaZPxo+3E4EVYCoDDA/ylGDQDx5/OUfaaicHBHKSHm9/RfyriEqar/OMRdexHniIVYhOgRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748262044; c=relaxed/simple;
	bh=dcXRZ78NZUBKgQ9pYC2GnvdjUHbGFRFOQl7DA9cLuHI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HA2ng//MuU0ZXrvjFfodwxoiTwqAzcFvSsxu6a58nn9Qp5YdYNVNJoJ/28iekd6awDzHoGqw01hzTjssouvnfUHKB5TX27VGBDX/OTsFPmkp9lUiGqw2sKqvF9D58KOOgGiUPTlt2mKEdH0yeqkN/k432NydISghekiVHyHwQec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=immrPJRm; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="immrPJRm"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-af90510be2eso261223a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 05:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748262043; x=1748866843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p1qP9wbzveeHwW+y7xiOlc7El9gt/p09zHHNjg3axz8=;
        b=immrPJRmGQSZhbxsMjA/vDev2swca1NZrVE6hEKQwzazOFzDxga4E3BaezjNXq/6S5
         NNcp3vyhEJ399tkDvrmZzvalk/i1HRC6lItRwIYFOjrnLKmDBH3g/n6ZHlF3K21tRPbv
         XrfV7SNmKMj7yD6V4etqRP50tMBl7kxNZTehw2pn/gfcBR9dKsmW9VkgjYWoGCd0+WiE
         hxipuZkb4IwSh4nyISUKAFoR2okksIzqhe1gUMtdeB2dd4ZZCaAd001uK35EE3pHjOVL
         Xx+uhMSWLEcp6IGkY+brfh/m43rtYrfj2GlkTGcYg+LfkViMgQTCHjLs+8No8hhKGP4w
         AF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748262043; x=1748866843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p1qP9wbzveeHwW+y7xiOlc7El9gt/p09zHHNjg3axz8=;
        b=JmTdmg79hKL62iGeFM/8wWCJZZ+zR21a55Xhsqy4uzqCE3vFxbRE0cL4mosr8SpXgj
         6az0jtvT8h04SdcPsjGpyG+Zc7DfpPn0+hyftM+cU9+oIQqRlRAgnwArxJjmnmIWGjgq
         x8FIPruaIYqsqAzb80FtMkD5iYF7axzrHKBPTpDIPNIRwiKGcOCo3VobxfQ9mdiga2j3
         LreLO+di45h7Xcm5Qm3sEKDKyjqBn1zL/ijNjA/WEqNuoVqps9gjUsE5NMoyHvXA9LG0
         OkDspSM2MQsYyToOZ2hZUSMmYPfmx1EzrVHGGq+21jAAbeTZ+pOZsGZWqcBelu6pIcbt
         63ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfRrXm3bUePXcO+rwZ1qicD8enJYwUHvWVSFAQc0LKpNjp0vZzSQRy5LWV0OP/xYPwHXIQ0f4ypL/SY3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlAATSAymX09ho/M2RfjTgiy5q2T0OGwfVvnvcikmVfkR5oYyW
	u7pzvEXgZ4x4ezq1vOT6BhSs0QhGsbG0P4E6yM9u39uc78qaAvISqt+hdajyY6eIMJIXEQ==
X-Gm-Gg: ASbGncufXQ4YLa1ucq3XXF/RTwKa25HhOGlwZ+qdOTDUoD1AzBdqnw3gAPt1DH/NYEl
	N8PreHTL1Ppn6b372fzVnnQAsZ7r/XO/7rzAzwAU1xu9V0RLATArRVTICSRTajoNxuX8hEqzHJe
	NgGV2vhsdtvEOaez6wZRvt88fDHTHzS7iDdyVxmN6+vEnQ3oi/fkmh7WApHYT2Tv6uVGXEi+vRB
	Zm6VY8UzNoTQ348oQGt96Itop3XjhpT2VJrEc06OCejzeS34HzA5Yc5cqFapnyNfxAivTkuYMqv
	ICaN7sNS90tRxT2PAtt03emWMHBzTw==
X-Google-Smtp-Source: AGHT+IGHnpvu26eT+6ou5Q3RwYGL3X5EtbEET9L68jcWTK05SMksDFO6nuHOod4yPXX82d9uIKsstQ==
X-Received: by 2002:a05:6a20:3951:b0:215:ea7a:6d2d with SMTP id adf61e73a8af0-2188c331bf2mr5819002637.6.1748262042356;
        Mon, 26 May 2025 05:20:42 -0700 (PDT)
Received: from user.. ([2001:da8:283:e049::9:6ed3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb0a76f8sm16748805a12.68.2025.05.26.05.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 05:20:41 -0700 (PDT)
From: clingfei <clf700383@gmail.com>
To: elder@kernel.org
Cc: johan@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	clf700383@gmail.com
Subject: [PATCH] greybus: Remove gb_control_get_manifest_response struct
Date: Mon, 26 May 2025 20:20:20 +0800
Message-Id: <20250526122020.3926640-1-clf700383@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gb_control_get_manifest_response struct is not used.
So we delete it in this commit.

Signed-off-by: clingfei <clf700383@gmail.com>
---
 include/linux/greybus/greybus_protocols.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/linux/greybus/greybus_protocols.h b/include/linux/greybus/greybus_protocols.h
index 820134b0105c..dd09dc691dda 100644
--- a/include/linux/greybus/greybus_protocols.h
+++ b/include/linux/greybus/greybus_protocols.h
@@ -110,11 +110,6 @@ struct gb_control_get_manifest_size_response {
 	__le16			size;
 } __packed;
 
-/* Control protocol manifest get request has no payload */
-struct gb_control_get_manifest_response {
-	__u8			data[0];
-} __packed;
-
 /* Control protocol [dis]connected request */
 struct gb_control_connected_request {
 	__le16			cport_id;
-- 
2.34.1

