Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D624A19A
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 00:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747958880; cv=none; b=b/Rc3lx83kXQ5BAgQTsDsGNIhO8XtthaMDSIuUAED5jD+eimO2fmLw195L7xC2rfyMB+bvDUuO7gXKNQEF9VjaJv4r/ARRbKLEGR//z+4kdp4dYG4W1z6Z06o85fjJLBdgekBCrZjlg8TOjcJa1W3havqyOS80QFc+//UsaYvCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747958880; c=relaxed/simple;
	bh=f8QVZMVblX+qS4oCwDMOZOZEon4xBt0rd3Buv0CJ31Y=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=V0WLqpUS8FCujDRqBk1Gkpr3USucGpo/jyU7dIHIQNy49MGiBHrh/z7MtdqlNdWON5E+fu9/0TQA4xVIE/rUqsZ0B8H9azRB0Q0hO5GQH15KD+3VuFfAxYiCvk9ft0gwyaerby/7hwkxRKBHIPJPRdb28wIXvqHxlegEcx5LrrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x5tDtvMk; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x5tDtvMk"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a365a68057so5380664f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747958877; x=1748563677; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V9xVtvlv14mN7U20hdMUeblYw5hN+2V2vd3EC7hDFuo=;
        b=x5tDtvMk2zlj6QtJ8J6XSgdt2UMF/TAc7CZZpGf1r4TtlLNxHxAah92gktSzuMQ3aW
         oldNGaYogwjcHIrIisbI08zU0t3Fc7nh7AdwrQu8srdyOb6ee8MCTl39mHf/AeKUhijH
         983H/nd8qJiHhr4BeZp7PuOLXgk6ZRide/mglbfrvTpWF0x3nt7knhMJezGYIHBqV2nz
         Ahl9vWwVQgyD2kUTUIE0OGcl2kbrO57xtgSqzy62oIMPuhmbbRBcXjqeIAAMRi8c9dp2
         SwGh2zsS042mORyb63wl5FTBaj4arJFtGt4kghpa3MFixwrmQXl9Np+XUnWMR8iD8RXv
         mQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747958877; x=1748563677;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V9xVtvlv14mN7U20hdMUeblYw5hN+2V2vd3EC7hDFuo=;
        b=gbn1TprtaQ31XjURzDbIh1YXJPrKP5y8/enJKQGazOLelB9uQLb7u5J7/QlcDyMuNl
         SZ+iNcX/GjW1GkSkj++dPi6IhMfOZublhW8JMZeuYGa4qKxq50odyWy//b8Cr7l9dukD
         XK4afUc7B4CMt5bEuSA0OAKlEOyM71kT06sk3iBNXGYxw1RmmYr3eQQH8vYHUoG5AuvM
         iSERym1jf9GX/47rL2vdJSkkmPR7r+GLIHrbDFwzkX2rq0r2NVFF2YghCXsOe7Uowo3z
         25WKi/qdilawJ2iuMksplc7m4B+3k7jxsiUEV04Xs/4cSlGpvEoKtIIyVE01d2c7OMuY
         dGGA==
X-Forwarded-Encrypted: i=1; AJvYcCWawVtDPAoV1mGwDvAepE/DD1hpmpCBLV033h3MCzxSLAJ8nryXFJk1EHUCGJCdsDe2VYfedN5lxTq9bcs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoAzo4rsWS1T3edotTZY5ICEkrH9OtvnxjQgpPkS2j1RpszRzR
	e1zI5cftmEu1OMZRhNaFgksReV7MZNwq4zPRkB6ZeIP+bz/FkcloC0nq4JOgnpCoiZpM71cLSjO
	LI7nUY/hWNLqCn5WzcW4Yg1cK+AxInWjFqr2cVRBVpGm8oNvHNAHoBkkO6Q==
X-Gm-Gg: ASbGncvGanbJhb+AbNEOGL7bQdHxf1uFzglW3fcblWEa+I4IfbCGyL4YSjPQAoaRJvC
	D72DiM52VwQVKsZfmZLVjxhZnFFWTmWdm7iHsEe8cSS6wjV0UF5wp4KL7oxaKCQej1dRbaEfxye
	/E55KVlmJAHEC0Qu4Rnnaurg2yOYl5XIYQKtFho1PEdHbTARdse8g=
X-Google-Smtp-Source: AGHT+IEoFwqicwEfiuIdcH0/esFh81hFsIk0emOkxWyID8RHGKL9vHSI/sLvVbFjqt0QC+1GWXyqJN4xN6rYGu1q5E0=
X-Received: by 2002:a17:907:7b96:b0:ac7:3817:d8da with SMTP id
 a640c23a62f3a-ad71c144d5emr65091466b.52.1747958867020; Thu, 22 May 2025
 17:07:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bill Wendling <morbo@google.com>
Date: Thu, 22 May 2025 17:07:30 -0700
X-Gm-Features: AX0GCFvALJXtJpI87dxOAmPK8ADw0QZjX4yUGyKt-78leZLg7A7GWPbL1V1pFiw
Message-ID: <CAGG=3QU5Yi2AfHS_poi8SgmatedRg-X8Ct74FOCJUc9iJNPnhg@mail.gmail.com>
Subject: [PATCH] kconfig: check for a NULL pointer before access
To: Masahiro Yamada <masahiroy@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

The call to 'prop_get_symbol' may return NULL in some cases. The if-then
statement accesses the returned value without checking if it's
non-NULL. After inlining, the compiler may treat the conditional as
'undefined behavior', which the compiler may take the opportunity to do
whatever it wants with the UB path. This patch simply adds a check to
ensure that 'def_sym' is non-NULL to avoid this behavior.

Signed-off-by: Bill Wendling <morbo@google.com>
---
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 scripts/kconfig/symbol.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index d57f8cbba291..9c5068225328 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -272,7 +272,7 @@ struct symbol *sym_choice_default(struct menu *choice)
  if (prop->visible.tri == no)
  continue;
  def_sym = prop_get_symbol(prop);
- if (def_sym->visible != no)
+ if (def_sym && def_sym->visible != no)
  return def_sym;
  }

-- 
2.49.0.1164.gab81da1b16-goog
