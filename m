Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0134226170;
	Tue,  8 Apr 2025 06:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744093769; cv=none; b=SXqEqoD/IFjlnrML+C2dGs0W/R9GIvCujQy1UqxTzoy1hPYj+kBvfo7ldxMRLvI6fbQ/yZjTN1CYCLUdgCuyaIpAc/Ox/qfI7nvqmvwUpJFC2SKfJtKFjhyrH6ZKFxUAZXsc2BMpRMxDrGC5TUGYfJmus4TxGA/SX5CME3vgrFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744093769; c=relaxed/simple;
	bh=TZRXQXyAJjfumstgWlPjlJzn7XUS2S2DJGD2Io8pZrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WUd1du7FZFKi3AZUNSBp7nSpIKLiJNOYska7+qE/hJh255+LBYKLO/h9SkxSVNuDdUKSfGBW8KwNnBQjOL4tVGxr4t5L/LHJgsCFhhI8iiXuyz+nFJWYWlsSg3ogq4h+BVzcP2fqN47zxQq3vkbv5BuG2h0KUkAk3PkncTZ3PMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D3NYKgdA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D3NYKgdA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE3BC4CEE5;
	Tue,  8 Apr 2025 06:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744093768;
	bh=TZRXQXyAJjfumstgWlPjlJzn7XUS2S2DJGD2Io8pZrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D3NYKgdALL38S3fbgMTg/PelGxLq8NIML9a3wOQ+5DPzXYfIRaIfCIpZF8yAimzu9
	 8Hd2CH1ve0x+mFotzF2ozNBDWJMAivtJKYrVJoDIUV6wSIfJ7j8EsGAFn+ILEMqpvb
	 kIoeF1cyMdUBvYrQHVHW8dwsoyNyIA5FskcTZSjTTo6oIEBz9ulJUQD1asV34sdrxT
	 gOWXfs65XKoeec7rSdF/W1CZElIrGxZy+A1EoDe+SSvElPcdEubi+YD182GeKkHCff
	 w+GeY8ZOGkYuut/1jLy6zzipVy9ZalCYIcqsZqz1BndnxjDiKkk2r90RQRXmtnL436
	 ULFhrJH/HdFdg==
Date: Mon, 7 Apr 2025 23:29:26 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Philip Li <philip.li@intel.com>, kernel test robot <lkp@intel.com>, 
	Guenter Roeck <linux@roeck-us.net>, oe-kbuild-all@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List <linux-mm@kvack.org>, 
	Alessandro Carminati <acarmina@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [linux-next:master 12681/13861] drivers/i2c/i2c-core-base.o:
 warning: objtool: __i2c_transfer+0x120: stack state mismatch: reg1[24]=-1+0
 reg2[24]=-2-24
Message-ID: <ozfqe7ppl6q632nzyimsxvs2vh2uanjaranc3kj4pca5uwzt7g@hmhmjvtvrmb2>
References: <202504011011.jyZ6NtXx-lkp@intel.com>
 <Z+ttzRArSBMqfABz@rli9-mobl>
 <xqfrt2rueezh3upug2umvuw2r44luoaxfqycnmvkh5sezaosw6@h77yjfio4ws6>
 <348cdb14-f8cf-1e7b-44b2-79dc4dda4e35@loongson.cn>
 <lcozyamcrcuff6a3pgly7sptluuj7ubzvy4na2vrus7hfmwmb6@zv7tooy3pmkh>
 <0cbe7ab8-bd87-b5f7-0513-07c82a7e76c9@loongson.cn>
 <bzy7cad37tafrbcmsstn355fpljxxmi25ifc4piihp6ln3ztxh@zp3c7ydsjmuq>
 <5f830e7a-7cfa-3c62-ba3f-f93808e95821@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5f830e7a-7cfa-3c62-ba3f-f93808e95821@loongson.cn>

On Tue, Apr 08, 2025 at 10:45:51AM +0800, Tiezhu Yang wrote:
> So this is a run-time bug rather than a compile-time warning, it should
> put the option "-fno-shrink-wrap" outside CONFIG_OBJTOOL in
> arch/loongarch/Makefile as a workaround, like this:

If loongarch folks agree it's a compiler bug, it should be reported to
GCC, so the issue is better understood (and can get fixed).

Without understanding the root cause, we don't know if -fno-shrink-wrap
fixes it, or just makes this particular occurrence go away.

-- 
Josh
