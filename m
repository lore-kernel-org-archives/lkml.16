Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450AA4C8E;
	Thu,  6 Feb 2025 15:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738857492; cv=pass; b=rM78hcvULIHiDNh/QJuEOrColBQNkSM8HGfUtI+MIzGtWkdFrYazv7tdiLHimANtQvdVyOluHbcjzirj0od/HYS4KGxlnfQql3Ccl1wMCx2H8B2cwMBiGKZWz5j1kuLGgcFE57TOqQwVbzumM5WfRRGE8+O9p+YnoPZoanFZtJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738857492; c=relaxed/simple;
	bh=yDPUsCT9hmh7vT+oOHRxNlaZfB9DoCgl5znzJqhS3go=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Aefkh3Q2PXSuxlWai43H4WFSVfhcIan6TZVtKuPrQyFiI/3AMEr4042qyD0w/qg2/xjS8kBf5YyTHNVkteTkxq2dJEmxzSGKz0QMUeWQLtcXKVI3Ubr8zfXoxlclyVapf+CpYZKvXAvxXyF96RzEoUN23xdaAWXV/txiron77PI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=lUvaMDEr; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="lUvaMDEr"
ARC-Seal: i=1; a=rsa-sha256; t=1738857469; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LWbKxtA5zrBaCf1ULzQDJOKBTk1Sj46wqe/FDnz6FZ8AM+q5XV8+SGVZQdJYt/foor+ehUx3C+3lp6tq88TL0m1CUyBhmBHA2GDTA7R/BBaWZ/vOa1kdziw0mVLZGwIVkhMqcwFo+ED0ra5YZLPOIssAZROAXPMOOBONffXsVFA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738857469; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yDPUsCT9hmh7vT+oOHRxNlaZfB9DoCgl5znzJqhS3go=; 
	b=YXbtygPTI/6Y1IJBjf4LP5luGto+SCbTBYXBpaA/dlylU6ii2GV/hVcJ8jQ32eqK5NTnA2va1+cC2LZ6QpLOH57h/mh6r1/eJ4Z+u78VFpY/GYGSM17sTSuPSkrTiB1MRwiJpxEG/SfdaQObqoMKsNm89xq4vm2MEQQtNWwCkh8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738857468;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=yDPUsCT9hmh7vT+oOHRxNlaZfB9DoCgl5znzJqhS3go=;
	b=lUvaMDErbtrHOvXxZEu2MSleKY8tSy7uOEJK6m5aMLFo6YfdOd8H6ZopYKDJKwDP
	isNQ7BbDGwFaBpMcWA7x+0ZoSyCkavf81bzzuX6W0A2y2Gwc/7uXK39sATjpnCfFPUR
	1aJvHLFhmWQwHKkH9trEmJ8iigO5a1m+onEzrXKo=
Received: by mx.zohomail.com with SMTPS id 1738857465134608.811360113628;
	Thu, 6 Feb 2025 07:57:45 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH v6 2/3] rust: io: mem: add a generic iomem abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <tencent_2E2CD1359817A58BB51F59E790325CFA6A0A@qq.com>
Date: Thu, 6 Feb 2025 12:57:30 -0300
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
Content-Transfer-Encoding: quoted-printable
Message-Id: <67AB9311-3EDC-44A8-9C7C-ABF2ED6B632C@collabora.com>
References: <20250130220529.665896-3-daniel.almeida@collabora.com>
 <tencent_2E2CD1359817A58BB51F59E790325CFA6A0A@qq.com>
To: Guangbo Cui <2407018371@qq.com>,
 Miguel Ojeda <ojeda@kernel.org>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-ZohoMailClient: External

Btw, Miguel & others,

IMHO, I think we should write a comment about this somewhere in the =
docs.

When I first came across this issue myself, it took me a while to =
understand that
the build_error was actually triggering.

That=E2=80=99s because the result is:

```
ERROR: modpost: "rust_build_error" [rust_platform_uio_driver.ko] =
undefined!
```

When a symbol is undefined, someone would be within their rights to =
assume that
something is broken in some KConfig somewhere, like this person did. It =
specifically
doesn=E2=80=99t tell them that the problem is their own code triggering =
a build_error because
they are misusing an API.

I know that we can=E2=80=99t really provide a message through =
build_error itself, hence my
suggestion about the docs.

I can send a patch if you agree, it will prevent this confusion from =
coming up in the
future.

=E2=80=94 Daniel=
