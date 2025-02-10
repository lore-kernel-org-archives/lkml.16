Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223ED243378
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 13:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739192861; cv=none; b=qFix4JxaYnRGZ9pydE7oxVzixhzgR7YraweX6dHglHc42Mz334TUzWDgBQG1AEy7KHB+bfgZMNAgbo4E3bSOjranicK7zBpwhbgfjRl9etGmTBQZQ7UhX8x0/ixLw80n50OSAGAICQK3DVwF7L3XMG9gvOqqcflIsmCGSvLHjRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739192861; c=relaxed/simple;
	bh=xxcRPVJdpim3PAIxJEIh24IXsst+b08cHjgWiFjpG3A=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=WKBJPoPq7B2XwHfq2XeikzdEsPLgJvoUfpFDnFvEn1mETBwCJ8U4YxMyFmPgsfSpjiUwknb/Gmu0hRwiCmbBW2dwYt+IuCTgwI31FtNUD8yh96xJIXf9QT4tyL7EelaZMj47kVYx1VZ/+zrJkjZbe3Ig0O2l2dUkP8CdXhwg/p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jHNTVA97; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jHNTVA97"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739192856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xxcRPVJdpim3PAIxJEIh24IXsst+b08cHjgWiFjpG3A=;
	b=jHNTVA97x+MRYqld+ItI140rpCyMZNrgdCrU+nK/Li8oJPmGVoIg4IB2zNS65KWTLfW5pz
	18KKKf5zaUgJ9i8+yOIXmqFWRFx+6jJ6/VqvVhWO88ROi/+GRSbi6VPtMl+B1HmojGYVmA
	o0fpysxm3cSAxieTFV9xCYppiXJMkY4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [RESEND PATCH] sctp: Remove commented out code
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <Z6n2ZOTs_fKx-w9z@t14s.localdomain>
Date: Mon, 10 Feb 2025 14:07:18 +0100
Cc: Xin Long <lucien.xin@gmail.com>,
 linux-sctp@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <71FF1CAE-ECE2-4E91-AF88-71F868E454CF@linux.dev>
References: <20250209210024.5413-2-thorsten.blum@linux.dev>
 <Z6n2ZOTs_fKx-w9z@t14s.localdomain>
To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
X-Migadu-Flow: FLOW_OUT

On 10. Feb 2025, at 13:51, Marcelo Ricardo Leitner wrote:
> On Sun, Feb 09, 2025 at 10:00:24PM +0100, Thorsten Blum wrote:
>> Remove commented out code.
>>=20
>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
>=20
> SCTP patches are picked up on the generic networking mailing list.
> You need to send this patch towards netdev@vger.kernel.org.
> Thanks for your patch, but please post it over there.

Hm, the get_maintainer script doesn't mention netdev@vger.kernel.org

$ ./scripts/get_maintainer.pl -f include/linux/sctp.h
Marcelo Ricardo Leitner <marcelo.leitner@gmail.com> (maintainer:SCTP =
PROTOCOL)
Xin Long <lucien.xin@gmail.com> (maintainer:SCTP PROTOCOL)
linux-sctp@vger.kernel.org (open list:SCTP PROTOCOL)
linux-kernel@vger.kernel.org (open list)

Should this be fixed?

Thanks,
Thorsten=
