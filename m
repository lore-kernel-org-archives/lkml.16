Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FEE21638A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573114; cv=none; b=YElnKaOh3xiag3nUbWC1CdQQFboW+LDdmwGX7ifwlMzXakcFZ5Erb86SOYri2b4inVnBz1QgcSVsjQk4y55oQkyRn48WAE0XQfetm3n+UwoER6CP/7CkIuJysFDJjAlha4DsoOzNozSO9c9vpgZgrkEQvV9Mk9efCayaFqTp77c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573114; c=relaxed/simple;
	bh=G0hOz6DNdSKOs8IoQHUNYBXS3Y3PbyezYqyLTvSy5ec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TrIGrRyFJ0JmdSl1iSQKXdC3pkT7QkiJRHu39SQq6IRlo+q42WSlKAh8KEbY1unEEDgXXWedYQBjiPqDhUvPlqocjRbCyRsXAtV+rXO0GeiCFaNTugdqz9x6jB5FU6b1aV7s/J58/N0mu0nEE9JANcEMKaysekNSquHcanYfBKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=N52Y/I+V; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="N52Y/I+V"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ace3b03c043so310668166b.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745573110; x=1746177910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G0hOz6DNdSKOs8IoQHUNYBXS3Y3PbyezYqyLTvSy5ec=;
        b=N52Y/I+V3ACemQLv936eo7Z0/rXBey46tnZ4Ks7c6XsgYETpQob34Jwu7PJZdsLkDv
         U40fQYoqhDcQcdjFxld5JEDsMGr6nicpybk14xPmzyIqMJyl9BLvZPq6zZQnffM31bnk
         g667xYRnRdfKemdnwoM+e3rBKTLnlxyFITDdXve1Cck6Wc1Wz802Jr+Bp+38RCf/5eVL
         PLl6I1sIcTSqSaJYmNF3N7M7PIdQtKjdVf1wHSwqgDPmlfks6vOJzfTpL5itfsb5BX4w
         ps2Xei5FxzzY4TkKPBmArZrShCdBpZ9l/Vz0OoNfNTeGE+hU9btti2GI6k4eAvg6ONAB
         dMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745573110; x=1746177910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G0hOz6DNdSKOs8IoQHUNYBXS3Y3PbyezYqyLTvSy5ec=;
        b=Cm7gnWgh9wb53oKj5uKsZEHohU5IQAzsFDNnaS814n7NjCbEVUY+sGdi/U+GPPb/JE
         H0IECCJFxRzlN+tQw1evVsYSVOz8cn38HX7nT8rDa1Mfb1oZqme80/JQ+/nOQzLdX2pd
         Zqw9pBnD8KG8JeGeO8VxJhgTFeddSeIDx5T8E/Wwa5D0A6IYi5TQ2wENw1IUOlgXiQJG
         wh5ZuEBHRf23xnd3LddMxFroeYac8+dOwpaaWEU/qOPgIOSPADZllshRXS7KG0eTXkV9
         Q7UkfXrvRALCRuMVTtEjbEQPoOhncSS515thXdbwuc58szcb/jat9MueO+mZJt5gtMRQ
         oPPQ==
X-Gm-Message-State: AOJu0YyuokZZ7niPw3KrnTHtnKu6AGKa+gKgevQNa56v0BAg9qWuK4pB
	A7WcC12sCeAayBpYgO91BziGAFT9FlXhCMBs+D6eTjrjbsEGEt53t3UTr5Dsmsg=
X-Gm-Gg: ASbGncsrwRaAZeuxp5yjowj/EqKkQxZ0cxw6xk/BNGD1fFkpm3LyhztjXQk2p2csPM4
	jQqHCJKES/L/uOclxMm17MI32fe3Uj6gwlMF01jxbkmrjeUtowhjptvPFFQw5NF+bx+aN1Ow0Ru
	byyysHQ2FeFRe5FOCi1SWNaxLUNi07JR2PhHRblDsnyzalYy/ecbeDZleI1m1Dw8sSBe7gdIKLN
	wgeUbZFGYeBc1t9vCRBG4PSzGDW+EjmKcylZdUnN8EsxAGFwGhAErr5njYmnUA3pwPkcfdwl5Ee
	FJQoXj5jyGM/f9Z2lb/gZvbRZ1DnYI5znt6R4F/L/qA=
X-Google-Smtp-Source: AGHT+IH0wCHAOi8ex9uAqIDR6bWzii4pyjUQL80boICM441o6kiS0sTsJYEabkXpySlPuvWHV/co/w==
X-Received: by 2002:a17:907:a088:b0:ace:50e3:c76c with SMTP id a640c23a62f3a-ace710c694fmr143524366b.21.1745573110093;
        Fri, 25 Apr 2025 02:25:10 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edafb3fsm105172966b.172.2025.04.25.02.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:25:09 -0700 (PDT)
Date: Fri, 25 Apr 2025 11:25:07 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: linux-kernel@vger.kernel.org, mrpre@163.com, 
	syzbot+adcaa842b762a1762e7d@syzkaller.appspotmail.com, syzbot+fab52e3459fa2f95df57@syzkaller.appspotmail.com, 
	syzbot+0718f65353d72efaac1e@syzkaller.appspotmail.com, Andrew Morton <akpm@linux-foundation.org>, 
	Christian Brauner <brauner@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	Wei Yang <richard.weiyang@gmail.com>, David Hildenbrand <david@redhat.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, Mateusz Guzik <mjguzik@gmail.com>, 
	Oleg Nesterov <oleg@redhat.com>, Joel Granados <joel.granados@kernel.org>, 
	Bill O'Donnell <bodonnel@redhat.com>, "Darrick J. Wong" <djwong@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>
Subject: Re: [PATCH v2] pid: annotate data-races around pid_ns->pid_allocated
Message-ID: <fo436hdqzkevk7jqszyprjjwehqge7rrqxz6gqbmgoqqsqwdxl@efe2r5jeouwl>
References: <20250425055824.6930-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nxm7bwc2c62nhmpx"
Content-Disposition: inline
In-Reply-To: <20250425055824.6930-1-jiayuan.chen@linux.dev>


--nxm7bwc2c62nhmpx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2] pid: annotate data-races around pid_ns->pid_allocated
MIME-Version: 1.0

On Fri, Apr 25, 2025 at 01:58:14PM +0800, Jiayuan Chen <jiayuan.chen@linux.dev> wrote:
> Suppress syzbot reports by annotating these accesses using data_race().

Thanks for trying this approach.
scripts/checkpatch.pl has quite some remarks about the current form :-)
I mean, the data_race annotation should document why the race is
harmless. I only glanced over this so I can't tell myself whether it's a
bug or OK.

> Reported-by: syzbot+adcaa842b762a1762e7d@syzkaller.appspotmail.com
> Reported-by: syzbot+fab52e3459fa2f95df57@syzkaller.appspotmail.com
> Reported-by: syzbot+0718f65353d72efaac1e@syzkaller.appspotmail.com

How can I get to see full syzbot reports? (Stacktrace would be helpful,
I cannot resolve those as message-ids on (LK)ML.)

Thanks,
Michal

--nxm7bwc2c62nhmpx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaAtU5QAKCRAt3Wney77B
STz2AP43iBbiSATsIWMKE7hTyoKhUHTCRsiUauvvn2341G5HNAD/YasZJdwtKK5z
hG4ym9ABCSCrEDI9BGdPtgB3CFVsKgo=
=Twjq
-----END PGP SIGNATURE-----

--nxm7bwc2c62nhmpx--
