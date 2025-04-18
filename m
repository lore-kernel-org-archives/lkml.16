Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4B81E3DEF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 01:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940574; cv=none; b=Xp78qKp9vPHKT2fNCBMAghkTrsChCFA9cR9gKvJbdYwh5DD2b2zG67R777zVVwAKwFgTXGImhsSHSqsCSwBaUhzu6dUZgXynThsQ4ZjWW8X+Y+wJubBJip6m9DKKgq7YAta/tntsISsFXrAhVd0ptD7N4zdfPNzm/4EY+feND+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940574; c=relaxed/simple;
	bh=/wpo3AJH76G0D8d6eO4aADK4qMN5wuurt9VWTjkkxHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HRqAqC0WQGmQuJlV+vMIJSFFDm5NqTCOArMIcVV+tK7Hcoy/OTehkXB+ieF0HG0i+FjDFRas+hYYan8wHrNGtfxvK3ApOiFp2cfKzPWBlCNcbxbszJDZZDwwo5TcmP9OKS+1H20VIe5VVgPV/ZhYLMgif22aR6g1AWvtcUKTIyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=b5C6rgv/; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="b5C6rgv/"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-703cd93820fso13603087b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1744940572; x=1745545372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMrN3Fgq1s8yx9+yzOmhCcKYbou3Yw819UYNCZPiTyA=;
        b=b5C6rgv/DU6qL4HKx3s0DFz8uHXENrHYgnACgkOhnexwqcY0sZDOzrSJfdg709g6mP
         BFXO01gdkyPTSxAswbbXcr3sJITI/O16vbGp5G8lnsVsXf5HJhyf7Njf8YbQyNpBvPLo
         rsi1pJLeslupCTzerWnPF+MYN1lRLZZAehQNcOB3nuI11eQWR+K8wja5UZfwHpCSs6Xj
         a05xsxHIYBBAOcbwL+mVRjISL6dtkQ/yeUZu4y4DYWOEcL7cpCwrf6B2RXFQurkPICTJ
         6/SEgwM5K40ciIPozUkdYEXLb+jQBWA6BGSSk4bdD8iTSm6Y8+rreWiK06KiEBnD28S3
         uJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940572; x=1745545372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lMrN3Fgq1s8yx9+yzOmhCcKYbou3Yw819UYNCZPiTyA=;
        b=sdwp8StcUayfZv/OJJeQ793V6oREQD8h5LM9gphZk9e/FZfcgXuOhc/eJctfgTvNdi
         R0w6zJ5S11XuI5cO9ImU7vOAKDez41//Mfhr+GtFTkBh77D5JyuNd+v3LHivA4EnrNn7
         vTbtRGRjwlThNddmCsoddVsiKWgenbFf1bxiQKLCYqyoGsjUamfRsQt40sGiOEChkX28
         W9wf9jydtVigW/rcS3ixxmfU8i1hGPxVf/nJP2dqrAX68KJb5/sq/yikFeFkO5i9XIuZ
         VtiKMvCHhOvGt/NEucbBgy2W7cZRM7+rc2r6Kn1XyjevsaFxvzcPMsDYiATr/jeEYRnx
         pgxg==
X-Forwarded-Encrypted: i=1; AJvYcCWhIiNZJ1kSlk171Gj8rlXWyVQe4BxcMdzJY8aPFU4pcIQ0jmBXuJp7mKDQaeKzZmzO4yJgU89DuuxSmsg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTcoc+YLM834Kj5iW3qs1N4YRI8XnuAipxmm14dqA9mDos0S86
	WXHDT95W4NyoVJ+GKYS3PXcqRcUtZyhph3PDMhy/pbS7KV1A6/DtCYtFAcAW27Y=
X-Gm-Gg: ASbGncskSqdNejAScuRNgQsepKWTSL5oBZkbeSsn143MTSOFfsmXe/J6EwgOlGAfnN4
	2bVxt22JL+zV1JsPin05H9xSgigDkjBjrmZB/UB2p+xD7gIwaNFhIduvtNtn2vWd+XnzqHs244z
	GswwRWR7eCGwkzcQchB7emC83aGzeeskJImZ42CHhl0GYsY7kQxKSG8KFxqNQ1fQbxy75Dsq9TX
	aVjE+FUxG/A/0Qyq0iZWIaRHjc18bvMESO3Q2g6uGf8jlzPIua3O1Ibi2nidsLrbPeHq7VaxapL
	vBqxrWsZJCQnBllqnpguC2mAp1PpYAMpXSwlPl8Z3JI1zKEjPZc1hAJ4EUdqW/uFZaiYWL7vUxN
	I5WYTergs3yGkn7/Mej+MjTaNU8yck9CvbekU+bap60PWg/I=
X-Google-Smtp-Source: AGHT+IH02BN+95qDUcaVS2ybaCgcg+oKHZ+qn+L+ISKmk228G2SJ0hPgywUHQgDia3GpE6KgNe9f0w==
X-Received: by 2002:a05:690c:4c11:b0:702:6276:9446 with SMTP id 00721157ae682-706ccf4ae83mr14736327b3.34.1744940572066;
        Thu, 17 Apr 2025 18:42:52 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca44fd13sm2804597b3.20.2025.04.17.18.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:42:51 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 18/18] rust: clippy: disallow `addr_of[_mut]!` macros
Date: Thu, 17 Apr 2025 21:41:39 -0400
Message-ID: <20250418014143.888022-19-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250418014143.888022-1-contact@antoniohickey.com>
References: <20250418014143.888022-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the `raw_ref_op` feature enabled we no longer want to
allow use of the `addr_of!` and `addr_of_mut!` macros.

We instead want to use `&raw const` and `&raw mut` to get raw
pointers to a place.

Note that this lint isn't currently reliable, but we enable
it nevertheless because:
1. Document that one shouldn't use the `addr_of[_mut]!` macros.
2. When the lint becomes useful we will already have it enabled.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Link: https://github.com/rust-lang/rust-clippy/issues/11431
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 .clippy.toml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.clippy.toml b/.clippy.toml
index 815c94732ed7..b7d87377a468 100644
--- a/.clippy.toml
+++ b/.clippy.toml
@@ -8,4 +8,8 @@ disallowed-macros = [
     # The `clippy::dbg_macro` lint only works with `std::dbg!`, thus we simulate
     # it here, see: https://github.com/rust-lang/rust-clippy/issues/11303.
     { path = "kernel::dbg", reason = "the `dbg!` macro is intended as a debugging tool" },
+    # With `raw_ref_op` feature enabled we no longer want to allow use of `addr_of!`
+    # and `addr_of_mut!` macros, but instead suggest use of `&raw const` or `&raw mut`.
+    { path = "core::ptr::addr_of_mut", reason = "use `&raw mut` instead `addr_of_mut!`" },
+    { path = "core::ptr::addr_of", reason = "use `&raw const` instead `addr_of!`" },
 ]
-- 
2.48.1

