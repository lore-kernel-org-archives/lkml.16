Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5D3255247
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 11:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197491; cv=none; b=eqvRI7wyZvEfz3qQQTKTcYG4fWtBfb/gtluhnY+41uz8wbIcleJoBxEJ8qDhEBI9Lh4nrmEsscsFigg2Sc8XSEG1zZ4gv4130JqogDFuOFc8mtZBqqsU26Fjx0W9dRwWZSJZ+igGSjB/QigJqpmYUXuIyLQM+VIHf7upqZlyLGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197491; c=relaxed/simple;
	bh=/PFB9z7eQuq1Y4pJuJ1QJn1ObOZGPuUxBj9nEiLfxkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JcqJtdfnSTLdQglE2TSN0qQZM4yDnyNpd8KTE0Hw2pBKDzSwT0svFDefErt9BnYm4NQBPq7HYYEKtx1PrdK8pR/V8tpklu6YLUk6T5q2yFqZwk+39DraRBKnyhrZstvpvu7+r5nQR3U6NhMuqvvd/RuaXUAXt/SEtqIDlOAL10k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac7bd86f637so123867966b.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 04:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744197488; x=1744802288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHvJ4QoCXdHViHFztDB2PyMCdF9qQwAPCaKQQkJlk0c=;
        b=VWxEORGjM+FKllHg9emwcnn6lbElARGZFPV2+nNavGuRvzwpfyfUQTXNwWJT9MPGi5
         16NUNQLZ3mdTxFWtARqNTV5T6VYGi2B8jPKIEOnLyHtSIolRE0jbqbKjbnNP1R1tjk3c
         GfbxQZZ+GWZQ5XQ6FyR4O36WhAhcB9nvN5bz77BbrARg7lREmbbS73tSJqTZ3lEdq0UY
         idmpgtNodB+4bmkYi3TDhXDgWWibf2vAw18CxYNILlukj34M6jzJocF/KYztKKRYc1B3
         wq5fsm9KcpcNLQZzNr07IisLn9JAq+ZsQogJWgM1kRapMFT2NDhIkhUxATupY2SfHnmT
         J8Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXBYjJeGCLF249BSVL5TwAHpZurUkqTxQUvYBbJvmbE1f/pTDhJIPTLRsmTHixDlcU0jSr39C3HaDyxosA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9nLPlwpOI8P46bVcWenLvvWPs3myfG6VeiQKCcfQ6NDnMIbJK
	NiChmvahPzKfMDYWqnJ3NEhzCDB6HkyGoBdDKR136nxylI5EgDTV
X-Gm-Gg: ASbGnctyyL4PoidxTe1Rvijnhd5iaofj+szGbek/wP0wwRRwl1tdAk7drlWGIdVY68w
	dZmeq228LXUoyN7e2WwU+EYYkrpymW3ZcknOcDC6YCu0EnLCf+3CDfVxH2b9+vcy0i6SxuWgmD0
	6cPpDBLWZHdy+yihZA5OoUTdEc3HH3C7exWuIM+FRFlBslbLTJw8cllaVFbXmLqgGYnknkXC62G
	Rf/VUIyau10a3mQBnnknDdyyDUhjiWVQcJOlRNxYmN+R/hrXbUKfk768nYrtE8fuurBR4o+q837
	iuAP/rz13T89RyfxOohe83y91HBq2Cmi
X-Google-Smtp-Source: AGHT+IGUbOcOcvkyjAeh0VARKngjFokz9TnIpC7Iluw4icUlERB5OwDBrZZ8rRRzhIIjk0+yij954Q==
X-Received: by 2002:a17:907:97d6:b0:ac7:81b0:62c9 with SMTP id a640c23a62f3a-aca9c0d8b0bmr187887966b.20.1744197487353;
        Wed, 09 Apr 2025 04:18:07 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:70::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4137sm79314166b.117.2025.04.09.04.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 04:18:06 -0700 (PDT)
Date: Wed, 9 Apr 2025 04:18:04 -0700
From: Breno Leitao <leitao@debian.org>
To: kernel test robot <lkp@intel.com>, vladimir.oltean@nxp.com,
	sean.anderson@seco.com, bigeasy@linutronix.de, horia.geanta@nxp.com,
	madalin.bucur@oss.nxp.com, hristophe.leroy@csgroup.eu
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: include/soc/fsl/qman.h:383:4: warning: field context_a within
 'struct qm_fqd' is less aligned than 'union (unnamed union at
 include/soc/fsl/qman.h:365:2)' and is usually due to 'struct qm_fqd' being
 packed, which can lead to unaligned accesses
Message-ID: <Z/ZXbElRLBsJcc1X@gmail.com>
References: <202504091657.OgPuMa8C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504091657.OgPuMa8C-lkp@intel.com>

On Wed, Apr 09, 2025 at 04:55:16PM +0800, kernel test robot wrote:
> >> include/soc/fsl/qman.h:383:4: warning: field context_a within 'struct qm_fqd' is less aligned than 'union (unnamed union at include/soc/fsl/qman.h:365:2)' and is usually due to 'struct qm_fqd' being packed, which can lead to unaligned accesses [-Wunaligned-access]
>            } context_a;

<snip>

