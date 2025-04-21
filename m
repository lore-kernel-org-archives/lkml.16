Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65BD19DFA2
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 17:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745255178; cv=none; b=EdIjjZCDTUIzgMpug30v6+FOrMM1Q3q2zaTUGFEpjJZF0we+K3oTdKIb6ss3F40HJxSHTSVzVvFlmKz8VZURDZyvmluP4L4q9WdKvRoRpfKCDawHxhtxQy4QLUMroSxWoYKwcXyghTxJdFL3c4ulp0eaLEEsZY/1FGN4IUewm/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745255178; c=relaxed/simple;
	bh=yfkSwOMgh7jwOhoRL7xNX8B9gRCyDko2LfQ/jk2ZI6k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=apGr6D3T7pZDBmWDiyLovZ0YV4yRm0Kez+pALMSh7o79bH/q93TtcKshwPdvr2o5CqWCOD2mGvuBMYPpkgg7qhYDDlbO6uaz5lPznCu5OM8/DKcATC/0gZkaCOwgb+A7z8LUXCWChKr5yilry/uEyO63+VXLWvawg5cFOIOxA+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--gthelen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0SnUsAOd; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gthelen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0SnUsAOd"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-af972dd0cd6so2496530a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 10:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745255176; x=1745859976; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zGVm6Iz284Y0SobVO77Gr/vtAHZx6PoDVFWOgbVwgEA=;
        b=0SnUsAOdubshSd/bQOuL05TzErYZjZutaYksR9/xgbAMVpqJX22B5nDXIUdt1ub6nb
         yY/mJLtWmsVEZVK3n9mwB3w4cYggDfMewot1s2Mkam7a7+0gPAKsi2lepmlxaJ3xO2pt
         GHTrg0b7f4yE5qILc96tzar+bylVtVji24SQWya7wONFFeVSAZqc7mko3uySJ1Xdj7DD
         zsffW7itH0E45RXZOVulhxQ+QWKbIRnsJ9+ZrpY7EVZBCcp6mM3+V+yk3/qAsOtl+2ez
         +vtdIUHfc2m+SaJAFodf5uOF3sdLXalZAASrLyEUbD+9B55ewJDN0LcUlPTnhZuthOlO
         sTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745255176; x=1745859976;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zGVm6Iz284Y0SobVO77Gr/vtAHZx6PoDVFWOgbVwgEA=;
        b=DanNxVC7Wtn0QC49XoW71T0GQGaroTDwOsyh3YCeynePSl5Mj+OopY0pQfcTFzFZ8H
         3bYtM5WovvbcA2XYSvlSdUWCKCcaQ7U4/N522cmhqbFfzok0vo8PoR2XmONAYCdlmcGm
         TSxr3I/HeJY8/CiYPVkIjkp01QouO986FN/A3g8InAh5BFW3b/HlAB8jjpp2YxUT+fqn
         JqEBp5mYqTo0WFW+Q63ZgpGxpikSRyx5M/oXOFA1zh2c/qqiVBJotzMdSCvaOzyRCrOT
         pgfmRJtluTB4bmHGUtF7QhRNLOrS6QPIu8344vz5Ma+CfCZUMtxGkXXX5fF+XLz4L7Mm
         cRBw==
X-Forwarded-Encrypted: i=1; AJvYcCWvjIv30qcIOwXqYaSMrzZrJMBCtrMuVnNF7hUFfihKh7hakuZVEV00FBYbT4opSwSPn95x0zVraxYggG4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1uCY1cWz6d+yX763mrdEj5soCmgLw00RI03uU0JzsC68xz+KO
	avS4OoP3QWy3dttv2LcAk//cDvQ/0C9pZau7kseW/2P3ZKssU7cGff4L5jJXkA+jROlu5WwQkXO
	fCql0mQ==
X-Google-Smtp-Source: AGHT+IGJnoJr8pRxSRD/hhwYoroUkE+lGUx4/nXUcE18/FUK3RmYB2FZoc725vebNXgkeUgU5nmSHFss5Hw7
X-Received: from pfij16.prod.google.com ([2002:aa7:8010:0:b0:73d:65cb:b18b])
 (user=gthelen job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2704:b0:2ee:94d1:7a89
 with SMTP id 98e67ed59e1d1-3087bb36bb4mr16771781a91.1.1745255175978; Mon, 21
 Apr 2025 10:06:15 -0700 (PDT)
Date: Mon, 21 Apr 2025 10:06:13 -0700
In-Reply-To: <rgze2xgrslssxoe7k3vcfg6fy2ywe4jowvwlbdsxrcrvhmklzv@jhyomycycs4n>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250418195956.64824-1-shakeel.butt@linux.dev>
 <CAHH2K0as=b+EhxG=8yS9T9oP40U2dEtU0NA=wCJSb6ii9_DGaw@mail.gmail.com>
 <ohrgrdyy36us7q3ytjm3pewsnkh3xwrtz4xdixxxa6hbzsj2ki@sn275kch6zkh>
 <aALNIVa3zxl9HFK5@google.com> <nmdwfhfdboccgtymfhhcavjqe4pcvkxb3b2p2wfxbfqzybfpue@kgvwkjjagqho>
 <aAMVWsFbht3MdMEk@slm.duckdns.org> <rgze2xgrslssxoe7k3vcfg6fy2ywe4jowvwlbdsxrcrvhmklzv@jhyomycycs4n>
Message-ID: <xr93ecxlsauy.fsf@gthelen-cloudtop.c.googlers.com>
Subject: Re: [PATCH] memcg: introduce non-blocking limit setting interfaces
From: Greg Thelen <gthelen@google.com>
To: Shakeel Butt <shakeel.butt@linux.dev>, Tejun Heo <tj@kernel.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	"Michal =?utf-8?Q?Koutn=C3=BD?=" <mkoutny@suse.com>, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Meta kernel team <kernel-team@meta.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes

Shakeel Butt <shakeel.butt@linux.dev> wrote:

> On Fri, Apr 18, 2025 at 05:15:38PM -1000, Tejun Heo wrote:
>> On Fri, Apr 18, 2025 at 04:08:42PM -0700, Shakeel Butt wrote:
>> > Any reasons to prefer one over the other? To me having separate
>> > files/interfaces seem more clean and are more script friendly. Also
>> > let's see what others have to say or prefer.

>> I kinda like O_NONBLOCK. The subtlety level of the interface seems to  
>> match
>> that of the implemented behavior.


> Ok, it seems like more people prefer O_NONBLOCK, so be it. I will send
> v2 soon.

> Also I would request to backport to stable kernels. Let me know if
> anyone have concerns.

I don't feel strongly, but I thought LTS was generally intended for bug
fixes. So I assume that this new O_NONBLOCK support would not be LTS
worthy.

> I asked AI how to do the nonblock write in a script and got following:

> $ echo 10G | dd of=memory.max oflag=nonblock

> Shakeel
