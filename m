Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319F620EB;
	Tue, 10 Jun 2025 16:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749574521; cv=none; b=X7hydsMhxUsGq/ThvTqBFgtzpY86EgChosAmVKU2GngoRd82vdcvRNUyYvpiNLqPQFwuj7IDw7oy2nSua8D7R4MmVka32gkxODlXHT6JoBNyWbKPskF1iMpJYFoBO2Gtm5kpFWRg7IWpzO15ss2aTP5Uy2C/Rciuow8zoUeGVE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749574521; c=relaxed/simple;
	bh=At7fLLM3/wUfJY275dT5xd+eA31XOZAJZjSF5Ow50SQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R4kILO1BFjSO/xt+CzR+Y/YyYpoI85fiRn9BiSjkWH0hsVP/e0hHc9ofC3kqYhv9EKObsmEkz5be8lS0Wm7fj0ftikWI9btKNMAoPXSWsrKoaWK9m4/F5uG7flA+Zz06oR+3VJp8yZ5C9dwL1OwFIkWwVVKmnNgqa3aohzIkBNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/7PGg4v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/7PGg4v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30B3C4CEED;
	Tue, 10 Jun 2025 16:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749574520;
	bh=At7fLLM3/wUfJY275dT5xd+eA31XOZAJZjSF5Ow50SQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V/7PGg4vBMuJlJlIj7WXC3CJmwgFsQ15PjdFh+RXw9T7MsrVMCKTg9YMrXR/39ObD
	 mgkUaafLOIykXPMXRXyyMZdUnuTzBv9GzTOtha+FJd34LXQYLNt7dDREAgrQTtp62Y
	 Z8QMrp8UmfJnu8SG2uipUAY5ZTK9jwyV+UqpiDRznJtJwrf7b+tWHNmD0E2QyqipHG
	 OGbEsv9u2O9ZnuGSEE9lB/dMziEa+Zh4oXOaboU9052JMYAGMeXS2XASXYTo5CrG20
	 4bbgHlsNp4v59T24YsoG3SYNBAkL9QTQmr/AWlN1BMiE/nGoH0LEJxFPBAmdrBJWuS
	 OK6aNYvYSiXqw==
Message-ID: <2701ffc6-40a1-4004-ad42-1b096fa1c095@kernel.org>
Date: Tue, 10 Jun 2025 18:55:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: spmi: Add Apple A11 and T2 compatible
To: Nick Chan <towinchenmi@gmail.com>
Cc: asahi@lists.linux.dev, Neal Gompa <neal@gompa.dev>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com>
 <20250609-t8015-spmi-v1-1-b3c55ad01491@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250609-t8015-spmi-v1-1-b3c55ad01491@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.06.25 16:59, Nick Chan wrote:
> The SPMI bus found on Apple A11 and T2 SoCs are compatible with the
> existing driver so add their compatibles.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---

Reviewed-by: Sven Peter <sven@kernel.org>


