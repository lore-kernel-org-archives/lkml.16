Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F091EF380
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 21:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744667004; cv=none; b=PvJVRjo5v4QzD+H4TihcsSUdLKMJRP48WB5CGVi9sjDGf+7Aue6knWYwIce+rX/TDlFEDmHDodG6MWcqUoK3pu+EZQI9YDYsuuJ/zeldzQ9z9uqcb+f/0Gg406johZY6gk8cJggR++toIKvEMYMG/LDhu8l2EVcy2VhPYRQJI+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744667004; c=relaxed/simple;
	bh=jliqBof10kGvn2stsr88DwEv0qVbyZTOfc56zdJieWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QX4S0uoD9Rjf0D/P3yBVQf2V1MwMjdvbbQUFuh1e/VU77RduQvZOQQDI3jLP+inzDuqAnQ/mpt8RJCoF4cBWU5mKWlFAdE/7ca1t18Nmbp9JUpTG5FrPjn+sJ9ZC1z74Mu7YEa/1iusOU8B85tgYr49QL4aqbIJ8vAGarw6n6Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2FZH8HNr; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2FZH8HNr"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso1583a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744667001; x=1745271801; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jliqBof10kGvn2stsr88DwEv0qVbyZTOfc56zdJieWM=;
        b=2FZH8HNrRwKF0Ec9G6GLKq9ogdas+SdEh7a93+WPeHqbpL4UK7AuztL4wtRsLzbOcM
         fIjvbjpK0hFLy+m3JokuCgUklhXxT8pLgJjkfml2vWYNFAi8TLONlc/P9G/d8CGSdra+
         rF1BeUoQmKQX6VbJ4PRLKVsl277p0c3+n0FyaDfj/0P0/73nMhKGABq16ORzOjtoxTJA
         r+xe8AFop/GABYYsP796W64kPAC5LtiFsG87oDd3hnHHOs4fClBG4UbCytQ75m7wVjiY
         qTpQgLe5sOxyY1fQiHYUezEhHmieBP/BemwdcorU0TqtLtUSbrnNmiZCIYEc9nkORmgs
         wZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744667001; x=1745271801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jliqBof10kGvn2stsr88DwEv0qVbyZTOfc56zdJieWM=;
        b=k5YH4YPikHDKucrK4C269ffzZiwR+tjdDPamAF1Ww5urTQ/fvaIZPEDC0fdd4Yl6po
         rbBkUn3fAtLf09KO0zvj7iaebdunhD3Mb0dab+WZNxYnoBfqklSqFjJt41F2+Dc7j8xL
         eyfqcXJpVoT1TwYfKpaWlIALxzPXtwElvQ5oYF1tLD/0+lgHKPDAJH/A0AXB+ASkr/ZJ
         sok9mc7QIxJbClbjk4EwdVmOj3C48ph6bRj1ua5cmIpc0dp0V4XuDR1btkZOvepXCv/o
         iv48QHriN9yMs6GtB68/d75CDN88QNjSJnd6KxBv8Qbg0GPZvCJ0tWWvkeegLDJp+6Lq
         5j8A==
X-Forwarded-Encrypted: i=1; AJvYcCWeyOma4qOg542KzwU4e5bimRmmOSSGnGGUfKNgk78d3ML4Zia/zb//RdecgBVZixMLD4dVZQ1zHETdVgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFNKJDWHOkcBbxWoP5XMFPZezBOyaYp29eLG21dXUsa9PuUyl6
	/RZR5QOzgXrGpkdfQNqG/Osc2eYoyj7bcibIoAm+HFuypTK6iaPfyLu1Se3f6/08B+w2vTv9MKv
	4LvmbfVZIwTuQF2Otls/VwOtuvAFaeHq0gT3r
X-Gm-Gg: ASbGncuc0onBKH1hzLS3Z2DmJ3nrXHwsejU1LRd91z97XQqfBVe/7OkBrvSq8MjTltS
	A8nUgQVPje3vXFwnouGN0WX0RZAmFxXtTM+bjpJOMcLw8Ntkm6wCI2eTPn8+elCx03PVuWDNSZM
	p4TDqA7rBqEFhVEQiKKAp8WrwfOLtaDA==
X-Google-Smtp-Source: AGHT+IF5jEV8t9GKXR37hi1efKrfDy4gSlcsUnWqdZfoa8G3x5RlMK5uNSj4O9wpiMQjxd5mc1NgLS1WEEc6drcdrik=
X-Received: by 2002:a05:6402:1cac:b0:5de:c832:89ad with SMTP id
 4fb4d7f45d1cf-5f461612fcemr15338a12.6.1744667000732; Mon, 14 Apr 2025
 14:43:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250310222942.1988975-5-samitolvanen@google.com> <1744624410-471661-1-git-send-email-huangdao1@oppo.com>
In-Reply-To: <1744624410-471661-1-git-send-email-huangdao1@oppo.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 14 Apr 2025 14:42:44 -0700
X-Gm-Features: ATxdqUF8Q8A-bzpJY7EigqAvtM5EQ-PQqm5e98cbBX9TPkbAF9oeXUHfstec0l4
Message-ID: <CABCJKufDbYVAMi23aF=+daNkZa-8YHOoZfnLGtZ4qCG3EzJtCw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v8 1/2] cfi: add C CFI type macro
To: Dao Huang <huangdao1@oppo.com>
Cc: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	catalin.marinas@arm.com, daniel@iogearbox.net, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mark.rutland@arm.com, mbland@motorola.com, puranjay12@gmail.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 14, 2025 at 2:54=E2=80=AFAM Dao Huang <huangdao1@oppo.com> wrot=
e:
>
> we oppo team have tested this patch on Mediatek DX-5(arm64)
> with a kernel based on android-16(kernel-6.12). It has been running
> fine for a week on both machines.

Great, thanks for testing! Can we add your Tested-by tag to the patches?

Sami
