Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940C0256C99
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739208933; cv=none; b=IScx+ohkjLSF7vG1kMrVXTX+OxniztuSiCoAG4nTvwUqK7dvZJOeJD6VS9Zv25SVhdTtS6YTAKtJo5v1JA6mxbpfPW5HroZzenV/CEa0hv6Rp1G3HTdce2xAeO5i3mbAyh6TToeh34s6KIp4v8L0qJI1DnZXWmboxmGbtUZ6Q+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739208933; c=relaxed/simple;
	bh=0Da5ifXfaIU0u23xjWu+CINEb8DfI/EM85x2cAaw9TU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cqGxrMa1ZUHoRMAs8I3sX7DPYKzBLTzPzYWDdJPy0ZsDlaZbQo72U9hYs7h1cMZrvV/3tZsyEuH5nglCRPqt2T54m8uCr5n0faNd6sSoT3klZh4alJ5oC/ho1/vn/Qjn446HLxHHZ7OwPCzNYNqUHKlffmiCM+sIfZE/+FBgx1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fXae7kjy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fXae7kjy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17778C4CED1;
	Mon, 10 Feb 2025 17:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739208933;
	bh=0Da5ifXfaIU0u23xjWu+CINEb8DfI/EM85x2cAaw9TU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fXae7kjyWihtPCK8bsvGOIneyzctXVvgzd/dwnFmlLsQkTAGZ9o+VNGif9A+WJxpM
	 3DzBc61/K65hMppCE2k0bZZoXKMWoxEZQuH+tTAn206MJ6S6dWfaLIQd+BIbYKXixB
	 hh+qQ1BHoXSSPzuOkZeXLufmFV6yL5hZwEqvmfXCrLx1e1Atpx6q+pby3TWu2w2jYm
	 zyXTEuv/OKvXo3WhiWrm6dVH0zcRb9LO2YJB4HPt7ymVjBOvMXg7Qg/uB9Gy4+JwNk
	 9ViAgBFlHEayOA0gff+fYhkX8/SW7i1EXiysIfWk2ryj6LJSV4C1iUX7SphYWVX3MK
	 Hot/BvunchtDQ==
From: Lee Jones <lee@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>, Lee Jones <lee@kernel.org>, 
 linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>
In-Reply-To: <20250129152828.1802315-1-andriy.shevchenko@linux.intel.com>
References: <20250129152828.1802315-1-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v1 1/1] mfd: intel_soc_pmic_crc: Drop unneeded
 assignment for cache_type
Message-Id: <173920893184.1936133.2915361139033821166.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 17:35:31 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Wed, 29 Jan 2025 17:28:28 +0200, Andy Shevchenko wrote:
> REGCACHE_NONE is the default type of the cache when not provided.
> Drop unneeded explicit assignment to it.
> 
> Note, it's defined to 0, and if ever be redefined, it will break
> literally a lot of the drivers, so it very unlikely to happen.
> 
> 
> [...]

Applied, thanks!

[1/1] mfd: intel_soc_pmic_crc: Drop unneeded assignment for cache_type
      commit: 0b1cfd51841c69c024facfe59ea7bbe6b589a7de

--
Lee Jones [李琼斯]

