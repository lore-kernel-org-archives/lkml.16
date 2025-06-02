Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8C322F745
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875967; cv=none; b=dQMZ9stSRbi2TucQ3RrtnQ/Xkk2RQTfkLFZZYf4PPtYL2HDZFgDeizdItn4LzNyfu/7d90W5GQl5LXLSPxOgXgvvViUcw9CzfQCcMYqNUu6ldhLfco8z6h6Vzb1fbTCWOtvmzC6MQuvFaZ6OlcLJcMBsjAeHeuRE7PayVsU0hrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875967; c=relaxed/simple;
	bh=jylN3WxyrQyqqaQ20fOx41X52y2IzYXWK79bb3JhcZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eQwlgJ0zMNxwpPR6yc2H7zoGIY4yjMgP/UlcNOIpIszaTOWbq5MmQ3GvD1pF/UeMyumljVFPW1TpY5MA1AAQAMd1Ky1XbYIUlJyI2DqsQxl6qfDlRoZQprEq4EG6yg67KLgYgU2o88eBAmtW7OXwEpfYHUxX0WCawL92lPeWPhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mee2OePn; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mee2OePn"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-70f31433d96so42085187b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 07:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748875965; x=1749480765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76sd53eSyvjHFmX9Hf2WRuEGfzgy55oGQBEa4L2zRnU=;
        b=Mee2OePn+uk7YU4iY+ujb0Y6LbQC+2pBiA35pO83/5YD2fEosu0wH+MvaZFpOo7d0X
         Au+cKYP8MjX+k+1eW4LiBqitbg3q7kdkCM6pEe5ctTWb2kr4u2teV+C4m5D3X71bEGk4
         CJiMusWsU3kuTb7fg6IUsT5Mxy71sK6+tzJ38SOaljuixVhBd2nKZJuafGKjgK2vsAZj
         9u01bQsu8N58+orLylX25FMA9Vo2GnjBq1Lx7h2nAYmyMDrxm44XS51x7ZJsYyKnnG8K
         rQB34P74HmlP0fr5v5Pii50AaxGFSm6z+IpHqJQQK8SHYLoro14aqIbhOIFJzq9aszGQ
         VZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748875965; x=1749480765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76sd53eSyvjHFmX9Hf2WRuEGfzgy55oGQBEa4L2zRnU=;
        b=HcfQx52r9TDajhqmj+VCzpTXoDP3Tf9k0HCNFv2GvJ5H+XcNg6ZF2JMnKX9AkSsamN
         OSHnuQbxwZFA+vbhhTFiE2zAs2GYTB5+IIn8lwwEIdoN27KGMfO6ie36+Srb9nXPltOj
         Sdd29WkohacYzH3JqDBrrmGUdg1Ytn8+qNEk+ank+B8H8oEBejsjwhSaHgR5l3IM4Hno
         wnoWXrbTSc0hCMA8gBwyrA5i9eY5/DXy8LZ9XRBldlZtjAnrhLYKlFdzwVp5SkfaU9AS
         m64r81cDDm3KMw1UKN0hUUtv6U+aVJ+L/A4W5y3Txmshd96Sfsw3hvSe8kcpfE2lLiAu
         5LQw==
X-Forwarded-Encrypted: i=1; AJvYcCX/Ruz6VWv96EGrM4JGgJvMYWJnwW7ffEGk5SI76G+fZ2Vih1s4gpWhHs4hReKhExbSdyjvyF1wFqGgR8s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg5HChYflpmZOIFVJj2AyadzLc2izgArG8fC6XwRP4e9oIRxTR
	a5+XdDCIx+cQVx2IqBdMKJULffRWL83tSTzxtuinOam6IxVyEMpsJ13YZaFKTw==
