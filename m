Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8FE192D66
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744343020; cv=none; b=SWJ7N5fyW1ZHJlAZ8mbBq7H/10jHdUto2cEoyuh210c05EYm3SSXH4Jy9yjfu4cc4pWonONm4ScW3z3k3gu2iKLSzu8cp0dyrdWzUjHn+6Z5fQixQOdgZufRK6hEwK18MDB+Ki5NpZnqN8s/LjJDYCTwXSi32jCK/M+f0GDlJ0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744343020; c=relaxed/simple;
	bh=ccdCoOsuZDh49/vhKKIYG5n+U2fK9EeTfJXKyCfZd34=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=LWbmJvAVeNxVN/F87E9cjZKXxQ99GZFbNKGjUDu272NzRSPgpix0T5wJcmxyXTqJCDTwFTKMh8l0p73RFgVrukwiPLPhHuFqWXrZKLLkYznVq7Kb77P4pg+5adVrBmqKFHX4gkP5iU4Rbiex9nPUJ2Qnd2q2ycLQmXKT+IHbBCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=XQ+qVZlJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XQ+qVZlJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EDB8C4CEE2;
	Fri, 11 Apr 2025 03:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744343019;
	bh=ccdCoOsuZDh49/vhKKIYG5n+U2fK9EeTfJXKyCfZd34=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XQ+qVZlJVKORfcipef1lFWfojAwgH+j7aVfm+jtfayHGyNZxlkDkiR/BVavfChigE
	 OubmG23nxZaVDGz/3t3nCu13VAtZSvs3W3ptAqfD1i/2cYdNjkwWyhWhKH7BaNnpvy
	 yihmut6lU0YBkhwgWI6ns3ffkMSrvgk4GbP4w+xk=
Date: Thu, 10 Apr 2025 20:43:38 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Baoquan He <bhe@redhat.com>
Cc: linux-mm@kvack.org, david@redhat.com, osalvador@suse.de,
 yanjun.zhu@linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mm/gup: fix wrongly calculated returned value in
 fault_in_safe_writeable()
Message-Id: <20250410204338.4b2101afdf18d8898390ef58@linux-foundation.org>
In-Reply-To: <20250410035717.473207-2-bhe@redhat.com>
References: <20250410035717.473207-1-bhe@redhat.com>
	<20250410035717.473207-2-bhe@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Apr 2025 11:57:14 +0800 Baoquan He <bhe@redhat.com> wrote:

> Not like fault_in_readable() or fault_in_writeable(), in
> fault_in_safe_writeable() local variable 'start' is increased page
> by page to loop till the whole address range is handled. However,
> it mistakenly calcalates the size of handled range with 'uaddr - start'.

What are the userspace-visible runtime effects of this change?

