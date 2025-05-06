Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316B822DA01;
	Tue,  6 May 2025 08:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746519372; cv=none; b=hptKIV9Zzt5kybNdTBRmDUx0BDU1VC7AZFF0QD+2+bused3IXF4WWzAwEX5wwmFeOyNlDuOnP0nJNktUC4OkbgFOwS+1bCz5bL28KUSVVXRAmEnMf1l/SszR7HWdQulaWulB01HlhHXF/U10BL+uFARZR55WAzi/RtmhKNkGeO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746519372; c=relaxed/simple;
	bh=IBMKzmGE761qCT/KSzjE1E9EZn49WR4X3grri5QOiy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glXqaSNC9MizLC5QMQhX82Y92g8pZgisLVczcqjgMtpaGL2ZT6Z/LVTHlkf4zQvd0GvL+/7z8MvHWGkQmtNTmJCmQp/kbD0HMp/g3ej84hZdiXk2lt+9aYdnwf/9Tl7WzssBQwwsLT7bCxI34UUbzTkekWOVn7xAXZwX5SLDsLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ldEB7MD0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ldEB7MD0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0554EC4CEE4;
	Tue,  6 May 2025 08:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746519371;
	bh=IBMKzmGE761qCT/KSzjE1E9EZn49WR4X3grri5QOiy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ldEB7MD0/bWOC19yj2U7Dhp1/ae+29tNEDGK62IQENKExPoYIQ7MKCa6M1mbSPF+y
	 46D3UwCObXz1Xa4QAhRjgyLVx25IBVJZLGX8AVziYTbvaHaU5DLwhv91VbGqMNYlfU
	 9IINoGDgnrmJFmHoooB0Wy0mVW5GYa9t+ktR3XGCf0yI0KWXx4HHsObXrTMAZy1aRF
	 d3vgiSRY0txaa6Obk/aBrUPlUl9fTJOQm6iqMmNiKk36zGmqdutpkhDMOpVcPqKR3L
	 LdqEWVGqgvKosTF/Iw1633beSnuTzs0a6OLdd49NbupclBskgHFyaWoGtAo4MgGzKH
	 w/K90z3vHSUyA==
Date: Tue, 6 May 2025 10:16:06 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 13/26] x86/cpuid: Scan CPUID(0x2)
Message-ID: <aBnFRrnZQ9HwwULK@gmail.com>
References: <20250506050437.10264-1-darwi@linutronix.de>
 <20250506050437.10264-14-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506050437.10264-14-darwi@linutronix.de>


* Ahmed S. Darwish <darwi@linutronix.de> wrote:

> +static void cpuid_read_0x2(const struct cpuid_scan_entry *e, struct cpuid_read_output *output)
> +{
> +	union leaf_0x2_regs *regs = (union leaf_0x2_regs *)output->leaf;
> +	struct leaf_0x2_0 *l2 = (struct leaf_0x2_0 *)output->leaf;
> +	int invalid_regs = 0;
> +
> +	/*
> +	 * All Intel CPUs must report an iteration count of 1.	In case of
> +	 * bogus hardware, keep the leaf marked as invalid at the CPUID table.
> +	 */
> +	cpuid_subleaf(e->leaf, e->subleaf, l2);
> +	if (l2->iteration_count != 0x01)
> +		return;
> +
> +	/*
> +	 * The most significant bit (MSB) of each register must be clear.
> +	 * If a register is malformed, replace its descriptors with NULL.
> +	 */
> +	for (int i = 0; i < 4; i++) {
> +		if (regs->reg[i].invalid) {
> +			regs->regv[i] = 0;
> +			invalid_regs++;
> +		}

Could we please emit a one-time syslog warning & diagnostic when we run 
across invalid or otherwise weird looking CPUID data, instead of just 
silently skipping and sanitizing it?

Thanks,

	Ingo
