Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76A1309A59
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 16:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751647608; cv=none; b=PpEEpT1fHNVNCJnOt6lCAtMkvZFxFFK7oi2rWX+RYu8NULk5IRNGI8VfV1a13QxO9UYN/bhR7IyTVQVYw1oTDW6EqL1VNGk7WP4vLVUbDvh/bTSbzaswgGQaDXhPzmNUasXa80a4U8d0SekO0K+G3gjpcH1d1ih0euJIK7qKV94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751647608; c=relaxed/simple;
	bh=0kTMew52cRaWNXIHn1pEHe+lf6e/XRLunhVDmPc3FTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gS6KiaAklp6Ji4afs83SL/Zogt1IyJqTOmMRWYSWNgKg5TtJmQrHrFWd+w2/i0zv3aGOzYvgPp1F8tH3laA0OP44lphqPtKAmFcAVWuYvjL2GEA9gO9/OZ8JfgpTcRs8sFdlFm88bFZGuA8eIu88MZv3T83h8p6qdoD6INQiAyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57B9F26AC;
	Fri,  4 Jul 2025 09:46:31 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A7F53F63F;
	Fri,  4 Jul 2025 09:46:42 -0700 (PDT)
Date: Fri, 4 Jul 2025 17:46:32 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	linux-um@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH 21/23] um: ptrace: Use USER_REGSET_NOTE_TYPE() to specify
 regset note names
Message-ID: <aGgFQxrBfwF5QbP4@e133380.arm.com>
References: <20250701135616.29630-1-Dave.Martin@arm.com>
 <20250701135616.29630-22-Dave.Martin@arm.com>
 <98d145e6dd8e216a3f7e146ad4e401724c3d669b.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98d145e6dd8e216a3f7e146ad4e401724c3d669b.camel@sipsolutions.net>

Hi,

On Fri, Jul 04, 2025 at 01:58:57PM +0200, Johannes Berg wrote:
> On Tue, 2025-07-01 at 14:56 +0100, Dave Martin wrote:
> > Instead of having the core code guess the note name for each regset,
> > use USER_REGSET_NOTE_TYPE() to pick the correct name from elf.h.
> > 
> 
> Seems to work according to the test in the cover letter. Since it's part
> of a larger series and this patch doesn't build by itself, I'll assume
> you want to take them all together through some other tree, so:
> 
> Acked-by: Johannes Berg <johannes@sipsolutions.net>
> Tested-by: Johannes Berg <johannes@sipsolutions.net>
> 
> johannes

Thanks!

Cheers
---Dave
