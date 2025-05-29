Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856DD22AE6B
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 14:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748529398; cv=none; b=kvn8Osi95U5ANfY6AhPM/Nz6UqrTFiX499icAoeYg4gcKLKOZfGgIuRupeEdvQQObF57gGnXBa6aWlJVv3eqwwNqcMMUvYI3PLfy1tx3M9JMGBXOud1B/Zft6lMGo8kxJIpn4CcdeAUjZWX+uA6h6suOf/MJyAuChzC0LAiHtIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748529398; c=relaxed/simple;
	bh=E1Hvr0aiKuXuUgEPMWVB//h7yGnjN0omlQtZf62bVm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIrI/nR/A/e1YQ/71wyRSJhOPnhzCrc7sRXeFAkqBg9XnSyevhF/eJCK2Txjm/wCgK8FIae0OJD/Xx8pNte8dBvLcBVvGmYZLJlVoBg0eWzDzth8seUP8lpX1zjjmscssf9yvTt4Q3//NQbqyIDiIy+EE3q/3U7mXhRsxKti3QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=YSFvfWxc; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="YSFvfWxc"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7cd0a7b672bso63748785a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 07:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748529395; x=1749134195; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E1Hvr0aiKuXuUgEPMWVB//h7yGnjN0omlQtZf62bVm8=;
        b=YSFvfWxcXgB60DNgiqJCfcGN3JpQf1octpJW8j+a1DbaMMMy+ductnLS7S4nD0MH1Y
         aWez51DZJRKNJnLCJFu0wQhPc5f5f16Tb+G91XtoiTAmyZebUsC5FlXKM/3uEJvMqbXx
         s4wx4hHxuS2for/oa+qyiNpUy8YtQ7rbAxxpbgmEgnkfuS6Ow9eYFIrVy4xgiNLjKnzf
         0pXCQ7j/z8ckEb3bPZKy/RdZz5HWJ7ItKaIVrPduSW6xhtk/xk/0Zp4LkvK91MnVEMju
         yb/9xAvXi30eXa7D3w2Cv/Yog4C2QQPNZdk0r3f+oInLa4YLw9lbvn96QGwZ5bRw4RMw
         lC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748529395; x=1749134195;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E1Hvr0aiKuXuUgEPMWVB//h7yGnjN0omlQtZf62bVm8=;
        b=jdXu8mLsjeGq5li5AoWuvOWcboT8/EsCZcuuCl4oooI4+2ThjCQnU63ZWKHm9CioZj
         VCnYPUod70EZFdAtbwSd69boNwj0AH3sLK/sS0tMdyn2EssNv2Ot1olvyheqtZVse8/3
         KRUA5S5qWDrIbnkjhwc2m9do1j+8w0Z16Ivqc+xBxLFZZO0uwucBeuchGPFf83QGSyfI
         fRi2+rAJVMNmeY42CxMJhYwcB/CKG29G6cxTT9qKMUrTk/SRy3GeS2k0jNJtYD66ihHB
         9vEF3j0mVMYx/sFgvlgWpLP3wLCYRp7L/yFk0L0C4fY0MWeeettNv0849qrlP5fVOZLj
         xlMw==
X-Forwarded-Encrypted: i=1; AJvYcCWnYUe3erg3XHv4bln8WeTVAeACS2GZWL4dJ7ZhBnys4TU/eMD/FwK+tj/ch8lD9xVlOgpoBGJ2Ok7LRYc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/de4H//spfEEXOUjVpQIzTz53nfQjCPtZYfVkzBGYA4w+Q1Ed
	fYHIsxJULStJfNYDGviGUdyuhaIjP2AYTUhgly/pvLyF4Xv4QqJv/F9DqOPdy83JfUY=
X-Gm-Gg: ASbGncvUTq7HvPIjjfi2NrsDoPw9UAXKZkZn1DChhps6oTlOvDmSqfLjR9nZr/wB2hR
	flqEJTpUle1qvzihnb/uuXvWaESetLCwQEi0c4P0lofxVforTp/PkOp7iT16XEMFsNdQ74ybbsP
	l1aXpRvOFg3MoyrKhRJOaR634jdv/P6clHboE03uAK3ZCrrwcpyY5e2LLRoAyIFmglHNA7eIEq0
	+MkWozkAn73LMud2ipYu83vx1uEBejIbzF/GMdRx/IsdW/v/kuQQn1gBZZ5dp+Xr3pMaKTpuyon
	3Nlz6eO6fGSkgNI4tgdZL9XMbM1eCOayBHUSOGCif8SYvR68CJcXXhSGSyZq/kP1Ie2MMHaIThc
	pSRPoAVCtnSqwa2BpS8pCWfHOhQ+W0Ke0AoRraQ==
X-Google-Smtp-Source: AGHT+IGpcYVT5cYIdznQQc6oKOroKWgcBUMZpSmhMxRN4GrkZsGglFNBG5TKOZ7dmu0d8fNzvRGa1A==
X-Received: by 2002:a05:620a:3199:b0:7cd:92:9f48 with SMTP id af79cd13be357-7ceecbf94f5mr3319030085a.52.1748529395150;
        Thu, 29 May 2025 07:36:35 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a10e3d0sm99198085a.50.2025.05.29.07.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 07:36:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uKeN0-00000000wqC-0IaM;
	Thu, 29 May 2025 11:36:34 -0300
Date: Thu, 29 May 2025 11:36:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, acourbot@nvidia.com,
	dakr@kernel.org, lyude@redhat.com, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	open list <linux-kernel@vger.kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>, airlied@redhat.com,
	rust-for-linux@vger.kernel.org,
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Sui Jingfeng <sui.jingfeng@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH 1/2] rust: add initial scatterlist bindings
Message-ID: <20250529143634.GD192517@ziepe.ca>
References: <20250528221525.1705117-1-abdiel.janulgue@gmail.com>
 <20250528221525.1705117-2-abdiel.janulgue@gmail.com>
 <20250529004550.GB192517@ziepe.ca>
 <20250529161424.5cd95308@meshulam.tesarici.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250529161424.5cd95308@meshulam.tesarici.cz>

On Thu, May 29, 2025 at 04:14:24PM +0200, Petr Tesařík wrote:
> Thank you, Jason. You already made this suggestion for the RFC version,
> and it begs the question if perhaps the underlying C API should also be
> deprecated and eventually removed from the kernel.

It is not "broken", it is just complicated to use right and doesn't
fit the sematics rust would expect.

Yes, it would be nice if more places used sgtable and append instead
but there are so many places and many weird special cases.

scatterlist is so widely used and in so many bonkers ways it is felt
to be unchangable.

My advice is that rust should not just have a thin wrapper around
scatterlist but actually provide a sane correct higher level API and
wall off more of the difficult choices (like set_page)

Arguably Rust shouldn't have scatterlist at all, but only sgtable
which is the higher level and easier to use interface.

We also just merged a non-scatterlist DMA mapping API, maybe rust
shouldn't have scatterlist at all. IDK.

Jason
