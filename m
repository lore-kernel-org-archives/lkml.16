Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA99514A629;
	Mon, 10 Feb 2025 11:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739187069; cv=none; b=uTfqEBl+lBYU2wBUmMRT8vqObeL4STtOlM9uJFVfPM3sPM7yO8wkdsZvKD3B0M8OiFLCYVxL7RWhTCpOrN5ljUuyYzsNFHNoYIeEDSPFJ3tRybVpQE1ih9d4Qc3pFuBJgsXUILH92jH2rAul0Ed7yMLxF3AfX7rYEeSUz4pLT/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739187069; c=relaxed/simple;
	bh=Y1tq5fKI/fJJF6ykcusgVTeSMQSKtS+wP9vAzzlZ66Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KwZEErfjpX8IJlFCcOHBbIhBPNe2MGXU4Z8L5T7LmgLYJcTmtdNBxYv03x/Siv5hYSe4I0GpZGGYlsqJPfb7v1LtfC8WKst9Klbs6V/cQ23LAfqPpAL8mc7RVC6TPqmg9UAx6+VLYkHV0mNwER1dTlbwTSHrNIFsGVy2kbds4/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0mesZROv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0mesZROv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57025C4CED1;
	Mon, 10 Feb 2025 11:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739187069;
	bh=Y1tq5fKI/fJJF6ykcusgVTeSMQSKtS+wP9vAzzlZ66Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0mesZROvncLKDL1F3edNX5yJqHA6ngS0s0pELMMkZ9Qe7f8G2Zcwh5XDEMqhpAKDo
	 C5N6tPIVZHTzKvAvUVXw99vk4KvpyzxH/MrabCbatOVy+iDy4gJujWSb7JGfN8jfI7
	 bFPW/7bEp6fcgaNeMPMbvy567qEoDVUUYOVgISD4=
Date: Mon, 10 Feb 2025 12:31:05 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Xiangfei Ding <dingxiangfei2009@gmail.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] rust/kernel: Add faux device bindings
Message-ID: <2025021030-glorified-pasture-e249@gregkh>
References: <20250207234928.420693-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250207234928.420693-1-lyude@redhat.com>

On Fri, Feb 07, 2025 at 06:49:25PM -0500, Lyude Paul wrote:
> This introduces a module for working with faux devices in rust, along with
> adding sample code to show how the API is used. Unlike other types of
> devices, we don't provide any hooks for device probe/removal - since these
> are optional for the faux API and are unnecessary in rust.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Maíra Canal <mairacanal@riseup.net>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> 
> ---
> V2:
> * Check for NULL on return from device_create(), not a pointer error
> * Rename Device to Registration to make its purpose more clear
> * Drop platform device comment from crate docstring.
> * Update MAINTAINERS
> V3:
> * Clarify safety comment around thread-safety
> * Return ENODEV on failure from new()
> * Add missing newline in faux driver sample
> * s/crate/module/ in descriptions
> * Add newline after faux module docstring
> * Fix missing markdown in safety comments
> * Add missing INVARIANT: comment in Registration
> * s/Registration/faux::Registration/ in rust_driver_faux.rs

Thanks, I've taken this into my series and fixed up the api where I
added a "parent" pointer.  I'll send it out in a bit...

thanks,

greg k-h
