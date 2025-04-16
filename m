Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A7516E863;
	Wed, 16 Apr 2025 02:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744769655; cv=none; b=kNZWTDOwpQG0/MOnezUv8Zi4FB1AMLQCnwhB5nVDg23UJxd0dVBfEF/KJ2rTXiaORJYiAIcFmJDLkJlsPf+tGa/TWefpgHSXMxdoOfnNfAnkPSpcuh2NN7mzXEHjxNVFgjV65GEAi7recildUszRIZgZtXntHg6oCxfp+xjQ/Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744769655; c=relaxed/simple;
	bh=nxGJS+rzlP92CWOpXOcC5vceEClw5jOcrRLOFl/5T10=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=kp5OfoOaEHYTLW7sIilt3U1JI8mVI5t0jXNI6YI3NT7ejfR3RHa4z+fxV3auyTRLLxeH0Dyif39yc/RlxByy1YfLmxrEWlDzq7mIYWPwOVrmA2hRk0W8WpgBd9JiXuE3qbvHVZGuMI0OdHgzD3TQXWixMAIQSeD3TkUGqvBejmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=vTYqGDow; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="vTYqGDow"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15C79C4CEE7;
	Wed, 16 Apr 2025 02:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744769655;
	bh=nxGJS+rzlP92CWOpXOcC5vceEClw5jOcrRLOFl/5T10=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vTYqGDowpPg8Iyk48kKeUEu5pZARlBGNUsLGCicsVuLrKB3ZcGiUjQjDrGlS61xUI
	 XBFOA/sEwVbAy8XDj141vmeeQLqLg9v+C2LNsCdHZZGlFIA8YtW0kRjbnv4yn/0QkM
	 H7UbQMSSxb5y1eFX+j6ValW3wN31zmlbEy3MmHiI=
Date: Tue, 15 Apr 2025 19:14:14 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ye Liu <ye.liu@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org,
 linux-mm@kvack.org, Ye Liu <liuye@kylinos.cn>
Subject: Re: [PATCH] tools/drgn: Add script to display page state for a
 given PID and VADDR
Message-Id: <20250415191414.a64de2d228ab5f43a5390acf@linux-foundation.org>
In-Reply-To: <20250415075024.248232-1-ye.liu@linux.dev>
References: <20250415075024.248232-1-ye.liu@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Apr 2025 15:50:24 +0800 Ye Liu <ye.liu@linux.dev> wrote:

> From: Ye Liu <liuye@kylinos.cn>
> 
> Introduces a new drgn script, `show_page_info.py`, which allows users
> to analyze the state of a page given a process ID (PID) and a virtual
> address (VADDR). This can help kernel developers or debuggers easily
> inspect page-related information in a live kernel or vmcore.
> 
> The script extracts information such as the page flags, mapping, and
> other metadata relevant to diagnosing memory issues.
> 
> Currently, there is no specific maintainer entry for `tools/drgn/` in the
> MAINTAINERS file. Therefore, this patch is sent to the general kernel and
> tools mailing lists for review.

Help.  My copy of linux has no tools/drgn/

