Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F26B154BFE;
	Wed, 11 Jun 2025 02:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749607719; cv=none; b=CVylXNgL9Y52R3WTd4+LYP+sKzScdcxILLHDllwKtFWGjUIxLCtGdi6dhk5W4m1bjkg3I5fkT6URtU+YTPZaYjzTlekkDm0Bv7kvN/RrWBEtLrkDOU+OhJxsLC5dyYssOK0n3dceBNZaj9sRUJY422YLGIpU/WFMGJlUWESrO1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749607719; c=relaxed/simple;
	bh=xqmLTSSMJRGvXYb5vPd6fT5kvFP6HfljFoZuxEiyQTc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rq0N1yOuPeyZUpXu2T660vpG6LQkPq7l6ZdQL9AT2xecUsQTDm5Ph7BxNhAlf8xk9NYdAVCPp51Fr0mzSKnclfFbqDlj2huikOE8k/HIFdrbEtoF5fxW/RylOM6r2caVrIkpcxa4SupMUx0AxsyhexYsIynR4Xw/368xHaRTJ4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwQCnFrk; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwQCnFrk"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-234d366e5f2so69643955ad.1;
        Tue, 10 Jun 2025 19:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749607717; x=1750212517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/GTJ1pJR4xwooAL1I5nvRW+Wju9UFrsbmTKQ9hJqRj4=;
        b=YwQCnFrku+8sT5zZumDx9KzxLRS+siLGO/CoAiwOZnBUctleOUPKWvK/3PxaWl8m3j
         rRPpaojy1LWumjUgOdogtM61SeYj3f2/srI7WUDzUTqnQAkitZWThp4sjgK+AIu96Fzn
         giVoCbsED443hOEPkXvbEJDHulgsy+MnA7XA2t4SjB00fTnAiQibGyyAfP/ukuJbvXLh
         +tcTK7vwmVvUqjSJHHOuVXrjLU9BCEa36GnlOiEl/+KlV21LnZicdQPRcA2fgQo9KpzX
         AmACdiJRFjkMvAz1V1COWIbLyLK+yDd4wct+YDCqXamVJ8GAKe3GzuJBa9ZwcJUunV9l
         UhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749607717; x=1750212517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/GTJ1pJR4xwooAL1I5nvRW+Wju9UFrsbmTKQ9hJqRj4=;
        b=EIFpnwJdDDFxVXo8WMnmWo2+L4QeNrCOfUsVnkqu2ZRaMSSyXOuqdtAtkSb9cnbNeN
         SONd8TT5fI4nDCnC1VrnJyJNcTgiXkvvbGTyAeo3EI1Hy74dd/SSjLX/MDRlwuOHu8gN
         zT/gbMv1iKPDOg4bDijQuGkg9jTQFWAksp4c0XMtv8crM+riqGrzlcKquv/Fdr6YjAZZ
         K01lUHpjgoXuQa5dD17oXmPkRmjn6TZQwZdSZJfYiAb40SJn2k8pRBdi1mL/pL1uQ20Q
         Djujw9XYqroWhbtiD/w67NYQ4kvzTJ6bzlmZ93KVgilEmtTqS4sI7xGBJIlY9ItpSgpQ
         aaTw==
X-Forwarded-Encrypted: i=1; AJvYcCXGad2d+mHsJBdjhT5Is57bYQfiy4LwngCmFVEmo8VEl+xKYsmYpsyRkSB3NNX2VhsWAHWyTmUzeqI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm4TUeqE5t35+y3Qx3wjt8d83ney1rRVv7NE/PiyVSIVZ/Qwb0
	KtVF1cCWEUOOSNDQXXelRbty18v2lrT4gEOB5K4x952/FzigPucR5X4p
X-Gm-Gg: ASbGncuzwiiMA3oAP/Agwn+Mqr4g0BYKpppblpAG4LGV4k9OAici4oszXsNymjEWJlm
	EAiNWzGN/rJozDUpZWNXMfmr+lMaxgjxYPo0JKmpXle2YHnoGx/xSqFqSrpgG4hHipafb+p9PZt
	TQ6rrNVLT+VIgYAXNUbfz3mSW8BrJvUL1PuCTyMbK7o+i+U3uBNQ+Gsd4R2jnz+Sqirc02AQV7h
	gn//50/bfo+p16yJSMxYUffleeiTr9AP4uWDks7UtqhKaslIN1x6mdrdpR3cW/baf9ktxol6sHF
	Yc7e2WczlMoxUN52+R5dDv7zFwfHF3FQtwZfh/USHY0HGTRWBvjehpf3ItRiLBvxvwL6hPAb
X-Google-Smtp-Source: AGHT+IGUrcqA3hrwumHbP3z+19RPkhfMytlxOzMA0qc6w05gOhIJ4Jk1wBXyEFe80IP2WwukQ5L/Ug==
X-Received: by 2002:a17:902:c94d:b0:235:668:fb00 with SMTP id d9443c01a7336-23641b25d36mr17985605ad.46.1749607717145;
        Tue, 10 Jun 2025 19:08:37 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030789b3sm77086055ad.26.2025.06.10.19.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 19:08:36 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 201CE420AA82; Wed, 11 Jun 2025 09:08:34 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Linux Nouveau <nouveau@lists.freedesktop.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Dave Airlie <airlied@redhat.com>,
	Ben Skeggs <bskeggs@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH v2] Documentation: nouveau: Update GSP message queue kernel-doc reference
Date: Wed, 11 Jun 2025 09:08:06 +0700
Message-ID: <20250611020805.22418-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724; i=bagasdotme@gmail.com; h=from:subject; bh=xqmLTSSMJRGvXYb5vPd6fT5kvFP6HfljFoZuxEiyQTc=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkeTwIjH37Td/ofe82l6vluzhTfT05V7lmdR/vs2dpvf HnRvHRqRykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACaiH8DIsPO7SYSCaFTK30OR IQGsxcFfvVjmKgcFK0rembiy7o3TXEaGvd+/3zt7v/fImituP2bPmKXyrfB9Y9yFskuvU67d36p 2lQEA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

GSP message queue docs has been moved following RPC handling split in
8a8b1ec5261f20 ("drm/nouveau/gsp: split rpc handling out on its own"),
before GSP-RM implementation is versioned in c472d828348caf
("drm/nouveau/gsp: move subdev/engine impls to subdev/gsp/rm/r535/").
However, the kernel-doc reference in nouveau docs is left behind, which
triggers htmldocs warnings:

ERROR: Cannot find file ./drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
WARNING: No kernel-doc for file ./drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

Update the reference.

Fixes: c472d828348c ("drm/nouveau/gsp: move subdev/engine impls to subdev/gsp/rm/r535/")
Fixes: 8a8b1ec5261f ("drm/nouveau/gsp: split rpc handling out on its own")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
Changes since v1 [1]:

  - Correct GSP kernel-doc reference file (Randy)

[1]: https://lore.kernel.org/linux-doc/20250610065258.41467-1-bagasdotme@gmail.com/

 Documentation/gpu/nouveau.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/nouveau.rst b/Documentation/gpu/nouveau.rst
index b8c801e0068cb0..cab2e81013bc5f 100644
--- a/Documentation/gpu/nouveau.rst
+++ b/Documentation/gpu/nouveau.rst
@@ -25,7 +25,7 @@ providing a consistent API to upper layers of the driver stack.
 GSP Support
 ------------------------
 
-.. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+.. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
    :doc: GSP message queue element
 
 .. kernel-doc:: drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
An old man doll... just what I always wanted! - Clara

