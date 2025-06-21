Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B162211F;
	Sat, 21 Jun 2025 20:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750536805; cv=none; b=D9eN2UknnXp8yOaURBqFq2m/kzqvRJxrP36gPDzxGRLYNSMU83EbyVEK7utbhRwguw/2eFSNMmUpBR0do3zTr9AolLDi19J9xpB6mWWms1qWMXl/9pcwqsHHZKXnug+hgo/aflwBMr4rSFB0pk5MNsY1Av97oHU5Iy5r7KjYxEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750536805; c=relaxed/simple;
	bh=zw6sD9/U5dbKdg61ApjuxHwzeBYGPVOC2AoZmUDvZK4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LkOybx6YUVHxUX4FqF7kjowhVnkwZM2/FcGchbdz5t5g83kjD//msK1pEuMGosoZvJoDk1jb0J7520Rbvks22WDbHp54S1S4Ked3+VnqcrkauZ0RZkynLzRzg2/ClICOqyKuHdQdGCGM3EuzK9scw1Uv3LmFlg9XAw+v2R2uDvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=C41qFVps; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="C41qFVps"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7985C41AD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750536803; bh=JYGbOWijyFWRJxaIoRd32kLM2iySzUulbp7KNqKGivQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=C41qFVps6fdrD/DQ7wxtFNzsFwHbI7pL0ZrQC9M1TPDQn8Nar6PtBw6SWQbN3d7+O
	 8noqSyPM+a1lD18j3NQtulFQQ2IRMpjICJ+52QpoEfqP8I8nib3D8c0q9e6bzRQh9w
	 hiWIkDiS6DwPvN9W9KUS1LpzbDBZ9iK2rGAgL+4j/osh+5ixQwMxk8oK8NnRV8O+YT
	 DydAUy5+q7vD8wAlGU5PXTN+ZSxum17rT8Pg2CypAwXgX3gcxor4Kq6ZywWBE8buPO
	 bFqUC27Vv+NojzzZkS9MsYodfnFEsr9wxUkBrQP5BlbK9F05NtGQWuy3V9OK/8eXE7
	 +Z0VcolsdDdVQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7985C41AD8;
	Sat, 21 Jun 2025 20:13:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Yuanye Ma <yuanye.ma20@gmail.com>, jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Yuanye Ma
 <yuanye.ma20@gmail.com>
Subject: Re: [PATCH] docs: f2fs: fix typos in f2fs.rst
In-Reply-To: <20250618225546.104949-1-yuanye.ma20@gmail.com>
References: <20250618225546.104949-1-yuanye.ma20@gmail.com>
Date: Sat, 21 Jun 2025 14:13:22 -0600
Message-ID: <877c14dfa5.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Yuanye Ma <yuanye.ma20@gmail.com> writes:

> This patch fixes two minor typos in Documentation/filesystems/f2fs.rst:
>
> - "ramdom" =E2=86=92 "random"
> - "reenable" =E2=86=92 "re-enable"
>
> The changes improve spelling and consistency in the documentation.
>
> These issues were identified using the 'codespell' tool with the
> following command:
>
>   $ find Documentation/ -path Documentation/translations -prune -o \
>     -name '*.rst' -print | xargs codespell
>
> Signed-off-by: Yuanye Ma <yuanye.ma20@gmail.com>
> ---
>  Documentation/filesystems/f2fs.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

jon
