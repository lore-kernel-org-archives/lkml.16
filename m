Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F6A2853EB
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 10:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749206578; cv=none; b=fdRXIKWOtXIdjUHwQPKSmr2MnAuDNP6WpuOWV1iV3rBaY6xGvfWdOB8wXJwl68OT4CxWcCtDARmbOJQ7ihtMiwpkHEvL9kQaBy0/ybqCmHlgUgK/fTuGB+caT93iTd/taAPb/U4l+GbafPJaR6k95+ePmy4+yIP6ojcI8nLqcKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749206578; c=relaxed/simple;
	bh=vkmochM2SrgurI2OOeUhLIqKvSLPLxHe2qx4RPVkYM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dr+Ew+/YgXL6pZ1fXxmLCHKltvCR0bFyRcjAvVAiE9GJBwvP+ipV4jxZ+sH0DL9uXcDA+ynqadoBb2/Q38rS+G3oHYH4buPsKT12jxzrGw6yVmgHX3L8/WbEZ4MI5bSLF2RieWvSNLJfEn2vNS6/9MqA7JBjJfE3AES9DsVLMH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=YibZ/noB; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="YibZ/noB"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a376ba6f08so1157161f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 03:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1749206573; x=1749811373; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y+nokHFtXpu0WDXP27AgjIbn53JQRm7K0yzN0KncLEM=;
        b=YibZ/noBW9p5fbTljedjX37/LW/rNg2zIH6cr8A6m9dgCxyI/m2NBw1zs8mQZRGboO
         6LcQyjx1+X76kagCCIGGm8/grQR4hBJuAJ6+UR1rdLXT0W3dzk02Wzk281wQclxppJ6x
         FoPB95Z76o3ajldDZ4xQDn+QXazOexsRrOYD/01ICMknb6tGRTFpvXzJtmdMchDC9x4i
         hxG+SRAQ7fdav9+ofvxi4tRHytVAGHVZpIO5z5+UmoXOYi/AtxiNunHlEdA9UwRe6Pp+
         ul9bWJehKOO2uc3BGMJXjUS7C7YLrHB1zsRwb8lHSp0jybyOwUyWspHPG46U8Jezp1qx
         V3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749206573; x=1749811373;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y+nokHFtXpu0WDXP27AgjIbn53JQRm7K0yzN0KncLEM=;
        b=UtBokfZcsmuqLvHgnMMn8+o61O6wGHt3VYnZkYjZ8JvoanDAvXCUE9AFoMQgKFxfwG
         B4EwBXPqiuqHUljjSnX2lCUw72rzU00wjiQfATiKSQTlkUbJ8FVOSdfLWAdRM2n3N00m
         EAv+U0I1Jyd39f+/zm4R8QeSN6YLanlf+iqUAVmGltFQFn2zknr6yEpVrNSQfEn1Isi5
         qdQgKj1zC/6ifY8nNqfq9aUaM7ZL3zI355BMYXut3hOX4ThXzvav3/GOFIYLz/W1qlBx
         yo14fUljwe8hOE3Kiw8Prf/+fmTERjI8a3mrUBpnh2oz0wd6g3JM2qNjxiAv0WXE0ZAa
         iZ3g==
X-Forwarded-Encrypted: i=1; AJvYcCWq4ADjCdbxVriIHEJEzyVoo2S+/gb/BYzdl8p8wEfoHDaznKOQbUcxhtqDMAHPzjqj+T5Wau2Z5C8psfM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxOQGrN6N7lz7Rnmjkt5rp7dhbkiqdN//2zPVhoqxS/0cDHfuL
	n3IvxEUdeBelQ44YBnwUCIW+r+TY0kUAcxCG8HTZdINhv+dhYHzxAg/QL8aQbCPa8iQ=
X-Gm-Gg: ASbGncucQ1FylYIrwStDfdkCRSaJfwWzckdzcG1xgci1tBlHt5NA3BiV2t9u72PgHWb
	2cnyu8deC29sTtdTy94MluDT9oMHswNtk30Jpy/O0RGQIDy1UeRBlvZq9ReAhN+DAIHU+UjhuRB
	w+l/KcCIDn2du0ZQSGFVD0xXQelbUqj1NkvPR4hrswMPRXGnFrpTYGLAW1CC7S24WbxlwIqP8fQ
	2i8QLLvOtloPuNBxpCriIM448e2vMKOnG0TnhshRkebAtedZ2V9Ww7nd18++DohgdPzdVbRL1yf
	cco/qhwrRuk5E2LizfPra8+3grCVlTEcLMYE0gZfHR6x8VMS
X-Google-Smtp-Source: AGHT+IEtx3a0U8v1fBCckXwCRNLbBtPgODWu90k6CS+zdoTBmpVDSFh/aW2UVu82FYy50xGmDq3LCA==
X-Received: by 2002:a05:6000:2dc9:b0:3a3:6415:96c8 with SMTP id ffacd0b85a97d-3a5319a78fcmr2195820f8f.41.1749206573116;
        Fri, 06 Jun 2025 03:42:53 -0700 (PDT)
Received: from localhost ([2a02:8071:6401:180:da11:6260:39d6:12c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a5324361ffsm1461768f8f.47.2025.06.06.03.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 03:42:52 -0700 (PDT)
Date: Fri, 6 Jun 2025 12:42:48 +0200
From: Johannes Weiner <hannes@cmpxchg.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Jemmy Wong <jemmywong512@gmail.com>, Tejun Heo <tj@kernel.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	"open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v0] cgroup: Add lock guard support
Message-ID: <20250606104248.GA1118@cmpxchg.org>
References: <20250605211053.19200-1-jemmywong512@gmail.com>
 <CAADnVQJyATTb9GFyBhOy5V_keAO5NZ6+zucLRyN27Cmg2FGPVA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADnVQJyATTb9GFyBhOy5V_keAO5NZ6+zucLRyN27Cmg2FGPVA@mail.gmail.com>

On Thu, Jun 05, 2025 at 05:54:15PM -0700, Alexei Starovoitov wrote:
> On Thu, Jun 5, 2025 at 2:11 PM Jemmy Wong <jemmywong512@gmail.com> wrote:
> >
> > This change replaces manual lock acquisition and release with lock guards
> > to improve code robustness and reduce the risk of lock mismanagement.
> > No functional changes to the cgroup logic are introduced.
> >
> > Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
> >
> > ---
> >  include/linux/cgroup.h     |   7 +
> >  kernel/bpf/cgroup.c        |  96 +++---
> >  kernel/bpf/local_storage.c |  12 +-
> 
> Nack for bpf bits.
> It only uglifies the code.

I agree with this.

The extra indentation from scoped guard is unfortunate.

The guard with implicit unlock gives me the heebeejeebees - it's
asymmetric and critical sections don't stand out visually at all.

Adjusting critical section boundaries with guard means either:
* indentation churn to convert to scoped guard,
* forcing abstraction splits along critical sections (non-API
  _locked functions), which makes the code flow harder to follow,
* or straight-up violating abstraction layering and adding
  non-critical stuff to callers where it doesn't make sense.

I don't remember the last production bug from forgetting to drop a
lock. Meanwhile, the things that people actually seem to struggle with
when it comes to locks appear to become harder with those primitives.
