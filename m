Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6837028C5D9
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747302010; cv=none; b=C/EUta0Ig2zIc9bx25HT75YtnkXHfa9bOtg26rcVSdeDV6RrxIujRvs75B7V8LIE3RikFE2cfxgRV76xWTQPcdFMDC7J2j0+3bhF+gxGvrMUf4NWiOB3gxIwDNLC61YVWCRYuyGaojgFeaLQOo85g640itr5DWZKrLaOova20eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747302010; c=relaxed/simple;
	bh=1CrClsb6m6KfVqR6MgsSYcZDNxWG+Jal4kU8wCuMksk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LmSCdc3XV58UX693x87wZXG6o1IJxVWB6aVYUJMqi25tMmzLnm8jw/K9ks0nD96ljDMRqvbJgfgePLeVCEPqg2YgWOlU4eKgbys/uqp6rtMSFjeX7BozeWQBJnE/HeIoWZs5IjB0ox31dcKcLxswqC+HuQur2OuZBeAl6IEPkBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIiBSl5e; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIiBSl5e"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-550d4b7a076so771847e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 02:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747302006; x=1747906806; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1CrClsb6m6KfVqR6MgsSYcZDNxWG+Jal4kU8wCuMksk=;
        b=VIiBSl5ekbxSdUcHufhLQogJQbKLAoXNpHlSke3pqqtf2aAh2YiuBpSd4hpnQ9pp2/
         PfRoikEH1uEyodcqiDlYDFO9t3WO75gUQhWFYZGcJXCSN7D/3SSZLIvR3nfpg9C6v9EK
         1MKstOs41aIe9zNEHGct9oZTTaX0HWEjJ5NplDOV8CfWS2lYfbRTux9Ir7pK6j81a2tM
         +0qUnGoBauEV1qKZqzUssFJxts0SuvJUEesvjYR2jAWIpSS0+NlrZoLYC84/VSuNEnr6
         cS4sQV/Bmn5IBZ9SXZ8ujSlEJRS7LVC9wobyZMWbdZ1E5cymQHRQ3CMoHh4EQnARoRYq
         adEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747302006; x=1747906806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1CrClsb6m6KfVqR6MgsSYcZDNxWG+Jal4kU8wCuMksk=;
        b=tB+ii07R163Zi2XOSvqSmRuX0xx8GQEcxfNySjGC4Xk6fF7LSfxeqg/XsoCsrrDKoS
         oL8m+61S7qKshg5uG3CEtrE8QXRZfNtQNl+4YmbMOcYPTha8ljNUN9IwFzhhsWbjJ2K3
         5jJ/mNvHvyDBwte1NOFcGzANqEjXbFw4JMQhSPVoffoCVJgAjhBHDFvgU4jMvRVUyYtu
         3QD766lkW456SmwgCx0P4GtIRMovtjoBdXWi/EuaKZZ2u1N20nfbUoxeoOYp1UUtmzjk
         A13+xFprgeLs/JxL6htFskR6uxJmOfCFxtJcGX/9k8Q3soG2ghqFvb12ewTB7Z+CJKX5
         WdgA==
X-Forwarded-Encrypted: i=1; AJvYcCU1r7gpvTXHIX0A8FrORVrlKFh/MDA3LxXvEWP7YJNl1xN8O5gMcXmLuQ9h38e64UyB8HhJb7E6dS21Mkw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxslCh2e2NezMG/Zh9TpuRSs4d021g6wG/qrDh9xOhYWXriGxXB
	neMZrJgzjUxtVKBjJJtXfR5LQtscBmdxton2IGWUG3frkwbhZigNvhs+28fbRS39HkymPG+YZ2V
	8TAe50P8oxyuNiS6/NUbbPg8aTM4=
X-Gm-Gg: ASbGnctnglBFyfugKL5SHS6DZeJL1iquxIEzVCZcu/kFJDzT/8v/as3Ue1x/VGuRdEX
	MNlYPMa4uWu32DplDzoeUwsiCma0ucEZF7cPZKer6Hj3CoIi/W6RhTljGG1jX5CWmwBFjYIz/Hu
	dB0MSQUrIp09iTiEONQRiDxVtm+e6/QrGI
X-Google-Smtp-Source: AGHT+IF+92TDlD1jx6r/Kz+tLgIx4K+eyBpvWWHyz2ybulLqnfTzi1ZhRuPADWJY3IipWXvGSjpHtEkPLlAL+Cr3RyA=
X-Received: by 2002:a2e:8a8d:0:b0:328:19:f6d0 with SMTP id 38308e7fff4ca-3280019f977mr1951621fa.6.1747302006096;
 Thu, 15 May 2025 02:40:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514201729.48420-1-ryncsn@gmail.com> <20250514201729.48420-12-ryncsn@gmail.com>
 <iqcrqzvoqt7dcmboh75u5g5cwgzaevlota3izpsfmaeotdnnzw@f7udsv2gghwa>
In-Reply-To: <iqcrqzvoqt7dcmboh75u5g5cwgzaevlota3izpsfmaeotdnnzw@f7udsv2gghwa>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 15 May 2025 17:39:48 +0800
X-Gm-Features: AX0GCFubmipqPTGXVkf0OAolayEXRfOSmtVjA5Chsvxfnh3knv8D6XTQVwK4SpI
Message-ID: <CAMgjq7AuyTCRymHA3wZ6hp7ui9_LrwM4jq0cyAkqGjgG39erOw@mail.gmail.com>
Subject: Re: [PATCH 11/28] mm, swap: clean up and consolidate helper for mTHP
 swapin check
To: Klara Modin <klarasmodin@gmail.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>, Chris Li <chrisl@kernel.org>, 
	David Hildenbrand <david@redhat.com>, Yosry Ahmed <yosryahmed@google.com>, 
	"Huang, Ying" <ying.huang@linux.alibaba.com>, Nhat Pham <nphamcs@gmail.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Kalesh Singh <kaleshsingh@google.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Tim Chen <tim.c.chen@linux.intel.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 5:31=E2=80=AFPM Klara Modin <klarasmodin@gmail.com>=
 wrote:
>
> Hi,
>
> On 2025-05-15 04:17:11 +0800, Kairui Song wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > Move all mTHP swapin check into can_swapin_thp and use it for both pre
> > IO check and post IO check. This way the code is more consolidated and
> > make later commit easier to maintain.
>
> From what I can see, can_swapin_thp is gated behind
> CONFIG_TRANSPARENT_HUGEPAGE and this fails to build when it's not
> enabled.

Thanks for the review.

Right, I might have to add an empty one for
!CONFIG_TRANSPARENT_HUGEPAGE to pass the build.
