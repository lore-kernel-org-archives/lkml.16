Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E9529CEB;
	Tue,  4 Feb 2025 13:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738674552; cv=none; b=lFTRRVTF6mJ6Un0KZAeEcYoExbXDZUqz9E7rM90PHvzndB1rslgGRgawphDQDAZpN57CVX0rALnMWJ54XyfXdnGJhWH7zrgzl/j0Q4tPrfC+tjlUMnOyHFif07aiUAXK3ZEfSG+hDn1m2N+JzgVEMtfSy6hLPPMSq6V0PmgqxaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738674552; c=relaxed/simple;
	bh=HeGq3gDkjwQ8sGI5kYcTspmgODrJpr1IBbSirfssk1M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KJtTbrwyyK+YmeBeWIx1/luqB/Tpqbgtmpj+CiVmzz/8GzXnW+kKlM/6gQBsIiMJwnowSSxdKOBlnRD9m+cPAuvYNvygbIz3+031fyEUJvO8rJwrvdvTkYFXtREOx1+pQK/hHCBw4bTHSgie7HCdNpy95fMepn2bkCE15wOEXeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=alIa64Nw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="alIa64Nw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 942BDC4AF09;
	Tue,  4 Feb 2025 13:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738674551;
	bh=HeGq3gDkjwQ8sGI5kYcTspmgODrJpr1IBbSirfssk1M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=alIa64NwNAmFXcJu+OgvEsBEmChgnaLwpRL7osb8gWffNi5HH0rZo1apqxh+D6u7E
	 Zt71Bac9qa72Agt8Zrbtn6D3V647/Ov29t9SYB+BVFpyegWC6n5P29t+f3OxuPGbHJ
	 E4BXSWXuP6EBeldo9o8i8ndeDhndgpZUGwy0LMf+4QiKE3kNQDT6S27O5gHOEmGBWc
	 liweYWC7uMp3hRmfKSt4kyRNlWI+JyzMHsqGvBJ0Q61kGaPwfPuyMd+1kb3QTNrP0b
	 pSMWi1hFf9mGo+aYVV83PCsG1h3M7GCp9Be542zSNXue9qmo8YNgrL9vlDyLmyUHhl
	 wmmP1U13BV9Vw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Spickett <David.Spickett@arm.com>
Subject: Re: [PATCH] arm64/gcs: Fix documentation for HWCAP
Date: Tue,  4 Feb 2025 13:09:02 +0000
Message-Id: <173867198667.3989022.94600880351884502.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250124-arm64-gcs-hwcap-doc-v1-1-fa9368b01ca6@kernel.org>
References: <20250124-arm64-gcs-hwcap-doc-v1-1-fa9368b01ca6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 24 Jan 2025 17:33:22 +0000, Mark Brown wrote:
> In one of the renumberings of the GCS hwcap a stray reference to HWCAP2 was
> left, fix it.
> 
> 

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64/gcs: Fix documentation for HWCAP
      https://git.kernel.org/arm64/c/f64f9dddd1f5

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
