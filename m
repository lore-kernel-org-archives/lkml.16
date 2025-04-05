Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0868BEC;
	Sat,  5 Apr 2025 15:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743866572; cv=none; b=Kz0nGVLNuusBB9T4kIJrezttu3Mu5SqYNAJcPz7nTZXqfzP4OY/hCMj+2u1J9YqQTEh5nQI09lt1QQgZM0fJIYok9z6MYhTu3lps0oiAxxWwB4JQHlKtaBLI/lA9a+5llTX1bsQZ6UA/O+JLKfLfP436PLOlCTPs7AzLwiueqgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743866572; c=relaxed/simple;
	bh=AsTS+okNNEcjNhneLzkpTBjQaHq/ikSyp17rWZPgM0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LUCB6vRTyidwo7Ww3PKQVhWdv2CoS7noJXxHbLF3QMrR+PIAdSBjq2OcaujyvLqISr/wH+H0fcHBbST5PjFOsNfpEWgLOU1KfsF9xLM70huichA1d0E9Dzx+QH8yK8R7ByXI7R6KV6VOt9gYeDfnaSGvsU8HF3iJVp4Iv1xSqh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gECW+mrD; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gECW+mrD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RSp5IyG2jfV46TGv1QBzEXdWUvQMivp8B+PoOYsevKI=; b=gECW+mrDXPbgrJFwmpEkYIwRiE
	gBvulg9av8Nts+w6vltCRqy00Nn+7n5qde148cnJ/cc0P1X1JnkxoEvUGqHxA9aIadbwN3lOsv3Pk
	FWiKiwuB9+PyauQJJ/xkxy529GH/UFwYWU/i+Oh2EwGUXQTEoKR65f67lpgRjoKtslAbVohZUhsDx
	ySM7WfSXSwdTaKG+5ptQy1Ty76NUyiXyEJOjs8VToHsL1eJfAHxVCNsoujki2wgMuIG1tTACEzjHC
	LodOeJRX2wcicYlOic/Y7WVeba9p5dcEBgg4b9+Y+fLVQ++UocTCrS+jlLSk8xf8PjJ7ZetiPJ+lm
	mbGQEnug==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u15Lu-00000003SVv-2CrS;
	Sat, 05 Apr 2025 15:22:34 +0000
Date: Sat, 5 Apr 2025 16:22:34 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: Liam.Howlett@oracle.com, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, dakr@kernel.org, akpm@linux-foundation.org,
	gregkh@linuxfoundation.org, wedsonaf@gmail.com, brauner@kernel.org,
	dingxiangfei2009@gmail.com, linux-kernel@vger.kernel.org,
	maple-tree@lists.infradead.org, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] maple_tree: add __mtree_insert_range function
Message-ID: <Z_FKugtgoN0l6JNm@casper.infradead.org>
References: <20250405060154.1550858-1-andrewjballance@gmail.com>
 <20250405060154.1550858-2-andrewjballance@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405060154.1550858-2-andrewjballance@gmail.com>

On Sat, Apr 05, 2025 at 01:01:53AM -0500, Andrew Ballance wrote:
> adds the __mtree_insert_range which is identical to mtree_insert_range
> but does not aquire ma_lock.
> This function is needed for the rust bindings for maple trees because
> the locking is handled on the rust side.

No.

The support for external locking is a TEMPORARY HACK.  I've talked
before about why this is and don't feel like explaining it again.
