Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741AC25D534
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 17:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746033761; cv=none; b=u9IxA+46eZ8gVhleQPGmoI+/Gv3cYr49VDHyxgwq/SaJ32ozvhfw+595o2IeCALY6bElFXS8x2gj7sGaHhG7aykocWuKq8PGp+w1Wo6Wd+WK/Hynz6xV4y5aH1lN8CjGKwwgO1Uny3M9IknMHEU5/1Guvew4rKdgPxoJPqhtdSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746033761; c=relaxed/simple;
	bh=CH4napBsCBC0WBNNu69lyH6W2wkeBWtP8Vh2WDJOLuQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HTIiD+r+2CCnrTXRlemRFbQ1+Q7GQlgSn/dhKhP6GO1dKHFnc60p6AJD1nUBZwq6ukzf9Uc/Y73ER+eJ1gD9Mzc1DRZabPpFvdDduISA96wWmJnGyQN/VUv1sa5XZeEDG8ZaOdlV7qljexIlIdlM+KjY0GfWjmMPvEPKxUFw8TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7p5gLzu; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7p5gLzu"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e900a7ce55so2009916d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746033758; x=1746638558; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CH4napBsCBC0WBNNu69lyH6W2wkeBWtP8Vh2WDJOLuQ=;
        b=Z7p5gLzu00uAAMW6THlo7nFcH73ZpoXEKksrJ7jn3UHkvnc/mkITMA4Te29WerYAI3
         aIzHirknmMB73TF9i+MeIAOwlud6DhJytlV0/1DqBoFbX00kD6D06eTx4HMuiXCeql9X
         g7a3HiGpL3pnnAGvkxpFgrbALkDom0tPB5w3iw3ZFuITIJBcHAVGOHRpueBiOMnoGjgJ
         G0OKaJNaEuT8YOVE8P4IX4K+/VnGQdO5TTIKIB/m/I5eUHXJJis0xGbUk7bSXEsZCIIN
         Q99dxkcnSBJxq4M2XK7tf9hE0vLJpLKm+CuLesljnUWLM9aMXq1clTAqtis6vWTKmj+i
         MdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746033758; x=1746638558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CH4napBsCBC0WBNNu69lyH6W2wkeBWtP8Vh2WDJOLuQ=;
        b=NXzfJyfexxFuB//P4KQy24LFZx19m8pTXwZMlzrthaBqoGdKIRaBcri6WxVu971s2W
         E6EICWCZPvtB/3WHOHL7AHoCBGEAJ9umvUF2Vd4vmyT+Mq6wnxMOUF1uGlLTTcKFpAyj
         /6YppuayosWK61FN+MHXgZzGknGT50W6A357UlyWbrUyRnCedcI96jyhsBQqvdBHWrlv
         KJHdJy3usXYT7Oril9+2lEqYIBKE880L0UjBZM/MDChM/9P6i2AQbT7i5WO4YZL7G3Id
         yrsJxwdhQ8QSdtggFqDolRvPZ7IBvClII+9mKqswkHicmzZMsNW8uy1feYnulMcAwcFr
         +qNw==
X-Forwarded-Encrypted: i=1; AJvYcCVBPv4IOr9fm6TNt2F/mK7YAV6x1R6rhFWGOlb4VtqT64GBVe0unHGe4r2bvMMbvo5hJ5DFffRrYizfSwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPO05xlNavj4j4mivHjt0qDhqfKaIMRMmmfUsGDMmPrXEKW82G
	F2Jynp2uC8tS/89TkXsKemiyhSaidLoskIqOvoJHoj8q/k/dkrmv7cvOk3nSnKavu/cbbNhTng4
	WxxPnx82yItb+OCFXNv8oaiDB3iA=
X-Gm-Gg: ASbGncuL2QGfV6aM5vsM6H4ER/GYuH76cC8B3Is3DvyjEvc97n+RSh85Pb5J71gtn0K
	evs090Ree+o3jaMpSzTaqhuM7InNgV/ucgjymZwcv5qUSmx5rsUAxASUZm3Xb2pg9fpBUqFP62A
	akcZ+ihLVw/BKWz8neTjXn6xo=
X-Google-Smtp-Source: AGHT+IF0hkSUkBscoztwrJiCPtGe/eqecg5IeOVFYTEiAr9H2ndJDheoCXzUScHPG2WNdnXZOmnD+9FyO9Oh9/9V6Q4=
X-Received: by 2002:a05:6214:d8d:b0:6e8:ddf6:d11e with SMTP id
 6a1803df08f44-6f509135fd5mr1962686d6.21.1746033758098; Wed, 30 Apr 2025
 10:22:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>
In-Reply-To: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 30 Apr 2025 10:22:27 -0700
X-Gm-Features: ATxdqUEz8NUpZ41yOc0wEWBdYrRigHz3dBQhIEdEZTRmRa2kkuklIIa5A4uoDWA
Message-ID: <CAKEwX=P192ijuK+O6r5ocwZsbtiV=-gVc1tz-=dtQ1NCw65gUA@mail.gmail.com>
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
To: Qun-Wei Lin <qun-wei.lin@mediatek.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Casper Li <casper.li@mediatek.com>, 
	Chinwen Chang <chinwen.chang@mediatek.com>, Andrew Yang <andrew.yang@mediatek.com>, 
	James Hsu <james.hsu@mediatek.com>, Barry Song <21cnbao@gmail.com>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Kairui Song <ryncsn@gmail.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Chengming Zhou <chengming.zhou@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 1:27=E2=80=AFAM Qun-Wei Lin <qun-wei.lin@mediatek.c=
om> wrote:
>

cc-ing a couple more folks who are interested/working on this area
(Kairui, Shakeel, Johannes, Yosry, Chengming, etc.).
