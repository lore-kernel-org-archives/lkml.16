Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D553201261
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 14:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748269333; cv=none; b=csGuPAo6a2lw7N1OD/mCrCLQg/6paZhmof8xNWw2cGLQQ1j4aOoTu78AARgUSx/ajB9ub3Qe3zp33BsbaheEYiYrn9cMvXwJmswSUSaa07imsJSdAIde69GbfRq3vMzozd0g4MLLEHew0xiQ/6I1BIYj9XrTQLNh9wB3T1Ob0wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748269333; c=relaxed/simple;
	bh=6pkj6rnTEVIJ+04BKXoNNbOsXMC+i0vqq0Wh8lQfnJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGMLxwNQCCMrMfu8ygN6BHyinK+kj1RePoNMPiluZbyUXD6wOof5Q1Azhuvs9bZYJNEaJzLLBiy9RvZH7QW56ZOGPMOZY8gHnqLKJ3/kZyRuB5dOP5SXK3XiH0F5JnyoEWgeWt6W3KUAHw1WPMjHH8yGuwNF0BLfPf0JUzXliGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tVZWKkL5; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tVZWKkL5"
Date: Mon, 26 May 2025 16:22:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748269329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SnqziWy7edJCEM7nX+7Fa4vGfkDo262TofC1GENizGQ=;
	b=tVZWKkL5digKlci/pd7eWRlrJ1rxEL4jCIzhqR2hVDOhZxb3YP2jqjfr4E4BGJMVaN4t/I
	ZbtJB79MyFiipN7yCvWqjCoLDCNmpmi6iXr4vSstVnMQZe20MWzJGHurSd+5ctEU2jvJoC
	WxGKImm0+z+1dER0f9i99B76K05eu40=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 09/11] kunit: uapi: Add example for UAPI tests
Message-ID: <20250526-marvellous-abstract-koala-317cb4@l-nschier-aarch64>
References: <20250407-kunit-kselftests-v2-0-454114e287fd@linutronix.de>
 <20250407-kunit-kselftests-v2-9-454114e287fd@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250407-kunit-kselftests-v2-9-454114e287fd@linutronix.de>
Organization: AVM GmbH
X-Migadu-Flow: FLOW_OUT

On Mon, Apr 07, 2025 at 09:42:46AM +0200, Thomas Weißschuh wrote:
> Extend the example to show how to run a userspace executable.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>  lib/kunit/.kunitconfig         |  2 ++
>  lib/kunit/Makefile             |  9 ++++++++-
>  lib/kunit/kunit-example-test.c | 15 +++++++++++++++
>  lib/kunit/kunit-example-uapi.c | 22 ++++++++++++++++++++++
>  4 files changed, 47 insertions(+), 1 deletion(-)


Adding this diff allows 'make clean' to clean up the UAPI test binary:


diff --git a/lib/Makefile b/lib/Makefile
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -112,8 +112,6 @@ CFLAGS_REMOVE_test_fpu_impl.o += $(CC_FLAGS_NO_FPU)
 # Some KUnit files (hooks.o) need to be built-in even when KUnit is a module,
 # so we can't just use obj-$(CONFIG_KUNIT).
-ifdef CONFIG_KUNIT
-obj-y += kunit/
-endif
+obj-$(if $(CONFIG_KUNIT),y) += kunit/
 
 ifeq ($(CONFIG_DEBUG_KOBJECT),y)
 CFLAGS_kobject.o += -DDEBUG



plus the 'clean-files' addition below.


> 
> diff --git a/lib/kunit/.kunitconfig b/lib/kunit/.kunitconfig
> index 9235b7d42d389d2c7bf912546c7bb084eae99235..b7433e691563a3a8442db69874dea88f3b607332 100644
> --- a/lib/kunit/.kunitconfig
> +++ b/lib/kunit/.kunitconfig
> @@ -1,3 +1,5 @@
>  CONFIG_KUNIT=y
> +CONFIG_SHMEM=y
> +CONFIG_TMPFS=y
>  CONFIG_KUNIT_TEST=y
>  CONFIG_KUNIT_EXAMPLE_TEST=y
> diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
> index 989933dab9ad2267f376db470b876ce2a88711b4..1b6be12676f89cafa34f0093d8136b36f4cf5532 100644
> --- a/lib/kunit/Makefile
> +++ b/lib/kunit/Makefile
> @@ -30,4 +30,11 @@ obj-$(CONFIG_KUNIT_TEST) +=		string-stream-test.o
>  obj-$(CONFIG_KUNIT_TEST) +=		assert_test.o
>  endif
>  
> -obj-$(CONFIG_KUNIT_EXAMPLE_TEST) +=	kunit-example-test.o
> +userprogs +=				kunit-example-uapi

clean-files +=				kunit-example-uapi

> +kunit-example-uapi-userccflags :=	-static
> +kunit-example-uapi-nolibc :=		$(CONFIG_ARCH_HAS_NOLIBC)
> +blobs +=				kunit-example-uapi.blob.o
> +
> +obj-$(CONFIG_KUNIT_EXAMPLE_TEST) +=	kunit-example-mod.o
> +kunit-example-mod-y +=			kunit-example-test.o
> +kunit-example-mod-$(CONFIG_KUNIT_UAPI) += kunit-example-uapi.blob.o

-- 
Nicolas Schier
