Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10482737EE;
	Tue,  1 Jul 2025 15:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383764; cv=pass; b=cgxRTLj4lY6uD6DljeFpC3eQlWuKpmJlwN2iVoF9qlQ9icto5UymhM6SweHD1FnevABsyUgLgF78jZfO+KjmuweaFdocPTXJCo779ZzHttosF3ghNqFlD+KwsgcvHKwU57AGy+t2XQh0+bdI7VwMu1RFH3d/6fOwSEJrYPh/cQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383764; c=relaxed/simple;
	bh=d+Rs5clTVso0jCNP1Eg9Dnc7y6Dip9AQssYZOfN7WZU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=svp/KLOed5fQ8mCFea1Fh2B6aKwJu0/mhDQ86jYJUiuXilL+n1gq6vc9j+OHeJQcMhdJ+mC5ax0LZ3gPtg/3QWHXp6tizE6x/xZU1/HEpMcSYULzr7TQohENMTsUzPL5uAWfbAlks5oi7qNq4kM7kdTT9NmlY6MNSfzqtPny3oc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=L1jwTvnw; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="L1jwTvnw"
ARC-Seal: i=1; a=rsa-sha256; t=1751383736; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e1o3F8FQDDXXF3faK9UQ5D/qdDYjjqa94IUwKDCJn1Hyab67Fo2e7bxBYeJPzC2YimmTMwGGwWxasDWLB1NcK2UEpkNU7uRFPkrgG43wfvsBzEbVsu7lWALunhCWnK9LWvhdHVb8tEdjEekghJT/3bagHlqwLZJ+wNFpab3nNW8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751383736; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=d+Rs5clTVso0jCNP1Eg9Dnc7y6Dip9AQssYZOfN7WZU=; 
	b=Nhdsw7FJW++/013GNfbgHrw8WiW1MDd5P3ms0bglSBYwc7YYyGqbMPu8iJndh7pS/lFtCTIqgX4ZNi7mKEKauTlKYpU2EGU7Vtsa8IWtYPqyT5zCdRvQsMnrqMJAGyF6BsO2251Eb1e0I0TvVssKOlklOO1BludDZlmoos3YKh0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751383736;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=d+Rs5clTVso0jCNP1Eg9Dnc7y6Dip9AQssYZOfN7WZU=;
	b=L1jwTvnwFTsrwWU1A6raNZVvZ7zbVNSJBk5NIsMgY31QNgQU/2joWKyoUU0cUuNy
	edxZ8agVw3g5wWsM7nvV/jnxhR7ZWqH4JwJVuFVqqDbH7aGh39eSHSkTSq9gm6Ie4pZ
	YCveGAKIWJ4O8V6jMH+I5OmmltR8fjTSPBp5GtTw=
Received: by mx.zohomail.com with SMTPS id 1751383734433149.693786363056;
	Tue, 1 Jul 2025 08:28:54 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v6 0/2] Add a bare-minimum Regulator abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250627-topics-tyr-regulator-v6-0-1d015219b454@collabora.com>
Date: Tue, 1 Jul 2025 12:28:37 -0300
Cc: linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <CC8F34AD-811F-4504-B625-AFD845198549@collabora.com>
References: <20250627-topics-tyr-regulator-v6-0-1d015219b454@collabora.com>
To: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Mark,

Is it ok for the abstraction to only be built when CONFIG_REGULATOR=3Dy? =
This
means that any Rust drivers using it have to depend on CONFIG_REGULATOR =
too.

I thought this was acceptable, but apparently that is not the case? See =
this
comment from Rob Herring [0].

-- Daniel

[0] =
https://lore.kernel.org/rust-for-linux/a1b3561d-f5de-4474-85ef-1525a6c36bc=
5@arm.com/T/#mdf9d4005ee99929d0009ccc988efbc0789164b6d

