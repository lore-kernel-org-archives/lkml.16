Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0B2194A60
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 18:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743704167; cv=none; b=NGo3UiKr7BCF1mzy5aPPeDE+f4MAprqFCXGjgQtUTAo0X6U+iyS2HamWdY5RnRCSF4agOk5OIu+f2ikzL9q7zQANsZ1tHuD0o3sUMItfyqoTfA+cLiAH+e9ItEajz0IoI7PLDsX8PPecOQ/82nv0ehpW8P+E77+owwdjZ35WsM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743704167; c=relaxed/simple;
	bh=AAxrM2iRqdWg4dPkxTdNI3Bm2YqyYSHNciLHcBw4rKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F4xUKAJ7AR2FkaCJAcSRZAkgK0KuNmSYwNYtVRetC/w/XL6PbPn33cKlM2b5Owv/qhR77n4ydILSWYv4TU9w6v35f+Xadc5lIDMFJhq3TwO1sGExumpUaO/mIxQ2y1dovYcqdlB2EFMJMsg3kOKiAzk85k9KEVLXx2Auy5nQ/I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SrsfyFCx; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SrsfyFCx"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so2207375a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 11:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743704163; x=1744308963; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FJlcXXP2FukqGEHv0z1cQI88EHr2Dv5R3LlDfDt2A4c=;
        b=SrsfyFCxHGQn4rEIqi/6z1PWdCw5wmSKhtG+glg2YvbB2nTaK+954kOesh4+e9oHYL
         5Y7WK4qEw98awi2Wgwg+IR3tSkC944d1FSPSG00ctzbHc3MTjKWLh526YcIt7IHxylzp
         Q3OHLcLEQrtV/WKiHUQisGmnAjGWLe6EZfKiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743704163; x=1744308963;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJlcXXP2FukqGEHv0z1cQI88EHr2Dv5R3LlDfDt2A4c=;
        b=BunJFBEX1JlAelYn7GDDs/OcQ6iFJ7hYuHvu/Hv0ElxT9UWMThfytoZmwNEC91OB69
         EGP1PVtrFSOqbgY1SrTpwUbUq+d460+n71RTH9OnDeltumklrKLCYl3jNESQfVR2LpFI
         4IgTAdlXcipAPoi5BEHL6ONzGa8h+FcnZOBnER+D7pt0z33+9OizSpxv0rZKjCoWTu21
         BcKoVXQxt3bnQJxkFdbHq2wL63ALYnQJe7MC236EmTMEsqbkHKts5AgfytFewn7nJPZR
         HLbcZmUuZg8IqEW0b81G14dmdVQfC1SK7dJ03CrE2PmTAYgcbb2O2cts9vU6eoaXyBQK
         EuPA==
X-Gm-Message-State: AOJu0YxA2RAKEVEZXq8CxWS9FNP+nPEdOvm3P0wlRuphNvF/vj6o+ET5
	ZcrRJOc6Yi6Wf1Z75NGnrkYK6TaFG0CapTWLIqfL2NwaKbgei8iKAJftbKtiUgpDzl4vBTlvigw
	oJ9g=
X-Gm-Gg: ASbGncvp0LMcXA3MDl3uPsreoTYpGHagCisycvyKnp6FJaciYnq8xvlT+asxETDpMj4
	yffYPWcK65znt+Kd6R0Ykib0NYY3bOZic+4ccRjURkfmk5ViCY+Ohg5wy/tM52nRfTHA35Cq0sZ
	rmbVb1xCQFm2Ynnri5y1QEgpsh58uByCuYmKXu+dmawT8ZTIZTXG6J3BZzOR4p50psEy5w5BOGa
	/ItyvnwpvARBnYWMEL+GIfaAacW0KF9mUs51s/0C9Ll0Af1qbU25s3h57VyrwLSM5GV2RWARvg1
	uy4vgviDiysyTZicj0uUEshfSt+i8WenWBbNN0kSUXWJZmeQ93/hWXaJemMgK+7YqC1m0Jp/lWP
	q4YjGl5CzKjX9jopgj/XieQJz3L8wJQ==
X-Google-Smtp-Source: AGHT+IEbCgS4Y02tlMn7wigzhk5uYbDrELcp+OtkAfyzeupudmx82j4TbXSU93HKHydfWaVH0hfVeA==
X-Received: by 2002:a05:6402:34cd:b0:5e6:1353:1319 with SMTP id 4fb4d7f45d1cf-5f0b3b9a25cmr132060a12.12.1743704162948;
        Thu, 03 Apr 2025 11:16:02 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087714e06sm1216900a12.3.2025.04.03.11.16.01
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 11:16:02 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so2207317a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 11:16:01 -0700 (PDT)
X-Received: by 2002:a17:907:9728:b0:ac7:41c:748d with SMTP id
 a640c23a62f3a-ac7d1b27f38mr53718566b.38.1743704161358; Thu, 03 Apr 2025
 11:16:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401134408.37312-1-przemyslaw.kitszel@intel.com>
In-Reply-To: <20250401134408.37312-1-przemyslaw.kitszel@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 3 Apr 2025 11:15:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjvh_LUpa=864joG2JJXs3+viO-kLzLidR2JLyMr4MNwA@mail.gmail.com>
X-Gm-Features: AQ5f1Jqqq_S2O0OJpyEjcg88KSOkVuR9PdTbHkE7So44nAp-S1DtNbZhUbWjRJI
Message-ID: <CAHk-=wjvh_LUpa=864joG2JJXs3+viO-kLzLidR2JLyMr4MNwA@mail.gmail.com>
Subject: Re: [RFC] slab: introduce auto_kfree macro
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, vbabka@suse.cz, 
	peterz@infradead.org, andriy.shevchenko@linux.intel.com, 
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Apr 2025 at 06:50, Przemek Kitszel
<przemyslaw.kitszel@intel.com> wrote:
>
> With new auto_kfree, we simply will start with
>         struct my_dev_foo *foo auto_kfree;
> and be safe against future extensions.

Honestly, I'd much rather just see any auto-freeing *always* assigning
the value.

We used to have a rule that declarations had to be at the top of a
block, which made that not an option, but that rule went out the
window exactly because you can't do that with the cleanup macros.

So just make the rule be that __free() without an assignment is simply a bug.

               Linus
