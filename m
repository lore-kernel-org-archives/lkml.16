Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503B5191F77;
	Sat, 19 Apr 2025 09:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745055706; cv=none; b=W2cFYeFrc1QJOdBU+H6SZRLB+WS1W5DnkFrRxtdFnQIB8lWDmnGdrrVcsDvCeXf3etPh6e2mw4c3tDtCwIrEW7eiaRppDkXoDmigRZdmNcNXprzE1XLlQ9+nngxnpUaKztQuqHJTWuskHiylWJaQyM1bmkS+66QiU11OEFjRCmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745055706; c=relaxed/simple;
	bh=w4m0xp3PXcJ2BEtL5O/5Y1MrW8PDFSWVBjpEdt6Y/U8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FqeqQYFr7RjX+ss5biW8FP7eazE+luYOAR/LousDM5P1s4kxEkueFJ1FEFqdmnQLFd6TqaArEOrD0dE3ZTtH9Nup7jDPOWb2RrlmtpwmpShlJSlb4vwD0K10qHgkG+dIaJ20YZ1nr9Dr9O4AJ/si/B6OJ3pS80bsIMkwXtcGWr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 53J9fdIl032287;
	Sat, 19 Apr 2025 11:41:39 +0200
Date: Sat, 19 Apr 2025 11:41:39 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Shuah Khan <shuah@kernel.org>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 6/6] selftests/nolibc: enable UBSAN if available
Message-ID: <20250419094139.GE31874@1wt.eu>
References: <20250416-nolibc-ubsan-v1-0-c4704bb23da7@weissschuh.net>
 <20250416-nolibc-ubsan-v1-6-c4704bb23da7@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416-nolibc-ubsan-v1-6-c4704bb23da7@weissschuh.net>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Apr 16, 2025 at 08:40:21PM +0200, Thomas Weißschuh wrote:
> UBSAN detects undefined behaviour at runtime.
> To avoid introduction of new UB, enable UBSAN for nolibc-test.
> 
> By signalling detected errors through traps no runtime dependency
> is necessary.

Yeah that can be pretty useful, I agree it's a good idea.

Acked-by: Willy Tarreau <w@1wt.eu>

Thanks,
Willy
