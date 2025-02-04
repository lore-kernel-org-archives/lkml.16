Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556E614AD20
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 15:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738683900; cv=none; b=gE6UaFtASIhLIvXCf2tF+yLCihF8OitAHOZKrcXva7SqwX92EXcfvN5SbU/8RXHdJZmkeHB86R97WT2N3AFsQmSnuUOTmaYDMHP0q/wD8TbmmgaOvBbK/KFngKXEka1jVAPOsnMZrgA5106FP8y6yQ1qgVJLQJEI1gTj8+GlGSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738683900; c=relaxed/simple;
	bh=rgEVKtXANon3IaD0uM0+Ko4lmK5t5FOBDBjJATsiX7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J+AbnNw6z4s3sPwDK3h3lZEUxO7FpKs+zY9aGB6kL9HZodQLukQi1mUql8thocVjmU3fZoq+/Kxt9kSOMHPNrdfvKPtmz+HgNyO7Gq+eSJBG+KlvnIs1uua2pb8B8WCsW9tgQPGSFVjzDC2FaBn3yvzvtKWnrmQFBdQ/SxcZLLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org; spf=pass smtp.mailfrom=joelfernandes.org; dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b=R2vabdCF; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelfernandes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="R2vabdCF"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38daa53a296so397936f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 07:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1738683896; x=1739288696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/xeeg2N+iFuLG+YJ1kkoPfP1z5ElS62nkjT6ZIVzps=;
        b=R2vabdCFKZTkgcy3li/xegJ5B0PnQjC+ReALSBuYgV+rxx8vUHBx4htrdbfqX11s4q
         pgCYK1BABLg68n+05CVYAZ/syXNBxofGC7Gpnvu89C1sl3c0yXtZhyh192CKaWlPvHth
         bNG/752tONlbU0psHdY19VzZNGBOsCNJl8cn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738683896; x=1739288696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/xeeg2N+iFuLG+YJ1kkoPfP1z5ElS62nkjT6ZIVzps=;
        b=dwOoUaS2d8IGsuwdRV5FU/JNouaLgMSNM2RLrpH5W4JiKFzGjhn6cLI+u4zIM0AmZz
         3VIbkPksFXUmERmN+KScSz9Gni9z0BnRgrlGlvHMehhfen2mzqTxx9FYi6OaXEshflSg
         3ndlss+quCDt2uCAYeT8sTfjYSivhCyfnh3oyFVgGFaBbjEDZ2vB3W8oVklMkAFEecQ+
         lg88gBsGvUWMFYLjkqxcGNDBfjUwjMfL8j68+R31LayKWH7z7ZgCRETkzvwDCwapfp0D
         I1rhmLvC+ON02WH0zVzOhTPB/s5ocaIiKSn7Z7sUftgmnP0EKrCM5BdC3y5TjVnXz6+Q
         OgxA==
X-Gm-Message-State: AOJu0Yxi3wmeDvosa9ooBjqrGD2ZJwwDhG/TD/ZXsOETpkUJfAX8HfeB
	VNmHT82GcVEz4J8aDZg4dBRjBD/a8F5gwnNLm6Qz0gZBprANXFNLaJ/GeLKjmCQgL6+jwkT8uAV
	R+mQrhk+kgsQgMnBD5yAZKUKjCfhIklNJVqmVFQ==
X-Gm-Gg: ASbGnct1EcgmoQNEm7ZPtyMIT85MD3veGH8uMlTGMDd712P6VA8IrPbUnk1M5ry9Jwo
	PJOPsOzoJVVO90r9S+sXa9U/FvZEKB68RQdaXuLDb9zfYMYfOqu2y16JxW329UL8kar4SkCPv
X-Google-Smtp-Source: AGHT+IG/+br+bEDyiSI68JSyhLnyNlO8ClX8IAKU3C4OB4E0iwAvoSayLWa2IJmvM2z0jlH47gjcu8eYEzOIBFavApY=
X-Received: by 2002:a5d:5384:0:b0:38a:8ed1:c5c7 with SMTP id
 ffacd0b85a97d-38c520bdb45mr16215972f8f.46.1738683896124; Tue, 04 Feb 2025
 07:44:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ecce7241-4238-4d86-8e4c-5080937129ce@paulmck-laptop>
 <15D1150A-9B7B-4EB7-91C6-2D881D6F48DA@joelfernandes.org> <861f1dc3-bfc0-4a81-9b78-c8e9995db4cd@paulmck-laptop>
 <CAEXW_YQ4W=upWV_x1woSgq-DJPFXmBjH2pVmUnBVb_n_UKrw7A@mail.gmail.com> <ec293223-2a33-4d2f-b3ca-c011c3d987f3@paulmck-laptop>
In-Reply-To: <ec293223-2a33-4d2f-b3ca-c011c3d987f3@paulmck-laptop>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Tue, 4 Feb 2025 10:44:45 -0500
X-Gm-Features: AWEUYZnBpj4WXsJzybY10O2T-OryqDjdJ06fVyJSWEDhR1_PaiZCJTjl4Zn9JJU
Message-ID: <CAEXW_YQXgZANSjo835VfHMqY=z8gaSWQ2bgaWtVd4-3KX0hX8w@mail.gmail.com>
Subject: Re: [PATCH] rcu: Merge rcu_seq_done_exact() logic into rcu_seq_done()
To: paulmck@kernel.org
Cc: linux-kernel@vger.kernel.org, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 12:56=E2=80=AFAM Paul E. McKenney <paulmck@kernel.o=
rg> wrote:
> By "where we were initially", one might reasonably guess that you meant
> that the initial value and the target are one and the same.  But I suspec=
t
> that you are thinking of a third value, the value of the underlying
> grace-period sequence number at the time of the call to rcu_seq_snap().
> But you might be thinking of something else entirely.
>
> > Now we move rcu_seq_done_exact. It has the exact same behavior except
> > that instead of ULONG_MAX/2, the above situations are shrunk to about
> > 10 counts from the target. So if target is 28, then the initial
> > sequence should have been at least 18 to avoid false-positive, but
> > again it is possible and I certain see in the code that it cannot be
> > used this way.. (at least so far).. So all we are left with is the
> > false-negative band of ~2.5 GPs..
>
> Here, I have the same questions.  As you no doubt guessed.
>
> > About "what are the consequences of failing to get this right".  I
> > believe false-positive is unacceptable unless it is maybe debug code -
> > that can break functionality in code, too short GPs and all that.
> > However false-negative is OK as long as the usecase can retry later
> > and can afford to wait. Did I get that much correct?
>
> Maybe?
>
> Please look at this on a per-use-case basis.

Sure. FWIW, I started a world-editable document here. I am planning to
work on this a bit more before our meeting this week. If others
knowledgeable like Frederic and others could make edits/comments,
that'd be welcomed. But I basically summarized this whole thread here:
https://docs.google.com/document/d/1sFNuGH4U6DFCE8sunbdWMjFhJhb1aG4goOJAnS6=
c6gQ/edit?usp=3Dsharing

My thought is (AFAICS), this patch is still valid and
rcu_seq_done_exact is a potentially better replacement to
rcu_seq_done. But famous last words...

thanks,

 - Joel
