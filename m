Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4464825E803;
	Wed, 25 Jun 2025 16:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750867707; cv=none; b=KOp+rbFJn9dGvbq2lx8WAfSdEx9+5iHDVDfUrXdPEi01FWsSpjX8cDKkCZ3Det38uz03u69vWT4uR0VGGySk7dKBEfxFLvZNVCs+DO/l8tWBn6P0hL4aWWpv/sOFEy1y73YXW+69KwUrqiqpnPzCPa87bZ29nmQ4zf8Hy0FkjHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750867707; c=relaxed/simple;
	bh=BTlJ1RmUpaujJ0EmKDLMF0jllMSYXyhOOUgPEVzg2sM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TgjR/zC7576pJe8sMlI3XtfzVBU+lUoP0bG6flGyczaGLvC2MZE3+BVn4kg+TSicZUbxRXoabkR6OLizaV21mqIMC6/2xMH/kL/ZnvkR6b1aMSY7Kb+ILizlHK8gV4iL/T32XRgPTs/pWDud0+fTqi2gKV1EPXyLOGvJwNTPeOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tmYDLEut; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tmYDLEut"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 012C1C4CEEA;
	Wed, 25 Jun 2025 16:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750867706;
	bh=BTlJ1RmUpaujJ0EmKDLMF0jllMSYXyhOOUgPEVzg2sM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tmYDLEutTKPozey9jE6pu0FKkRL8dSHlAlF3HZr5kYZ1ghFttO9NgLIW3uIW1C5sT
	 DFaMMR4w82wuIPHfEVYLK2SQJ5Kk495T0rw/l3vlmMu+RQf4bhW7QGm2BLGkTGnrHg
	 hvn3NInm8RruYB/AVyXhlu8iiUai/V2jgJEUuGbpCVUnRt4lSS+6C0Aj7R6GQW/EXD
	 Uzi504qgXSrUdOAsFValQSqiSZRLuM1opQRFRtOxb7xEwFVHOH63HQRNYXxFGdAmyk
	 wGMgFhc3yoqlkG6+7QQ+0K9VnOFmJ2CtwvBW32KfQSCdICjz8hDnYeMIIW4RJhrCDA
	 AUBcAZPExly9g==
Date: Wed, 25 Jun 2025 18:08:20 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Mark Brown <broonie@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1 0/3] Add Rust bindings for device property child nodes
 and reference args
Message-ID: <aFwe9MD4QpBEked3@pollux>
References: <20250616154511.1862909-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616154511.1862909-1-remo@buenzli.dev>

On Mon, Jun 16, 2025 at 05:45:08PM +0200, Remo Senekowitsch wrote:
> This patch series was split-off from an earlier one. [1]
> 
> [1] https://lore.kernel.org/lkml/20250611102908.212514-1-remo@buenzli.dev/

Applied to driver-core-testing, thanks!

> Remo Senekowitsch (3):
>   rust: device: Add child accessor and iterator
>   rust: device: Add property_get_reference_args

    [ Move up NArgs; refer to FwNodeReferenceArgs in NArgs doc-comment.
      - Danilo ]

>   samples: rust: platform: Add property child and reference args
>     examples

    [ Convert 'child@{0,1}' to 'child-{0,1}'; skip child nodes without
      'compatible' property in of_unittest_platform_populate() as proposed
      by Rob Herring. - Danilo]
