Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5354F1A29A;
	Tue, 15 Apr 2025 00:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744676234; cv=none; b=GND9hImpy85geSKJyVR1x4crPZNHCatMp/kzhxznufiqaxn48g8m1UTJO3wvi1JivmtcHKZuywQw6V4QF6t4pTmYLOpLpf4gHvq6ZjDKBCuRurZp9AiKxgF9POMINgF14yaIIdY4hYo1Gx4ihyQL4zTgRVKF5lL6YpeGuZmlCZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744676234; c=relaxed/simple;
	bh=u8pUDLjTJYg0M7lx8nH/iZVN19UT7IjeebixwVF3GWo=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=tGG8Yh32kzRGKd4XcfPsvJmsA5dNHlgbq5NlsINWpfzTwCp88jRSwmThx4twDAPQbMnfZAL0k6UIqjl+RMO8nIGf5qRuQu0sbKP/GlEHm2bW6GnTG8P1pkj0rU57fc2jOAcVF/a8ETTGYXnqtueAod886InkYM9sw8OUJfcHnqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GmOc4dKx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GmOc4dKx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B86F5C4CEE2;
	Tue, 15 Apr 2025 00:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744676233;
	bh=u8pUDLjTJYg0M7lx8nH/iZVN19UT7IjeebixwVF3GWo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GmOc4dKxSbt8DH+9plUWbWoiDbdrlVcVnMOzzA2tON8bTTt0aDzKDCJlFQ+878V1Z
	 rKo6oloFxv/lapdi8ojCoG1XgUd3PWBYWBAqZ0imC30oBzJjJKm+1/wx8tlGNZTkrF
	 kbu301SZrXLy2IHWY8OzqtEw1W84WvycbdObw+cduXEJ1Ro5YvFVO35aEVsyjZPmDr
	 S3fpPVH3XycaUiWck++UnzrgwjVWn0qKEdPhgXVcphQ5TRUGGUIcqbxuJLzfg+VlpZ
	 XG3ENnEjgq5Od/LVCUKq5VluxXKVH8+26GbjFThuCAu5+Px0REO/7CwViOqMD0NY/8
	 BmCtSY87R/8bQ==
Message-ID: <8494f5e76de6544e3d83b5b763ca42a2@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250409-spmi-v4-2-eb81ecfd1f64@gmail.com>
References: <20250409-spmi-v4-0-eb81ecfd1f64@gmail.com> <20250409-spmi-v4-2-eb81ecfd1f64@gmail.com>
Subject: Re: [PATCH v4 2/3] spmi: add a spmi driver for Apple SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>, Jean-Francois Bortolotti <jeff@borto.fr>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>, Sven Peter <sven@svenpeter.dev>, fnkl.kernel@gmail.com
Date: Mon, 14 Apr 2025 17:17:11 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Sasha Finkelstein via B4 Relay (2025-04-09 14:52:13)
> From: Jean-Francois Bortolotti <jeff@borto.fr>
>=20
> The connected PMU contains several useful nvmem cells such as RTC offset,
> boot failure counters, reboot/shutdown selector, and a few others.
> In addition M3+ machines have their USB-PD controller connected via SPMI.
>=20
> Signed-off-by: Jean-Francois Bortolotti <jeff@borto.fr>
> Reviewed-by: Sven Peter <sven@svenpeter.dev>
> Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Co-developed-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---

Applied to spmi-next
