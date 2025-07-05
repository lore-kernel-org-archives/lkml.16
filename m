Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7980A2AD00;
	Sat,  5 Jul 2025 15:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751728371; cv=none; b=TUmI1kiAey/OBeu5yeJlqzs4MX/jjD9LPVAqOo2clrQQuVpAsLukyK9J/ZASkYp8FaH38h71CD9ZwsN1sZMdVNRrJHmXcMaftEQJSBoXFrPb5guHiudJTlb6fwBhOSpae7HUkstFUQqnJYxVM7E7qpL09kP/YXMRs2sI6HwmxnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751728371; c=relaxed/simple;
	bh=TIM6e5qHp/6nVvPVrYN8jvey9AfXNCweNKEmC77aLFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P/xb9ieF3DZtvJzl/Pem9v8MKMt/WzxFOzm+tDYAQiZyw4tdaasYARbYrqBo6ItT1BbrY8Mjl+GTns/MXGOIVxaeYRmnyoPdOmZxh3Pn4gjtwZcEjUuCDgQcIiz0QtkaRmJ6yr3Wzu8+DX3aSf7xeqTfYPwKvHHRcEP0eFTVOv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NA/UlB7Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NA/UlB7Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD51C4CEE7;
	Sat,  5 Jul 2025 15:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751728371;
	bh=TIM6e5qHp/6nVvPVrYN8jvey9AfXNCweNKEmC77aLFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NA/UlB7QiZpeWNcrZwQlf84fg6QQ799YFRTI9mAodcDoB3oYDBUyry7zpB8olc4UW
	 fb91VGwsySk+oi7By0Iq5rThNTgpHEFGNYhHGxocD5HR95rvin6BitEKStsPLgknBf
	 0RIAZyGOPeGdEHTF/2zekkmt1ar/73UUvMr7D1J5zBQXQ8o3sN8zQZxsOlv35Lvemx
	 KEQmn6f5psx/wO2acJvMVMCR8JTMXyDOuu2XTVAZy7M0VwpWwyCNGr4VqsNcHhbSuz
	 +ux/VYhoPBf0rb4xcrv2brI4mX5QdNpf/qAIyeXrhwZSHWwLvVAhdLV1rCX6mIMQRx
	 uqJAzbUUMkpVA==
Date: Sat, 5 Jul 2025 17:12:45 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: devres: remove unused import
Message-ID: <aGlA7aGiMC9o-bCo@cassiopeiae>
References: <20250704-cstr-include-devres-v1-1-4ee9e56fca09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-cstr-include-devres-v1-1-4ee9e56fca09@gmail.com>

On Fri, Jul 04, 2025 at 04:11:02PM -0400, Tamir Duberstein wrote:
> As far as I can tell, this was never used.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to driver-core-testing, thanks!
