Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0715243371
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 19:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749584371; cv=none; b=jarKxpnKCqo0rp0mKF8q/qyN5F2b3RW8v5RGEtYebgXYdcLZ75J1fUNiN0KGzVvW2JmERWIXVZgbibZ+viinEFdvSwsb/03lA8AXHmqxLxCBNTLXPWoYwxRz2mRQXcYTx6frVqpIUTKi3R24QPYjUeWWIsehd7DnnpcgpSg1CF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749584371; c=relaxed/simple;
	bh=o1OiRvR6fI6G7Ngbjpx6Htw99D4vmu6gCUuapMUkUFc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jLTVpal/LgVFKQbqBCPRm4hdMA4uDt8APav/jhgnwMV0p35UU7PcdkcfcWsFcdMBXskfjxFi97+gUvnDmaUtG0Er1TK6aHBVEWKAiQB4Z7WpLEFM+DXJCG0gnuJMZIx8VI/IqzUfu+6ncvLjGB1xmOvcuR24aoIBdMFfmAzdr5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf20.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 3F96D120E62;
	Tue, 10 Jun 2025 19:39:23 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf20.hostedemail.com (Postfix) with ESMTPA id 279E420027;
	Tue, 10 Jun 2025 19:39:19 +0000 (UTC)
Message-ID: <4dfdbc14dd374772e6230d88b95d9c5392b1112d.camel@perches.com>
Subject: Re: [PATCH v2] checkpatch: Tolerate upstream commit references
From: Joe Perches <joe@perches.com>
To: Petr Machata <petrm@nvidia.com>, Andy Whitcroft <apw@canonical.com>, 
 Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>
Cc: linux-kernel@vger.kernel.org, Andy Roulin <aroulin@nvidia.com>
Date: Tue, 10 Jun 2025 12:39:18 -0700
In-Reply-To: <20250610163133.217957-1-petrm@nvidia.com>
References: <20250610163133.217957-1-petrm@nvidia.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 279E420027
X-Stat-Signature: s7qcdz3h8rojgj7o8uoxtm7m6bunj3d5
X-Rspamd-Server: rspamout06
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+MpwH2iio9ogMtNfpLyaMaOzu3u1N3t30=
X-HE-Tag: 1749584359-85213
X-HE-Meta: U2FsdGVkX1+P5Oygw9NRiBS+3KBIAqJvH8qnd0FXqP4sb3ksz00jjVlcFVKhAxPR9LVnJRLpVjyao6jFUZLWQcUX3uxk6RQu4fKXj262LSN/5XDikGGoBl+88nzviwhIuEBaMlCLnQOCEz6+JUEbqa7aqae6d9slDnM7ZbBGRvzG/a4gsZk8NJlbC3NYLJvBxLHZ4iSndB5I8aks3eXo6RhsWbsGsSyr2oitE/XsUnNvwcMWkmtzxv0m3neMa0p3cyX1A+yFfaLiN5pjzCjsYUNZD4WF9w/hYGJGSQEM5jR0Zqu1Qa55jfWi6SFmRoAl

On Tue, 2025-06-10 at 18:31 +0200, Petr Machata wrote:
> Two forms of upstream commit references are used (and documented) for
> stable kernels:
>=20
> - [ Upstream commit <sha1> ]
> - commit <sha1> upstream.

Is the sha1 never abbreviated?

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -3351,6 +3351,8 @@ sub process {
>  		if ($perl_version_ok &&
>  		    $in_commit_log && !$commit_log_possible_stack_dump &&
>  		    $line !~ /^\s*(?:Link|Patchwork|http|https|BugLink|base-commit):/i=
 &&
> +		    $line !~ /^\s*\[ Upstream commit [0-9a-f]{40} ]/ &&
> +		    $line !~ /^\s*commit [0-9a-f]{40}\s*upstream\./ &&

always 40 chars?

>  		    $line !~ /^This reverts commit [0-9a-f]{7,40}/ &&
>  		    (($line =3D~ /\bcommit\s+[0-9a-f]{5,}\b/i ||
>  		      ($line =3D~ /\bcommit\s*$/i && defined($rawlines[$linenr]) && $r=
awlines[$linenr] =3D~ /^\s*[0-9a-f]{5,}\b/i)) ||

In stable I see a few like:

commit fef912bf860e upstream.
commit 98af4d4df889 upstream.

and

[ commit d3bd7413e0ca40b60cf60d4003246d067cafdeda upstream ]
[ commit 979d63d50c0c0f7bc537bf821e056cc9fe5abd38 upstream ]

and some with an upper case Commit

Commit d6951f582cc50ba0ad22ef46b599740966599b14 upstream.

