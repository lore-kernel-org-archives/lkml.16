Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1576474040
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 00:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750120224; cv=none; b=I4ulZl3f/AgFfvF2+iG5Db0FS79tUFULYDSY0kUaTgZOZHw03Va37Su+meS4xiqXwbEh//sBSn6ibcRmW4LGusyFACEV/jelUdrUL3qT7VpKbXLKqCr9NnHDP9u05MH2YxSIcpw0lSwBRYDxF6/FGAwmMgJ9Qv95tLxbNUvYRKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750120224; c=relaxed/simple;
	bh=TWbmvy8/N48JV1V6oHiDedi9/dngQNdTT05AqWVJeaM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bVJpbhsha/3E8Z+5A+yXV9tqt+zdiger2TGgWBL/8KwW9TeX+da8BUWvPLv3oP2OT2zC/X5aJrv17azqzth8MYucsFbLEInTvphmyPXz7VhhVor22FYmRPMUcU8h138AOTNZroUZIcJaxQ+gCJ184bqo1qx5LGLcXzT2X3RWUmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dKkUftd4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dKkUftd4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D3D4C4CEEA;
	Tue, 17 Jun 2025 00:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750120223;
	bh=TWbmvy8/N48JV1V6oHiDedi9/dngQNdTT05AqWVJeaM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dKkUftd45Pckm9Kdkm8gU8nrfVDU7EHMCdTvVa/6/IAMh10mr3ASVSdGCGbBZzHif
	 M7UmdImc+TrPe3atMX3yhe36JRcEaUxlet8/kL6+Fd5qoOAQyvoqTfkYRXoaFbhCjz
	 24FPVlg57hoMtFSo4xBuFT7mJxLtI57ibIgNqgDg=
Date: Mon, 16 Jun 2025 17:30:22 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: =?ISO-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>, <linux-kernel@vger.kernel.org>, Antonio Borneo
 <antonio.borneo@foss.st.com>
Subject: Re: [PATCH RESEND v2] checkpatch: use utf-8 match for spell
 checking
Message-Id: <20250616173022.6a0d4c2cbdd3df8c803c5012@linux-foundation.org>
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

This should have included your signed-off-by.  as you were on the patch
delivery path.  I have made that change to the mm.git copy of this
patch, thanks.

