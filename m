Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5185F3C0C;
	Sun, 22 Jun 2025 17:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750614803; cv=none; b=Of6g7V07stJDCpTp+PYFCcC2fuSBTtpL5l1O1to90h+m2IZucRuN81RSCi3wkoe3lD2QWc1ww4ziRawMAB1hl9TbIAprNvcLRgzMMhcrGVODztuvNkgbkkiGcf9QwfCJzZ35x+iTuQM0Avv6akIiM/tzhCqICntE/h/NDQjJBuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750614803; c=relaxed/simple;
	bh=NEqfhCbHA77ivX87O3SQQe/0s1ft+C0ZxROAW6GszLY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=igxQ2e8KoW1ERcwvdpgCh38XPr2qh7Y0In+DvwGSuCT9/JQWGvGlU7C7F42aPPFPWmBqYZ8Iy6jysADIoOGCQRov/pqKymPUqzltN50pgxbKkIPM7OFTv+UvIH8RlvlCi44R3u8eEQuqkj8Nr5oz4plZRmjRlFA6kGWmHtUgiBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WdJEUMFk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WdJEUMFk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B24A8C4CEE3;
	Sun, 22 Jun 2025 17:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750614802;
	bh=NEqfhCbHA77ivX87O3SQQe/0s1ft+C0ZxROAW6GszLY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WdJEUMFklOf00eIO/dcuyUvKFnZ0Yy5VMv77/X9JmcKeUytRx+bstS9oF+YEyHjVQ
	 fYVgcU0hv3p4xWR3Ep1AXe+xKyy2bSfRA3kGai0e1VKq/9+4bLaXDcCOuKmAe8fO6v
	 AFtn64KoShaDBh+IO7wAQdb0y9HHTxKUKnXPnM5w0NUzLT2VJuWpYwibE+LZdOG7a7
	 JKsO/mkWgZ8CBlDyHadALLqnTGt7JtlUhZ+isPxtlIhljme5DhJTVw4v1q5btRAqL/
	 PidMbBhZtY/6omI7mVSnujCm2z+4NmnS0//tad8clvkKpI2awX1ZwIfU/Y0Npkk7Pj
	 cbH3ydvDo0oOw==
Date: Sun, 22 Jun 2025 19:53:18 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, Linux
 Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 15/15] docs: conf.py: Check Sphinx and docutils
 version
Message-ID: <20250622195318.1a2a3728@foz.lan>
In-Reply-To: <c05dd5dc-1e30-4a2c-80dc-70e8b62cc681@gmail.com>
References: <cover.1750571906.git.mchehab+huawei@kernel.org>
	<972673b0a5bf5537d47780d6f8e70ae45456e751.1750571906.git.mchehab+huawei@kernel.org>
	<c05dd5dc-1e30-4a2c-80dc-70e8b62cc681@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Akira,

Em Sun, 22 Jun 2025 20:19:52 +0900
Akira Yokosawa <akiyks@gmail.com> escreveu:

> On Sun, 22 Jun 2025 08:02:44 +0200, Mauro Carvalho Chehab wrote:
> > As reported by Akira, there were incompatibility issues with
> > Sphinx and docutils with docutils 0.19. There's already
> > a fix for it, but, as there are incompatibility issues with
> > different versions, better to add a check to verify if the
> > combination is supported/tested.
> >   
> 
> I've been skeptical of adding such checks in conf.py.
> 
> What happened the other day was that Jon used a deprecated (and rarely
> used) method of docutils which failed to work properly only in
> docutils 0.19 (there is no mention of related issues in its and 
> nearby release notes).

True, but the same also happened with me at the parser_yaml code.

> 
> Your integration of parser_yaml extension will raise the minimum
> version of docutils to 0.17.1. 
>
> I think all you will need is just
> to check:
> 
>     docutils < 0.17.1
> , and to make a warning regardless of Sphinx versions.

That's not the best solution. 

See, Docutils 0.17 was released in Jun, 2021. and 0.17.1 on
October, 2021. If we look at the Sphinx releases, we have:

======  ===================
Sphinx  Release Date
------  -------------------
4.1.0	June 10, 2021
4.1.1	July 25, 2021
4.1.2	August 1, 2021
4.1.3	August 15, 2021
4.2.0	September 28, 2021
======  ===================

As Sphinx policy is to not even fix bugs when a new release
happens, it means that, at the best, the minimal version made to be
compatible with 0.17 is 4.1.x, and the minimal compatible with
0.17.1 is 4.2.x.

So, if we want not to raise the minimal version to 4.2.x (*), the right 
fix is this (I'll be sending at the upcoming YAML patch series I'll be
sending next week):

diff --git a/Documentation/sphinx/parser_yaml.py b/Documentation/sphinx/parser_yaml.py
index 8288e2ff7c7c..1602b31f448e 100755
--- a/Documentation/sphinx/parser_yaml.py
+++ b/Documentation/sphinx/parser_yaml.py
@@ -77,6 +77,10 @@ class YamlParser(Parser):
 
                 result.append(line, document.current_source, lineoffset)
 
+            # Fix backward compatibility with docutils < 0.17.1
+            if "tab_width" not in vars(document.settings):
+                document.settings.tab_width = 8
+
             rst_parser = RSTParser()
             rst_parser.parse('\n'.join(result), document)

What happens is that Sphinx is a shell case built on the top of
docutils: the actual ReST parser is inside docutils. 

(*) the exact patch where 0.17.1 support was added/tested on
    Sphinx needs to be checked

Now, there is another alternative: raise the bar, increasing minimal
versions for Python and Sphinx. Yet, I would do it only once per year.

> That said, these dependencies should be recognized and taken care of by
> pip/PyPI (or whatever distro package management system), and already met;
> unless you have done something strange/dangerous and screwed up your Sphinx
> installation.
>
> My limited imagination prevents me from coming up with any plausible
> scenario where these checks at every sphinx-build invocation can be helpful.
> 

Heh, playing with scripts/test_doc_build.py, pip allowed to create
several environments that are valid for the package management software
but either:

- cause sphinx-build to crash even before returning Sphinx version;
- crash in the middle of the compilation.

As I said, Sphinx is a shell on the top of docutils. Some of the code
there seem to depend on subtile behaviors, like the one with
the tab_width affecting parser_yaml.py on certain Sphinx/docutils
combinations or the one fixed by Jon with regards to setup a class
for the broken references.

The idea of this patch is to warn the one building the docs
that he might be navigating turbulent waters when it is unknown
if the combination is supported. It also better defines the
scope of backward compatibility we want to provide.

Thanks,
Mauro
