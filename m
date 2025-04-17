Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F247E1
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744848241; cv=none; b=EyOecT87IotpT4dsnKvayTDcbSwT6kj2yutyHurRTY0++vEAHRct23YLVYzmrXHLH6kt9LKmGDGeWhxx0N1dNhXCHC7zeAy2fMwOiw4Avnihx3MHyGRbPiJY9ndZHYSWYLMkW9PSvl6EY7f6cqxUaiHFXYINp9bxgj5MOZLNk+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744848241; c=relaxed/simple;
	bh=/m6KF7Byx6i9ROs9eccEVpOFlRh3oyb+mWGRC2yBlYc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=URjqLIC3d4r20R9EF8Uw7PiZMFmBDWWbdg2xhQ1OFkjgUk3s8H/lYdhiuyS65/uhugQuWZ/GnGGoSMRTJZCUrXMAPXf0+qpG/w6PXO43jT31mW8gf+FPjXOihk1y5sEFCbzhwsZl1+uD+fbUFBTY2v91x2Ke054b9ZVXz7CxURw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=2baDOuUR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="2baDOuUR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369DFC4CEE2;
	Thu, 17 Apr 2025 00:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744848240;
	bh=/m6KF7Byx6i9ROs9eccEVpOFlRh3oyb+mWGRC2yBlYc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=2baDOuURtgnHmxLxT0eGvbB/yfMwFB1s8iWVl1/vd5WVvuiT2bXhQagW/UfyT+QQA
	 BR1EyxyGrxf6BFkzaNXFKYCPskM9Xz9kjXNtqNtELQFbzIGn/EvroVXPgpg4zWv/ZF
	 LlwOox0Pkkz9iikOQf3ATJUqyWO+Ivo20UBm0qh0=
Date: Wed, 16 Apr 2025 17:03:59 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
 <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov
 <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2] x86/Kconfig: Fix allyesconfig
Message-Id: <20250416170359.a0267b77d3db85ff6d5f8ac0@linux-foundation.org>
In-Reply-To: <20250416230559.2017012-1-linux@roeck-us.net>
References: <20250416230559.2017012-1-linux@roeck-us.net>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Apr 2025 16:05:59 -0700 Guenter Roeck <linux@roeck-us.net> wrote:

> 64-bit allyesconfig builds fail with
> 
> x86_64-linux-ld: kernel image bigger than KERNEL_IMAGE_SIZE
> 
> Bisect points to commit 6f110a5e4f99 ("Disable SLUB_TINY for build
> testing") as the responsible commit. Reverting that patch does indeed
> fix the problem. Further analysis shows that disabling SLUB_TINY enables
> KASAN, and that KASAN is responsible for the image size increase.
> 
> Solve the build problem by disabling KASAN for test builds.
> 

Excluding KASAN from COMPILE_TEST builds is regrettable.

Can we address this some other way?  One way might be to alter or
disable the KERNEL_IMAGE_SIZE check if COMPILE_TEST?  That will be sad
for anyone who tries to boot a COMPILE_TEST kernel, but who the heck
does that?
