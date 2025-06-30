Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CFC849C
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751270207; cv=none; b=Wv4Dv4/PVlq9OPbCpsx2N8BJJ1TNYa6J0j84HU0mUIohJBzSLeSB0X/qgaAaK1WbZRhYZIXDCh0/sz5zEmvzGtDidYBNEbkVRWaaDo3RdUQLSBEJANXUBRFUbyd+84tdcqejHzbhT1QnQVZhfLZ2bDR3FRpQyNJV8oztLoqfymw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751270207; c=relaxed/simple;
	bh=RsPzyl1QaWRfmgCh0kdzgypQXy2dsV/pLN06k69m3YI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W7JwwA5qHHfV2Bp258Wihx25toOxG2J3zXvZkjN788MsBWDdpLLm2JJ06xyM0IAfBnJ3JUW7T4ChxMYrVMYb0NwN69quIlK0PCx9YmKgGfasQECKYUFCINtOY3biNubu/r9HwE8E8xNS420/SlraAPElgnEyiXbKfvZOtM85hYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=H3StGTsu; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="H3StGTsu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=clXotmQK2fBKk6NffSDoLpVZjlb7gWYryEPzX0KmYXw=; b=H3StGTsu72IajGWEpgHO7DIDk9
	2jth7bDUbnZtMlnVrG/T/Azv/YAK/67vCGHGscGAq125WlI2Ros/0nlh1q3RG0OCgcTdggMReuSi1
	0m59RwzPQ/W7IPM9SSrGJkoDdJ7nUf2kIrM7E+CHkAzlQumLANsccybKxFWO0mP54w7Sokk2x/3v9
	aYx5NwulPK2ZNiYm3j3MSwEFjd8fSaqHfgJSOofrr/7dmcTfrVOcXTj2mpkVewEikYcKv2QMD0FKW
	rUPuCgHRhu6HJfLIq2Pj4b8qArqGkJqUwVGcz2+58USqdVnC1RoLqNZc1mw2V4d5N/DAT4UHcdHOC
	VlJ8nIwQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9NX-00000006k9z-26hv;
	Mon, 30 Jun 2025 07:56:40 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 14413300125; Mon, 30 Jun 2025 09:56:39 +0200 (CEST)
Date: Mon, 30 Jun 2025 09:56:38 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Alexander Potapenko <glider@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, quic_jiangenj@quicinc.com,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	Aleksandr Nogikh <nogikh@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dmitry Vyukov <dvyukov@google.com>, Ingo Molnar <mingo@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Marco Elver <elver@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 02/11] kcov: apply clang-format to kcov code
Message-ID: <20250630075638.GJ1613200@noisy.programming.kicks-ass.net>
References: <20250626134158.3385080-1-glider@google.com>
 <20250626134158.3385080-3-glider@google.com>
 <20250627080248.GQ1613200@noisy.programming.kicks-ass.net>
 <CAG_fn=XCEHppY3Fn+x_JagxTjHYyi6C=qt-xgGmHq7xENVy4Jw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG_fn=XCEHppY3Fn+x_JagxTjHYyi6C=qt-xgGmHq7xENVy4Jw@mail.gmail.com>

On Fri, Jun 27, 2025 at 02:50:18PM +0200, Alexander Potapenko wrote:

> Setting AlignConsecutiveDeclarations: AcrossEmptyLinesAndComments will
> replace the above with the following diff:
> 
>  struct kcov_percpu_data {
> -       void                    *irq_area;
> -       local_lock_t            lock;
> -
> -       unsigned int            saved_mode;
> -       unsigned int            saved_size;
> -       void                    *saved_area;
> -       struct kcov             *saved_kcov;
> -       int                     saved_sequence;
> +       void        *irq_area;
> +       local_lock_t lock;
> +
> +       unsigned int saved_mode;
> +       unsigned int saved_size;
> +       void        *saved_area;
> +       struct kcov *saved_kcov;
> +       int          saved_sequence;
>  };
> 
> (a bit denser, plus it aligns the variable names, not the pointer signs)
> Does this look better?

Better yes, but still not really nice.
