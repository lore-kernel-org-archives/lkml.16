Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AF927CCEB
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 17:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745342698; cv=none; b=K/x7tiZ2uXcSqZghUOvVimla7xLjk3qFkSauQcEI3YHnt/DphwOTbj7xLYmkMqaMfAJAXDkU9JSxHQ55oxQDqNpU13bVPbIVWZY+jhXvmmcQWDpdar1OCN6RfNAc52TpXQqYibUe2GcRXiDcmHd46mJD+AGr6EM8UCMFmc/6BAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745342698; c=relaxed/simple;
	bh=G5zu0JSLIZnjygNaAbrN9TY+IzqeznYDI3lTQI9xByA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKTSTcC0Fp9OShLgUsBzWWkwGLtzLoK5L9V10rPbM07kkbzY/1rAJdUsoHfPJG8r97n9WeMzozjp9mwmencRTvIpwaFunUuKvFhmIFf2RVqS11AqL7yE2DDRMxoWyDFd9B3GlzjViCzhM6Y2EK6bp96YLzRAwsjE6gI1uDBmEx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=bkqgBWMy; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="bkqgBWMy"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7570240E01ED;
	Tue, 22 Apr 2025 17:24:53 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id lpktIz2xC9OV; Tue, 22 Apr 2025 17:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1745342688; bh=fHUhRPQeLb6MEC9JiG1WS/e5XF0k0kr/nU/zoi8PWGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bkqgBWMyLJAzpDzQbOlz4ocgmddTEs49Ilbl2J4EtJWMbKS6M8L6/JuvkDQLnBXxI
	 CuU6FOulP5wtOdbiRbI4z7MZu2CkKSDPfgiIX3b9/eAZNZAbc4xfnD7++vSoY+Kqwe
	 0JhIJzupG/+yMyqcj6o/c0a5mgVUHW9xTdJe5QPESHAHTjo2zecWyFmJ3mn+j1Bo7d
	 TWYhCLVnQyNqsERSgSlYO6Q1mCtxSpLqc3KIfyx1Maf7BFLztNz4aNgDlUq5G/8/DC
	 zrukqaLrULhOTq22dtdye75l58EGAPVmlKs42WWxh9Bnl88DDTp0t4LkpH73PDcN5Q
	 Pj7o7TyPYLmSrl4p1r0JVWL0DkKQPCT+I7YF46Zy39RZRWPW9VXS9CA7ZX5SNGrTxY
	 KDmw6GgdRvVs48JXz5RpPkz/hB83htja80LhN+eQ6RXxHGmJ5nv5h2auzKSB9UBDTM
	 h1h5B2SU7BwFnKUzZRol1vn/IonmVsd8sRqFPeAicQs9O/NrgPjsVG7h8267z+H2z2
	 wwFpumpZYn5jSpNCbjdEKVPcBtX7w+Voqs/rHmJ2ugR/KoNxAIlwaReXb8rUqGZ2CU
	 ySgWvSZB4JChzagYpq4bcP8sxDDlFLB6Ye8iweuzWGgdPhRvpBm675SRFsXuE7NfXE
	 0Ro0fzoeg92Dfp11JmocslGM=
Received: from rn.tnic (unknown [78.130.214.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id E0B3D40E01CF;
	Tue, 22 Apr 2025 17:24:37 +0000 (UTC)
Date: Tue, 22 Apr 2025 19:25:37 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Kaplan, David" <David.Kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 01/16] x86/bugs: Restructure MDS mitigation
Message-ID: <20250422172537.GCaAfREUU_9RGUwtqK@renoirsky.local>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
 <20250418161721.1855190-2-david.kaplan@amd.com>
 <20250418204243.GQaAK5Q807BYWlABKV@fat_crate.local>
 <LV3PR12MB9265B16CFC9D3E02C1159DEA94B92@LV3PR12MB9265.namprd12.prod.outlook.com>
 <20250422081901.GAaAdQ9aB5KTI5INO7@renoirsky.local>
 <LV3PR12MB926519BA499E7648F97B569794BB2@LV3PR12MB9265.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <LV3PR12MB926519BA499E7648F97B569794BB2@LV3PR12MB9265.namprd12.prod.outlook.com>

On Tue, Apr 22, 2025 at 02:32:07PM +0000, Kaplan, David wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> > -----Original Message-----
> > From: Borislav Petkov <bp@alien8.de>
> > Sent: Tuesday, April 22, 2025 3:19 AM
> > To: Kaplan, David <David.Kaplan@amd.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>; Peter Zijlstra <peterz@infradead.org>;
> > Josh Poimboeuf <jpoimboe@kernel.org>; Pawan Gupta
> > <pawan.kumar.gupta@linux.intel.com>; Ingo Molnar <mingo@redhat.com>; Dave
> > Hansen <dave.hansen@linux.intel.com>; x86@kernel.org; H . Peter Anvin
> > <hpa@zytor.com>; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v5 01/16] x86/bugs: Restructure MDS mitigation
> >
> > Caution: This message originated from an External Source. Use proper caution
> > when opening attachments, clicking links, or responding.
> >
> >
> > On Sun, Apr 20, 2025 at 09:00:56PM +0000, Kaplan, David wrote:
> > > I'm not sure this is right, it certainly diverges from upstream where
> > > mds is only marked as mitigated if the CPU is actually vulnerable to
> > > mds.  I also think that imo it generally does not make sense to mark a
> > > bug as mitigated if the CPU isn't vulnerable (seems to increase risk
> > > of future bugs in the logic).
> >
> > Hmm, it still looks weird to me. So let's imagine the CPU is NOT affected by MDS.
> > The select function will leave it to OFF.
> >
> > Then, some other select function will set verw_mitigation_selected.
> >
> > Now, the mds_update_mitigation() comes in, X86_BUG_MDS is still NOT set so
> > we leave mds_mitigation to OFF even though it *technically* gets mitigated?
> >
> > I guess the reporting aspect does make sense - we don't want to start reporting
> > MDS-unaffected CPUs as being MDS mitigated because they're not
> > - not really. We just use their mitigation to mitigate other vulns.
> >
> > Then this comment which explains the logic of verw_mitigation_selected:
> >
> >         /* If TAA, MMIO, or RFDS are being mitigated, MDS gets mitigated too. */
> >
> > should probably say that if the CPU is affected by MDS *in any way*
> > - the BUG bit is set - then it gets full mitigation.
> >
> > And this should be the case for all inter-related VERW mitigations: if the CPU is in
> > any way affected, it gets mitigated too. If it is not, then it gets only *reported* that it
> > is not affected but the mitigation technique can be used for others.
> >
> > Does that make sense?
> >
> 
> I think that's correct, although I'd argue the code makes that rather obvious because mds_update_mitigation() immediately returns if the CPU is not affected by MDS.  So you only get an mds mitigation if you are affected by the BUG bit.

Right, ok.

I'll add a link to this subthread when applying so that we have some
reference to this.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
