Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3171607A4
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 23:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744585245; cv=none; b=qQmXZ4Ufz/iv4mx8sqLZ+jRRRAainhyHGs4Aa81yNTY0QGL7DCyf9U8AYeJePXMKwurz/KTdz+VeFLsSbqAMfJ67LXHZfUkQ0ZvSk+w0ZqNQfeqkfHXYzHrFXX+8+6SE4aM0UWQ4qP4aq284Yn0r1+v3JXfimBtiihRLm+FSYA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744585245; c=relaxed/simple;
	bh=ylMZa6Aq29j5mVRt3GE02Yo6uF53GO98O716dshVloI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DnN/+sSO9Dgp1OAYZ5zF5h8o5iaYbNVOXqPA8AKMseuzFwhaDS0sjzTZvv3b8Jz6Z2wyJfCybOXB4pevt9aU8YRqCUclEh0FXjx1urd/QDddEBx///xfX2PkZx+5Ks5We/gXaB7X7n4++vVC+urKKlpnjtiyCbcqPhLbusGVi8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N/KwwQ4f; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N/KwwQ4f"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2242ac37caeso234865ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 16:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744585243; x=1745190043; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcijKGeNWU44eIj2ygDRvcCute3ez4NOIbDwZ6K3fSM=;
        b=N/KwwQ4fi17xu5OR6p4eYhmXVWm4ewdg8Y0Ftd7cbzvpH35bQCpHAevKdt1CDcer2t
         JvjdVpoYp/CqxG8Yhj5f/5CI3dgd2QNcsINovvpGZv/EqXpN3Rcx7OKbBGoO5CjCzAXt
         6IpU7xDeF2+28OoMYNQ/2vXSsYzddVJV0JXKiRXWpj306vcu/sBuy+yZj9lu6XuH/Vho
         picyRm+HwTg26US3D48WFOyA9IMiqOq0YB4ewd56AVq4ngX2RGnLd+hSsUDb4CThS7eY
         OZ/cv8eD5KSAmrjgEnjwgQUyhyjnNfMA1O81hooBd0XYdQgf1uFQwCYZ48PFU3kRz6Mv
         9clA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744585243; x=1745190043;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcijKGeNWU44eIj2ygDRvcCute3ez4NOIbDwZ6K3fSM=;
        b=vmSWWDQGDI5JnicKsg3VLLufjadQC7EnGMUZPNUKsMdXGmvLZk1bQRveatlFsxKjqr
         yZ1ukQPV4hru0XxNXn/cXtVARQd77kfg702/5HYBTgBJr3ujsjiQPqrIISec8Z/H459o
         ZPHJK4q7bpuyeAhLOznnUK5tmFYJSGoOUQFDMtKMOQ1biisxOhr4lc8yfI6LKAWfqyE3
         1/TTTAncIxKVjHCKC4uJROUSL9UOixnQaZAd7rbuvXLBoxQp2Yzckdq3dxsBnOYZYKnk
         gzv67TEiN5uRVFJkulvWRVUnSR5qwJA6EDcsOzAc+IQjo5RkOQ8WM9iFE4lfb6IihBB8
         qJBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbASlC41o0m2b/zmGX8JkEkEvQGwPb7uoNENGfnFOIvb+BqsHhxYreBmo7vzD1wiR+zwN4HGDXsGQo40g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzunHfK63s+5PXd2+x426+3UaQ0m6maFHozyGXDHeJIYve8lgLG
	pQ96CyTNqYZQxN4TjTY36mEsSvjX8HSQfKdrGRfn+kggk1lXS/XXu/7PNcwbtQ==
