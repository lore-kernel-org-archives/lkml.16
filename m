Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D261A1EB3D;
	Mon, 12 May 2025 11:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747051174; cv=none; b=debkS1s7WdOFNMD9IAuS4qFjuATs20DAFHLnITLGVOOE8JunjR9lWp7EJHy9NhjGsGKER8nS/mZTSBPCEmh+KzW0MhhSsLGAcYSEgu7Tx4NefFXFN/U29/qo3YIqW/0grf8UJIKiM9YJdaYFgfc3xNIyc/zOudMAE+XtwTk3Me0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747051174; c=relaxed/simple;
	bh=Z154dBtwXoDh4iznRU5KYR6L32vpMgHKOYaM0QmH3Ik=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=B8+iBp3N5leMYxeUjQStH7DatgfYGQJkGHpNJFe0CKAoe3QXx08i7BRXHW+l1iLkui30kG+dfJM6Yxc1ht1fJcxsnajqFLinSeMW5OIC8oHntQCxReDAk22vJajhTj/IrVUAt7ahhlzZwjKxLUVl+si+bQIHny51KLWd8QDKGc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ZwyZN4VFCz9scZ;
	Mon, 12 May 2025 13:49:32 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 May 2025 13:49:27 +0200
Message-Id: <D9U5QMVLOCUU.2M8O7F9UA7FLE@buenzli.dev>
Subject: Re: [PATCH v4 0/9] More Rust bindings for device property reads
From: "Remo Senekowitsch" <remo@buenzli.dev>
To: "Remo Senekowitsch" <remo@buenzli.dev>, "Rob Herring" <robh@kernel.org>,
 "Saravana Kannan" <saravanak@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Dirk Behme" <dirk.behme@de.bosch.com>
Cc: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
References: <20250504173154.488519-1-remo@buenzli.dev>
In-Reply-To: <20250504173154.488519-1-remo@buenzli.dev>

I haven't gotten any actionable feedback on this version.
What's the next step?

Best regards,
Remo
