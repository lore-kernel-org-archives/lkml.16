Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8924E204C1E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269122; cv=none; b=DazHZOWzlB3aJnNtSF6R/OA5UaZU+PJYx8PR+JZTN+7uFcMUd4ng63C+WBBwzAAnLBYHV7G5POXMJ7vBNsaS8ISuiCIIm4vsrEnoDorMKUsp/gUg+O9A54GhfGx5ugqahxd3B23LugXo6R3soAS6fiCGj3+ctY+jBfk8UGhpCdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269122; c=relaxed/simple;
	bh=qdUhPT6eGfT0vIbSxltjK0R9yFEXKwiQasxtehgDHDc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MKdkf3LmvL+3KP2XO8RbvK4XXdBRXo9tqJ5GC4ud531sMccdv/mf9l67o+R+u79QGSz9LuKYnyvOIyJvTI5eFKYDvaEpde5kJqmP9KchUYvwlUtzpxJkdBd77GT77Owysl86/fo77eo4Rl2c9w073zA8orAb2RnJoJvMoR188VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hUsiNP/o; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUsiNP/o"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d0618746bso3227745e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 00:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744269119; x=1744873919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ondpv9wHHmTYRLHYVY0yID7V1+30O6BjyrfMe2qOvA=;
        b=hUsiNP/owNFZV/LBdlmmeibOHow25HzPe1nitVJvo2LQyazztclZmEwd/i5xE1QTJd
         3uZOeKqRocB7RV76LUv2Hz2UCqAu3M4YFJzmys4FrDKgzfKVX52fqn9xBQq4xQyYaikf
         3z6NcERZxi1FRL0AW1NYJiHtCotek1wuvl87jhD7p8wkKeTeXiyXO4Duq0Q+JSkYY+8W
         NlFukwFBVezIh3FbNeWuLfNgpcXaB+VS2wjnzb13xzYSJgpNgysb6Cm8dtdBVRD/CSr7
         BQ1cFnL7WKryoeB50u185NEkiY55E+suUWyONVFXZm4OqcGckOxJQ1jHNI6H5DY63VIa
         Ec4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744269119; x=1744873919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ondpv9wHHmTYRLHYVY0yID7V1+30O6BjyrfMe2qOvA=;
        b=r+dQZDtsqnJQpcQnkH6o4il8SwTsILyezLSgBLPi3EsRs8xk2v1AsFqin62a6MhaSZ
         bDiAAYObDFSownoFGIzZu2CjcD5Uosh7kPjFJDsAt4d5lYjbJtqA3+Znnx68PMaN1Whc
         9wfv88L6GHXqJpYXHgnfaCRZEh7KqxxsI6N12R6CKFd3B1IwdNn6kr6SCRWBas9POHEt
         d1DqdxPioBRa3rpMsliqyajVoqTQ6JtaOfhGAkS1mVYFJOIivH99P0QoS8AGS2IjW5PI
         MhuZTtNWtz3Zh4JvClCoh86az/h8jwlj5gqPR6g49GKC+C8QpUqb8BGg/F/En8fRdDjO
         nlLg==
X-Forwarded-Encrypted: i=1; AJvYcCVb4kY6vmknBeV0SMEh6bkdrblWjFWWEVy9FHqLw6dtm3uO9jloFmR7PBskDsUcqX9lpzwwLZHlKLQziq4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh84Qat8gJMSU6DAzT0nVDVlW0ATcGc3em7sq85KgqAsnOxvTz
	B3o0khymvDF7xfIHfjoEaQ9j1V6lqLgFKU3oY2j0UQxH+Z1fptnw
X-Gm-Gg: ASbGncsia4yfs+8XPss+ZKgVDJ0y3OJhBiIkOEr0+oOFtZS0AM2U/NYIHkQTA+r68aW
	wvn0BHw6C3vX4XoFSQ5q6uC6KCnKo5hqB3Vmr1A+GOV3bk64ETP8vDpQhAQxMb3LQV1u+HdeZLU
	kAQu3NjbvbLV3Zb8k1+GJzOHctIUbQjGePEUrErIbIWYDSgTM2cMWHeznleaLftDpQFVaRmS8fx
	H0hYHbQAmQsyalFm/JnvXKQTgmCh5HCCMgnNd/XCj4lYvplNk/+45lxMHhPJHPNqGPVm7cGQbBs
	oD8CckJx9zntss8coyZIOiKsCy0uFHRNbVOYnw==
X-Google-Smtp-Source: AGHT+IE2t23L8KCF9LY8XznMfXd0MrqX83Ivoh9mbFLU7queTYe+OxbqO5gxjP5+x7MP2C1m53hiLQ==
X-Received: by 2002:a05:600c:3512:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-43f2d7e9229mr12823845e9.19.1744269118691;
        Thu, 10 Apr 2025 00:11:58 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f235a5e90sm40831765e9.38.2025.04.10.00.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:11:58 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Improve code readability in rtl8723bs module
Date: Thu, 10 Apr 2025 10:11:49 +0300
Message-ID: <cover.1744268316.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patchset aims at improving code readability by initializing
variables at declaration.Key consideration is made to ensure that the
code is clean, maintainable and easy to debug.

Changes since v2:
Avoid refactoring the code in instances where comments are left dangling
and in instances where refactoring introduces a checkpatch warning "line
exceeds 100 columns"

Changes since v1:
Avoid mixing pre-initialized variables with not-initialized variables
and handle an edge case where initialization is made to function call.

Erick Karanja (2):
  staging: rtl8723bs: Initialize variables at declaration in
    rtl8723bs_xmit.c
  staging: rtl8723bs: Initialize variables at declaration in
    rtl8723b_hal_init.c

 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 81 ++++++-------------
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 33 +++-----
 2 files changed, 33 insertions(+), 81 deletions(-)

-- 
2.43.0

