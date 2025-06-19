Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8996F242D9A;
	Thu, 19 Jun 2025 19:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750362154; cv=none; b=MbND2NR2d3189FNqfcjCPV+wubjbVzaD6dsQmoEmFODKIQ5SG3v819XID/fQcleds3JkOCCTaSlEUCuX8loVtFVcS3E5U+w5flFxACk0pjSn8+4iKXHENw84u6CH9NIxRGHBelgKvf8IwAowE6HxP7c7Yy3kFFBERCZk7Jmfkrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750362154; c=relaxed/simple;
	bh=vgOeyXaNqwz1ZhXAS9CUkgzo55Wur+mbn5lnE6nfGzM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=F5g+LUB921eppHKxgmP/a2SHzm5MW8jK8yHUF3Ed4fJc6DN2Oo+Kx9YAoB862Aub7bYdTbWAzf32i9RPl/glYtP08YHefB2l7qYc5JXCrlV3Ny/L8Em+7bJNlL0EbLDeJRNuklQ4eaNfV0lTstg5VXn7qH/DPvHEQCyY/IL8GdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CcaixWvl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CcaixWvl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A67C4CEEA;
	Thu, 19 Jun 2025 19:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750362154;
	bh=vgOeyXaNqwz1ZhXAS9CUkgzo55Wur+mbn5lnE6nfGzM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=CcaixWvlZxmeEHBXe/9lOYYnorSBRYL7qVZL65KIaorWPPBG2sFiyc/beM8k0zmBr
	 879cRFsL0md0rBm6sOVvlhN2HovEJ7gFrIU4dUxxLdjIW5NoKDRZsVSyOMXHaR0wBK
	 A+3MqxO6/Bx4F9ckOBa+rUU4IBr8qoOiToQ9Vz4+ij266Bck1lcrSj1yVuEJ+paNki
	 vUrakMZKmUjMepXsPah9ttvPdMP8ehnmB8lLmFrEmeNMALGSyrooqJrlLv12fIgT+T
	 gIsaP039ylcvu8oei6PHrsczknW7K5WaSrct04cTosKstPxAECp23NLufdAXMJU1FU
	 J6jmBwv54ysbg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250618091442.29104-1-work@onurozkan.dev>
References: <20250618091442.29104-1-work@onurozkan.dev>
Subject: Re: [PATCH] rust: make `clk::Hertz` methods const
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, Onur =?utf-8?q?=C3=96zkan?= <work@onurozkan.dev>
To: Onur =?utf-8?q?=C3=96zkan?= <work@onurozkan.dev>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Thu, 19 Jun 2025 12:42:33 -0700
Message-ID: <175036215300.4372.6754075623158332740@lazor>
User-Agent: alot/0.11

Quoting Onur =C3=96zkan (2025-06-18 02:14:42)
> Marks `Hertz` methods as `const` to make them available
> for `const` contexts. This can be useful when defining
> static/compile-time frequency parameters in drivers/subsystems.
>=20
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---

Applied to clk-next
