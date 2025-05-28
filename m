Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20C94C9F;
	Wed, 28 May 2025 10:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748427940; cv=none; b=JevuTB0IuWyY5A5oPw4f9OOLFikffDbHXqZ0U6/SI6+q8bxO26HOu5CYVDmcOrmM/hry2nVlbVb/urD6T4F1c/3j4nXCkEfvcC1TpWUKgPTUAkbGSEUDEzzk6MdQiZZKmtAIZBR1lhaj8u3+x0Y9qnKMfeSNsGVLdzkz2DMMzf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748427940; c=relaxed/simple;
	bh=yn1kjL2j1FxCyhnNv2768phSpYJ1y+Yq4unHgP3yEYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tiZoswM4CYQodJw4iUurrhU0WrHsAn6xka4cmkb9Sxk0A0+aLSIzY7e4u5GdrvDuC9SxnK0MU0v3LlvYKh5i1/jZERW7jYtM3X/s5YDhK/Uih7reu4sTir84nSikIjtyHXE3EtrskyBXCRdfGX9x6NMJ+RY5lp2uKl0xOswB1cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PkB48l0v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PkB48l0v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2615C4CEE7;
	Wed, 28 May 2025 10:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748427940;
	bh=yn1kjL2j1FxCyhnNv2768phSpYJ1y+Yq4unHgP3yEYI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PkB48l0v++wCEV8s2dXt2Dw06PfEcbrcuMSMrvCacLdXQe3QBz3HmibkNyUel6Lxy
	 W4f9drmzm6dH42rkaWYVoei9KviWmlXFUX3LL0DtSihkxW3vlm9xEkG578BAWThihu
	 Ysmn+GOTVdV8ptu8PrLmuUlM8kMcCId9iz1nc87xiNMhUet7Z8UY8i43cvY3bt8PPv
	 7u1Ppa2oBHkIzbf4Nef+SBYCKTv54HNyzKg94saJtwn/bo2SuqR6V3DdF67OR7b3RK
	 erkXdxHbVA4XA8PHVx1q0yTLG+oDOsf+QBUU8tekwSRdAKpI+pkS5Cj6SyrqpNhmHH
	 ew5OUEqwBTZSg==
Message-ID: <5853f5f8-004a-4107-acbf-31986150308a@kernel.org>
Date: Wed, 28 May 2025 12:25:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust/list: replace unwrap() with ? in doctest examples
To: Albin Babu Varghese <albinbabuvarghese20@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250527204928.5117-1-albinbabuvarghese20@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250527204928.5117-1-albinbabuvarghese20@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/27/25 10:49 PM, Albin Babu Varghese wrote:
> Using `unwrap()` in kernel doctests can cause panics on error and may
> give newcomers the mistaken impression that panicking is acceptable
> in kernel code.
> 
> Replace all `.unwrap()` calls in `kernel::list`
> examples with `.ok_or(EINVAL)?` so that errors are properly propagated.
> 
> Closes: https://github.com/Rust-for-Linux/linux/issues/1164
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1164
> Signed-off-by: Albin Babu Varghese <albinbabuvarghese20@gmail.com>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
