Received: from mail-il1-f228.google.com (mail-il1-f228.google.com [209.85.166.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9925D7080E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 22:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745966781; cv=none; b=eLDGzA8GAis3sYzpjw1jIWdUoN8JqG5kqnui7xdLfpn1uRVkauaqg6Vt/ep3sPOXlOlju1IDooCD60vWmM0SOudiwYxZqPPtLXwj7609pOZ5dXZH0JVYjh0sATmZaosclsdKqyu/gimk+FSKvP1918WJbQ8HajkJOvuI31JF8TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745966781; c=relaxed/simple;
	bh=YQGldYYZN+M+lMKEvXamPZpN40rNMsoWh5qt4/JT0LA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zl7PiUxXkCbAOXD09gBzMBLr16eJABeRu1VP4dzDAAOpk1hWSvOh3y28QrIX0gDi1oeHj8UKQInp5H1RheWTYQHzy/XJtYGTbiKbwK4znnLCnjmZkEnrYaiKtAR0Nv4KFns0qsBlsT0BrZfNnXR/uXPsXuX9U9j7mNUfBjtBl7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=eEnYViyt; arc=none smtp.client-ip=209.85.166.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="eEnYViyt"
Received: by mail-il1-f228.google.com with SMTP id e9e14a558f8ab-3d91db4f0c3so32074555ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745966776; x=1746571576; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCGCCKXBocwMhtCNRTkeUsgiaS7jZ1hs+w86svHkyjs=;
        b=eEnYViytMzkG/tKt//nQPEIKIurRr5yfH+7MFcgmbfjzoaZRjAksLm+vk2PI0yNJ0a
         cpZ+6rWpHJh02LBCjd8HJCDfmIUeipzDmXPar1rLxb0wIgDYFFsltEo8Y1GTFkaZx23n
         /oS0o4vNO1Pf8w2Ouid91DFpI7rE6GO3zLCpUH9YtALvWQeKFYylKLBXpXrAX3w4Z85T
         q8DcY4dx7/N0urlsiQ/MlBXk2oJ94xqa9kiBFTaAtQba7IDfW2N6fU+xMQhlqTdTWwIo
         JedC+UIeBH0944n8c+1f06T2rXdgW8yKQ3LUWOwrZYxXa/nmczxJ5hpNjJ9QW1jIqLa8
         6VaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745966776; x=1746571576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCGCCKXBocwMhtCNRTkeUsgiaS7jZ1hs+w86svHkyjs=;
        b=N7CKcNMY6Zv72VkZslKdvvenKraxt2aGer5pWxHeqGIOu7kLZCIro57MGBNHuBbyHo
         zeJ520OgcINWROlYRh4RazowBJlm0iH3h+neXTTnfwuZmVSjRM+/33mSikMTxPz7Ob0y
         aWQ/4keIJho1ddDjiTToGtp0RCc22AxvX+ReM8AMMbzLWE7pLQes7TSO65rA6BjcWx3H
         pK1o1j25GvFNcY4pkvvABZL/v03wxwzzoa1/AmOLtgDdQqh1tp8QiJQgTuzXncMX6KN0
         Cwq9Sy1kRrFMaBtMpJ/C3BX65M2J5so4I+kT5GeuC0XHrbityAKb8CCKufNYLQk+40ST
         T8+w==
X-Forwarded-Encrypted: i=1; AJvYcCWv29noHaPjdv2WMNHSMY3/ztChzJsIbJgHkRuLVx1ApVdAiE4tsiVv+fKRH1dtBFOe7zHpwEaQSyOfY+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZUZ1cBSLU3qUjfKVlM3t4vu0Vy2A4sWaMAyySGtnqbD3PIpwa
	pSoQ+FXAVPTcNj587i/gCoNxxTNlHSPbL2VCri8TMtoGe1XzIUkowpLXFNdKbhooFXtX3P+6T7t
	Hiup+5X+XVZbkUGDPah+cbeSXM25YQx00
X-Gm-Gg: ASbGnctTG5JYBkLfHVui3h/M4mJvPbKz1SHY79xL4Vwc6W/t6SXIKeVQUfrpQz7+vdf
	Bjx1Q1v2RIffHjf9/d+68ShkUVwXVXD2jowlikkELDLyaVf+kmtBHQ6AO2oguE3dHr17evm9PHf
	2rqa0yIT1FE0ENvj8iFke8UOlFwgh9gvlrxdgdCmVqx5mb4mPcwPKDYjdq1M5PqPLqLrlDw3319
	l6+tmsDzYiOZJk6GrF62HUaWjiRzaJKKUcWteAAhJa6RpR/3W9vLYa9Wdvw7vuZfSqRydfK4eV2
	86eRZtThAwFoalxogULC/nwTlDISfMFM1urVmoMFRsnCoQ==
X-Google-Smtp-Source: AGHT+IE+G/JgBSc4QPhJO/JMssnCs47xAcdzkMDhhI6dkdMavoR9/32QK0KRcpc8my2GqlxfzQ2mMpfpLE2Y
X-Received: by 2002:a05:6e02:b42:b0:3d9:644c:e3b7 with SMTP id e9e14a558f8ab-3d967ffec1dmr3337395ab.15.1745966776636;
        Tue, 29 Apr 2025 15:46:16 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-3d967d2b553sm155645ab.25.2025.04.29.15.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 15:46:16 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 0BCFD3400C9;
	Tue, 29 Apr 2025 16:46:15 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id A4D78E404E6; Tue, 29 Apr 2025 16:46:14 -0600 (MDT)
Date: Tue, 29 Apr 2025 16:46:14 -0600
From: Uday Shankar <ushankar@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] selftests: ublk: kublk: build with -Werror iff
 CONFIG_WERROR=y
Message-ID: <aBFWtvHv84aPTMvi@dev-ushankar.dev.purestorage.com>
References: <20250428-ublk_selftests-v1-0-5795f7b00cda@purestorage.com>
 <20250428-ublk_selftests-v1-1-5795f7b00cda@purestorage.com>
 <aBAnKZCUZWyEJhfS@fedora>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBAnKZCUZWyEJhfS@fedora>

On Tue, Apr 29, 2025 at 09:11:05AM +0800, Ming Lei wrote:
> On Mon, Apr 28, 2025 at 05:10:20PM -0600, Uday Shankar wrote:
> > Compiler warnings can catch bugs at compile time. They can also produce
> > annoying false positives. Due to this duality, the kernel provides
> > CONFIG_WERROR so that the developer can choose whether or not they want
> > compiler warnings to fail the build. Use this same config options to
> > control whether or not warnings in building kublk fail its build.
> > 
> > Signed-off-by: Uday Shankar <ushankar@purestorage.com>
> > ---
> >  tools/testing/selftests/ublk/Makefile | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tools/testing/selftests/ublk/Makefile b/tools/testing/selftests/ublk/Makefile
> > index ec4624a283bce2ebeed80509be6573c1b7a3623d..86474cfe8d03b2df3f8c9bc1a5902701a0f72f58 100644
> > --- a/tools/testing/selftests/ublk/Makefile
> > +++ b/tools/testing/selftests/ublk/Makefile
> > @@ -1,6 +1,8 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  
> > -CFLAGS += -O3 -Wl,-no-as-needed -Wall -I $(top_srcdir)
> > +CONFIG = $(top_srcdir)/include/config/auto.conf
> > +WERROR = $(if $(shell grep CONFIG_WERROR=y ${CONFIG}),-Werror,)
> > +CFLAGS += -O3 -Wl,-no-as-needed -Wall ${WERROR} -I $(top_srcdir)
> >  LDLIBS += -lpthread -lm -luring
> 
> I think it isn't good to reuse kernel CONFIG_WERROR for test code.
> 
> But it can be done in the following way by passing 'WERROR=1' to make
> command line:
> 
> +ifneq ($(WERROR),0)
> +       CFLAGS += -Werror
> +endif

I've taken this approach in [1]. It actually passes -Werror by default,
but it gives the developer a way to disable it with

make WERROR=0 TARGETS=ublk kselftest

[1] https://lore.kernel.org/linux-block/20250429-ublk_selftests-v2-1-e970b6d9e4f4@purestorage.com/

