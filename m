Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705AD239E78
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 18:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746816071; cv=none; b=YBIF1DBWOxFDRDxAuyFUygialOTVC1NGifIxVvxdGRYDw3o0vIhcF0gQsgZ91uax7LPKJK+iC8Kgnov8/Vi40HkYfr9fNrgRYM1iJ8WicwwcmjV2FWzNyn8Ycnt0vJ/bjVyuRXaNrH72gtu/xRvKbD0ZfUFdtpqRaGolkXbYFYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746816071; c=relaxed/simple;
	bh=LgF5BtBmfpeEAq5nMJcPYE0NWNHuMEL3cucPPBu6hWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p/kg4RAJal0GOlkZi54ijRfksoTrkTfzAiHFPht753jNqzvg6oCxRqRJRBO1eV1PEtiiFx7y9Zwp8L/1BGs24BHUKM/dJFNayhHijuB67um0gXVTmWFq1OZHntYnbl8M2n63IwjeIVfa/5Z54G9Cs7MtabksKDgoiO5WaP2Erqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=C6Cf05nh; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="C6Cf05nh"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so12822035e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 11:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1746816068; x=1747420868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7xH+8c9IQ/eMw6xixEvFtV7xITokTNj2ogMwiKa5uM=;
        b=C6Cf05nhNCJjbvEsVYuE5aFzTaeikmpl8ajkagMnTkI5oj7x4jZjQC1xMR1FkikHul
         u92mm8Jx4qtLBbDUbYqxx4MK1kjM4kkcvUTiYHBQN/G+jYp7PYJ4gkJ0OgLjqE/TArDE
         vpI9oPB+O5H0+BJsPRAa17z6O3r+Cm6yILTwDbhXpetZdAGInOSlPnO+oxJAlFj9PO4c
         Bgoj4v7EPMNg8oDl29EWUncW3KmI0gJN3iKHmad7JKYo8aeHiXJWKpYmhnp2UbtiSsOU
         MBnd9aNPtKxu03jgoG40f45VK8dZHkPwYccLh4SMco+Xay6A/EF1IIy4lflaMhR+UhEx
         aNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746816068; x=1747420868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J7xH+8c9IQ/eMw6xixEvFtV7xITokTNj2ogMwiKa5uM=;
        b=pZ+X+Xwd9z071VGt7lCoSQ4IFv/+2vH8OEJTWFG9RfA47IJIUdNXTbKesP0vGdmj1U
         F4TQPvJIyMzOGpC9tdEGFzk28oN6OPMLdA/6J3YTa5q0VxOdum2k1T5oK4WmziYhCx9A
         xm3SCWELV+ghdRt81p9+Dw7EvoRi8CXUIJoJVPUfLU0MGS6ymaabGs+LUDYBIKkhRNkh
         nGM/w2LDp926se+XbEmb6eEGa/oX5qbBc+bXZTwIwd6eofX46cGrt3opxD4nfhyj3jHL
         MZJdWecJpIt4NJh6z7zOmakE8uiLv/dgEcD2E+NpmhIKEjq5Vtq26CFDLZTl6gdF0CH7
         xm0g==
X-Forwarded-Encrypted: i=1; AJvYcCVtPWNc5DcS1VNZ+umPHRajLeYknHo8ICXkXX2EjRZS9Tfe9KVsL7z3CBRY8KdMlodOEkqImJmkSW6xcZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YygdDLg6B+IAJKk67jbDbMlye37OtoeQnh4l6Q5yNAScHeSdMGw
	T8QGkkevUrQYtgN/5Mentm3VTv9s1XQVmh1VrHl2YjYVCZeHjsYVGvPKLv4uz/M=
X-Gm-Gg: ASbGncsyLmml8KGnVWz6Yejm/ShXYMUbpF11Teu1KWZtv3t6rweWQ9YHwrt3/VOIvqm
	RdH8fkU+GuWDt8sUB2ZoppzGa0uU1NmET30Bh74PFnnmwdaeDr3qplZyBypQ7IboHiKqYsitKuc
	DisdzQtZPECT4fSpBs//LyAmpmQjXSlFyELA5FwqLvI6H8/RyqUJTJ94RcrBvAWFSJi+nH0RzN4
	uHuA+917oGP3lfNXxQ+uS54t/l19SvnvT08K9qAZ/573T64GEi/xwP6k6R5rph/TNdP4k4xsV9t
	x5r1nlrZpqxUZ/pg4Mk+K1gNFSpEygyxbpIgqmzAb3ySVXpyYCBwIMIVD7P20wVnBzSTb0cquEP
	y9UXpFymcmGByhXs02xH4dgbnPDjhYMrSjtmCQdiruRvPTr2VtKjUjAaA7dcAdQ==
X-Google-Smtp-Source: AGHT+IEzxzujGMd8NyxttjwFQjGc0xzB3QFdRjoydO8AuIWtcO29Kaq/G1I0ZFKFFTLzQq0b8NjSHA==
X-Received: by 2002:a05:600c:3b85:b0:43b:c5a3:2e1a with SMTP id 5b1f17b1804b1-442d6d11fdemr38097465e9.2.1746816067774;
        Fri, 09 May 2025 11:41:07 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df5ecsm37756915e9.9.2025.05.09.11.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:41:07 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: ebiederm@xmission.com,
	serge@hallyn.com,
	paul@paul-moore.com,
	jmorris@namei.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH] Documentation/no_new_privs.rst: document dropping effective ids
Date: Fri,  9 May 2025 20:41:05 +0200
Message-ID: <20250509184105.840928-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <87h61t7siv.fsf@email.froward.int.ebiederm.org>
References: <87h61t7siv.fsf@email.froward.int.ebiederm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Usually, execve() preserves the effective ids.  Many programs rely on
this to detect setuid/setgid execution and will disable certain
features (such as rejecting certain user input / environment
variables).

However, if NO_NEW_PRIVS is set, effective ids are always reset by
cap_bprm_creds_from_file(), but capabilities are not revoked.  That
means the process looks like it's not setuid/setgid, but has full
capabilities, and is effectively a superuser process.  This breaks
userspace assumptions.

It was argued [1] that this surprising behavior must not change
because programs might rely on it:

Of course, this leaves many programs vulnerable, but if we decide the
behavior must remain, we should at least document it with a warning.

[1] https://lore.kernel.org/lkml/87h61t7siv.fsf@email.froward.int.ebiederm.org/

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 Documentation/userspace-api/no_new_privs.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/userspace-api/no_new_privs.rst b/Documentation/userspace-api/no_new_privs.rst
index d060ea217ea1..89b0884991e9 100644
--- a/Documentation/userspace-api/no_new_privs.rst
+++ b/Documentation/userspace-api/no_new_privs.rst
@@ -29,6 +29,12 @@ bits will no longer change the uid or gid; file capabilities will not
 add to the permitted set, and LSMs will not relax constraints after
 execve.
 
+A successful execve call with ``no_new_privs`` will reset the
+effective uid/gid to the real uid/gid, but does not drop capabilities.
+This means that comparing effective and real ids is not a valid method
+to detect setuid/setgid execution; the proper way to do that is
+getauxval(AT_SECURE).
+
 To set ``no_new_privs``, use::
 
     prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
-- 
2.47.2

