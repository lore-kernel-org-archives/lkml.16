Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0F421C173
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 21:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744062843; cv=none; b=QZheLTycZHd9qSQoXFDVnQwGaZs+DfOCK2kqVxoSL2v/Clwwc+lxAqddYJ2/QlrjAv7N756dd+yPllKNWlK+2cLnMkXNiuZPnhZhSDq22UOQ57NApNqidh8wlYYPcXK6nNOWJHlRfOPGdCWHapBz5ep+JfmaXkJgYx2UmHrXsck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744062843; c=relaxed/simple;
	bh=7sSgdbwii/FC6PRsh43qxcZ62ba0Ps9U4rALssUwWQ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=resM6I0cxmWo9DAnQwYHqec9Z41vVEZFo8x/smBfk8whmJOyYIY3zpjJ/zQ2h4fuLo2Q1g6O1HOTeDNoCJEb+JGn65hhq9jpdnaM5AlhNtT1Gk1d9cFlDQ4E9xCeVnanQNYOYFmVa4SwpqkymsPD8iMQE4PRo1oQ8Fmdy9CZYO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+/h/1ik; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+/h/1ik"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c55500d08cso462130185a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 14:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744062839; x=1744667639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=44ptuqfm+xZfFiz36ZupXaHXqHCUTI9Og8HwmPEzO9A=;
        b=E+/h/1ik4C3IJ4GhWDJqxlXMCikSddbohmxQPi9BpfGBVTnwYJnQAhbRvgPwnWn2Yi
         JrNnvl9TuhSM26YqMOvbB8b7wnMkAyKJoL3iNA5RKZBA7Su3DqnhL7qDR1hPSTH8C6He
         ibn1VvoF0F4H1YzaGXakSqxUuyhSiSu/q/G4058xSuw7wQT2ETWRObuZ07xJ4YN/vReD
         h+PK0hwDOSL/ADjzXxBcoc7f/5pMyNh9nqCT7iBk8mIAbWx3d37aBoRRWe/eXRm8dIgv
         XCq9OH1WpU1jaKpD0FmqyIEjmAJY9Wa9Iqg6PdrINvfx0TsCCd5buo2F5BWE14U6tajp
         3HAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744062839; x=1744667639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44ptuqfm+xZfFiz36ZupXaHXqHCUTI9Og8HwmPEzO9A=;
        b=xKPRo+0UchnvFVyfVf8vyqn8F+LqE9YCPa4S1A2J1E55tQER8hSzEcpsV55wqzcaP7
         9DQiPz/fyo5R91NRe+uLye3R4QK8oX5xex/RGo/bjKQBRwkp54BnJH8IU0QU6l7qKq0r
         NmLJneBSUR1bP2unZY4Y+z8WTTRryE704kwR3YAWFF16YayjYImPPk7vCgVba4tororM
         O1vUJBgrIMo2SxHK24shXRa3zl4azUkaEm188bjwnnM4wsZEamDqCY9Is8Kmn1LxsJYf
         WfGxa0STg1nx/ReiyfTxSpV5/RWDe6Fj4vLOBSszBRhhb00B0CcWOMiyuBKxs+CYAwTb
         ElKg==
X-Forwarded-Encrypted: i=1; AJvYcCXoWlWsDuWdmxZwh7s9AMg88pTsHdPsOHaol4Zm2vt9Hra6pEvlIt+MkqdN+Ms4hh0iYRTFWgZsScqW5sA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+MB44b2w/dT4sE2no4pPnQqpQqrPTNPEqoUI3EF9oNHt5MTL0
	f/MgdiB11i4RPlDvoK5fV+IYasmsgrA/8V07o+AKFTIRE10sS7ba
X-Gm-Gg: ASbGnctRiI8twgdbtBfcmS05mSjjJ933bYuQSVsf3LpgLpxsnvmOV/RGyxNneSi0iUV
	bbJnjP0cKdcCSmhDSVqgLnbGdXQ/lhxOGVmJIv0iUmObH/DGX61rhTH18uhoAH99FcDZBUwvaF5
	Y7luGIAUDzh9Gg00KJm3lxEC64VMXn832DdpZMO2qRZi/QJFo6CcZfg/+VWuLfSP/F7fpyL2emS
	NMouyjpKWLkwQwHIxUP2WXwO/hwnvM95Phw5s7bHqFTcQG019HxG4ONmHvFVVR3DZuCEJVhFqq3
	hjOUixWcNVuLsD5Vs/5cIORh9qR/unDNB6lsRZtYxMzEKmg82/0pJvFL0AeI
X-Google-Smtp-Source: AGHT+IFYq9jV/RIkb/tm8Itj5vUw+kwBbaTvoDn1s/JrUJSvmRAIKF301twccpzuKSqt5xla9PcLtw==
X-Received: by 2002:a05:620a:4409:b0:7c5:5584:dc1b with SMTP id af79cd13be357-7c77ddde0f5mr2114746085a.54.1744062839647;
        Mon, 07 Apr 2025 14:53:59 -0700 (PDT)
Received: from ubuntu ([105.112.230.142])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76ea7fd73sm653687485a.95.2025.04.07.14.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 14:53:59 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	gregkh@linuxfoundation.org,
	julia.lawall@inria.fr
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	andy@kernel.org,
	dan.carpenter@linaro.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v6 0/2] staging: rtl8723bs: Improve readability and clarity of sequence number wrapping
Date: Mon,  7 Apr 2025 21:53:50 +0000
Message-Id: <cover.1744061673.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tha patchset adds spaces around binary operators and also
provides clarity on sequence number wrapping by using a modulo operation
% 4096u, in place of the bitwise AND(&) operation & 0xfff.
The patches are required to be applied in sequence.

Changes in v5:
	- Converted the patch with the subject "Use % 4096 instead of & 0xfff"
	  patch to a patchset.
	- Added a patch to add spaces around binary operator.
Changes in v4:
	- Corrected patch to use '%' instead of '&'.
	- To ensure this change does not affect the functional
	behaviour, I compared the generated object files before and
	after the change using the `cmp` which compares the two
	object files byte by byte as shown below:

	$ make drivers/staging/rtl8723bs/core/rtw_xmit.o
	$ cmp rtw_xmit_before.o rtw_xmit_after.o

	No differences were found in the output, confirming that the
	change does not alter the compiled output.
Changes in v3:
	- Added more description to the commit message.
	- Removed blank line in the tag block.
	- Added more patch recipients.
Changes in v2:
	- Changed the commit message t a more descriptive message which
	makes it clear why the patch does the change.
	- changed the subject title to include `4096u` to show that an
	unsigned module is used.
Changes in v1:
	- Added more patch recipients.

Abraham Samuel Adekunle (2):
  staging: rtl8723bs: Add white spaces around binary operators
  staging: rtl8723bs: Use % 4096u instead of & 0xfff

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.34.1

