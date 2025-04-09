Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FAB212FA3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178372; cv=none; b=HLe4F9vLHo5c0EOgrWxWNMWV7O7OVarrfnNgxrPeqqcWixkyKQNZwZNWWL3OOULncv/MvwWdfzdyu31Ia/NKxDRIz9JXsiu7mDzeuDh8pXUnLxZmOUCspr+LxysjKVBsuqqVzKuUaTpb3IyhQURSmaj28EX36vIURz2ly+z/ZXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178372; c=relaxed/simple;
	bh=WQs83mOR7EB3n9PAfy3Yp+mv+W8nVFvV2LX+bdPbIUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JF7U0i5aUCxrEGFVH3D1d0JhGxl2RO8D5lc/T36P4i6S4av3wf5RbBf5bwbUdePBGDtHcbCzVNPE60S942VTyUiiEwi62RARQ1GX/SpBG4WFlu43Lg7nmaNv8DTCD4QUdHJ4/Tl8I1Lml0qtDKuyPyCf097u9XAWDzM3XbPsSRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=fncHbIl/; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="fncHbIl/"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736ab1c43c4so6185684b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 22:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178370; x=1744783170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Hsam7wws3fV5478xYdqXaQim59fVQl8gj8lLUlEFKc=;
        b=fncHbIl/lNoOsvAfx8SCPT26xhLujZ7/2wJl9GCgH1SxRZBprhWgHsKk7HUiDOu/HA
         Dyd4P4PyjnXKcVCrcljFP17uVfRPahdFaLbyCphytveKI0m505ukx7QtyTiPhm00ZaSq
         EK/Tn6AsaIG9yWqHp6NSTC1dd5RRiCm1EmfPGpgLjQBOgYWDoP6Jg2T8CCSUyMzGBYjW
         gRMMrq5wEs74MJhCrnaHsitH7AbTSMSH/Uy5MmW7h+Aupwh6BgiRNY+gyWr4DqG2swSf
         k2uRqNv61EKANkGtCYdUUTnZHg+37fLUBhwnuhQDkIkkrzLSVeIAJ8bl1541iPTE16UU
         58Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178370; x=1744783170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Hsam7wws3fV5478xYdqXaQim59fVQl8gj8lLUlEFKc=;
        b=OT5Sauchk78osamxvyJ1FF13QSfYe+6kXVA8fIg0WsFOr7e/MN8asO7qjOvl+lIA85
         /t5R1+GprmNQnUroozgDZx89WbJg0H1P5DKcJy2nAOTbkfzS2NGRaLNRVH57+szzsKZ7
         SxzxFwpiZh4+agVcSRtPShqPq3LNLXlRjnkGyGlCO3Ak9+TKGczcdpaafxyYSwKeOmNO
         lIQzJnrYmgD/U98oV0z0a9U1kYFQIxDwK3z4D9kZDG7oGOrB62ph6YW2mmFrQOCTvsMy
         +UplPq8e+ilxpkDy+0oJy/2ft/co0ELf6RX4hjllYcg2jH4Zhf52SKH5RVmHrHc80S5v
         Z9Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXaCO37MswEVTWcO/I3cNTPlrOsUwo9QoO2inNQpINc1qRuuEfTO4A5apGm6bi85pb648Hvdn3yLgA48v0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJv4tyTM8wLK9wr8yFw/snFDrP7TA3cbLbhslkHMFbdxLCl/OA
	UmaLzUsM1TABeROHws7N9hidPzrlzJjl3X+yDhDYK2jBMUYTH7ONovl11mMoYA==
X-Gm-Gg: ASbGncvXvGtZ2fStJ0sUy+C5ObqvkZnwecb6oCXGFdMW9JO37zPIiecqHwg6Ep1/I7G
	p7RRXLrIedb5U9idYYZUe/Pg8D/H5m1LFgiHhYaCVQ+f5G0LSFz+wqTramNd7+nMZQvnU/VBYs4
	cj2uRYEADzthLOkwyg6S1Zwvzw0dJ/zQKKV6Ju6uvZ5VCPelWiw/8hnNB/mum9FD18nplnoQM1s
	payZ11fVe278PbplSVHBijTNiHocbPiglCQghebpe89BXjRluSKyh5SEQyaH8h4z75UGO/YWQ9r
	WG9E6aU6DoknLo4q3SF7377knNqhOGimkpoR3BGcQUlI/EQ7Yg4bZkuocr2XQLwraOtbwf6lFj0
	i1riv5g==
X-Google-Smtp-Source: AGHT+IH75nrpakEktCpqo3/kYdEUc7RDyJJvYvb0XEQUXDTdVYRKf7nF4TeIuxZn+th+xO8qRQFpCA==
X-Received: by 2002:a05:6a00:10d0:b0:73b:9be4:e64a with SMTP id d2e1a72fcca58-73bafd6d5e4mr1628393b3a.23.1744178370326;
        Tue, 08 Apr 2025 22:59:30 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d2a840sm430456b3a.7.2025.04.08.22.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:30 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 20/21] staging: gpib: autospoll_ioctl_t now short
Date: Wed,  9 Apr 2025 05:59:02 +0000
Message-ID: <20250409055903.321438-21-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409055903.321438-1-matchstick@neverthere.org>
References: <20250409055903.321438-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style to replace typedef autospoll_ioctl_t with type short.

Adhering to Linux code style.

Reported by checkpatch.pl

WARNING: do not add new typedefs

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 2 +-
 drivers/staging/gpib/uapi/gpib_ioctl.h | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index d32f39ddea28..6a92562ae39c 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1600,7 +1600,7 @@ static int dma_ioctl(struct gpib_board_config *config, unsigned long arg)
 static int autospoll_ioctl(struct gpib_board *board, struct gpib_file_private *file_priv,
 			   unsigned long arg)
 {
-	autospoll_ioctl_t enable;
+	short enable;
 	int retval;
 	struct gpib_descriptor *desc;
 
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 0403e285eed4..c66b8d59a46b 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -107,7 +107,6 @@ struct gpib_select_device_path_ioctl {
 	char device_path[0x1000];
 };
 
-typedef short autospoll_ioctl_t;
 typedef short local_ppoll_mode_ioctl_t;
 
 // update status byte and request service
@@ -154,7 +153,7 @@ enum gpib_ioctl {
 	IB_T1_DELAY = _IOW(GPIB_CODE, 35, unsigned int),
 	IBLOC = _IO(GPIB_CODE, 36),
 
-	IBAUTOSPOLL = _IOW(GPIB_CODE, 38, autospoll_ioctl_t),
+	IBAUTOSPOLL = _IOW(GPIB_CODE, 38, short),
 	IBONL = _IOW(GPIB_CODE, 39, struct gpib_online_ioctl),
 	IBPP2_SET = _IOW(GPIB_CODE, 40, local_ppoll_mode_ioctl_t),
 	IBPP2_GET = _IOR(GPIB_CODE, 41, local_ppoll_mode_ioctl_t),
-- 
2.43.0

