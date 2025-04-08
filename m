Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC140227BA4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744115392; cv=none; b=aQd9CXa0VeNuWPQCS2uLTEL7Z50Q0fKzJvrpnDrj2tmmoO7/6B+8PBo4uiVMZrRZL9xtOLXKus86z7fxu0hZYsEGVMQM0lneCf9noJflM6bMeMJ1pMiOKjByEhRx9CHKOn37l1oy/+ctGGkbJPoTqQr22PfLFqoRZEwbrRhq13w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744115392; c=relaxed/simple;
	bh=ASiasRx4+/AkNuvPwOSOr7N4IJe26ZSslQZxQhiOvPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e8amW9OdnomkTiVGIpkWfwwZCWl4lt3fnNQtmlg6AI/vtTPT5jN2VIVvSXitz6HZv7NRUGeNhqKKWnQMDB8Kw/3CCEiLM07yfPB5H0fPWHTkKq5qI+BxgoN/m0mXY5CxYgcLalS9B/k3xjrsix4ZRaDqyk/q+6OvkJ/F3WzV9/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2NIOFOs; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2NIOFOs"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-224191d92e4so50479815ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 05:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744115390; x=1744720190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c60ZkPAsbNA+m4/IYhXBJS5PmNDrpHVq7tKQ0dmHPLU=;
        b=O2NIOFOsWuxbBAZ4rrrE0eS7R/61OYEnuSKML12LVYKF+JIdunYrZB8oGHjtfk+o6x
         SRIna6+d6OXgy+7rp5+tqhY/BenVaWnI0nc6s5dxUOfF69scTgG1k2fAXoTSp/zvwCCP
         LAYj5M05TD3lm1CTuaO0Q4bT27iJYaJQ836ee9YowHJcPHEJc55ybEww9rtWSDWmd1yw
         w8rLzIfHQojC4dkmN6YkpD7WfA43sw+gZGb4k1fzMfwFGNeaiZIwYJ47S1T7Tx53qW7R
         koXhEf8ZMvO7564NA1yjm3RsK74xoEANfYzLFexmT6pJKfOgRthJorempXlgK2SZupTO
         YBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744115390; x=1744720190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c60ZkPAsbNA+m4/IYhXBJS5PmNDrpHVq7tKQ0dmHPLU=;
        b=XiH1Uc+lYNefDdgH7ajF6An7clo2Ho6UhnhBJDSQ5TIm9CZ9Qh8ea2Eo98ehdhDveK
         parOt3yUoG3cJXYyBMlixuIFgsxI0X6lYxLFtXAntrbeGj4+1PrYJ+GDV9WV8S8tCHb7
         H0eJwmFiqqUmx3VJWEjSX5rnyDgRRryPifIjHXiJyoWUCOh9UkwTFsIibtBltTV/6L8o
         ALWiN1NotXgOXdeSHFgXQNtUwgMhvxnP2rqXLAsmNCeZbc9CghzdJoGEiRjOa+HBtKp1
         1qgfP8vCVBuOAJfWTZgv4b6sDFJp7Q4fwcjqQxFrAnDe2CAzs26LnYWfBnezcUgzGzBF
         s+bg==
X-Forwarded-Encrypted: i=1; AJvYcCU2ww+7V2MdUjYwNXUYOPAFojqzbKYbpJxhKHio24ISdO+Y/PEpq2Tr5LfiROxOiWgzyNhtmOn8zFiSKiE=@vger.kernel.org
X-Gm-Message-State: AOJu0YynuR++yW/6LqmVmy4aFtG9ojgJ07unmeIET5r6blRyhn4GnW7C
	uxv0x9aO3sgoLgPFdIopLM5MdBr4Fu5JBH0ouI/DNH5Olb/oGkdw
X-Gm-Gg: ASbGncuA1Sxxa27XF7Yw69ubragT8H1Y79qaP0h7qzTmhxBuP3+6bAfoC71/WwzK5Ga
	Qf22OSNeoNmu9VpVkb3TFWQkCrtwScH/kaBWfgQY7FxSq4PY/PQ7SQHMnKHtxGGXV6rtKRSeih8
	1fKJbhYiSqVF2KtPUJlHKkC9F5N3ik/GZG5jPMabAcbnq/+CbDvV+0ljr6Pk7Y9540THAZxyYIJ
	aKSRmC+G1y89HaqGOkC/PTBzJ7COHYiB2yBy5Y62SJLRFBxehyGxDTSNyEUrO0BDS2DGwDWcvLx
	ICeVukCXPzTevOU3pDeNFn+SFli4xnAsVWBEs3Ht4fbJI0r1GzOU
X-Google-Smtp-Source: AGHT+IGue91lPgwEUGMYVg19YcEV7qEsY3Td2fRxyHmokzB/bhhjWnNiC2WNL1jZY+45zLW1zFFVZw==
X-Received: by 2002:a17:902:f64d:b0:229:1717:882a with SMTP id d9443c01a7336-22a8a04609fmr257732215ad.4.1744115390038;
        Tue, 08 Apr 2025 05:29:50 -0700 (PDT)
Received: from localhost.localdomain ([43.129.202.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c0901sm98794665ad.58.2025.04.08.05.29.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 08 Apr 2025 05:29:49 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
To: akpm@linux-foundation.org
Cc: amaindex@outlook.com,
	anna.schumaker@oracle.com,
	boqun.feng@gmail.com,
	ioworker0@gmail.com,
	joel.granados@kernel.org,
	jstultz@google.com,
	kent.overstreet@linux.dev,
	leonylgao@tencent.com,
	linux-kernel@vger.kernel.org,
	longman@redhat.com,
	mhiramat@kernel.org,
	mingo@redhat.com,
	mingzhe.yang@ly.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	senozhatsky@chromium.org,
	tfiga@chromium.org,
	will@kernel.org
Subject: Re: [PATCH v4 1/3] hung_task: replace blocker_mutex with encoded blocker
Date: Tue,  8 Apr 2025 20:29:37 +0800
Message-ID: <20250408122939.84154-1-ioworker0@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407130825.69b4c879b242df4caaf426cf@linux-foundation.org>
References: <20250407130825.69b4c879b242df4caaf426cf@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Apr 8, 2025 at 4:08 AM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Thu, 20 Mar 2025 14:49:21 +0800 Lance Yang <ioworker0@gmail.com> wrote:
>
> > This patch replaces 'struct mutex *blocker_mutex' with 'unsigned long
> > blocker', as only one blocker is active at a time.
> >
> > The blocker filed can store both the lock addrees and the lock type, with
> > LSB used to encode the type as Masami suggested, making it easier to extend
> > the feature to cover other types of locks.
> >
> > Also, once the lock type is determined, we can directly extract the address
> > and cast it to a lock pointer ;)
> >
> > ...
> >
> > --- a/include/linux/sched.h
> > +++ b/include/linux/sched.h
> > @@ -1218,7 +1218,7 @@ struct task_struct {
> >  #endif
> >
> >  #ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
> > -     struct mutex                    *blocker_mutex;
> > +     unsigned long                   blocker;
>
> -ENOCOMMENT
>

Got it. Does the following change make sense and is it clear?

diff --git a/include/linux/sched.h b/include/linux/sched.h
index f27060dac499..27dad9aa99a0 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1218,6 +1218,10 @@ struct task_struct {
 #endif

 #ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
+	/*
+	 * Encoded lock address causing task block (lower 2 bits = type from
+	 * <linux/hung_task.h>). Accessed via hung_task_*() helpers.
+	 */
 	unsigned long			blocker;
 #endif
---

Thanks,
Lance