X-Gm-Gg: ASbGncukbGSS46F7/v7lRVqKscbVvokxgrlN7GlCdRwQLqloWusraS7usAELjN3m1UY
	uKy0xQhZOmVJpefa/0hLKURk42YM/S4YJWYsUzrTjgqNq6dYbRg+Nr3d0XaHw071tvbARJyM9ZR
	Unh2qbCKxHHmTFMoIFgcArI9emIhnrKVEOlpLrADCOeHKVjqVLXG3qq84Qo/Hvr9n5pb11937OA
	+XXm9S0rGUgPSE3mkNJuSFaCXeLFcGxqglRzFxvc81gP99LjBRo1UwPpMoL68i1nF30T9Z7QpS+
	5m4X3euXYnYxdzHED6kDmGB42DYZphtxyZlQv0p1TlFAK9fsF7SLL9oSvcpP4dSflYBAd4iHkTt
	9/5pAD2j8LX5U8WHc7DzzoDDS6QyIujQyIUo=
X-Google-Smtp-Source: AGHT+IFx60v074gs4AMnQgafHZpx5rGmP/N6w9NBkIiYBjItVWW/1kCo6dcv+AZwAtWyGk9dPOEPQw==
X-Received: by 2002:a17:903:32c9:b0:223:f479:3860 with SMTP id d9443c01a7336-22bf453906cmr2947865ad.18.1744585243089;
        Sun, 13 Apr 2025 16:00:43 -0700 (PDT)
Received: from [2a00:79e0:2eb0:8:f229:adb7:460c:4b5e] ([2a00:79e0:2eb0:8:f229:adb7:460c:4b5e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a12c8ac4sm8257942a12.46.2025.04.13.16.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 16:00:42 -0700 (PDT)
Date: Sun, 13 Apr 2025 16:00:41 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: Kees Cook <kees@kernel.org>
cc: Vlastimil Babka <vbabka@suse.cz>, 
    Sergio Perez Gonzalez <sperezglz@gmail.com>, 
    Jonathan Corbet <corbet@lwn.net>, Petr Mladek <pmladek@suse.com>, 
    Steven Rostedt <rostedt@goodmis.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
    Sergey Senozhatsky <senozhatsky@chromium.org>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
    Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
    Roman Gushchin <roman.gushchin@linux.dev>, 
    Harry Yoo <harry.yoo@oracle.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
    Randy Dunlap <rdunlap@infradead.org>, Tamir Duberstein <tamird@gmail.com>, 
    Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
    linux-doc@vger.kernel.org, linux-mm@kvack.org, 
    Thomas Huth <thuth@redhat.com>, "Borislav Petkov (AMD)" <bp@alien8.de>, 
    Ard Biesheuvel <ardb@kernel.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Andreas Hindborg <a.hindborg@kernel.org>, 
    Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org, 
    linux-hardening@vger.kernel.org
Subject: Re: [PATCH] slab: Decouple slab_debug and no_hash_pointers
In-Reply-To: <20250410174428.work.488-kees@kernel.org>
Message-ID: <f381d2f4-f86c-e714-c67a-1d060b8669d5@google.com>
References: <20250410174428.work.488-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Apr 2025, Kees Cook wrote:

> Some system owners use slab_debug=FPZ (or similar) as a hardening option,
> but do not want to be forced into having kernel addresses exposed due
> to the implicit "no_hash_pointers" boot param setting.[1]
> 
> Introduce the "hash_pointers" boot param, which defaults to "auto"
> (the current behavior), but also includes "always" (forcing on hashing
> even when "slab_debug=..." is defined), and "never". The existing
> "no_hash_pointers" boot param becomes an alias for "hash_pointers=never".
> 
> This makes it possible to boot with "slab_debug=FPZ hash_pointers=always".
> 
> Link: https://github.com/KSPP/linux/issues/368 [1]
> Fixes: 792702911f58 ("slub: force on no_hash_pointers when slub_debug is enabled")
> Co-developed-by: Sergio Perez Gonzalez <sperezglz@gmail.com>
> Signed-off-by: Sergio Perez Gonzalez <sperezglz@gmail.com>
> Signed-off-by: Kees Cook <kees@kernel.org>

Acked-by: David Rientjes <rientjes@google.com>
