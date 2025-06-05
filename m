Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A391F866B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749150067; cv=none; b=ihcDFTrxGZrNpqoU87lkF+Y/oIMHVA4IeSRp02d8JoLH2DFx7etuhrCy0N5NhHF1m5mCHonMHHmvrScsLTbpedJlv2kEonkZmfQcP+3ietlxUpFQEGsPkffy/N59/MFZXYPqkAJW7TO3mqXiQb7cKWPqWgix5jfSj8CFWiV/Lm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749150067; c=relaxed/simple;
	bh=rjNFkTdHlIYAh7ztjyqRpYgoq5tEcq8g10DXIEnC7vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qMNrVLFKvMl13rRrU117TUhEBq9GWR9jnSRMSqOLWibP5SRzHbZdR5uDtL2hRpiOl7LqHByKmMMyGfvI9JkW5bvHFyLtgRVsvdsBIiOaniKi4vL6zqvH2ufxSj0kCrznLMhd4reRiF669c2q0Kgb0ZitQp6rs6+dSSDVK8p+Z38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=I/XfKdXo; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="I/XfKdXo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pJlMENO5Z4eAGVQHNIl03I+Y2HhrdVR/b1rwndwBBEE=; b=I/XfKdXoGKjRluv9ouE1XIvRPe
	HdjxJG7EYp/pjE2uaZe02vHQR8Soy1ABtE9cURmG85dsKkbezbW2jjoBK/dhNZ/pxHgZe8f+vJUAv
	NRBl9umwrClSmYkuHF5P1aET/O1AfzNm//KFmOqdA8zupyyJGPhzzJjCMNdbxax28ZEzJeCaVd1Fi
	nHt0oBHDph1VTwS1q+N/ipw/iuNy/x12u95Le8MiULFPwugn3SHsMKGD025LXN79MyfI26B/gyUGt
	iPR4fxmFUKfh6fcrZjJgNfECMt5/9euqHjQ1ZL1esJAM1CMAlrFnorwVL+dTTPMtZZ+WTWb44Sl1q
	zbQHTJ+Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNFpf-00000001CEM-3WIM;
	Thu, 05 Jun 2025 19:00:56 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E9B2A3005AF; Thu,  5 Jun 2025 21:00:54 +0200 (CEST)
Date: Thu, 5 Jun 2025 21:00:54 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: torvalds@linux-foundation.org, mingo@redhat.com, x86@kernel.org,
	linux-kernel@vger.kernel.org, ubizjak@gmail.com
Subject: Re: [PATCH v2] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
Message-ID: <20250605190054.GH30486@noisy.programming.kicks-ass.net>
References: <20250605164733.737543-1-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605164733.737543-1-mjguzik@gmail.com>

On Thu, Jun 05, 2025 at 06:47:33PM +0200, Mateusz Guzik wrote:
> gcc is over eager to use rep movsq/stosq (starts above 40 bytes), which
> comes with a significant penalty on CPUs without the respective fast
> short ops bits (FSRM/FSRS).

I don't suppose there's a magic compiler toggle to make it emit prefix
padded 'rep movs'/'rep stos' variants such that they are 5 bytes each,
right?

Something like:

   2e 2e 2e f3 a4          cs cs rep movsb %ds:(%rsi),%es:(%rdi)

because if we can get the compilers to do this; then I can get objtool
to collect all these locations and then we can runtime patch them to be:

   call rep_movs_alternative / rep_stos_alternative

or whatever other crap we want really.
