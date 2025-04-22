Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FCD214A8F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745327703; cv=none; b=Yn/YCllJEK1RS+1GFDhzR8JinN8FnaDA4pmp+/ban7PiJu90ELgpvDvvQFZZnXXrOVhuZovv2Covo1b45wQOVFeHk+BktRm+qMEpkMlQaIegMIqEC2L9WqInPspECj6zkbgeJMf9cBkdXaIQEooO3OpUHI5mVWwrTPdfpA0bPks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745327703; c=relaxed/simple;
	bh=fL/yp1WdeSIx7QNu1lKSNKNnEMcCk+px2J5jWYgn4yQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B+kVGILFRezRazrAzHhPsutQfXLI3Z2DFl97F5GlWkIaFQqQCvVbSs1TkBFaTfuRDindPPoYMYbmrhPsYua3VV8tUMI/yF9PYWiKD8OzW/IzOaFY3dAtDLHpxvcumZH8AwvZqWsP8ScBezLRdzyNnoHB+Q1jDnGyfzdg02KOS3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+0+Wf6N; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+0+Wf6N"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5f4d6d6aaabso7290950a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745327700; x=1745932500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xvkW2QYEsSaLwERWuQdz+pmfthFFjasiuRXf1DERhYo=;
        b=a+0+Wf6NhUUVKV4bkR4i7P41pTRE31gQZOmu1+9mdLvscF75ERc6OsTJcOEbiHvqdZ
         AYeZ1fgCvnEtw0BapmEJhG5QI9jUdt5+kCL+9kQZd5GyF/Rx2vQAUXcq3YEDgqmksg1E
         1lyVTPjyciSrooan84XM5EISW+LdNWrzZJ9uP7KeB6Ye/3GwMIgdVF1UWwIAbz/229Te
         cHFfcHVJYCsIbFiYpMkN5qjlZ+cJXsDWbk27QyoKuG6pg6Wl+zLDXKIWfQeHihbi3dt8
         7ea9bFSUEkZk3tpu4KWCVVnRcxu2TwP0mwCbsQ6awEOUl0Zv3efsnu2H7JN/9LZfURCr
         87Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745327700; x=1745932500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xvkW2QYEsSaLwERWuQdz+pmfthFFjasiuRXf1DERhYo=;
        b=jl9syFZb5g5MWXu868cpifiB0Yw87RzCxCxRYq+dgDpUVO5Fx7Zx7ZPjttpzHI+6oz
         /HufKy8JSiQdzl+sdGveepcCnBL/tIYh70+qwPKatQRj668Xi0z41HDxxLr/KZDv+n/G
         eb1zO8zbpX1b4YYFGPs3P8dlSvT0gNx0E6lcmZun6QdmYlL5PpWHJ9KD66GEYg8Wb+ah
         SOD2wanbb07gab0CZjqcPse3SxtKX8VW5jKKpUa0e+jEN3LTe6j3krK/pTVasi8UYA2f
         4lEYL5FVhNZj6r1sdp92LkwwuN0QAuHdBNz1wbxsE37GjKQHRVZ4lR3MJtX1foM3RTxJ
         QA6g==
X-Forwarded-Encrypted: i=1; AJvYcCUycQHp3tw/nFsu6KpZu5ONmr8BzCZ9+pKxJ65mveNgvhxv7+WWKfzRYKOag0ZP/p3RFlGdiBc7z2NgosQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSGBdrd1UYBtO0Nnm+KjgwUedvQf1LjtdhjeUpbSew2vmyZQX9
	uZmiuKe4vzSl71ve7cvzfPgNyqD+wGZ8Br+vuIDSXYLIqW3vOBp7
X-Gm-Gg: ASbGnct36Pur4lezYKZvNb+tDNE9TAd4Uc/kSa4AEPEYUp9xyOb0hPC1jt0Igzh67xM
	aJDyYQULgw9Zp7Ju+SZqLt1NECjBhMBG/yBMkZzWkJTMcASRJwelTBaRI/ZET/m/Dt/YQF3pmZX
	nkY4yFkvFPMtOVeh1jmHn3IxzjKTa2FUjebHnISJ0fNjRDpV/9zEV8UgxElYUB1ux9VMmSyTS4o
	GlP49t3OurKE/wA3pYsw0tLB6B3bAWC0oicztPuGEeQTeTU+yHLlbu68mwYdx+UrwfeY/QTR4hu
	o5b+ju7VBArQpTxGuxcS+PvyObsoz6g4so4VYmpm9y3jWTX//93WYG4=
X-Google-Smtp-Source: AGHT+IF2m4DSYZeB1gfK1GHbKOzs1Wseci5l7jt886dSGFln60vGUq8pwcCfErNmrLsd8tCI+AupTA==
X-Received: by 2002:a17:907:2d1f:b0:ac3:26ff:11a0 with SMTP id a640c23a62f3a-acb74dd05c6mr1456346866b.38.1745327699438;
        Tue, 22 Apr 2025 06:14:59 -0700 (PDT)
Received: from msi-laptop.thefacebook.com ([2620:10d:c092:500::4:5298])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef4799bsm659441366b.149.2025.04.22.06.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 06:14:59 -0700 (PDT)
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	andrii@kernel.org,
	kernel-team@meta.com,
	linux-kernel@vger.kernel.org
Cc: Mykyta Yatsenko <yatsenko@meta.com>
Subject: [PATCH v2] maccess: fix strncpy_from_user_nofault empty string handling
Date: Tue, 22 Apr 2025 14:14:49 +0100
Message-ID: <20250422131449.57177-1-mykyta.yatsenko5@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykyta Yatsenko <yatsenko@meta.com>

strncpy_from_user_nofault should return the length of the copied string
including the trailing NUL, but if the argument unsafe_addr points to
an empty string ({'\0'}), the return value is 0.

This happens as strncpy_from_user copies terminal symbol into dst
and returns 0 (as expected), but strncpy_from_user_nofault does not
modify ret as it is not equal to count and not greater than 0, so 0 is
returned, which contradicts the contract.

Signed-off-by: Mykyta Yatsenko <yatsenko@meta.com>
---
 mm/maccess.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/maccess.c b/mm/maccess.c
index 8f0906180a94..831b4dd7296c 100644
--- a/mm/maccess.c
+++ b/mm/maccess.c
@@ -196,7 +196,7 @@ long strncpy_from_user_nofault(char *dst, const void __user *unsafe_addr,
 	if (ret >= count) {
 		ret = count;
 		dst[ret - 1] = '\0';
-	} else if (ret > 0) {
+	} else if (ret >= 0) {
 		ret++;
 	}
 
-- 
2.49.0

