Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2BC84D08;
	Thu,  3 Apr 2025 13:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743685896; cv=none; b=OflJo61tuPPlJiG2d0GRZyIAplpZWiYxvQ+wlqMu/RfIS/GoF5JuWEarlCQDLHiqAup9deeobbNQQ/JmjODUw8B0KGSd5VCx5sUC+nMlXgosWi8UHgYxE5K3FXymhNKTc9FYf9+rfuMJIIhvGQDtB2JFDirSOw71CkGavIXaDpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743685896; c=relaxed/simple;
	bh=qxnQ0LulWP0SVj9Fth/u0iX/1SsSVlZ9C5SosKSK+G8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQklLh8d7aioaF2luPA6eYF70KUqyUYCdb4WFxWWo84+hU/BEwn6gg6a64VMMwWn9D8Zr9J4Csj/ZiYOl1Ii/r/8lQl0wTU+YLdI00qj8IZGrxhdvNo3py1VvS3Hd52bfIINTTNhHiH8/xHJPXYbwp7Bh8OFHiVGrERZS0OJq5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u87+5Uja; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u87+5Uja"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AFEDC4CEE3;
	Thu,  3 Apr 2025 13:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743685896;
	bh=qxnQ0LulWP0SVj9Fth/u0iX/1SsSVlZ9C5SosKSK+G8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u87+5Uja49TKQb43f4anXjrIbR7c1IVy+6vuhYvG4jmeQhAqbvpiUa3GRmz6h8jT4
	 q6geELXKi4szMwPoUzE+PZEpoTGlePNtkqlsLm/v+pHON63VD98Ba6DuDPjl+hDwzp
	 vEsMPdwbYAoutk/3w9cOClehWYyWnDAfdj/dTwmtFyNMFuxKhg/AvrONlVowkVvOal
	 oV3JqhVZYapfBeyWiUozDCjvVC7Yzpymx5VdQoi3sVSneYGeKKsOh6ViiPiNk1iHOs
	 l8f1L/xqJbvTFhuI7NU6X48Uw7FrpRZ4UVswqhND9LrQmy4QWmL6YQNLUSPMHsL7LA
	 rqACqwdvv7CmA==
Date: Thu, 3 Apr 2025 18:40:00 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, x86@kernel.org
Subject: Re: [PATCH] Documentation/x86: Clarify naming of CPU features for
 /proc/cpuinfo
Message-ID: <4uxkf5riuv66kdxa7zteubdfsjy4vac6td5z6cckilyiqjceft@zk3mzmfv3lgk>
References: <20250403094308.2297617-1-naveen@kernel.org>
 <20250403121727.GFZ-58VzYwaTBv4rbu@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403121727.GFZ-58VzYwaTBv4rbu@fat_crate.local>

On Thu, Apr 03, 2025 at 02:17:27PM +0200, Borislav Petkov wrote:
> On Thu, Apr 03, 2025 at 03:13:08PM +0530, Naveen N Rao (AMD) wrote:
> > Commit 78ce84b9e0a5 ("x86/cpufeatures: Flip the /proc/cpuinfo appearance
> > logic") changed how CPU feature names should be specified. Update
> > document to reflect the same.
> > 
> > Signed-off-by: Naveen N Rao (AMD) <naveen@kernel.org>
> > ---
> >  Documentation/arch/x86/cpuinfo.rst | 42 +++++++++---------------------
> >  1 file changed, 13 insertions(+), 29 deletions(-)
> > 
> > diff --git a/Documentation/arch/x86/cpuinfo.rst b/Documentation/arch/x86/cpuinfo.rst
> > index 6ef426a52cdc..fecdc36e02a1 100644
> > --- a/Documentation/arch/x86/cpuinfo.rst
> > +++ b/Documentation/arch/x86/cpuinfo.rst
> > @@ -124,37 +124,21 @@ also defined in cpufeatures.h.
> >  Naming of Flags
> >  ===============
> >  
> > -The script arch/x86/kernel/cpu/mkcapflags.sh processes the
> > -#define X86_FEATURE_<name> from cpufeatures.h and generates the
> > -x86_cap/bug_flags[] arrays in kernel/cpu/capflags.c. The names in the
> 
> This is not the patch I saw in internal review. The script still processes
> cpufeatures.h

As far as I can tell, the script still processes cpufeatures.h but no 
longer "generates" names. It simply picks names within double-quotes if 
present. I don't think that is relevant for describing how the flags are 
named anymore.

> 
> Please go through all the text you're changing and verify you're *actually*
> doing the right thing.

I guess you missed that part of my response where I explicitly mentioned 
that I have dropped the part describing the script for the above reason, 
and also pasted how the section looks like.

Regardless, please take another look at this and let me know if you 
think this still doesn't read right, or is missing anything (the script 
part, in particular). For reference, here is how the flag naming section 
looks like with this patch:

---
Naming of Flags
===============

If the comment on the line for the #define X86_FEATURE_* starts with a
double-quote character (""), the string inside the double-quote characters will
be the name of the flag. For example, the flag "sse4_1" comes from the comment
"sse4_1" following the X86_FEATURE_XMM4_1 definition. /proc/cpuinfo is a
userspace interface and must remain constant. If, for some reason, the naming
of X86_FEATURE_<name> changes, one shall retain the name already used in
/proc/cpuinfo.

If the comment on the line does not start with a double-quote character, then
it will be omitted from /proc/cpuinfo. This is desirable if it does not make
sense for the feature to be exposed to userspace. For example,
X86_FEATURE_ALWAYS is defined in cpufeatures.h but that flag is an internal
kernel feature used in the alternative runtime patching functionality. So, no
name is specified within double-quotes and its flag will not appear in
/proc/cpuinfo.




Thanks,
Naveen

