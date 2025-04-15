Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9834224169E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 20:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744748257; cv=none; b=khDg34kcMhmvEBtG/8lBlqP3bvMRaJBc/pP6ym2K7TEFiRGCN72IItiSRQl1la7eEU4Avdkq0J6OfeVj26Wq2ANKCRoSz4XvVKPpRaaAZXhOh3uNAK4sKmWCOU+Q1b4I1zvqL87zP9i5ezraTTmG+HbYccAGJU4WIbuPp+oOvu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744748257; c=relaxed/simple;
	bh=YU5B6U4Y3Cto2Mmbh8uovjZ9gGgtnptXLj4BEsWyKKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sWFEVa0uq2P2haF9HpsPAL+90LD+hviI54ibSnWg3762PPtLKMnvwoTA4GxvWG8AtRjiZfrk3oNlU3qiPLJVWM+e04XmQuUl27X8vgCzJYdntRxzBo8YsGEy+DW1SmCveAQVQpwB571qB5DI5U34tYmOZd0oNh8HT0FooJkuUck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPIclIbB; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPIclIbB"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7043db8491dso61558587b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744748254; x=1745353054; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2f4lqBJ3KU4xN2C63AmFZML3WVt9PkuM4udxa8upYQ=;
        b=iPIclIbBcrE9TlRTZZWYvyQIvIHRvg8vSlpnciFykRuA2YbmaWxWKeJPAgOl+81gUu
         lxA/vknn+LkEMDFiB/o7qB/bWjkpDfwcZauqCzlHdFMTFu7XkoXTGsmOh4RUhotczmF/
         6Fzk1RGLfdWQuiaAPjEYgIVhhrmzO5Tqe8W47vfloFMO/94QflfcHHF8zTA6gO7e9Ofq
         7XogA0YAJ/TihrUYH4dnvehx2c3zZM/EtGzrpX/5hNd1hp6g/g0PpjbS7iOiu0z57OsY
         4TVyZaa5erihF9Fl+Yfsh++mzCB4BHLP8jhewP8SgHWQySYBFRuiH//XV2PYNn5x2LtD
         bs+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744748254; x=1745353054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2f4lqBJ3KU4xN2C63AmFZML3WVt9PkuM4udxa8upYQ=;
        b=eu/nq+xD5JJtNi62d65oX7YhwtLjORoDAxTLPbN7gKvGmS7QHoJJN7Yae6zbexUTNW
         qHy3KComzn2uxqBnAaRfQ0haVi4DQxrJ/vQ3VXBpXWpsQ7ISuo150wLfYEojt0QA8fTA
         KlgNOw2abW73UsNhmEa51kG/LgmawxQHNpsjrJn4C2rjiRRK0YzuMFn/mO84qzH1Fx9o
         N/SHhLerTHnr29e+u65rHKYkMjWxGqpium6aCIrd0B8xep8ugetrdSmRTGaUIUcPhLBs
         0gOHz63ApsKDKKvMCwtFXLM68otZxQ9hco5qTJQtGlNraA2NweSLptIS5qSOt6gX0syZ
         G9kA==
X-Forwarded-Encrypted: i=1; AJvYcCWKwE66+7EqXoZZzToFJtjHIuUL/KI1AxZjaG9tC8EhuZktpx3/XwG/i5+bLeacs6IF4pn8XbmxnMIkGc4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7If7auKqMH7p8jjQKsCzv2PfzR30KhM6EUqgwxWjBtTVixNHk
	nYtg68uS5+rIsPOuRiZeGUBBl+f36VrFqrV9Zm3hjMLOp7/nLKmgK5Nzxa168VlnrXnjmsTqUn7
	fRZDvn+J9qwYly350LE4Lb6vu+Cw=
X-Gm-Gg: ASbGncsyUhWewNdqu+cr58dKYXi2z/LIIDC27km55NAx///0VnV3eD3ufcMARh00eGv
	9GsyiDGdA0TWvvzokknuQ7Mpvje9fiV4iyagBvlzs8MKRx4J43Cx7Blo3BSSw/0IYXsE47kExkJ
	V8UuaHovbmlOhFnekSuQyfPX314Z/rjs0=
