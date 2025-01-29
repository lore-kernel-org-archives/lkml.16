Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19BB191489
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 21:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738187430; cv=none; b=nTruUOy97s1E4jLqL0OsbzZomzG2wFykCl51w0ZNn2C6J+c1PWOon9+f9ry5O4xZ2iSrOukGnPXaxNSqh1y4oNzXo6JqezwGWfRC6yoXedFRBHfMeQzOnZstly3DpIQ2GMl1zf9hOM22D6jaIWmPtbtD2m6gEZmxuSeGjiAGQ+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738187430; c=relaxed/simple;
	bh=GCv1BdGhLk979tjwdD7sHi0l76G9SsBFWUxU0e6u/iE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aNNGEqDFiZY0QfzliF8c54x4AM9joIeSx/k62PjNUszzKl1IznZwm/TnoyCpxg5BjCM2FseJPmSpQcxrcglOi8hxNkeHpf7AqDnmoTuD16cBS4AIrkSX78XhtBwj9lWup6zqEirDRH9TFdYw3M8M0OMNYItCFGnEvjPfqAUnNQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=pass smtp.mailfrom=linuxtx.org; dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b=c64uApf4; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b="c64uApf4"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-84cdb6fba9bso10719739f.2
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 13:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google; t=1738187428; x=1738792228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6AAS+zM1KKQALs9Y9hGxYkwdnvHEn+06CSi/EhMJ+kU=;
        b=c64uApf4rs+3yzS0HQsyJrvBVA09ku0RSMYa74LNLp/7xj6J+4T/5Rsr9vmBD7KNo7
         PK9X5iPUz7PXBxqC71sUjB1RgNi0Y5+PtwNAPaISqDU05h5blRRLYtdHAKOKiEZpNCkc
         hjHYoOM0aJ23Tzdw3f9kFEyEJnLUqGpmi4t30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738187428; x=1738792228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6AAS+zM1KKQALs9Y9hGxYkwdnvHEn+06CSi/EhMJ+kU=;
        b=ncN/XQKMDjndFQCHioVwteq+Bbmp8JF9te1h0wXgo3izmHpWfCaJaQJ+pVL6hVGAOt
         82cm5sMyqhXHWuzNl/vDsuc8C5mRbUXyylzRsTU3KEeO0HNvAk9fITZNiABSfbYc0/lP
         cFuKVvlq1lBwT6PGtC/4Pmf70FhvF52IY8dCvRZEj9fQJuUteFphyCRmeG5vcrjo8avs
         Gn8kMfXhJppWes/GTnFaHzD6p2BE4fVhRAcV8wufYvvvzedzVZvGmFfjGi0584/s6prT
         hyWRdU81JBDXCx5qbNsvWbBd4JhK3dKVLwMLT4MTVQ3D9rMgUO0PDlkDX8+6msiHntIA
         fC2A==
X-Forwarded-Encrypted: i=1; AJvYcCXVN38BheGsV1ukle4owK39nf+zrJ3ozazovlgQ5gS5OgURlwhDbndRh+V5HuzXZXUmsVqEascmcbfzLs0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMbfTiwvNaDOgoy77F4y/Vd3biT2uPM6xdUmkEABBRnun48414
	S/mVV1jODc/9y1h+UKPZe9uwJ0DXnJGMHiXrG6GJWc102MLww9/t69p9zTPvMcqCJKC4t8KxxKt
	EKw==
X-Gm-Gg: ASbGncsG+vliIPORzpuz/9L1GGlu4UYAHIhgk4iHYttsIeMEF6dxxYI92mxLA0/dUs/
	ps2lXZFBPXNNgR6YEaytM1LAoUaaRdDWzr4VN2L01Z0nE/AAFpJd6ROgXf9v9Gc4ERwbANt2onq
	8xYLU+wDrVUt/oXFXtT5PuC/XcpuPobod8OUhYcOBo2CFZ87mqF7DzTCa79xnUsIzyyVBiFY8Y5
	NPOIM0Xuh3ofYoeKL1l9LPanmHRtePEzDAaMR0molKL9P1fMoQiSa71AmgfMDioBkerefG3t/je
	cxWuJFkPFXQbuMoV/KRI3fSFlVurqBlw
X-Google-Smtp-Source: AGHT+IEvJSszsKXHpNKz9g/CRfSxmyXZyJBm+Dxm8K/rY4WK0s24ca0m/ItXgDsI7h5JOofLlACFcw==
X-Received: by 2002:a05:6602:2b10:b0:84c:e8ce:b531 with SMTP id ca18e2360f4ac-85439fbb605mr538809039f.14.1738187427802;
        Wed, 29 Jan 2025 13:50:27 -0800 (PST)
Received: from fedora64.linuxtx.org ([72.42.103.70])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec7458ed5csm40202173.29.2025.01.29.13.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 13:50:27 -0800 (PST)
Sender: Justin Forbes <jmforbes@linuxtx.org>
From: "Justin M. Forbes" <jforbes@fedoraproject.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: "Justin M. Forbes" <jforbes@fedoraproject.org>
Subject: [PATCH] Add -fzero-init-padding-bits to bindgen_skip_cflags
Date: Wed, 29 Jan 2025 14:50:02 -0700
Message-ID: <20250129215003.1736127-1-jforbes@fedoraproject.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This seems to break the build when building with gcc15.

Unable to generate bindings: ClangDiagnostic("error: unknown argument: '-fzero-init-padding-bits=all'\n")

Signed-off-by: Justin M. Forbes <jforbes@fedoraproject.org>
---
 rust/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/Makefile b/rust/Makefile
index 71a05a3c895a..3c3da7faebb3 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -240,6 +240,7 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fzero-call-used-regs=% -fno-stack-clash-protection \
 	-fno-inline-functions-called-once -fsanitize=bounds-strict \
 	-fstrict-flex-arrays=% -fmin-function-alignment=% \
+	-fzero-init-padding-bits=% \
 	--param=% --param asan-%
 
 # Derived from `scripts/Makefile.clang`.
-- 
2.47.1

