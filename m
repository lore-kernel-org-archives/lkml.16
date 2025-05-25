Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2563C7DA73
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 07:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748159269; cv=none; b=FpKA2oNMwRNMhMSUZls4jcn6Ri5gsHzfPbi/j5ySnBPMIPHQ8f4TUYGkBXdI9+USeTbrqFNCsJFsFu4JX/5BlmnT1cHtCkx99oNV+BRGAmCxpHn2NaUAbMwv0dA7Jt9w1UlBMIXAKfMeb2sOwfGJTcovqD+y9iBC8cPUx8JAAlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748159269; c=relaxed/simple;
	bh=3S6qz0rNNbBa8WvkGJYy9fsuyN6yI+yBQVlba3nRoL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s1AFE6ztGMCdML7/2+NY3eprV7F5sNsCF3LT5TQPs+g8J4YvZIQG3U+EOeMYxHm4946CR7CyWsHRM5ZfidiNQjbSu1MItJ5mkokS5ZEwCWbKbiqGYOWeVA9UiViPlRg8unbakYkp2KNutoOhLeQhkSyH3oW8osVPQjWSRI8A8cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WyBds5O2; arc=none smtp.client-ip=209.85.167.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyBds5O2"
Received: by mail-lf1-f67.google.com with SMTP id 2adb3069b0e04-551f00720deso1247483e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 00:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748159266; x=1748764066; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3S6qz0rNNbBa8WvkGJYy9fsuyN6yI+yBQVlba3nRoL4=;
        b=WyBds5O2aHsYtr4bAAylPNWNCQH+zg7LEA5NzOlEOI35yHjyKsS6/Y8Slxi1T62/uS
         5IW7hQAeKjMGYlnwZSAl4to/Rmrr8wmVAW8bHcSdXyKsjTOcGNTh5d0+q8t4BbpoYbin
         biSzdNWRnQmLi9JuCw/y1me2By0i+RkbF4+5EDDLhZRzRBl4r8DeIHjII84qFmP2suRQ
         n6aPzKjfMtSvUNxuXwHaGAHMtoTKDS24aK++6PBXRSUmzwu8b5PiDl357KpZ0CE92hTE
         blt0a0IIO5JCOa9AaxqxtTAvOAaJhMd7JypYW/83L3u/x7oz+udETTwoYvmabxbBGD/p
         jnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748159266; x=1748764066;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3S6qz0rNNbBa8WvkGJYy9fsuyN6yI+yBQVlba3nRoL4=;
        b=k7fw5MsrRds70aD7rdJiqqfLutaVfFuzr80lOsCa2E2q3/qKcOAlZNeYkNZkPL+xhd
         3f9nBXzfOoqz4iUQGSYbjC/v1PwSJZzLW7VZP7N0IuftuEmOw6uTRLBmUCi2NyY2u3cx
         4V7NXFXa9+dLpo9+bhloSx6R/sWYYC278tjU8ZM6PfAFlOfCd8cji03YUkJsldnOakga
         7jsay72ZCRrDHJvMc9Vb10+8yNROhXM+Em6vdBZRHMx4xBYOe39LTj05QEgqDkRQBcOs
         IUUH0G16Y2x5NA3RdxsjHgubvsY+NCMFAuPVANi0MmaOIL4WqDf/yB0lL9AU4fhwlAcd
         Gl6g==
X-Gm-Message-State: AOJu0YxwnWsSxBgS8zF3xbBvsjTGgupcAmL3fUy/rus5VG3ar4P46QJu
	0eG5vpjF2DmHlUI8FOWKUzD/TRi98LRg/is9EuzJnG/8t3Uv7NuXG0LDvjXXyrgDdflCi9owigA
	qG8knHwDM5Vb+IY8M/ovY8C9c7aJRBiC7HfgxjSmNVQ==
X-Gm-Gg: ASbGncstEsuvesqNBEBAn4/AL697rNd9iBTCHBsE21kpfksyoyHum/fOFHOy5XZKP4Z
	qRzZLDKlMDsEea28Q23lr8N0EloL8w9cpMWkbW48ejwIMY5XhLnXiTozlRTwMEvtuLbXFYup2Jp
	TtVR2ZpUuwD7CAm4qqoFROmPjV3X3MAKdx1gcmb/aAUeBs
X-Google-Smtp-Source: AGHT+IFjeQHpXQDm8xE2vCTSc4+gngBFaAqsENdaJgUpgTvMhoi66y+HcRV47cM8PEWxVmw7/pmEevqs8PG/mlU7W/A=
X-Received: by 2002:a05:651c:144a:b0:30d:9198:5e81 with SMTP id
 38308e7fff4ca-3295b9ba3b1mr15707851fa.9.1748159265726; Sun, 25 May 2025
 00:47:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407134654.92841-1-hupu.gm@gmail.com> <CANDhNCptjorLthhgMBLLCCYsk5MJT73Daj+usFPWNenpgYTF4A@mail.gmail.com>
 <CADHxFxTWZJMBU9+VJH9=U9GHeoFf3N5fju3hApSRDONpQ9KAXg@mail.gmail.com> <CADHxFxSGwSBL0SvHGe6peVZ2=T=cz-PERrAiux8=0v_8heAp2w@mail.gmail.com>
In-Reply-To: <CADHxFxSGwSBL0SvHGe6peVZ2=T=cz-PERrAiux8=0v_8heAp2w@mail.gmail.com>
From: hupu <hupu.gm@gmail.com>
Date: Sun, 25 May 2025 15:47:34 +0800
X-Gm-Features: AX0GCFvTwa7yQcFUwUnJNtTh56DLAxFSZtQxERfBz4M7v8EOoa78NQKNf0FAdZc
Message-ID: <CADHxFxTEmskbP-gh47ObBLYT9N8iVRN9_sRG1xQomug_2V-y_w@mail.gmail.com>
Subject: Re: [RESEND RFC 1/1] sched: Remove unreliable wake_cpu check in proxy_needs_return
To: John Stultz <jstultz@google.com>
Cc: linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Valentin Schneider <vschneid@redhat.com>, 
	Ingo Molnar <mingo@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, hupu@transsion.com
Content-Type: text/plain; charset="UTF-8"

Hi John,
It seems this email might have been overlooked. I am resending it to
bring it back to your attention and continue the discussion.

Looking forward to your response!
hupu
