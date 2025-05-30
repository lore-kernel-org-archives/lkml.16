Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C511527817C;
	Fri, 30 May 2025 19:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748633119; cv=none; b=CqrVc2MnV5JBTi95xaKN+dvgblbS6x289v/TiAIHBh7KI5nNjk7LODBGRAsxmY9gJnlnwPAog6r6V3GxugXZVR8hcyhcpewoEmAczjI0J0ZBopbmCAZS4W0Yvgu4Kg9lebpyHlQuHVHuIw21i3H/xYRWTOlS1PCPL+1wXqub5LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748633119; c=relaxed/simple;
	bh=GBNlmAasQ2ugDaTm/pZUb+R+AMSrFlEhFgRgMLDuMK0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=pMLlzL5ems2qWrZYmDHaZFaaom8JrEznFhhjGu88dsNqbbMAlxCjHe2HCNhfOkFIQweArUgI6HG0gHhxZtAbb4HPpKIAa6tQ5/96wLT62xybcSNcV3HptfkxY5Hxstvlx+copgsjLYDNQCfxlR8oCJrfUaaAUKyvpGUTGGtjH3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XFxm3IwF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XFxm3IwF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7859EC4CEE9;
	Fri, 30 May 2025 19:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748633118;
	bh=GBNlmAasQ2ugDaTm/pZUb+R+AMSrFlEhFgRgMLDuMK0=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=XFxm3IwFhU0eT/Tjk5xvjhphlP1obCGIGvQSwiFxSmch0LXh3BQSvRFoDz/jEabzJ
	 8+mA4pUtOplnxwW70z5N2b4CqQ8K3/vDxkpg4nJ71IsjUHFS7GNpiCbxY58habes22
	 L/xMJOBWs92qESO7iLXPtcwutKc5qyQoBpX/LVflbJGm20VIYybOeLbDTIat68SbNa
	 cfE0dR4CfV1SL28gKU0+x5Q5L3hEDEwmEDO1lB7epYH+8B0Xbf6F78rZGjSyxYyOrt
	 ytqbXT0Y9jqHleBXGPc4fWYKB9suA1yVCjfdq9tiOLw/Xmn9+x4JZIIwRXM/wYip5b
	 mUJc9KZyThfig==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 May 2025 21:25:13 +0200
Message-Id: <DA9QPEN1JU9D.B2HDPCQ2ZPDX@kernel.org>
Subject: Re: [PATCH 0/7] misc device: support device drivers
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <benno.lossin@proton.me>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <chrisi.schrefl@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250530142447.166524-1-dakr@kernel.org>
In-Reply-To: <20250530142447.166524-1-dakr@kernel.org>

On Fri May 30, 2025 at 4:24 PM CEST, Danilo Krummrich wrote:
> This patch series adds support for device drivers to the misc device
> abstraction.
>
> For design details, please see:
>   * patch 5 "rust: miscdevice: properly support device drivers"
>   * patch 6 "rust: miscdevice: expose the parent device as &Device<Bound>=
"
>
> This patch series depends on the pin-init series from Benno [1] as well a=
s on
> the misc device series from Christian [2], with UnsafePinned replaced wit=
h
> Opaque, as suggested by Alice, since UnsafePinned may still take a while =
to
> land.
>
> A branch containing this series and its dependencies can be found in [3].
>
> Thanks to Benno for his great help with pin-init!

No problem! I also found it very useful to get some more uses for
pin-init. This way future contributors will benefit from the new
features :)

---
Cheers,
Benno
