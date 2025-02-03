Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A03C139
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738587631; cv=none; b=FIK38y6Jr0f1wnRj+U+3eGNTd7Tint7OXjHFAOGKrnslT3Al9XiG/muibdrGYzLLmK00jtiA8tFTSKvcqi1r0lQYJRvsmropdHJZyk4nZL/GHIOrWMDDGOrKzjLC27bogDcFo/Rw20GapPbTskR1bWSZRZktF7rGbr7Igg6Nos4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738587631; c=relaxed/simple;
	bh=gFIWZEoVs6xewuG+1TslnugeikW2pgRsWls9beBKmD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ErIDnGpPvsB6iFnUjkSQDKCgW/keoqWYJGYrbwwdUpSykc5t5pDsB/u/XKJiZ+YbZf6wzsHqQzlJt6379doRiW1ftgx7SU5kK8n2EFVKRyqPGhzh4c6vTbW6vp9xhks+GKFBO32lTsIV4fI5VYTHMr04di0o/Pk0j9Qlp3bPoMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XqPkdieS; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XqPkdieS"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5dc0522475eso8926725a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 05:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738587628; x=1739192428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7+UC99SbiXoliFqpRVlAawjVamIlotYzITqskdPO4ro=;
        b=XqPkdieSX0udDKihljrnBuxn1+waKHFIBSLB+pER32uZBMQ/rGx9DWqTHuftK3vfib
         YEQz+pHUYYrkRt0iygn9s7fGQ8+VjUDmgGP4WFmnb8M8cqFlrgYgYddzYn/xe+MHXjdu
         jOiOpOGTY2+E5QAQ+zTpe6ycdgSTTBj9K8Xqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738587628; x=1739192428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+UC99SbiXoliFqpRVlAawjVamIlotYzITqskdPO4ro=;
        b=YjUf71BVgBmnZfY3vOcC0jOzjeyNXIYL0hN2lltmAS9nGX985T5Wrx+0XtIdqkq4Xx
         QbbfylJ1BxvyZ3q9XE1YyyVdxj/vCtpIDaV23S8f5C7natzreTiSOKN1/iQ/yG3acdRr
         wjU+mtNlHl0Z8nrFQTpvAZ2wbtgUFb6JhypxnE4OlgHxSbfxAF7vI/GDSgBYsjuyiKfV
         h98PPfgYXKun6qHMMXaBbikzRHZUJ+pNQPoO6RBPUf2Z6QDy03DA0UXda5t6FnmkNsTK
         giiVuab/LJNaDXDJVaskFaiJlHuqIPbKKUx50QpoeJhz8/QSSWqZLHCgh28JL9QV0xjj
         9asA==
X-Forwarded-Encrypted: i=1; AJvYcCUmiiHy5M70zTlWkPbSkiexJ+84cZB+qizuP45aHC5whV0lZ/zJ+zAm8Rlb5svw0YX5IR1fgU+vaw2asg0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3tp81UWkLbINRo2AkjvP04Q4lHgIJ/loygSVWoa1VTF1yIWEt
	Ki0d3dxSsYlqj1Kecjkoh3F04b9xc8IiBKaS9Qs6npv15lcJ8xzKeuQfEDIEkg==
X-Gm-Gg: ASbGncvvK9Z+I9cNk0sodhg74B/K079M0V0Pv99xSyWm5+FAB+5uKBYeGTJw89MlA73
	V5SSpbjlCeXZSOdFLwPTNr14ujM9A+v78lmy3V/ufGOCo3qyo7saMPf+vsLjZDbWsaCIVhlr3Je
	nogQgIoIozMwZ8h+LAUYANCJJTD8qD8AZzBzkta7t1+KwALTBotSK4N6BRTm78QKVDoJr2OhCUb
	6bLB0diMpBkd+PQeiPU76hpjQpRRv+1bdfLxn1B+ql2EAnmR1hjBp2eHEuhH11BKcTRosua9/Cv
	lJLmpE9A5+3VnsCwFYLNFqvZg8CfzauVY6GucqAa0faorxYfHwpNuIe5EbWg+kNmn1hYvQrl0nP
	5ClHcHA==
X-Google-Smtp-Source: AGHT+IE6hSrWOYwnni9sRJznSp+KjHXszvDfSHNTeN4wYCdbeqIr+CqYnwkqg26Mkz9AOsrXexM+/A==
X-Received: by 2002:a05:6402:2706:b0:5d4:3105:c929 with SMTP id 4fb4d7f45d1cf-5dc5f01e7c3mr22186898a12.23.1738587628144;
        Mon, 03 Feb 2025 05:00:28 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc87f2e5easm5319055a12.57.2025.02.03.05.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 05:00:27 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 0/2] Add sysfs attributes to cros-ec-typec
Date: Mon,  3 Feb 2025 12:59:45 +0000
Message-ID: <20250203125947.2701106-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds sysfs attributes to expose the state of EC.
These attributes provide user-space applications with a read-only view of
the EC state, eliminating the need for ioct calls and facilitating
diagnostics.

Tested on a ChromeOS Brya device with kernel 6.6. Verified that user-space
applications can correctly read the new sysfs attributes.

Andrei Kuchynski (2):
  platform/chrome: cros_ec_typec: Expose PD mux status via sysfs
  platform/chrome: cros_ec_typec: Expose AP_MODE_ENTRY feature state via
    sysfs

 .../ABI/testing/sysfs-class-chromeos          | 20 ++++++
 drivers/platform/chrome/cros_ec_sysfs.c       | 71 +++++++++++++++++++
 2 files changed, 91 insertions(+)

-- 
2.48.1.362.g079036d154-goog

