Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E2721516D
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 18:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747418816; cv=none; b=ImlR0woWTSIGFd1b8JiSUcV4VXzB3NNE9gq2qeowdd56noxBb25JMsr/iwH5srWOgKdwlI7Kn/YlBlNAC6qq1MIcQu6fXLUVlYr7gERiOub574Qb5QBBYHqFEVeeh6QS4GA0LGSUDI4fMZS2bYpVH6LH91a9gDEutsqCWzCgnI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747418816; c=relaxed/simple;
	bh=EaGhh9y9W0mWJ2B10mg/vhu02sSfHCRzfLE0DGJv0cs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QVY8o/L2PFMm5Do7nonQo35uuGeSBQZZL5Waoi/k1XeDLEy0fRc5CYuOzaVv2AW5GuNXcidP+gVBepsef9YuAlwXzBg0hWNI6rZh4Dy1aUuKTRPVvVEiF93eJvrB2zVezrX/Fb2XVFNWv760HwewJjhVyeFmjT0PqNn6w1gMNqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yv5/rPHL; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yv5/rPHL"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6000791e832so1235a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 11:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747418813; x=1748023613; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ffBJsle0Lwjz8ccEmGsxhnpnfJLHOgF0YGAm3DFQxjI=;
        b=yv5/rPHLfOC52xCUvO3ijjcn2nup1tXhC3T8uA8ZcL8G5hKRWrJbTBaVpYTYXOtJ0C
         0RkIj8exEquEIept8NAp3pGfo82aiIx7bVM1E0gDee7f4AalbEUJpAzkOHj55N7LTBa1
         SHS7zyhzAifbN9KL6qtnBOYQsBr5BwzuniUajjPdZZmOS0l4yEwNz6bMA7/7RIogVpEk
         Chk/ZLTfxn7sGZp+XrC+qoWbC86DEeRI+rOeNZXf6yaCYptWG1JqTWW6AAjiZfBB1nLE
         KhcaNpVWGrOfsvRUrqhunuZIPK9MQCRBBplLQgE87aSNH0bSX+SoqudovrlbMQI2uzNc
         xIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747418813; x=1748023613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ffBJsle0Lwjz8ccEmGsxhnpnfJLHOgF0YGAm3DFQxjI=;
        b=ku6/QAAeaBLTwC1on+54cHiXWZ+iXzhNLXC3fdqTX4KUGR80O2MeyAw/6btYw8ZKzL
         sxXc2NmI1bs4taPkYZ3aUcELXU7oMRrLj5qHQ3rzLATa6mhyql+/5WjV1f7VfAo6+Vx1
         RRO+1wFOhqPpvyMPi+oK7S4BOVDOfTxsvIqNSDOs2LTvzTq9gMFegGyS0TMfWad3/FZm
         h44qdwCdMoGZ8WTvON+csazVaw7plRzj4l5F1jjL7CsHGZSWEMpXj6TYjzTrcx2u3LFL
         fjYyWKJqdqzQ856aalZVE08xmVKEAD2V0HzqvS8HRnk0g3p7VLHcNSfe6nZa3kWGxzKl
         LrHw==
X-Forwarded-Encrypted: i=1; AJvYcCWwcb1pj0pkqYWuXeeI0vcoUzrAsbv9jTjbreRQ1I/mDF/MAx2t5yfG7dsZ5QzZipikz6AECM1N6XGhqZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSj8+zlEK46hqbY8F+TZVy+f9rwiYyDs0qBzcOUUn1q07eCHui
	LwuwLajq6OtLA/zIBNRooVzL0LsA6/01795cGtkls0x4kHNPDSCEu1FkxbWirL53If6rt9F+Qr8
	OLkMimHHvB4LIjwger5Dh3ZZ2UkRBFu8ga1GaUOYM
X-Gm-Gg: ASbGnct5K7V8HDSzmMXVhBZSutwDM8657e6Qpqo6usuC7VCgxrA20dPy4I6aHZbT1uA
	4cTvQH4kAUCglFwL3ajdlcb9orULR/hzhySHanIvxRNmhrM5HSdnYCStQUgWxS6tMYPFHbZ0X0H
	dEuQuXP11nADfsg5OqjwFUQUdKBTBflEQomV7SsOQpXQsjIZKdxDEpezv/YDGaP+XEUOoRYps=
