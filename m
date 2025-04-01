Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D061E2606
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 07:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743492049; cv=none; b=PZVJrZbwvsjkH2t94SyWgNakmGl+MRgiBpj969dckc4+1v4nuXd8N7OtAUg4YUvTvGeiKKqgLCuNpqgTTbtW1xNfVYVCB5pYvO8CNUaebCT3vab3fbXpq+JxBLqvJfqpBxs7pCEBoyws+to+LmXMCLZZT1PS0EvWIH6xHwZVFBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743492049; c=relaxed/simple;
	bh=IpyimrQSSkylOuSmeYUIWWedL2EoQBr1IdLla/29YXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JzbGvPz1U0QB5TO/Y/Xv47LgOMH0V6Z6avcywvicagj5Sr9AxYK+zuRtK61A1EYgskLIszcjH1vZD5QXEe/c6iKxwHVHO3+ycUmg1gOujc4XoWs7M4giK0/NWMiKxYOb8iCOY9kmGfC6PXaKs2nFMCw+hUZ4lY6fT8NkALDBNc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SNVF0/nR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SNVF0/nR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45CB0C4CEE8;
	Tue,  1 Apr 2025 07:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743492048;
	bh=IpyimrQSSkylOuSmeYUIWWedL2EoQBr1IdLla/29YXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SNVF0/nR2Eu11Yclfxv7CXnOEjiJl/zMyaafDxicEvqatNGhTQ3hI8zpnUZED+ZKg
	 XstFSg/djjGLhrTjR6Kg/H+J8LmCmfINcLjNfFAIUq5R24L4PLWmF2HpKd49YyBEIq
	 hAtleC9yZUnm/rSpFjiRCnj8Fhrt4eYqzJdAXndFCLAisvPkv7GT2LTKdl+07NK6CK
	 PhSINlkp6/EomxQbkksZOGfVeJpwAVMRdJTsniNDgbW4c90MYFzwDiEYOQdBkc7Hed
	 //pahRHFS3ydlD3MvNbEIQPLOzESR3Pq2F+AZyJo2woKzVTzXT2zj9jZK71XZDCWAV
	 jGdHs4QOCJR/Q==
Date: Tue, 1 Apr 2025 09:20:44 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Baoquan He <bhe@redhat.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, yanjun.zhu@linux.dev, x86@kernel.org
Subject: Re: [PATCH v2 6/7] x86/mm: remove p4d_leaf definition
Message-ID: <Z-uTzP2CpG9ntXY8@gmail.com>
References: <20250331081327.256412-1-bhe@redhat.com>
 <20250331081327.256412-7-bhe@redhat.com>
 <Z-pnCLaAp43kJVCM@gmail.com>
 <Z+qkrZcYbhdAVL3r@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z+qkrZcYbhdAVL3r@MiWiFi-R3L-srv>


* Baoquan He <bhe@redhat.com> wrote:

> > So the above comment should have said '256 TB' pages, unless 
> > there's some naming weirdness I missed.
> 
> Hmm, there could be misunderstanding here. In 5-level paging, PGD is 
> the highest level, P4D is the next level of PGD. You may have 
> reversed their order.

Erm, yes indeed I flipped those two, so the correct table should be:

  - level 0:                 4K pages
  - level 1: 512x    4K =   2MB 'large' pages
  - level 2: 512x   2MB =   1GB 'huge' pages
  - level 3: 512x   1GB = 512GB 'P4D' pages
  - level 4: 512x 512GB = 256TB 'PGD' pages

I'm wondering whether 512GB pages will be called 'terapages'. ;-)

Thanks,

	Ingo
