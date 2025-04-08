Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774654A21
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 23:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744153352; cv=none; b=CdH+N0SZiQG0QdjTlOq/0SBfmUXjEchnMnVu9npUXqMYdhujxapWoX1CvAWNWfXmDUbnMzJH6pGBcPNrJHKzdMVUW2WbzYmY0nFRiqE0Jt/hrqvrpBH09x/sj+5n+jNZaHcbt5111ehfA11vq1rIW+qSO6eG3ywtLolGTUFXKtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744153352; c=relaxed/simple;
	bh=5LbPyCNLLcTj5RpphsHDzbLID3Tqav0FNxp4F98aH8g=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=MrY68WgRdxwoUFBRi7CX0O3DbS+AmQuV7JNfyxPQAis2bem6Kov2qw7stwgDEWTSP09FXbKVNd/U5f4ef/hbPHqHMG9jk1k5DqbbXlNk3YrYkdLrrR0XUwMh7OjzbqGC1hl6S+BTK/oM11xFzdG5wvGrB0sGP6M4SxTmRBWDhxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EaygwAfW; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EaygwAfW"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff7f9a0b9bso5621346a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 16:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744153351; x=1744758151; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tmFTd+75mDki530ZTm5rh5SILZIWEG1jv3Vb3IWwElo=;
        b=EaygwAfWOeYpWYKxXBPPt7hPqtpYsLfpbhKMcYkOFQJrtXfOqCdBYLwKMrbyVTwpth
         Ij+dmSc1d6Yl2BxKnaBXpq4RMOHQH3kSQmjX7W581Kv+BWoVuL7Q/L/vLA9tuLdnTzCM
         HUPVTVVkmEyXn8OjkZgOiylYtyXJzkLg1Rz5CMcMmstvEnkSgrInQOujAJmyWSpUrgRb
         hzDgPvI9Jzx0JSCxGiErSDMOQaMHSCo+giPl7w9Sax9eUWWietk4bOz6Yw304PrJ1f9v
         ibc/2qhL7tTKDPsbg5omNy+JbRZHZKDV1MP17jiCc5faoU9wNoLlwqMccq9rzKXQEefL
         pAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744153351; x=1744758151;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmFTd+75mDki530ZTm5rh5SILZIWEG1jv3Vb3IWwElo=;
        b=nyLIbs8/AAOMJ6EENx7H7L03yIZlhGpbzHXJCX2Pdf1ju7xamVOMpHgKYzVv3JtVUR
         8HSdC0YnB0AUlfIOTTaRuzXpQ4aux0kZYS1C6OIPzvZlx6t3z0mVytTHgt4Gta/vv1BB
         HYAQhFy2gTa01aJQtKZf3VCqP9j5ibHHJ74ViHLUyeGWvO4IiejeBQH7dF18HxHGmxPF
         tRETDkFmbRyS6AhLDFF/R1gkjUPXJ255Zin+YSZEVvjCs45qqZlekQR2m6mgMTN4bcTI
         yf1ayU40/+N73bTkEQ6cMe4erUCBSuidUObVVb92rDyDAkn9aeJMNOBeczcsv6n/6RT/
         C3pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdIJhbkS+ToJlDWXxGXMQMhj2F/l8X7TY1V4DqrtPXuLNl6VC6pf1EUssCo2/f7Fa8Q5KmxcY5U4aFPiU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxwEYw0v45sOYO5oaIGjRAYF7nIFGH2CHZQHR6rAjz1wwkoAGr
	bavcnvgk3IoIxmMlrZ6ybDbG3MCdHce0oVgMmac1zzFkmmITflSEVHh45ohctA1cMg+i0qUnsGC
	lcP6UxB/iO8fG+Q==
X-Google-Smtp-Source: AGHT+IEz/iinmz2aUN8NGTDBu7wDgRygobnaakmTyndIcbAs2iIys4f9fIOWuulr0+mK4GNl5Vsi7MJhQlasP0g=
X-Received: from pjbqj15.prod.google.com ([2002:a17:90b:28cf:b0:2ea:29de:af10])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d64e:b0:2fe:8a84:e033 with SMTP id 98e67ed59e1d1-306dbb93007mr1166983a91.2.1744153350776;
 Tue, 08 Apr 2025 16:02:30 -0700 (PDT)
Date: Tue,  8 Apr 2025 23:02:02 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250408230204.2775226-1-tjmercier@google.com>
Subject: [PATCH v2] selftests: pid_namespace: Add missing sys/mount.h
From: "T.J. Mercier" <tjmercier@google.com>
To: Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pid_max.c: In function =E2=80=98pid_max_cb=E2=80=99:
pid_max.c:42:15: error: implicit declaration of function =E2=80=98mount=E2=
=80=99
                                       [-Wimplicit-function-declaration]
   42 |         ret =3D mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
      |               ^~~~~
pid_max.c:42:36: error: =E2=80=98MS_PRIVATE=E2=80=99 undeclared (first use =
in this
                                  function); did you mean =E2=80=98MAP_PRIV=
ATE=E2=80=99?
   42 |         ret =3D mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
      |                                    ^~~~~~~~~~
      |                                    MAP_PRIVATE
pid_max.c:42:49: error: =E2=80=98MS_REC=E2=80=99 undeclared (first use in t=
his function)
   42 |         ret =3D mount("", "/", NULL, MS_PRIVATE | MS_REC, 0);
      |                                                 ^~~~~~
pid_max.c:48:9: error: implicit declaration of function =E2=80=98umount2=E2=
=80=99; did
               you mean =E2=80=98SYS_umount2=E2=80=99? [-Wimplicit-function=
-declaration]
   48 |         umount2("/proc", MNT_DETACH);
      |         ^~~~~~~
      |         SYS_umount2
pid_max.c:48:26: error: =E2=80=98MNT_DETACH=E2=80=99 undeclared (first use =
in this
                                                               function)
   48 |         umount2("/proc", MNT_DETACH);

Fixes: 615ab43b838b ("tests/pid_namespace: add pid_max tests")
Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 tools/testing/selftests/pid_namespace/pid_max.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/pid_namespace/pid_max.c b/tools/testin=
g/selftests/pid_namespace/pid_max.c
index 51c414faabb0..96f274f0582b 100644
--- a/tools/testing/selftests/pid_namespace/pid_max.c
+++ b/tools/testing/selftests/pid_namespace/pid_max.c
@@ -10,6 +10,7 @@
 #include <stdlib.h>
 #include <string.h>
 #include <syscall.h>
+#include <sys/mount.h>
 #include <sys/wait.h>
=20
 #include "../kselftest_harness.h"
--=20
2.49.0.504.g3bcea36a83-goog

