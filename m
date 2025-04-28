Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk [78.40.148.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DD219309C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 18:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.40.148.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745865523; cv=none; b=uBo9IOniwBnnyqoy/Ha/JaG7d3DZo8orY+iCtoIzIufhu5GhjlegScJVPRs18YwDIqCpODW3JVBdCHNOZTqxvhYwlibzu8KblgR0dGAnpA8IMfqQirpyKKKA7F82dsPha4MKtKfH4ntIHSDddW+gBks/TEo3VzXZ7NPIlwFsvgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745865523; c=relaxed/simple;
	bh=cpr+K50FvyrzLvic4cLoc4/7aJPGb+L/hXE3lTuub7A=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=pZKrbFAjqJyFCF77vUDrzQes1NoSIkCtarB1k3V9smL4vXeJ1ZRkxjg4O3kYvTRm22txE5GH8Iv+h+YKRmEB94S17wjUd2qKxDnA6GkMmqY3apcdysakrSala16LWOXzQojLsxetRQZJhEhRqqQePUfgRJRGB/1Z22F4mTYq+2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=Cv9hFcmB; arc=none smtp.client-ip=78.40.148.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="Cv9hFcmB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cpr+K50FvyrzLvic4cLoc4/7aJPGb+L/hXE3lTuub7A=; b=Cv9hFcmBwvHcyWGbRiFnQy8WIN
	0r0FQo7fDiWwOvwM0LOkpldO6r9+tlP4NksaJPZS7waz9NBl+6CuX3dp3NGLQDC7qjrb/g7KPuJSB
	zMHXqye63cfZQqg9Wq0um+IO7shc2semqmuPRiekbvQgTzl1WjyxfE0BkfOJMTGPscpOMLApYomob
	lkiHjtVIrHHzbHxoPuLrVnkqXcWOE4D0M113/kw19WAfPZ724vGokNL0X3QqoiT2P4PFbZRCQ14PY
	6wCf8T57XHXIbF6QqD6iPaAXIeen2p02lWZIXH7loMdScmWESmBIyVrX913K2C4t/RKx0MJv5cue2
	Ul6V7o5Q==;
Received: from [167.98.27.226] (helo=[10.17.3.58])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1u9Spt-003QV4-RP; Mon, 28 Apr 2025 19:04:10 +0100
Message-ID: <ce8469c4fb2f3e2ada74add22cce4bfe61fd5bab.camel@codethink.co.uk>
Subject: SCHED_DEADLINE tasks missing their deadline with SCHED_FLAG_RECLAIM
 jobs in the mix (using GRUB)
From: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, Vineeth Pillai
 <vineeth@bitbyteword.org>, Daniel Bristot de Oliveira <bristot@kernel.org>
Date: Mon, 28 Apr 2025 20:04:09 +0200
Organization: Codethink
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Sender: marcel.ziswiler@codethink.co.uk

Hi

As part of our trustable work [1], we also run a lot of real time scheduler=
 (SCHED_DEADLINE) tests on the
mainline Linux kernel. Overall, the Linux scheduler proves quite capable of=
 scheduling deadline tasks down to a
granularity of 5ms on both of our test systems (amd64-based Intel NUCs and =
aarch64-based RADXA ROCK5Bs).
However, recently, we noticed a lot of deadline misses if we introduce over=
running jobs with reclaim mode
enabled (SCHED_FLAG_RECLAIM) using GRUB (Greedy Reclamation of Unused Bandw=
idth). E.g. from hundreds of
millions of test runs over the course of a full week where we usually see a=
bsolutely zero deadline misses, we
see 43 million deadline misses on NUC and 600 thousand on ROCK5B (which als=
o has double the CPU cores). This is
with otherwise exactly the same test configuration, which adds exactly the =
same two overrunning jobs to the job
mix, but once without reclaim enabled and once with reclaim enabled.

We are wondering whether there are any known limitations to GRUB or what ex=
actly could be the issue.

We are happy to provide more detailed debugging information but are looking=
 for suggestions how/what exactly to
look at.

Any help is much appreciated. Thanks!

Cheers

Marcel

[1] https://projects.eclipse.org/projects/technology.tsf
