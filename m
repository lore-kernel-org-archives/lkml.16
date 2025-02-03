Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964F31FF7A9;
	Mon,  3 Feb 2025 09:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738575564; cv=none; b=JyHUs2B3rzE6hyTLppoPXPjz+b2wwjhWUFpx6WZyR3Jds9uXA/0DFjNTI4KEQf+9yxadputnTxxBMZHNCcmzsOLCTFZcE9zVXntNkdjDQ3Lk6GYk1rJ0MS7GaPsP7xNzrHAyUbvVz++XLchWb3QJOmGwcXadkIDzEaEQSlvmZnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738575564; c=relaxed/simple;
	bh=d9KrmqcjKygeXQKFY1B1tTd5Y3bnHyn+8V+W97V7Xow=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=c9sCeVIalp3r0CylGbZ+OeMp8bsJZoKx6tMrSVcH4Fy8b7HxBgjL8qFhQjqwrUJZVbTyWgxkseF1isCdppSW9I5Ym9nFV8dQCbgCq0Y/8dKg3QMQSgmRyDBcAcLTk0tdAcVHpsvGX7xPGYNwoQnijhSi+IDd3oNys5jp/u3vfNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=oEiIp5aL; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="oEiIp5aL"
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1738575550; bh=d9KrmqcjKygeXQKFY1B1tTd5Y3bnHyn+8V+W97V7Xow=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=oEiIp5aLfXpHVrybmpQ3+9QtLZ0K1/8WMnaSm+xCJe3RyvUOIHS5woAOAMAa8FmKN
	 6bhl3+W8kqj/TSGV/thWoGhfHa78ZEwTAGV/lSAS63Y5/icTSKr2hDow0upRkH6Fq5
	 zI6BJOKw7Lp8xuLnGEpYT1pJUk5z0ikLePrCp2ak=
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,
  Boqun Feng <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,
  =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>,  Benno Lossin
 <benno.lossin@proton.me>,  Andreas Hindborg <a.hindborg@kernel.org>,
  Alice Ryhl <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,
  Jann Horn <jannh@google.com>,  Matthew Wilcox <willy@infradead.org>,
  Paolo Bonzini <pbonzini@redhat.com>,  Danilo Krummrich <dakr@kernel.org>,
  Wedson Almeida Filho <wedsonaf@gmail.com>,  Valentin Obst
 <kernel@valentinobst.de>,  Andrew Morton <akpm@linux-foundation.org>,
  linux-mm@kvack.org,  airlied@redhat.com,  Abdiel Janulgue
 <abdiel.janulgue@gmail.com>,  rust-for-linux@vger.kernel.org,
  linux-kernel@vger.kernel.org,  asahi@lists.linux.dev
Subject: Re: [PATCH 2/6] rust: page: Convert to Ownable
In-Reply-To: <20250202-rust-page-v1-2-e3170d7fe55e@asahilina.net> (Asahi
	Lina's message of "Sun, 02 Feb 2025 22:05:44 +0900")
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
	<20250202-rust-page-v1-2-e3170d7fe55e@asahilina.net>
Date: Mon, 03 Feb 2025 10:39:09 +0100
Message-ID: <87v7tr4bb6.fsf@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Asahi Lina <lina@asahilina.net> writes:

> This allows Page references to be returned as borrowed references,
> without necessarily owning the struct page.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>

Reviewed-by: Fiona Behrens <me@kloenk.dev>
