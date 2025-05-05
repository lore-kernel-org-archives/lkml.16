Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D7F26B0BC
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 16:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746464199; cv=none; b=RKoYVO/otSQs8W2gPx9d1blRCHHcRNbEVKaQsfotwfj1McylWZu4Kmu+iWw+7JZBXukbbBeWiuZ79sEV7RZc+aSmipDS1QqGludCwecNOjsUBmDIBYPAUuleK9W0sQDlyWD2BxSbnYW0O/8PucwMH2bjL0GQQQCV4xzPLrWvuus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746464199; c=relaxed/simple;
	bh=LjecaitHCbUwnqHRviSWLEw3xl0kwb7JmL/lsRMW4pw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UXj0EMzblCGABZV7GGP4cL9V1qP4INa7vkonqz2jvlAD2SmCcCy48SL17hUPI1EXqRfgzpgE3+7lCz6qRseVfIuSeOfVQckmXveYdNBxUDheMcVxkwMMsVKgCCVkTsGBJvIN1oGZJTEjQDSlxBsukgbPH8gCTOWzBHFTEChmp50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nogikh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CzIN5Ynh; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nogikh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CzIN5Ynh"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-5faa649b22bso2163417a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 09:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746464196; x=1747068996; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CMd8wRcjjQeiU6qBCa3iVhXFCPz/wm9uismZwGYnVJ8=;
        b=CzIN5Ynh1A+wHkZ6zUEOeE0d8U7/GR6kkGeoktlBm5xYnw4DNz86oBST6REX7Y/uTa
         mkb5FvhZwRxqecT3IkX8JBY4EzZcsav1a4ORWGZaDwLSNvUOmWQCW9E7sWNHAoyt9k3T
         M8hM+mz/pnwpGK5o7IhHCjFJhfky4mb8n6CL76weBbXA+NXDyHakYPUa7gIvnFEMbiFN
         G0BDK3lRhh6jHL4/DcN0MEmB6vNvSfbXm8C5OmhBl+nItn3Csj1+QjjviXGHnSRaana9
         pnh3LofdQlXpTTkeYXqUUixlTlVZNRCS1DUQLC6xrhHW5DNbSJgLkkjMypS45fkRUjNm
         /Ukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746464196; x=1747068996;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CMd8wRcjjQeiU6qBCa3iVhXFCPz/wm9uismZwGYnVJ8=;
        b=jF2xEr/7Bisgm7R3EhNNd10BiwDNrXE6urVrfBNxYExMLpVp0SA4NWSplRBhMpzUVW
         Kykv+4whOHWSzJ8WRsnRp44dtdNRTE/GOBF5iCjAod8Ygv+ERKZFNqVOHm00dFE6Jomw
         kvV1Hf2sG3TIsmXOq0wcMvtida+qk8XHRL5S1NxO1cVFX1ONEKt82mlmi64LrFQZRD/I
         jCISFrkXSpTZytSmbKMtxEtxAoAdn5lrW4V8YFB6gjLNAN++EG2zCOEbpPYCeR717cJb
         YlPSUVCMbCOKBUqyrT7I6AjmKuMsQSH5RWWtcJImxKvGVGLTGtJhEgEdvjm2NEfWqD20
         jD8g==
X-Forwarded-Encrypted: i=1; AJvYcCXCVAnfYi/y4+HYdScGMtIcdT5Wn2rkIH93K7Mh/wGTMyCyNGWtQKJ/Z7muMDFfc06LA9nByUDWVPzqx6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKulSamfGzpcnb8kxPGzGgNiYm/kU8ycToqk7D5zgV5cU10AWV
	MHobxtV7S8lwWy/cyLNrYbKkIW/8SmNEOs2bt1dj2/tGsYxqFbcYBK9ilIPrDER5AUdJ7NvGVJZ
	8tw==
X-Google-Smtp-Source: AGHT+IEBcfevoOYUkLLzoks1g6vqsYC5+N82Ie6uuEocKObQ+WVhUs2GJObf+yQ4S/JbiEIGZp2jNSe06Is=
X-Received: from edbfd21.prod.google.com ([2002:a05:6402:3895:b0:5f9:1a8a:197b])
 (user=nogikh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:2755:b0:5fa:afdf:1413
 with SMTP id 4fb4d7f45d1cf-5faafdf14c7mr6599862a12.6.1746464195897; Mon, 05
 May 2025 09:56:35 -0700 (PDT)
Date: Mon,  5 May 2025 18:56:33 +0200
In-Reply-To: <174489496807.31282.14803836540166615145.tip-bot2@tip-bot2>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <174489496807.31282.14803836540166615145.tip-bot2@tip-bot2>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250505165633.3892723-1-nogikh@google.com>
Subject: Re: [tip: x86/alternatives] x86/mm: Remove the mm_cpumask(prev)
 warning from switch_mm_irqs_off()
From: Aleksandr Nogikh <nogikh@google.com>
To: tip-bot2@linutronix.de
Cc: andrew.cooper3@citrix.com, bp@alien8.de, brgerst@gmail.com, hpa@zytor.com, 
	jgross@suse.com, linux-kernel@vger.kernel.org, 
	linux-tip-commits@vger.kernel.org, luto@kernel.org, mingo@kernel.org, 
	peterz@infradead.org, riel@surriel.com, 
	syzbot+c2537ce72a879a38113e@syzkaller.appspotmail.com, 
	torvalds@linux-foundation.org, x86@kernel.org, 
	syzkaller-bugs@googlegroups.com, dvyukov@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Peter, Ingo,

Thanks for addressing the problem!

It's been a couple of weeks since the commit has been merged into
x86/alternatives. However, it doesn't appear to be in linux-next yet,
which unfortunately prevents syzbot from fuzzing the linux-next tree.

When could we expect the commit to reach linux-next? If it's possible
to get it there sooner, that would be much appreciated.

Thanks,
Aleksandr

On Thu, 17 Apr 2025 13:02:48 -0000 tip-bot2 for Peter Zijlstra <tip-bot2@linutronix.de> wrote:
> The following commit has been merged into the x86/alternatives branch of tip:
> 
> Commit-ID:     52ebfe7412ce4b3af54fe962af58efe9b25cd9a9
> Gitweb:        https://git.kernel.org/tip/52ebfe7412ce4b3af54fe962af58efe9b25cd9a9
> Author:        Peter Zijlstra <peterz@infradead.org>
> AuthorDate:    Thu, 17 Apr 2025 14:34:13 +02:00
> Committer:     Ingo Molnar <mingo@kernel.org>
> CommitterDate: Thu, 17 Apr 2025 14:46:25 +02:00
> 
> x86/mm: Remove the mm_cpumask(prev) warning from switch_mm_irqs_off()
> 
