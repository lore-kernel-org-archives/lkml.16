Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693353FB31;
	Mon, 23 Jun 2025 15:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750693753; cv=none; b=PddNLXObv3iGraZqZ2xzFayHA1mUytrZMhoHGT11/UTm1twpwEviyqfxHVgMOe2I8KxEBASmsFyYXxW05auaWpbYlpReJmKLWihVkBexDKgPBmz17rkReqBw3Fu2lsACpDBM2aZGBIU23c0TKARtKl7uYDhy6Qj00LJ6tBGKfTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750693753; c=relaxed/simple;
	bh=qJVVK7ez7W8Ym5Cp3wxOjBCCe+w6D/pUFXNefwF7Lgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uPO4WaazZM0mvBy2ofWO1oepwHHMUSpsiMJSMm4vQe3Lt3PbWB8U1ytU4oH8ugc2IgGwVC0rGDUIXPuj2KAPtjl8Ppc+SqrpuuJ/i9QbMQTjRg3kyeeOjdXSXqUL/s5PzP+EsNoJX7cPKWBMY1XKk2LJwaHMns1TP8GcIpaZp2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sCoNveB3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sCoNveB3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34CF2C4CEEA;
	Mon, 23 Jun 2025 15:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750693752;
	bh=qJVVK7ez7W8Ym5Cp3wxOjBCCe+w6D/pUFXNefwF7Lgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sCoNveB3ZtINFVtbCBwImsJouoKzz5MrLuMG5oN5Fl8i5qgdzVggqPkUorSMp2Qpe
	 +Ja3+AMQXS1NvvAukSC4pyffGcwYu7dGfCiEzJ36e2k3JFlWx1Sgp/bN/APmQMn+b+
	 RRqBjBbImywJl0gJ2oxTWvbCuZ3ThCL+6N3qNYYxsJX5ahaYplLxg8afDIOtm7X+kd
	 Mx7rRkELj+6ny7FJlZpPUnTcTkA0eR8Op+WJ9S4tX5WgK+S5Uu7nM2N1mKYVIhAfq6
	 +xw5ynK2YhvrC6iYVph3arcxXj02SePDkTRyaOvxFEKyVC9MlbO3PHMj7gaC21FnzR
	 ROGXpg7WYR15w==
Date: Mon, 23 Jun 2025 17:49:05 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Benno Lossin <lossin@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 01/24] rust: dma: fix comment
Message-ID: <aFl3cUUWkLYBWrda@cassiopeiae>
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
 <20250619-nova-frts-v6-1-ecf41ef99252@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619-nova-frts-v6-1-ecf41ef99252@nvidia.com>

On Thu, Jun 19, 2025 at 10:23:45PM +0900, Alexandre Courbot wrote:
> A word was apparently missing in this sentence.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied to alloc-next, thanks!

  [ Slightly expand commit subject and add 'Fixes:' tag. - Danilo ]
