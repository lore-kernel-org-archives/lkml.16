Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68602F5310
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750239310; cv=none; b=SEHTANJyLwmprf45lX16nfx6Yk12RBp95hxXwDRC/yK5lLgEEiCpdytecR4Dg+DZYYE9XWH1nBVyn8Ckeyoo2Ug4I8iSZMOKNCqAXFkHWVIqr2+SH7G3W2N+oe6b6v0vYbcqlakSzOxIksug+qCFeaVNHrQg1QnWTA7GkWCDT3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750239310; c=relaxed/simple;
	bh=SMd3+w5PhXwkljBsDnToDUEcuqEPYLDZy+feKuQoibY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PeirsRpHxePlCS9cRz8PA2J3IC+Y4weoDjHP5qp57MLgA6lnB/0kRK+0GHsdU9kcWok1UIt6kRQH/7AwnavqMBDgR0I5COjcQwaZkQIzwsWurVu2xseIWA6nKAuL/18js89UPc+b9xmj38V+7XJd5JKL2Imcx1liDfMnr/LLPyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GsuzTah/; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GsuzTah/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZdieREG8SfMLgF18JN/XKB5UZpWCyJfwv8Jl1XzRz7E=; b=GsuzTah/mWTSniu8MCe6qoejuw
	Bgz2THUKvE3d+zXfUQ7MlTPUBJPdXyjNKadPWsKMIHTBjB67EnX34TrEq2s7im68AT6ZY3qKoOgIb
	VKJP559OyQMvPulbxyuykLGVHVxn/Nm/bqT+QBNPgGD6PIiISJGMjbxml/DP3AxcloB5niQVpnti6
	CpFW0SPznYCc7DZss4yAomov8PpEN+2VkcC4y0dZ1pIuTk6bXJRLfgpSCPWefF4XJs8hD9Bkg5Udx
	+zU3rpftYyMRyEn1zisgX8H2L3J6oAFJ/Po5N7cyY7ZSteNvTM6G9Rc7BP6UR+Q9Xg3O6mx8xZAcI
	SeqEUHaQ==;
Received: from 2001-1c00-8d82-d000-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d82:d000:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpCA-000000040Nu-0QO5;
	Wed, 18 Jun 2025 09:35:02 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E812D307D9B; Wed, 18 Jun 2025 11:35:00 +0200 (CEST)
Date: Wed, 18 Jun 2025 11:35:00 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Liang, Kan" <kan.liang@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	"Mi, Dapeng" <dapeng1.mi@linux.intel.com>, mingo@redhat.com,
	acme@kernel.org, namhyung@kernel.org, tglx@linutronix.de,
	dave.hansen@linux.intel.com, irogers@google.com,
	adrian.hunter@intel.com, jolsa@kernel.org,
	alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
	ak@linux.intel.com, zide.chen@intel.com, broonie@kernel.org
Subject: Re: [RFC PATCH 06/12] perf: Support extension of sample_regs
Message-ID: <20250618093500.GH1613376@noisy.programming.kicks-ass.net>
References: <20250617081458.GI1613376@noisy.programming.kicks-ass.net>
 <8fbf7fc5-2e38-4882-8835-49869b6dd47f@linux.intel.com>
 <20250617102813.GS1613376@noisy.programming.kicks-ass.net>
 <dc084dac-170d-434e-9d8c-ba11cbc8e008@linux.intel.com>
 <20250617133333.GU1613376@noisy.programming.kicks-ass.net>
 <20250617140617.GC1613633@noisy.programming.kicks-ass.net>
 <aFF6gdxVyp36ADOi@J2N7QTR9R3>
 <20250617144416.GY1613376@noisy.programming.kicks-ass.net>
 <aFGBxBVFLnkmg3CP@J2N7QTR9R3>
 <be13b2ce-a8c1-4aa7-9ddf-9ae8daee0ae1@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be13b2ce-a8c1-4aa7-9ddf-9ae8daee0ae1@linux.intel.com>

On Tue, Jun 17, 2025 at 04:32:24PM -0400, Liang, Kan wrote:

> > Yep, those options may work for us, but we'd need to think harder about
> > it. Our approach for ptrace and signals has been to have a header and
> > pack at the active vector length, so padding to a max width would be
> > different, but maybe it's fine.
> > 
> > Having another representation feels like a recipe waiting to happen.
> > 
> 
> I'd like to make sure I understand correctly.
> If we'd like an explicit predicate register word, the below change in
> struct perf_event_attr is OK for ARM as well, right?
> 
> 	__u16 sample_simd_pred_reg_words;
> 	__u16 sample_simd_pred_reg_intr;
> 	__u16 sample_simd_pred_reg_user;
> 	__u16 sample_simd_reg_words;
> 	__u64 sample_simd_reg_intr;
> 	__u64 sample_simd_reg_user;
> 
> BTW: would that be easier for ARM if changing the _words to _type?
> You may define some types like, stream_sve, n_stream_sve, etc.
> The output will depend on the types, rather than the max length of
> registers.

I'm thinking what they're after is something like:

PERF_SAMPLE_SIMD_REGS := {
	u16 nr_vectors;
	u16 vector_length;
	u16 nr_pred;
	u16 pred_length;
	u64 data[];
}

Where the output data also has a length. Such that even if we ask for
512 bit vectors, the thing is allowed to respond with say 128 bit
vectors if that is all the machine has at that time.
