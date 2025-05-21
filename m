Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3402405F5;
	Wed, 21 May 2025 10:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747822832; cv=none; b=Nzf+Kxd7SNxIsM3YXWQlWllZTq/EMSENEZnRr/0pmDUMBcZWVqIbA/MMoRXHxE1DH9j0vRTt3O3yQHyopYHxGOvdwlq/UV2wRrQ9a+KHSf0FDTlZHNXxidtzGLP6RR0EXPCpyY6Aa84vUmXYfWpiQ0Os9wKM+nsmwD6qW4OmwtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747822832; c=relaxed/simple;
	bh=WkS58Au0FdDS6AKeNRjZwZmOF69mjuuXGMj2tbsRlBo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gv7vH6sqLAAinH0QaO0i+HpCtX9vlJjfQEp9YxAzS8CKTkEsT6L18PpSYt79BJSiy9S28fuN0EPa9DrioWBbj70+wiMjtnb4Dl9eKm+jNzsaowHrh3LKROIXZ3vL2r9Jr2uiCHeucrrvRn5wONQZ6bcZWvhU2JGHUI+rtoyw8lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ex0bH7QS; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ex0bH7QS"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BB2D741A9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1747822830; bh=OBCQ2+DiSFRmOVA09FWKPuM111yHHYZRrK684DrBWMk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ex0bH7QSsM0DbKe7V/6IHp5GvNRjSiuycEaGVCPLl5X1hMXquoQg7zFZ+PRvzviaN
	 wLmgSXx/ZOIoAi3EXhAj8qF30MW2GAP1CFaPi05IqgIpNqBlcMFDgdpkzPIhUyguau
	 6sy4pg9IquOpdYtzFcD41/hqKYi0Vz7EaDL8Fd7atbkSPhnAOUP4R1fL6OkI7y4XgE
	 cm9hKe2WlAeTnT1Br+fzqmmSiHXpLDJZNVJ+Wjif0xQ/orE7uRSzT84LlUi7EWqR1H
	 qLZFxlWIC0zRORvhKJJaMyuBO2bX0IyvOlaVBIooail+3/Wjue6/hnh91T/cQyR8AT
	 wnDx+lQp4+zOA==
Received: from localhost (unknown [93.187.88.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id BB2D741A9E;
	Wed, 21 May 2025 10:20:29 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Madadi Vineeth Reddy <vineethr@linux.ibm.com>, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Swapnil Sapkal
 <swapnil.sapkal@amd.com>
Cc: linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Madadi
 Vineeth Reddy <vineethr@linux.ibm.com>
Subject: Re: [PATCH] Documentation/scheduler: Fix typo in sched-stats domain
 field description
In-Reply-To: <20250520100752.39921-1-vineethr@linux.ibm.com>
References: <20250520100752.39921-1-vineethr@linux.ibm.com>
Date: Wed, 21 May 2025 04:20:26 -0600
Message-ID: <871psigt91.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Madadi Vineeth Reddy <vineethr@linux.ibm.com> writes:

> Fixes a typo in the description of the 23rd field of the scheduling
> domain statistics, which was missing the word "cpu".
>
> Fixes: 7c8cd569ff66 ("docs: Update Schedstat version to 17")
> Signed-off-by: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
> ---
>  Documentation/scheduler/sched-stats.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/scheduler/sched-stats.rst b/Documentation/scheduler/sched-stats.rst
> index 08b6bc9a315c..d82e7d2b54f0 100644
> --- a/Documentation/scheduler/sched-stats.rst
> +++ b/Documentation/scheduler/sched-stats.rst
> @@ -135,7 +135,7 @@ of idleness (busy, idle and newly idle):
>          cpu was idle but no busier group was found
>  
>      23) # of times in this domain sched_balance_rq() was called when the
> -        was just becoming idle
> +        cpu was just becoming idle
>      24) # of times in this domain sched_balance_rq() checked but found the

Applied, thanks.

jon
