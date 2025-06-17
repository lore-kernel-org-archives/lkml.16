Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C37A1F5828
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 22:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750198519; cv=none; b=R4IYcaZ54ZOW6DmZET8vomqZblvpaJc/vJNDYmKnueuG7IuCITiBE+4cn8slRNB6zVR05z9lc457wi9+YPgiA2Lh3iBHHoPFlLP4sh5eZm4MB8eFfcHxbtwRg+f/p6y3K9JsAkOifqfovpEbCYZR392EmzFBRprrC3gu95+88zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750198519; c=relaxed/simple;
	bh=c0MNaMding3voNo3iR/0QNnfN9F6WyYGN7tTzyJ2TWE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=leW1soz4ehCJED1Wbf/EPXHNSN/NrEZoKGuMaI5LZzUBNPXtS8QlWyFTYE7usA/SQPsqZLhv9Jmgqyzk+XGyTcTNTlCs0Lo6S+KCSBGnkwwUd+lu/DXy9WRIna7UDKMuSDFsoolytUq1k44NYBP9tcQKBQ4RsjK+dpNm9T5H+LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--paullawrence.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CaWvqUB3; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--paullawrence.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CaWvqUB3"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-313fab41f4bso4860068a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750198515; x=1750803315; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cxl+kwKVqjyvT/nu1rNj4Skgg23PRS8cBlmGvckwlhY=;
        b=CaWvqUB3WaW0IbiEDGGe2/knK+DpAymxJ3/2vcx5vh9T0VrA1tlGSu44J1uS2mf2Vp
         xH7bHNUhUMjgx/YZPHMrnBUdxOjC6M60PNulQW3y5DGR8+97CvCJorISeetSj9YXy0Ip
         cLx2YYRXC2PPPTW8H/3xNJOY3owATOK11PLGP1YC3cn954J/7/hJHPk4af2DwIFAW4b5
         YG4nDGo6FyZqR7sijdnRreB4BekgNI363qu166qzKmAK7GXUvDTOt6ltL7LbSCwDkHma
         O4+8baenOZ3KHoXUZLpSnbhj+hGaaHn2/F2Zl/ZlHTemEezEN+WTY68Y9KXLR876PBUH
         aCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750198515; x=1750803315;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxl+kwKVqjyvT/nu1rNj4Skgg23PRS8cBlmGvckwlhY=;
        b=SUulO3r6e/2YYpcGf0gI7Qfn68J56eQ+cKJKLCliimqlPcxvhGcXEffC7PCPFHGLDy
         NT1HKdyDCdo/z3f882hNwHJBoHT67PFCpDzTDMCt+8tva30798WxTTS5QCL1kqjzwrbD
         b3smkSxfEO1ohIUZl3jx55PA7k3cW5Si2hIO+XY+Gj0ZZBADjiBuYBp7Gm/VXqeGfpkJ
         MdEEtplxPHbW5NOqjes9D6zYKvQQVloneTYxCMyIoFPWHKHRjhp90RcdtDkhh7w++eFO
         ANyjo3c5a7RDonypW6zMdNvbnLUsVzOdQISQHRS/WjtO1IOhj1e8RHJQuhJngQN72+YI
         8r9Q==
X-Gm-Message-State: AOJu0YzU5V6MdeVm+muOQrLKS550O86EKuCzAzhWOMh4kgjuK99OFca4
	TIKUnO+aKjuIEVJeMcf2VmwMn836i6wD9bLcJgiA8/G6SlSG2S6z6tbWr/yrK7E7AuuDGc1whMv
	6jZLFfMlTayHfV6PpzkZRMcxoAJqywQ==