X-Gm-Gg: ASbGnctexWTMepIXWFyUMteNCD0LJxf2Q94bNINGrQOn0eb/zno86Dp1K8SKiOXork+
	MlwwhEGWUZ//cG9YAhXreJCysvwSzsyFp5FRPI6QC0wMPhWQsIqaItYJDlfienDnhpNrbI8cCJP
	fUdhO9BMIIuoj2hrwPA1Th9obufmIwDNMR7EyQfDhbYFgx4nuHBkQuAPGjrSZtYU/b2TTJMwJrt
	J9tLiscRkRiUSybZfvGfL1NHvFZZggXwFcElvF4cD8HWb+MXKPcVebGceSuUd0U+syN+sOrtQeZ
	L4v3WsOrLAVJjXUHFLRdvnR9m+V1qEEMfG8eFDCDanIYfsrdAg==
X-Google-Smtp-Source: AGHT+IEsgSp200jiLK+JMX2zF3T0B7XKAG0dLeZ5mmTJTjJ/BXwU5aM/+R7TYdq3m+S8I9xo+XiTZg==
X-Received: by 2002:a05:690c:4d84:b0:70d:ffaf:48ed with SMTP id 00721157ae682-71057d61298mr155431007b3.33.1748875964793;
        Mon, 02 Jun 2025 07:52:44 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:1::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f8abee892sm20949177b3.32.2025.06.02.07.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 07:52:42 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Gregory Price <gourry@gourry.net>,
	Huang Ying <ying.huang@linux.alibaba.com>,
	Honggyu Kim <honggyu.kim@sk.com>
Subject: Re: mm/mempolicy.c:3719:1-6: ERROR: invalid free of structure field
Date: Mon,  2 Jun 2025 07:52:39 -0700
Message-ID: <20250602145240.1868958-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <aD0-JNr0Z83OpXg4@harry>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 2 Jun 2025 15:01:08 +0900 Harry Yoo <harry.yoo@oracle.com> wrote:

> On Sun, Jun 01, 2025 at 01:34:46PM +0800, kernel test robot wrote:
> > cocci warnings: (new ones prefixed by >>)
> > >> mm/mempolicy.c:3719:1-6: ERROR: invalid free of structure field
> > 
> > vim +3719 mm/mempolicy.c
> > 
> >   3700	
> >   3701	static void wi_state_free(void)
> >   3702	{
> >   3703		struct weighted_interleave_state *old_wi_state;
> >   3704	
> >   3705		mutex_lock(&wi_state_lock);
> >   3706	
> >   3707		old_wi_state = rcu_dereference_protected(wi_state,
> >   3708				lockdep_is_held(&wi_state_lock));
> >   3709		if (!old_wi_state) {
> >   3710			mutex_unlock(&wi_state_lock);
> >   3711			goto out;
> >   3712		}
> >   3713	
> >   3714		rcu_assign_pointer(wi_state, NULL);
> >   3715		mutex_unlock(&wi_state_lock);
> >   3716		synchronize_rcu();
> >   3717		kfree(old_wi_state);
> >   3718	out:
> > > 3719		kfree(&wi_group->wi_kobj);
> 
> Hmm maybe Joshua meant kfree(wi_group)?
> 
> Anyway, practically it's the same as kfree(wi_group) and something strange
> is happening there.
> 
> in add_weighted_interleave_group() (the only caller of wi_cleanup()),
> kobject_del() and kobject_put() are called after wi_cleanup() freed
> wi_group in the error path.

Hi Harry,

Thanks for your suggestion and insight! This is totally a slip-up on my end.

I completely missed the kobject_{put, delete} that gets called immediately
after this, which is embarrassing because rebasing on top of Rakie's patch
(which introduces those proper freeing calls) was the main focus of this v8.

From what I can tell, I think the solution here is to just remove the goto
statement entirely. There is no need to free the wi_group here, and it
would also be bad practice to do more than the function name suggests anyways.

Let me send a patch that gets rid of the goto statement, and just returns if
there is no old_wi_state. While I'm at it, I'll send in a patch from
David Hildenbrand that is an optimization in this area. 

Thanks again for taking a look Harry, hope you have a great day!
Joshua

> 
> >   3720	}
> >   3721	
> > 
> > -- 
> > 0-DAY CI Kernel Test Service
> 
> -- 
> Cheers,
> Harry / Hyeonggon