X-Google-Smtp-Source: AGHT+IHjVT1gKmVLBj3knAgZ7m159qYk3Ok4v0D1Bg/SE2WIJQB4Z3hZw0B78cj70OkvwZmrrSyMeN4kzMZtpVX3b1g=
X-Received: by 2002:a05:6402:f85:b0:5fd:28:c3f6 with SMTP id
 4fb4d7f45d1cf-6019c8884b4mr2262a12.4.1747418813012; Fri, 16 May 2025 11:06:53
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306082615.174777-1-max.kellermann@ionos.com>
 <878qmxsuy8.fsf@email.froward.int.ebiederm.org> <202505151451.638C22B@keescook>
 <87ecwopofp.fsf@email.froward.int.ebiederm.org>
In-Reply-To: <87ecwopofp.fsf@email.froward.int.ebiederm.org>
From: Jann Horn <jannh@google.com>
Date: Fri, 16 May 2025 20:06:15 +0200
X-Gm-Features: AX0GCFsTNJfHA0lDPOLsfx2AHvwhpi8BaLe2zu9yZK-Y_kwCHJr4mJE3cbEsjCU
Message-ID: <CAG48ez1VpuTR9_cvLrJEMmjOxTCYpYFswXVPmN6fE3NcSmPPVA@mail.gmail.com>
Subject: Re: [PATCH] exec: Correct the permission check for unsafe exec
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Kees Cook <kees@kernel.org>, Max Kellermann <max.kellermann@ionos.com>, 
	"Serge E. Hallyn" <serge@hallyn.com>, paul@paul-moore.com, jmorris@namei.org, 
	Andy Lutomirski <luto@kernel.org>, morgan@kernel.org, 
	Christian Brauner <christian@brauner.io>, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 5:26=E2=80=AFPM Eric W. Biederman <ebiederm@xmissio=
n.com> wrote:
> Kees Cook <kees@kernel.org> writes:
>
> > On Thu, May 15, 2025 at 11:24:47AM -0500, Eric W. Biederman wrote:
> >> I have condensed the logic from Linux-2.4.0-test12 to just:
> >>      id_changed =3D !uid_eq(new->euid, old->euid) || !in_group_p(new->=
egid);
> >>
> >> This change is userspace visible, but I don't expect anyone to care.
> >> [...]
> >> -static inline bool __is_setuid(struct cred *new, const struct cred *o=
ld)
> >> -{ return !uid_eq(new->euid, old->uid); }
> >> -
> >> -static inline bool __is_setgid(struct cred *new, const struct cred *o=
ld)
> >> -{ return !gid_eq(new->egid, old->gid); }
> >> -
> >> [...]
> >> -    is_setid =3D __is_setuid(new, old) || __is_setgid(new, old);
> >> +    id_changed =3D !uid_eq(new->euid, old->euid) || !in_group_p(new->=
egid);
> >
> > The core change here is testing for differing euid rather than
> > mismatched uid/euid. (And checking for egid in the set of all groups.)
>
> Yes.
>
> For what the code is trying to do I can't fathom what was trying to
> be accomplished by the "mismatched" uid/euid check.

I remember that when I was looking at this code years ago, one case I
was interested in was what happens when a setuid process (running with
something like euid=3D1000,ruid=3D0) execve()'s a normal binary. Clearly
the LSM_UNSAFE_* stuff is not so interesting there, because we're
already coming from a privileged context; but the behavior of
bprm->secureexec could be important.

Like, I think currently a setuid binary like this is probably (?) not
exploitable:

int main(void) {
  execl("/bin/echo", "echo", "hello world");
}

but after your proposed change, I think it might (?) become
exploitable because "echo" would not have AT_SECURE set (I think?) and
would therefore load libraries based on environment variables?

To be clear, I think this would be a stupid thing for userspace to do
- a setuid binary just should not be running other binaries with the
caller-provided environment while having elevated privileges. But if
userspace was doing something like that, this change might make it
more exploitable, and I imagine that the check for mismatched uid/euid
was intended to catch cases like this?
