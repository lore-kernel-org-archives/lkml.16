Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025CD19F461;
	Fri, 27 Jun 2025 12:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751025675; cv=none; b=XyWXpEqpacd/lbv+4NAy1t9HsZVl8ZLWuyBaUjgUU8RtrN3l1L/c4pPP4AARhYyLfMqz3EOxpljVvALrb3lc0ISsjvL4ksyJVUnLSFDQfQMLmz7Jp9Od9f6DCGTSb9CWHZQHl1PBL3NFgRj6MgU2rrBhcIHpx4Yji94lyQnf1oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751025675; c=relaxed/simple;
	bh=w2b/Ud8DUqeVqSTJxt5a48uo0jrDNRZVF+OFUm+fX4A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SbU77CndcWSNkwRcPdWyiExLyX8JKyEph7IbHkcamJzvQCpQPRGQ0Faf5LP3KN593ZfzXDyW9OJl9wXdX1CtpIz5WixpcWVXBZW9viDKslLRJyCAX3JLf8auZRtXGusSlww6ZsNjn8P8vr+jW6E8qp1RdUBfAL3JZwNzlMjRw6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ATyZ2PgV; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATyZ2PgV"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23649faf69fso21092175ad.0;
        Fri, 27 Jun 2025 05:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751025673; x=1751630473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lMm0f1YmbF8p/DacuZnlM8/zlr0CWYSCJDnnq1mmyww=;
        b=ATyZ2PgVOJ0qIR1HDNQedNzR4pO8fwz/4re6TxF6jTCX+z0WDQeEzpaiTUpjboKfSv
         RggZBCrXQQckxVlE5/O1pinYR4FLG6uiPP0Py669LtjulZEUAb0D+2wW586hXfUmy9u5
         MP4/B5Cc1IVEDJC4JjrDMKnf1aP9kB07Dyd6MXSAYJS5ntHkwlL6I/5NXpYRNjG9rwNU
         a3HEmNQlkff23/tbDH1yXX1thL+xKn6QQd7tbMPkdFB7p8ww3YfguVH/D86J4o33L4XL
         KZcgAsnY7kC5aqcKmL+oMbjQukMPoNWD8OH4a3esJVMmeZX0u/f1JRZeTveRiZj0PlmS
         vvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751025673; x=1751630473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMm0f1YmbF8p/DacuZnlM8/zlr0CWYSCJDnnq1mmyww=;
        b=GzQbIMLibd3zhqVrjZkaTF0XPmJ2geuk9lUmj+Kumo65v6NIKKk83JDxC7H3CWoDtx
         aqilcNqK3tutAIailDpIkeQPu3obYRYgMvM9SPVioKSYdpo46z8VAum4x3kNJ0Sfdpqe
         FeuXJqpD81mw3d/H6f8D8QqUKbBwI+2woTuKgZYsL9RmVhm+JCAq/nAu2q3kOcs8+Nba
         8gNev/J2ZZiE8AB/rfSUe9aZepb14QWuba4HZaDqo85MEuci5Gf+kkC6oQgUvSIJirX9
         l72klxTj0uaTr2ROnr41NxBAniDPk3LFfM6WamWPP4zArsUQnSA6bBMnjN7WHLQQQSOV
         1/lg==
X-Forwarded-Encrypted: i=1; AJvYcCUGm4mV0q0ss8XX1OGrieYBz9r0OhX+CaeenxnlNSc5tEuMqbLZHKcIJdGYGcJPE33WlB4YMcEyVPQnjwDY@vger.kernel.org, AJvYcCUh8cpvF196rSZfkeIe00H9lSiesbEkM1wCVgH+4LvVjJDeLy8Ctgz7JV/dGBFyrX7RdkZkQ+vQq9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOWGqhX5ouX8oC20Ooq69iB0IMGow/89xr4WauoCMOVDNnXZt7
	YVz9wKPrX++G0Py7YH3vt1/W/pI+1YscRdbmaUAdWy1qwZEAHZZEgdXo
