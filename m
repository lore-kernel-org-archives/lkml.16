Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E3F22A1E6
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875537; cv=none; b=V5fCKzjIhJ4TZffN063/jHh4KXhR0M3wynSR6z/Po0TdnQFMcfss8MgT5ybk6YFEwgMGR54XEOxn2WIpPqYesji3m7aSJ5TDkhbabakbpsX1GG1ff3MJhw4C3w/eHY5DUBd/hJTIS5QSIodL2TsP1WD+hGIh4bFyBcPwTrWHfgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875537; c=relaxed/simple;
	bh=qf8xhx/P8U6G8/9ptr04NOdlpjybtwrNiRY9oxiFgCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mgHuktr11kSfjHN01OxBRQdwQIZGG1nf4Q6rJEhwEDCtXKLSR2SaWZXbqwQDHtCbn4L9PnVu85hoXUkvRQfi4VzxkiP/H6fNypBIYJBf8u4oLYRs4Ni2TWakEqVvb9pgT7nuCxSxvSB04Tlzelm0hXXqfaTqUXhQQ+AFAKkEVnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SqUXdBcl; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SqUXdBcl"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a5058d46ceso803540f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 07:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748875534; x=1749480334; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qf8xhx/P8U6G8/9ptr04NOdlpjybtwrNiRY9oxiFgCo=;
        b=SqUXdBclmE5O6zjByqrDF5y6WZUKgd5oCUClVCr1PU/WT5pvhHGAcNtGfrq2onZRwX
         0uFfUkXEhwN9lxbIrn8SxKwkmjYyL6fSh45cAEKVxTr7DU2+QnxJK7hYLBK1Kj2r1kxJ
         PcEepwIisICvcGqvHem7trQR7I6rMAEBT1FYYq/ZxmPApKORDS9Scg4EGvWW9BnLGdLF
         RNYI/8AOIIO/hr61h2iatoXsGjGpHZS8orBmtlfj7Ivysi93Za8SWvyhbbD0ZgHrOLbN
         2B+Sq3Gaf0MbpLVpC5gl2nb7ASFDTz0S/6HOzOSDaO0fQSPYvOqFjlpLq50CWlkPQdKu
         KEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748875534; x=1749480334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qf8xhx/P8U6G8/9ptr04NOdlpjybtwrNiRY9oxiFgCo=;
        b=MKL0I+tEJDwnOeY6iyAfPwQM1pTzgeo5Wcvx6JlkVAPYSYkzvltOI2YU3/ABgHuyQ0
         qqenU7/GbpgrN0OnH7yj/15tt5NIBzfnUHLsJZiiTpF6YjBlZraWIhof8+gmSOw+T5mM
         s8w0IyYGWdFGrZPqCqBnXvjffPDKaq9E0dBJfDIT7YZ5VxvByPmLanW8jioqT3ZvM54G
         JpKKVg5l/dC0VLP1MEHvIpkmkfSUXp0f5tEIqMrvd1L47eki2B/vQNxyi7q7NXMH6aOM
         S5kNK9f1ZVV9E40K1zKwTa+N7FdscOlG7gWfuvoSPEHp1p1HHTXzJpfRKs5IUGa82hW5
         C+dw==
X-Forwarded-Encrypted: i=1; AJvYcCVILKlnaqVQlkQTXpBU8Vnc/LJTgDY1cqpuPb1oJkwYWjezp3wDX2qbKkTY7+xaHe0nroe/S74FPS/3s9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnHrY2UFjwRcZYf5y3nUslsDKon5sHGYqQ95hOUNoly+C7N3bc
	NMFNWxTe1LI4+AEZKqLincT+K36jFyU4WXNGSr8yGjr2hBDL+MFj07IEAykuW4yuDa0=
X-Gm-Gg: ASbGncs3xH3Ujdtz37bLyjyi9jDlZQG9LwFFx+tA3lJ69pNd/QIr+hVtIux1SpUHKub
	fGrXxFQ2Bd45C+I1xp/9XsG1a2nrZXLOISh6FxoKECvw+2YIrL1/xE93kVS1a6/5KdQLxIXu544
	gl4Hq/I7wVoNrQCIGTMuKSLGWgbehvUQiHk0mejCaKCw1qhmlJMp3vZHicM7rLMRA4bZ8CmVx+J
	Ik2tt/+9gkOHByeCWYeXwazka3+YfVeN1xrmWeKi3meQbAtj4vYQIZRxjMi5D2Wgl+y9epZfM3j
	LAR2h00w2XJr0onArC9SfxCgMrSdNyTsIrekv4xgPnlPDFfhxm5vr1s5Jnkfd/u5
X-Google-Smtp-Source: AGHT+IHhOLPK3wy+JJwKSLsDWydjB4lRADzhyLKMg8NOlNveSdw1CmJFuZPFx5ougj5v+ByLkjCMxA==
X-Received: by 2002:a05:6000:40e0:b0:3a4:f41d:6973 with SMTP id ffacd0b85a97d-3a4f89ad29emr9750624f8f.13.1748875533919;
        Mon, 02 Jun 2025 07:45:33 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00971fasm14937650f8f.77.2025.06.02.07.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 07:45:33 -0700 (PDT)
Date: Mon, 2 Jun 2025 16:45:31 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Vlastimil Babka <vbabka@suse.cz>, Alexei Starovoitov <ast@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Harry Yoo <harry.yoo@oracle.com>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Peter Zijlstra <peterz@infradead.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Tejun Heo <tj@kernel.org>, bpf@vger.kernel.org, 
	linux-mm@kvack.org, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Meta kernel team <kernel-team@meta.com>
Subject: Re: [PATCH v4 0/5] memcg: nmi-safe kmem charging
Message-ID: <gqb34j7wrgetfuklvcjbdlcuteratvvnuow4ujs3dza22fdtwb@cobgv5fq6hb5>
References: <20250519063142.111219-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7o34cr4hrs2kk3cc"
Content-Disposition: inline
In-Reply-To: <20250519063142.111219-1-shakeel.butt@linux.dev>


--7o34cr4hrs2kk3cc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 0/5] memcg: nmi-safe kmem charging
MIME-Version: 1.0

Hello Shakeel.

On Sun, May 18, 2025 at 11:31:37PM -0700, Shakeel Butt <shakeel.butt@linux.dev> wrote:
> Users can attached their BPF programs at arbitrary execution points in
> the kernel and such BPF programs may run in nmi context. In addition,
> these programs can trigger memcg charged kernel allocations in the nmi
> context. However memcg charging infra for kernel memory is not equipped
> to handle nmi context for all architectures.

How much memory does this refer to? Is it unbound (in particular for
non-privileged eBPF)? Or is it rather negligible? (I assume the former
to make the series worth it.)

Thanks,
Michal

--7o34cr4hrs2kk3cc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaD25CQAKCRAt3Wney77B
SQiTAQC/eAKARy8kEU7fP7GCMHE1+7v+d2sSxmXDyaCQ6wqidAEAu4q3hQa6TLAp
Pqns7WVL19JaCImjilT1rPY77Jv3aQo=
=nNTq
-----END PGP SIGNATURE-----

--7o34cr4hrs2kk3cc--
