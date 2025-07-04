Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12782D948A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 12:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751632912; cv=none; b=ZFI0WLZ2LrfxxZxRBZXthoLdjoeZar3IykumQDvEAKNLYSa1OSt8buDM7i3rwKFoq3iPkx+emQRAEwJBUz0AhgEm/3vQD6Q82OdzOr+D3+ukfLNwUmJYoOlwcC5sElY5mreI+ycrcWm9mYM+XNrI7M9T7VCnmSgZzM7Vf/8yZtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751632912; c=relaxed/simple;
	bh=umaIK1M8/yYpjA+tQ4iI4mIN5efEWzCk7U4+ydrdDCM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ZPUpu+dT/Y7enNvz4q6IQ8YuzbdPQLXZIKDwxqyiZYzkuzP0PdWhrTNZTGL4BYEy6yiADZ5BdtLDQo7P5IP1tFDJd9TgYE8KzRnS4VKnDi3GV+Z5lHwzy3sPVTluAp9RR3PB1roAsYWp+U9YLkRM+DG7n5CIMg4IYnCYSxMg5dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 5B07D140BFE;
	Fri,  4 Jul 2025 12:41:48 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf01.hostedemail.com (Postfix) with ESMTPA id 8031960016;
	Fri,  4 Jul 2025 12:41:46 +0000 (UTC)
Date: Fri, 04 Jul 2025 08:41:46 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Alexandre Ghiti <alex@ghiti.fr>, Miao Chen <chenmiao.ku@gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_riscv=3A_ftrace=3A_Fix_the_lo?=
 =?US-ASCII?Q?gic_issue_in_DYNAMIC=5FFTRACE_selection?=
User-Agent: K-9 Mail for Android
In-Reply-To: <8160f56d-967d-4fa0-b996-0e0a2aa8be20@ghiti.fr>
References: <20250703084502.394406-1-chenmiao.ku@gmail.com> <f7e12c6d-892e-4ca3-9ef0-fbb524d04a48@ghiti.fr> <20250703114018.6fab0b8a@batman.local.home> <5ac2c90c-5907-40ce-a31e-05cb6d88fa52@ghiti.fr> <CAKxVwgeDcqo83ZV+xBcHwNuMk6yeU+yp7RYo22OARAVOBgrsJQ@mail.gmail.com> <8160f56d-967d-4fa0-b996-0e0a2aa8be20@ghiti.fr>
Message-ID: <8800ABB4-8A14-46E4-90D1-7F121205AF78@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Stat-Signature: ixmdqxxrgnhoouzhxnkw99mtnxooxira
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 8031960016
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/MhaBri32Bw54W6u2p0Zn8VPzRsDfcHLs=
X-HE-Tag: 1751632906-632877
X-HE-Meta: U2FsdGVkX1/TAFbx0NIrciBh27+SNmLwVSW2k0Rv0aRarae54Ng83H3ZBUcRpjEoZ7OFy1qgKOt2bQmjv1xjwu6TlD8CQa3uCMFD/S01geJ44lasN5R1ycfd+THZNSdzUkZ923ZSvfautxhVvCn6Ihy2TAtlsZHeKWoTcwwZEfbueKSSQsVVaLuFmFvL1JiSPgLINaxZco5JMtqmmbJYqF/i0ms/FZkfSysl6WKYH+HKktV/LHSSWwD9meM2oSMiC68qBDYNLxGJLebUC6QRXFtd87mSM5SGqIk4gKPqPOJ8Y+vPxAXkSGt6opfxgR2iOfg5IUWPvqX0NEyPFHEfFgruOYegBuZ0



On July 4, 2025 8:28:31 AM EDT, Alexandre Ghiti <alex@ghiti=2Efr> wrote:
>Hi Chen Miao,
>
>On 7/4/25 04:06, Miao Chen wrote:
>> Hello Alex,
>>=20
>> Should I wait for Steven to finish his work before starting mine? He se=
ems to be refactoring a lot of CONFIG logic, which might cause conflicts=2E
>
>
>I would say no, don't wait for Steven since his work won't land in 6=2E16=
, we need a fix to prevent build failures for this release=2E
>

Agreed,

-- Steve

>
>>=20
