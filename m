Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552001A4F12
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738920223; cv=none; b=tpl9eSeS+V/obUBrXqTUwquae2kRlo9QBKYkXL8Qh1lTsDGZmhkyrI/1QhA7x4fxXjXntWWz92I1qCIRyeprNRkR72Z6yPCcq7ehzDmaL2uDeUruEBcYLaXfWFZ+nMO56PD+5iGkKDdsAIalmWVaEkbNuBQrWIOwRKVBBaImIao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738920223; c=relaxed/simple;
	bh=7foGjpPDLlYx50p6RFy+MOdQ9Iltz4QFtX0BAdoskEM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YDy7v7ujZMvqlot/UOzYirOVmFSgqIhUmeghl5bMMd5LizxXsh4a3QP8536NagDhjcs0DfKhFHMS/D5rac99nkXX2Jn7/tS4SO+ZF8R9EtQ8VORuN6KJZS/RcTkwTN1C5J5mg37kF8n19mVlQiKpP/f0jl0REWdAgU4f+IE436k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=i3KSukhh; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="i3KSukhh"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-544fe4f254eso169313e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 01:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1738920219; x=1739525019; darn=vger.kernel.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rO88zIw/rkqe4e2UWjPP/l2qbTeePqLh8FQsoV+uBPA=;
        b=i3KSukhhaKXD//p0lVdKaQw6t/ShimDnZ5DCFuMDc9KqdDclCj+IGA+wOpP0N736Nw
         NgVWZ2nNPmREpXPytzWMyTJxBjIaYZ3ItNY6U3iIW7iAnqhA3LSAEoXOu7pLXFidfmOF
         PMsprV7ztbGfycdVkFNDqnCunwk//akmVm/Gk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738920219; x=1739525019;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rO88zIw/rkqe4e2UWjPP/l2qbTeePqLh8FQsoV+uBPA=;
        b=fK7rQyYZN1JDOnu6SZdRdJbyu8NDrDbw6S7W2DdXE2EvPoHxdkrwF1cNT/u9rH7I5B
         5jHosm4cNPbewBsLDya1d7zXZ3FW1MNhWPDZuSq1xbhMkO4lPixNdrkJGVprSc6b1zxn
         gj5Or+exP8C1gOdmygkoDiG7SZKJCM0B9guPhTXuGFNIAvlCpMUNoCTCUZcTesrkhSgC
         U9w77/5GnVNY7XWNDxlcvQVrwz9uKoYtKL2eU6TFfI/6k/yFdW3voRLeV8SgatVuSPPg
         X4vWRXGKLAJlN9y8bPWLt8BFQH0x8Iw6RwlEXJQuEJk4AK9kXKngujB2XXjirZeKh5rN
         SrlA==
X-Gm-Message-State: AOJu0Yy2kaQ9gRqEwatY1M+6AiyvR/dY7ZnFBfUip6oXbpqGPhwrUMq/
	brqUjyGVQhJRr0U7ZPK00Gezw7VUfGfnkZl7iHETtqucit4LoRjFaJX6+ZKsZS4=
X-Gm-Gg: ASbGncvuC9ZfR34n8hZjZBspeCFsL3Whcm6fMZo4RzlEi3pWqVMVWtshx0r7XivBs/A
	+mD5FprNXR3zlB8ncknKET1QtODdDvK1wvixre9W8xD6Fizsa2dOk13eIP3F5VIh1OOqidy2/ez
	MR0AeAtD/v+R5iclchUh8vx0h/EgqHO4BniCkrttVwwzm1is0FmGKWhjgjlgBCNKb40LNrTJp68
	EWi0E0IlbKzQF6UHh/wbi1cGntmMiWmeN3Vz3rgori1DtlBZNcJj4HRh138cjQ3XIsie0/qsWzf
	rff3MewauZdimw/a
