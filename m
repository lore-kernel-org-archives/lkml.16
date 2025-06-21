Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574CC211F;
	Sat, 21 Jun 2025 20:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750536582; cv=none; b=kMv8i10Z9uUB1EOHdbSh2gd9NG2nB+5kwvPXHdQYRrEBny+M6Sy0STsjmNEtslm67dLv31AEN2qJ2IluBn7UPtXSoOLudVTULML0Y2jgvqT6m4rAuhNHjcHH+XwwXfvKDKZ8eRRxWF9oM/RzK/3ySPiNNIqV6hAU8sC2WekhVhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750536582; c=relaxed/simple;
	bh=w4yowu9zzr+LJhRNeFPJPgT/vAKRsCYSclbam2pkTRo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GynMTJRhrnNJpf7EnUA2DpLeyPvTNHOU+iDMpjPVM85JAqu0PKkKUgPzUSqDyDqZxf++5So6+KvfzV3VxotzzKBz0hYTw+lEvjgJZgum2ilkW+jPSkY973egLf17p6DHyFtrCGBQibdyne14ttbh7Z3zvMDBFnOlZeaXyfJt+IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Ybr3Pjfe; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Ybr3Pjfe"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 21BF041AD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750536580; bh=6t5GPqVffL7lfITOMm7YgQRkusLOF7GE4Yha/f/xoG8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ybr3Pjfeya/Y/En/R0WBvvDTO6QfEkihefYYmj0NrjWmyHjgc6bon8PunST5xoHDk
	 AbasWgr/s9MYjhUwTIrnnoG5+pZHJfiTUfrCWb7DtmdGX79iZmJJERkR5l3qG74cJZ
	 PEACdU+OlUeJtErmKB9+6xkK9Il2uafoHYGYMOXcSnuZtgr8nsIk9tE+AxbjXrPRYY
	 IU5Oxe6SqPWUfDpnGocKGTLhCXL6qazNYBVfSxVsS+2pgbHp3KzVuJ5/I+WG0WrMQI
	 +2/PuiZjw/Z7toNpv77J594HaYaSVKFGaOQ/dfwVkdQ5xV5DPBc6+IazPvbggYCilV
	 n3tS30chB4Q0Q==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 21BF041AD8;
	Sat, 21 Jun 2025 20:09:40 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH v2 00/15] Some improvements and fixes for the doc build
 system
In-Reply-To: <cover.1750535171.git.mchehab+huawei@kernel.org>
References: <cover.1750535171.git.mchehab+huawei@kernel.org>
Date: Sat, 21 Jun 2025 14:09:39 -0600
Message-ID: <87frfsdfgc.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> This series contain patches I made while working at the parser-yaml.
> They aren't directly related to it. Instead, they address some issues
> at the build system and provide test tools for building docs.

So as you saw I'd applied the previous set - but I've undone that.
Something in the first patch (the conf.py changes) breaks the dependency
detection so that every build turns into a full build.  Just run
"make htmldocs" twice in a row to see what happens.  That somehow needs
to be fixed...

(this is with Sphinx 8.1.3)

Thanks,

jon
