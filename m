Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49AF42576
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 18:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746989176; cv=none; b=TPeGJTbuIsjQ4Qi1xSsr/lZ7o/wCGrNwnqDIzLdDFADAv890jAePY4Jbq/VAoXMEsrsKOur3zgXfaK1HStnGT0TEESyFbMuVRjDtLDKRf80LgQ90uiJv4odTcAdEtj+xZSf1FgoZ5x10H/t1f5XXZZ821QLIplCoGUTzsxHzQUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746989176; c=relaxed/simple;
	bh=Z0F2wpTQBq1FR7/IdxQN9hXw+nLUHcdKtfXgrCMvcHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDFmsxImzj7bu9JjoVcOSH8xUH0pgtny/Onxv1fqcsdya8g74EEW23VSWvIP+KNwPNA6XJSpLUhzjlK4M3ijw6eiymuXr2Rg5xat4AlRa/lzn7s6p0rL2549lPp3pZ+05TpdqTGg/0+aza8bpwdHEf5FGGQOC2DYahXZGBrzvDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 54BIhJG9008989;
	Sun, 11 May 2025 20:43:19 +0200
Date: Sun, 11 May 2025 20:43:19 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] tools/nolibc: introduce poll.h
Message-ID: <20250511184319.GB8976@1wt.eu>
References: <20250430-poll-v1-0-44b5ceabdeee@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250430-poll-v1-0-44b5ceabdeee@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Thomas,

sorry for the delay!

On Wed, Apr 30, 2025 at 11:35:31AM +0200, Thomas Weißschuh wrote:
> Move poll() to the standard poll.h and drop the custom related definitions.
> This also allows to drop an iffy workaround from the nolibc next branch:
> e1896bb9e079 ("selftests: harness: Guard includes on nolibc")

This one will be pretty useful for a number of small programs which
try to be a bit interactive, that's nice.

Acked-by: Willy Tarreau <w@1wt.eu>

Thanks!
Willy