X-Gm-Gg: ASbGncuZghuZXi/xWStP7ij+A9vmJErJyMJEW6lJmnaRjQG2Xw69MzLszUsLvvsepAE
	yuMsXsR2PXLQsCZE6HUAdeQtibObarIzjZPDUuP0Wc4lx/b6LFhZcLWT+3DilxnqSif6fOTWBvu
	A/1QVEXql05r+22Lwin5fM9ErBCi9Eb7LIUrYPWRhYd8pANka0iC5vWeSozcKlt0CmxMahNgO0j
	hpj3XfEizkeOn+ZUotFCFQSnDV7uruR3674WJFo8uLXiSaJ785vu7JImUgkxcYvgo0xsc+Mdha/
	aHoP8upyI692sz5SpR0ze34CjMGrkpmA0GJ8cWDI9QUmqvF8HI9mkl+Aqre3qnIIBff9etzTkiW
	M039vsPg=
X-Google-Smtp-Source: AGHT+IEFON4jPah/zgdrDesiC9nxTOgYF3/CFQOwYad3x3aR0NDjxOCJA2cEtxdL58xlsqxaUtKPFw==
X-Received: by 2002:a17:902:d603:b0:234:8c64:7885 with SMTP id d9443c01a7336-23ac48b6862mr44612935ad.53.1751025673095;
        Fri, 27 Jun 2025 05:01:13 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c408:a02c:2fc6:2cad:e985:b61d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39b8easm14451815ad.96.2025.06.27.05.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 05:01:12 -0700 (PDT)
From: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
To: airlied@gmail.com,
	simona@ffwll.ch
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	corbet@lwn.net,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kevinpaul468@gmail.com
Subject: [PATCH v2] workaround for Sphinx false positive preventing indexing
Date: Fri, 27 Jun 2025 17:27:18 +0530
Message-Id: <20250627115718.17673-1-kevinpaul468@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Functions drm_format_info, drm_modeset_lock, drm_ioctl_flags are not being
indexed in the documentation because there are structs with the same name 
and sphinx is only indexing one of them, Added them to namespaces as a
workaround for suppressing the warnings and indexing the functions

This is a bug of Sphinx >=3.1, first reported by Mauro in September 2020
Link: https://github.com/sphinx-doc/sphinx/issues/8241

Signed-off-by: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
---
 Documentation/gpu/drm-kms.rst  | 4 ++++
 Documentation/gpu/drm-uapi.rst | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index abfe220764e1..b18a99869b6d 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -357,8 +357,10 @@ Format Functions Reference
 .. kernel-doc:: include/drm/drm_fourcc.h
    :internal:
 
+.. c:namespace-push:: gpu_drm
 .. kernel-doc:: drivers/gpu/drm/drm_fourcc.c
    :export:
+.. c:namespace-pop::
 
 .. _kms_dumb_buffer_objects:
 
@@ -473,8 +475,10 @@ KMS Locking
 .. kernel-doc:: include/drm/drm_modeset_lock.h
    :internal:
 
+.. c:namespace:: gpu_drm
 .. kernel-doc:: drivers/gpu/drm/drm_modeset_lock.c
    :export:
+.. c:namespace-pop::
 
 KMS Properties
 ==============
diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 69f72e71a96e..e9d7b7282a19 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -554,8 +554,10 @@ DRM specific patterns. Note that ENOTTY has the slightly unintuitive meaning of
 .. kernel-doc:: include/drm/drm_ioctl.h
    :internal:
 
+.. c:namespace-push:: gpu_drm
 .. kernel-doc:: drivers/gpu/drm/drm_ioctl.c
    :export:
+.. c:namespace-pop::
 
 .. kernel-doc:: drivers/gpu/drm/drm_ioc32.c
    :export:
-- 
2.39.5

