Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946CE30E826;
	Thu, 19 Jun 2025 19:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750362607; cv=none; b=YqSmHea2gNidxyPDrbJs+pX4eltRoWvvrbRyySZgYX31Fd32fd+cl9ZrjIMJYLG3C0ibArE8QIuOhvHEtLXqPdk7ArYMLfFXlrZV2agx5S0+OiB22I2IK0bwONjGETGmhGu6NhC8rugcx5myWHvF3lObY1VJ75ygXIFOul7HIhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750362607; c=relaxed/simple;
	bh=ZTFomVnLljf+NtYbz8sC48Kfk1fq3ByeJ4kaR/BFI+8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=HnWejwjbF0dYH49O+eqFmnfkU50rw5u9IctEOn4LPXojEuLkhbt8XL2gvW1h9E3QyKFHfwiBCXG1Y0hnaYN/1WN4jtb2z6jIl6gPPz4yY3Qmgj3DEBRATiji0D8LQM7V8G34wwJ3OutoYv0IiW8SLUllAXk2xM5Se5OmPgbI3Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKcnmOm3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKcnmOm3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC3BC4CEEA;
	Thu, 19 Jun 2025 19:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750362605;
	bh=ZTFomVnLljf+NtYbz8sC48Kfk1fq3ByeJ4kaR/BFI+8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=mKcnmOm3frImK9Km8tARbpRCY2/0soE9aCZ4A5w1e/qM7dhSkaC3wgpOYtjkFWwMM
	 vJTJqj1TPW/FmxU4fDW2z9azrLVMfEjNNgoujipqoYsqZftOIMigo4Uags/vGCFe7m
	 dNx3xRTQWek9lbYP7VyLCsHcBdG0mN/we5CBrQQIKjKV0tUWxUhhhGuQFTgpvJVCJk
	 86gQQtz3rYNJP0u0spftIJ3l1UXtHEnkjd4CFvYxgSLwJ07KiFaS+0qqTB18Y6EJ/g
	 R+7JSt+nn9k6zC1QDtWZvs7VN2S6zve2PrSP8blpO84N4nRqZGWGam+v+3jUZCK4BK
	 9Bm+I4L8gKCng==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250618092810.29370-1-work@onurozkan.dev>
References: <20250618092810.29370-1-work@onurozkan.dev>
Subject: Re: [PATCH] rust: replace literals with constants in `clk::Hertz`
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, Onur =?utf-8?q?=C3=96zkan?= <work@onurozkan.dev>
To: Onur =?utf-8?q?=C3=96zkan?= <work@onurozkan.dev>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Thu, 19 Jun 2025 12:50:04 -0700
Message-ID: <175036260422.4372.4939976959481106365@lazor>
User-Agent: alot/0.11

Quoting Onur =C3=96zkan (2025-06-18 02:28:10)
> Replaces repeated numeric literals in `Hertz` conversions
> with named constants.
>=20
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---

Applied to clk-next
