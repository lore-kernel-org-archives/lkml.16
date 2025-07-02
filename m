Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C680530AAC3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751468185; cv=none; b=dEVk9O3m6/PRCGb+Eqo4DJjmdYftLgDNHeDXqqNU7NgZ0hYJ+h9uDRR2Lo37lZ7ZZb8O7jz4jVrl7bC5gfWTCiOGPwFa7Guhykt9WF5hbj9YfuNoVCcFDbn86X/BDC8QK1TrRrQqmxTfppZW1taIcQDmMlM6O8YR+A/OkB7jpAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751468185; c=relaxed/simple;
	bh=jlLG8jw2XNIlLLgHIrYUC9gq9L9nTzzjq5qVeTmFLhE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ptgbkvMcNPZi2kJ+mz+2wDHSEH8zs4K6btfryF68lN2kIn/HkbdcCyzmyZlOppXt2XzD0iB8+7C5Kv9abhwhDqXE93NqtmRl+hqDhcIh2RfZ7QVBfJEsD8lS5qz6ZXN6Xohg4pxm70oDIj3sk/+7n6s+j+HOJKGybBfkERQPhfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T1U1GUmz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1U1GUmz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC87BC4CEE7;
	Wed,  2 Jul 2025 14:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751468185;
	bh=jlLG8jw2XNIlLLgHIrYUC9gq9L9nTzzjq5qVeTmFLhE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=T1U1GUmzWpPxZW62kG9X3X5PrwMGN5mC5Wj9xLzAX0zm53Qgq68T1zAkHyZWbVHEB
	 I4siZYfYqmAM6R3IPfouUT6Lwt8WQh7b5YzcogtAOLPQxQQoPHAY/pLKXGvOyFISxD
	 C7Elwp147wsDDxn1K9qvozPhAujCM8atjK1d176TRu4yNyNp4UDNl9vWoevMxLMxfI
	 5a01cEPmz/by2+45QWXjlE7YgXpBk+w2IQVadELcSyKADJGTExyUGnZNwhMzan2Z3m
	 YQsUsI62wYQUqxuTuj31C83KMNisSJB5k9t/EApyPlgrWbr1vJIK5DPj0jYhlUDBP9
	 tG1gNh5D0bWzw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, linux@treblig.org
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20250701145625.204048-1-linux@treblig.org>
References: <20250701145625.204048-1-linux@treblig.org>
Subject: Re: (subset) [PATCH] mfd: pcf50633: Remove the header
Message-Id: <175146818451.3021245.17001857329889901395.b4-ty@kernel.org>
Date: Wed, 02 Jul 2025 15:56:24 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Tue, 01 Jul 2025 15:56:25 +0100, linux@treblig.org wrote:
> The patches to remove all of the pieces of the pcf50633
> have gone in and we're left with the header.
> 
> Remove it.
> 
> The pcf50633 was used as part of the OpenMoko devices but
> the support for its main chip was recently removed in:
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")
> 
> [...]

Applied, thanks!

[1/1] mfd: pcf50633: Remove the header
      commit: 31ce8faafb965edadb90d6f416455b517244d623

--
Lee Jones [李琼斯]

