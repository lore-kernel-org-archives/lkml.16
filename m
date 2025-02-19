Received: from lamorak.hansenpartnership.com (lamorak.hansenpartnership.com [198.37.111.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A021EFF9B;
	Wed, 19 Feb 2025 14:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.37.111.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739973951; cv=none; b=si6+fg3vgFVVckPQAKGay22QEelCgpUZ/XZQSI4PGuSDAUbv7ysygHgb7uBSGMRRvHtaRb/9Wks+AU1LDU9XSv+EYPgjp5IR2zI4fsvCFmOSPBLmCqqze8iH6wCMZEGj1NGE3eV66rPvxl1Yzo8HMaLyhtWUb5QXoVjphw/6J00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739973951; c=relaxed/simple;
	bh=FSYYR8D4HcUWUPNVBHJnAF0DgvCczbX2FDUnvnu2euA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ey+k0s5hdxZppD6QQfr9I7Z+lt0U2oyIRAcIo2hjEkxXdmMHk9lYcM/3VTrbPffj9c/l8GwUAwkPwS1rgdywQ7E1ZD8YWyniYdKCXCskN/0D5hTSp5LDTaRQ+99qvcAM2XZR7Eyt2Ge0qELHskuRDao/rpGzKOOYHGTFZ3KnBbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=XHC58nD+; arc=none smtp.client-ip=198.37.111.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="XHC58nD+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1739973949;
	bh=FSYYR8D4HcUWUPNVBHJnAF0DgvCczbX2FDUnvnu2euA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=XHC58nD+kW2ChzOr7URyNLDjFxoz6VJ4XBmyFN21ZD97Q03klKhOJp3jWfboxvpBp
	 2x4Dn9JVA+Ib0o9wLp1TACimLHEIp2Sj39+mqI6lA/Mdmm3m7b/BJTCK+YIGRP7qDQ
	 Cxo6W68ykR5Rz8ixesVixM0GhdasuVA+sUAVJGJ4=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::db7])
	by lamorak.hansenpartnership.com (Postfix) with ESMTPSA id CFCD11C2555;
	Wed, 19 Feb 2025 09:05:48 -0500 (EST)
Message-ID: <b0a8ee53b767b7684de91eeb6924ecdf5929d31e.camel@HansenPartnership.com>
Subject: Re: Rust kernel policy
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Christoph Hellwig <hch@infradead.org>, Miguel Ojeda
	 <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux <rust-for-linux@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 ksummit@lists.linux.dev
Date: Wed, 19 Feb 2025 09:05:48 -0500
In-Reply-To: <Z7SwcnUzjZYfuJ4-@infradead.org>
References: <Z7SwcnUzjZYfuJ4-@infradead.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 2025-02-18 at 08:08 -0800, Christoph Hellwig wrote:
> Where Rust code doesn't just mean Rust code [1] - the bindings look
> nothing like idiomatic Rust code, they are very different kind of
> beast trying to bridge a huge semantic gap.  And they aren't doing
> that in a few places, because they are showed into every little
> subsystem and library right now.

If you'll permit me to paraphrase: the core of the gripe seems to be
that the contracts that underlie our C API in the kernel are encoded
into the rust pieces in a way that needs updating if the C API changes.
Thus, since internal kernel API agility is one of the core features we
value, people may break rust simply by making a usual API change, and
possibly without even knowing it (and thus unknowingly break the rust
build).

So here's a proposal to fix this: could we not annotate the C headers
with the API information in such a way that a much improved rust
bindgen can simply generate the whole cloth API binding from the C
code?  We would also need an enhanced sparse like tool for C that
checked the annotations and made sure they got updated.  Something like
this wouldn't solve every unintentional rust build break, but it would
fix quite a few of them.  And more to the point, it would allow non-
rust developers to update the kernel API with much less fear of
breaking rust.

Regards,

James

