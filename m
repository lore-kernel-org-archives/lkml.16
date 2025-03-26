Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D581A5B8E;
	Wed, 26 Mar 2025 21:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743025258; cv=none; b=AXSAHAzw7JNN5/wYL23HFtDAPSuyFA1jea4aC7W7Mpz9wKRswzwI+GMUOnX2QT4vNiaA+LeZ3xbt0vU4ZEb+G6wNX5Z3XeeXYQOIRE2m9mVHHNYiilu3UGHrDzK5GoUB37j6gEuAEsuwbaUzBp+FvwH8Q+ULGdleNiqvUw4cmTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743025258; c=relaxed/simple;
	bh=TJqW56W1vG7oaqy7zhx1+mzfgR9FHCSrOGnqtIANjeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWYYMf2E5R6aMQrN+t/AOfHPIlHQl9FZkhRdja11c9szP7lOsgpLriiEEczCB+xUqmasyTY9cyU+SX4JuB//dJkUEXHp28bh6KgLirgr0eDEo+czDZsfvo6dqClKyVeZoRjRC4CoVDKvdlEiU5zH6TvdZTtp+ZnLqidvVm6kOyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sHXH9OBD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sHXH9OBD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE792C4CEE2;
	Wed, 26 Mar 2025 21:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743025258;
	bh=TJqW56W1vG7oaqy7zhx1+mzfgR9FHCSrOGnqtIANjeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sHXH9OBDAeEe0QiCCr/Z+y7azbWjtySogP5CQbb0TnDP0MtbyKpqy9Qcxd1Qeh9oa
	 UEKFFzZ3/dhBdRkPXQ3iPe4QMNlwb/d68H9Ua+vNVYpnvJZO/t+Kp0NDmuomGWwg+v
	 Vqt74YXKBZzyLkxXobFHkihMQkk6JfWraw8L+GemlOyU1eyS+QJ57GVpY16kzKLfnz
	 cOm97FS4LTvxmwh4OlF9MwVks60yJEuJkdFv0jlZ8p8Ly9098dI1IOmKIttRZnmOdJ
	 Yi/g+amay4RF/1GRdkGKfLy6C1F51aDxMaDADpZy0S/5V/nnFjBfr6qiQs7Mj5OrGU
	 nztsIp8pgMlDQ==
Date: Wed, 26 Mar 2025 16:40:56 -0500
From: Rob Herring <robh@kernel.org>
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 06/10] rust: property: Add child accessor and iterator
Message-ID: <20250326214056.GC2844851-robh@kernel.org>
References: <20250326171411.590681-1-remo@buenzli.dev>
 <20250326171411.590681-7-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326171411.590681-7-remo@buenzli.dev>

On Wed, Mar 26, 2025 at 06:13:45PM +0100, Remo Senekowitsch wrote:
> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>

Needs a commit msg.

> ---
>  rust/kernel/property.rs | 57 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 56 insertions(+), 1 deletion(-)
