Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9432DA742;
	Tue, 24 Jun 2025 14:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750775040; cv=none; b=cYdKoThma+1/fTS4b6zcQkWE9gy9+8X4AAjRDxZbrqJyfcj1fOfwDQnO5nPN/jhbGs60wcsxzS7/nq3hjPxsEfVU7Cf78f2ApRKsAux0oYYWaNEEZhSJ01a8tltY5nuZmBIS8A+6dvb82UnvDUHMIu0Ee/q8kwgeG8PfvQJKsCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750775040; c=relaxed/simple;
	bh=tNRMEI5nf/iadR8D6N7pjAraSpW4joOIs6wUn9W8s9w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RA9+Gy9TitIGjYMeNFsdSRSI44eT1KfBsE0s0ighoeiBl2+772L0tgV7whn/dFpPQoqzEJc5srjido7lm8hBmScIaNfayDI96uDm4Sh4ToLXUpQR6v9vviIhVWRRXNwBALc8rwkNGu9QykERElueWhcUYV7lF68SJui8MUpWTZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf11.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 845DD1D71EB;
	Tue, 24 Jun 2025 14:23:50 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf11.hostedemail.com (Postfix) with ESMTPA id E66972002D;
	Tue, 24 Jun 2025 14:23:47 +0000 (UTC)
Date: Tue, 24 Jun 2025 10:23:46 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Petr Mladek <pmladek@suse.com>, Jonathan Corbet <corbet@lwn.net>, Andrew
 Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [RFC 1/2] lib/vsprintf: Add support for pte_t
Message-ID: <20250624102346.4e175914@batman.local.home>
In-Reply-To: <aFqj7CYRcEHFAi2e@casper.infradead.org>
References: <20250618041235.1716143-1-anshuman.khandual@arm.com>
	<20250618041235.1716143-2-anshuman.khandual@arm.com>
	<aFQP8LzVMctf6XH5@casper.infradead.org>
	<d5a86ef8-a58c-4abc-8312-08406c847edc@arm.com>
	<aFqj7CYRcEHFAi2e@casper.infradead.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: frj4m14cmjrhgb7eecmi3eiez9m7q7g7
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: E66972002D
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+IrmPdEPDMTQPOYQJLheFaIW5Jwe/VI6I=
X-HE-Tag: 1750775027-262139
X-HE-Meta: U2FsdGVkX18ZrWvhIVM6zP5G4nszQvGFvGRorQIfUXNQqKlbCXpYq4P7CUojbbp0ixwYRObH4yt956p5nl1byTSPn6rmNm6mermFvf8IGge05jqBii1cCrollhwtGUVmMMW6lHLsGbWAghzsNCXOsWK5NNqhZ+zyryw5ueiKh+JwG+E/DgXwbFoEi6oD3PgnP0mr7CFUGrmWw8bT66SI5ZZLRoEo1khBGdQKrfty//dfldLIbXacD+hNzpES83s6x83uv276GQNyDXYAkEMOqH4CgBX0KJaRcsoHvM0A3FoBp04QHQr1GqNp6H9ixTiPlZiJMXk7MPFFrfrV7nFxKIQr/29/hhkDzE3I1xqZrGfcyQpCXecjzwn+QEEisL76HtKkQINQrqFL5ybj0CPjAQ==

On Tue, 24 Jun 2025 14:11:08 +0100
Matthew Wilcox <willy@infradead.org> wrote:

> On Fri, Jun 20, 2025 at 01:42:53PM +0530, Anshuman Khandual wrote:
> > On 19/06/25 6:56 PM, Matthew Wilcox wrote:  
> > > Unfortunately, the one example you've converted shows why this is a bad
> > > idea.  You're passing a pmd_t pointer to a function which is assuming a
> > > pte_t pointer.  And a pmd_t and a pte_t are sometimes different sizes!
> > > (eg sometimes one is 64 bit and the other 32 bit).  
> > 
> > As discussed on a separate thread, this might be addressed via separate
> > printf formats for each page table level e.g %ppte, %ppmd, and %ppud etc.   
> 
> There's still no typechecking!

There's lots of %pX formats that have no type checking. I think this is
an issue. Could we have one of the static checkers test these? Smatch,
sparse, whatever? Or maybe they do and I'm unaware of it?

-- Steve
