Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B96610F9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745474712; cv=none; b=HlT1Ru6py52OAsV1BPTNJuKnQ1pwaOKAY+k5Iu5Hh/fNa0chdbpiL78TzPt9/2tpEH2TvdntmPFrGlmErfGAAnGKFCGHHKfxRsDd1uJIznacsisL9fMDwxbQJYk7kfhL8VdKlp75/lPrrkyrW9oLhTdbj/eZFe6InsdDROrK8lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745474712; c=relaxed/simple;
	bh=FgLcY9UoJi4Lz6XopnViT8Ecbt0JoHdDYBsvaCncXhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RJ6V9NDcOO63mkLqIJTEoaMYpFUyua3FG10nOlQH0IKhjh2a9LKg5wAD4lZEF417EuYzg4eGaLOhCOhwpRHMT0Zhib9U63QRasV5jNkZFQdYrBWJUef/DIxLGzdMArnZ6Oyswsf7HAMhxhwlQYc63CjOYTVDY2k2iT8uGbCMg6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3cMGFz1p; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3cMGFz1p"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so902448a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745474707; x=1746079507; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FgLcY9UoJi4Lz6XopnViT8Ecbt0JoHdDYBsvaCncXhQ=;
        b=3cMGFz1p5fPDHahw+F5ASxmeWGx4wE1mjz+g2wf6o2/DdLzPBKkbSQbgWbPmDl0AAR
         2+Yk3P8ug86GPrJyN1r7UUP9ThDQ8LO+BXoa6PK7haF3AZK/JteknL+pvANh6ip3bQi7
         HFZ28tMm91iSQxhn4v3namOmMd85QIeTXIqJBZ4bVVUSa73MSU9jwa1/SjZoym3WXgKY
         Y/yaUtPnT3u39Th9SaNylwSG05IQb3tfnYnV5QyMgJwwBdVVpnBpvR7q6zKIsxCtV1DQ
         pIOu3/SvqdLlofjlbKlj0zOs0a7nmav5eFqhtWKweoIaGqskdVfas2aRPqd2KTKLPlxc
         gf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745474707; x=1746079507;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FgLcY9UoJi4Lz6XopnViT8Ecbt0JoHdDYBsvaCncXhQ=;
        b=ZT4XcI0T/Gb1SblMwM9IgM2D+dXRVQ86qtJm26iB1E+lQp/grlCDZ+9PTdj/GNijBa
         9WQgTQomSUPMiKx8Rl+xJupyxM0ab++Qp0iB6iMOMUcz+SaAPCQefSw2yRiX3qiH+pSk
         b2rODkHayjy+yrPpk4sWL4ZTpS+rEk8JGDYAZYzwFQxBhpcA2ZRBJItUx1y51uZCJO/B
         5HVNQmd4gdYc0h2of2zHJy/CGRJ1GxvR7lbQgj2A+dYg+HvERQvkZrLrDgCck1KcuVqm
         i2H9SyfSrDpu9Zz4nwikNt0ESJIMqP1ER4Nz+zY5tZAAvtKiEvvCtdtyO/v4fBFJVtAm
         /BPg==
X-Forwarded-Encrypted: i=1; AJvYcCUWP/GEyYD5rxEy1ZEnRbE4VOCYZqsX2aBMqVTfSPVkvUwx5oDPIP4sAlfN3u75it7aU9xG3OeSkdexI24=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjcbFLhFPMfHYswhIuJT/PqPXkVeirAL3rtJht5pRhD+R5g0WZ
	7Nre1fm0NnFeWLkXOdXMgNEx5JaJXpFc2DvCKmFowX7asT75garcvaM0EdGjmaS6LxsavSMp46M
	23XF5y7ITLBUP+9JiUpRXcuoMbDu7nXC+GsIX
X-Gm-Gg: ASbGncuKAZEQArzrPiZhkW+dHeNWDqZao/d3MtGor7wtkIZpomYt9Oly46MLch3LKt7
	Yf2HQi401L3K5GQzyuhjdCeiH/B2fkVgta96VG2JACamKAi4LhfwSHMjiCPbsYJOFR8kiLZnJBi
	ie7q2QGfR0n1kwmt8MIDozxQ==
X-Google-Smtp-Source: AGHT+IGY004qp6xO5hpjOrDdxnAVM0lG2ykMQcFg2nQh/uVt+HQBW4bobGq43stu5J/Kmy7rjJ4V4FN8UhJ7Tau1rYc=
X-Received: by 2002:a17:907:6d1e:b0:acb:8492:fe with SMTP id
 a640c23a62f3a-ace5748b945mr131046766b.52.1745474707507; Wed, 23 Apr 2025
 23:05:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423061023.131354-1-dhavale@google.com> <94c702b9-cad5-4727-a7f1-16de1827841e@linux.alibaba.com>
In-Reply-To: <94c702b9-cad5-4727-a7f1-16de1827841e@linux.alibaba.com>
From: Sandeep Dhavale <dhavale@google.com>
Date: Wed, 23 Apr 2025 23:04:55 -0700
X-Gm-Features: ATxdqUGZy1kQsEX662y0kBBC-fBrdY3CPiMMq1EptitRYRNGrcUwldc7K2xvlN0
Message-ID: <CAB=BE-SwcvC0sDXAVoK+C9V8Ags+1VanWY_n1hgg8k+UmKH+0A@mail.gmail.com>
Subject: Re: [PATCH v4] erofs: lazily initialize per-CPU workers and CPU
 hotplug hooks
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: linux-erofs@lists.ozlabs.org, Gao Xiang <xiang@kernel.org>, 
	Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
	Jeffle Xu <jefflexu@linux.alibaba.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> I could fix up this part manually if you don't have strong
> opinion on this.
>

Hi Gao,
I don't have any objection to styling as it is subjective. I am ok
with the fixup.

Thanks,
Sandeep.

> Thanks,
> Gao Xiang
>
