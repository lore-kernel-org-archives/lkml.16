Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D609245021;
	Thu, 19 Jun 2025 19:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750362163; cv=none; b=InEKyPHWWTsPRk8tXc9sFUx7Ri0rRWo/Jc9RY9zesfIleWLzQq9E6mNwx96iumQRQWIY2wFRPeurqSxI+8/rC++ceY6a8ULxKstCUrNFdFwOEFU4En2U7XeKpYdgDXM1tvgmaqMZmO4BG5TEdf41vBdbOAsF8iLGS/BXNNmvgAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750362163; c=relaxed/simple;
	bh=5CkPfXqq0cNPyAleoJVICxELwM4ivuKg/5VG9rbmxyc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=mcXaAUuVhd00diEYJszmMPPsCxkacItm48NZtH1i9JPRQ1j7/QPEq1dSL4spPe5j8e0vfufjoOLH24W75TFxKsm+qyMC3BLcKibJi+HlEG5yJTAs7LR06bf9GkXjOAOKZ8nZyzhQE3w+gvzEKDsJRUpwSzKxARVMIjrbCLmtYaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WWg8CUsi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WWg8CUsi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F44C4CEEA;
	Thu, 19 Jun 2025 19:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750362162;
	bh=5CkPfXqq0cNPyAleoJVICxELwM4ivuKg/5VG9rbmxyc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WWg8CUsinvlrpcO0rn+18idwlkMVHaE1fXDzLDykuRDnrObr3465RPyxYehJzGJq8
	 KQ7WaKBt1fuq4rkeITbGm95UO3zV5ty2vmPCIcJYud40v7uVtYGQMVDsA3dAP0Nrej
	 vQ8mwIkxco/RCbpdzzNyTXJZLIKYI4YjeEpyyieZyLEgLqqOboZfQA9bq4436CRhux
	 8fSwuVlp4UwyhxKb2nwOAeevMIxkrUmEvSAuEPox36FB1KUpN7AcJ4mzwelo9NHWDS
	 gwwHy2FTNIkD3G5VQW8JOjBDQqELbmSAiUtl3KLEumvoKQBjnpQ4q5Q/5dTbb4Fpsr
	 4wRE4GiT6uaCg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250618093508.16343-1-work@onurozkan.dev>
References: <20250618093508.16343-1-work@onurozkan.dev>
Subject: Re: [PATCH] rust: shorten `con_id`s in `get` methods in clk module
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, Onur =?utf-8?q?=C3=96zkan?= <work@onurozkan.dev>
To: Onur =?utf-8?q?=C3=96zkan?= <work@onurozkan.dev>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Thu, 19 Jun 2025 12:42:41 -0700
Message-ID: <175036216196.4372.1904830599918024777@lazor>
User-Agent: alot/0.11

Quoting Onur =C3=96zkan (2025-06-18 02:35:08)
> Converts `if-else` blocks into one line code using `map_or`
> for simplicity.
>=20
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> ---

Applied to clk-next
