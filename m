Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081A8175D53;
	Tue, 20 May 2025 05:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747718949; cv=none; b=sOidvqAGhXTODn2aUbjgfcjPN6mOTAE8Erh2CcfDynnz8jCMNBf7URzUoT5oA5uua2rbJobDlyT+/OE9ypyoCt6AUuVCs7De2HyouIUusFjDINZ7YrPC5tAnZ2vKuE8uo1m3zO04xvgwH3Pl5+IeruWGM2twG3aKvppdTBioCfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747718949; c=relaxed/simple;
	bh=ePQ6s4K8dGdIepmFCS7bzEU+DEOE0/3j/G4bEoHY0A0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CDOksPc/htsezRnj88r9gn4DLIn6PfAasbjtrlxRKBkYUmLb27thrjVNPbWhVDUKnNxtCAHGpoRByVa2LSYunU6S8via6kOSAxkc5Sn847hDNsIHsdMxp0cNK2x7Q2A/Z4hP4rJ0t7IwYUj+X3EVOFY4xWSh1J/Qi7ry4m2tgLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hDo/1xiw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hDo/1xiw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36716C4CEEA;
	Tue, 20 May 2025 05:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747718948;
	bh=ePQ6s4K8dGdIepmFCS7bzEU+DEOE0/3j/G4bEoHY0A0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hDo/1xiwCZpplTPQL+q27PN3DsBRG5jJBCklVF3uIm43RVmiT/WKsJ25cfOPPnloJ
	 uRpTjFj/CnFlOGSpZBulFxzVuiag9ar1NKfIbFTOfJPeyKaP/I07sfRXKKtNBwteAO
	 MMydgVs9hwSx/M1pePGVRZaax7zrq9rgIenyXPKPGjK7hbjiuFMBP919E0/J7JzCX6
	 a42ErGa6MPDPDJXeai+ENmkLOMO9q3eJ9x9civn+ZGMyJnNJnmvOaD1FOws7PtjHTH
	 mQE1+FUJDHu1ziaQF2kvJVEj059QLgSG0zdu0zK2TdU6CNj9c8pQ6JEZSpoZfRN12h
	 v2LMoGs0UJobA==
Date: Tue, 20 May 2025 07:29:04 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] Docs: doc-guide: update sphinx.rst Sphinx version
 number
Message-ID: <20250520072904.638da473@foz.lan>
In-Reply-To: <20250519220413.2914890-1-rdunlap@infradead.org>
References: <20250519220413.2914890-1-rdunlap@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 19 May 2025 15:04:13 -0700
Randy Dunlap <rdunlap@infradead.org> escreveu:

> Update the minimum version number to match both
> Documentation/Changes and Documentation/conf.py.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  Documentation/doc-guide/sphinx.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20250516.orig/Documentation/doc-guide/sphinx.rst
> +++ linux-next-20250516/Documentation/doc-guide/sphinx.rst
> @@ -28,7 +28,7 @@ Sphinx Install
>  ==============
>  
>  The ReST markups currently used by the Documentation/ files are meant to be
> -built with ``Sphinx`` version 2.4.4 or higher.
> +built with ``Sphinx`` version 3.4.3 or higher.
>  
>  There's a script that checks for the Sphinx requirements. Please see
>  :ref:`sphinx-pre-install` for further details.



Thanks,
Mauro
