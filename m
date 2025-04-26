Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 664B72066D8;
	Sat, 26 Apr 2025 06:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745650582; cv=none; b=o+ivtBjLhYEvC1RHh32vp42qKQ5o/mwmrLVtKmgHNLQwKt8z93ivhv/2j27G6RgfYxS6zWJqT+tUi1YV9RaHiv9ml0dxfi9Y+pRyD28cJKtRAP1VQn+8MotqucXi8I0eVNUX3Chi9rWz/1zKU362r4yMsMIoJKfTPKyDm/kNgLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745650582; c=relaxed/simple;
	bh=XSKxy54eBhum8Qbqc10QKB1fAwIPvBWhoXm8x1vB8FA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ehLlsbT3YjIL2FP4N6w/TSy3Ue3TfLx3YUUpHZJ3b2OLGWPbt7GN8fuoOW8gBiDTordaqCCP3KxsP6V8xYbcAS1Up9MV/33Xqhzvyw+TLMdsDU+GMsyars/BcIjFZmWW67KYD8ip6KvSrL7CfLemhsE9ODrmPJsp0PcnEdaXQ9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 53Q6uDDF008677;
	Sat, 26 Apr 2025 08:56:13 +0200
Date: Sat, 26 Apr 2025 08:56:13 +0200
From: Willy Tarreau <w@1wt.eu>
To: Daniel Palmer <daniel@0x0f.com>
Cc: linux@weissschuh.net, linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/nolibc: Add m68k support
Message-ID: <20250426065613.GA8661@1wt.eu>
References: <20250426041212.4141152-1-daniel@0x0f.com>
 <20250426051423.GA8239@1wt.eu>
 <CAFr9PXkU3W6DdYKhHz13K7bk9bnik67R85wqYUwHeROKEx59zA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFr9PXkU3W6DdYKhHz13K7bk9bnik67R85wqYUwHeROKEx59zA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sat, Apr 26, 2025 at 03:16:35PM +0900, Daniel Palmer wrote:
> Hi Willy,
> 
> On Sat, 26 Apr 2025 at 14:14, Willy Tarreau <w@1wt.eu> wrote:
> > Nice, thank you! Could you please also add support for it to
> > tools/testing/selftests/nolibc/ and verify that it works ?
> 
> Sure, doing that now. For now it'll be using the mmu enabled m68k virt
> machine that QEMU supports out of the box.

Ah, I didn't know that there's both mmu and nommu for m68k :-)

> > changes. You may possible have to add a few ifndef, as I don't
> > think we've ever had a nommu platform yet. If you face too many
> > failures or just difficulties, please let us know so that we can
> > figure together a suitable solution.
> 
> I need to test actually building and running something for nommu but I
> will do that later today.
> Making nommu test automatically might be a bit difficult though as I
> think it only really works with some changes I have to linux and QEMU.

OK no worries, my point really is that it's important to implement the
test for the target platform. If it's mmu only that's fine, as it will
ensure we don't break it in future updates.

thanks,
Willy
