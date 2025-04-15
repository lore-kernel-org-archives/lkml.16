Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB615291160;
	Tue, 15 Apr 2025 12:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744721045; cv=none; b=b5WnKwj8DlKTQLUieSjNfa+EIeyh76oF3Hg7VurKWiEzQX98swPKveZwni2nlFZutN/LKbpBEOqq/DjA1NTL3m0MG+yg4WdBC9tY3I836+gSRIPQNCt8aT3lTnaNXRu0p0EXvX/9sNsVLDd1Yv0+3cgydQKX/VqEivzqPsZz97Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744721045; c=relaxed/simple;
	bh=/AmFSfoSnA6eIeCSxLandIuhUazOwU9meS2IMrJepeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R7D34FHz3f/PIqR2zCfYSZaUx51dv8Yqj+/jW/PmKegUPZ75TzdiGv+LLrIewovuSMZpn0aW7hK25xsv1YtXYmsJygzLjVQerjonLYKTkPG4l52FSjPDUCyEGPYpLsyZy+CtVSomVBOCIyVV9J7wwsIchdu3fCsHftaBxYXc1y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0jv3Tua; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0jv3Tua"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C824DC4CEE5;
	Tue, 15 Apr 2025 12:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744721044;
	bh=/AmFSfoSnA6eIeCSxLandIuhUazOwU9meS2IMrJepeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m0jv3Tua3cEMNkfJ4fkNKlGfMis9dr3yRO0u0sR97qADqjxyrzG6VLKYrBtJlur0g
	 FsTa99arEQaAnHzJDfi3UGyFD0es0f64Zpc59ro9M2dOs8itsnEgKDQPKBUcjo79aS
	 MMqtmkmqWLM+SOHYA8MYdozD/G4h7bGtC82C5sXRjGTRQ0UDlypUf1DdMwzJKW4pSL
	 9rwJQEKHfdg0l2L6ZMK2J6sHoubfys6jTfbnMlZCsOtFIEQu0xblXwOC6w1tBcoGF6
	 3GdCtjbJ8xHlISRRbZQuCE8qFowoOHdT4o1ZXVem8cRtJ3VxKpPbo2pD52Vl2C/VtV
	 fSb/JK4nxxCbw==
Date: Tue, 15 Apr 2025 14:43:57 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, ojeda@kernel.org
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, david.m.ertman@intel.com,
	ira.weiny@intel.com, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, tmgross@umich.edu, airlied@gmail.com,
	acourbot@nvidia.com, jhubbard@nvidia.com,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 1/5] rust: types: add `Opaque::zeroed`
Message-ID: <Z_5UjWZIkPxTv1G0@cassiopeiae>
References: <20250414131934.28418-1-dakr@kernel.org>
 <20250414131934.28418-2-dakr@kernel.org>
 <Z_5KHVHh-Zs9HSlq@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_5KHVHh-Zs9HSlq@google.com>

On Tue, Apr 15, 2025 at 11:59:25AM +0000, Alice Ryhl wrote:
> On Mon, Apr 14, 2025 at 03:18:04PM +0200, Danilo Krummrich wrote:
> > Analogous to `Opaque::uninit` add `Opaque::zeroed`, which sets the
> > corresponding memory to zero. In contrast to `Opaque::uninit`, the
> > corresponding value, depending on its type, may be initialized.
> > 
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

@Miguel: Can I get an ACK for taking this one through the nova tree?
