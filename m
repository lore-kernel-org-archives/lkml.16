Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BDA2857E3
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290384; cv=none; b=HTfqJFb9T451bKObqebLujUpo05UGn5txCgQZXvOw6frGxMTnMn1EvEB6vKg4t9tSGwyUIfUHDD11evbKdWWYzF1VpVoyesCaLP505+8P/Nv4cXxusAD9HTrINhHRQt5DEauk0lfKDJl+0iH9WmjXYr2cWGuvuLnqcL+5riIgIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290384; c=relaxed/simple;
	bh=UEBGq2hN5wuyKESgk2qgoOZe9WblBnLEGKHOMjBPOuA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ag2GwI8nfUqNQowkMxxG/Oy8MMRjuYaup/9Qn2BgfiHSJdCQscAc/ru5T3W8hun92Vt8NEu4ArLlYGUAkkSfHkbrNsxHG6s3lWNKREfiWXW5DrZX0kdy8znsGnDDAmDECYQyJaOFFg0QBnzg1sP9hm20Fk+YZKI7bp5jHLcZQ10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKUfOygc; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKUfOygc"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3914a5def6bso408759f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744290381; x=1744895181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yYrkXMhVp27P99Ekcj0WCJBHRLqLKPjr4SvWz6cnHC4=;
        b=DKUfOygc0VqpNezyybXjSQ2PMao+rervOXS/C816hrRIKWQGIOrB6wdJqla+ofC8oH
         i8JpZcK7KnuuHsXOoaZv8/rsawKHeSCa+J4hadpChDKmgBSiPB83MeUiqRjPXh+yNurA
         XhMR55B9TeOq6DzTRKb7QXSLm/OzVIDuJwVRD+elSkQWo8IJHBA5U66ZH9N2CgHWnajj
         wQU2ZIGYAKMcvAhQEDvwdM60qrDciQMyq6nti70nWVIBz3HdIWAvfWRq74vnPGgJ0ECa
         cdmBxWjHJBDzLTSTgIVCuH0IMJK6LHINvwrC0Kzh3Ktok99F/ktEBbJLKr+wvQ+nn/yW
         j97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744290381; x=1744895181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yYrkXMhVp27P99Ekcj0WCJBHRLqLKPjr4SvWz6cnHC4=;
        b=DKFRG+Mjp24S5r/RR4ub0HQwrYFmxl7IZ9ZQTR+U/GolrTBoAgKMZGNlCYHLM9LJ8S
         94R889/PuLDQTGHWcjfn7MF6IXgPi1xmpRHvlHpI7IJ2ilcUjYUdKnI0poe1B7oHnikF
         aIj8XKIQfz3dekv7KEg/QXnxDdqCbGHkABsPGFuPiXdHwZWAE5tfnO3E/nHV86yiBNIM
         AxSrtL0Re9M6tF3BYHge5/rgZsE9T6oMjUwbV8W1+cK+H0Zq1gNCJ60xPY4m+LY7v00P
         pVvfpwwTQI+PFAAbwigGz3VLNV14BILNJR/wJrt9sRp50LZjN5M99lPv6MDVEQByZIE1
         Z/YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrn6lpodCX3M/58hCQdG355VaqgGWXtaHCf3J2WlJDsWlHmCrKdYeNPsky0k3FV9zqQaVHmBtMTxPMIPc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/wqcAtQE8NLQhV32c09N1UoacztAjj0iztXEdJl0zl05jo/O/
	Iz11Q9Sx7mzScccOsCYSTzQb1JObWJF2rCPQEuhRd26EOVENLzIX
X-Gm-Gg: ASbGncun9N1hxG1xkL2goUno/lo2y+RnLc2nuhzgva4fZ3ojHbkMTqoYNWNpo8FWkut
	z83XA7hUu9sS3HcqTuTe0rnV97TVFsZmjBciGntRKjHh29d22dteH6U0VXNEE+V2TfiO5U/AWWV
	k14jGGiS/IwNPau5FrsefFqS5Mzil+cJPU0iJNb5Idqme135GwbWJK3hat9MwfoG1xT+Z/Z+WOy
	Kwk4jv3sHL9CcAmvFrAcPR25KXIoMJTJ7gFjYXoO9PchTr2CK03zQEPzQJlAj14p5FLMzxbT4t+
	qGMjzjfwNxoAuW0sQGSU45yiOiB3OJg4FOBRWPeScfTQQLQ3
X-Google-Smtp-Source: AGHT+IFnxvs0neXn/HotI7cfUpQWPwUidvB7rcaPFjsSEOWbq0mwTAGjvs6LC5eBHoLyoc+WimQakg==
X-Received: by 2002:a05:6000:381:b0:39c:2665:2ce7 with SMTP id ffacd0b85a97d-39d8f4f3461mr1949213f8f.53.1744290380290;
        Thu, 10 Apr 2025 06:06:20 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc6dsm55013045e9.28.2025.04.10.06.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:06:19 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] Improve code readability in rtl8723bs module
Date: Thu, 10 Apr 2025 16:06:05 +0300
Message-ID: <cover.1744285781.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patchset aims at improving code readability by initializing
variables at declaration.
The patches can be applied in any sequence.
found by coccinelle.

Erick Karanja (6):
  staging: rtl8723bs: Improve code readability in sdio_ops.c
  staging: rtl8723bs: Initialize variables at declaration in
    odm_HWConfig.c
  staging: rtl8723bs: Initialize variables at declaration in hal_com.c
  staging: rtl8723bs: Initialize variables at declaration in
    sdio_halinit.c
  staging: rtl8723bs: Initialize variables at declaration in
    hal_btcoex.c
  staging: rtl8723bs: Initialize variables at declaration in
    rtl8723bs_recv.c

 drivers/staging/rtl8723bs/hal/hal_btcoex.c    | 174 +++++-------------
 drivers/staging/rtl8723bs/hal/hal_com.c       |   6 +-
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c  |   3 +-
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |  11 +-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  11 +-
 drivers/staging/rtl8723bs/hal/sdio_ops.c      |  59 ++----
 6 files changed, 71 insertions(+), 193 deletions(-)

-- 
2.43.0

