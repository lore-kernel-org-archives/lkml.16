Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01496158520
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 14:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749135100; cv=none; b=BggXBJ8LdrwaU3Ll03gP8fcJkLqQRh9S/7FjHdNG9Xo94AzBscULpvEZGx8dCoVlZvFVBdfSn8e55gKMV0DNuV92Qef4esqZJnnS+hKhhGXRw5v5u6nqnffItAel6xTlVYaiTluFBrBK9mEd1yLbq06cvldYijG9k1eIeaWBwRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749135100; c=relaxed/simple;
	bh=8opYR/RLHE+c4NG9PfiIatcqdYIIGlAtUPp/Y7mK/SA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=WfCQwpyyCK8qt27sIFKjsDCycu0sv03iKbwPYZbyOPBWwU6XnI3GVTsqL/HoYLp/3jEqnlqgi6Er7ga/iKMKbsmPEk81f8MtVV9+nzHb/cAhOpnn4Mq8efiMQgShdXqi4Sn//G8yBJpEXOaN+Y4VjKq7KkkOGP8w5nJQ8R2lcBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=ePrt0JgV; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="ePrt0JgV"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b0db0b6a677so768518a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 07:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1749135097; x=1749739897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0qZIyhLNfUK8aRt0IjyGDdUz2kW/fFohhjPr9dq+tBQ=;
        b=ePrt0JgVhqfQYTTmoGYfMpd1fOibsM7Po0g2kPJYRRsNT7UxFnpvyd8X4lb1e3ID4o
         plEOfYieBq9opx8nkCVgSTtZGqFZAdlDqQ+exp3nQH5O9RJNif77JxJrzFJh70+HB8++
         m+V0GxDUWiyCWwqyzBou2ouYZ+tSpOEuV1/mM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749135097; x=1749739897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0qZIyhLNfUK8aRt0IjyGDdUz2kW/fFohhjPr9dq+tBQ=;
        b=QhsufNEVeipNffQkUxCowC+qkOVz1zV1X9QCaEM8eZTVsZ3HywjAP21O4711Ez/w4B
         4Tv9xXGum7hIPGXuP8ZHr68ICqaESIyBrp3H4f9t953nkimnmSJuV2aw34XA372oJDHK
         TRHoKT6tlSTHXshjTPiT2yUBINlbuac3Cz38GZjVBkkEiO6rnhi/Nw1qIHEvUlKMyVTA
         fdlkEoCORgokENeNLALu3E0hkNCkhlvlqOQRfr7MB0pbT13WfvxYUI1/kzSARQhFVv1N
         3wbrTEVKVlQv9hLvAAwGS2z6Ha6IzaSMmI/exypFxCNBlnfoyEBEdKrdqMx/0RAhCkMk
         hVEg==
X-Forwarded-Encrypted: i=1; AJvYcCXZpnmN0Lo5Ivvu/3UWfs2szMEkCgSzHyZI4TASN/mwnoRSgPFz2IY2kxVJWnLPIjtYPX4Qjb7btOBK30Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbXOjsSUGPKX1INGVB06rCkL5Qu1Hv0PqljMIwYlVJTK/8/hKR
	C/K+uK8qiqTlZAuSvtfV80159pzSECaoYNTnvCV/Yrawu3qIsFSbl1s4IrSxSaOTkclR6ozlkmJ
	1EALx8L5DVnTG1MUtGsdpWazxOGkOSv7nQpoW/gX/luJ6BmMIZgWt61TPtw==
X-Gm-Gg: ASbGnctXrA7xnmEsvF+6E/+jEOxub0khDQIcu85LeYNIRq5kBSAVH6VG2S9vHubxgwY
	CEnAdd80dOweUWS2PvRPH+VeGlIbXAuUJzgV6zeYojHmp7N8DGgKuK2eR+LXy7HeCkGPBDf36dh
	yWmYef735AHZYx37rZ87FRpUFj1X4tmvM=
X-Google-Smtp-Source: AGHT+IHAbJn7akHP0pYrJh9k1QTBH4AMnJ3AUW68Wk+P5THmWTp3kCTbbGZ2EV9/S5oBNPTKOCVGI0vam2239o4+gmA=
X-Received: by 2002:a05:622a:5a0f:b0:476:7e6b:d297 with SMTP id
 d75a77b69052e-4a5a581c203mr125679031cf.41.1749135086307; Thu, 05 Jun 2025
 07:51:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 5 Jun 2025 16:51:15 +0200
X-Gm-Features: AX0GCFsTY9gN9NDJLz1wYsjKjFbqBwGH61myZEfMvmbdvIDQuo4OYyMlmpHjQd8
Message-ID: <CAJfpegvB3At5Mm54eDuNVspuNtkhoJwPH+HcOCWm7j-CSQ1jbw@mail.gmail.com>
Subject: [GIT PULL] overlayfs update for 6.16
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: overlayfs <linux-unionfs@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Please pull from:

  git://git.kernel.org/pub/scm/linux/kernel/git/overlayfs/vfs.git
tags/ovl-update-6.16

- Fix a regression in getting the path of an open file (e.g.  in
/proc/PID/maps) for a nested overlayfs setup  (Andr=C3=A9 Almeida)

- The above fix contains a cast to non-const, which is not actually
needed.  So add the necessary helpers postfixed with _c that allow the
cast to be removed (touches vfs files but only in trivial ways)

- Support data-only layers and verity in a user namespace
(unprivileged composefs use case)

- Fix a gcc warning (Kees)

- Cleanups

Thanks,
Miklos

---
Andr=C3=A9 Almeida (1):
      ovl: Fix nested backing file paths

Kees Cook (1):
      ovl: Check for NULL d_inode() in ovl_dentry_upper()

Miklos Szeredi (4):
      ovl: make redirect/metacopy rejection consistent
      ovl: relax redirect/metacopy requirements for lower -> data redirect
      ovl: don't require "metacopy=3Don" for "verity"
      vfs: change 'struct file *' argument to 'const struct file *'
where possible

Thorsten Blum (4):
      ovl: Use str_on_off() helper in ovl_show_options()
      ovl: Replace offsetof() with struct_size() in ovl_cache_entry_new()
      ovl: Replace offsetof() with struct_size() in ovl_stack_free()
      ovl: Annotate struct ovl_entry with __counted_by()

---
 Documentation/filesystems/overlayfs.rst |  7 +++
 fs/file_table.c                         | 10 ++--
 fs/internal.h                           |  1 +
 fs/overlayfs/file.c                     |  4 +-
 fs/overlayfs/namei.c                    | 98 ++++++++++++++++++++---------=
----
 fs/overlayfs/ovl_entry.h                |  2 +-
 fs/overlayfs/params.c                   | 40 ++------------
 fs/overlayfs/readdir.c                  |  4 +-
 fs/overlayfs/util.c                     |  9 ++-
 include/linux/fs.h                      | 12 ++--
 10 files changed, 97 insertions(+), 90 deletions(-)
