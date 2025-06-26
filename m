Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569C62F1FC9;
	Thu, 26 Jun 2025 22:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750977105; cv=none; b=b+WJCgncel1mhDGhgQt6jrgmyKJRy5u6IZxrfqS6GMM42NqasfD68IsAP7jvlce0iDF+J45NE7GPyGGV6eTmEmuXFyLyJUVgAJjPKFZNAbnzwUthV1rpHitlGWHM9js8hO6VA/XMvQBMK03XYtmitEiB3fYq+a3DPg59SetXhNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750977105; c=relaxed/simple;
	bh=+CQJY0+DuNHsVmZwiK35TQ1qMC4owqret5SDfy7LxGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iUlhZOpoVBpoaz7hhYyKL7osqBa2Wpklpn9yKsHPVRJ3zjVlhvqDLf/Ddr3+EKSJ8WfF7ATeQeG+J4JqGmZLK/O0T9tQoauolVdi5PV/aiwBU2NGGBXOFkqRUb5X3Xz64ZTxcd6w0qN18K0Dtyql5hoh1f5zVtDMz1sSda/EcA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lER7JrcF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lER7JrcF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A80C4CEEB;
	Thu, 26 Jun 2025 22:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750977103;
	bh=+CQJY0+DuNHsVmZwiK35TQ1qMC4owqret5SDfy7LxGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lER7JrcFZjHSzqGxOBBcK7oiMnjPfglcXOex5pYqeDtFKZd29FXReVWUgDESIFTzH
	 BM8UIZiaLs7GhJaUVAixEirnTeKerDF/XoBDPq7MLE9423t9vIUNwOr0/QqrUxY5WV
	 7STgZLAeaPSdK97O/Mcgopy0PzEwmwfGNw4IXrS7suINCSx4XBzjU+8GL2zQECsLaz
	 asVw7rBHrZBnFsf3nCquibIcwVQvo1ynFqcyHGTCXbZQIY66imiCZMjdPYLctXkmb4
	 fmuSv7d3URPAbUdSum3wbcGqPpiedmv3JtMJ3C/NN1Wi1zo4NctVHue9joKhlmspBa
	 tTxWUwCLkLelA==
Date: Fri, 27 Jun 2025 00:31:35 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Igor Korotin <igor.korotin.linux@gmail.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Alex Hung <alex.hung@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Remo Senekowitsch <remo@buenzli.dev>,
	Tamir Duberstein <tamird@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Xiangfei Ding <dingxiangfei2009@gmail.com>,
	devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>, Len Brown <lenb@kernel.org>,
	Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH v8 0/9] rust: Add ACPI match table support for Rust
 drivers
Message-ID: <aF3KR0dXTD7RyU9c@cassiopeiae>
References: <20250620150914.276272-1-igor.korotin.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620150914.276272-1-igor.korotin.linux@gmail.com>

On Fri, Jun 20, 2025 at 04:09:13PM +0100, Igor Korotin wrote:
> This patch series introduces support for ACPI match tables in Rust 
> drivers.

Applied to driver-core-testing, thanks!

Once 0-day testing completed successfully, the patches are merged into
driver-core-next.

> Danilo Krummrich (3):
>   rust: device: implement FwNode::is_of_node()
>   samples: rust: platform: don't call as_ref() repeatedly
>   samples: rust: platform: conditionally call Self::properties_parse()
> 
> Igor Korotin (6):
>   rust: acpi: add `acpi::DeviceId` abstraction

    [ Always inline DeviceId::new() and use &'static CStr; slightly reword
      commit message. - Danilo ]

>   rust: driver: Consolidate `Adapter::of_id_info` methods using `#[cfg]`

    [ Fix clippy warning if #[cfg(not(CONFIG_OF))]; fix checkpatch.pl line
      length warnings. - Danilo ]

>   rust: driver: Add ACPI id table support to Adapter trait

    [ Fix clippy warning if #[cfg(not(CONFIG_OF))]; fix checkpatch.pl line
      length warnings. - Danilo ]

>   rust: platform: Set `OF_ID_TABLE` default to `None` in `Driver` trait
>   rust: platform: Add ACPI match table support to `Driver` trait

    [ Use 'LNUXBEEF' as ACPI ID. - Danilo ]

>   samples: rust: add ACPI match table example to platform driver

    [ Use 'LNUXBEEF' as ACPI ID. - Danilo ]