X-Google-Smtp-Source: AGHT+IHASz86QMUepPNXOhocPuVmLHD9gr+x/9kxgl75W95uEZj+zDqeKUtyT5YmfO9onCBuAwS9eq00pIaqEmsXvA4=
X-Received: by 2002:a05:690c:4491:b0:702:5927:cf74 with SMTP id
 00721157ae682-706aca34f9emr12312777b3.0.1744748254431; Tue, 15 Apr 2025
 13:17:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
 <20250402174156.1246171-24-jim.cromie@gmail.com> <d97fa4de-ee0c-4bee-9cf2-cd3a343e3439@bootlin.com>
In-Reply-To: <d97fa4de-ee0c-4bee-9cf2-cd3a343e3439@bootlin.com>
From: jim.cromie@gmail.com
Date: Tue, 15 Apr 2025 14:17:07 -0600
X-Gm-Features: ATxdqUH2ijE33CYVEiEjLWi5zzDtsvJCrFygD06lZ-2beemv0ZLcXrrrFfEANFE
Message-ID: <CAJfuBxxR9GZwRmVCuu=at2RUXT_pUWHrG4V61G+WjQSKJnh2Fg@mail.gmail.com>
Subject: Re: [PATCH v3 23/54] dyndbg: treat comma as a token separator
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch, 
	tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com, 
	ville.syrjala@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 4:05=E2=80=AFAM Louis Chauvet <louis.chauvet@bootli=
