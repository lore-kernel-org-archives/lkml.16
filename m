Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4C62116F4;
	Tue,  8 Apr 2025 06:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744093402; cv=none; b=nTm2gbibdrLu6iljimwEe1tx5WYUpKeVN9ki8QnIRBI4GSXBaTnrBR3m6/U0M9gdIZOocb8VRd49yVpCZlXbxG5KJXZ0enK5pzKYEWPWhDaMeBs37BhIiUOoS4jN51xbPI8BBRnvV4hmuw8iEF+LVvEA1a0uX3OWt6KBu5kjJ9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744093402; c=relaxed/simple;
	bh=vDlFkI7K44fG/1eX2PGlhRalUbXRAzJfsPAtS28hMhE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nw3vkIeB0m27K32Wz/EFHUJ9vSy13s2P5x7O5AfWW/Kf4MtBonWQOZr0IRZF/2USfVqr2IRZPbjeAO5tiyoKLa8PMwtgb1zfDCqI1kW6FEI0CUmgdw1k/pQ6y5TcN2xqZtfMzA0jLsIWldypAdygc8DIimMaUdchziI3rbsyYdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aaTj/65c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aaTj/65c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CEE0C4CEE9;
	Tue,  8 Apr 2025 06:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744093402;
	bh=vDlFkI7K44fG/1eX2PGlhRalUbXRAzJfsPAtS28hMhE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aaTj/65cKDusEpdjo46yvcT+JBtLHGM4U30oO5yXxUGKqMPzBBpN6N8H60NYepB7t
	 kndKlyUUSH0Zjgnb+EAI79tXth0zIJ80Zm5+Li2NYPeNLWlsCSspcjIE51/uK+3kPa
	 a+DW6WRFLWsCbMFqGeCVU8GHaoVkqX/4yxniucmEb/isl1jDcW8w8RBY1tZ0Vi03jb
	 QnZDgPK2bbgCMHfcZN7aKvkxc2qXGm0pXacNWPTlrSSCunlolsV3gk5eBlrzqfZAEE
	 7EymTebsmnitxhpsCPU+mTZqedaQbxuCVsG8Py3FFAfHgHQHCo7L9CrpBG/ggurJ72
	 0dWSMfwl6aMlA==
Date: Tue, 8 Apr 2025 14:22:56 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts: kernel-doc: fix parsing function-like typedefs
 (again)
Message-ID: <20250408142256.4b36b7e9@sal.lan>
In-Reply-To: <87h62z8utr.fsf@trenco.lwn.net>
References: <20250407222134.2280553-1-sean.anderson@linux.dev>
	<87h62z8utr.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 07 Apr 2025 16:34:24 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Sean Anderson <sean.anderson@linux.dev> writes:
> 
> > Typedefs like
> >
> >     typedef struct phylink_pcs *(*pcs_xlate_t)(const u64 *args);
> >
> > have a typedef_type that ends with a * and therefore has no word
> > boundary. Add an extra clause for the final group of the typedef_type so
> > we only require a word boundary if we match a word.
> >
> > Fixes: 7d2c6b1edf79 ("scripts: kernel-doc: fix parsing function-like typedefs")
> > Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> > ---
> >
> >  scripts/kernel-doc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> > index af6cf408b96d..5db23cbf4eb2 100755
> > --- a/scripts/kernel-doc
> > +++ b/scripts/kernel-doc
> > @@ -1325,7 +1325,7 @@ sub dump_enum($$) {
> >      }
> >  }
> >  
> > -my $typedef_type = qr { ((?:\s+[\w\*]+\b){1,8})\s* }x;
> > +my $typedef_type = qr { ((?:\s+[\w\*]+\b){0,7}\s+(?:\w+\b|\*+))\s* }x;
> >  my $typedef_ident = qr { \*?\s*(\w\S+)\s* }x;
> >  my $typedef_args = qr { \s*\((.*)\); }x;  
> 
> This seems like a worth fix but ... we're kind of hoping to replace that
> script entirely in 6.16.

Hi Jon,

The same regex was preserved at:	

scripts/lib/kdoc/kdoc_parser.py:        typedef_type = r'((?:\s+[\w\*]+\b){1,8})\s*'

It sounds to me that all we need to to is to rebase this change from
kernel-doc to kdoc_parser.py.

> 
> Mauro, do you have a series for me along those lines?  It seems like
> time to put that in if we're going to do it.  Then maybe this fix could
> be adapted on top?

I'll rebase my latest series on the top of upstream and send you.

If you prefer, I can rebase this patch on the top of it, preserving
its original authorship and adding something like:

	[mchehab: modified to apply on the top of kdoc_parser.py]

and submit altogether.

Another alternative would be for you to merge first my series, and then
Sean would send you a version of it on the top of the new kernel-doc.py.

Regards,
Mauro
