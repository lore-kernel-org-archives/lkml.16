Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D23E7260B;
	Sat, 17 May 2025 11:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747481583; cv=none; b=DC4yw8rXe9tsG8JU8kaVLmCOviuJSs3YuTvBdtO2e263uA3Imt/InASI210YYDezVLJLZp4+CICVaaSDM5ZchwqjGn3Dxe70B1cw08duZO5CTzzl0Hpm4+cULkP+7Tw3yyBM0UthQlN4hHuhHUYHdTrucAq0+NV2fieKcCOCtwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747481583; c=relaxed/simple;
	bh=nvUDJu0WsfpAmDEPoWyIWd0OXbpNQ42B2nsNajcEZ4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vv1GtkQw3r9HV39Rt4xz4IuGbzGsCSIf6OxwWT2MY0jjV9etzYsca9Y1n0dIrrrAABHzEoLhmFQ/fzvmCKl9Hym+qp+6MZyIkkajedQN2Io/JE6oZHtuQkRhxfM6TYRVTDy54ycffL+i327hAWBCzkcEh5o+yiwerzkPMKVEXKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TXRbP8y5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TXRbP8y5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93C45C4CEE3;
	Sat, 17 May 2025 11:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747481582;
	bh=nvUDJu0WsfpAmDEPoWyIWd0OXbpNQ42B2nsNajcEZ4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TXRbP8y5eKIQFjde5fydfc9KTMZ4Sz8t07M/RWv5PyHUUejlp5nmUb7UF7yDdoWeu
	 eMOej3/UZBvTwjdoXJlZXypad7tYRrtdvkoZADauhBGKTLFayyF6mOS9rTbk9vyOss
	 ZbW5JAVSUWVAYH3FwFSJ8b0tY5nSIlqcuGGKKDrioda8cQo4mmc2z8wy+JMuRXWkLC
	 7ATbts9u2mgx0tO+iT9bx2QQdKO/rUvp5RvESzY2cUB1OC6EKJQG4zrzz0n/YOocYH
	 xtxYlpvqUsk+imzOTulU6px74UffzrgWmULhkR3qB1KYP2AW9loQlJYOG68nRsMVc2
	 L+y0a/kzXmr1Q==
Date: Sat, 17 May 2025 13:32:55 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH v2 2/4] rust: drm: gem: Add DriverObject type alias
Message-ID: <aChz53fBhYlf3DeM@pollux>
References: <20250516171030.776924-1-lyude@redhat.com>
 <20250516171030.776924-3-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516171030.776924-3-lyude@redhat.com>

On Fri, May 16, 2025 at 01:09:17PM -0400, Lyude Paul wrote:
> Now that we've cleaned up the generics for gem objects a bit, we're still
> left with a bit of generic soup around referring to the Object
> implementation for a given driver. Let's clean this up a bit by re-using
> the DriverObject identifier we just freed up and turning it into a type
> alias for referring to a driver's gem object implementation.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
