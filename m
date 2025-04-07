Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7648A25B66A;
	Mon,  7 Apr 2025 19:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744052647; cv=none; b=TJRD/6W28jhbGLTiVqGSO1BNTrClIIgXoBcBzV9xrQ6x7ZHkf2h6q+HTFTPvNNJNs0Z3cx2WTI/gCbwbnTRawsXZ+DQQsxX73QX9re1XRJGcRyRjstKQ3vJ/QItbyuTciyWIw1xOJrsPOnUgUlkW548onhGxOlQf5Wm4o2nmAS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744052647; c=relaxed/simple;
	bh=qqrw6QRkHJJzwT64WIKngX6jRFxi983UO52jm9agfOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7koXJHdIeqeIdIuF6oNIoCr0i2fFVf6POITX3XmWVlqxmHc2l8sKJdubbJCu4/hWnOuIQjQV9Whsi3pSWFA/a1vyiMvT70NLM0XLnvTOY/d7FH4hHjWPdR8+IF7kiROzKrQvl9JZQKsYfGldRDNQmmkjY1ynqtogNUOAHq7Pa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PaJNJa1k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PaJNJa1k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32123C4CEE9;
	Mon,  7 Apr 2025 19:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744052647;
	bh=qqrw6QRkHJJzwT64WIKngX6jRFxi983UO52jm9agfOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PaJNJa1kHSlAkFt6D4jNyw4pzpsOSColBRH1qfEYKHdz4TrUCw9wN5amD3LmAyBeZ
	 kA7zYSgh58faw94Kb7Wg9Z/YYjlcykrwJKmScMuQgN27nplhvagJ4UoYoKIQaZvFoZ
	 kRSxAyO0e73yASn8PLZVFo38qFh21GhPQQtSincuB08MEdtOPqWuH1uXw1mf9sgNXx
	 aN9TgIqbtIaFSbirmSbugNz9PlUMqmme5U1pQzGPTENd2vZzBP+ZPJOXhIBJV1iQcx
	 T8fnd2D5gCz/OINyrlhzjyXLSm0dU468sY0pszV5AxuLmnq8dz2qkmwtzTURA5TbhX
	 D6eQph2ulg/RQ==
Date: Mon, 7 Apr 2025 21:04:01 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mario Limonciello <superm1@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH 2/2] x86/CPU/AMD: Print the reason for the last reset
Message-ID: <Z_QhoXeHf-Itua95@gmail.com>
References: <20250407162525.1357673-1-superm1@kernel.org>
 <20250407162525.1357673-2-superm1@kernel.org>
 <Z_Qdn_WYAalNAHOi@gmail.com>
 <ebfaae8d-7186-454f-ba06-b86fea357d03@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebfaae8d-7186-454f-ba06-b86fea357d03@kernel.org>


* Mario Limonciello <superm1@kernel.org> wrote:

> > I realize that the entire numeric value gets printed as well, but it's
> > the symbolic decoding that is most useful to humans.
> 
> The way that I "envisioned" this working was someone uses their machine and
> suddenly hits a problem.  When they do they look at amd/debugging.rst and
> then run:
> 
> "journalctl -k | grep "System reset was due"
> 
> and then map the odd duck(s) out to the table.

99% of such people wouldn't know about amd/debugging.rst (nor should 
they really: why should there be an extra layer of obfuscation while we 
have this thing called a 'computer' that could ... compute all that 
lookup for us? ;-), and they'd be looking at information in the syslog 
after weird reboots.

We should improve their quality of life as much as possible.

Thanks,

	Ingo
