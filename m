Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7069C265608
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749599424; cv=none; b=guxyogdGNPJPNUKnLWiT/5k3IKFWSv3t1rvj5E+AtE4nsq1F9fYjwBsbO2wMBxAFQ05b2ms4C5heiCZEhOJJgOgdL6jTtylTRXxEFV+HVgYtRmrF5WAdjzeg3Zbdo9kDyhiXJnnsoiECxvCeyi/jDjKTNOOLoLvxiW3pXYiYOXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749599424; c=relaxed/simple;
	bh=5zpmeUIFplYcd16FCJTHwlcr+3eWOrvix0typRp9sog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XNCGL0ZpvXNYA+RFsL+AYzelxnVJRIG5Hgno+xTUc8PrePxQpQihMAeX9P9JHS5cPmoiJ2an7OmduCTjmsjkFPmd+9V8mYRw2tRb4yOu9CE1YcLxwBgN4XO5xEYYAMgKhULlK/NZEBEDSLLInGUjr/fUsOGTGVfNUIRbKs13ROU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=FTOoNxL+; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="FTOoNxL+"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e81a6da56b2so3198719276.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 16:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1749599421; x=1750204221; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p9Qgp5oHl/0P+qqYYVFIyIBvDmKn+BX8RyiafClKsvk=;
        b=FTOoNxL+0vvlydxtSO2mI5yc5X1tjb179p+F0GAsrKx4xgmGahTCldcYS00Z3ViLIJ
         g0Y+/KMfpS/uwp//Kk5giFqvVPes7d1RHKOvnGNhAKNQiS3Zpi9aLKZH+WVdKR9v8pKk
         iP5Z/yMT64NpQZtKsEeF5dYsY2c6BfyLExb/jp4KkKkflgeqNk1ulDEGmNpOoruuNh4s
         PtB57wiRRix46OR4HDub/HRfv7VXBDVTzTgHgEUHk37pBFwzZgSUSmbqOJ07T2rAAUcd
         xlogZ+m14/YVu0Kq+f3U9z98WdBd48fUqjtkqASQPHLX2xgeTDAgHqdH3SrkzUdOpVeY
         eY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749599421; x=1750204221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9Qgp5oHl/0P+qqYYVFIyIBvDmKn+BX8RyiafClKsvk=;
        b=d2HCpKrS6FP3fEtch1nZkc57Gf9kH7LsB6nOaF0p+gSl3xFjajvu/vEuI83w3BNn68
         DMF3pxCh0BzBrKvKiHrSDNlxh6cEQ+h1zZlA1MP6+3ti8tAPQGG58+DzPwMI9HjV6k0d
         IR80Js/ZTPfXAyIscT09Rxy9OilPl2/VvU2PPdRKB75kO/E0fYYYfmp8klXudt/KxgQx
         xDTSIeAG1+FHc6o5ia1GdihTFYy6AJhcISMfGOmADWgh8uAAic7URHCkNUgFmnOxfRnt
         mKr5OJVHqgDwi9lVpE+JUNPQLWuUIRILPIARTkb5+KCyzQNCrC34WOocrdZ2OmYJSby/
         YLPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwtVTIyaitgUhyjj2Nq7pHBUUMES0CSQQEuonW8VtbT2IK1HDoIIq8KnWu+8mylclDjn5H7X5Xrxq2O4w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkuTlYGZXFWmpaRV+GZpRHlXJEYuEu9f42LCyewzn4RvAO1LJO
	k8SJNKWmWP6kAjXSeELwGubXw5MAl4m9ggXTYHyNj873OOULe3OklltRae89lwSgcdPeyw0gZJd
	wPWJkkRVrw8c6iCd9lSDD1aasT0ZR4mKR1frvSdjO
X-Gm-Gg: ASbGncuFOoY3LaJ7OHmpmsmmHia6tOSTY2NsVyLpzSNIkRKgm5VrBs05YgAY01EcWUX
	jJXLqUv9B/0tRkVUTQoBZY32wkUpPOHBYBe5Vc8SeAoy1eYkkeGmo19TAuHOeN37wah+lZTP26w
	4fu0GJNVt5SMF3PH449w9lgC+XrYUYLhOtJSwBM+Q8smA=
