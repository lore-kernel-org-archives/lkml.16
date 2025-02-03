Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5F420CCFA;
	Mon,  3 Feb 2025 14:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593708; cv=none; b=Ovn6C8h7TT18BVNBiF7pr+b8n7pEHmruLEDlJWn/5cMKh1PmpT5n7zBs9xaR03SDCmJ/IharnSjSM4Ty0CEFzvMPvwf8b19wL+e34/3YU/huXV525KjuwpVLZGO/ZCBtxPDIBcW6SqnJd1unXu9cyF+QbisR+8uXlw8y6uDtnd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593708; c=relaxed/simple;
	bh=o3RHR04b0nUHnjIcC7HG/raMFyT5aWadxRpEFPbyOlM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d8DB3VYlD3hVFVIrwApulbNCqw/K3Zy0demelVayfQS82lk/lyZaRdRwFy6Hjuq/4OtXrTnTzlmBuWLxn6GhJq0JekmV9EiIGpmMN1SiA19vT8ma2dlpEz2+y0Q2FbiSDdudF3czvCrYEqoTXPfB7xnpXg3knoulzkocPo3huPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net; spf=pass smtp.mailfrom=asahilina.net; dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b=RRljPB7e; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asahilina.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b="RRljPB7e"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 6A5804357C;
	Mon,  3 Feb 2025 14:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1738593704;
	bh=o3RHR04b0nUHnjIcC7HG/raMFyT5aWadxRpEFPbyOlM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RRljPB7eyI7Tuy/Q9XaefhPfH8wtBgFdNo4J2Jj1Fn1hBeOlhN9/9R2N+2DBTrJGE
	 G89Cj31pqFgbGu9LJGpC9qVEbK6yor20OQHeGsU2+1qgA8ilUdvg5YeYV8QEyIsQWD
	 5JHDRzdrpv2jm9K4c3tZRYJ7VK6rF4LQMdyaV8SkxftEF69fLGNEW1QPp8/KHxX3YP
	 Pl9dnrsst5oXMz95F7KVovy+0CxpZAaOyarooCJ0/O8WP8NrIISuI2KLzmsKJoRD5s
	 ORI/44BmmloKz9mjQB1dOg9SjgToYtCrvAqG26Qgft2SnxHEXi70QKe+IJzh4Fsi+1
	 Tc/wD5h39V5kQ==
Message-ID: <a3551d7d-14c7-40a0-90ff-1fcce93be62a@asahilina.net>
Date: Mon, 3 Feb 2025 23:41:41 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] rust: page: Support borrowing `struct page` and
 physaddr conversion
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jann Horn <jannh@google.com>,
 Matthew Wilcox <willy@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Valentin Obst <kernel@valentinobst.de>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <Z6CY4TvZwLkWmB3I@pollux>
Content-Language: en-US
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <Z6CY4TvZwLkWmB3I@pollux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/3/25 7:22 PM, Danilo Krummrich wrote:
> Hi Lina,
> 
> On Sun, Feb 02, 2025 at 10:05:42PM +0900, Asahi Lina wrote:
>> This series refactors the existing Page wrapper to support borrowing
>> `struct page` objects without ownership on the Rust side, and converting
>> page references to/from physical memory addresses.
> 
> Thanks for picking this up!
> 
> As you know, this has been previously worked on by Abdiel. Kindly drop a note
> if you intend to pick up something up next time, such that we don't end up doing
> duplicated work.

Sorry! I wasn't sure if this was going to end up submitted over the
holidays so I wasn't in a rush, but I ended up switching gears in the
past couple of weeks and I really needed this feature now (for crashdump
support to debug a really annoying firmware crash).

I actually only just noticed that the previous v2 already had
Owned/Ownable... I only saw the v3 which didn't, so I didn't realize
there was already a version of that approach in the past.

~~ Lina

