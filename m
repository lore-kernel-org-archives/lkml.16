Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35200163
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 11:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746273299; cv=none; b=oea9X5kQJbPWUYPFERLbIsHj/jglLri5LsEJMkAdPEtKJ9OEKQ1jRAnxMSN+gFB20nIJl6umtkjwLADjSQGPeOKkexFXas7SZx+EliouokPLI54hRsJI1BxBgPdbEylr7hNGfdRtLA2jegdTxHMqKxw5rFlCQnlzHfD1pZ93v/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746273299; c=relaxed/simple;
	bh=5CjXQsdqWAg+gyidCgo9GoCdIerm0eyLNvlKuMOG1kk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ojv/jrkc+2NE6GiIIcPr7AkuNKYltJuA9ifftKluLYUzMdUhtkq7y+WeRe8n8l6Cq7GhTOa0LU94lNxbGMzs87Nqh5JLNCLBSLXTuMQwSQV2joTsNtAPSYsCtAdgU8diIdWRqL4g4xK/sK60xLTMVhi7icaRAQG0y5RdTBnpZX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=iA1otZ0X; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="iA1otZ0X"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7UELWRjZ/SlrrzAPPhew+mZufs5Uy/ZW6LtuMmduX3Q=; b=iA1otZ0XxE/DRuiT6t8hDI/4hH
	bA940Y/88rDA6tVEe2SSexOqcvey0EiIQ14OH18I0OxnckyyemHak7PWm2tKKiXfQFmlGLyjUEnh1
	/iJ6Gx6B/n98SR8741saU91ELEgll2aeCfDdZaviNeJ6GEdUPBvon5Vt7xsHp0i6BZzvwVLzbyDSS
	NETM1p5c5/EiRu3B0FiLN6D13CFTAgC4ZkYhjA7skM84Iiyn/Yws1QDYV6RY2EkbfElxxPGkBX1/z
	T17X2dq0STjCtjPTrE6DDfcKEpIOeHZVMfi9PshLqUgcwCixMxidtX4Gg25RdFUUTv0/AvJ35ejo4
	yO0D3Lsw==;
Received: from [213.55.184.223] (helo=[10.164.176.253])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1uBApb-005L19-Ey; Sat, 03 May 2025 12:14:55 +0100
Message-ID: <f532441d8b3cf35e7058305fd9cd3f2cbd3a9fac.camel@codethink.co.uk>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
From: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Vineeth Pillai <vineeth@bitbyteword.org>,
 Luca Abeni	 <luca.abeni@santannapisa.it>
Date: Sat, 03 May 2025 13:14:53 +0200
In-Reply-To: <aBTO3r6Py_emwf1Y@jlelli-thinkpadt14gen4.remote.csb>
References: <ce8469c4fb2f3e2ada74add22cce4bfe61fd5bab.camel@codethink.co.uk>
	 <aBTO3r6Py_emwf1Y@jlelli-thinkpadt14gen4.remote.csb>
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

Hi Juri

Thanks for getting back to me.

On Fri, 2025-05-02 at 15:55 +0200, Juri Lelli wrote:
> Hi Marcel,
>=20
> On 28/04/25 20:04, Marcel Ziswiler wrote:
> > Hi
> >=20
> > As part of our trustable work [1], we also run a lot of real time sched=
uler (SCHED_DEADLINE) tests on the
> > mainline Linux kernel. Overall, the Linux scheduler proves quite capabl=
e of scheduling deadline tasks down
> > to a
> > granularity of 5ms on both of our test systems (amd64-based Intel NUCs =
and aarch64-based RADXA ROCK5Bs).
> > However, recently, we noticed a lot of deadline misses if we introduce =
overrunning jobs with reclaim mode
> > enabled (SCHED_FLAG_RECLAIM) using GRUB (Greedy Reclamation of Unused B=
andwidth). E.g. from hundreds of
> > millions of test runs over the course of a full week where we usually s=
ee absolutely zero deadline misses,
> > we
> > see 43 million deadline misses on NUC and 600 thousand on ROCK5B (which=
 also has double the CPU cores).
> > This is
> > with otherwise exactly the same test configuration, which adds exactly =
the same two overrunning jobs to the
> > job
> > mix, but once without reclaim enabled and once with reclaim enabled.
> >=20
> > We are wondering whether there are any known limitations to GRUB or wha=
t exactly could be the issue.
> >=20
> > We are happy to provide more detailed debugging information but are loo=
king for suggestions how/what
> > exactly to
> > look at.
>=20
> Could you add details of the taskset you are working with? The number of
> tasks, their reservation parameters (runtime, period, deadline) and how
> much they are running (or trying to run) each time they wake up. Also
> which one is using GRUB and which one maybe is not.

We currently use three cores as follows:

#### core x

|sched_deadline =3D sched_period | sched_runtime | CP max run time 90% of s=
ched_runtime | utilisation | reclaim |
| -- | -- | -- | -- | -- |
|  5 ms  | 0.15 ms | 0.135 ms |  3.00% | no |
| 10 ms  | 1.8 ms  | 1.62 ms  | 18.00% | no |
| 10 ms  | 2.1 ms  | 1.89 ms  | 21.00% | no |
| 14 ms  | 2.3 ms  | 2.07 ms  | 16.43% | no |
| 50 ms  | 8.0 ms  | 7.20 ms  | 16:00% | no |
| 10 ms  | 0.5 ms  | **1      |  5.00% | no |

Total utilisation of core x is 79.43% (less than 100%)

**1 - this shall be a rogue process. This process will
 a) run for the maximum allowed workload value=20
 b) do not collect execution data

This last rogue process is the one which causes massive issues to the rest =
of the scheduling if we set it to do
reclaim.

#### core y

|sched_deadline =3D sched_period | sched_runtime | CP max run time 90% of s=
ched_runtime | utilisation | reclaim |
| -- | -- | -- | -- | -- |
|  5 ms  | 0.5 ms | 0.45 ms | 10.00% | no |
| 10 ms  | 1.9 ms | 1.71 ms | 19.00% | no |
| 12 ms  | 1.8 ms | 1.62 ms | 15.00% | no |
| 50 ms  | 5.5 ms | 4.95 ms | 11.00% | no |
| 50 ms  | 9.0 ms | 8.10 ms | 18.00% | no |

Total utilisation of core y is 73.00% (less than 100%)

#### core z

The third core is special as it will run 50 jobs with the same configuratio=
n as such:

|sched_deadline =3D sched_period | sched_runtime | CP max run time 90% of s=
ched_runtime | utilisation |
| -- | -- | -- | -- |
|  50 ms  | 0.8 ms | 0.72 ms | 1.60% |

jobs 1-50 should run with reclaim OFF

Total utilisation of core y is 1.6 * 50 =3D 80.00% (less than 100%)

Please let me know if you need any further details which may help figuring =
out what exactly is going on.

> Adding Luca in Cc so he can also take a look.
>=20
> Thanks,

Thank you!

> Juri

Cheers

Marcel
