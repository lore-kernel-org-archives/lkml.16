Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BD0207A3E;
	Tue,  4 Feb 2025 13:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738676677; cv=none; b=ar8qZyygToRhTR6gUCb3sqjyh6lS4HmtweGlYVSAgsuQjEIhuan5J5/nfP/pN8kWcl+BuCxqE4VceDuv1Idc7eI4XR3cdnD/c8BisInE4U1a057lKhinLmgEchcrZdj+lgRlcU5Mk8EyUHGE4/V1tThroz8Ri1qV3sckg0EcSWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738676677; c=relaxed/simple;
	bh=JOPhvE57e7Yl0yCqgzNDBhGaDnxSGMQdZUcisBNJLZo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iZD1q2qQdliHpmuqpuTtRf3TpKShNzFSYammRsDFpshZ3BCEETdqRjlemDHnpZoOxMzbpgLxwf9KosEG5TM0ZqHkCxaBCSXORi4TU7/KBrS9KvmLxHTwe2Pa894tZKYMNzlPc2+in8T0h3/Wf4T751v2e5KlBPtEA4PkLfy7MAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWdy6HYk; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWdy6HYk"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2165cb60719so101167675ad.0;
        Tue, 04 Feb 2025 05:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738676675; x=1739281475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=23I1dv2MsxhtsNHlLyu9LlFvff8gGRJb6rjKW5yM4Yg=;
        b=EWdy6HYk9tdijdThZvRafRblUQWBlsPs5umlLHZW2LMjcimp4QFc92VNLvhwgeUkWm
         FHmRFvkLsmfbNRmFEQm/D6mlxuG3vNSfwbYI3Lv5DmaWgpp7O8Yfodf/2HJyhzarT1zR
         0fg5XstHbqslnqm+ry94dqu1TRCHdfVIcWW8PJAisJWJrkms75WZKqD0HERkd7z7Q31C
         0cPHaOh8HE65jj6Yn6SIFWLUJSz8tz+dF0jynwBv9hdQPXepcDTIdvSTdSUs0hL5tIKM
         W2Tz6v5n6mM+eKyT87g/qHlbIlfb3stoO8KvSs+XrDqRsfTRFM9BRoM2bYc+eIEx+li5
         xe0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738676675; x=1739281475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23I1dv2MsxhtsNHlLyu9LlFvff8gGRJb6rjKW5yM4Yg=;
        b=CdoibWSinDvhutelt1HZootSsRTtguyjfWkkzoW62sVajgW5w8YvJcFSzNFuttEAN8
         Af576AOUMyBloSNVkbUBaUtAVEqLoCe180jbZnxaajiaR9aOWf5tLvourmF9EesjpQFb
         9MgYG85m4aFgjj+IVtTH+1etbOtzDTV37IcfUW8NQ4Au/u+IPYfcWI4jzuoQxbjhiZ8k
         x5ZvKISbsdi8Eq1Cpvk3DhX3m5hpf4aCJIFfIgwEENeMYAMMOpog27oCA4fkbypvWYt4
         He+FXxtcQhGCuG64OykJDuXnhGzcP9PF7pj00GZoOC9JyL3WKxt15eQBgIAt2wGzEmOL
         agLw==
X-Forwarded-Encrypted: i=1; AJvYcCVEXBWprRafhTbs6Xcqh8IX59Lh4ovldNfo6bDluqhcG3gQDfDYv7A1iKdegI6JGCMXpxjbCl+Ysybo@vger.kernel.org, AJvYcCVlXGobcQ3nA64ch+jz7GXEFbSvLAUXYpAPyTjSTwpCAW7ahmkSto1cF/fYIi/XaqGeuIojjWPuxkrTnz8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOE0eywHiywnIgJT9rc/DgeRWAEx395x4b24L69L9z/ZAbzn0i
	J5q6sE6an+Tl92Py39NbWlRvbJUE4L29hOpvqi5Lv+Otc8tBAhdE
X-Gm-Gg: ASbGncvv8K9MuN/CV+Zc8v8FTFomgA0M7JhD89Ke5oCT4PfrTgqLcZwxJQTVRAdJdui
	vdyNNcV06WKofcbErpRF8dcuBk7MVSurda5oHO8vBDegFkHhkOvCVX8X0OYhhxUDPbzwvs50doP
	IsMLoeJikJ1sFYyLaP5FALLxlh2ni+62HOxwNKespH4vG21dyMTBBv880O+CmskRhvOgBoPDRxx
	6MEuqOwAnWdiW6YA8XfYsJIGSIOwt1FoAu7QKvEUB8bFOlN6/Ka84okGH1n6oVt2sKBoB789uND
	UGyu0+OGGEn2P3MqecrDaZ3YTB53HRikyzDpTqlwq43UMA==
X-Google-Smtp-Source: AGHT+IFBSWUg1WBW83zal2OBls6l2oHtdpa4iQb72f5RQr4pvIeounzaotmL9WxtSQ590KDb+731XA==
X-Received: by 2002:a17:903:166d:b0:215:6489:cfb8 with SMTP id d9443c01a7336-21dd7c4c2aamr441284945ad.10.1738676673307;
        Tue, 04 Feb 2025 05:44:33 -0800 (PST)
Received: from purva-IdeaPad-Gaming-3-15IHU6.. ([2409:40c0:1019:6a4a:7b6:abc:27dd:e5f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f07651559sm12248165ad.56.2025.02.04.05.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 05:44:32 -0800 (PST)
From: Purva Yeshi <purvayeshi550@gmail.com>
To: Thinh.Nguyen@synopsys.com
Cc: skhan@linuxfoundation.org,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Purva Yeshi <purvayeshi550@gmail.com>
Subject: [PATCH] usb: dwc3: Fix kernel-doc warning for sg member in
Date: Tue,  4 Feb 2025 19:14:23 +0530
Message-Id: <20250204134423.28051-1-purvayeshi550@gmail.com>
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

