Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993072459FF
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 10:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744193058; cv=none; b=qczJ9odNtE+dJxiAZ48PvcrQnnZN/SU1lhSQCJIHwsCjrCxet1IeTolBOc8g8LQOsjhSjxo9Vd2D021oqcudcMKRQqIdhZRDaLOD5ImJ7HE+RdU6mayON8dQbLNZyszv8x8cwCfIAuNqzOKCo+/kuWhwzageIm4+ogNT4ODg82Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744193058; c=relaxed/simple;
	bh=YLY85+aEoNfSVC2HitFUj4mOJGwNfEmC8mgtNUqmfbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KaFnWHmny8gVv40jX6TG6d1rnwmXeprPWiJ8+rQNcpSktGUKclbyDWikJeFIx6B96RI73JzO5bfALtXFZfB2B7LHProQ3198tgY9dQGqdFVqvgX4oYs2W+O5SoDmUQh8LotgY4W4sezmjProgKQ8pZPMoUGCnoUGCoQiEjIE6SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUvli6NE; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUvli6NE"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3995ff6b066so3572716f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 03:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744193054; x=1744797854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m0f4x3Zup260IsKBz1eH9LKPwcNpgqo4pZi6j8gWVw4=;
        b=KUvli6NEjj9e2D2hjtfbJv6CAg3NnUm6RdzRZ+9PImVPsIcXoT7CUFHZaIxCNLMszV
         riaGwrh8FJn6tJZyEre/skT1UZY6QGrFg5KaGWOgyCmis51ZR0DBSMjyj2O9lIeahaUr
         vQL1cFSWAR3CRcjFuU0EIHxHSJ3uUnNfdvyNg1J9r7X0YBepdwiYecyoUci1vLXEhIt2
         qjYfXqURzDSkx6BBJXYiNce2VsZsEN5+M7TKCv2nsc045Km2G47niAQ8WRTSy2u6rrNR
         soxCLUOm9emB/jlP7D0H9qKpgpzBgRj5J/spY2YUqSA2x0anoNrYVP1Y/zyVpR8scTjG
         RPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744193054; x=1744797854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m0f4x3Zup260IsKBz1eH9LKPwcNpgqo4pZi6j8gWVw4=;
        b=CsiyNLFj/Zxi8gm9k/zjUCN42pMwCCCkv+sZQO4a9N3gjljvWgajELWk1Vxa8XMwI7
         i/yKH2ror0quWpNFEiZ1XXgn5FMn9lzsETJ0vyJai9fg7i0rd3W/vIJuiptRrMtUV/Qe
         53NlRA6zw0u5uqmwmCQZK4+1G/nCYRBI3FacoZ3jSw70qUvkANf0kzRKkZqSnvcmZjlm
         JZZ2fuRrx5Az6+maXbXguWMJvXccLQNiGjI7pIhhmQtRCFZAhYiHYWs5bE5KeA+dLiZ9
         4Ae4U9DPwsGuRemUvJ78+yC6KQ7R/7jLsCgCPgxQnzb6UN8PWl5ofrm6HZXOZOdIsbax
         LV8g==
X-Forwarded-Encrypted: i=1; AJvYcCUzPqDixDbQje6PYK7fq+EaZ96mzUVX5qFThZ/RrkqZ1i4wtsBJD6LnKUo7leTtRxJRdmpSXVKYiUyOHl0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/vFS60UXzo6zC2zwwHwbfaZbu+4yNEc1GTrdIOJ0I7XN1fUxH
	/mVd33+xoAOvPCLp0AjFpqfhwQUsFPwuwMksc7f6AJ/qBge0wAaq
X-Gm-Gg: ASbGncusefcB9LPYN42T1VyyjSP+Q2hKLVrQke+CDMF74yfpDHbqKx1Lim+icjGsqZn
	dAgkBKkr+Xc6n2jQOfKfJLYLFVcrwvEgF/+03jLPBoEwojsltM7H6zKSfewAUBwU/Mrcu+huSJz
	+38ZkRKdn3xS3b6jrE6RSq+3YfzPjNyKqF260U1nYrj2RoAkFCXR2VpAW/03OvSqljQeTrpxckB
	a1wXJ2/gGcIyyNSGUV+BueCIN4pTwktAaECIgJdQx0mRUzJDjkS4a3JYHllqBaRExq01pchJ/8R
	IaXeLMBsCKM8UkFcAIaKAOIn/s9/xnyYIWXThg==
X-Google-Smtp-Source: AGHT+IHOXkKXB241y9+td5oFHAZFEO0MlOveykXTd9mVNFPAUBq8YU3o8C+oP3KOpYY1Dmo/NsgZRw==
X-Received: by 2002:a05:6000:2913:b0:39c:1f0a:ee0 with SMTP id ffacd0b85a97d-39d88525bdamr1694768f8f.2.1744193053570;
        Wed, 09 Apr 2025 03:04:13 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f205ecac8sm14930295e9.4.2025.04.09.03.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 03:04:12 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Improve code readability in rtl8723bs module
Date: Wed,  9 Apr 2025 13:04:03 +0300
Message-ID: <cover.1744192642.git.karanja99erick@gmail.com>
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

changes since v1:
Avoid mixing pre-initialized variables with not-initialized variables
and handle an edge case where initialization is made to function call.

Erick Karanja (2):
  staging: rtl8723bs: Improve code readability
  staging: rtl8723bs: Initializing variables at declaration

 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 84 ++++++-------------
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 39 +++------
 2 files changed, 36 insertions(+), 87 deletions(-)

-- 
2.43.0

