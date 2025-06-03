Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0D6C2F2
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 11:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748950829; cv=none; b=K9KMy3/xI0IGckYAHzR3xAymFySAoqTNDuMZ2d2UR1ow3anPuViT8twsSX5A++PWoDaWsuNyOGJzmFUS2DsEKzVRmkZ1eAswYA43cvQlvWLo8mzltLowHBJnWC4tcVmjDXVFSEnxm8XtRlpP5F3fEni9hwV3qFVmtBNTNkWrpGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748950829; c=relaxed/simple;
	bh=lInIOnu02nSuzGUxFDI/H3CZR9jABCLpyMlUX8cRz+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eMg0rN++heB+kjoDGubyfFCt6Sh0xCqVpj5Iwn8msDRDFgAa0skwl2NGShMRxm0jIPHsF/aSPFYU05If6rzNWx1MCcW8X68USuUAdZ4rZeq1mJTXSs522a+rnASEYgDF7fA5rpOiJeBdQ0bhqEtjZ0DtM1JFawZG+42RUKsVDnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=fk4Hkbj9; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="fk4Hkbj9"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad8a6c202ffso1064745766b.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 04:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1748950826; x=1749555626; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ciIAygqOrWJd3fbCLXBzNH0Xz2cW+3EmmUs8ebciGxE=;
        b=fk4Hkbj9n00ubbVnLOmPj+7o9mUV/gPPBlCHcICoDB9H4Y1+DY1IugMP174BW3oNnj
         Kn+XufF+VkTBqIq5OOoCY2RqV2aua4IEWSdHUGfJORbY2LuU11fL1bQ2eLujVHELrasq
         vImVT7S/1FZw4mfQ6RqUqHRE7KOTFW0C0PgLs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748950826; x=1749555626;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ciIAygqOrWJd3fbCLXBzNH0Xz2cW+3EmmUs8ebciGxE=;
        b=qy9n3lji7q8iXU9QQq18eNbi2YcgmFpEpNuckYFzfmDKLSnVSkJrWeS4vlBVw1Nc5x
         Vl9Hrw0k8b/1yOi3QK/rPS2tB8Lljg+YFOKOjdD0Y0AWGdS3Na4gaTeqBBg5DLRAiGbp
         hHd8IM8a9xxX/0L04X3j2d339rwx4r5loCkg1rtmu1sr1aCgM4gSIzfoXfpT+a2/gTnH
         ovAbBbg/iS/9YicpbvDkCIkZByjLaUAH2P2EAs1/s803S4rWsO0AAJiC3FHgSx4sNxkq
         Wo0BOr0vI36SA2QKuSwdjqp0ADirUFpUo+R5BBsWldiZ6jHHY5EWL7yqWBcbuzRNxsyo
         ci0w==
X-Forwarded-Encrypted: i=1; AJvYcCXMXpkKIAuzRHnG4cC1Lsx5+5WkOzFUJb1AkDWvXzCNVNfOOXX+Qs/mMRWeTOymtf6UD2T1WpblAGAiA7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAsDGpbcAEWZ4b4GVZJf1vocnILySoYfDdTyOSxKlQrtW99iWm
	QBgpek75PqcDS3ksNBXk1rz9hu1ab4+OxmLGBdJmMcrH/SjOj/dPU0BHcNZPbeZjLuo=
X-Gm-Gg: ASbGnctQuojEgsNddv9kQdaduU5EDkC4B3jvYdThSDUxE7tHuBFgKvs+6RgBDZ/8MtH
	bP6HhJu7GGgb+anB4agfEE3lNW2VdVf3GulDeYoZB0G/5aTFw7c8tG4d1eoODSGkSgz2IBE5LLG
	BhoH7rnFq+XHXKsVySzYDlG+yi4J/tdPvPjJFt0Ncp2N8sPKXO74SDhrrMUSLKGHWiY6my5x8/p
	e1sfsklTOtrQ9UUkLAVXdEtjEG8XQ9qRqNnILICFSF66I1BqhuZbj8BWuQQ0JXM6l6pEH2V7xqg
	Ttw9va83OxmWIhX9wsdGzjpkkgXMYoh8eVi7zzdwXI1Zi4ujCtCY0YAnOu23gLeZP4doPTWb1A=
	=
