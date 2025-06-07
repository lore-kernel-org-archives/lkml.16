Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5777935957;
	Sat,  7 Jun 2025 10:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749290870; cv=none; b=DUHRPdFDRKHE+6iAxM4vEVNCFyl7ukCWXH/CgLcWEPJdtqGpogO7ozDe8i63kRf6vI6v/MMlvHjh2nVzD3PhtgKZPBOjzyZPQZ2wC/KyCk2dvoKRtJD5i2ViWICbG4Caq4RtUAAptuejid3MdeLTh97tbErZJT+dx1puLg5rd98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749290870; c=relaxed/simple;
	bh=haf5kAADrHIcnogv67kypOqIN6xAvaU+hGNvRMBxg5s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I5bLZ7YRg9Grb7rXNv89VZm3agovCp2ImcWutVwl5alVokfvEv1DdDPmDvTwwb4ietgHcADl9n/UZKL3Q3nKAOH2ZCkkYD7clgWX0dNxYRhc0+cumvHLtGVxdKtDBU3xBKAifL+3VQ7JPWyBU98/DA1lqOVWxYUcLzcSVICJ+0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hsIaLsEl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hsIaLsEl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 054AEC4CEE4;
	Sat,  7 Jun 2025 10:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749290869;
	bh=haf5kAADrHIcnogv67kypOqIN6xAvaU+hGNvRMBxg5s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hsIaLsEl0ckKTN35ddFCW/qDaiQWGknHUiAxD5ji5BMEGJmBuuxH96PP7u6D8bGiC
	 MlkEGsIEPWNAE0a4qHcLq0N8EthAnv6M+Lr1I5cNLf/EfyiwSz7PRD14DI7A4grZ7v
	 QQwZ9Hww+xDnNPjSW0k7RDLt7nl0pD6cWh1XvsGLCpVky5Kxgel0N+2NNf1oOG8/y4
	 n6JYWZaKLvmz04EZOhEg8z+eVB25ov1VnFgnWsaS0SgL5w/RO1i4aXozgVuSbC1qda
	 8DOm9GdwsXFdna42qq3CK0KJU2qcHNH2lQ7skWAfdpMVdNcYwyfVKpY8OZKNR6c2HO
	 d+DCmzuANdiXQ==
Date: Sat, 7 Jun 2025 12:07:45 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/9] docs: kdoc: remove the
 KernelEntry::is_kernel_comment member
Message-ID: <20250607120745.7e0fee67@foz.lan>
In-Reply-To: <20250606163438.229916-6-corbet@lwn.net>
References: <20250606163438.229916-1-corbet@lwn.net>
	<20250606163438.229916-6-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri,  6 Jun 2025 10:34:34 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> entry::is_kernel_comment never had anything to do with the entry itself; it
> is a bit of local state in one branch of process_name().  It can, in fact,
> be removed entirely; rework the code slightly so that it is no longer
> needed.
> 
> No change in the rendered output.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

Not sure about this one. The idea of those warnings are to detect 
non-kerneldoc markups that typically comes when someone "imports"
OOT drivers or Windows one into Linux.

I remember I catched several such cases in the past with the help
of those warnings.

> ---
>  scripts/lib/kdoc/kdoc_parser.py | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index 3ea260b423e2..56299695abd1 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -1216,7 +1216,6 @@ class KernelDoc:
>  
>          if doc_decl.search(line):
>              self.entry.identifier = doc_decl.group(1)
> -            self.entry.is_kernel_comment = False
>  
>              decl_start = str(doc_com)       # comment block asterisk
>              fn_type = r"(?:\w+\s*\*\s*)?"  # type (for non-functions)
> @@ -1234,14 +1233,20 @@ class KernelDoc:
>              if r.search(line):
>                  self.entry.decl_type = r.group(1)
>                  self.entry.identifier = r.group(2)
> -                self.entry.is_kernel_comment = True
>              #
>              # Look for a function description
>              #
>              elif r2.search(line):
>                  self.entry.identifier = r2.group(1)
>                  self.entry.decl_type = "function"
> -                self.entry.is_kernel_comment = True
> +            #
> +            # We struck out.
> +            #
> +            else:
> +                self.emit_msg(ln,
> +                              f"This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst\n{line}")
> +                self.state = state.NORMAL
> +                return
>  
>              self.entry.identifier = self.entry.identifier.strip(" ")
>  
> @@ -1263,11 +1268,6 @@ class KernelDoc:
>              else:
>                  self.entry.declaration_purpose = ""
>  
> -            if not self.entry.is_kernel_comment:
> -                self.emit_msg(ln,
> -                              f"This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst\n{line}")
> -                self.state = state.NORMAL
> -
>              if not self.entry.declaration_purpose and self.config.wshort_desc:
>                  self.emit_msg(ln,
>                                f"missing initial short description on line:\n{line}")



Thanks,
Mauro
