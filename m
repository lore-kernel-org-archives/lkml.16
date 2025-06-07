Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB291FF5F9;
	Sat,  7 Jun 2025 10:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749290593; cv=none; b=hGAa8sfSbuex6NXbGQjGhJqZmzqi0An/Bp/eLTmQK9trsC6EzsXaJgV9aAh3v5inb+W9TQAiYBayghVqoyYSKPfvW/x/8aLgH1RcItLgmJNSy0/EXnPUppzJujUJzxCTcxyyUVpHMXYIQ6MxTsNWCKaS/BlmgdJvKrqyMYKnIAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749290593; c=relaxed/simple;
	bh=TjqtwdGdxzNWfLUDz+pZIG+8/P6ay02SYV7Z2iY07TY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rlz3eKSzlttVGsDp6QvZ3+kT2lJXd4bTPOtCaRQJtcB9BRvtASs5E2vfeK59UVWuWNW/zrdxgQ/T1+qRw/7rovpEgeeomr3rGlnK8wautm6RnzE+x5g4MXL57gS5YgRMInvzilyytte4CX8OsODzrqL1N99RdtMyzJtYwKO/mto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PtAOfB6d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PtAOfB6d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 275D4C4CEE4;
	Sat,  7 Jun 2025 10:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749290593;
	bh=TjqtwdGdxzNWfLUDz+pZIG+8/P6ay02SYV7Z2iY07TY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PtAOfB6dedxEw5rmAdnBZsaE2H+2mXD7p6a5NdZPiKm1zGxoPbn9fzfuHfdFugCQo
	 I6YuGJIr2/j/XpISnnlW6caGu7i2/nO4gPHn8i8bwiFvautOKqHoiXGT09KQDUMz7C
	 nCAX+y0Ou9d9kbdQL3iGmXm658vspkd+VmJrmrNLQiGUps/dVCTi3fuAEdDan7NDi3
	 nXjd7WhlO0HySDrU03YdMMqaiG4GQwhEfJNE5Ge5X/AxM89FoI5WDRDjz06t8qBsud
	 +SxyVEAsa9x9pFLSndUiLXVWzI5UjeuupI0r4+/b48DzoV7fbMHdGG3XMOuUqESUUR
	 tCcIga0pjVFzg==
Date: Sat, 7 Jun 2025 12:03:08 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] docs: kdoc: remove the section_intro variable
Message-ID: <20250607120308.21d03438@foz.lan>
In-Reply-To: <20250606163438.229916-4-corbet@lwn.net>
References: <20250606163438.229916-1-corbet@lwn.net>
	<20250606163438.229916-4-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri,  6 Jun 2025 10:34:32 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> It is only used in one place, so just put the constant string
> "Introduction" there so people don't have to go looking for it.

Good catch! There were other places using it, but it sounds I
already cleanup its redundancy.

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  scripts/lib/kdoc/kdoc_parser.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index 37b7e501af7c..90b53b70cfee 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -203,7 +203,6 @@ class KernelDoc:
>  
>      # Section names
>  
> -    section_intro = "Introduction"
>      section_context = "Context"
>      section_return = "Return"
>  
> @@ -1207,7 +1206,7 @@ class KernelDoc:
>              self.entry.new_start_line = ln
>  
>              if not doc_block.group(1):
> -                self.entry.section = self.section_intro
> +                self.entry.section = "Introduction"
>              else:
>                  self.entry.section = doc_block.group(1)
>  



Thanks,
Mauro
