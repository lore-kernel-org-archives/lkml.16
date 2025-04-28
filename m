Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F499CA5A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 00:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745799952; cv=none; b=NvUiViaY/doBVRAKB3ZJ+Cic2cLFSK8d3tCRbLrFr8Bv7EdUz4ijJ6xMoly0+4PtlZBpO8xxmvdk7iw69UUoWrhU11UbGg2z7eWDVfbZObR+4s0GmCCclGVGOqzPWKXEEVBQ+0lNfyp5i8D4xn6s/qysiuXzifGXhG+4MhZSQPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745799952; c=relaxed/simple;
	bh=UAIcUnR5dXXujcJafH8L/x3/rr3j7NTIqySaFlrWMYc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Am2v1T+EZUdU7yzVzYhy8JQfCApQbkHxK0MzSHdTHkRR5cLLvJFqCdeOay5lgPGOTHsfTxPrM59PA0fWhgch0u6iziHp1Th5aIgB0Ba7vaWrzQkp23XzKVoGcwZFzWk4Y0ef6vCH17kb5W7/bPXaM+6/UtysX4PCBW8vqf+7Xq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=jgW0MiyE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="jgW0MiyE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33F3C4CEE3;
	Mon, 28 Apr 2025 00:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745799951;
	bh=UAIcUnR5dXXujcJafH8L/x3/rr3j7NTIqySaFlrWMYc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jgW0MiyEc84udzOs8HZR9dgF6PsfXdc1zq8rKL0vNRui3W6wPWQzdBmKIQK+/fGkh
	 Oj42OYChE/IhgPBCUOmMsOm2djzavBzqNer80aB+K2rSMiYlM0dRl8KQxbFTGdK+Wa
	 ocrsvtnYADmJwOUwzAoBQ6BJndJaJ7msgNTQPcZg=
Date: Sun, 27 Apr 2025 17:25:51 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Cc: pasha.tatashin@soleen.com, surenb@google.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Andrey Konovalov <andreyknvl@gmail.com>
Subject: Re: [PATCH] mm: alloc_tag: change the KASAN_TAG_WIDTH for HW_TAGS
Message-Id: <20250427172551.fbf81f14d4e6563c13007a65@linux-foundation.org>
In-Reply-To: <20250426180837.82025-1-trintaeoitogc@gmail.com>
References: <20250426180837.82025-1-trintaeoitogc@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 26 Apr 2025 15:08:37 -0300 Guilherme Giacomo Simoes <trintaeoitogc@gmail.com> wrote:

> the KASAN_TAG_WIDTH is 8 bits for both (HW_TAGS and SW_TAGS), but for
> HW_TAGS the KASAN_TAG_WIDTH can be 4 bits bits because due to the design
> of the MTE the memory words for storing metadata only need 4 bits.
> Change the preprocessor define KASAN_TAG_WIDTH for check if SW_TAGS is
> define, so KASAN_TAG_WIDTH should be 8 bits, but if HW_TAGS is define,
> so KASAN_TAG_WIDTH should be 4 bits.

Why?

I assume the effect is to save a few flags bits under some
circumstances?  But that's just me guessing - please fully describe the
motivation and effects within changelogs.