X-Google-Smtp-Source: AGHT+IH9HQM0vcszPINZ5N3o0BH6niLOJ3JMv+4bB5SHG+D+SpR+2xXkA4w53B91ufCZAsEaEvV3umnB4D3GTEDCdVA=
X-Received: from pjzz13.prod.google.com ([2002:a17:90b:58ed:b0:2fe:800f:23a])
 (user=paullawrence job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2d47:b0:312:db8f:9a09 with SMTP id 98e67ed59e1d1-313f1c380f7mr27765761a91.14.1750198515563;
 Tue, 17 Jun 2025 15:15:15 -0700 (PDT)
Date: Tue, 17 Jun 2025 15:14:52 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250617221456.888231-1-paullawrence@google.com>
Subject: [PATCH v1 0/2] RFC: Extend fuse-passthrough to directories
From: Paul Lawrence <paullawrence@google.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Paul Lawrence <paullawrence@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is the first part of a much larger patch set that would allow a direct=
ory
to be marked =E2=80=98passthrough=E2=80=99. At a high level, the fuse daemo=
n can return an
optional extra argument to FUSE_LOOKUP that contains an fd. Extra fields ar=
e
added to the fuse_dentry, fuse_inode and fuse_file structs to have a backin=
g
path, inode and file respectively. When fuse is performing an operation, it=
 will
check for the existence of a backing object and if it exists forward the
operation to the backing object.

These two patches add the core infrastructure, handling of the extra argume=
nt
response to lookup, and forwarding open, flush and close to the backing fil=
e.
This is sufficient to validate the concept.

The questions I have:

* Is this something that interests the fuse maintainers and community?
* Is this approach the correct one?
* (if we agree yes to 1 & 2) Detailed analysis of the patches for errors.

A few observations:

I have matched backing objects to their fuse objects. Currently fuse passth=
rough
puts a backing file into the fuse inode. I=E2=80=99m not quite sure why thi=
s was done -
it seems to have been a very late change in the passthrough patch sets whic=
h
happened without comment. It does not really make sense for full directory
passthrough since unopened inodes still need to have backing inodes. The on=
e
advantage I can see is that it reduces the number of opens/closes of the ba=
cking
file. However, this may also be a disadvantage - it moves closes, in partic=
ular,
to an arbitrary point when the inode is flushed from cache.

Backing operations need to happen in the context of the daemon, not the cal=
ler.
(I am a firm believer of this principle.) This is not yet implemented, and =
is
not (currently, and unfortunately) the way Android uses passthough. It is n=
ot
hard to do, and if these patches are otherwise acceptable, will be added.

There was a long discussion about the security issues of using an fd return=
ed
from the fuse daemon in the context of fuse passthrough, and the end soluti=
on
was to use an ioctl to set the backing file. I have used the previously-rej=
ected
approach of passing the fd in a struct in the fuse_daemon response. My defe=
nse
of this approach is

* The fd is simply used to pull out the path and inode
* All operations are revalidated
* Thus there is no risk even if a privileged process with a protected fd is
tricked into passing that fd back in this structure.

I=E2=80=99m sure we will discuss this at length if this patch set is otherw=
ise deemed
valuable, and I am certainly not wedded to this approach.

I have written tests to validate this approach using tools/testing/selftest=
s. I
don=E2=80=99t want this patch set to get derailed by a discussion of the wa=
y I wrote the
tests, so I have not included them. I am very open to any and every suggest=
ion
as to how (and where) tests should be written for these patches.

Paul Lawrence (2):
  fuse: Add backing file option to lookup
  fuse: open/close backing file

 fs/fuse/Kconfig           |  13 +++++
 fs/fuse/Makefile          |   1 +
 fs/fuse/backing.c         |  97 ++++++++++++++++++++++++++++++++
 fs/fuse/dev.c             |  14 +++++
 fs/fuse/dir.c             | 108 +++++++++++++++++++++++++-----------
 fs/fuse/file.c            |  34 ++++++++----
 fs/fuse/fuse_i.h          |  61 +++++++++++++++++++-
 fs/fuse/inode.c           | 114 ++++++++++++++++++++++++++++++++++----
 include/uapi/linux/fuse.h |   4 ++
 9 files changed, 392 insertions(+), 54 deletions(-)
 create mode 100644 fs/fuse/backing.c

--=20
2.49.0.1112.g889b7c5bd8-goog

