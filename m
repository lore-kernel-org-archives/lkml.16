Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C824B233D72
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745304251; cv=none; b=QjCjlfKxL58hytFqvP6uPn9nNSTwJ+AOPfIOxexRIEvMpAvkGvwyE3Hje+KqC9XLUdvFqvJVvY7hNz4S40ldRUeZ6VLmcoGwIN01uxXB4QQ5+cXT7yfewjPuHOWswzKLPqxIrahHD07rYvC6CBFPIxaqcCt9FN0K/kSZvKyIa8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745304251; c=relaxed/simple;
	bh=YFdpGTJe2ONQHWtEEiTTwADv75IaKRIEkB2Fv3z6uWo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ccAXOiD0FyhCWUQ3W1Oge7tQY8aT2KURLKe3ZjCvFAz9Ja7WNQNtUfr8Yj8KrmUnvaxpGqOFwSwK2lFb8v75tJmM4gI3fY15WaAzxaMKaRK0/MJvCMIo1Z+I2/fboPnRXoj43CQki/hQ1UfoqEqqlGKZJntPJfUENbX1UYbcmBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 2f6dd8d8-1f45-11f0-8efd-005056bdfda7;
	Tue, 22 Apr 2025 09:44:06 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 22 Apr 2025 09:44:05 +0300
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Juergen Gross <jgross@suse.com>, "H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH 10/29] x86/boot/e820: Use 'u64' consistently instead of
 'unsigned long long'
Message-ID: <aAc6teOZ3dgLIW-O@surfacebook.localdomain>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-11-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421185210.3372306-11-mingo@kernel.org>

Mon, Apr 21, 2025 at 08:51:50PM +0200, Ingo Molnar kirjoitti:
> There's a number of structure fields and local variables related
> to E820 entry physical addresses that are defined as 'unsigned long long',
> but then are compared to u64 fields.
> 
> Make the types all consistently u64.

...

> +		u64 start = e820_table->entries[i].addr;
> +		u64 end = start + e820_table->entries[i].size;

Perhaps struct range as well?

-- 
With Best Regards,
Andy Shevchenko


