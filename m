Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4691207E1D
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 11:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738669482; cv=none; b=X6NSrl74xke0Y7mQso5Lz8brr3mLYlSawWy/h4GnBKBbwyrL0DXXnzEHBim0tCdB6kFsmHpbxeB8AQCcbTfNG7BZiW5g3UV3w5FC5q0G1gOgLFCQasgcSEZvEbIqaCqrsJzLR/l9zVly/FjceGb3Hodu6tkyxw4N18kY5Rmngvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738669482; c=relaxed/simple;
	bh=mN7tslh+i2S6HSh5V2VOg1tYyph90nCPYwFf0QHyu/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fj0rKJ0SwxGL2xTGYE6Ef6QqT0YwMJkgkbRtLZhxwPvcY+ju4/8E/8TVjn3zthfi/OXfXtK2RQJcLYHXyCedrcoQIBrd0nv4X6HZQzy6wEWbwazg8rWW6YK7p0/X5wKDmnaAHtBbxesVXUxf8BcuYk+8m7I1RB5bCGA5uextRxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aA7eikKr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aA7eikKr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738669479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s9iIjxxwva3fm5ewtrniN91za3PWyU6iE2xOK2M8hJs=;
	b=aA7eikKr0O3t/r64cqKRVygGg7iiLC8zbmV9Mc0bM9xvmuzCvbyrdAzK39GvM6/37511yH
	WHLfNOHfAa0rEpxTLCMiM41g4wun1dsx+z+hy3Bm6UENaqa5+cgeRuxCCoj4swlPC69zwe
	xGE8WSv7tGgWFSY4gty7YPS7rDsJfeY=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-jzUHNizOMpWUfW0zm9q_mQ-1; Tue, 04 Feb 2025 06:44:38 -0500
X-MC-Unique: jzUHNizOMpWUfW0zm9q_mQ-1
X-Mimecast-MFC-AGG-ID: jzUHNizOMpWUfW0zm9q_mQ
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2f9c1b95ed9so1891517a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 03:44:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738669477; x=1739274277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9iIjxxwva3fm5ewtrniN91za3PWyU6iE2xOK2M8hJs=;
        b=nw8/xj9NqdEK8sbH4Rgj2Fq2ZYy/jjLWjk0fHgQx59gpdFo1AqvRmhG3xGzsjqBNjX
         9aFIi1K/rNyFdrseOdkNyRrhHoBKLrYlEIwGnlbW1zZvY44jzPuMT0qayfGKnubpOneB
         euBRYwUOS9rnTw6xbo74bzTgUbSPa5xJJxCcKhdsJ/pqLwfCooBuL2iyzHRRqb5+XhMn
         m/pyVItg7SA5xOMyFD89nH/ZFBUq1sIQBzUQpvDpfsVH8Q4Z1r7OcY8qmBDnY3MOejcd
         ZXm3y0yaDT5PCAb/n0f0dNHz/beTKh1BwWqWSpuyoX6CojEBlZT+ScUx1uFdUh/MsFn8
         rQtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv7xYAI4bhGKLOvwRcFpw2xgc5B+cfvsYMuREuDE5EwQHGmSEPpRY9WkGmDpOLY1tlqJpjWn29cCX4vLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhshduXQOVuNKLkPxHusGsN7DiVWYjuqaS82JMiseusDbkWdRg
	2u3ehU0cP2W2ulwBAXVAxBqJaODHvENnXf0phqGqr1kj6GwuPQaNeb6wteNu198RfxCUvE0ma4b
	FTl67Ynd1/9hoZ4Kg+gxNXTTiSNTrPbD9kDLEh5lu1ycNRg5MqBURhJ6GNGHWqss1bi4kJjIKQE
	upke9APE4sgSk9iK5tz+IGFgrQV86ysf8LsxGM
X-Gm-Gg: ASbGncs5pAq+3g1liqilNNMut1iRzljLAGVNPYGBGvDguzUdAT5BaBEQOrkfNAVQZd+
	73HAUTK2fKV23Z5effjt0HBz2ronQuLo5SHf4cEiJc4wY/xj/CR79aZKlW7UTs7wjMMCpSuz2z3
	cnYOd5P2U3VGLzM4bFF5U4
