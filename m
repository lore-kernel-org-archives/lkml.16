Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678E125DD10
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746039077; cv=none; b=a9U3oMcpU0C0m/Es0BAV46Mr7FJjf6KgrF1CGbcOuSdn4RrVdImsO8OKCZ2Ya/5nRiW39GrJv/IROmTnc+sFXlRMI38hgdms1/qsIBllgNQ50CxiGrcI9YTOSllt0lEdGcllnqrtQcDrzqRbc7h6Gw/GalYREK5fxQef17B69Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746039077; c=relaxed/simple;
	bh=8/3Vu1D+LVVPxV2vHCD21bHGPb43u8RgJ3L+nYHuh2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PGXX37XKfAZWzBcPooiFwC1OH9CJiyagDNXlQNOKqJ64UGgwJpHq6qURhoeuZWLaCymVrY2gve3ue6VL+4S71cSDitYOBZLSe8dgPfZVf11PYnOsyJpSWRA9OksRIW0l1XibiWEpX7M/H9J/EAXAtkcBj01xruoPCsKsqxW5thY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=M0HnFOP+; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="M0HnFOP+"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e733b858574so149372276.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1746039074; x=1746643874; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rE4E6ahlqj9qOjKExuQG4V41IoSftlZFpt7HNxvcZx0=;
        b=M0HnFOP+A0airj9rqmzm8ESxWdVh2Ud3eKHFS1roLu0wyB1KEQF0gfbGtEuqhyj8WG
         Kd+IgI8aKr5T4fdDGbiqLuWKznMo8vX2iyBPdey03dHm5Wx04m7ogBQwiBM+7OvHy/S9
         Qc5MMx+7H8mLhvLqou6evNikBPCc4zsCtEQg5rt3zxrMB8abUKoslEqXcVHnuvp7SyMR
         +W9me81MdbFws3b1iKw2pJlxDrOtLBUiaAfJTAO4rEHC8lx/mp/mg6WTCxpE7TS5fHtx
         vbS3OmOSfyabBx2ps1ekwkJRp0Difgs10AJcin+NSPjKkWlFV4kVIujNDvSTzGAv7shC
         rcug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746039074; x=1746643874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rE4E6ahlqj9qOjKExuQG4V41IoSftlZFpt7HNxvcZx0=;
        b=MbiGbY/hBP7cTHhZWNZ0A3JVg1fSEajOh1yXNFS3x9kYhe2+YJn+R+Bv2l5nJ/SJ71
         eLy4mSEv87amuIwy/nzbUd2stUU2CfVs8bGytVSj0DNk1d0sTaGQYzriOtvhgPv8RZ/h
         YybAMVokrqNivBwls0NGee2qJ17bCWvEV0QbyveGs8su/rk/F5V5ZzvBsPN4Q+KAED2J
         lRVgf6myqoC2E8BsBwXrfPC4mX45Qvjvw9y6UdGV3dnD01tew6kXWzoZLO343U8Btfaj
         WrtMqSfMNrlQFFCtEIVDk5ASD7mXER3qgVtfGAKbFW924SsMmK9BLEXV8sQOnl7objH6
         BcVg==
X-Forwarded-Encrypted: i=1; AJvYcCVMSbE1GeEoKSJYnAgQkGy6RWh57Q/qa6L/Tc6/dkg1OPmSJZlF4ZQnFxQAM5CzyjrX1oa33m1/OiG4ZX4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQg1UugGlLesSbfSbEBzoWtkKdwvZI1uw4WLQ1PtHArqp6LygL
	RUKHsD4rrmuRCG+3BdMqzJUeAVfTpJaEE+4l6Lb3iU8fOm8xJe9xHftQgjNNiMBRN4IvK9CzfwX
	ot2x39x8vuv+fv8ld7u7PKDTIh0ABZkvK3u99
