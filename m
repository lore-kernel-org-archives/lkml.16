Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960C9376;
	Sun, 22 Jun 2025 05:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750571293; cv=none; b=UnOIWuoZ/+DNwjNSI4PFR7a+EVZqHHkqdQY5tVvmf/jeUaIGSyi8QDKV2NYY6EghAsw9nXvjhx60RFFE45tIXpf4o7bndrhd4vXAL9JJesQyWaCxcSFcuVFgknGMj0Ay4KXqxm/EMrMswsruOzuOgZWG+1jclM2Uzjx0G6tQmT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750571293; c=relaxed/simple;
	bh=a69uwtI66wsiieA3J3wYEWpnqi5UTVCHTSPGW2T4h7c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Orq6DLsTHpKeVOdtquJaOjnjRruBkV1fssBERt2U+kfyXy2rGzfKm+QWfw66NB/iBfC8tgTDCAIpgkPsdLNhSW8m6WT4p1Lpfg3bAlgFzcx9Yk7SV+5KPFp+GKMR7jQFiMjWeIfN7WB4L4B6gxeTyFeFeOYBpqArKLoVM4lOsnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmk17hs6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmk17hs6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08459C4CEE3;
	Sun, 22 Jun 2025 05:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750571293;
	bh=a69uwtI66wsiieA3J3wYEWpnqi5UTVCHTSPGW2T4h7c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gmk17hs6EFc7VLdcxnGWZ96itzl1DNtTyTvZESPe05eoTR96D5ZsPOzrueszBCfdz
	 AV3fEaij27z+N65C1CLU819qH/jRiK9Zkrb+q22/GZ9uwYXktyDayAzEgV2ZUqsTT7
	 Pg7Olnw050hmD6LYp1KnHYdgVBcfNPY5oxmA/QQKqDKsz/lTHHt013d/ym7p2CNpwn
	 MF4vsFAnR+t3/ZH0u+Z8UVjp7E2vK70jeRddyndwSqT/Rif5YlCX7gg139BFsaHySI
	 KHvSfgSVp3Hpt2WgizVvdBaFgJ8b+6pB6amh6ri2926IBEHx3v8bfUMdwisN4x1arT
	 Q6T+kBlD7j4eA==
Date: Sun, 22 Jun 2025 07:48:09 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH v2 00/15] Some improvements and fixes for the doc build
 system
Message-ID: <20250622074809.09fca392@foz.lan>
In-Reply-To: <87frfsdfgc.fsf@trenco.lwn.net>
References: <cover.1750535171.git.mchehab+huawei@kernel.org>
	<87frfsdfgc.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 21 Jun 2025 14:09:39 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > Hi Jon,
> >
> > This series contain patches I made while working at the parser-yaml.
> > They aren't directly related to it. Instead, they address some issues
> > at the build system and provide test tools for building docs.  
> 
> So as you saw I'd applied the previous set - but I've undone that.
> Something in the first patch (the conf.py changes) breaks the dependency
> detection so that every build turns into a full build.  Just run
> "make htmldocs" twice in a row to see what happens.  That somehow needs
> to be fixed...

Tricky. When I originally wrote it, on the top of 8.x, there is no need
to add a connect event. For older versions, this is a need.

I ended adding a 'builder-inited', but this is too late. Changing the
event to 'config-inited' address it.

I'll fold the patch below at patch 01/15.

Regards,
Mauro

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 4ba4ee45e599..91ce2b1c33cc 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -41,7 +41,7 @@ dyn_exclude_patterns = ['output']
 # Properly handle include/exclude patterns
 # ----------------------------------------
 
-def update_patterns(app):
+def update_patterns(app, config):
 
     """
     On Sphinx, all directories are relative to what it is passed as
@@ -65,7 +65,7 @@ def update_patterns(app):
             if rel_path.startswith("../"):
                 continue
 
-            app.config.include_patterns.append(rel_path)
+            config.include_patterns.append(rel_path)
 
     # setup exclude_patterns dynamically
     for p in dyn_exclude_patterns:
@@ -75,7 +75,7 @@ def update_patterns(app):
         if rel_path.startswith("../"):
             continue
 
-        app.config.exclude_patterns.append(rel_path)
+        config.exclude_patterns.append(rel_path)
 
 # helper
 # ------
@@ -574,4 +574,4 @@ kerneldoc_srctree = '..'
 loadConfig(globals())
 
 def setup(app):
-	app.connect('builder-inited', update_patterns)
+    app.connect('config-inited', update_patterns)


Thanks,
Mauro
