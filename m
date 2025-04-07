Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222482AD2A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041634; cv=none; b=ocv53Sp+RBtuKOKRBthizOL4v0GPlXo3DL+MB6hBRw+8c5e24p1WvQpXOKDHHtr/8K/uIu2sg6RBCKQiUIKd+EdM0pRCmEpBaWzQ/i6ZrM8FxYrdiiEhR3QQSneNlybW5ZDk6It4HossdaojzniNJR9B+kHRkb6YH+8BEMvCpWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041634; c=relaxed/simple;
	bh=16jnXUwEzg+6vjOWlFFNf1AIjcyTPaes4VV1VjBmRVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQOtHs+Ez39TkNjX4BF7RWPoEUmal84hQ/y8d84dm/zlONRJqThIf0C88dsykE6ise5CI2tKIugBg2pO1JGnS7YrJrVMXjKHV+Ek2+vNr55aD8Rs1auU/gH4d0TnwgqPFW07KmkQ1zwQpq1q9gNzIlXkJcS3AxiqUuj0Vm36GA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SWoMW8WV; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SWoMW8WV"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so7972120a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 09:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1744041629; x=1744646429; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8zO4Ev4894plW7TI/YV+dAf1aUzFJZSWz5C8372wjus=;
        b=SWoMW8WV8rq9K1zWhj/RsCea0aY4maZi65SMczK+DBz3NrDvyw8cDxG202U1KCNyWn
         eNFmhFkRNtHVrln6Iu2b7m7z4fERmv7CzJKOiVojdRnACf4XKytKBCxvyzBXBX7yMIrA
         Y/Hw/fllCfDAV7Al/dIe66dGTvm2V/Etouffw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744041629; x=1744646429;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8zO4Ev4894plW7TI/YV+dAf1aUzFJZSWz5C8372wjus=;
        b=qbykgQYFidctX0jOF96lcdXCT3tki+KxfRkrltiQLy0SIrI4VYGDqfVrSPai1kZqJI
         7sZ+z5ux5loAbjT2LSf07ot7NLFOvesYNAsttV/CuDT3/yzw0fc+mg8cLEORbF0qgEqs
         OL/Xn82rnzpSWO80Ym01F12j2TiJp5jg3OBOquqNeeggU0XNNKG5ZNoVqHW51QB/toXS
         4Gn85BaPNP9VthyM3au64lsxwAjQ2cx8vnu1CQ7Kv9czJGSMVxruJI6wKyUeJbMIRDRJ
         IOAKgGG+FknCtb18WacS+n6QUm4kUpwSFEIZsqleMmnAK7SBsLpVz4Ri6AjJkv72Z4gd
         DJoQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7XsFEEqmT7HFkfn66/ptMtlmbHCLz11unV2cONFEoSr31cZ1kMeQjP5dKZmB4mEo9Gyw9Cfp1ihdCFQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI4XgVdPSFEcrmrubWFIx1lb50yhqRBPts6uXB0u7E86pSGf22
	l4HW4p27Z1Gz6owj8AkZAKtYaD7+IcPH6siv7epWua7tIpwmTp3ANMTnLlG/j+MMCWpVaVQ6bwI
	DbIM=
X-Gm-Gg: ASbGncscT3x7H8dbkRCPofzbfWWxtFXD8s5Odl8Glq1gsIQhucoid3vpPID0f4DmYl/
	oAxSe8rqHPWjRfIByosvw3rsMVSMn2Gh7ZMQjZHtl9ha+pZfQUVqEY4r1/vJcsudHT+zB/g0OfP
	x/hvpgSpLq5Sq7yy3d25IrRaqAS7H55FhgvoVpeFpZKMDVhVndMH8zq5VOmhKRp4Q6yJTRdfUaN
	eJS8VOdP6vOkW1+2cxkyQlV3h2geuq2U+u/c/ka4Q17iu8e2BrTN608ckX+EAgXuFaeikKQnbR8
	9rCq6GmCLQCqiQFYs3qHg3uY9XApjeM0tUNeDZmaUlGJKv1qWldFuj70SXshc5LNKqUjNpxeHb+
	HT3SABEyrDgCw9SVW2TQ=
