Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CEA30E85C;
	Fri, 20 Jun 2025 07:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750404053; cv=none; b=icGYXVKXqU7UxP+/17ns19/LM6E/E+hhzYQDfWF6VN37J1SEslk+Q8u+rn9rKcYO9pESIWARwz20HVqW385/seh87cEVY6pm/AriQ1ybW8MbHqV5cifKX7uBBoff6mfO7bscc34K9FTCUVahC3u8d6J7KIBwa7uSXeti41MNytY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750404053; c=relaxed/simple;
	bh=zF5y0gF8Y7NkjYj9fVdZa2uGp6iaT6yW0LPr/ToduHI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=rmfTRlWYstjVCpbMfCnDHDGCx8TV8ULURn7d97Zj/SNhT4kz9b2MU/mYxdYTVH6ISPsH2upTvZBOSDbIbljC33WmtdV03zbg6WFn5UnG39qIiaBiwiUfoW/tENrMiMux4948hQAugnWolzElg6Iftf8Dp4ah3j+xX/mHVrOnp2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JMMc0M4f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JMMc0M4f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC004C4CEE3;
	Fri, 20 Jun 2025 07:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750404052;
	bh=zF5y0gF8Y7NkjYj9fVdZa2uGp6iaT6yW0LPr/ToduHI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JMMc0M4fqKQJS0JOcr1N2FW5URnjzSFhUD+n8ntxQ3VvngFeOwVrr5VmRGsxnxBUe
	 7pDHvW3W9LyQcNR4bnesTXu02QV7XikGO2Lm9qC6JvvVg3mVb+6NXUGhWNUw0iZjMM
	 wRd2WWl0/7463L/DK0Stv5XMaaJ4kUFwEnLM/na8gDxO0odeGpRS8UcMa44dqjMwCP
	 bWEGdGyJaHoPsWIT0OrsVoJa/JT/xz5juHz4RlttTR+sY+KOUVOUuFPnSlhAMb+58N
	 wFLb4D2kmlRgAEkC4aDRS3dUF9/llorkBSGEh1VQ857b2e4YDwrLxpLoeXsSv2VLW8
	 3m+DDWAqj0F8w==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250417-clk-hw-get-helpers-v1-0-7743e509612a@baylibre.com>
References: <20250417-clk-hw-get-helpers-v1-0-7743e509612a@baylibre.com>
Subject: Re: [PATCH 0/2] clk: add a clk_hw helpers to get the clock device or device_node
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>
Date: Fri, 20 Jun 2025 00:20:51 -0700
Message-ID: <175040405169.4372.877329870252746551@lazor>
User-Agent: alot/0.11

Quoting Jerome Brunet (2025-04-17 06:44:21)
> This patchset adds helpers to get the device or device_node associated wi=
th
> clk_hw. This can be used by clock drivers to access various device related
> functionality. The 2nd changes adds kunit test coverage for the new helpe=
rs
>=20

I've pushed this to clk-hw-device, splitting the test patch into two and
reworking it. Let me know if you see anything off.
