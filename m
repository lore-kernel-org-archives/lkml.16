Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8533F219E0
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 23:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750809189; cv=none; b=Mks7Ml9BCt2DVObu+osQr+aFOOsCX9qUqOfs817GFkglgTjb2+aXYXDShX/0q5nl/tAjC6zTgCSKoSE/Ize0WnWCe1n07XeaTUkkRCrbmclW5U7sABQJacjJ/GCPnfE31VRcf5FEOpNyh2MsaQUidCX+pu4CRAGw54IQQ2oS150=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750809189; c=relaxed/simple;
	bh=cqfA/8RZyZSfb2WD0MKdwfLR4uIcdjaax00d/SLtGOI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=j8cuTjPVKyTWssYCRx0GZUc8Q8E21NsH93azz6q1leWNnNXOhlmxvO2n1Tr4ylkxWBkzm9jaKIbmC8KLoTn1Wxc89W8k6cN0tGTAs0GbIcptqsutbWDwao1FCXJsuqItGKJc/D0FWw9JFKhVEn5VuBP81mk8WDMH1z4S4b+tBZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=yJNHidws; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="yJNHidws"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF9EC4CEE3;
	Tue, 24 Jun 2025 23:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750809189;
	bh=cqfA/8RZyZSfb2WD0MKdwfLR4uIcdjaax00d/SLtGOI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=yJNHidws9GNZeFCUYOnSXbzViiFCueoVUZK4Naz6k1Tc5lje0FnviLDNM7GE02nsF
	 lIBrfrggXIEdpWCgPicjHeFAa4IgYi2cZd04sAFhE7OAYyDIVxnGy2kQeuLcCzwg6N
	 L7tMlNyKNxmAVL+uj+iDeryeVKnWQWyCH9/cariw=
Date: Tue, 24 Jun 2025 16:53:08 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>,
 Kieran Bingham <kbingham@kernel.org>
Subject: Re: [PATCH] scripts/gdb: De-reference per-CPU MCE interrupts
Message-Id: <20250624165308.40511a280485679980147976@linux-foundation.org>
In-Reply-To: <20250624030020.882472-1-florian.fainelli@broadcom.com>
References: <20250624030020.882472-1-florian.fainelli@broadcom.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Jun 2025 20:00:19 -0700 Florian Fainelli <florian.fainelli@broadcom.com> wrote:

> The per-CPU MCE interrupts are looked up by reference and need to be
> de-referenced before printing.

Again, please fully describe the problem which is being addressed.

(OK, I can see it's "prints wrong stuff", but something like example
before-and-after output would be very helpful)
