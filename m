Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1151030E84E;
	Thu, 19 Jun 2025 19:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750362782; cv=none; b=FHoISiBv6eZufXXGWeQJxu7z7NRvGCSBqsfYVFlaabyO27WE+e4yQW/dD2DX/tpur8vK/QyvoFvGUUn6A5mzSRi8bhoQI/3suNH+9+ig0sxuGMbJMmhqb1qSFLlEPxSFMUq8Wd/Z9pS575PED7IoeZXhRkumaZVwbj7V0Nc8LOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750362782; c=relaxed/simple;
	bh=m9wDA7RGFab5VWus2ZplLgLsCV9u2BDz7kyjXl6F4pI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=La6HCqSb4FFK4voNWE9y04M9OAHAQL66e+1NPgO/yCl4MX1AeiOZ5F6jpwd/NGz3K8vAP4AXjgOufNicKYfBKm3Om8kzTDKbspupn7BqUM1+qpMjAcK4nHjDhzSNrdFs+jtxrL7kTgLRY8HM7bh4usGSeEZrjN8dFFIfJWiBgGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqaXDKz5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KqaXDKz5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765C1C4CEEA;
	Thu, 19 Jun 2025 19:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750362781;
	bh=m9wDA7RGFab5VWus2ZplLgLsCV9u2BDz7kyjXl6F4pI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KqaXDKz5UcKReOuokCpMcDqNJLsYw1arvki1Li75bGmnOLJ44QLI0E/KT3jaOtE3I
	 9mSr3wG7ltuRvA4TNMaqS2J5E1ilyvYWlvOILFgmx1IIb6iofw+fT6NyaaqskrVXAk
	 RCy0gtmBTqyRJvPq5JsmrQLbHt0C8MwKShdlTnQpurYjzySBqUxb2KoSCt3JH8KhkH
	 w0FJwsZ6LarnFthJ8KFhg5ky9UmZ8jmJ2+2/cejRC8MIslBP58dBEqHD7wMgzqJMQl
	 bh2SW+Q7+W2cMdhIrDgqKMRtrCGuwap8zMWqlNqSe2KoRkwKuajICCj+ZXShYY4a+7
	 YcHnAyzzlItnw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250619083035.1835133-1-colin.i.king@gmail.com>
References: <20250619083035.1835133-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] clk: moxart: Make read-only array div_idx static const
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
To: Colin Ian King <colin.i.king@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date: Thu, 19 Jun 2025 12:53:00 -0700
Message-ID: <175036278075.4372.3898345624525344837@lazor>
User-Agent: alot/0.11

Quoting Colin Ian King (2025-06-19 01:30:35)
> Don't populate the read-only array div_idx on the stack at run time,
> instead make it static const.

Why? This is in __init code so it can be thrown away if it stays on the
stack.