X-Google-Smtp-Source: AGHT+IFku9TE8EUVSLqmoCZBKfzqgA+/g+kH4IUAPWkSww+uTbuttoOauNZ+o0S0Qv506mn1chR6iQ==
X-Received: by 2002:a17:907:944d:b0:ace:c518:1327 with SMTP id a640c23a62f3a-adb493df457mr1224596266b.14.1748950826063;
        Tue, 03 Jun 2025 04:40:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad6abc2sm941360566b.173.2025.06.03.04.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:40:25 -0700 (PDT)
Date: Tue, 3 Jun 2025 13:40:23 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>,
	Alessandro Carminati <acarmina@redhat.com>,
	linux-kselftest@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ville Syrjala <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>, Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v5 1/5] bug/kunit: Core support for suppressing warning
 backtraces
Message-ID: <aD7fJxQWggfGekOf@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>,
	Alessandro Carminati <acarmina@redhat.com>,
	linux-kselftest@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ville Syrjala <ville.syrjala@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
References: <20250526132755.166150-1-acarmina@redhat.com>
 <20250526132755.166150-2-acarmina@redhat.com>
 <20250529090129.GZ24938@noisy.programming.kicks-ass.net>
 <CAGegRW76X8Fk_5qqOBw_aqBwAkQTsc8kXKHEuu9ECeXzdJwMSw@mail.gmail.com>
 <20250530140140.GE21197@noisy.programming.kicks-ass.net>
 <202505301037.D816A49@keescook>
 <20250531102304.GF21197@noisy.programming.kicks-ass.net>
 <8C5E309E-03E5-4353-8515-67A53EC6C9E3@kernel.org>
 <20250602075707.GI21197@noisy.programming.kicks-ass.net>
 <20250602-vegan-lumpy-marmoset-488b6a@houat>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602-vegan-lumpy-marmoset-488b6a@houat>
X-Operating-System: Linux phenom 6.12.25-amd64 

On Mon, Jun 02, 2025 at 12:38:10PM +0200, Maxime Ripard wrote:
> On Mon, Jun 02, 2025 at 09:57:07AM +0200, Peter Zijlstra wrote:
> > On Sat, May 31, 2025 at 06:51:50AM -0700, Kees Cook wrote:
> > 
> > > It's not for you, then. :) I can't operate ftrace, but I use kunit
> > > almost daily. Ignoring WARNs makes this much nicer, and especially for
> > > CIs.
> > 
> > I'm thinking you are more than capable of ignoring WARNs too. This
> > leaves the CI thing.
> > 
> > So all this is really about telling CIs which WARNs are to be ignored,
> > and which are not? Surely the easiest way to achieve that is by
> > printing more/better identifying information instead of suppressing
> > things?
> 
> You might also want to test that the warn is indeed emitted, and it not
> being emitted result in a test failure.
> 
> And I can see a future where we would fail a test that would trigger an
> unexpected WARN.
> 
> Doing either, or none, would be pretty terrible UX for !CI users too.
> How on earth would you know if the hundreds of WARN you got from the
> tests output are legitimate or not, and if you introduced new ones
> you're supposed to fix?

Yeah we'd like to make sure that when drivers misuse subsystem api, things
blow up. Kunit that makes sure we hit the warn we put in place for that
seems like the best way to go about that, because in the past we've had
cases where we thought we should have caught abuse but didn't. And this
isn't the only thing we use, it's just one tool in the box among many
others to keep the flood of driver issues at a manageable level.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
