Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4DF1C3314
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 21:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744147589; cv=none; b=C4z5Fvy0EPFt9S1wtnP8J1onef38UNHYMlKWdB0XQVAqzBgpq+FbeLYJtODbX3KLVuWPOOifh0CnedP3TdKOYaad7Yq5RNZt3kTSdacK5YNdxqhvw/xAassEHNuRsbCIuEmRpSS8NyYOt7KCWwTzxuMSi9grtcfKcOAW3RnVmsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744147589; c=relaxed/simple;
	bh=P7Lf0dj0hCXeXLmQVHB7DfGd8JKZuBwyDePUBEWe9Wc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uFA09LJV2UxGqSjLYhDnE1NepaWXU7H5DonOI41/iLptH9Wb/3wkvek4R5s7t2XBX+vdz5/H1Cxe11csn7nUfdR6wadEENr6itgGKJAlF2QqS8voepB/OMHNZQrAH4x1/Sog5ciJRGNENMMbfc6pCu+C5CJjV888PjmUGcVWCXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=Lc6glUYr; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="Lc6glUYr"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744147574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j8EVmgn2Z4wK0oIRWCTYDXGo1chuiloeDCezR7/IMto=;
	b=Lc6glUYriu6t8DRbnJjBKzUmx47WCtf0msz0Fz7bdoxmmIVYbPoTN4KBuaa1jE/Xc1OSul
	+kE1ZXcH6Na28NdBGLO3zaEXkK8P7X5JspchKKo9DPdz8n6Fdpyad+J6p0PJ0uQpvTJAj+
	O6xP+8Zuh2VioswhiSmeBk4qbuzCRJ3TIKigInxTPKO2g030yS0QVvN6UUpg8VhnGFSugs
	jkkEtL3K45MKFK3b61d5Wxya7YvDiNuY3R5dcggCzTmikBGjSLgYmtfsghia6ivAjqgHQ0
	RginvRMRKRJ0orS2X41Jg9RzbtAa+GR6obNYQIadRs7eFAJL3tHR4gkEKewJbg==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, Janne Grunau <j@jannau.net>, 
 Sven Peter <sven@svenpeter.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Sergio Lopez Pascual <slp@sinrega.org>, 
 Ryan Houdek <sonicadvance1@gmail.com>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Asahi Lina <lina@asahilina.net>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Neal Gompa <neal@gompa.dev>
In-Reply-To: <20250408-agx-uapi-v7-1-ad122d4f7324@rosenzweig.io>
References: <20250408-agx-uapi-v7-1-ad122d4f7324@rosenzweig.io>
Subject: Re: [PATCH v7] drm: Add UAPI for the Asahi driver
Message-Id: <174414756927.683934.14858043560945639869.b4-ty@rosenzweig.io>
Date: Tue, 08 Apr 2025 17:26:09 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On Tue, 08 Apr 2025 16:54:14 -0400, Alyssa Rosenzweig wrote:
> This adds the UAPI for the Asahi driver targeting the GPU in the Apple
> M1 and M2 series systems on chip. The UAPI design is based on other
> modern Vulkan-capable drivers, including Xe and Panthor. Memory
> management is based on explicit VM management. Synchronization is
> exclusively explicit sync.
> 
> This UAPI is validated against our open source Mesa stack, which is
> fully conformant to the OpenGL 4.6, OpenGL ES 3.2, OpenCL 3.0, and
> Vulkan 1.4 standards. The Vulkan driver supports sparse, exercising the
> VM_BIND mechanism.
> 
> [...]

Applied, thanks!

[1/1] drm: Add UAPI for the Asahi driver
      commit: 12a2bf6765c2a61eb7f20870452bb915eb28fdcc

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>

