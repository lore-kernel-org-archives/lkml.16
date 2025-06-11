Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13F31E5B7E;
	Wed, 11 Jun 2025 16:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749658661; cv=none; b=AZhHuPQYMw9pVyYvr/zuCn6M8Zxt2zf+ITP9czaKxZMhl7tyiIdoWolzLZM4xHaRpt945JPy2qUJNKgx1qCVK/ZCx/HiLYUjs2EGHqbZFCQjBt9gn6gGhWo8NRojE1L52K/Ixf0fmkKWueUW9SkMx9IK52DW3M8pNryURjI9hyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749658661; c=relaxed/simple;
	bh=PWJ0jR69mYAAA4w/gRE9a2Qqaj62sM4IlA2LaHYXWkc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=YtFTP28Sb/hmA7nWrrt4I4tx5q3uEseIVQcDx/RPQkt8+MpUNvMHnuC6b0NYKMtu67cObHhUaX0pzWSNY9VcDXA/i8kxo74tUYIwEwOrYxr5RFH1Jl545wpbPWr5963XJ2kxTaq+/cIzv8WWabDpflJwfeHPmsX0b4GE6M3RX/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qfKs4g6P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qfKs4g6P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72755C4CEEA;
	Wed, 11 Jun 2025 16:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749658660;
	bh=PWJ0jR69mYAAA4w/gRE9a2Qqaj62sM4IlA2LaHYXWkc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qfKs4g6Pm51Xy7Uj+LzikdAv05syMwL0Kni8/llFEilJQ0MTGn4jYLA3Re19FcJaZ
	 aMGkG5ZedR5eAbYn6DC8/kFRGeQzX0uQ+dQZAdIJvn1UlfjcdCAgbeTNQPxArsWE6Q
	 YQWwQuDQyHXnpdHwOItK82KXVXLcB+eC4/zuG4rVbF99LVITWmE9qHzkUjUlHTYoRq
	 PF8DgfrhRwSy9A2q1NIsgRcxIwkVcdhooRE164oFTVIp8YGYcxwUh/t77xgjdK2u/d
	 vzttpOmNTDokzQ/o+tTBAmJcKv4661ThkLTa1jVtLkI9trstwiU21vGD7jAPef/lxR
	 iDfUJixM0LWhg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250516081612.767559-4-sbellary@baylibre.com>
References: <20250516081612.767559-1-sbellary@baylibre.com> <20250516081612.767559-4-sbellary@baylibre.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: clock: ti: add ti,autoidle.yaml reference
From: Stephen Boyd <sboyd@kernel.org>
Cc: Sukrut Bellary <sbellary@baylibre.com>, Tero Kristo <kristo@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Andreas Kemnade <andreas@kemnade.info>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Sukrut Bellary <sbellary@baylibre.com>
Date: Wed, 11 Jun 2025 11:17:39 -0500
Message-ID: <174965865961.7717.9630949658019778760@lazor>
User-Agent: alot/0.11

Quoting Sukrut Bellary (2025-05-16 03:16:12)
> ti,divider-clock uses properties from ti,autoidle.
> As we are converting autoidle binding to ti,autoidle.yaml, fix the refere=
nce
> here.
>=20
> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
> ---

Applied to clk-next
