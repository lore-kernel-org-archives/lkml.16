Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6D823AD;
	Fri,  4 Jul 2025 19:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751658600; cv=none; b=RVL+U2d0MLbPZJRxR5Ot/Bz3izU2aDWY90MeuP1WN5IGuxydSWVuQ2BMnzQcU6iExBUgsvu2EPdQ74ibYNUzQmfkY+I+oV00O26RImVXe3y6Ab5pknAS+9lvhhhsC9t2urHQiEG3spx+ktOACFT+nDd4GK99OBWaiqMGXGNlwOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751658600; c=relaxed/simple;
	bh=oLQqFCW09GL4Ccc76Hf9TKFciOsxEskAz3T9JX5Hpr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CNALu2cO7bCuF5YTg+N7mdbU3ouf6uc+pzWSMLt+tprcPZoigi2tawtfU7/J3C6jUoR2hbIeZf+9SnRxOGIyUkHBBaJ9t7VutI5jG1edoAFWIgQcmi+svGaCxs8RaWrNL2E/oAk7XHS2kbk8/fGQqJyk4fhueIx1M9tXykr6Sls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Btf0OMbR; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Btf0OMbR"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6facf4d8ea8so9881276d6.0;
        Fri, 04 Jul 2025 12:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751658597; x=1752263397; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zbyO3uwVjEiMhcVvxpvfA6jAl9ojxLYQ03N6BOpxmvM=;
        b=Btf0OMbRK7MIM6S/CmO0eP981FP7Apivn41nGOW3YnXDRCduvjndNPDcA7iDIzeCG5
         q+1rrXel0UfZbeINb6wg89y25ig3CWCDtKEL6IqoBxHS4LNtD6TwC+YXjaKHTELOov2p
         VP+3cXJlJdM1k5NndjXi9o1pxTUS6VGv3wpu0UorSr6gKwiS3WPSLPRgt5Rgjd2GVMYU
         nkhXWYlPIXDfBF0yiIIoO35B6p4s/0+MLcj1FQxBTXKIBoJp4XD3JAYsbMIg4GwbmFaU
         cW7Bfz2dBxbFklE1yVYjQBWAQ+qIhEXK9ukBM+9eqfXlyffyT64FFz4GVPNK8OGY4NgA
         XT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751658597; x=1752263397;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zbyO3uwVjEiMhcVvxpvfA6jAl9ojxLYQ03N6BOpxmvM=;
        b=M/V3AmvFQtfkQCCg/LhIFenInsWPHoWXOXaCj1uHy+MK2Evcrk6zshJR2vohy34DuP
         F+eCAzn/ESM9kpZS96g+VPlwVn6XVnzazbCKGgLRCQoNx44yMF1X1LjfsBXgtSa9y/al
         jSfPn0BMG5VBS5p24kVgxgX0TGNL2mVhXmJxDxc27aaT7Lbgt0rAD2r39w5Jy5CzPuQ/
         7HOecgjCJ5/wBxCWcmhjDQv5Cl6ucn/2id40cy2P8m4CIquXLRtkIc2BJryqMz17DzP/
         E5A7AACP6EPFDbFXq32pn8i6dCzkahnQGL+2xivCAI+RW7tEpfuUlh9tqY4Hh1M5xlc3
         MvMg==
X-Forwarded-Encrypted: i=1; AJvYcCU3IjkH+rG9uuRQiWCeAvKgwzbE8ZHXugZdzyEnOEbBV7O94trZjhMKiX+ehsc1+HMQE3FG9tP9BP61tKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmAibuHY229hvYRQE4WIbEQ8lJw6LmieVq+xbiJ8JIKD23k4pF
	BVez21QkuXZUaC1H7CKLQNAUZC+0mk9wHJuTweNF4/pn3tHxcZaWM3ic
X-Gm-Gg: ASbGnct3Huw+Fkw/rPajwzkpX64D7tK3sSj+cO5YB1KXi4fIRI/fRsR1HZOSJY5QZHg
	amCGhPjnbXrhZqVP+AjnOxkeXZcq3SArdpSId1v6mMHigyHAzN2O6Te1/uNxCdsT5jOKmABBJhN
	fl+9sttn2PAFqLoN2O1Z7HKaQmnHTLmE8Gq3NPdgJAuQG7DFZnTLxF7mdKKvoVcpsHPOMPJS08f
	8CFHz5Dqf04xqfUIDgeXWyyv0ab/geacE4KTF+j8DmiBmPtH6ULtCf4gD16xZmMG4KSYPHCk48P
	DxX3DdhwbsGnmA35SW3nOkiB9pKIQgBV/jgkXyfZo/FoyQ0ODwN5tGb/bKd6ITPIsBN0Rqk1j5m
	ryeR/j14=
X-Google-Smtp-Source: AGHT+IFo8nm6i7npeWQq2fuKAnLp9TyVGdOwbAF3njccPAVs20Hj8Of8ibICgj4NpVwD2rPcN0lUfw==
X-Received: by 2002:a05:6214:27c7:b0:702:bcdf:8b59 with SMTP id 6a1803df08f44-702c6a3acfamr56569876d6.0.1751658597537;
        Fri, 04 Jul 2025 12:49:57 -0700 (PDT)
Received: from 156.1.168.192.in-addr.arpa ([2600:4041:5c29:e400:94f3:d2bb:5ace:77a1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbdbd172sm198544785a.42.2025.07.04.12.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 12:49:57 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 04 Jul 2025 15:49:54 -0400
Subject: [PATCH] rust: platform: remove unnecessary import
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-cstr-include-platform-v1-1-ff7803ee7a81@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGEwaGgC/x3MSwqAMAwA0atI1gba+sWriAtpowa0SlpFEO9uc
 fkWMw8EEqYAXfaA0MWBd5+g8wzsMvqZkF0yGGUq1agSbYiC7O16OsJjHeO0y4bKaU3UFqUxNaT
 2EJr4/r/98L4fUQ4fPWcAAAA=
X-Change-ID: 20250704-cstr-include-platform-0d11ee834226
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1751658596; l=677;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=oLQqFCW09GL4Ccc76Hf9TKFciOsxEskAz3T9JX5Hpr0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOHYA4ChWSCW9L65SqlEQNAM1BtYX5KNfVTDZYRwNM4/4LRj/eUB1lRgWPvl4Pxmo/iySjzVQSO
 pTpq5RMtvMwg=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

`kernel::str::CStr` is included in the prelude.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/platform.rs | 1 -
 1 file changed, 1 deletion(-)

diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 0a6a6be732b2..12359d26bc6a 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -9,7 +9,6 @@
     error::{to_result, Result},
     of,
     prelude::*,
-    str::CStr,
     types::{ForeignOwnable, Opaque},
     ThisModule,
 };

---
base-commit: 769e324b66b0d92d04f315d0c45a0f72737c7494
change-id: 20250704-cstr-include-platform-0d11ee834226

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

