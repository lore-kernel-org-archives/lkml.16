Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FA41EBFFF;
	Mon, 21 Apr 2025 19:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745262786; cv=none; b=OY3qrODjvy2/S6vzF9gG3wE492+zL5Bnl+h5cLcNoxrHl46Ak8ybRQlBMjnD+Y4uubnsDs7iPZR2cP0kk7ENs48CaJVuNYew90+xs6zjEJuiCcl8fsLiT7XsUamsUyG4vPqhMutNhK1j3fPBZmPWLa5pP5dQAmCULy6OeEoOHzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745262786; c=relaxed/simple;
	bh=BKkVEnLF4TJWYcbO2wHLsFrQEBgHpTv/FcMJ6OGMxMs=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=h1L7AVvAZwp6nDosRv3+KdKsfI4XvFisEGJtEI91tpG0d0fjeQC3OdRfLCIYwSA0HHEfiSG489P232rXosPMUwT/IZ8/pyUmpc91OxfCHQZbxglhKe/JAUa0/7z1ZO3SH8YccVh7Sm8Efut6+9gMjPyubBXzJakQRAK5exMmyvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=b4Vt08Qa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="b4Vt08Qa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF13C4CEE4;
	Mon, 21 Apr 2025 19:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745262785;
	bh=BKkVEnLF4TJWYcbO2wHLsFrQEBgHpTv/FcMJ6OGMxMs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=b4Vt08Qa9Dc9AB2eaG3RyJ/IIL4TIeHdl6P5AqdIrZByEAMeOwIggNrTQwhld5xBf
	 Vba98LSBRFEf4oXvsHRQPPWT6bvNUb1bsrdlNuZcbcvvMU8W5+NkwV7UkCteQ7tqqF
	 kPlvyWKRMYeDpxSnrtXFVrd/DHKk4xImbHJd2bg0=
Date: Mon, 21 Apr 2025 12:13:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ye Liu <ye.liu@linux.dev>
Cc: linux-debuggers@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-toolchains@vger.kernel.org, osandov@osandov.com,
 paulmck@kernel.org, sweettea-kernel@dorminy.me, liuye@kylinos.cn
Subject: Re: [PATCH v2] tools/mm: Add script to display page state for a
 given PID and VADDR
Message-Id: <20250421121304.8504ae5839e490450029f113@linux-foundation.org>
In-Reply-To: <20250421080748.114750-1-ye.liu@linux.dev>
References: <20250421080748.114750-1-ye.liu@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 21 Apr 2025 16:07:48 +0800 Ye Liu <ye.liu@linux.dev> wrote:

> Output example:

The spacing around the colons is inconsistent and a bit odd, IMO.

> sudo ./show_page_info.py 1 0x7f2c7de4c000
> PID : 1 Comm : systemd mm : 0xffff888116b6d440

PID: 1 Comm: systemd mm: 0xffff888116b6d440

would be more conventional. Or

PID:1 Comm:systemd mm:0xffff888116b6d440

> User Virtual Address : 0x7f2c7de4c000
> Page Address    : 0xffffea000b3a4000
> raw: 0017ffffc000416c ffffea00045d1b08 ffffea000456d408 ffff888104521970
> raw: 0000000000000000 ffff8881083fdb60 0000006900000018 ffff888107a41000
> Page Flags      : PG_referenced|PG_uptodate|PG_lru|PG_head|PG_active|
>                   PG_private|PG_reported
> Page Size       : 16384
> Page PFN        : 0x2ce900
> Page Physical   : 0x2ce900000
> Page Virtual    : 0xffff8882ce900000
> Page Refcount   : 105
> Page Mapcount   : 24
> Page Index      : 0x0
> Page Memcg Data : 0xffff888107a41000
> Memcg Name      : init.scope
> Memcg Path      : /sys/fs/cgroup/memory/init.scope
> Page Mapping    : 0xffff888104521970
> Page Anon/File  : File
> Page VMA        : 0xffff888109e135e8
> VMA Start       : 0x7f2c7de4c000
> VMA End         : 0x7f2c7de58000
> This page is part of a compound page.
> This page is the head page of a compound page.
> Head Page       : 0xffffea000b3a4000
> Compound Order  : 2
> Number of Pages : 4

I think the style of /proc/meminfo (for example) would be more expected.
