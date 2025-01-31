Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1536D1AF0C9
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 10:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738320300; cv=none; b=W6mQLSCHCuC6Yssm1/PZ3kYCYxanVPZG9XdjIIv6uV/j2O3ST1bprwyzTDovTXw78sDJOnEotUV3NAfnA3ANmSnN39Cjs3p+lWfjjvYVZ/qFy/1iy/eH5isufpzwQ6DKTfWFxJkYufMs1765rfWc2V9oRanUMtunGmK025LzugA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738320300; c=relaxed/simple;
	bh=9F3nwnDU2wWXAmrBtIHTPysnyNYhe0wnXN2X/X/MOZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WObkS1Dbbn7PbzXI8F21lTsZ9rjhxU3jO31J8Do8osvkHzaZGH4/zZ5vxKVKiRF266sA6MDxiqopkZ19kUrhLTVBiJ3oqhYums7FnQKgQkkDgIYic11nLj4ZHcDuX2Qm9aiGN5yn1VDZkK4hBgYBmGL9pRtb3mj09XESqD4bMHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nLqvfamx; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nLqvfamx"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4679b5c66d0so148731cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 02:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738320298; x=1738925098; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9F3nwnDU2wWXAmrBtIHTPysnyNYhe0wnXN2X/X/MOZs=;
        b=nLqvfamx5amDURmL4Xa47ot0ZrdxdBCKG3zkFeIywOlkn/La3bU74c1zPzsHGoVoEG
         hL+X/xpukZvHyOZpxbPfIVAFmE1Ne6dIUa4dpLua/JYuuH+x8k7uAC9unJmFQabdU7XT
         YnaEb19ELZMPafobYefOwDFT0mrddRFN7OETEqUUwd9cDIej/EuORMxV8gUP03xfIrin
         LB+1ejS2nhUP2ePQm2in6vHJ+mz4mUmX9ZE4Gihy2r0aRVtmdezjTm6nQcnAmd+jPEl3
         HTfvL77nkAHc4fn71iIzdgQQQv8zvWKyZT5JiljxywYUzTUY36o/xWmIn3Phpk+AQQov
         bS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738320298; x=1738925098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9F3nwnDU2wWXAmrBtIHTPysnyNYhe0wnXN2X/X/MOZs=;
        b=lYfZ05QKB6GKlM3hySPDDyiyFXp81fb0dhtF+PZ/C/9SNIDHH2AmuyKBriDhZL8EpC
         LsQFrXNvOTmB2W1Ck6DfaeOK/4zbnIHUXamTQgZTxg8f54QeE3U5MUJ00z8IKXbzQXdI
         +CzdkfCcS0mdKoKwv5/kPD8ZYS51YTIfkxQ29YvMUjoo6ta8TzwCLAVw1xMZKt6kOvDZ
         mvC5qEkdrj+4siTzytLtFn4yF+tn5gWhyuEIDeAUg85Mxv1kJ0xUuQOv1Wta1/BqAp+w
         LwUow/sOgqoRPO+VnjHmLRNhxmKb3a//vBlQHC/QG8Z+Gsg9EJg9hoR6/S3WmrZsnTuq
         H38g==
X-Forwarded-Encrypted: i=1; AJvYcCUJYDRXS6RtC5y/AePKhnUTaggbzUe04l11kTDwITNHrKyBwtnK0LtjFHEBq2paszWu4MX2DwtEPItkA24=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjaIw+CTwNpL0vTvmLtEity/GTF3uyOhJAxOinr/Tz0Y9r3VdW
	EHClMAVGBzrA6Llni3ZuTta0xCViM2NUC9tesRDnZUj8KBSrX5UehRcEvkZd/zNmgHfYNvmzZA2
	O8iSkEmHQua2LdA5PJxOPQKzI8P1+Hs2unhxteCO9+COg8hX1QIUQGso=
X-Gm-Gg: ASbGncugFelLEvv+9/VZX/5FZ+/OM90Su2yEZdlcYNfkPKcq+j2VOzkpc4RSk9jHLfR
	Uib0MEqDGcuueO1B6mpyOYsNqCfL/FSnwLptLs/9bScrIrgDGivwT4qBrFTudUnu8FQjCIbhoPr
	3lCIA0HVackqlGz5SIMIpUARvXqA==
X-Google-Smtp-Source: AGHT+IFmkkjadcqHeqZONtqnIUAH1FxuCw1w7so11MK12TLVmfISeivj3LjqKt1lp57vvg0PLk85tN0h+03UWQQqbjE=
X-Received: by 2002:a05:622a:593:b0:466:9af1:5a35 with SMTP id
 d75a77b69052e-46feae6c05fmr2946471cf.10.1738320297691; Fri, 31 Jan 2025
 02:44:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-objtool-strict-v3-0-8b51f94957fb@google.com>
 <20250114001440.cagqlvjfvw6ghsj7@jpoimboe> <CA+i-1C0MFQCLOah56wWQhPhtk4p0ynhxh48eTmQ0-0x+pB6fvw@mail.gmail.com>
 <20250130183042.GB3394637@ax162>
In-Reply-To: <20250130183042.GB3394637@ax162>
From: Brendan Jackman <jackmanb@google.com>
Date: Fri, 31 Jan 2025 11:44:46 +0100
X-Gm-Features: AWEUYZk4_iJ34sY5YTCCsGd9vQlEjBzq6Y4dd-USaLR_GrBzd3mOMg1wnqIZqk8
Message-ID: <CA+i-1C2rw6uNOpeY8fakco8T75udRhLJLxJ4CHgJNKBhbxGa_A@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] objtool: Add option to fail build on vmlinux warnings
To: Nathan Chancellor <nathan@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Jan 2025 at 19:30, Nathan Chancellor <nathan@kernel.org> wrote:
> It looks like it is in Josh's tree but that tree does not flow into
> -next; IIRC, they have to be merged into -tip to show up there.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/log/?h=objtool/core

Ah nice - thanks for the info.

> For the record, this will be disruptive for clang users because a number
> of warnings have crept up in recent releases and this option will get
> enabled for allmodconfig.
[snip]
> I think Josh already mentioned it but exposing -Werror for objtool is a
> big committment.

OK yeah, I hadn't really taken the implications on board, i.e. I
hadn't really internalised the fact that this affects builds where the
user didn't explicitly opt-in to strictness.

Do you have a mental picture of how sources of objtool regressions are
distributed in the kernel? I'm wondering if it would be alleviated if
we enabled it for stuff like defconfig and tinyconfig, while disabling
it for allmodconfig/allyesconfig. Looks like LTO_CLANG_FULL does the
latter (forcefully) by depending on !COMPILE_TEST, maybe there's
another way.

But I can also envisage a world where that creates exactly as much
work for you, just introducing Kconfig hackery for no reason!

> If exposing this to the world feels too premature, maybe the flag could
> be added then have a make variable like OBJTOOL_FLAGS to allow a
> developer to pass it through if they wish?

Yeah, that would definitely be a reasonable start.

I'll wait and see if Josh has any additional thoughts.