X-Gm-Gg: ASbGncvHk1p0YKuzY5nV6KVsSDpGAUI3f/oHN/Q6AcBenWB9uxC3CWppTbiz0MwAda9
	hqPcJfotlYDF3U0vJcmB3U5XE/mnq9a6S9qmuHi60crXgJ3+VVHyI/wKdxQufc+zLhx1WMzlXZ3
	X4l1bK65Bda3vbVDN8evO/ew==
X-Google-Smtp-Source: AGHT+IFGVRlgUQ78u+BwGAXsh8y6G1LjqMSHEQkoG4q+UkDPQkOssWg8INldt0gpGq6aM8/J91W8xIUVPyuoHL+fi4Q=
X-Received: by 2002:a05:6902:220b:b0:e72:89ac:b7c6 with SMTP id
 3f1490d57ef6-e74f8e7fb23mr347826276.47.1746039074175; Wed, 30 Apr 2025
 11:51:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319222744.17576-5-casey@schaufler-ca.com>
 <0211e4c6561bf2eabbad2bf75a760e03@paul-moore.com> <c53cf38a-f159-48b8-922a-550bd21b5951@schaufler-ca.com>
In-Reply-To: <c53cf38a-f159-48b8-922a-550bd21b5951@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 30 Apr 2025 14:51:03 -0400
X-Gm-Features: ATxdqUFt-c_vhDhdD3LFcCyct7_rWPW5hvTca5RmMG4EeWbCJDu41dKAKTCrllk
Message-ID: <CAHC9VhTbrk_XovghLTtqPUv3br9aJbn2YcnFyn3uugTUKAHNFw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] Audit: multiple subject lsm values for netlabel
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: eparis@redhat.com, linux-security-module@vger.kernel.org, 
	audit@vger.kernel.org, jmorris@namei.org, serge@hallyn.com, 
	keescook@chromium.org, john.johansen@canonical.com, 
	penguin-kernel@i-love.sakura.ne.jp, stephen.smalley.work@gmail.com, 
	linux-kernel@vger.kernel.org, selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 12:25=E2=80=AFPM Casey Schaufler <casey@schaufler-c=
a.com> wrote:
> On 4/24/2025 3:18 PM, Paul Moore wrote:
> > On Mar 19, 2025 Casey Schaufler <casey@schaufler-ca.com> wrote:
> >> Refactor audit_log_task_context(), creating a new audit_log_subj_ctx()=
.
> >> This is used in netlabel auditing to provide multiple subject security
> >> contexts as necessary.
> >>
> >> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> >> ---
> >>  include/linux/audit.h        |  7 +++++++
> >>  kernel/audit.c               | 28 +++++++++++++++++++++-------
> >>  net/netlabel/netlabel_user.c |  9 +--------
> >>  3 files changed, 29 insertions(+), 15 deletions(-)
> > Other than moving to the subject count supplied by the LSM
> > initialization patchset previously mentioned, this looks fine to me.
>
> I'm perfectly willing to switch once the LSM initialization patch set
> moves past RFC.

It's obviously your choice as to if/when you switch, but I'm trying to
let you know that acceptance into the LSM tree is going to be
dependent on that switch happening.

The initialization patchset is still very much alive, and the next
revision will not be an RFC.  I'm simply waiting on some additional
LSM specific reviews before posting the next revision so as to not
burn out people from looking at multiple iterations.  I've been told
privately by at least one LSM maintainer that reviewing the changes in
their code is on their todo list, but they have been slammed with
other work at their job and haven't had the time to look at that
patchset yet.  I realize you don't have those issues anymore, but I
suspect you are still sympathetic to those problems.

If you're really anxious to continue work on this RIGHT NOW, you can
simply base your patchset on top of the initialization patchset.  Just
make sure you mention in the cover letter what you are using as a base
for the patchset.

If that still doesn't offer any satisfaction, you can always
incorporate the feedback that I made in v2 that was ignored in your v3
posting :-P

--=20
paul-moore.com
