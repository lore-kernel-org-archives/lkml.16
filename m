Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5EE282E1;
	Fri, 16 May 2025 08:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747385432; cv=none; b=U6c5Ve03Yg4pxSc7Nu6TFFCfHI1tR2a0NDC5ulxBep1LLP4YYs3sCRuPd6z3AgSQVO7QHuHHPJSiAATIeEJDyoj4o37akjckmjvDM3afyNCcOztPgPhi/QmGIBP27JorT7L7jnyQ6XNsTZkPLK0gMB9ljW+X8pZytSfnJ4lkFOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747385432; c=relaxed/simple;
	bh=YeMsR+Q8rbkJfYosMP6R9lHZR953mBK5ZvA3rGosN7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PaA3ngtgIetN7bbTGuIlBtYXIJnZgSeOZJ61NfzCW+EmRINKHRdz6LzGqFpfFMBcb8X2DJZeS9TpV1xdtERVp8sgKfO+trQ2PwwwZ1EndiChBRcQyQ9QWUDwz1pTfdOz+kwjGIKUYYtYf7NQ2zcB0yiMx9is6yni1VKdnyjaJ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ao426/So; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ao426/So"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7955C4CEE4;
	Fri, 16 May 2025 08:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747385430;
	bh=YeMsR+Q8rbkJfYosMP6R9lHZR953mBK5ZvA3rGosN7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ao426/SotdeUutGnvr/v48OsPGYvwSjLfgXsOybB/VFmgil1AAb6jof8LQwHVP6El
	 EPjC6oNhe7ShZvIc6hADRfYqWv7F4Gp76D5uSvQuS5JmV9PRk7t9T7dZwt0fU6yDwY
	 ckW2HxDSAc0/oDNBx/HVbISiu/pbCOh5HdfLrQvi73dwAUSSNcC9OHFPdkmvBDWwHT
	 CCm0incPf5VJegM80R29kJEaeRa+dp0XFBrCsIQpKhkkmlX5AzxuEZGhIxxi8jvxox
	 fQuzdVYoBgVqcNtuJxesICnX6Hn5a2hqYMF3s/EOv3OaoXfSVS+5IAeyi9NlPzAawE
	 Hd+iMq9S/LSug==
Date: Fri, 16 May 2025 10:50:25 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] x86/cpuid: Fix CPUID(0x2) iterator kernel-doc
Message-ID: <aCb8UWg5bNNT5yT1@gmail.com>
References: <20250515202143.34448-1-darwi@linutronix.de>
 <20250515202143.34448-2-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515202143.34448-2-darwi@linutronix.de>


* Ahmed S. Darwish <darwi@linutronix.de> wrote:

> The CPUID(0x2) cache/TLB descriptors iterator has been recently changed
> from:
> 
>     for_each_leaf_0x2_entry(regs, __ptr, entry)
> 
> to:
> 
>     for_each_cpuid_0x2_desc(_regs, _ptr, _desc)
> 
> but the attached kernel-doc was not fully adapted.  Fix it.
> 
> Fixes: c4c9ea879c3b ("x86/cpuid: Rename cpuid_get_leaf_0x2_regs() to cpuid_leaf_0x2()")
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>

I've folded this fix back into the originator commit.

Thanks,

	Ingo
