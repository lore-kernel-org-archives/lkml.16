Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CF4F513
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 00:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744332083; cv=none; b=unWIJGsaMIdIbIcn/dT6qftwuxQBeVzkzI9gJ33ak/gfjFLzubl0XRVzIyT2DZe41hdp9zYzkS6aAL6l2Dd68sa4xPBQhvtMYCDDAr3und39um2CeQQKewqbuY5gPaprFFvFLXnzvjXYfaa9Gpp1k+h6wtcHtTDXJ5hzfa2kNWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744332083; c=relaxed/simple;
	bh=1r1LHmJ+FP1QHwOwOrhftk8RpNrpsI8w5sTLVW80UhE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JtTn1YCvLicD5Og1Bc3YVwEqjbFkfH8GPyH8nGjguC0QJzj8qoluoY5i9daSIcXvLnA8omhFnLtbQVJSev7RIxSE5mtQKfHBR5E7TqASmpmDhKXlxcn2QZM2wLuIyyshQmcClq+XKQOw4H1v7xcUBBmbJHZft0VPwI63PB7eDzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=U6F3HDwt; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="U6F3HDwt"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22928d629faso14745425ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 17:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744332081; x=1744936881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/4rHMPP0tffZ6aLtmo/OkH8XS8Fu3axD96DxnaYzNo=;
        b=U6F3HDwtzPTj+nzsOMh1ZiHxU0zQaKETkoaiMI7cwLjpLmOJztyMyBKkymPijMAJPr
         SNE95bkET+fPAlsExTfLcykdtL/9+AouqlHsZbkN4I9kbOTULuQEqJpsJ7gWwXzanJmo
         gfWWUnXOeNBbDJqzykRt+846ntDiSH1q8Y+NlaVXw8CiWMQPPykqPmKhQ3Mxi+PYCFEM
         nKWoK1z9T+k8FO1OIOJ87a6EkJC0jMy5dr41gaZoUUgjxeVB5GaXA7G111ptU1njRswc
         AHN484nYNqp4/9Y8iSfIoQKwtAX7KBqpMeiDxm0WbRjL2eb2mAuiC1zNkh7ThtuGkypn
         69Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744332081; x=1744936881;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/4rHMPP0tffZ6aLtmo/OkH8XS8Fu3axD96DxnaYzNo=;
        b=mXd53pRgCsqATdxiJpkAu5vUMOvvIGdoijwonpWwBpam3WbMjiX1xRUMZee1K0l+fz
         OsKRU8tMZque3KG0uerg9cFKiCDOroowyfe5MuECA+XRULzKgBjI51mwJaU+xIg20hgz
         A0731a/bv+ngN8Pwhpm9QjnusqG2MVWMu6uHNoVL/JMFvGlFHZ6gnFAmFLXjabyd8OHE
         PebBwGkTTUJbocRxVUKidce/Ckcl023cv6akpp0dMzZofb2VfGq8mp2HNwipQ1B6+Zw0
         bLCntCmZdTf0PKM9PUgbA4SdnkO+4ksXkYkmGXfR9msxQX4GzpfNiJ/hDVRkMBY0ZmBA
         gG7A==
X-Forwarded-Encrypted: i=1; AJvYcCXW5lJpq+B3Eli5w4zy2E8Y8U6y7n13GR+jX/871EmXgyeXcZv2zgFmS7p0U6JyWp5o7lWAq8eE8Q09q2A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD3VfhapOEp64SDOJbZOreESoKCQBGrleWbJM6Xlu/01QXn40q
	01Ug3mlYUODQRwZ2IdkFKhGMXE/ZT0+kUG5kKzSkggfUOFOJ40i873EO937yd2E=
X-Gm-Gg: ASbGncsVvf2VihncnIPY2//UthqjdM7TCS01lyl4B9KuAUOkgN7yuouvr7cC8nWy2eD
	jh1ufVDkTKpRa+/ZKjK00+niCTyYaBNBM/DQxLboeDgUVoV50pbuE0ctXnFLW+SnhNAIN3Z+rTo
	FOqvPln//S9h3Nh3H++ZEPZdMS1ihfFBf4Z3pB9bmpwJXoxY4npd2re5cDU0ZiXlAEdUwt7Kk7b
	zP7d4njVANdW/Wqac2gLa3MXiu4y2gejdqoQl9ztZSyIaWnw5avP/j9s9d8OUrcjByhLC3Uum80
	TH663ad/zbiFmFchQ47NGmcDl7Kg5v2L6MnTLesrwjsLJKof9g==
X-Google-Smtp-Source: AGHT+IEANi1v1Y2M7NRf7CyhxCioJrGmWqjbDMTvAkz7Sx4lx+Y+fr7d1/1Sg6nvnkECl35OKVi/5w==
X-Received: by 2002:a17:902:daca:b0:223:2361:e855 with SMTP id d9443c01a7336-22bea4eff3fmr12289655ad.39.1744332081416;
        Thu, 10 Apr 2025 17:41:21 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b63ef1sm37289685ad.35.2025.04.10.17.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:41:20 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, 
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250401090643.2776793-1-alexander.sverdlin@siemens.com>
References: <20250401090643.2776793-1-alexander.sverdlin@siemens.com>
Subject: Re: [PATCH v2] Revert "bus: ti-sysc: Probe for l4_wkup and l4_cfg
 interconnect devices first"
Message-Id: <174433208050.2415440.8081203416709656827.b4-ty@baylibre.com>
Date: Thu, 10 Apr 2025 17:41:20 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-94c79


On Tue, 01 Apr 2025 11:06:34 +0200, A. Sverdlin wrote:
> This reverts commit 4700a00755fb5a4bb5109128297d6fd2d1272ee6.
> 
> It breaks target-module@2b300050 ("ti,sysc-omap2") probe on AM62x in a case
> when minimally-configured system tries to network-boot:
> 
> [    6.888776] probe of 2b300050.target-module returned 517 after 258 usecs
> [   17.129637] probe of 2b300050.target-module returned 517 after 708 usecs
> [   17.137397] platform 2b300050.target-module: deferred probe pending: (reason unknown)
> [   26.878471] Waiting up to 100 more seconds for network.
> 
> [...]

Applied, thanks!

[1/1] Revert "bus: ti-sysc: Probe for l4_wkup and l4_cfg interconnect devices first"
      commit: 36305857b1ead8f6ca033a913162ebc09bee0b43

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

