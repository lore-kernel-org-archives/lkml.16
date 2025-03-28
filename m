Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C118B221F1F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168980; cv=none; b=WsHUb2GzBOA4Bi4P+nlI4KRf4xc2unSGH35BAXlMlIxUbAPDvR7krd5NRE/W8UuWnQBS3br4p/LVren+oX1hEJh3W3zqHsmo9LNXx8wpFP2rVaMpsYucy8Tf2LP7ICpXK2uGJvBs6S4qxEcMu6D+oeiOvU1fRiJm/gLTlEsXlpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168980; c=relaxed/simple;
	bh=gAUG+3QHn5G2kE00kQ0ZJWy/tGz+gk+Kn6E2FuyOF1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lTAsvIr0tI6gSh2dMwRfV+wOq/bdgiIa+uWzpqypbbJPV2S6KN/FJRGUrv3S8bISQa1vzS7hSsttI/Do9z3qtDv0uFkH5EyCX97/TNLnWTpDJxfnkZ+OrvXtugnvL37fp9AFpGsmQr3wOPs5xHxb8gdOC0K4Kq5pJFubbdFcVQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QWl5fG51; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QWl5fG51"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A8A5C4CEE4;
	Fri, 28 Mar 2025 13:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168979;
	bh=gAUG+3QHn5G2kE00kQ0ZJWy/tGz+gk+Kn6E2FuyOF1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QWl5fG51ht11gtNw2/q0t3N6QnUnZMzpDer9PXEP+sFxCNPHhp0TOqohm7jF3U4C8
	 J6pWd2VnfKf9gRCsq/jG/IGoGBXSrPWb7X1xetQ42nCNbcdGwM4Ni+uEoJK/PyOYBF
	 UdwYgVSCR6am0SjWUuFLMT5RNgPyvljKkKnSxfPmdakWwgQ1hvHreihae/9WZSvdah
	 CF8yF4O1Yo+b3Y8i+OzpdXx3pgdj0tjsAWgxiVLaaIXWDMHRMBENdm/HjgA89srVMQ
	 B9my2pKP+fDguabedeicJ97Zk7cngSRec1a9oO8h45mhlFsWgoNXVi98gvucdwr2PJ
	 XTO/FY7nl/diQ==
Date: Fri, 28 Mar 2025 14:36:14 +0100
From: Ingo Molnar <mingo@kernel.org>
To: boris.ostrovsky@oracle.com
Cc: linux-kernel@vger.kernel.org, bp@alien8.de, tglx@linutronix.de,
	mingo@redhat.com, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com
Subject: Re: [PATCH 0/2] Clear AMD's microcode cache on load failure
Message-ID: <Z-alzhvfSXN4liNE@gmail.com>
References: <20250327210305.1694664-1-boris.ostrovsky@oracle.com>
 <Z-XEPVvEDhC5vzR4@gmail.com>
 <f8ec905f-04d4-46f6-909c-7f79b151c0df@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8ec905f-04d4-46f6-909c-7f79b151c0df@oracle.com>


* boris.ostrovsky@oracle.com <boris.ostrovsky@oracle.com> wrote:

> 
> On 3/27/25 5:33 PM, Ingo Molnar wrote:
> > * Boris Ostrovsky <boris.ostrovsky@oracle.com> wrote:
> > 
> > > Drop microcode cache when load operation fails to update microcode.
> > > 
> > > Also make __apply_microcode_amd() return correct error.
> > > 
> > > Boris Ostrovsky (2):
> > >    x86/microcode/AMD: Fix __apply_microcode_amd()'s return value
> > >    x86/microcode/AMD: Clean the cache if update did not load microcode
> > > 
> > >   arch/x86/kernel/cpu/microcode/amd.c | 9 ++++++++-
> > >   1 file changed, 8 insertions(+), 1 deletion(-)
> > Should these be Cc: stable perhaps?
> 
> 
> Definitely the first patch. The second one is not really a fix but rather an
> improvement.

Well, #2 seems to be fixing a real bug too:

  If microcode did not get loaded there is no reason to keep it in the cache.
  Moreover, if loading failed it will not be possible to load an earlier
  version of microcode since failed version will always be selected from
  the cache on next reload attempt.

this bug basically regresses the ability to load an earlier version of 
the microcode, if a newer version's loading has failed.

It would be a pretty common usecase to attempt to load the earlier 
version if the loading of a new one doesn't succeed, right?

Thanks,

	Ingo
