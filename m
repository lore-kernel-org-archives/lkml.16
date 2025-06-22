Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28BD3C3C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 18:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750616415; cv=none; b=XfzIu7/UDS2IKSlvzeoj0dRvt0YhYdgbmd3TA1Jbl0+o6ll6fgsCEj0XG5OT3tlphurUDQJvcNmIK/t6RWTm1CWAgqyyeEW6dfpkwXRGSnEH1sqY4ocfw/XpYg1Bgnvaf78be1wqMRomW3VG3FrfhCvgWMZaEBGl+0+O1KjWSxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750616415; c=relaxed/simple;
	bh=xKpjszj45fccyF1wniGznLW5sJu/kWH0mimsGFl4PHs=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=pvEL0FHQf8CRuTrmTKLuw/zlY46fHkaH23+DfgzpJvyl0yu8Lus83amSXeQoslLCRCs7Em9Sgsff/LrICHKbI6CrYHb4B8Kug/dHSikcbzOuzHCdzgDP5h1Z1cGTmM7obrEZ5Tlp4ICkr20P4HHi4LZbhbf1z8ICj92VBOc6/0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=0PRlNCEP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="0PRlNCEP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE17AC4CEE3;
	Sun, 22 Jun 2025 18:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750616415;
	bh=xKpjszj45fccyF1wniGznLW5sJu/kWH0mimsGFl4PHs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=0PRlNCEP8rSWb7O6GfUFvJYxk9E9xLV6tn+3XmNq/Sh/bsTbwOcbOF35r64cC55Tk
	 ZlsN2aFPatj5qhqfY2CUeB4epG4XgQFLWa3V4OEnqgDpt0n3zJ7LOEmj+gxs+HD/Rd
	 fGc9E1e/gTr2y1q5FNO5XhmCARnUFIe8xPRE6SJ0=
Date: Sun, 22 Jun 2025 11:20:14 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: andreyknvl@gmail.com, arnd@arndb.de, david@redhat.com,
 dvyukov@google.com, elver@google.com, glider@google.com, hch@infradead.org,
 kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, ryabinin.a.a@gmail.com, vincenzo.frascino@arm.com
Subject: Re: [PATCH v2] mm: unexport globally copy_to_kernel_nofault
Message-Id: <20250622112014.76bdd8929ecdb1c1fb3015b5@linux-foundation.org>
In-Reply-To: <20250622141142.79332-1-snovitoll@gmail.com>
References: <CA+fCnZeb4eKAf18U7YQEUvS1GVJdC1+gn3PSAS2b4_hnkf8xaw@mail.gmail.com>
	<20250622141142.79332-1-snovitoll@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 22 Jun 2025 19:11:42 +0500 Sabyrzhan Tasbolatov <snovitoll@gmail.com> wrote:

> `copy_to_kernel_nofault()` is an internal helper which should not be
> visible to loadable modules – exporting it would give exploit code a
> cheap oracle to probe kernel addresses.  Instead, keep the helper
> un-exported and compile the kunit case that exercises it only when
> `mm/kasan/kasan_test.o` is linked into vmlinux.

The recent 707f853d7fa3 ("module: Provide
EXPORT_SYMBOL_GPL_FOR_MODULES() helper") quietly added a thing which
might be useful here.  As far as I understand it, this will permit us
to export copy_to_kernel_nofault to kasan_test_c.o and to nothing else.

"might".  It depends on how "exploit code" might get hold of the
symbol.  Perhaps you/we can discuss this further.  Is the problem that
copy_to_kernel_nofault() is non-static?  Or it the problem that
"exploit code" is itself a kernel module?

In other words, a fuller investigation of how this export presently benefits
exploiters would help us understand how much
EXPORT_SYMBOL_GPL_FOR_MODULES() will improve the situation.