X-Received: by 2002:a17:90b:264e:b0:2ee:f80c:6892 with SMTP id 98e67ed59e1d1-2f83abb3532mr35197891a91.3.1738669477476;
        Tue, 04 Feb 2025 03:44:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFT1215YnlE/ZrpMQgdXRPpcUHi+R5LKcJT0ZErl0b04QYANkPy1LfVqSEokWJgpg/IOvaQL+JB/pyKlW4LRIs=
X-Received: by 2002:a17:90b:264e:b0:2ee:f80c:6892 with SMTP id
 98e67ed59e1d1-2f83abb3532mr35197867a91.3.1738669477224; Tue, 04 Feb 2025
 03:44:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117125522.99071-1-lukas.bulwahn@redhat.com> <20250204113614.GD893@willie-the-truck>
In-Reply-To: <20250204113614.GD893@willie-the-truck>
From: Lukas Bulwahn <lbulwahn@redhat.com>
Date: Tue, 4 Feb 2025 12:44:25 +0100
X-Gm-Features: AWEUYZlGlZEjRarXyn4DMZdt0GYLGOVYedjIdYC8RRdsZP_eC31hKcwXeaYXrKs
Message-ID: <CAOc5a3O-8wrQq3oNJC+H9ncFt0yxcm4O+QSgPk4QckF6Ak5pGg@mail.gmail.com>
Subject: Re: [PATCH] arm64: Kconfig: Remove selecting replaced HAVE_FUNCTION_GRAPH_RETVAL
To: Will Deacon <will@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-trace-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 12:36=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
> On Fri, Jan 17, 2025 at 07:55:22AM -0500, Lukas Bulwahn wrote:
> > From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> >
> > Commit a3ed4157b7d8 ("fgraph: Replace fgraph_ret_regs with ftrace_regs"=
)
> > replaces the config HAVE_FUNCTION_GRAPH_RETVAL with the config
> > HAVE_FUNCTION_GRAPH_FREGS, and it replaces all the select commands in t=
he
> > various architecture Kconfig files. In the arm64 architecture, the comm=
it
> > adds the 'select HAVE_FUNCTION_GRAPH_FREGS', but misses to remove the
> > 'select HAVE_FUNCTION_GRAPH_RETVAL', i.e., the select on the replaced
> > config.
> >
> > Remove selecting the replaced config. No functional change, just cleanu=
p.
> >
> > Fixes: a3ed4157b7d8 ("fgraph: Replace fgraph_ret_regs with ftrace_regs"=
)
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> > ---
> >  arch/arm64/Kconfig | 1 -
> >  1 file changed, 1 deletion(-)
>
> Hmm. There are still a couple of CONFIG_HAVE_FUNCTION_GRAPH_RETVAL guards
> kicking around:
>
> include/linux/ftrace.h:#ifdef CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
> kernel/trace/fgraph.c:#ifdef CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
>
> so it's not clear we can just remove the option from arm64 without
> breaking ftrace_return_to_handler(). What am I missing?
>

Will,

I believe you are looking at a tree, which did not include commit
a3ed4157b7d8 ("fgraph: Replace fgraph_ret_regs with ftrace_regs") yet.

A quick look:

$ git checkout  a3ed4157b7d8~1
HEAD is now at 41705c4262aa fgraph: Pass ftrace_regs to entryfunc
$ grep "CONFIG_HAVE_FUNCTION_GRAPH_RETVAL" . -R
./include/linux/ftrace.h:#ifdef CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
./kernel/trace/fgraph.c:#ifdef CONFIG_HAVE_FUNCTION_GRAPH_RETVAL

$ git checkout  a3ed4157b7d8
Previous HEAD position was 41705c4262aa fgraph: Pass ftrace_regs to entryfu=
nc
HEAD is now at a3ed4157b7d8 fgraph: Replace fgraph_ret_regs with ftrace_reg=
s
$ grep "CONFIG_HAVE_FUNCTION_GRAPH_RETVAL" . -R
$

Once commit a3ed4157b7d8 ("fgraph: Replace fgraph_ret_regs with
ftrace_regs") is applied, grepping for
CONFIG_HAVE_FUNCTION_GRAPH_RETVAL should not have any further use of
that config.

I was looking at linux-next at the time of writing that patch.

Lukas

