Received: from out203-205-221-245.mail.qq.com (out203-205-221-245.mail.qq.com [203.205.221.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1875616DEB1;
	Wed,  5 Feb 2025 15:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738768066; cv=none; b=Qtt3ooqloI9C3gTwjrW/V8QTwa4/M+9QNrq8V8erzodIfDLJw2MqzCWO0Ld+lyelin6FvJ6Mc3u73ahYcEopgJQmldaYfsJixQOXs5LRwB0dgPLow/3JUjueYTN75w73rR9LDZJYAfH/nwyWrVuGESG1oIZN2IinWIj0IAgC/dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738768066; c=relaxed/simple;
	bh=lFgJ7ira+qIDN5Adjj8pP/eVKEf6j7MarM7D4MImeZ4=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=gyh4pBglsjrLNUnBFKEuUJBA69YvAjNoCodOfeGwIX7ukCvo/JFSOuwVxm2t4ZBwlxYUhPLpK9h+5zvjyD6vBNjWHP5kzPL/kDcd/0OpZBXmj2QPT71AC9pWfLoLhRizd1wiPFHl0V8v+UClRTBCSeSK8WTS4DhqhEDBnfCgQcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=byZT1we+; arc=none smtp.client-ip=203.205.221.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="byZT1we+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1738767751; bh=thsj/gcSwuUbmIcc46Q0Z/qRcWBPVEWF936X8ky7/Uw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=byZT1we+MLHhFqzTcEE3xO1ik2hQmtul/pJMrWUvnHE7nP8E7T7fAb49BG8Bv6dQY
	 MMzghyhC5ivcdH1BPyjXhWH9zcCoHD9Ry6m7n9tqyDu397MIWjGCsCwVbxoAn+bEei
	 41qAEJTytKCyadfrniyCltvlHCQNSBsq5sK7AKAc=
Received: from jckeep-Lenovo-XiaoXinAir-14IIL-2020.bbrouter ([124.240.51.113])
	by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
	id E11AF673; Wed, 05 Feb 2025 22:56:17 +0800
X-QQ-mid: xmsmtpt1738767377tvz68y578
Message-ID: <tencent_2E2CD1359817A58BB51F59E790325CFA6A0A@qq.com>
X-QQ-XMAILINFO: MD3NrtMgOVQyz//DRtc1rEVFRHK0JZOJY5hqqzKGDT9nPYFq+NJkd4B91pLHt4
	 4tRJQffGYQzJ1fEONYLr/ugWWxD9p6CJqtJWghwieAjn32WBy5VayWpBXPmlk1yHCAWe2IVK6y0D
	 mDUHnNVSo8M03l85KOHMIZgmmN++OcUJg4YCjVyaa9/RXl6C1rrtBP1UVxdWP7RuputKlzr0VEmL
	 /PtlAWUag4pkZypfmvpL5ZjSw9gAAEXLdESsCrlrOOx+Ris04eWO0ScS3AIfm8B4ChhcU26CIG7F
	 cAFogKsf0YrcDHp7Y4JNj1ZPLGmHv0LL8nBWpuEaX6c/F0aQKtNYZSYc6U/jwUneYehJZLB+kMkP
	 ARVbEG6mmnnaoKKMffHigWGpRfZ2NxNwlsNY7folp6D4Zm2xD0CI8MwcpK74jLNwODQY49otzuYK
	 VqBVBg1X2pGVO9qpUdGLJkbjeYS9ocoNYevbMUnH0FNvfmwBgyraYUKOtHCl4HzsAcQDz+2pSJCk
	 3SNHhviAgV3406KGi0xERl74H0XAx5Y1QsBpajImQqN9tviurPrMuX9UuqcwhuPLJPdOC5+e9pVW
	 prW2spxmVf/IcBmW/izArkdl96idWI0/PGJM0hLG8u/eMJamdlR4CGJUKijWa1A9ZvhksDLlt6ec
	 WHjifSjM59OD6T2Ku1nsapQUf4W6o16SIkD7pDeLwt+h9x3GC9hel0MWSe3pIuc9vQCbNFZFtSb6
	 ex3ZrbAu+rwbqs9htZieh2yW08Ztdk4eQBcgmaGw9RJJkJKDTeR/nXVhMfUvOqO5u5hwlEscHbT9
	 cm1JDJFkB4oVZjfm6xGxNTEMuJBWrMtTXxXI6VcAafQ61kyPM0YrFjPXkw00VNRi6kLrqSYqXg3y
	 gpSplO12rbdG8MAEUsM0yKgkiKJS9SLC/h+8Bhf1wpco1te0t+r/DAcH1uXqxpofWLT/veK1Q2
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Guangbo Cui <2407018371@qq.com>
To: daniel.almeida@collabora.com
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	benno.lossin@proton.me,
	bjorn3_gh@protonmail.mco,
	boqun.feng@gmail.com,
	boris.brezillon@collabora.com,
	dakr@kernel.org,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	rafael@kernel.org,
	robh@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: [PATCH v6 2/3] rust: io: mem: add a generic iomem abstraction
Date: Wed,  5 Feb 2025 22:56:17 +0800
X-OQ-MSGID: <20250205145617.3867139-1-2407018371@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130220529.665896-3-daniel.almeida@collabora.com>
References: <20250130220529.665896-3-daniel.almeida@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> +/// A generic memory-mapped IO region.
> +///
> +/// Accesses to the underlying region is checked either at compile time, if the
> +/// region's size is known at that point, or at runtime otherwise.
> +///
> +/// # Invariants
> +///
> +/// `IoMem` always holds an `IoRaw` inststance that holds a valid pointer to the
> +/// start of the I/O memory mapped region.
> +pub struct IoMem<const SIZE: usize = 0> {
> +    io: IoRaw<SIZE>,
> +}

Compile-time checks are only possible when CONFIG_RUST_BUILD_ASSERT_ALLOW=y.
Otherwise, using compile-time check APIs of Io will cause a modpost error 
because the rust_build_error symbol is not exported. Details at the issue[1].

Maybe Io should expose compile-time check APIs only when CONFIG_RUST_BUILD_ASSERT_ALLOW=y?
The expectation is that a build error should occur when calling `Io::readX` and
`Io::writeX` due to a boundary check failure, rather than because the
`rust_build_error` symbol is not exported.

Link: https://github.com/Rust-for-Linux/linux/issues/1141 [1]

Best regards,
Guangbo Cui

