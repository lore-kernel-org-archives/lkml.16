Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8511425A634;
	Tue,  4 Feb 2025 09:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738660565; cv=none; b=hVs0EWLZL3AbI3UIGHZGm3axzd7C/KKfHCW+CV+pxDrpRKA4pkobbCdn5flhBQoDeMcjV284ehxf5ZOdyliUCEDMO1hDTlT3MJ9sXeQCDtWxjLzSHGXgyDzS6QxZRFDtgMYXX7ubFQYQP2oKj6oDsDi5ivd4VqYuygEF6NBNg5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738660565; c=relaxed/simple;
	bh=JOPhvE57e7Yl0yCqgzNDBhGaDnxSGMQdZUcisBNJLZo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sA5Bpa2QgN2j3CDmSY1Apo87QVfDuA4ux/CBVKBmKtzzkM1G2UvcLT57Qk6tGHEmAg4H8JpiFgzHe05WAzjtTp0YThXfntdv846e4+vpp+aCgWokfvWy0phdk5FnXJUlOAMP26qLTJq80LiFN4D9/KDbIxrOiFAf3DKUuFKAcUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2nT+fv1; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2nT+fv1"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2f9ba87f5d4so950279a91.3;
        Tue, 04 Feb 2025 01:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738660564; x=1739265364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=23I1dv2MsxhtsNHlLyu9LlFvff8gGRJb6rjKW5yM4Yg=;
        b=g2nT+fv1WH03lttDCkQwQz/stI/MM9TSfGXz5NM+FsNfoxX/oNlFrRLSy20yftcble
         UYPxMkCgHmzX5+zIcNhmPdvrC/nGkxqQp8R9BSM3PWzPS8WcyCuXgzPAoTNnKXENhNRm
         nmIHpIpQFiScuekgQQQmYpMPyju6Xfnb6asDAtrqKgETuS9DLSJhzFB22q0DtcwF3XOa
         RgyH+Co0TYBXNJvTndxD2YFmkTZ4Juv06m6jf+K0OBv5C9X3c5KI8Y/aNipMamOLNsSB
         TOeJt4Nq88qGVUL5m6uBb6dJbaMtLm8Q/WDiQtXIkYZoDd9R8JQUFPq695XJa56VeM+7
         RJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738660564; x=1739265364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23I1dv2MsxhtsNHlLyu9LlFvff8gGRJb6rjKW5yM4Yg=;
        b=eHsEWcpdgO+3fzo+h4CKLt4+gBXdmnrTfTSJBuW/gMO6kEboVOB4cIRUG13VlY7Qcr
         67YYWkx8rL17jILIljMoSkXyRfWQWtXgh2YCLW5WxgyWisqLtoxTrsW2ckLCX4xUJL1n
         AMTb/+1RMtPge0qW0GvNo44hf3RTtddqq7OFX/tdEGtglcbdYF5N/x0m1Fufp6mtEeNo
         bpEbkax2UpXMuSfbkyZncge9zebGcPMn3ipbpWfvKhWVxJvUsLAY+h0tXfJ1lBQ7fcyr
         E0yOEsT2s36lY6IvgZ9vrbipx5vDPPq4C2CeG51NCsP8vnJssdifuXlGbP+pKV1qYz45
         9ABw==
X-Forwarded-Encrypted: i=1; AJvYcCUyHppUVoUU/6kb3ezfGSlMKr5s9wfWsrhgpNjtJu3pFMXjOMueILAfUZpzuOpVbFs/4jtiDfyfOw0=@vger.kernel.org, AJvYcCV36g3X/Aoc6bJpPUD8XuxXXNlHlc6wumuXt1C3j1MFp9lwW2rvld/TuvCh/eivqzRgLkakD2RNGhmPfo2R@vger.kernel.org
X-Gm-Message-State: AOJu0YykCIu+NJc/D7+Na9kCdc7i4U3EvzawTm6439qIZ9UbR3rTQPkX
	yi8gL7GgJ1L034O2vVT0STCkfui/2cheoG4XqcRJfFvBYjOZGACaBz2UcrBA
X-Gm-Gg: ASbGncvyFAw+Bv8XXfrHLX+IVu87uZaQszXN882GPDnyGPVglSO3KKYjmfpzjZyfN+1
	ZW0xMECMKKZ0kV3MD5HiwfznzCqRiKV7cHvUaEOKL7NVz18n3TA37Qm35IF2Ax06BTThZqXnJYu
	xMdDEaTJ/qxgSdDoydFAC9LEJ1+vwLFF7rfiIdmedfzb6d8UCXvplFTl0ioM7Fq25vu5h57Ac6r
	Nbhbh21LeXoLfKLLhVRFx5ZAGrh6wlcDh0EI/rDEm/3FcCKks/d9cmucf5u4eIe5RJoB9gL8rSi
	sPA86RdAt+HSCZBUeMPDmBoEyZ5G81nv1534qF4vuQW9ygstwg==
X-Google-Smtp-Source: AGHT+IHcjKZLijm/9o9xintbLwiNdf5gu0RzL7eMkDlzdO7ZFYuu7fVcfEF9isblnxDphf5A7RmICQ==
X-Received: by 2002:a17:90b:2dd2:b0:2ee:b6c5:1de7 with SMTP id 98e67ed59e1d1-2f83abbd65dmr38334587a91.2.1738660563692;
        Tue, 04 Feb 2025 01:16:03 -0800 (PST)
Received: from purva-IdeaPad-Gaming-3-15IHU6.. ([2409:40c0:1019:6a4a:5f4d:5607:4a8d:2288])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ea7c0sm91927075ad.113.2025.02.04.01.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 01:16:03 -0800 (PST)
From: Purva Yeshi <purvayeshi550@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Purva Yeshi <purvayeshi550@gmail.com>
Subject: [PATCH] usb: dwc3: Fix kernel-doc warning for sg member in
Date: Tue,  4 Feb 2025 14:45:52 +0530
Message-Id: <20250204091552.15296-1-purvayeshi550@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added description for the 'sg' member in struct dwc3_request to 
resolve the kerneldoc warning when running 'make htmldocs'.

Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
---
 drivers/usb/dwc3/core.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index f11570c8ffd0..5e4daec322b7 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -942,6 +942,7 @@ struct dwc3_hwparams {
  * @request: struct usb_request to be transferred
  * @list: a list_head used for request queueing
  * @dep: struct dwc3_ep owning this request
+ * @sg: pointer to the scatter-gather list
  * @start_sg: pointer to the sg which should be queued next
  * @num_pending_sgs: counter to pending sgs
  * @remaining: amount of data remaining
-- 
2.34.1

