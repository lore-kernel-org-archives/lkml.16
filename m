Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2569F9C0
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 00:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750120281; cv=none; b=Csie7DE+SR5ZjjQQwF1kWdfQnQWLlPPS7U7m+N1JF4GYnq9aZyfr9nKNq/WFKw8lQEVDgiGsRHzph9h0PQvP7MwFjkwmMDSDl4aSXAaDgYlMj2Ehe+XdyD3q8IgE12I5XoU7YhNyA8qBn+FWepUuAYJCm9JuZKc33ub8Nz3dNRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750120281; c=relaxed/simple;
	bh=84ERoaoacg5TLhJy4jhSzyrVfk7nXd3jjej6HdgI48M=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=BUd9dca8a6WOLcPJt25uWz/ligqXgHNUbFqCNuj6Z2/y6VbSzmiwnN7CV7T+rh2bt6uxSj6kc369Hg4Ub5+6UDcA9q9Tqbq2hwkksaoGfx1kX8x55fpwlM2pQ8LU0N3PbId7+ZjtC0jXxAEaPTEey3LFJIRPu+BarU419G9w56Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=g1QidaLf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="g1QidaLf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65A9DC4CEEA;
	Tue, 17 Jun 2025 00:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750120280;
	bh=84ERoaoacg5TLhJy4jhSzyrVfk7nXd3jjej6HdgI48M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=g1QidaLfxv8be8ouhNWazf36eazTtCrnaIrrDWiv1u1b01bcF5tOVMvPtXnoLUcLT
	 Q104GwS7BOGZDQMqR/nclKHD6qfuwFWykceWUX/Pm71t+F+vy6rKcSR3JDDvKLbfyI
	 N6Q6iVwKNDcizbggBnTXwCsJj06syxE7vqaqlrmU=
Date: Mon, 16 Jun 2025 17:31:19 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: =?ISO-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>, <linux-kernel@vger.kernel.org>, Antonio Borneo
 <antonio.borneo@foss.st.com>
Subject: Re: [PATCH RESEND v2] checkpatch: use utf-8 match for spell
 checking
Message-Id: <20250616173119.47615efceed220f52994679d@linux-foundation.org>
In-Reply-To: <20250616-b4-checkpatch-upstream-v2-1-5600ce4a3b43@foss.st.com>
References: <20250616-b4-checkpatch-upstream-v2-1-5600ce4a3b43@foss.st.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Jun 2025 09:59:13 +0200 Cl=E9ment Le Goffic <clement.legoffic@fo=
ss.st.com> wrote:

> From: Antonio Borneo <antonio.borneo@foss.st.com>
>=20
> The current code that checks for misspelling verifies, in a more
> complex regex, if $rawline matches [^\w]($misspellings)[^\w]
>=20
> Being $rawline a byte-string, a utf-8 character in $rawline can
> match the non-word-char [^\w].
> E.g.:
> 	./scripts/checkpatch.pl --git 81c2f059ab9
> 	WARNING: 'ment' may be misspelled - perhaps 'meant'?
> 	#36: FILE: MAINTAINERS:14360:
> 	+M:     Cl=E9ment L=E9ger <clement.leger@bootlin.com>
> 	            ^^^^
>=20
> Use a utf-8 version of $rawline for spell checking.
>=20
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> Reported-by: Cl=E9ment Le Goffic <clement.legoffic@foss.st.com>
> ---
> Signed-off-by: Cl=E9ment Le Goffic <clement.legoffic@foss.st.com>

Oh, there it is, after the "^---$", which marks end-of-changelog!
