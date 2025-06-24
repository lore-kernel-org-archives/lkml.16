Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720D52D1907
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750775551; cv=none; b=lFIWYSfBApFexdpeTpXtmx/2A4ZZdF3u5vqDE4y7LdYRUWSnDHONIxZ7mXrdMhd1jPCYsOyelIiTukXcXwiKs0BT5ke4juQbb8Hak7P1/sS9m8v/ypMki04DwqXEl3r3OfdT3Ess+8ARuhT4ucLd4HOi1zkei7uM2kmlK8XsZeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750775551; c=relaxed/simple;
	bh=qL9XmUvWaq5tHfaWx1V5LuweXRKdi1ZrjKkrO+YSNmw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DWTapWdY8dt8Usy6bY8VOIB2s+CTl21tPopUiEjllp3a1nIi+5R88EzeOeyxU7BTzqk3THwLst1j2tBBfQtEr2OKvUskLJf/1V+6XBSN+kU9Hnxd5AqCLBr/k29/IGM6XEbM8yjnQ28unai4FOGunaQ+aS3tuRv3EnfICc5Hj/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0EAFe1RT; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0EAFe1RT"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a5257748e1so3623348f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750775548; x=1751380348; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B/7dQju2CZeLI5d0OlTARaTle2Uj51q+BbaBg8wUzJM=;
        b=0EAFe1RTEz0BLt/FrR23WBsQ/aUei6oBJohWZ+bO4PLFJXfoMu2YkIyT0GoKf5mpBb
         OKR0+SqBdouRt/0Js7jjhPgSfFQAPLvh9oKtyUTB3Z39/GVzx1NxbUpUpC0HCcnOgNgm
         XpfWt7irb0GvgP2LPROhDVCro9/ck0trsCEvA9sRxGPMVk6WB2UvCpfC5Tsl1im87oB9
         6xvi/JojQKo4jGeP43M9Ygt4ul2NvHpFuf8rBQgWFxoBeudBjnvK5VwslbjFcn+AxMOB
         Cwja1Gm6Uz/wVIklFt+PjpbjnE91l8bRZRb1trimK/dyRDs41T+hizkO9GpcUP4qrqg/
         yU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775548; x=1751380348;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B/7dQju2CZeLI5d0OlTARaTle2Uj51q+BbaBg8wUzJM=;
        b=IqaQNJXWeL+FiQUFEIXb6brgp0QlR9ltkUh08bllyuO1avqibgsvL8lrhAo4P1QEg3
         uufQ9pc/2tvX1UHghNHTZJqgY40H1jeiqzNZ6RV0IWAVL73Euee4iq59dMjIBg6abzuf
         QHtCumUttP+YBdyfHr+tGzIVt6GENDaMZPDBxp4TRZO2KGUYNnU97BdeIzP4C4g+Qm2g
         ESY4B9HwGXMieGNvP5vCUxPw21T5HQedU8MG/TMN5UvlVltn++34oDZTmhIucoHl94fz
         7MZfv3LLTJKP8B9dihsxOYInQiaz61Z+8Z05XFntQnQJfZkVzdUL+ZhlRtrf8PSzZcDD
         PhSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA2mJGfXL2A4RJ4pc4z1UtIpM5kI/EohFDCK7VPniY6A++MO4+Y950T9ONnQ6V7I43YZu4YnniDkrr7Ro=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2a7PQE8C0NEgDLd+G9wIs3XNVyMAq39ct20Q2um6vbDs0FPeJ
	okGsZsdBccQM1llr3+ASOyqt+icoMtdlZ+Qu+EnDGHQMXvZ/emj5vrev/ewEKGhG5lk=
X-Gm-Gg: ASbGncvXs445LtCz70KQzx0tOl4k1wYQ7/TgGSCSyg7nbZVTOpMmGEG2ulpZB+JO5fy
	o1jQvvaGQqrZRgDUd1RHAFLhhsRNlq/I4VlFyrIcsYUe7NcyFlv+6AD6gVbKrzKSFhhfhg/MkVU
	jbg1RI2336EB8Nuh6eVYWidOkUTw7M+fDu/C40rnkU0BtIO+zqqb0uOPRvLW0kKPjvIomrWOWmJ
	R2KjclFr/OswRPEEfDSzgd+hYlU+wWUJlqCrWqtxg0B6epbqGlCP94PnGa8YVzb3lh8dzD+dYOY
	+pGMLJXEDBwP101tAy9tfSMOaoEcfHErjIQGOgbutSybrj2PlBw2oObhcfv/J2jDpBY=
