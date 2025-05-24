Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE015746E
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 09:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748078548; cv=none; b=H1YSetutwcDqryQiWeik2otmhzF3FK1DNT1vFBpiUzxVLOH9Cu604L1mNSaHsEyHCVgkIny5pr1vgaeySAeSxpjQWn2pPJnnU7frKIWdxRzARrdsh5SGxbbNFjyhgyJKLXxuDhSXEU+bdLv9fFov3czHSUuK+aHr0smP5M2Kc20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748078548; c=relaxed/simple;
	bh=wL+D4TXG3rCqm/5OHqcM+ig6W7ozMrG7h1gxbuU6iUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glT8qaIU+MAo0kORpdQ3LBsI7tL5aEr9a6eOvOMi0/5+kYoTF3xvUenz67K9g6OsosSWnuDZEtggHDjFDe/dNTTclZ8P2y9JPNqJsilLF2JZq1jWfCahsSMk36c6PbwLAijUPs7UMXF4HwCmAbzGFYKV4hVmYm3X+JznXJXrFbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwYqMNpb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwYqMNpb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C613C4CEE4;
	Sat, 24 May 2025 09:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748078548;
	bh=wL+D4TXG3rCqm/5OHqcM+ig6W7ozMrG7h1gxbuU6iUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JwYqMNpbWiClc/obinElp8X5Zai+fU+G0kz3CDgl5RuJeuEBzedZ6rBzuCCjVeH8Q
	 Kz7Y7pDGvDMl9izIomZm5BxKKnpAvdEzhDIHpwwby/CoVFOPSRAcURsCfdbLBm/+42
	 erC31cuhk4+d1EXPoUE35qy/G6arGGiy5oFu9QtgUkYHjSNUMPD3LJeYxj8ET3hWx8
	 0N9mHiAWOiTrQ/BzOn3JL5ghuyL2rtLnjTVNx/u/B1C9wxqND8GaDKTwyQp2rlTNq0
	 aSzAUDt75bU27hws4GIxzsxrMlxHOOyuaYa3VxVW10fP/nhDuepo5CsOKAOaOsqNTU
	 H4tEy5v2SzLhg==
Date: Sat, 24 May 2025 11:22:22 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	kernel-team@meta.com, dave.hansen@linux.intel.com, luto@kernel.org,
	peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, hpa@zytor.com, nadav.amit@gmail.com,
	Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: Re: [RFC v2 7/9] x86/mm: Introduce Remote Action Request
Message-ID: <aDGPzrdatjr6hdCZ@gmail.com>
References: <20250520010350.1740223-1-riel@surriel.com>
 <20250520010350.1740223-8-riel@surriel.com>
 <aCxLMsjkA9dBeKvD@gmail.com>
 <841d88f8db26f33ede5a9277efca77e331f45e7c.camel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <841d88f8db26f33ede5a9277efca77e331f45e7c.camel@surriel.com>


* Rik van Riel <riel@surriel.com> wrote:

> v3 will have much more cleanups, and hopefully a few optimizations.

Thanks!

	Ingo
