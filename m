Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA6479F2
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 01:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750727136; cv=none; b=kuizprsgwjw+ffpAFRPNphctSqpCbXHxWgcd4nSp+m9OSRjepVScyQrapytgeEh0wV7ezH9x9ep0yEr+ggP7FFRkpDU8XaFVbdWd/2ZeSCRgpq+QvYhlxfB10/JqEwMkxqQwwvnnhFiRCkIQ9MnTyrUzCAcxQJ2SfGGEnFUQ9OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750727136; c=relaxed/simple;
	bh=HeEBpnczqK98gFBheID0waHXIyf8L8g+U38AEDFIQyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VrY7T9WEH3shhyYaqG2aGZTZdoZmSkb6GgozXnFE5AIU8ccnkuyL7b2FZZilNsPDqNlktC3ekVe4FlICXX5dJutJgncW9mZC1/z60yQ4CsvR/jIWL97HBqOTYbP/zFE3OLgbe4nCfhaX51k2B6ozDNcnFDezW+qWcZ4cDjrmQ1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6IL/ZDz; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6IL/ZDz"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-532de49b7e2so206851e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 18:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750727134; x=1751331934; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wmkeh02O3FeRv42Ev8tu/Bl3qINyE2JFkylUQ/agpEw=;
        b=Y6IL/ZDzEuLZFMUV6iY3pO7uHKg+rNwLjndqjDb7nL+Md8vkeLnZuQOLI9mZp3cFzm
         RPuux0S3kJTgjxQg0zP1jHTZoo60yG0DbVUrcwdjSp9JGSlmSuVZDIYwg7T+Z02FqyWN
         sunh8dUbpwR1CD59t3LhOAPDAON6OcRkE9hzNhB8PvqLSIpebrhFpLfEjf4Yfkqcba3l
         ONLbJOudq4vO52Wo4UCtYep9Y/DxI2EU5F4B/GtszU/CU+Yg/sVrfuF4BOu5LbdJh+qt
         4CmZiXbSoYIKrlwCAcOKW4Rwv6pN3sKzp9gLxltbWcbGnaCvEEdqlp5K1oW+FUpmObCG
         VRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750727134; x=1751331934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wmkeh02O3FeRv42Ev8tu/Bl3qINyE2JFkylUQ/agpEw=;
        b=YOshkgQ6MQcmSKAHcIBwRY+rNTmFx62aKDe6x2kAaFKxe5HU+iHSvmvVZ0ykKNuhH0
         iD8F7TwIAw/iwejF0nzNI2gx4GQfVVVSyNfP27Z3ZECsBDaUw/icoc4DwfFmyki5oGjM
         jfrLOnKIiDxDhfuk3oDgF/PAkuXpUziAfKyOkWpqDOT2YnflU0d1S4sO+9Q6LAfSUK5f
         BZoJK6Q1eUkbq4GrylObx+9xjygeQfUBl6lIg9fuK9xVto7x2gQY+rsxpraeQ+0GVpH6
         eAiXHkiLd2nuYU87UY0GAhryzwJURhJETuLin64jedoXPElpuzdN50pYdldjiqmGt4ME
         ii8A==
X-Forwarded-Encrypted: i=1; AJvYcCWzqmaVykrWRbyy8TNEEApeiDjt/U7Fr0kF18Er+BEU0UugSJuYhoqxOIy7AuL9nmJcoL1A2LUm2fjyWkU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/VEHYjBbySDswsNcDu1jhw5isgW15uXRD0lnN8vM44PsYOTDw
	zvCAWppUZXDWhBZoCAmdZ4r8unh6Q1N+j5n/4BVzOYDXf/XNowDv/U8M8STSSmTjEfMWghlAhI1
	KAsrjFHLyu/bxSg2R3VCiKogs5rmMpyg=
X-Gm-Gg: ASbGncvS0dNHURvSTqKGXQS72vg/iD+Fze+sM7sY3VM9QTuqcptzLZFqNAQ9cY0kAzy
	jq89L4DrU573UdwPw7mQgt3xP9zIYlDVZujMBSxSATZbJCt/ECYD2H/ZmmJwHI4ko/nMb1bywR6
	1Ap7YO/davkCgHyqSdKvJKPfJsyPPeLg3gisvjDfUOZjm9duMeF189mg==
X-Google-Smtp-Source: AGHT+IEO+e+3lV8g5Vl93wLo7V5HtixLSBUG9hh5kJ0GIJdwxP/WV2y2BnIaTCHIaVZYIloASjI1u/mbF9djBJ+6BVo=
X-Received: by 2002:a05:6122:78d:b0:530:5996:63a2 with SMTP id
 71dfb90a1353d-531ad86d9femr9596660e0c.7.1750727134097; Mon, 23 Jun 2025
 18:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1750433500.git.lorenzo.stoakes@oracle.com> <518480ceb48553d3c280bc2b0b5e77bbad840147.1750433500.git.lorenzo.stoakes@oracle.com>
In-Reply-To: <518480ceb48553d3c280bc2b0b5e77bbad840147.1750433500.git.lorenzo.stoakes@oracle.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 24 Jun 2025 13:05:23 +1200
X-Gm-Features: Ac12FXxHr7lCHVAg0CKYT9Vu5jW2rD5YG_mrzrV7mswUqpt7MSvGBlJuyRVYRdo
Message-ID: <CAGsJ_4zaqCkeG1L4y_=tM+L08h_-hMc04dVQpYWRgf_RUMtGTg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] mm/madvise: thread VMA range state through madvise_behavior
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Lance Yang <ioworker0@gmail.com>, 
	SeongJae Park <sj@kernel.org>, Suren Baghdasaryan <surenb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2025 at 3:33=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> Rather than updating start and a confusing local parameter 'tmp' in
> madvise_walk_vmas(), instead store the current range being operated upon =
in
> the struct madvise_behavior helper object in a range pair and use this
> consistently in all operations.
>
> This makes it clearer what is going on and opens the door to further
> cleanup now we store state regarding what is currently being operated upo=
n
> here.
>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  mm/madvise.c | 103 ++++++++++++++++++++++++++++-----------------------
>  1 file changed, 57 insertions(+), 46 deletions(-)
>

Reviewed-by: Barry Song <baohua@kernel.org>

Best Regards
Barry
