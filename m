Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B771DDC1B
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746446322; cv=none; b=mDczwl0B3qHAAuHotmfOTZ/jdY/PY5rHxr9Vg6fkBpjIfnhn8yeCrYujHynFbmTpcdJaS9Mmsu7SSMMeWtRvPG7gjP21tCZIF1uUjIVqmiWxj44NZnqCvzLtRcYaJReaH9z5QODw4U+p0s8U37nevmEY2LNa4rEcmAlQ2G8bA6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746446322; c=relaxed/simple;
	bh=6RZV5MZVKmeCzA5UASjNpBz+AdKHmK+bWHLoIZfF2oQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zd9ewY5cmInwTY4H0urElvTbRZQJ9YN7UlSGcXbbUV2ExK8XRoWHE59DSPwAiHQ+assq9b+sfkg5Gx8CYtQOlz4AKqoCjRue1IzbIptvHo38I9D081zPe9xRT67oK4qPQhMr9gRts9kJI2SagBOXBUlp36ck2d2SUAlm2rWtXt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ys6qTrJc; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ys6qTrJc"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-acae7e7587dso691909466b.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 04:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746446319; x=1747051119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksIXv75AMprqQt0czCdB/ipGhx3Y8yq7Tr2SZBNDBGI=;
        b=Ys6qTrJceg9vk0KeIvqSnpod4Apo/wVCViPVcI4M2AkFbAuRPYQBRVGv7QB+Owlf4u
         ZZUVsDzzb9IYAjkCTdHpvgNGEUrfkfI23aNUgb7Wcs/tggMbHu+zi8jyAtNfjq2FsWGL
         Jr6eAVRBd0BCp18TqkJu1l0ALTQ5RYOPMFd1Uiv4ZyZizG2fBgDVM+cP8dspKFwRf/Wv
         9JCgiIcubl7TWkDhhiA4KiYsJPn2ei79Bg7p94G6BIr301wY5UONKSbMaQ6sUJfvDF+y
         JvO/70U0QdqPxM708ZSFAb6hTNXf2RwgUJ1jdOVK4Stg/7vVDd9u08F/vN+Dfg15B86p
         qyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746446319; x=1747051119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ksIXv75AMprqQt0czCdB/ipGhx3Y8yq7Tr2SZBNDBGI=;
        b=ZdoiZxc7DNO2ML2lVSdKRWEN8TL3QUa2+D3w7V/FZrM+Lx8LXbSAOHxMaqUHKEBfK4
         uOLPUnouWqwLRQHqPupCFjTtdUVpPB+pUIsf5JAU3go1LoSrMRXkcrcqlEFnN0QJ4SZ9
         qrCRGghzqr1Q5eL0VcnOIWKqkctORfuGgYIktFU5lvNRTh+zvkLQvNwRWAZsuJc8oBxY
         rL4nMb4Ytrs9W7c/P8b45CN/tlClmPcTQRbNyXpjBIDDZCHCtq/KLyirkdltjVjJvkuw
         38ha/znHiuK0J+J+/EdHeJ3hAVzllx+9yASWpNUamCtjuIKP5iPJfwmnVG82gn/bSQ8g
         +Txw==
X-Forwarded-Encrypted: i=1; AJvYcCVyTwR9UtJG5kOW84u5h9ol0N7WMXwoDp9f6N3kw1RxMqe6xKWk5hJY7KaTT+nMJrwAKSEulh1vOenocgc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy57RAazKGOFN2nqCOdTP0d9N2Hv3Nspd26gIr2k10TJ17/YdL/
	+KBKsOCGAPzlPQIoOKE892xvCM7teoIK1FZvsJq1EiIx7FXGTLAj
X-Gm-Gg: ASbGncvabrhonZfqQmqvTM2NGBbTCxkrJD3eJ3c+E8VJDEnW/1MTRO9XGI6A/9zY6HL
	C9Sb0OEOxtbRiYi2CTYruR3qYDWQia11Ty+9eVeelxehfn/E3H1OGta74dwG+ioIIIByXzVlDCq
	bakrX5Z6mIwu+gr5+Aa0pswPnCKBqRHqYBUu3XNJ9+aFucPJbXOWMqUIomnfLfhec4rmsgQD0kZ
	Y7e9sxcNQZJWuTDI81LPsgIBPJHWPv8OxONObJnf3jyD5hQWuag+J1U96qTR5Rt8vwat29AmiPt
	up0HNP1tOQC0KxlvfQR6Q/zOE53fitaE1ogrAwJix+nmcaUINtL3uhxRzQUSEcq+U1BvgQmIe7G
	AUg==
X-Google-Smtp-Source: AGHT+IHJd7917yYA36BU9zB7qXTJYeF8Exeg9o6oggXh+Vr0JK3NtJ+Zy1gxwWG26LoswHfjM13nfg==
X-Received: by 2002:a17:907:6e9f:b0:ace:7be1:1434 with SMTP id a640c23a62f3a-ad1a496beaemr696008566b.30.1746446318925;
        Mon, 05 May 2025 04:58:38 -0700 (PDT)
Received: from wslxew242.ultratronik.de (mail.ultratronik.de. [82.100.224.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a3c53sm489568566b.56.2025.05.05.04.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 04:58:38 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: alexandre.torgue@foss.st.com
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	=?UTF-8?q?B=C3=B6rge=20Str=C3=BCmpfel?= <boerge.struempfel@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/4] MAINTAINERS: Add entry for ULTRATRONIK BOARD SUPPORT
Date: Mon,  5 May 2025 13:58:24 +0200
Message-ID: <20250505115827.29593-4-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250505115827.29593-1-goran.radni@gmail.com>
References: <20250505115827.29593-1-goran.radni@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a new MAINTAINERS section for the ULTRATRONIK BOARD SUPPORT, covering
the stm32mp157c-ultra-fly-sbc.dts board support file.

This ensures that maintainers of this board are properly listed and can be
notified for any relevant changes.

Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
Signed-off-by: Börge Strümpfel <boerge.struempfel@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 69511c3b2b76..e393155d8946 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24842,6 +24842,12 @@ S:	Maintained
 F:	drivers/usb/common/ulpi.c
 F:	include/linux/ulpi/
 
+ULTRATRONIK BOARD SUPPORT
+M:	Goran Rađenović <goran.radni@gmail.com>
+M:	Börge Strümpfel <boerge.struempfel@gmail.com>
+S:	Maintained
+F:	arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts
+
 UNICODE SUBSYSTEM
 M:	Gabriel Krisman Bertazi <krisman@kernel.org>
 L:	linux-fsdevel@vger.kernel.org
-- 
2.43.0

