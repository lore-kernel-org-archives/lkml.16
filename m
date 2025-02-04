Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3963175A5
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 17:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738688906; cv=none; b=NkGRZ7mSZRYNK2PlQRRGzQvAgyWbhCUbkCCA4mX8u+TVUwuEfEc1whu7Q4akHUwfFEj5xdvH2GaWtzBVS2Wv5s/6qOyX4aF0KZ/MoWh7vt5nb+mpADpcdQ8nzSuh8fZ/Eo+G78yiUi2G/eFM0c/Bi/HF4uAfPRmurAxCiZe3KMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738688906; c=relaxed/simple;
	bh=kPEdAkqfEtILVbQy9cYRT6jCNsyqIfVNpLNvZ49iyHA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Vz2cIqvaY5VQFw11DrJjTx8Or6Rcoo/v/ViPj5ZCnxsQRueXjPRBTnG2E1gr/zn9uUZdfaTEeCWn+laBt0GrX40XTwE9xBHmnkgC67eE+nlbN9P0CQu73elkf6dASGQnrR1gBbIzHR/qj9cD7P5VkAknCsqRpq92VJv18r7YQO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Xn6wftdr; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Xn6wftdr"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DB954404FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1738688904; bh=dS9LD6uMF6EmxVoTy+DVdHxg7AkSXngTPuQK/JEtzGU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Xn6wftdrYF5gAxEpvjboAPIQhZDWc32+aNN2Hlaqfiuh7oQcBYJSQLi0JqmBA2hLy
	 oOhsJWeDj47NDIyxd3enx62wfMKRLIRpB23qSLOXle6Z8Eu6RZRA8Q4EmVi1fjzpdp
	 7SI2+g49/UYl06azM7UeCfndU3+gZlGFKowQOD0rkjyX49a3ajgozxuDahOOBuGWmw
	 UbK5oPUST8xUQTWRbrLKgewsyi4/L1DKSlzUy/ewl4VjHrVlcJ+5dZRucDfqQ/IVUV
	 lo7Ybedpe8LM48chmaOEQ+CFyzv2i0YlkCNklLK9DeXKB9cL9uC2idl8uu9sjpNRg/
	 Na89uWiTLj4Ag==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id DB954404FA;
	Tue,  4 Feb 2025 17:08:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Diego Viola <diego.viola@gmail.com>
Cc: linux-kernel@vger.kernel.org, Diego Viola <diego.viola@gmail.com>
Subject: Re: [PATCH TRIVIAL] docs: admin-guide: rename GTK+ to GTK
In-Reply-To: <20250204040444.6299-1-diego.viola@gmail.com>
References: <20250204040444.6299-1-diego.viola@gmail.com>
Date: Tue, 04 Feb 2025 10:08:22 -0700
Message-ID: <87cyfxfxix.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Diego Viola <diego.viola@gmail.com> writes:

> Upstream calls it "GTK" now, see [1]
>
> [1] https://mail.gnome.org/archives/gtk-devel-list/2019-February/msg00000.html
>
> Signed-off-by: Diego Viola <diego.viola@gmail.com>
> ---
>  Documentation/admin-guide/README.rst                    | 2 +-
>  Documentation/translations/zh_CN/admin-guide/README.rst | 2 +-
>  Documentation/translations/zh_TW/admin-guide/README.rst | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

jon
