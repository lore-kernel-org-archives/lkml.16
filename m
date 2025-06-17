Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD4F1DD9AC
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148109; cv=none; b=DlaESgantcTfzN6haEh1gkI2EPj2YsDsQda59KCmBNGNLzjRoaflzFWKdaCfGToMyrWN8NkOCkuKmOUYA95eTU6doiyHJm2/0NQE9NNW4qNf656qhPZR6FKE2+ZNnWLVqKTu3I9Iny4Zj3adqe37eo5B8tAqohjSgvnoueN71ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148109; c=relaxed/simple;
	bh=KwSIjv44MRzDX7fYjpH8GsU9Gf+pOgaUjlvtr+C24BQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I9ISDTItSO2HscBgvkabGRd+n6qGMTA7HwwGhrX7FWrE6hB/B+F6oX67CtVGxunWKs+21eKcq7/kafBOj7aDIizJlqkIGlzKQkHY1pLwyPwrL+syaDDqpqYcaFYcwpHxZcFjkQAD/sxyoKpRGgU9x+lNv3rvhjSxDhLlFu1TzYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UaroarKD; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UaroarKD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wu1YqUKDAIZe46nJTh0zOWvtjY27cIyBiMrhkGj1bjo=; b=UaroarKD2bunTxoEoqx0AmWepA
	yjQ34RGvjoJSilRTlwOmfbZpuGlnZ9zEJQ6D6Mcvj+XyaGZmvYDqz2bHcWm/Hr7L8amsN5HzFZcET
	9euMGvr7y/z43hjYvZniTpWXmNv8NcmG2vbeqlUcLvf5xrBnXSfefqsbS+WMWTWQjIH9aqh/dt9O7
	2SLbOot54yyG5JBHZlqYKhrAPzHRNS/Fszj4EiHABgVk5hz4qrNffMe5/sH2x5zNYwQvOSBaX8Tbk
	4IWsvqVJQaJYvx77N88DeKKIfgL8S7nih1SkRLYKrvrNG1mnBohx9msORjRiRlOzRYdgIB6vKhXCn
	DPggJaIQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRTA-0000000GsxA-1Pom;
	Tue, 17 Jun 2025 08:15:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F265B308523; Tue, 17 Jun 2025 10:14:58 +0200 (CEST)
Date: Tue, 17 Jun 2025 10:14:58 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: kan.liang@linux.intel.com
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	tglx@linutronix.de, dave.hansen@linux.intel.com, irogers@google.com,
	adrian.hunter@intel.com, jolsa@kernel.org,
	alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
	dapeng1.mi@linux.intel.com, ak@linux.intel.com, zide.chen@intel.com
Subject: Re: [RFC PATCH 06/12] perf: Support extension of sample_regs
Message-ID: <20250617081458.GI1613376@noisy.programming.kicks-ass.net>
References: <20250613134943.3186517-1-kan.liang@linux.intel.com>
 <20250613134943.3186517-7-kan.liang@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134943.3186517-7-kan.liang@linux.intel.com>

On Fri, Jun 13, 2025 at 06:49:37AM -0700, kan.liang@linux.intel.com wrote:
> From: Kan Liang <kan.liang@linux.intel.com>
> 
> More regs may be required in a sample, e.g., the vector registers. The
> current sample_regs_XXX has run out of space.
> 
> Add sample_ext_regs_intr/user[2] in the struct perf_event_attr. It's used
> as a bitmap for the extension regs. There will be more than 64 registers
> added.
> Add a new flag PERF_PMU_CAP_EXTENDED_REGS2 to indicate the PMU which
> supports sample_ext_regs_intr/user.
> 
> Extend the perf_reg_validate() to support the validation of the
> extension regs.
> 
> Extend the perf_reg_value() to retrieve the extension regs. The regs may
> be larger than u64. Add two parameters to store the pointer and size.
> Add a dedicated perf_output_sample_ext_regs() to dump the extension
> regs.
> 
> This is just a generic support for the extension regs. Any attempts to
> manipulate the extension regs will error out, until the driver-specific
> supports are implemented, which will be done in the following patch.
> 

> diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
> index 78a362b80027..e22ba72efcdb 100644
> --- a/include/uapi/linux/perf_event.h
> +++ b/include/uapi/linux/perf_event.h
> @@ -382,6 +382,10 @@ enum perf_event_read_format {
>  #define PERF_ATTR_SIZE_VER6			120	/* Add: aux_sample_size */
>  #define PERF_ATTR_SIZE_VER7			128	/* Add: sig_data */
>  #define PERF_ATTR_SIZE_VER8			136	/* Add: config3 */
> +#define PERF_ATTR_SIZE_VER9			168	/* Add: sample_ext_regs_intr */
> +							/* Add: sample_ext_regs_user */
> +
> +#define PERF_ATTR_EXT_REGS_SIZE			2
>  
>  /*
>   * 'struct perf_event_attr' contains various attributes that define
> @@ -543,6 +547,10 @@ struct perf_event_attr {
>  	__u64	sig_data;
>  
>  	__u64	config3; /* extension of config2 */
> +
> +	/* extension of sample_regs_XXX */
> +	__u64	sample_ext_regs_intr[PERF_ATTR_EXT_REGS_SIZE];
> +	__u64	sample_ext_regs_user[PERF_ATTR_EXT_REGS_SIZE];
>  };

Did anybody read this email?

  https://lkml.kernel.org/r/20250416155327.GD17910@noisy.programming.kicks-ass.net

The current regs interface really was designed for regular registers,
and trying to squish SIMD registers into it is a trainwreck.

Not to mention that AAAARGHH64 and Risc-V have vector widths up to 2048
bit.