> c535e923bb97a4 Claudiu Manoil 2016-09-22  346  
> c535e923bb97a4 Claudiu Manoil 2016-09-22  347  struct qm_fqd {
> c535e923bb97a4 Claudiu Manoil 2016-09-22  348  	/* _res[6-7], orprws[3-5], oa[2], olws[0-1] */
> c535e923bb97a4 Claudiu Manoil 2016-09-22  349  	u8 orpc;
> c535e923bb97a4 Claudiu Manoil 2016-09-22  350  	u8 cgid;
> c535e923bb97a4 Claudiu Manoil 2016-09-22  351  	__be16 fq_ctrl;	/* See QM_FQCTRL_<...> */
> c535e923bb97a4 Claudiu Manoil 2016-09-22  352  	__be16 dest_wq;	/* channel[3-15], wq[0-2] */
> c535e923bb97a4 Claudiu Manoil 2016-09-22  353  	__be16 ics_cred; /* 15-bit */
> c535e923bb97a4 Claudiu Manoil 2016-09-22  354  	/*
> c535e923bb97a4 Claudiu Manoil 2016-09-22  355  	 * For "Initialize Frame Queue" commands, the write-enable mask
> c535e923bb97a4 Claudiu Manoil 2016-09-22  356  	 * determines whether 'td' or 'oac_init' is observed. For query
> c535e923bb97a4 Claudiu Manoil 2016-09-22  357  	 * commands, this field is always 'td', and 'oac_query' (below) reflects
> c535e923bb97a4 Claudiu Manoil 2016-09-22  358  	 * the Overhead ACcounting values.
> c535e923bb97a4 Claudiu Manoil 2016-09-22  359  	 */
> c535e923bb97a4 Claudiu Manoil 2016-09-22  360  	union {
> c535e923bb97a4 Claudiu Manoil 2016-09-22  361  		__be16 td; /* "Taildrop": _res[13-15], mant[5-12], exp[0-4] */
> c535e923bb97a4 Claudiu Manoil 2016-09-22  362  		struct qm_fqd_oac oac_init;
> c535e923bb97a4 Claudiu Manoil 2016-09-22  363  	};
> c535e923bb97a4 Claudiu Manoil 2016-09-22  364  	__be32 context_b;
> c535e923bb97a4 Claudiu Manoil 2016-09-22  365  	union {
> c535e923bb97a4 Claudiu Manoil 2016-09-22  366  		/* Treat it as 64-bit opaque */
> c535e923bb97a4 Claudiu Manoil 2016-09-22  367  		__be64 opaque;
> c535e923bb97a4 Claudiu Manoil 2016-09-22  368  		struct {
> c535e923bb97a4 Claudiu Manoil 2016-09-22  369  			__be32 hi;
> c535e923bb97a4 Claudiu Manoil 2016-09-22  370  			__be32 lo;
> c535e923bb97a4 Claudiu Manoil 2016-09-22  371  		};
> c535e923bb97a4 Claudiu Manoil 2016-09-22  372  		/* Treat it as s/w portal stashing config */
> c535e923bb97a4 Claudiu Manoil 2016-09-22  373  		/* see "FQD Context_A field used for [...]" */
> c535e923bb97a4 Claudiu Manoil 2016-09-22  374  		struct {
> c535e923bb97a4 Claudiu Manoil 2016-09-22  375  			struct qm_fqd_stashing stashing;
> c535e923bb97a4 Claudiu Manoil 2016-09-22  376  			/*
> c535e923bb97a4 Claudiu Manoil 2016-09-22  377  			 * 48-bit address of FQ context to
> c535e923bb97a4 Claudiu Manoil 2016-09-22  378  			 * stash, must be cacheline-aligned
> c535e923bb97a4 Claudiu Manoil 2016-09-22  379  			 */

Looking at pahole, I am not sure this is caacheline-aligned, as
suggested above.

	# pahole -C qm_fqd
	struct qm_fqd {
		u8                         orpc;                 /*     0     1 */
		u8                         cgid;                 /*     1     1 */
		__be16                     fq_ctrl;              /*     2     2 */
		__be16                     dest_wq;              /*     4     2 */
		__be16                     ics_cred;             /*     6     2 */
		union {
			__be16             td;                   /*     8     2 */
			struct qm_fqd_oac  oac_init;             /*     8     2 */
		};                                               /*     8     2 */
		__be32                     context_b;            /*    10     4 */
		union {
			__be64             opaque;               /*    14     8 */
			struct {
				__be32     hi;                   /*    14     4 */
				__be32     lo;                   /*    18     4 */
			};                                       /*    14     8 */
			struct {
				struct qm_fqd_stashing stashing; /*    14     2 */
				__be16     context_hi;           /*    16     2 */
				__be32     context_lo;           /*    18     4 */
			};                                       /*    14     8 */
		} context_a;                                     /*    14     8 */
		struct qm_fqd_oac          oac_query;            /*    22     2 */

		/* size: 24, cachelines: 1, members: 9 */
		/* last cacheline: 24 bytes */
	} __attribute__((__packed__));


> c535e923bb97a4 Claudiu Manoil 2016-09-22  380  			__be16 context_hi;
> c535e923bb97a4 Claudiu Manoil 2016-09-22  381  			__be32 context_lo;
> c535e923bb97a4 Claudiu Manoil 2016-09-22  382  		} __packed;

I am wondering if we should use __attribute__((aligned(8))) instead of
__packed, according to the document above.