X-Google-Smtp-Source: AGHT+IEvtteku/P1uiXxT4gbHUj7G2QQ+RMoFTyCSCZ3iBdan2K1TBvoDyo+Adyk8sCdrfVIToKGxMKUgGG3OtxF/+0=
X-Received: by 2002:a05:6902:72e:b0:e81:78f7:5521 with SMTP id
 3f1490d57ef6-e81fd92a3f2mr2148616276.6.1749599421291; Tue, 10 Jun 2025
 16:50:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605164852.2016-1-stephen.smalley.work@gmail.com>
 <CAHC9VhQ-f-n+0g29MpBB3_om-e=vDqSC3h+Vn_XzpK2zpqamdQ@mail.gmail.com>
 <CAHC9VhRUqpubkuFFVCfiMN4jDiEhXQvJ91vHjrM5d9e4bEopaw@mail.gmail.com> <87plfhsa2r.fsf@gmail.com>
In-Reply-To: <87plfhsa2r.fsf@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 10 Jun 2025 19:50:10 -0400
X-Gm-Features: AX0GCFt95pxw11ngH9ypXcXXgINCY4mIRN7SWpVrAA3u5KTm4VBIfux35kFrlG4
Message-ID: <CAHC9VhRSAaENMnEYXrPTY4Z4sPO_s4fSXF=rEUFuEEUg6Lz21Q@mail.gmail.com>
Subject: Re: [PATCH] fs/xattr.c: fix simple_xattr_list()
To: linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	brauner@kernel.org
Cc: Collin Funk <collin.funk1@gmail.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, linux-kernel@vger.kernel.org, 
	selinux@vger.kernel.org, eggert@cs.ucla.edu, bug-gnulib@gnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 1:39=E2=80=AFAM Collin Funk <collin.funk1@gmail.com>=
 wrote:
> Paul Moore <paul@paul-moore.com> writes:
> >> <stephen.smalley.work@gmail.com> wrote:
> >> >
> >> > commit 8b0ba61df5a1 ("fs/xattr.c: fix simple_xattr_list to always
> >> > include security.* xattrs") failed to reset err after the call to
> >> > security_inode_listsecurity(), which returns the length of the
> >> > returned xattr name. This results in simple_xattr_list() incorrectly
> >> > returning this length even if a POSIX acl is also set on the inode.
> >> >
> >> > Reported-by: Collin Funk <collin.funk1@gmail.com>
> >> > Closes: https://lore.kernel.org/selinux/8734ceal7q.fsf@gmail.com/
> >> > Reported-by: Paul Eggert <eggert@cs.ucla.edu>
> >> > Closes: https://bugzilla.redhat.com/show_bug.cgi?id=3D2369561
> >> > Fixes: 8b0ba61df5a1 ("fs/xattr.c: fix simple_xattr_list to always in=
clude security.* xattrs")
> >> >
> >> > Signed-off-by: Stephen Smalley <stephen.smalley.work@gmail.com>
> >> > ---
> >> >  fs/xattr.c | 1 +
> >> >  1 file changed, 1 insertion(+)
> >>
> >> Reviewed-by: Paul Moore <paul@paul-moore.com>
> >
> > Resending this as it appears that Stephen's original posting had a
> > typo in the VFS mailing list.  The original post can be found in the
> > SELinux archives:
> >
> > https://lore.kernel.org/selinux/20250605164852.2016-1-stephen.smalley.w=
ork@gmail.com/
>
> Hi, responding to this message since it has the correct lists.
>
> I just booted into a kernel with this patch applied and confirm that it
> fixes the Gnulib tests that were failing.
>
> Reviewed-by: Collin Funk <collin.funk1@gmail.com>
> Tested-by: Collin Funk <collin.funk1@gmail.com>
>
> Thanks for the fix.

Al, Christian, are either of you going to pick up this fix to send to
Linus?  If not, any objection if I send this up?

--=20
paul-moore.com
