Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41DB19D074
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744970805; cv=none; b=DWBAP8BEfXOdwqaHhuCCKgkyCMklR0rVXxuJ9v/AKmI33ZyFuuZe3RcHHj4yPeGee/RQ232hw7CsfFx9c3UcBMqX/heiEzxDWWpJMHzrZHcrNQXaRYNbvqAKXDSdcXWKUZaXrjRDR1JSjUkSKVMSen+SQ1cojuJ1RQa/HuKjUFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744970805; c=relaxed/simple;
	bh=sqneE/YMjA/pyVVbycpzttNUKQsyesmIU7FKiP4qcz0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=H3yJ4bplA0Fcbt3Dngioju1SkX26/UNJeiZNCoilFYw4F2/ztQJE/Umd+rp6g3sxxuguLQkKxMwkwIxWGihxnRWWKfknRzraHnZ3dKPfOIKIHuRAV+aIfGYs7TNvN7YimmOV2QkxvryNOMsqrMbyjZ/y5myxYmS4DjJtacetqmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sQV/u+jV; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sQV/u+jV"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744970791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sqneE/YMjA/pyVVbycpzttNUKQsyesmIU7FKiP4qcz0=;
	b=sQV/u+jVRB+rp5So9kwTxElco0blrhF+ROpvv0VCcxheTE6X3VU+bBOB0XdpJX4lZ3+Z3R
	uydQjy/rRDSq3NTMQ+gGrQ0/qVN2ZGY9ZuI8xSlS0wwb5+1dwFpiQ44BdA1E4NJPnGSIAu
	wTPyrk5fYBGTD6sQ3RlFV9Zi1r1U/LY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.2\))
Subject: Re: [PATCH v2] MIPS: Fix MAX_REG_OFFSET and remove zero-length struct
 member
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <aAIF_kEFlOOVNDaE@alpha.franken.de>
Date: Fri, 18 Apr 2025 12:06:18 +0200
Cc: Oleg Nesterov <oleg@redhat.com>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <DAD22E95-6D33-43D5-B5E5-3A7B45A63944@linux.dev>
References: <20250417174712.69292-2-thorsten.blum@linux.dev>
 <aAIF_kEFlOOVNDaE@alpha.franken.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
X-Migadu-Flow: FLOW_OUT

On 18. Apr 2025, at 09:57, Thomas Bogendoerfer wrote:
> On Thu, Apr 17, 2025 at 07:47:13PM +0200, Thorsten Blum wrote:
>> Remove the unnecessary zero-length struct member '__last' and fix
>> MAX_REG_OFFSET to point to the last register in 'pt_regs'.
>>=20
>> Fixes: 40e084a506eba ("MIPS: Add uprobes support.")
>=20
> what does it fix ?

The value of MAX_REG_OFFSET and thus how regs_get_register() behaves.

=46rom my understanding, MAX_REG_OFFSET points to the marker '__last[0]'
instead of the actual last register in 'pt_regs', which could allow
regs_get_register() to return an invalid offset.

Let me know if I'm missing anything.

Thanks,
Thorsten

