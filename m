Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4FA191F98;
	Thu, 19 Jun 2025 01:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750296929; cv=none; b=B1iRxAiRixuGzjG8rtUci734eVAe4DZQkfci6HkwxujTfstRzjmKnLUQn6IqopS8ONa2btc72mOrvOzhfyHTmx0moXPqBfvxnCHxlhCXExXTQdpWnR8reRxwSUZUg6K4Q+Es+YZfj70ARlhTqFOgDoYN65Nw6b1xaOsZ7GBy3Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750296929; c=relaxed/simple;
	bh=dRKh1LvLDN5/dV2JZCBWDUXhKSs7ktHhNhU24rTJYJs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=k9H5usKC4/4xAim75FJmPpJGJ7eoxZFFxaHH4ip50GdZnk4c/LMMsQt+KsX8cFCAPtui8I+kNHNlJRkDfIsLaIbmAsn0hgF+pb5S4kmvhie12dZFXnHPioNhaaBZu3VgYMk7qKrZLdjFtmb4zLPD6nC9Sb/NICjWgD4+7bpEIgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l8yS4nL3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l8yS4nL3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F98CC4CEE7;
	Thu, 19 Jun 2025 01:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750296929;
	bh=dRKh1LvLDN5/dV2JZCBWDUXhKSs7ktHhNhU24rTJYJs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=l8yS4nL3XbKAIiVfMtSN23j0cC7S/m/aXTEWHkCTWdziZ3/bZfWV4a9+HiSaWpr66
	 4N54LYlONTVScykvQys1hSnlU+sWfLBnLkAD1HykRa2njKTDs4p6KP0zBv3HwX/10y
	 BiVUpPDyMg4Nxl1K+4hPHJV1faRFXaRwAfK6xy1s3VPHAvyfJCFOCZumDZlzjaZGKd
	 GIHJIo+zE1xBAG0cimix9O9ld2K22f/jHNgkWh1QTUO8O5P7coLtX8IbIR3utgjQ+H
	 WU36nXR94M2CUiuWGFoRymmZJ+/OMbskTuSG9pR0T1mDao0bNd2oqQJFcOEx+FeeRa
	 S0L5TA8DhGDsw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250521004655.1792703-1-robh@kernel.org>
References: <20250521004655.1792703-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Convert APM XGene clocks to DT schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor+dt@kernel.org>, Khuong Dinh <khuong@os.amperecomputing.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring (Arm) <robh@kernel.org>
Date: Wed, 18 Jun 2025 18:35:28 -0700
Message-ID: <175029692847.4372.6433542169500396607@lazor>
User-Agent: alot/0.11

Quoting Rob Herring (Arm) (2025-05-20 17:46:54)
> Convert the APM XGene clocks to DT schema. The device clock binding is
> a bit different from the others, so put it in its own schema file.
> Drop the examples.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next
