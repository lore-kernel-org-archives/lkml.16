Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCD0EEBA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 15:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751557225; cv=none; b=SO0sbYpU/vBuVwuycYCmdTerEyqKoMfybeNfarLTM4LmRCHlaZ3Ot5mDYCglYXBgm2qizzhhwfHuJOSZlnYxSOOsOA+7XrhD3Qxvy90AV6og/qhEesxu/p1Np/5syQxWFKvbyoFfpYl/nDN69xRksuiinKrwkSK/Ixo0/kTa0lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751557225; c=relaxed/simple;
	bh=yOM+krPgVElrXVhBV3ACPlHHM5rdYmWM3Pp0c4HFd9A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bGY0jiODcrVsUmnZXDzyzGdBhsgXB3slTtBm8Gz/poHf7jcYcaUbK6rPj16O6B63Ga3KF+nhH1Un8TaP4lhqRQMzOuvnWrgg2Bg0FA9etV9nQCy8wfsAef/9vFTIbRYd45c0oBSRxsrNqbvd5h2Zc0P+KPF4IOCN/RP1GyXhT+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf02.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 9E45D57D51;
	Thu,  3 Jul 2025 15:40:21 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf02.hostedemail.com (Postfix) with ESMTPA id 8F64F80018;
	Thu,  3 Jul 2025 15:40:19 +0000 (UTC)
Date: Thu, 3 Jul 2025 11:40:18 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: ChenMiao <chenmiao.ku@gmail.com>, Linux RISCV
 <linux-riscv@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: ftrace: Fix the logic issue in DYNAMIC_FTRACE
 selection
Message-ID: <20250703114018.6fab0b8a@batman.local.home>
In-Reply-To: <f7e12c6d-892e-4ca3-9ef0-fbb524d04a48@ghiti.fr>
References: <20250703084502.394406-1-chenmiao.ku@gmail.com>
	<f7e12c6d-892e-4ca3-9ef0-fbb524d04a48@ghiti.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8F64F80018
X-Stat-Signature: 337nu41neghadpzgkp4py9ztx3ptutkm
X-Rspamd-Server: rspamout06
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19TlT3ADYdjeXFGToxE/uqypYY2UNZ/4xU=
X-HE-Tag: 1751557219-393174
X-HE-Meta: U2FsdGVkX19LOQBeYMzHh19K/rBYoZ8kOEYb9FvJMLi9jVWvGqrEMxTIAYppmJ3t3iBm2jaWZ6V6T68FZqpWQzsNucu4+o66ObjslxXg6BvhJ3R7U2HiYByJZ1rT4SEFdCBHTJt858HWv3oGzlnSNDa6g0aLScjCGxIb6xiehBMMtbn0BnH0QfkrWcsf6L434WR4nqrio7JJeCR69UM9B+Laz1wS563qWdQvkmHjQDtwPLoaJmDEglAi3BZ4EXvlODwX2y94jzOqpS8EZ4u1a19PjoFowBvvbLsLsuG2fvSYQhiDc+kqbabxL2gV3V/A0rGRrJ/BVvJ70HlM5R1mtmAKpVbyKA7n

On Thu, 3 Jul 2025 15:00:02 +0200
Alexandre Ghiti <alex@ghiti.fr> wrote:


> 
> We could support static ftrace, but I don't think we should, so I agree 
> with this patch. In fact I had just prepared a patch for this here 
> https://github.com/linux-riscv/linux/pull/556/commits/0481092a5bec3818658981c11f629e06e66382b3 
> which is a bit more complete since I have removed some dead code.
> 
> Let's see what other people think about supporting static ftrace, I have 
> added Steven in cc if he has an opinion.

Yes, please only support the dynamic ftrace. The static is there only
to help archs to get ftrace up and running. Once dynamic is supported,
static should not be used.

Hmm, maybe I should just remove the prompt for DYNAMIC_FTRACE.

That is, once it is supported by an architecture, it should be the only
thing used.

-- Steve
