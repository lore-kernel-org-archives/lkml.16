Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DF6B665
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 22:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744066798; cv=none; b=ZJRK6NHaXCuKaX5MwUw+4nKYCNJaNoBOs3x7lpzUa/jsQ7bI/UKKArRtwj7+Ih51nxJ5RVtkCbk8iqyzIg5d+/kE3GWi35p+qc2L4cCoDvMVSNSa5mqgz5/Av1O1+K+D8Y0eTv0mpUZrBIafuDUlWZ8xEyws7jkqqAgJ6xMGr9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744066798; c=relaxed/simple;
	bh=5LbPyCNLLcTj5RpphsHDzbLID3Tqav0FNxp4F98aH8g=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=DtZBFchYHIV8ty87cMIPZO3nnvw4ZOHL3+IbRUYEXclILny5M8vIwxbAGyBwWjwkKMnP7CtosAOs7WJCBPu/EvdbAkigsv/Y+3x4g9Mz6qrsyzqqPpc5n6Z1pGDi9halYwMKIi7DpQ6uJsBEkdJhMlJQAA3HarCMTsd7gV8Wvlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tsEbvlNy; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tsEbvlNy"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-af5156fbe79so5442637a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 15:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744066796; x=1744671596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tmFTd+75mDki530ZTm5rh5SILZIWEG1jv3Vb3IWwElo=;
        b=tsEbvlNyehmbqFR4/suebCqNArg3BU9GTqqBnvYKnkF3RtVx0gkeCGzc5QtIKQdbCT
         IxyiyWrcZ7jlNnWqysXej/+JE1DHCDLwk4nrtQ3GL7Ca4OIi8bPhzkD4CB0txJec78Y1
         +6AFNEn9zBn4Y5ZfWsgmcutMUosASvXBzf46J8JknADoDshrgwqrxLObzHQ3ud2Pn+zx
         CKwIPe+/dUHhhQKdQZiDRm9PyJfhJuedllMctpUL28VjDBUy/Pb3gip9CLgFHmbnt623
         ndaP0FGTsXCaVKveD7oTXOKSmEixvjDt/AUQh3EFbEPuYxow3nonJV855qp7TQcp2u5q
         UXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744066796; x=1744671596;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmFTd+75mDki530ZTm5rh5SILZIWEG1jv3Vb3IWwElo=;
        b=pzv66X9j0pPOfddoEMEq5hXwugryjyXOZB3BLwJUc5ZDPgEBlp/Qs+ib7eQZ2G5C7Q
         mGnideJwRxqSsVSWw9Z2N1eVRFgrjQdrGL3FE6ID/yhHPJWt7+z603yUFavANQX2hz4y
         vK0Q8xhSplGHRGR7ANVEQw+yyYX56zBTe7lx6BNIELxGH3GOWd4vLuSm+SI79cOgYHmj
         81HFEH26OVfj2PvwrAKJHPbZwJIqQXRpiU9MGJGssb7uhMh97fB0MNLvWAbug/Yci3JY
         3e+GafMQgZVecU5+ZgdXkBp1gVBEiPMmmn/Co9srWR/4DxuIKa6tQjZt0JpjJEqADQn5
         HkXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXp4v30uZ0oyOBtIICXQRR5PcL3S5bm56YEYtpCk8g2nXTRKRReySYSogPigOtKMB/Sn1GIiScrz3byZ5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyOf7KXiqzWO9GQre5SbwoWD0ije/lLi5ZNeDBKo+gnjP1FgvU
	9X3pkI24x1XRw3T7ToUjwrm669KWMFXcF1vkrpWoZ+AGQeRwKj6w4zIVBRbOkVxWnBTr13CryN4
	uaknwlfjYKFZuHQ==
X-Google-Smtp-Source: AGHT+IFskHOxsSaypr7Z498msZSpofqWjjn89muNo0ISrDKVaEqeO6DZKPcTGrC/EZ6umNznNFtR46hyuWZumVA=
X-Received: from pfgs3.prod.google.com ([2002:a05:6a00:1783:b0:736:6fb6:7fc])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:32c1:b0:227:e74a:a063 with SMTP id d9443c01a7336-22a8a0a3a2dmr182684035ad.37.1744066796203;
 Mon, 07 Apr 2025 15:59:56 -0700 (PDT)
Date: Mon,  7 Apr 2025 22:59:51 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250407225953.1540476-1-tjmercier@google.com>
Subject: [PATCH] tests/pid_namespace: Add missing sys/mount.h
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

