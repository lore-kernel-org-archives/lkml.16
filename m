Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5CF258A;
	Fri, 30 May 2025 16:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748623475; cv=none; b=jcEB1Llq6pagE/JqLeL0l0UWmQY8AxvClOgM0EueWY3yolY8GLp5wg6RwTgKG1EfEsp4HnL9Van67oMACjnqQXy/jMhmKWS/3bpwRk7CLY5PwAMlcfcqZlDraHWiWIVL3ZHttTlSFyFsbNevC8hqm5FxqnPoNGenYX/qhFHFhto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748623475; c=relaxed/simple;
	bh=W5OpwwUyJIIM5VqI45VotpF5enCBTC5BSFX/2o6LIuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0b0hjT379MnjVe1rzyWmOQCxak3n9SOe8I0opf+XgMl4kjUcdTV/Smg+r6pP24PrhrPennzRi0FcUFmmh+J/30bHfTnkZzlq4AC4FZahO8Oswt0vi5lRRSIWbb7dL/YDetQifyYcIK1f2hls/6cT7yeHicU3scEWtGf6OaYmJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E1LkJqF7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E1LkJqF7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12162C4CEE9;
	Fri, 30 May 2025 16:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748623475;
	bh=W5OpwwUyJIIM5VqI45VotpF5enCBTC5BSFX/2o6LIuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E1LkJqF7WWdLxXgE6GXThQxaANeHlK2/YO+4RzDNtgNYnx3C+q6JJV6xO6BzxkDSr
	 rbmBm6Ds4EnWVMylvEy66N0V/cah6rL98swZNnty9fnd/nAQyNoZdWzLRq7ZhsHj7O
	 iXGOS0Pksrut4PgAlL2LECTnwUo6Q18qZdqUQJs3M9EBEkhH6NMc3JGZRYuQaTAQvz
	 n6mKpG3oShMiwwAMwUmrx/u4jqh9h1+nJkeFbXqK4hbvA8ieGj4U7cfguADG8B5u6z
	 LizuhbySsVIo8dDXJk7wJvkNCQ0vHVy9Y4KQgcrsLLhNXgPrGmDWRFTKAwa5qMTsQw
	 5ayriPv8tcAhw==
Date: Fri, 30 May 2025 17:44:31 +0100
From: Lee Jones <lee@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>,
	ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the mfd tree
Message-ID: <20250530164431.GB7758@google.com>
References: <20250526140400.54ac8a6c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250526140400.54ac8a6c@canb.auug.org.au>

On Mon, 26 May 2025, Stephen Rothwell wrote:

> Hi all,
> 
> The following commit is also in the arm-soc tree as a different commit
> (but the same patch):
> 
>   0ffcf5f1e41c ("dt-bindings: mfd: qcom,tcsr: Add compatible for ipq5018")
> 
> This is commit
> 
>   1d2c5d5f3f44 ("dt-bindings: mfd: qcom,tcsr: Add compatible for ipq5018")
> 
> in the arm-soc tree.

Why is this patch in the arm-soc tree?

-- 
Lee Jones [李琼斯]
