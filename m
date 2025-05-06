Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261BF28314D
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 14:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746543115; cv=none; b=lmXvOkle3kHs4GYVlph9z62/WUBdws3FBf/ODH4kOCsMp3j2K0248RpdzX2+j7abFxf0iZREiHChwutD7zez6UdJh0T/f2I7mNeu7ECLMSwrYzfBejHLzecwBJohEnqMFSC4batE8xWRkoq3RYZNc/Y62S+2X13J5gGInnLvK6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746543115; c=relaxed/simple;
	bh=WSoK7ecBDi4GOLHE37CoJwr2TpWXYYyrQG93Kd69dRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WrBHnLJLSRcCMwAjJQLYFXnvxCJtfoFtP45gf/cRG9he4CzUFHPeRqL6PKq2AyMXwelftizu0JpSGkBzyHX0X1sUz2hEm2IrLJywKRdgaepB/UWTwam9R3DIHm68E89PBSBWzjrucov48oxvXwEYTIzI/Lr8v4A1rP0SNOjeMvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=Q8My8LNN; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="Q8My8LNN"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ace333d5f7bso1088075966b.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 07:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1746543111; x=1747147911; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pBK5ZlkT5DURixU1Q8MtA26nZyrigiatpI7SyK2Pdg=;
        b=Q8My8LNNFxzG8e54CV7kgMIyXHWq+oUf1C/7nmEusoJMUH6WWOZ+NQBAZBPVta2nnz
         +SINc1RiAPHbVD97KJ2ujYWfy9ChiTa3P29IdX792UPuS53pnnXpTY1n1u2DUCwY9/ZD
         +w0YZ0PWjc6S3RghjuJz4wo6e4gWL2NZ4Y+rz82Z7zmhA1vGK8jQAihEd3AE2LrJPjUp
         GYZX6Bj+JoQHBhvSmxUBgWtDuKevL2a/PFpaF6nM5tRN3mkhgyIztCdRIOBWJZp6gAec
         6Y5DXiH4L9EQD2Olv7JPr0mokYKCpCGlteIiHYaMgPNE6nO5GXSMXrA4k+0wslVoVIIB
         7+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746543111; x=1747147911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pBK5ZlkT5DURixU1Q8MtA26nZyrigiatpI7SyK2Pdg=;
        b=qcti4WVtZW9oq7s7mln4X2jNZD4lHLrrNqHGDag7eLNGIIssoks7nL76vy9cdvEXq+
         kROi8CZPA3nVLQDoYEyC1Hn279iGGNcnH9JxwSDgDnLkgfli12CfxfErgcVH6dMDjv/I
         5VeKdJUriWIGd/0cjS7lf8KAm277iduz24JIT/vOI7OUXBX+TO21H0K5SLDyrw9hET15
         8aNhhkzPJ78y2X+GhSRXZNaWqrc9f7p8MsLNi8E1/IIDvLXAueeGVmkluKUDyxLHVHUM
         PTENvAqDRBDE5YigAwjAYLqTaJ28S+q34K3uCPt18Z9gm1gTIEhoxcDGjMm/xN0wQ/YI
         0a1g==
X-Forwarded-Encrypted: i=1; AJvYcCVLxcNTVqOOG3UT487keS56jzMaWfyqn2WHiN64sqyRO5Be2eOP5oDrxUSwFpjxK2R2IJGq87sZ1ldYp1s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd4x8LWG1HfdFPvePhdZjzTihE4hB7b/g/y3pRkOIrI4cVrbCU
	StRFnSZC7bE1EUoNWF8Gcy4AxViowx6bdOTzJrhCgLdElwEWSIGuK2/7XxQrTQJHoYUE01Qzz7y
	kvnE4xp9JZsyxgFJ7smz8stbwaDEGsE15DIBCWQ==
X-Gm-Gg: ASbGnct3ajNoFt/aZRvYgCyIDQuq6Me3JX9emP5x5m8a2SJeiG5RjUgeayh0spgVBB0
	3dmyXd8pEARHZv5Mfbrrspkbp+knGJldDhs58BKySoKNH/mlebaPc8zGl0k+PtxKnq6Gs0Vczaf
	OExcDHGSK3QQK4EXpu18itxKnOhlKDkMEumiKjkq6r2oNUB4yuup0=
X-Google-Smtp-Source: AGHT+IEKhz3zPgou4fj/Oz9TLP3o5kqCDQPDF+vahGvR46vxs1Ch3GNqw52chR1OPGqhN1u6zfmZoq9O40DQGTsc9wI=
X-Received: by 2002:a17:907:7f1f:b0:ace:6e8b:516c with SMTP id
 a640c23a62f3a-ad1a49540d5mr930268466b.20.1746543111280; Tue, 06 May 2025
 07:51:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306082615.174777-1-max.kellermann@ionos.com>
 <20250309151907.GA178120@mail.hallyn.com> <CAKPOu+_vTuZqsBLfRH+kyphiWAtRfWq=nKAcAYu=Wn2JBAkkYg@mail.gmail.com>
 <20250506132158.GA682102@mail.hallyn.com>
