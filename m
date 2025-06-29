Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7883C4685;
	Sun, 29 Jun 2025 02:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751164399; cv=none; b=DLAzKkZFYdCvVOO38TEwxQjiygUBNxxKqnp021eC2u/f9LISUxjLXuTN3c7IXW3z0DwBg71Cqhmvcdn9KIYxuCWL25SU7/PBg9e+/5z6+8aN2ASbKzfcfPvUdRfmXx54cyKDqgxROGAgorP0i3ovUfAxJSQqkDht2xME0MLtfY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751164399; c=relaxed/simple;
	bh=7TNjsOsxaG078tW24eRpGIBuRggGpKpO1anWw/g3xvo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J7wm7Yq+e7p5MScHJS2/DVow1kUstB30eK9ZPyeSDorznaWATT76U65twLU1VAHgVfo9BN8M/y+y92/Rv5U68vmpUd4G34tN/+ufwmRQXz/0oLLwQTK+DGPrfY23zDXxpO8Y7uvRtJlr0Cq7jMhLwK9veZ+ssstRRV7dZncwRzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0gFTF+j; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0gFTF+j"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6ecf99dd567so16771516d6.0;
        Sat, 28 Jun 2025 19:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751164397; x=1751769197; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jaLii3lNy2CzM3IdE26aImFnghtJ1UVJQQeyhI36CDg=;
        b=M0gFTF+jheqi3+Hw4dLgfRu8ZsKTxDk2DWMl5VpjDsTB0eb3e032/d7eE1KF18B5TU
         yRf8n1IXr4EIfdIUmPHj91djN1Y7dXFts85auOm9bXl7dIv168h8ciruJji/zhdOi8YW
         aPcrAt1jlUyVck9ilZRskkfMbMfg2E0yGlS1ltvnuNsuQH5F1uAHAi8e8f3OkGPFpQTq
         2hnzOkhSos80sgjcHaLyKMsOVUJ1kqPWlkSGy/TbNBtIOlLX7UrMZYmUjfHLb/KRQ0AF
         QsU+6kKnhTHSbfk+yTfoWkSz4pUytZ+rW6syDZZLJOL7btvcCZx03ZsFr2+XHPNa3sgv
         HDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751164397; x=1751769197;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jaLii3lNy2CzM3IdE26aImFnghtJ1UVJQQeyhI36CDg=;
        b=AIZqbFSGbyuyCH5JBaBDA4PWvuS9E7ww/9Vs5RjtrrTD0SmC0nEL/WrTI3mxBxlC/I
         Bb6Imq+O2RWrvM+A02jbKiSCWtQyrfPqvmQ9jWcnnaEBxpjL1FXeUpCliBEc6CCW+nNI
         rQPL2oA466Gahv80N6lph1fTtRZiCEgYBHjybS30dC6Ov7XlFSaNdp+U5msrXC15nGfp
         pRbuRAU6bJRM8Bn2M8KQLpjcEdW8Ov+U9+LhQn+ey4Ta2ZYCdpYEPxyRkZI3K8F4PULe
         KeOSawvtzo3YiTHePD1aB7Qn1vZORdIxmHV2dDrFzjC0w/R7GErC4GsPmwjxXi2GSHGN
         12Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWwTFPlZl3uL6oQ5WZpcbU8mMKATSfvZbfrQiL7V9p9FE/LDsAMys7e4+nbwHJy1ZOxhPmbdFr6v2CA3KI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUUe2qkFMf++W117b1Fzg3MdQCqqPStPSDWt+zQbxhILA1olqg
	PR93J0iWhA3vj2DEFddDaULr/Qirg+WrRU1Ua+6wGi8ldy+uSQJwyk5b
X-Gm-Gg: ASbGncu9UOI76GELfnDYeU91C4CWWzSK7xX0i91iSruHCQea8VSGG/aChV1hJZ46U22
	rNVMXhALQG/ouosvMPnFcI/kGxAhjgMAHXHlMCE5SXBcFzcvAubwky56YP82iqBEcjZFAlTVhlF
	ljD401rPR7ba33+EjpSQeAlgwzRo96K4a1OFItx4rgjNxHe1zZEc4+TG5QRrOvf1Ph+XKSlucna
	rODIOQEjiL+srutJmiNfn42bo7CAda++zShSc6G0el9Y2vt8xj+wpINFfhjvcExE/Tg+LPmjYox
	m65H+u6A3Ud5xyr0e+nGvpO3gH+S9SN3no0NiTPcsZXn5Aqrm/i6Eu+pfLQj7tR1Xm/8ZjVA
X-Google-Smtp-Source: AGHT+IGJN374oPdb4HsZrF0iGc4qhQ+7BO8sPU2qnJfm0xv5BYCJ5fLgnAd/CbULgmqSTbxA3rF/KA==
X-Received: by 2002:a05:6214:2aae:b0:6fa:c41e:cc6c with SMTP id 6a1803df08f44-70002dec8ccmr152061816d6.15.1751164397300;
        Sat, 28 Jun 2025 19:33:17 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44317e285sm374242985a.45.2025.06.28.19.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 19:33:16 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v2 0/3] platform/x86: think-lmi: Fix resource cleanup flaws
Date: Sat, 28 Jun 2025 23:32:52 -0300
Message-Id: <20250628-lmi-fix-v2-0-c530e1c959d7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANSlYGgC/2WMQQ7CIBAAv9Ls2TVAtRZP/sP0gLBtNynFgCGah
 r+LvXqcyWQ2SBSZElybDSJlThzWCurQgJ3NOhGyqwxKqLPoVI+LZxz5jbqXp/YhhdOjg1o/I1W
 9n+5D5ZnTK8TPPs7yZ/8fWaJA2xFZbUxrzeU2ecPL0QYPQynlCxp39hSeAAAA
X-Change-ID: 20250628-lmi-fix-98143b10d9fd
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=910; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=7TNjsOsxaG078tW24eRpGIBuRggGpKpO1anWw/g3xvo=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBkJSx+vTP7lZ8HOY3vpZ7JEZQDXC58IZrPXjXIvy4RbO
 Dxs9LQ7SlkYxLgYZMUUWdoTFn17FJX31u9A6H2YOaxMIEMYuDgFYCInbzD8T556rFI72HeVgZaD
 ldqrPT8L7hVvnz1x4tEdPafvBP2bu4Phv9fRWpWJUk5KW6p8b1y2ZDrwxoJXWCx8Z19wcljKgcr
 NjAA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Hi all,

First patch is a prerequisite in order to avoid NULL pointer
dereferences in error paths. Then two fixes follow.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
Changes in v2:

[PATCH 02]
  - Remove kobject_del() and commit message remark. It turns out it's
    optional to call this (my bad)
  - Leave only one fixes tag. The other two are not necessary.

- Link to v1: https://lore.kernel.org/r/20250628-lmi-fix-v1-0-c6eec9aa3ca7@gmail.com

---
Kurt Borja (3):
      platform/x86: think-lmi: Create ksets consecutively
      platform/x86: think-lmi: Fix kobject cleanup
      platform/x86: think-lmi: Fix sysfs group cleanup

 drivers/platform/x86/lenovo/think-lmi.c | 90 +++++++++++----------------------
 1 file changed, 30 insertions(+), 60 deletions(-)
---
base-commit: 73f0f2b52c5ea67b3140b23f58d8079d158839c8
change-id: 20250628-lmi-fix-98143b10d9fd
-- 
 ~ Kurt

