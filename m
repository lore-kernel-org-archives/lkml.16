Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C540C1624C3
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747145525; cv=none; b=mSNO3+GQaF0L0b7y4DjdRr4KdyfAil2MN7Nl9rOEQs2AzkwPrJmF3e/2z3S1QkZigdgkDanrGrRSED015YviTL/Ax6Nxwy0lonDdO6Qp/jUHPzyk5B1IulnL6e/1C7yB5GQIA4NOsphgheKuoz2/41b6gIA7Twy3wpIXWflCB5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747145525; c=relaxed/simple;
	bh=2xqvN5MZ0cpWW5I2C/Kd63LpkF2iAU47gBCPKJfXWlk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=k5QRmq+agPnjMAPKal1b2io9p7d43CgocsFvKLAr5gTfC9OxdcuKmL8w+8ffhR+aegohxB6wxIIRHG5DD+MSaNlCJhB+Sc/+eVpbBJYjKBXlfppzO+p9kMw66sxbOtwqgOkBHoXKx9ZlBy5Y1ijzl7IpfJtMsg3JpCEs8DQB/4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9X2Z4+p; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9X2Z4+p"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b1f7357b5b6so3557235a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747145523; x=1747750323; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J3EOkbiprB+sAgxVEHkLRonbL3H46Q0tOtDWzJ5+klo=;
        b=j9X2Z4+pSy+Y2YCHHG8kX62ATze7n0bI3ao6RL9BET6bKzwZYhfS6QEwW0fslPcx1i
         uuL0xr6jkNaOH3C7Yr4viEogJZCVBykT8vkS5axYNw7ODAtfba3T8blJuw2+DcWpGFtl
         +97LYnRiL9wor5IBiZd2bJdnFBAOKmkl6qMwiaL+j0ITbOq6Cdk5lbSJI47bhxmQsOth
         N7pkUWYGfwNg/axrUgD7tFbqVldH2HzTZSCTRDH9hOVfBBNPZw//RKLhdmZItxujZFiz
         QE/PBILQZ2CqB02RHRpMVqieic5u3jHcA6SW3wzYCZugKfMUiObqG/QIPIpSpEIs4PYt
         6jKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747145523; x=1747750323;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J3EOkbiprB+sAgxVEHkLRonbL3H46Q0tOtDWzJ5+klo=;
        b=NxUXxBQ5fRvjPH6hmpLadp54RQA+eFoFdzYkthK3D6Sd4ioHmzPlAmOLJ8KHv/lejm
         kQ5KRYPuxLCly2kU6eIQlEAuoVRHBjANh9mhd+mr/X+BGuzBNM+CayQ7g/ZYpUFl/PD3
         8qW+zLXR3Yi8weK9G+C7MxjiY+lpM/0VRnwTmcVZMF841RJ7Iksqbmg6JETNXRK8/dhR
         rqSjQYQVcxOLmk4xWL8a765DyOSJk26PNl2nhg0aZq70ceY5OJbDGpexZY2iiZA322Qz
         e+fYmGI/I+DFmA5cg6podD89JEvZX+3yD2+UPK+1iLt8nKrVdIq426oD+oQjlb7CzngG
         yOEg==
X-Forwarded-Encrypted: i=1; AJvYcCVnvT3mjzhtTO1oPQzufC+B0obnyO67D05lE/CnO/ncx26L6lw77eZUJdUIunF4aP6Te1sqRK5D/G/RPOw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNQGlcmVNP3ov7CiTpi4Ac19O9nzmb4AdA5EXym5ouHZn8UkNK
	YiFPPGVOYA6yK6Qaw3d3EMpUKDzpYyS5CHLZIQPHEnqK+YkdRncVQbm16w5j+VzXEkEQLJQSVpC
	94TvPfQ/j+tnLDPiHTl2qTGdXZ5xPS4Iwo+c=
X-Gm-Gg: ASbGncvv381UixQtZMZ1KWgH+hqM/Nmg+/gt1gfmqpHB2GwSXmITZQ6vn/NQDqTo04u
	iazqVQ/EElSA5VdE0iA3oEEsR1b9Kid3DyTUs94X2Hf5/imyELDzu4qlwBYtowwx/qT5Gl/wZ96
	Nr6MKDD8+NIOrPQ6+3HAxJytAFNjKWKxCQ
X-Google-Smtp-Source: AGHT+IF45yksE+sO7g0bsyu+gCHTxSnOl+bOkwMK4/IOhUAdyfs8E4kWcc/D5Rr4ozrDkVRLAQcdu228FsL4WfrKTF4=
X-Received: by 2002:a17:902:dacd:b0:22e:566f:bca7 with SMTP id
 d9443c01a7336-22fc8b5192fmr239873545ad.17.1747145522940; Tue, 13 May 2025
 07:12:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tanav Chinthapatla <tanavc01@gmail.com>
Date: Tue, 13 May 2025 10:11:51 -0400
X-Gm-Features: AX0GCFvLU5dUzxQd5PLroCq5K8AVhqmL2OxGZEuBaeNQtpjBBfb8ofJBYjgj3yc
Message-ID: <CAPGyJDMb0Ac7KtNc8AUTJ4E-Q4Vw-8JNoKWPMTFSuRU7QiFfdQ@mail.gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: fix spacing around '+' in rtw_cmd.c
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 25aa24c7cde7df5901674ec08090992b17afd5b4 Mon Sep 17 00:00:00 2001
From: Tanav Chinthapatla <tanavc01@gmail.com>
Date: Tue, 13 May 2025 00:16:29 -0500
Subject: [PATCH] staging: rtl8723bs: fix spacing around '+' in rtw_cmd.c

Signed-off-by: Tanav Chinthapatla <tanavc01@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c
b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 1c9e8b01d..98d89e836 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1619,7 +1619,7 @@ static void rtw_btinfo_hdl(struct adapter
*adapter, u8 *buf, u16 buf_len)
  buf[1] = 0;
  else if (cmd_idx == BTINFO_BT_AUTO_RPT)
  buf[1] = 2;
- hal_btcoex_BtInfoNotify(adapter, len+1, &buf[1]);
+ hal_btcoex_BtInfoNotify(adapter, len + 1, &buf[1]);
 }

 u8 rtw_c2h_packet_wk_cmd(struct adapter *padapter, u8 *pbuf, u16 length)
-- 
2.34.1
