Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D9029AB02;
	Wed, 25 Jun 2025 17:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750874065; cv=none; b=THGRYdM1zvvRcsCzLhmVzBNCYHFKppPw2sexhphqSlIOcE20cyyeLXa5lQBX4PleR/qM1pOfs9uGGdqAPiwKUDdq5Vi+yB6AfIARlMeaddh27XrDGbX06L9AIwUnC8SiYwgB1BOiPoshyaEs3jwomYh8sOv3xPe4PXbxG03WKQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750874065; c=relaxed/simple;
	bh=NGkpVoEaQdpDgPeWuBVnzV5+AxosWbl5FUgYHVP9+F4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EKRD3/0tXxV5TP8mdJSH7qNRJVvVGUSi3T+25NbxhVV3eX6v5v4v8fkZ7o/HyWB8zpDkANFG5UVWnOXXa21bfvz4yw8mv3h40Ersg6SFEt3gyR/f1QtQ3LFmURMf0G5G/y3ca/RfQgJRmczM5nFCetUuXUlFKqGwl3EnxoZNjM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=BpMO2uHz; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="BpMO2uHz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1750872222;
	bh=NGkpVoEaQdpDgPeWuBVnzV5+AxosWbl5FUgYHVP9+F4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BpMO2uHzL5lQXkm1+fD38fBuWdrwbshTzBBQX81FyKHxfvSgdGXRMQkY/WAgW8oHY
	 Rp6K4Cch0Z0PulPhN+ed8UTdwp8c/9RaH1EZJtND6pn1PS+kCkEisyOiXtZCIieQGt
	 FW4z6emguFAfMa48GWSBaEyt//bO84GkbteQ5+hk=
Received: by gentwo.org (Postfix, from userid 1003)
	id 2D91040743; Wed, 25 Jun 2025 10:23:42 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 2C7F940113;
	Wed, 25 Jun 2025 10:23:42 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:23:42 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Mitchell Levy <levymitchell0@gmail.com>
cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
    Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
    =?ISO-8859-15?Q?Bj=F6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
    Andreas Hindborg <a.hindborg@kernel.org>, 
    Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
    Andrew Morton <akpm@linux-foundation.org>, Dennis Zhou <dennis@kernel.org>, 
    Tejun Heo <tj@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
    Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
    rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 4/5] rust: percpu: Add pin-hole optimizations for
 numerics
In-Reply-To: <20250624-rust-percpu-v1-4-9c59b07d2a9c@gmail.com>
Message-ID: <d938ed3a-cb00-0a71-2380-dac7d1a9e039@gentwo.org>
References: <20250624-rust-percpu-v1-0-9c59b07d2a9c@gmail.com> <20250624-rust-percpu-v1-4-9c59b07d2a9c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Jun 2025, Mitchell Levy wrote:

> +                        concat!("add gs:[{off}], {val:", $reg, "}"),

> +                        concat!("sub gs:[{off}], {val:", $reg, "}"),

> +                        concat!("sub gs:[{off}], {val}"),

Where are the other RMV instructions like this_cpu_xchg and
this_cpu_cmpxchg, this_cpu_cmpxchg_double etc?

