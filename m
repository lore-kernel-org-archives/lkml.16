Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C4018D;
	Wed, 11 Jun 2025 17:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749663069; cv=none; b=Qto0G9gpp1GQ6YMaTMesrZj9G2/OTiWi6NAn2uocUkU0ZL1As0Yc/bMUE9qPtjiJ6cMO4f02yR3e3hS/mycJ7o5uSJtSwo55IEIjZbWJdYu3FhZ5/+Xi+bf4BC0HCyrtkKWtG7BWVZg7WcXYEQkrHakJv5IFhmbrmXPPUOsUvGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749663069; c=relaxed/simple;
	bh=0I2hFvYrNdVVvAM09XkluPMes5sHQdHGs8/OPhmH0dw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pUNyk0ihMaxEnBa98gIA+SbJY5CeLo5Nn0cQxUXnhdj9XQTGQoScjnIP0VXSHfNksg1clzCmfZeS34UH7ctQJ+DOsc9alVktQ3KOrd7Z0Km6k1nHN/h6ok+LH1EbF45EPaegVoSdzWbUTCRDN3AHjDWwMqH2TmBDbK+0GGX74P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pue5bJ6L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pue5bJ6L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1089C4CEE3;
	Wed, 11 Jun 2025 17:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749663068;
	bh=0I2hFvYrNdVVvAM09XkluPMes5sHQdHGs8/OPhmH0dw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pue5bJ6LHaaKLi2K2K3YFqQm/tDt/COJhjfTh0ub+RxK3H4zQTvuwv+hjFG7cDD/+
	 6wleifL+bWUUfjcXxXEv1TvwQ4ZmaYEpkYTyEQVOPz9L/WgeafSo8X21/ytdpwgbV1
	 ixqegATGBS/7CMWPFCizOe4urhrojDRmo8W6SZx443Q3YrUxf51jOxR7qQkrE26i4v
	 M877fT53pZ1iVDyCiMggBUgjoXN+apzDewpQLIJjnUYheYl/A60+yPcwIeVO8kl7GS
	 npWpK0K2hhwIc5iuwiOFcFGhtiN9vcKHY3QlA2NPM6rcCB6hoCRN9+LQewLToGMFB2
	 /4xD/J/1mk4Rw==
Message-ID: <9e6ba2dd-11f5-4ec6-8b61-6c2a371c50cb@kernel.org>
Date: Wed, 11 Jun 2025 19:31:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: vec: impl Default for Vec with any allocator
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250610-vec-default-v1-1-7bb2c97d75a0@google.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250610-vec-default-v1-1-7bb2c97d75a0@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/10/25 12:31 PM, Alice Ryhl wrote:
> The implementation of Default is restricted to only work with kmalloc
> vectors for no good reason. This means I have to use
> 
> 	mem::replace(&mut my_vec, KVVec::new())
> 
> in Rust Binder instead of `mem::take(&mut my_vec)`. Thus, expand the
> impl of Default to work with any allocator including kvmalloc.

Applied to alloc-next, thanks!