n.com> wrote:
>
>
>
> Le 02/04/2025 =C3=A0 19:41, Jim Cromie a =C3=A9crit :
> > Treat comma as a token terminator, just like a space.  This allows a
> > user to avoid quoting hassles when spaces are otherwise needed:
> >
> >   :#> modprobe drm dyndbg=3Dclass,DRM_UT_CORE,+p\;class,DRM_UT_KMS,+p
> >
> > or as a boot arg:
> >
> >   drm.dyndbg=3Dclass,DRM_UT_CORE,+p  # todo: support multi-query here
> >
> > Given the many ways a boot-line +args can be assembled and then passed
> > in/down/around shell based tools, this may allow side-stepping all
> > sorts of quoting hassles thru those layers.
> >
> > existing query format:
> >
> >   modprobe test_dynamic_debug dyndbg=3D"class D2_CORE +p"
> >
> > new format:
> >
> >   modprobe test_dynamic_debug dyndbg=3Dclass,D2_CORE,+p
> >
> > ALSO
> >
> > selftests-dyndbg: add comma_terminator_tests
> >
> > New fn validates parsing and effect of queries using combinations of
> > commas and spaces to delimit the tokens.
> >
> > It manipulates pr-debugs in builtin module/params, so might have deps
> > I havent foreseen on odd configurations.
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > Co-developed-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > ---
> > - skip comma tests if no builtins
> > -v3 squash in tests and doc
> > ---
> >   .../admin-guide/dynamic-debug-howto.rst       |  9 +++++---
> >   lib/dynamic_debug.c                           | 17 +++++++++++----
> >   .../dynamic_debug/dyndbg_selftest.sh          | 21 ++++++++++++++++++=
-
> >   3 files changed, 39 insertions(+), 8 deletions(-)
> >
> > diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Docume=
ntation/admin-guide/dynamic-debug-howto.rst
> > index 63a511f2337b..e2dbb5d9b314 100644
> > --- a/Documentation/admin-guide/dynamic-debug-howto.rst
> > +++ b/Documentation/admin-guide/dynamic-debug-howto.rst
> > @@ -78,11 +78,12 @@ Command Language Reference
> >   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> >
> >   At the basic lexical level, a command is a sequence of words separate=
d
> > -by spaces or tabs.  So these are all equivalent::
> > +by spaces, tabs, or commas.  So these are all equivalent::
> >
> >     :#> ddcmd file svcsock.c line 1603 +p
> >     :#> ddcmd "file svcsock.c line 1603 +p"
> >     :#> ddcmd '  file   svcsock.c     line  1603 +p  '
> > +  :#> ddcmd file,svcsock.c,line,1603,+p
> >
> >   Command submissions are bounded by a write() system call.
> >   Multiple commands can be written together, separated by ``;`` or ``\n=
``::
> > @@ -167,9 +168,11 @@ module
> >       The given string is compared against the module name
> >       of each callsite.  The module name is the string as
> >       seen in ``lsmod``, i.e. without the directory or the ``.ko``
> > -    suffix and with ``-`` changed to ``_``.  Examples::
> > +    suffix and with ``-`` changed to ``_``.
> >
> > -     module sunrpc
> > +    Examples::
> > +
> > +     module,sunrpc   # with ',' as token separator
> >       module nfsd
> >       module drm*     # both drm, drm_kms_helper
> >
> > diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> > index 0d603caadef8..5737f1b4eba8 100644
> > --- a/lib/dynamic_debug.c
> > +++ b/lib/dynamic_debug.c
> > @@ -299,6 +299,14 @@ static int ddebug_change(const struct ddebug_query=
 *query, struct flag_settings
> >       return nfound;
> >   }
> >
> > +static char *skip_spaces_and_commas(const char *str)
> > +{
> > +     str =3D skip_spaces(str);
> > +     while (*str =3D=3D ',')
> > +             str =3D skip_spaces(++str);
> > +     return (char *)str;
> > +}
> > +
> >   /*
> >    * Split the buffer `buf' into space-separated words.
> >    * Handles simple " and ' quoting, i.e. without nested,
> > @@ -312,8 +320,8 @@ static int ddebug_tokenize(char *buf, char *words[]=
, int maxwords)
> >       while (*buf) {
> >               char *end;
> >
> > -             /* Skip leading whitespace */
> > -             buf =3D skip_spaces(buf);
> > +             /* Skip leading whitespace and comma */
> > +             buf =3D skip_spaces_and_commas(buf);
> >               if (!*buf)
> >                       break;  /* oh, it was trailing whitespace */
> >               if (*buf =3D=3D '#')
> > @@ -329,7 +337,7 @@ static int ddebug_tokenize(char *buf, char *words[]=
, int maxwords)
> >                               return -EINVAL; /* unclosed quote */
> >                       }
> >               } else {
> > -                     for (end =3D buf; *end && !isspace(*end); end++)
> > +                     for (end =3D buf; *end && !isspace(*end) && *end =
!=3D ','; end++)
> >                               ;
>
> Why don't you use the skip_spaces_and_commas here?

yes, thx. I will.

>
> >                       if (end =3D=3D buf) {
> >                               pr_err("parse err after word:%d=3D%s\n", =
nwords,
> > @@ -601,7 +609,8 @@ static int ddebug_exec_queries(char *query, const c=
har *modname)
> >               if (split)
> >                       *split++ =3D '\0';
> >
> > -             query =3D skip_spaces(query);
> > +             query =3D skip_spaces_and_commas(query);
> > +
> >               if (!query || !*query || *query =3D=3D '#')
> >                       continue;
> >
> > diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b=
/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> > index 465fad3f392c..c7bf521f36ee 100755
> > --- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> > +++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
> > @@ -216,7 +216,7 @@ function check_err_msg() {
> >   function basic_tests {
> >       echo -e "${GREEN}# BASIC_TESTS ${NC}"
> >       if [ $LACK_DD_BUILTIN -eq 1 ]; then
> > -     echo "SKIP"
> > +     echo "SKIP - test requires params, which is a builtin module"
> >       return
> >       fi
> >       ddcmd =3D_ # zero everything
> > @@ -238,8 +238,27 @@ EOF
> >       ddcmd =3D_
> >   }
> >
> > +function comma_terminator_tests {
> > +    echo -e "${GREEN}# COMMA_TERMINATOR_TESTS ${NC}"
> > +    if [ $LACK_DD_BUILTIN -eq 1 ]; then
> > +     echo "SKIP - test requires params, which is a builtin module"
> > +     return
> > +    fi
> > +    # try combos of spaces & commas
> > +    check_match_ct '\[params\]' 4 -r
> > +    ddcmd module,params,=3D_           # commas as spaces
> > +    ddcmd module,params,+mpf         # turn on module's pr-debugs
> > +    check_match_ct =3Dpmf 4
> > +    ddcmd ,module ,, ,  params, -p
> > +    check_match_ct =3Dmf 4
> > +    ddcmd " , module ,,, ,  params, -m"      #
> > +    check_match_ct =3Df 4
> > +    ddcmd =3D_
> > +}
> > +
> >   tests_list=3D(
> >       basic_tests
> > +    comma_terminator_tests
> >   )
> >
> >   # Run tests
>
> --
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
