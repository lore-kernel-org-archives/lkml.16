Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F03F2066C6
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 20:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744922408; cv=none; b=jtNpEuhvcS4qkeTsfedehB4Nh98ytDL5oLsS3UpIOoFrMYNEPSAA1GsBZk52AeBiToFUId5ewbfuchm5UqyHsXfSg6tOHErm8E3UBrnLcplPnBERRmMXlKGN+qrmo3hSYsLOzqnhHyxUZ0jG7VQ8i0I9D96ffDdw0lOnyPkm4XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744922408; c=relaxed/simple;
	bh=J+fTUy8JfPiu2xNDj7ikNeEFzhgwkqhWw+2n37PV/6w=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=oVC1c7ircqam4TrIqom36+MAaYqLmEKxKIGut+ZR6V9dxola9QGxWGyjVuXZOpOZxMLLjfExW1Eqgtkh9FlPJERp0CHerzUItgQPbGKtvEDdQP5T0Xqo8Y3/gDiU4WTcX4EOLdas7pafZWHyFsswLN22uVZMBYer7A3/sGEFvds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SbZrc6fY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SbZrc6fY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58EB5C4CEE7;
	Thu, 17 Apr 2025 20:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744922407;
	bh=J+fTUy8JfPiu2xNDj7ikNeEFzhgwkqhWw+2n37PV/6w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SbZrc6fY9T7SORAuDT6PDiTXud4pOI2WQgqyRUHxS1owfay8JbDu77kpqkUIyE5Qh
	 Oh/B9UCKJB+lIoWnFfCJkNEXaGRYxN0dEk0VKyaLHGsvqket/qFnMn389yq3EgAvVW
	 Ac7vuiezT5Fcq1vU3a5HDDsmi0t0TNco9o6PtXxg=
Date: Thu, 17 Apr 2025 13:40:06 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
Cc: linux-mm@kvack.org, rostedt@goodmis.org, mhiramat@kernel.org,
 andrii@kernel.org, kernel-team@meta.com, linux-kernel@vger.kernel.org,
 Mykyta Yatsenko <yatsenko@meta.com>
Subject: Re: [PATCH mm] maccess: fix strncpy_from_user_nofault empty string
 handling
Message-Id: <20250417134006.60e0d6b3fc963bcbec1255b0@linux-foundation.org>
In-Reply-To: <20250417152808.722409-1-mykyta.yatsenko5@gmail.com>
References: <20250417152808.722409-1-mykyta.yatsenko5@gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Apr 2025 16:28:08 +0100 Mykyta Yatsenko <mykyta.yatsenko5@gmail.com> wrote:

> strncpy_from_user_nofault should return the length of the copied string
> including the trailing NUL, but if the argument unsafe_addr points to
> an empty string ({'\0'}), the return value is 0.
> 
> This happens as strncpy_from_user copies terminal symbol into dst
> and returns 0 (as expected), but strncpy_from_user_nofault does not
> modify ret as it is not equal to count and not greater than 0, so 0 is
> returned, which contradicts the contract.

Looks right, I think.

But why do strncpy_from_user() and strncpy_from_user_nofault() have
different interfaces?

/**
 * strncpy_from_user: - Copy a NUL terminated string from userspace.
 * ...
 * On success, returns the length of the string (not including the trailing
 * NUL).

/**
 * strncpy_from_user_nofault: - Copy a NUL terminated string from unsafe user
 *				address.
 * ...
 * On success, returns the length of the string INCLUDING the trailing NUL.

This is surprising and I'm wondering what led us to do this?
