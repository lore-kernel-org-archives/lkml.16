Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEBE169AE6;
	Fri,  6 Jun 2025 14:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749220339; cv=none; b=OKDB+0d9FR4znxpQ6weN+MWUV6sWTZ0JZ4+YZr0USjaSz4uJ9VYJj6bPA/+wlqpMdzE+HQCW/sK4GnZ0ejIW3BRFXjOS+4Ar+X4evJRZD4n9i/fpjMXPkpOJVabNBmbXRNFuaDf9FkJ+7iCeS1Zg58iCw5/G7fEhyhys1F0kwLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749220339; c=relaxed/simple;
	bh=53+O3kAq0V9RNCKe7MDZ+MqWM/ZClvBlJnN6yVQgluo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljuq7RVF3djR7sanVzxb1qzkiPNKCPxZieXjUdFuYT3+iOul4HN4vWRrVv2ZfrTJObp9k/biCEABBHskV/fbJEToMhc/gGLc+7GOozIGrypmHR/d0qWfF+adrr2VLvwEwBEeNweUT32nQWyuYqx9Nho6I2G6LY5LdeND8m/3ZwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L7w6SezV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L7w6SezV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B7EDC4CEEB;
	Fri,  6 Jun 2025 14:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749220338;
	bh=53+O3kAq0V9RNCKe7MDZ+MqWM/ZClvBlJnN6yVQgluo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L7w6SezVyd3D37kvIZoqN439faWdAdZcZAj4XdtfLm1Mof0dwl9tql7xG5f1KmsN4
	 8nOi6dAxPzh6nxrpdMfhbi8sheIDTGowEhKuDpjbteqTBvVaxat/n6Z1Zeer1pb6cS
	 mYMiZs+MfY7ulA0Rr8o0828ALp6HjqkHs3SVykjToz5Cf47vOkpww8NA7hRBap3yAL
	 gI9EgasiluDoKp+nL/oiklk1Y2lPvkhpey2V01DvbAXMlCEcExzS3tdhW/zRX29cr8
	 J4S8YemiLtIkK1kWNrc2XwzmtrrRgMEvgXGDDcOv1VfOU0bDaGS4bQ7CrvTGZfpWNV
	 eXPcjK+jdD8/w==
Date: Fri, 6 Jun 2025 16:32:10 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Igor Korotin <igor.korotin.linux@gmail.com>
Cc: Igor Korotin <igor.korotin@yahoo.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Len Brown <lenb@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Alex Hung <alex.hung@amd.com>, Tamir Duberstein <tamird@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Xiangfei Ding <dingxiangfei2009@gmail.com>
Subject: Re: [PATCH v2 3/5] rust: driver: Add ACPI id table support to
 Adapter trait
Message-ID: <aEL76mgHSZG5idW8@pollux>
References: <20250605161956.3658374-1-igor.korotin.linux@gmail.com>
 <20250605162726.3659792-1-igor.korotin@yahoo.com>
 <aELyEqg0GrkC8oZY@pollux>
 <CAG7QV91AWpOk7VUcE-B1MLkEQPDB0Y=zsBOBf6MhHVYh1aEGQA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG7QV91AWpOk7VUcE-B1MLkEQPDB0Y=zsBOBf6MhHVYh1aEGQA@mail.gmail.com>

On Fri, Jun 06, 2025 at 03:26:13PM +0100, Igor Korotin wrote:
> On Fri, Jun 6, 2025 at 2:50 PM Danilo Krummrich <dakr@kernel.org> wrote:
> > However, I don't understand why we need this and the subsequent
> > is_acpi_device_node() and is_of_node() checks.
> 
> The idea is to avoid unnecessary table lookups when both OF and ACPI
> match tables are present.

Ok, that's fair -- let's build it on top of the FwNode abstractions though.
