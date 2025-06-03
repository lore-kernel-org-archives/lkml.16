Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F012F2D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 14:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748961066; cv=none; b=OdbMWun8L61CZwLefCLs32csLtLhPJT+ucXcbhXEScobvsJejJ1UssdMeGAWl+oC+y9EqfStYPwsiaqqchHacyWxuIvAn84Lqr0QqPXKup69iynxp/DF4jmTIiBG268OknRGaZOMkw0niopmAE/U6kZsxr4ciLETCE8Y06Ab2MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748961066; c=relaxed/simple;
	bh=6NNo+pvF/dHKDwGSOV/TA10QNoZmenREAqrjMtkqFXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qDk5ahZoGn/BPUM99WWxsM/3xQZmGgOunk1EEhkL7bg8Hn2clS/B/+UgLygcXb+0qVo8NGNDwsLXbAcn0DbcVQu+c90N4AD1OyUUUHE7sWW/IYKyHCGv2mOZkysstmVoVO2xmAfPCYQdI8JCdz2eTl+QqfYahCF1ZmN2Fr0x5sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIsyMEYj; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIsyMEYj"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-70df67e1b17so53315767b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 07:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748961064; x=1749565864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoEEammRMNXgpQPQrPR9ZfAnkri+pzRkn1GdyQ+ROtU=;
        b=mIsyMEYj6DKKYlfumBzi2/Xg3IctoEz+VXomJgFOLh3ge6hlWb9z+by6G/tOBTQ+3w
         j/UuHZ8U5FcEnIMCBKQlI8rak/xTHmJXSKFvtG0FWErc4ORLleinPBmuK50mq3sIfKmv
         Clx6vGYzcQuqG16S72yIyI5qmunEcWGhocdJhhJNa1JpYcxjt/lPWEgly1HqMWLrZAD4
         YDjKWkmRHOLk8u9/9vv377RfSOvc5dsJ4tqi7u7XNuW4shMBA5whnKLABtC3fGbzZb+X
         suim3KqXiVpGh+he2PgkyNuVeOGzHxJb0DVsAy2uDrjEgHbmFESO18C9QnVkKWCav6jA
         r4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748961064; x=1749565864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zoEEammRMNXgpQPQrPR9ZfAnkri+pzRkn1GdyQ+ROtU=;
        b=rkyrdY1q5r1l/YG2nA25vspVi2ULXl/NRELdKXdWKCyxQhKnRRFbkZ6XnM/yLnw9BO
         IBDf+NHGJsaBDsge1dLrF9PdwVxroZ7z1prvbmAnEIJAQypAj7hr9eZ5k8yAnqQARa/X
         376WU8tjBS+FfrI/hf00ywbirP8jguAfwO1cVwo1lDTILR39wWFE/CxGDsfGA3qwUyoe
         oOMeiDAdmGfdT7BrBMOsOQpZhuX4R3wDLpJ+lMegpJOJqlnPFA2Lyam8ln0qGtAPmocz
         z2ZpILxWCwHDddRTbMEG8TxQSAfoNgHIuM7CQuiuWhVldinqhWX39cri5BAkF0k/e0tW
         TwIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHJXmSsGoOUiQOA5eKzMiy/afybg92rjr0SSyI1B4TyY1/SQdjYdDzwjVnXk3DV/3p8nDncSua1t5cTt8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyZJDGZJK+aICGQ9pPJE3WCe4UgAsWKNMXdKK21/PRXwz0wX3h
	o06u/WZnmD73moSwKKGVhGc4SRCxGc5q5NaQuGvft2zNwUWBl2elf5z1n1agYw==
X-Gm-Gg: ASbGnctYNH003flFu6zSxdCha2qB9tXf2V1Wonx9Q71wnKAzJTsnorDPzndnQsNs+oH
	GF5BKGJNiNrb5GMI8nirEzjs1OFI/VbnOZvCYh+Fnf35rx1RfXAC6QAkWlOrDJlDsBuGZqYcx22
	qP6CLBUIbT5NkgHx6sQg8FVm71vhlttzjC9uPRoniK5bsxSuylLfGbm4ncvjNS1qbn+HcbTkaqb
	XdFhiYEsdndBjaXyT5u7y0cHiBd6k7P/ogRvADqkCbOUKK0jacL9md3q/s9FDAjiLp+w+NnfCRI
	5fBmBGYI/Q/i/y4gfBLYkHHG+nxAc8bRGNAZuk8Izn8c7rduWWw=
X-Google-Smtp-Source: AGHT+IHsk1RcYi7vSjqqd/5hsrEkV88SxfHjr9SD115HXad5863u6FxD3TtpgsUoH/o6Jj1rWrIkuA==
X-Received: by 2002:a05:690c:380e:b0:70d:f47a:7e21 with SMTP id 00721157ae682-71097c2a902mr182608127b3.1.1748961063965;
        Tue, 03 Jun 2025 07:31:03 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:71::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f8ad2439asm25380787b3.125.2025.06.03.07.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 07:31:03 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Gregory Price <gourry@gourry.net>,
	David Hildenbrand <david@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Alistair Popple <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH 2/2] mm/mempolicy: Skip unnecessary synchronize_rcu()
Date: Tue,  3 Jun 2025 07:31:00 -0700
Message-ID: <20250603143101.1231739-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <87h60xtw0p.fsf@DESKTOP-5N7EMDA>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 03 Jun 2025 10:10:46 +0800 "Huang, Ying" <ying.huang@linux.alibaba.com> wrote:

> Joshua Hahn <joshua.hahnjy@gmail.com> writes:
> 
> > By unconditionally setting wi_state to NULL and conditionally calling
> > synchronize_rcu(), we can save an unncessary call when there is no
> > old_wi_state.
> 
> Per my understanding, in the original code, if !old_wi_state, we will
> return immediately instead of calling synchronize_rcu() too.  Or I miss
> something?
> 
> The patch itself is a nice cleanup with reduced line number.  Feel free
> to add my
> 
> Reviewed-by: Huang Ying <ying.huang@linux.alibaba.com>

Hi Ying, you are correct. I was thinking in my mind to write "save an
unnecessary goto" but my mind must have slipped. Thank you for the catch,
and thank you for reviewing always. Have a great day!
Joshua

> in the future version.
> 
> > Suggested-by: David Hildenbrand <david@redhat.com>
> > Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> > ---
> >  mm/mempolicy.c | 13 +++++--------
> >  1 file changed, 5 insertions(+), 8 deletions(-)
> >
> > diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> > index 3b1dfd08338b..b0619d0020c9 100644
> > --- a/mm/mempolicy.c
> > +++ b/mm/mempolicy.c
> > @@ -3703,18 +3703,15 @@ static void wi_state_free(void)
> >  	struct weighted_interleave_state *old_wi_state;
> >  
> >  	mutex_lock(&wi_state_lock);
> > -
> >  	old_wi_state = rcu_dereference_protected(wi_state,
> >  			lockdep_is_held(&wi_state_lock));
> > -	if (!old_wi_state) {
> > -		mutex_unlock(&wi_state_lock);
> > -		return;
> > -	}
> > -
> >  	rcu_assign_pointer(wi_state, NULL);
> >  	mutex_unlock(&wi_state_lock);
> > -	synchronize_rcu();
> > -	kfree(old_wi_state);
> > +
> > +	if (old_wi_state) {
> > +		synchronize_rcu();
> > +		kfree(old_wi_state);
> > +	}
> >  }
> >  
> >  static struct kobj_attribute wi_auto_attr =
> 
> ---
> Best Regards,
> Huang, Ying
