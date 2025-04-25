Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA7422D780;
	Fri, 25 Apr 2025 07:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745566173; cv=none; b=RrYJxiHNptzNWSMEPsGmfoDWEQrKO/cHBL70LwTbpFks+TOkuB6ZfXrZOd1CSIU03XNJneX5rfuanv9Zx03r+MXT/42XTmDuUXCkys88+g0kBfPw3+BVqJdd0gBqtEdLqgmr5Ld3wAE/DS9sGEJhMDgKPMghQzuSLken118+hUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745566173; c=relaxed/simple;
	bh=IFsKc6AsjWYU/HKywRcQ5iDgHnBqlZkmDwblxd4kymA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HZLZzh9//cIwH/5HcRAMI+MQM17n6akcdMEWtmFiA2cjKpivd4ru3MjCA5d0OTMOr+0WuycoYk50W/wpMcnyVs6UxC5IEW80dkNWEM9phNoCZ+d2b8OJoNp2PYovSO5n/+kVwO0I9A0nNutcufjtWs9XcokzPhWKbJdpB0lxjtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdlRhfSs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdlRhfSs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD98C4CEEB;
	Fri, 25 Apr 2025 07:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745566172;
	bh=IFsKc6AsjWYU/HKywRcQ5iDgHnBqlZkmDwblxd4kymA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MdlRhfSs1xbQ3HA2m84OQKpiG6kmutuL+3GB7mNAopVsU8Ao2DhK1NJyXKHWltd7v
	 RVptY2F5UoCgE1Wz6Fz0EhemaSR7zfYw/cj6sSj6+24S6K3Rip5R0tU5cCtGonwEZj
	 mk9X7ysyJYkI+QTj6grXZtfQ5TJupx3B+TnjjEhJcy6zlxl4OWmPkDpvzbKTL0vbDy
	 jhQTZAEa9S9XwOebUf2enAPLWeS6rn/ENaaBcc1Sv6GZzhwAfaYmwgC+92rQDgORiy
	 j/124aVBPU0rxSL5WggblVdlNffVfl0RF1JqjD5mbghaJnZxsg3Jq9v4R1pm/CvnjI
	 RHjneAXboS3og==
Date: Fri, 25 Apr 2025 15:29:23 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Kees Cook
 <kees@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] docs: Sphinx: kerneldoc: only initialize kernel-doc
 classes once
Message-ID: <20250425152923.760e22e6@sal.lan>
In-Reply-To: <b00788f26e161512858a6e01a673c34743c954df.1745564565.git.mchehab+huawei@kernel.org>
References: <cover.1745564565.git.mchehab+huawei@kernel.org>
	<b00788f26e161512858a6e01a673c34743c954df.1745564565.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Jon,

Em Fri, 25 Apr 2025 15:13:38 +0800
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Instead of re-creating the objects every time, initialize it
> just once.
> 
> This allows caching previously parsed objects.

Please notice that I opted to send you this one as you mentioned that
performance decrease when using classes.

While this patch is simple, it does improve performance and on my tests 
it is working fine, it has a potential of causing troubles. So, maybe
it could be wise to keep this on tests for a while - eventually 
postponing this one to be applied after the merge window.

Patches 2 and 3 on this series should be OK to be merged, as they
are mainly cleanups.

> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/sphinx/kerneldoc.py | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
> index 27baf28fb754..b713a2c4a615 100644
> --- a/Documentation/sphinx/kerneldoc.py
> +++ b/Documentation/sphinx/kerneldoc.py
> @@ -48,7 +48,8 @@ from kdoc_files import KernelFiles
>  from kdoc_output import RestFormat
>  
>  __version__  = '1.0'
> -use_kfiles = False
> +kfiles = None
> +logger = logging.getLogger('kerneldoc')
>  
>  def cmd_str(cmd):
>      """
> @@ -86,7 +87,6 @@ class KernelDocDirective(Directive):
>          'functions': directives.unchanged,
>      }
>      has_content = False
> -    logger = logging.getLogger('kerneldoc')
>      verbose = 0
>  
>      parse_args = {}
> @@ -204,7 +204,7 @@ class KernelDocDirective(Directive):
>          node = nodes.section()
>  
>          try:
> -            self.logger.verbose("calling kernel-doc '%s'" % (" ".join(cmd)))
> +            logger.verbose("calling kernel-doc '%s'" % (" ".join(cmd)))
>  
>              p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
>              out, err = p.communicate()
> @@ -214,14 +214,14 @@ class KernelDocDirective(Directive):
>              if p.returncode != 0:
>                  sys.stderr.write(err)
>  
> -                self.logger.warning("kernel-doc '%s' failed with return code %d"
> +                logger.warning("kernel-doc '%s' failed with return code %d"
>                                      % (" ".join(cmd), p.returncode))
>                  return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
>              elif env.config.kerneldoc_verbosity > 0:
>                  sys.stderr.write(err)
>  
>          except Exception as e:  # pylint: disable=W0703
> -            self.logger.warning("kernel-doc '%s' processing failed with: %s" %
> +            logger.warning("kernel-doc '%s' processing failed with: %s" %
>                                  (" ".join(cmd), str(e)))
>              return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
>  
> @@ -261,7 +261,7 @@ class KernelDocDirective(Directive):
>              self.do_parse(result, node)
>  
>          except Exception as e:  # pylint: disable=W0703
> -            self.logger.warning("kernel-doc '%s' processing failed with: %s" %
> +            logger.warning("kernel-doc '%s' processing failed with: %s" %
>                                  (cmd_str(cmd), str(e)))
>              return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
>  
> @@ -292,11 +292,9 @@ class KernelDocDirective(Directive):
>          return node.children
>  
>      def run(self):
> -        global use_kfiles
> +        global kfiles
>  
> -        if use_kfiles:
> -            out_style = RestFormat()
> -            kfiles = KernelFiles(out_style=out_style, logger=self.logger)
> +        if kfiles:
>              return self.run_kdoc(kfiles)
>          else:
>              return self.run_cmd()
> @@ -306,13 +304,14 @@ class KernelDocDirective(Directive):
>              self.state.nested_parse(result, 0, node, match_titles=1)
>  
>  def setup_kfiles(app):
> -    global use_kfiles
> +    global kfiles
>  
>      kerneldoc_bin = app.env.config.kerneldoc_bin
>  
>      if kerneldoc_bin and kerneldoc_bin.endswith("kernel-doc.py"):
>          print("Using Python kernel-doc")
> -        use_kfiles = True
> +        out_style = RestFormat()
> +        kfiles = KernelFiles(out_style=out_style, logger=logger)
>      else:
>          print(f"Using {kerneldoc_bin}")
>  
