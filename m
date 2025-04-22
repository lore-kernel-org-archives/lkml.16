Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FE21EF376
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745302731; cv=none; b=Gb0pjv4dwZjhaJwaFHS3RKn5+48M9+gkx8HgDrnwp1EfFLs8MoxT7PkOwWizi/01J2FM9AFGKWNdjrJm+u+2959DySwK2i/iJFH3BoRn1BJdMiUUgrnzjqUnri5wtVPZKC23mFNHKCQqI2W2wFvtOypMExJRm+acBDhJYrkHCHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745302731; c=relaxed/simple;
	bh=sBRmjEzYRYe3MVAvk37PmL48oVOPVKRgYDtyvxADTrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z/jKbIcXqRzaRhbhqaCl07L5oHJtFy8qwbo75CCBNO7XuBhxV3a1nWSVWgVlKdHNRDGWOdBQV6tL2r19U/lvwKZO42BekwIy39vKHVnc6GMJw/Lo063r0L6GDJRQQGviUM4q9q/Bm35wja8KtW+Cp4iCT+7Zy6E+Ibf0Dm/JHLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Gwt+6vWK; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Gwt+6vWK"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54b1095625dso5579358e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 23:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1745302728; x=1745907528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBRmjEzYRYe3MVAvk37PmL48oVOPVKRgYDtyvxADTrw=;
        b=Gwt+6vWK4OsZhJ34Wc6woUZwwf/HCZGj/cO/NSgMoO2Y7v96dFlWLTEENh4VKafC7z
         YdsqlFP+tGt3FUgBKG94x+5e7EqJJ33b/VauSlFmB0OP0kPmFXRLKkpbhNX00nc/bg4O
         3J0lv65uLVz6/jyp4PFmvG2DiXVI9bp859qoy+5mkMzp0OdSQFMb2jdVp7sL+lFblWoh
         ZO0OMpouQex+vjd+q6p9hkG5/hSkv2sczbL5V6VX7CSOxhKW3BNRmklr9iZdyOEZv3OV
         Q1ZH/fYVB52Kv/332wKRY+s4JCNXr1yzV+xIseJrjwheV6waHz2RdODkR1zD0rXiLK/R
         gB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745302728; x=1745907528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sBRmjEzYRYe3MVAvk37PmL48oVOPVKRgYDtyvxADTrw=;
        b=uFKq38XrHF6k6CKR0mVo4Avvy4J8I3XD4uiNx0Ke5m4dZm6Pv917E/sqEiIO5nc3Re
         5iW8F7KKXUHp03WGIIKsUikv0Tapge6c1t/iuChdGfXlHe3Al0b/dXyDWW4jV/cj61+X
         2kFLmEMjeA6lgI+Okzc4szQ22QVurPCWx3FydtCPhgYVvPRuaaHk0b7fJ2vGyAv8TEBA
         E4ebMaS205A7DEKnLA1YejIXv2wYEX4D+JKFrkz4x2xqg4itYs5cnGZBuNqe9d4iV3d/
         jjDK4YlFk3kFkQB6eE/4UNjZpnOC4r3mH9B+DmYJYZ4Ibl6DDpBu9QbF1LoVHyaMexmT
         udyw==
X-Forwarded-Encrypted: i=1; AJvYcCUUuXcr53b59wyPn5k269vDzaxWe4nU+NpnNJhhWd73MLSOMuTYxDl8J7OwbxdF9H3yx+pqd0JrZASUGtc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEY81nQ7MB+dpUlEsYrW02Oxks71D9fqce7yyLjafXZaPx/gDJ
	wC7UYeapsexu+q32gkeCdzknRIUdLBaO1I3Jv0BhtT1SSm7llkEvBiHkfQRjVuX2dpsEcFJT79l
	kGIMwB2hS0lekZlNONo0gnrYMyhQV3YhYngfKuQ==
X-Gm-Gg: ASbGnct+26QaymUNN46KsY3k8skOezafCdZqFBYgs0RDF6a2f95LY+uVtH0PmyyGvZ+
	cVyN7fTjaI6zzckCXSyGUYZhVFGojDxdGznxKg367AQfOgeARWppExTD7fNB5El2+kP71oBAz+z
	4YmJT+efbZuKyCEdybaJDhs+BDQMXNd3aIy9zLHTMJZCj7Lw==
X-Google-Smtp-Source: AGHT+IF32NbxgPLQ2pEgrkJHmhNMNMAllPkdXxAjWFiv5lA+YKb6EJH3HqZ8hTEr1BOtAd274vNsJg62NN9mIEXVPRg=
X-Received: by 2002:a05:6512:2213:b0:549:9044:94a9 with SMTP id
 2adb3069b0e04-54d6e635c59mr3110785e87.25.1745302727514; Mon, 21 Apr 2025
 23:18:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1745225696.git.hezhongkun.hzk@bytedance.com>
 <65181f7745d657d664d833c26d8a94cae40538b9.1745225696.git.hezhongkun.hzk@bytedance.com>
 <DB64B965-2E54-401E-86F9-8F79C50B21C9@linux.dev>
In-Reply-To: <DB64B965-2E54-401E-86F9-8F79C50B21C9@linux.dev>
From: Zhongkun He <hezhongkun.hzk@bytedance.com>
Date: Tue, 22 Apr 2025 14:18:10 +0800
X-Gm-Features: ATxdqUGSiKYz7-DBCcl-vn5QD0jxOKI-QTRnLo_Cb8Oqzykd2WgsUo_H5ecwSUg
Message-ID: <CACSyD1MCfAAJ5R0y3Kn5u_a7RyhgZhiBwCF14uEKGAzs-7BbMQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH V4 3/4] mm: add max swappiness arg to
 lru_gen for anonymous memory only
To: Muchun Song <muchun.song@linux.dev>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, mhocko@suse.com, 
	yosry.ahmed@linux.dev, yuzhao@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 5:36=E2=80=AFPM Muchun Song <muchun.song@linux.dev>=
 wrote:
>
>
>
> > On Apr 21, 2025, at 17:13, Zhongkun He <hezhongkun.hzk@bytedance.com> w=
rote:
> >
> > The MGLRU already supports reclaiming only from anonymous memory
> > via the /sys/kernel/debug/lru_gen interface. Now, memory.reclaim
> > also supports the swappiness=3Dmax parameter to enable reclaiming
> > solely from anonymous memory. To unify the semantics of proactive
> > reclaiming from anonymous folios, the max parameter is introduced.
> >
> > Signed-off-by: Zhongkun He <hezhongkun.hzk@bytedance.com>
>
> Acked-by: Muchun Song <muchun.song@linux.dev>
>

Thanks.

> Thanks.
>
