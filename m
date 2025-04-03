Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E8824C08A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 12:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743684182; cv=none; b=LShD/ts/HwN2vaSexKF5VRqi9Ispc/2M3L7r73hNJCPltG5Nkb7Fh0CHR8oUU5/QEA4fw5AP3f6+deo1DxPxqBUY6I4bYylBW2Hns32S0pE+nk+zeC3+l+++kyY/KOJ5022/ptfkOHAYRnOuI3/aShbVLCHapeEfFifOAfy3CoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743684182; c=relaxed/simple;
	bh=urym1JFZ7iAPHT1OJuqUVs8u2iGfG/8qiqb58+toJQc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JqNH4uATpw5menr+M+4PLnktWGZqPa35/14SXU3aJn0SZhuWFe9gOUg0eZnFNFyFQVB/Rmp3P4yoFMnX6m+0+51HxYM7W1JrdLGH+nEPyFU5WbaAS0ZayPaqwMuojvd6OLU8Ptr6ff09x9z2ZGx/t1i9luWOJSU9OpcnJAE2vco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZoPO2Ax9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZoPO2Ax9"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso9019535e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 05:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743684178; x=1744288978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YzB7kb5NWj/5ZVCGMWPj1RqYUOc5X04PDDVhW6vi2Rc=;
        b=ZoPO2Ax9a14/0l9+jQdlccZBa3n9SctcVSU6jQLWn6/GLeYASkHVLcLSQwnfkIKxMn
         KV7PWh7T/HEB866pT1lMjEcYbG6t10ts3RisRqeFK7rhocpu4QXHEXC1VmnZYUu9CJlc
         7eVpu9XnmoFAS01YHAdHe3dtVorRDq1TIeFDQr+hB08RktS61fWjghzTKCIC3KL7Fvoz
         /DnvV8ggWlXE4MXJ6Kb0616jJ6jXcyqlcA0vDUq0Vgs4OYMLcOPujOcN9mMRCtMeugAr
         obR/GLp6FEnyxL/EkmP2qxCKctwsjx2DrRDEwu0HT6hIj3gxQ/p5RYdQ4pGllukke/VG
         azHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743684178; x=1744288978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YzB7kb5NWj/5ZVCGMWPj1RqYUOc5X04PDDVhW6vi2Rc=;
        b=FgTk+746vSnw1XWtZxC/KDpjJNyYpXZKDLNCR0ELjLt8iAK+6SFHO42J/zfDOUnISs
         G5Mwj1/qbainwZcibgDSJqUNIYmv3pNVAUlZGYbk2/yR8OuPuqyifayuzw13l60Wjl67
         nzHxKPZpyxfTaWXW/TrR+G55DhJlSdUk3BSf1DSlBZJsZylZimUyyMg4mTTScxw7WS2g
         4gXIynYaft1tcOdMl+2CPQT54fGDpExo7LA05SQRC8mItIoic5YmaU/z0DHkJ7MHS9xI
         Gf4l+cGzsCVg8q8ZFHgVXisb6XLPAP8W+GytO0jr/dgcmwppIMLviKjkKom0W+YFoDN5
         gB4g==
X-Forwarded-Encrypted: i=1; AJvYcCVxpW5mkeF4UThxvi41SDEAgdyNwm5CM4vSj9PxPl9mfCcSRGlEXZ4oYGx5JJPtottEDSWeE5SCkWjYpJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdAhEu4E0nla1LgxoayHak/Hoq13V3YdA1fyDA9olJ6+1hPJKq
	eHDzG/OFICsSOdYWienbYvqTcNVgFVo8HtGBg3awL3ExZIiwG0+c3WB3aEtH9gY=
X-Gm-Gg: ASbGnctUi1k/8hSPIA7TJHgpBsFEeSLBTPk6oeu3rhnN45CULWYdYmPDFqTMqyYcQ1o
	MV7eKzZdNyf+lpszJSMOVserW97HBSHXjL8ESn/62gOgfQrL14qU2G5FLWLjyD5kPt12Wg8+IR5
	X0g0J2RjjfXveltZEOoBg8eX0boZ9ittnLxXO768pEPSEn25l/w5R3whXP/ouW1FQ8bKu690Yws
	C/V2RQltZLtDD6XuPng5PwMCa7fjOxH7mFwb4/qq5V8rMsLEpjs4QhoductwRTAnAbap/M2pX6z
	XxRwUwgPX0KyFVjRycoQBx0ZpIF02BkrZcF0ajEmtbW0mpve8ZHeEqaNyg26hikOodkARg==
X-Google-Smtp-Source: AGHT+IEOhbCyRIy/amHn54GYprGgtCI+ApabyTh3ms9DkRPaodKNkM4sNUXh4kEaUnWGJsU5K4+dKw==
X-Received: by 2002:a05:600c:b8f:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-43eb5c2102bmr68490445e9.14.1743684177811;
        Thu, 03 Apr 2025 05:42:57 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34a7615sm17312505e9.9.2025.04.03.05.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:42:57 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	pierre-louis.bossart@linux.dev,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 0/2] ASoC: codecs: lpass-wsa: fix VI capture setup.
Date: Thu,  3 Apr 2025 13:42:45 +0100
Message-Id: <20250403124247.7313-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

This two patches fixes below two issues with the VI setup.

1. Only one channel gets enabled on VI feedback patch instead of two
channels
2. recording rate is hardcoded to 8K instead dyamically setting it up.

Both of these issues are fixed in these patches.

Changes since v2:
	- updated commit logs to reflect the issue.

iChanges since v1:
	- add missing break statement.

Srinivas Kandagatla (2):
  ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
  ASoC: codecs:lpass-wsa-macro: Fix logic of enabling vi channels

 sound/soc/codecs/lpass-wsa-macro.c | 103 ++++++++++++++++++++++-------
 1 file changed, 80 insertions(+), 23 deletions(-)

-- 
2.39.5