X-Google-Smtp-Source: AGHT+IHImXCD0PRHI4M7v4iVLzEcYBW7djJvPwpqCRg7wUTNPed+BG1KF5ix/KPWpzBJJQPBFgd2ag==
X-Received: by 2002:a05:6000:4b0b:b0:3a4:f66a:9d31 with SMTP id ffacd0b85a97d-3a6d12dbda2mr14879216f8f.16.1750775547583;
        Tue, 24 Jun 2025 07:32:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead2a84sm178512935e9.32.2025.06.24.07.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:32:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/5] pwrseq: replace magic numbers with defines for match()
 return values
Date: Tue, 24 Jun 2025 16:32:17 +0200
Message-Id: <20250624-pwrseq-match-defines-v1-0-a59d90a951f1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPG2WmgC/x2MQQqEMBAEvyJz3gENGl2/sngIsdU5mNWMqCD+3
 eCxKKouUkSBUptdFLGLyj8kKD4Z+cmFESx9YjK5qXJrSl6OqFh5dpufuMcgAcoOvrRNUcN+QSl
 dYhLnu/119/0AI6qNWWYAAAA=
X-Change-ID: 20250624-pwrseq-match-defines-aec46817e69e
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1246;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=qL9XmUvWaq5tHfaWx1V5LuweXRKdi1ZrjKkrO+YSNmw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWrb56VtEbN8jrXfh++pA9Tt/a91zSI2thLGP6
 Zb3X5N2VSWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFq2+QAKCRARpy6gFHHX
 cs66D/9nnDqDh8+Uk6m4QTPNKsT8dOx6VegPWlRe/pW2j2o1y4gS8tZrc+2iV21gq7fF4mxnmiN
 SZJ+VE3IBUWkbI469tBUamwvJmopwlvIWXBbpvLmns5TuVfg2ziCF6b9f53xUGr0ptLAxC7xt2+
 6ofUKyshmn4ReWIk/gfyRUG6F20k9fUbxcm0IL0CKHADAcWOhEGdAYBu33Hna7oJTzahusPUZvg
 zGR91MBSHbd4Xxp77OJZRhjuYDIm8kYhYaN16zs08H6GX/OxlJrm2bXf6+qRb10/mu9xZlACjZf
 mVW3bszsPHgUBF8/RPQ/SEO8frUA59kInVGDYJ1J8XgmcLqE8sqfui5C0rREjVHO/Qgr8/CCgi1
 c0sIkUxzX4PjQB8EGSGkks0qHUt0+bwvKoh7mwO20lRlgxCBGSPhybLH5uJ2mHANOBJNHDpzZJI
 wcJ5JG9eCbuNApPD8E22Lr03o/197nRm6I5uGOBXWW5Tt6QgI/kOr04mMYtVR4RZYThbaA3b72S
 pS4feJHuF7MukcvxVQmLyKCrFVbn99hheJXgJsGlzyGDMUiwbS0CrQoJ+YzV/o9I+pFub/k3naU
 XBQK0UV1GCUgIHc9UNYX4IpDnXhF5652trnNl9Iva/DbXSbEUbGAdR+MPdzj27BUa2+W+Lp7aEA
 opBD6qhhZj6HaKw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

We currently use 0 or 1 as magic numbers returned from the match()
callback. It's more readable to replace them with proper defines whose
names indicate the meaning. While at it: fix a build issue with the
thead-gpu driver I noticed and extend build coverage for the drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (5):
      pwrseq: thead-gpu: add missing header
      pwrseq: extend build coverage for pwrseq drivers with COMPILE_TEST=y
      pwrseq: add defines for return values of the match() callback
      pwrseq: qcom-wcn: use new defines for match() return values
      pwrseq: thead-gpu: use new defines for match() return values

 drivers/power/sequencing/Kconfig            |  4 ++--
 drivers/power/sequencing/core.c             |  6 +++---
 drivers/power/sequencing/pwrseq-qcom-wcn.c  |  8 ++++----
 drivers/power/sequencing/pwrseq-thead-gpu.c | 12 +++++++-----
 include/linux/pwrseq/provider.h             |  3 +++
 5 files changed, 19 insertions(+), 14 deletions(-)
---
base-commit: d4c2d9b5b7ceed14a3a835fd969bb0699b9608d3
change-id: 20250624-pwrseq-match-defines-aec46817e69e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

