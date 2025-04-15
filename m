Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E332951A0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744718371; cv=none; b=RQIL0EPGNNVtGlkfkGCKIPyav4FsHcWiyxF6jXk0yEBjQtxncSOabGyPye/OlzGZwfCTtwwo79n2KNqHpCqUxXNUyoqLI4nztjJ+ps5o3RphfXURL3O4r4yCIl6A8s46U4i0UXEpBIlQAgFlHZEVmZTphq9gR8TB5IzlFdbPdYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744718371; c=relaxed/simple;
	bh=FMSG06KEVo+koXmWuIGMQok0HUEroVse8yAMUNW7ZLg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DGZfFEC4cLF8zBPDgirQs9G6if+nWWJTeihG+41B6cSnlSN+bATremJF3IqNuLCFhryWCrRSkehTz1zXxfxj3XLkoqVfInCVwO5WMvAIgRx8QIRYj9roVYTgm8oqoC/qBpDQWR1+TVzPSBLCHl0WQGk1yHDOkZ4vUimEbwEgSAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wn+o7SJV; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wn+o7SJV"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43ceb011ea5so32261405e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744718368; x=1745323168; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=y66lC9dIVeqDJRX23BfVXuj8CesR6Dn4+I8tFp3SC1U=;
        b=wn+o7SJVl/7fp7JWj5jWAaWkaK21/1DUjyPMuWjwejYJw9QXgLtk+l+ikQ+vDjjWZ2
         1m2Y20e9OAf/lT/B8r4XNRfJC2EiUWZ/wV9+M9wYdREGJ/RCnpm3DRoHt9dUppJRAap+
         iyC9NZDc1RUK2SDGyqgqlMJj7IuU4/wv222teVueBj6zEQmkiaW7dpCze3tmYmy222e7
         3Q7l/McDslj3vbau5oEOiGuAHg+R690qVgUPTPJX3v2//LaMM0wv+hILkDiHua59zJCv
         G539liQbKSDFQYWxvNw8jQmvhsnfjq9gNIXOmYcIa5PiGmUkwNfY9EsRDO8H3Ghzdilu
         8dAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744718368; x=1745323168;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y66lC9dIVeqDJRX23BfVXuj8CesR6Dn4+I8tFp3SC1U=;
        b=Wq3HOmDP7fGLcFGcTyfjz/vFLKe89rODjjL7e5zFj3IuKUnFCWs/QuGjLzaGGgpdMY
         P+Ek9p3VUuZ6I/jniUv4zsmKs3IVjcYOvZpER6h7CDBz1pW8y/5DPl70DLMYLcSBHQHw
         eSLZlCwfL1H4n5KkF14dH5zqRCP28ic0hR4amy6zjm05oSX+oAty75P0krjGOzB5+/mC
         G76DqS+UfYRVoUVJYe0kVcNIgEIzROFG1UypPLhG3kTCgTAIZo23RgZYuKNpB8eIMpkT
         N5G/YvOl6/N+MV0yyxugzVpYWPJd6ccLaIHs5YLxA8banoLekuwRFF5IgoyDogppm0HQ
         wm1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVipgyHRR2G6fVJHOzM6FJGdylbdLce1OoYSXZIofhIiSYLZzzkCeaCrMMmtJepMa+OBWaki1uu6JsqJtc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTrVx2YI9LJYvq70mtWr2AGg+Arz/Gch+4ZxdzvhfkMCgVKrhJ
	eqs56RACCuPNNaPbxzKja/EFFDnQYBAa5LkIQfxw77KfL7rrQsgCkQfmhvMIwZ6xfOFOipYlxwR
	eTTIEQoRgPgfTBw==
X-Google-Smtp-Source: AGHT+IHF+9ejIcZoyxgFM8mOx/KOSSkb5ADmw40mDzTvjtIz80LUo4ak6qdjUO/1m9JZIVulEce9AHfMOOqBNJg=
X-Received: from wmbay5.prod.google.com ([2002:a05:600c:1e05:b0:43c:ef1f:48d8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3baa:b0:43c:efed:732c with SMTP id 5b1f17b1804b1-43f3a9b0285mr124000165e9.28.1744718367848;
 Tue, 15 Apr 2025 04:59:27 -0700 (PDT)
Date: Tue, 15 Apr 2025 11:59:25 +0000
In-Reply-To: <20250414131934.28418-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250414131934.28418-1-dakr@kernel.org> <20250414131934.28418-2-dakr@kernel.org>
Message-ID: <Z_5KHVHh-Zs9HSlq@google.com>
Subject: Re: [PATCH v4 1/5] rust: types: add `Opaque::zeroed`
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, david.m.ertman@intel.com, 
	ira.weiny@intel.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, tmgross@umich.edu, 
	airlied@gmail.com, acourbot@nvidia.com, jhubbard@nvidia.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Apr 14, 2025 at 03:18:04PM +0200, Danilo Krummrich wrote:
> Analogous to `Opaque::uninit` add `Opaque::zeroed`, which sets the
> corresponding memory to zero. In contrast to `Opaque::uninit`, the
> corresponding value, depending on its type, may be initialized.
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