X-Google-Smtp-Source: AGHT+IHifW82CekXhsjRsX38iC0iWn/zf0jml3ybm+PlTmb1Lbe/+TxMBUIUzHZNStbwH2cruvC01Q==
X-Received: by 2002:a17:907:3686:b0:ac7:9937:e259 with SMTP id a640c23a62f3a-ac7d134e4a1mr1061453266b.0.1744041628840;
        Mon, 07 Apr 2025 09:00:28 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c01844e1sm757785566b.126.2025.04.07.09.00.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 09:00:27 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abbd96bef64so875566566b.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 09:00:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW5/1OAgXlV11pgF/kIQ5+gA+cD+Lu0qamrwe4UYfxCbq7BqD3xeC+QXeiR8dbFOG7hGHj2mK1nf/zErO4=@vger.kernel.org
X-Received: by 2002:a17:907:3da2:b0:ac6:bca0:eb70 with SMTP id
 a640c23a62f3a-ac7d1b9fe8dmr1237120166b.56.1744041626801; Mon, 07 Apr 2025
 09:00:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250322-vfs-mount-b08c842965f4@brauner> <174285005920.4171303.15547772549481189907.pr-tracker-bot@kernel.org>
 <20250401170715.GA112019@unreal> <20250403-bankintern-unsympathisch-03272ab45229@brauner>
 <20250403-quartal-kaltstart-eb56df61e784@brauner> <196c53c26e8f3862567d72ed610da6323e3dba83.camel@HansenPartnership.com>
 <6pfbsqikuizxezhevr2ltp6lk6vqbbmgomwbgqfz256osjwky5@irmbenbudp2s>
 <CAHk-=wjksLMWq8At_atu6uqHEY9MnPRu2EuRpQtAC8ANGg82zw@mail.gmail.com>
 <Z--YEKTkaojFNUQN@infradead.org> <CAHk-=wjjGb0Uik101G-B76pp+Xvq5-xa1azJF0EwRxb_kisi2Q@mail.gmail.com>
 <Z_OSEJ-Bd-wL1CpS@infradead.org>
In-Reply-To: <Z_OSEJ-Bd-wL1CpS@infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 7 Apr 2025 09:00:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgtKqZoQZB6VzJr+EQNfsT1r1A9U2zxOrGFb+pqtkTXFA@mail.gmail.com>
X-Gm-Features: ATxdqUGe2UEcBb7-HxSxAS-BggZkNNT9Atl96RrMDJ0cWDe458YcI4kTYsxsNfo
Message-ID: <CAHk-=wgtKqZoQZB6VzJr+EQNfsT1r1A9U2zxOrGFb+pqtkTXFA@mail.gmail.com>
Subject: Re: [GIT PULL] vfs mount
To: Christoph Hellwig <hch@infradead.org>
Cc: Mateusz Guzik <mjguzik@gmail.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Christian Brauner <brauner@kernel.org>, Leon Romanovsky <leon@kernel.org>, pr-tracker-bot@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 01:51, Christoph Hellwig <hch@infradead.org> wrote:
>
> The scoped one with proper indentation is fine.  The non-scoped one is
> the one that is really confusing and odd.

Ahh, I misunderstood you.

You're obviously right in a "visually obvious" way - even if it was
the scoped one that caused problems.

But the non-scoped one is *so* convenient when you have a helper
function that just wants to run with some local (or RCU) held.

There's a reason we have more than two _thousand_ uses of it by now in
the kernel (~4x as many as the scoped version). It's just makes code
look so much simpler.

I was nervous about the lock guard macros initially, but it really
does get rid of pointless boilerplate code. Even without error
handling complications it just makes code simpler.

          Linus