X-Google-Smtp-Source: AGHT+IEkcfTQWEA/Sywn5JevxL4jDfq1YDanXOP+yFyL8YbHjYeG8UXBwkFVsc7R67SGefz3/IuwQQ==
X-Received: by 2002:a05:6512:3d1c:b0:540:2d60:d6ce with SMTP id 2adb3069b0e04-5440e6c267emr2171573e87.24.1738920218870;
        Fri, 07 Feb 2025 01:23:38 -0800 (PST)
Received: from localhost ([81.216.59.226])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-544105f2e74sm386255e87.187.2025.02.07.01.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 01:23:38 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org,  linux-modules@vger.kernel.org,
  code@tyhicks.com,  christophe.leroy@csgroup.eu,  hch@infradead.org,
  mcgrof@kernel.org,  frkaya@linux.microsoft.com,
  vijayb@linux.microsoft.com,  petr.pavlu@suse.com,  linux@weissschuh.net,
  samitolvanen@google.com,  da.gomez@samsung.com,
  gregkh@linuxfoundation.org,  rafael@kernel.org,  dakr@kernel.org
Subject: Re: [v2 2/3] kernel: refactor and globalize
 lookup_or_create_module_kobject()
In-Reply-To: <20250207054538.1110340-3-shyamsaini@linux.microsoft.com> (Shyam
	Saini's message of "Thu, 6 Feb 2025 21:45:37 -0800")
References: <20250207054538.1110340-1-shyamsaini@linux.microsoft.com>
	<20250207054538.1110340-3-shyamsaini@linux.microsoft.com>
Date: Fri, 07 Feb 2025 10:23:37 +0100
Message-ID: <87ikpmrtuu.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Feb 06 2025, Shyam Saini <shyamsaini@linux.microsoft.com> wrote:

> lookup_or_create_module_kobject() is static and marked as __init,
> this is not ideal for global usage.
>
> Fix this limitation by refactoring and declaring this as global:
>  - Refactor it by removing BUG_ON() and 'if else' construct by returning
>    early
>  - Remove static and __init markers from the function and add its
>    declaration in module.h
>  - Mark this function as "__modinit". To facilitate this, move the
>    __modinit macro construct to module.h
>

I think this does too much in one patch.

More or less any time you find yourself writing such a bullet list, ask
yourself it that doesn't mean you're really writing three distinct
commit messages (and thus should make it three patches).

This also forces you to explicitly justify the removal of BUG_ON(),
instead of merely stating that the patch does that (the "what" is clear
from the patch itself, the commit message is for the "why"). Something like

  In the unlikely event of the allocation failing, it is better to let
  the machine boot with a not fully populated sysfs than to kill it with
  this BUG_ON(). All callers are already prepared for
  lookup_or_create_module_kobject() returning NULL.

  This is also preparation for calling this function from non-__init
  code, where using BUG_ON for allocation failure handling is not
  acceptable.

That will also make it much easier to verify that the refactoring commit
does only that and doesn't accidentally introduce some subtle change.

Actually, since you're not moving the function anymore (and shouldn't),
you don't really _need_ to include that refactoring patch, but it would be
a nice thing to have since you're touching this code anyway.


> Suggested-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Signed-off-by: Shyam Saini <shyamsaini@linux.microsoft.com>
> ---
>  include/linux/module.h |  8 +++++++
>  kernel/params.c        | 48 ++++++++++++++++++------------------------
>  2 files changed, 29 insertions(+), 27 deletions(-)
>
> diff --git a/include/linux/module.h b/include/linux/module.h
> index 12f8a7d4fc1c..57d09b4e4385 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -162,6 +162,14 @@ extern void cleanup_module(void);
>  #define __INITRODATA_OR_MODULE __INITRODATA
>  #endif /*CONFIG_MODULES*/
>  
> +#ifdef CONFIG_MODULES
> +#define __modinit
> +#else
> +#define __modinit __init
> +#endif
> +
> +struct module_kobject __modinit * lookup_or_create_module_kobject(const char *name);
> +

No, the section placement doesn't need to, and should not, be on the
declaration, that just belongs with the definition. So there's no reason
to move that __modinit definition and make it globally visible.

Rasmus