In-Reply-To: <20250506132158.GA682102@mail.hallyn.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Tue, 6 May 2025 16:51:39 +0200
X-Gm-Features: ATxdqUG9SxPBVj0h6gtWFf2B5cm0dbLegG2UIzxNlHNZe-zIqreHUL3rOZUOzrg
Message-ID: <CAKPOu+9JCLVpJ-g_0WwLm5oy=9sq=c9rmoAJD6kNatpMZbbw9w@mail.gmail.com>
Subject: Re: [PATCH] security/commoncap: don't assume "setid" if all ids are identical
To: "Serge E. Hallyn" <serge@hallyn.com>
Cc: Andy Lutomirski <luto@kernel.org>, paul@paul-moore.com, jmorris@namei.org, 
	kees@kernel.org, morgan@kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 3:22=E2=80=AFPM Serge E. Hallyn <serge@hallyn.com> w=
rote:
> Just to quibble here: I don't use NO_NEW_PRIVS, but it seems to me quite
> likely that your claim is wrong here.  The whole SECBIT_KEEP_CAPS etc
> dance is based on the idea that you understand that once you exec, you
> lose some of your existing privilege.  Similarly, it seems quite
> likely to me that people using NO_NEW_PRIVS understand, expect, and
> count on the fact that their effective ids will be cleared on exec.

One could define NO_NEW_PRIVS that way, but that's not how it is documented=
.
Of course, we can't rule out that somewhere, somebody exists who
relies on the current behavior, and that we must preserve it for ABI
stability (I think this was your point). If you desire ABI stability,
then this behavior should really be documented.

To me, the current implementation looks weird and buggy (but that's
just my opinion). The code figures that that it's a set-id exec when
effective!=3Dreal, which is indeed how set-id execution looks like, but
still that check is slightly off:

1. it's really only set-id when new!=3Dold; checking real!=3Deffective is
conceptually the wrong angle
2. there may be other reasons why real!=3Deffective

My patch is an attempt to fix this in an unintrusive way, by not
rewriting it but adding another check to rule out some special case.
If I were to rewrite this from scratch, I'd do it differently (only
compare new!=3Dold), but I don't want to mess too much with security
code that I'm not very familiar with. I believe the guy who initially
wrote it made wrong assumptions, but maybe I'm just wrong, I'm not the
expert here.

> Note also that so far I'm only asking about the intent of the patch.

In a shared webhosting environment, we want to run an Apache (or
nginx) in each website's container. If the website owner does "chmod
600", the Apache should not be able to read the file; but PHP
processes spawned by the Apache should have full access. Therefore, we
run Apache with a different fsuid; when Apache executes PHP, the fsuid
is reverted.

But how to spawn Apache with a different fsuid? Not possible directly
(fsuid is always reverted on exec), but by giving it a different euid
(and ruid =3D website uid), granting it access to that secondary uid.
After exec, Apache swaps uids, sets effective=3Dreal=3Dapache_uid, and
fsuid=3Dwebsite_uid.
That works fine, until we enable NO_NEW_PRIVS - which is surprising,
because we indeed don't want any new privs - just keep the existing
ones.
The documentation doesn't explain this behavior, and we don't want to
omit NO_NEW_PRIVS as a workaround.

> Apart from that, I do think the implementation is wrong, because you
> are impacting non-NO_NEW_PRIVS behavior as well, such as calculation
> of cap_permitted and the clearing of ambient capabilities.

You are right, it affects all three code blocks that are checking
"is_setid", but why do you believe it's wrong?
I can move the new check to the bottom, covering only the
"secureexec=3D1" line, if that worries you.

What sure is flawed is that my patch description fails to mention the
other two changes. Sorry for that, I'll amend the description (if/when
we agree that my patch is ok).

Though I do believe that all 3 changes are correct. Why would you want
to clear ambient capabilities just because real!=3Deffective? The
manpage says: "Executing a program that changes UID or GID due to the
set-user-ID or set-group-ID bits or executing a program that has  any
file  capabilities set will clear the ambient set."

Documentation and code disagree! Currently, the kernel does not check
for "changes UID/GID", but whether effective!=3Dreal. These two are
orthogonal, the kernel is buggy, and my patch makes it a little bit
more correct (but does not remove the wrong real!=3Deffective check, see
above).

> And, I'm not sure the has_identical_uids_gids() is quite right, as I'm
> not sure what the bprm->cred->fsuid and suid make sense, though the
> process's fsuid and suid of course need to be checked.

Sorry, I don't get that. What do you mean?
