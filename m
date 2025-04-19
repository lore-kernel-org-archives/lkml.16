Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1E2B644;
	Sat, 19 Apr 2025 13:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745067668; cv=none; b=tIHTrNGSRXpQ7JsK+5gSyKZJ+Q8BQ9CqMUg1FeMK2LsltRRBgOBnZgQdUgr2ugRtPBEKNqbWzoDZfvtAlq4p0O/6uvopqqzYPavl7YHgy4sP4tcsJpG5uUzgtFGJKyKOrVFo8PrgqhLSlHkgOc2r3sKdiV+uWF9nneOGrUU8LBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745067668; c=relaxed/simple;
	bh=KgfFagCqMWyxeLrUeHsEDay+NvM0F3HuD2E7ECPicEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5MbTnQEmGOKXcFg0sCwdN8HxoxAgLmaOqD7b/pIre0u8I0ClPk0RXcg5enJ2+mIKZyq6tX/8tVvtqetX6GvPLRkLah7u8zdrf5oHXMSomWWPf67Ytj2fkFll2/x5dgRCYohGe4FfjpxsrPX0wfgPa48+wG6MPc2NvNopzA3edE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DNb6N1UQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DNb6N1UQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE65C4CEE7;
	Sat, 19 Apr 2025 13:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745067668;
	bh=KgfFagCqMWyxeLrUeHsEDay+NvM0F3HuD2E7ECPicEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DNb6N1UQfsQcxTTrBdwSmqElQfbjTeikK5sIQM0rml66rfX4ItTWausV9nSXhFWWX
	 IPGtJDaqMt0ErdOqVO9fJ2MT4RwlZnRZqIPHi5jlZ7Yd+2mK/9CmrKPiUzJ9P7LCRM
	 TPqFItN18p2r/LiW71z03ZayzhzFT39yMuwvxMcdveNTx5XBXbXP7dOwkHA4cc8SQx
	 vTVYQ8sER/eGQ3z2aEubS12sN5JacSbmLXo3CxDYzDW0X9yotbZ3ImzLQSAdYSJwic
	 fLS3Hk052KLTR/3RuYLj25DmeYn0jBgGgkPvAmOGJWBe1dxScjli6YYZmd6YMFrq0m
	 4f/S3aJtmkemg==
Date: Sat, 19 Apr 2025 15:01:02 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org, rafael@kernel.org, david.m.ertman@intel.com,
	ira.weiny@intel.com, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, airlied@gmail.com, acourbot@nvidia.com,
	jhubbard@nvidia.com
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Auxiliary bus Rust abstractions
Message-ID: <aAOejjWTqdD3UoQ1@cassiopeiae>
References: <20250414131934.28418-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414131934.28418-1-dakr@kernel.org>

On Mon, Apr 14, 2025 at 03:18:03PM +0200, Danilo Krummrich wrote:
> This series adds Rust abstractions for the auxiliary bus.

With the following changes, applied to nova-next, thanks!

  * abstraction: fix typos, `let _ =` => `drop()`, use `kernel::ffi`
  * sample: use `ok_or()` when accessing auxiliary::Device::parent()

- Danilo
