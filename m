Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A401B0F05
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 23:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751239020; cv=none; b=JsxC11Qzv5CLS8UvH2KSraue/nSURMCdfb/Z8ytQzE1F4hUF9lR6RNnjxaLbjJBFkVVCiyu5qDsoGcPi9lRVxYEoJ5LQfhXDEfqI9Vyq9cs24vLYsT1gYxkMF1KkHfLMLQjl/xGCBxCpLR+ngYG2++muyi1WLcR5Oy5EtVF7z08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751239020; c=relaxed/simple;
	bh=7nu8DwT0qYW42Ol7bw8/MXWrf5qidz5nzjLV8WpXgcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YlbuSdthSXCznMuEhx61C37INAmDrFx43WlquwFgiHsqRDqjKkuMRY3Q6VxiXjCx58tCS22TEPuamblUMeGcxUJt0X4PGxysXoSNktDCGLhknre0t3lxUJnDT7+9GyEPnF1L2F6bS94ONpIdDp7bwCtVNk/Ic6ewv6v8UDRK4uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdSwa7AE; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdSwa7AE"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae0d11bb2a7so561527066b.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 16:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751239017; x=1751843817; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kALrTDBo8YeEwW0KkVu6Bm3OeB7IvDGQQSLJ58v0dDo=;
        b=BdSwa7AEvT/i3CoQket7hABIZ/951MpBEEmQluBUnSAyDdBuAV1yxTYEfosnG0CG7/
         iGBKQJXLewmkm5RNflvk1MCga5XvMw0nyBibX7UnJFFfuJ5MfZJ2jaFi2eL30mP0mCn6
         SN/Nq1Sai2fbrbFhifDfq2xvOTpdd9/QktDTUns4resynEAZN8dtoo/4kMl3Tf8zpMtF
         +2uxyQ1I222H2296Xc+PZqkRfmt5Bm6ETzKXuIRp0yta9DTDQ+ni8hXwGnBz/iJ0X6CM
         27arMIJDd3lH1aRXhgsKDRxYW0QTWWHO5OPvaPxSqf+4u4J6CvDW3lXfI8Sb+JR2zWGm
         eldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751239017; x=1751843817;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kALrTDBo8YeEwW0KkVu6Bm3OeB7IvDGQQSLJ58v0dDo=;
        b=UpniWnzLnVe2v0ntgFvq8vt2tlwGsY/FqzOtKKLDssPLPGXG65w8bQNrfJkLyNbaRw
         zhUsCn5jFZ9q6W6tk8Tg1/MpKzpEFk5SY+uGxzVRvZ8Bc0gny1apFLqz6X6xJn679YjU
         uO+/hF3D62NRZcwmY4ATZu9a06FkhAWH+uLB4sdv/2heJcFMkw7XjIlnIW2TbF6buZub
         b5Fe+glhxhAln7G5NG+5Rw/yyQeYl0l70vF0TTKMvsG5VueHG1BeSOBfptFTG7RUFvdn
         6MakdO/wB7+ycfs716ER1Dch6yd4u5S19qlzQKxeAhO2E+RIJh2Qt1TNJiokY2Pa2N3A
         HN3A==
X-Forwarded-Encrypted: i=1; AJvYcCXKTRd2ysMU6XMK2cqHsrHXNzHXnUh/MpPaKBEyWJEfmwrKihTFkoTZTqYX56FTPz20wLHGBeCgYRaVKnY=@vger.kernel.org
X-Gm-Message-State: AOJu0YynHp1wB9MGzY6UH7CCmCvcLz6LUPyGZajZYfQcNX+VJqzu1AeR
	ZWOkRO7CDWydE6nJs1uPvkuMuJcvlwlP8+x9QJENglAWkOyQy6GOHovi
X-Gm-Gg: ASbGncshRvpXIi9liJx8K8tXknQ9+U6MigemSuZOR71dNXwsL1YUjuXrVmXkc2UqRkx
	VB2ncWMXProRJBJPHWlG3m7mPwbhN0nW9fcg1LN2kdeXzYc0ZelrvlBNLii42LWwThd5Jl6NPeY
	aDn5wPJMLgCIIhJjcuv9cCOSLPf4T61iWRjy0EQp9Lel1JkYtitUvSxE5l4uVLHXa3Ebi7Hr7JM
	NglS/grxAnyT99wTjopbdEsC13l0nRsV88yMR/9C6vf1HwbSnn3qubKBVk/tB/jTJOuYQQSTt0u
	oO0rKPi8oLm4aSz4zfuDqgySvOdHJRI+imTOonCNfOmplmFkoH5PcZvB6540LQ==
X-Google-Smtp-Source: AGHT+IHL0PEhHhgGy3McRpzy+oEsHDxMILZecgX569B7Y0zoYT9MeEa6msfcawxFu+XQXNXUv6qItg==
X-Received: by 2002:a17:907:6d17:b0:ae0:d73e:eea0 with SMTP id a640c23a62f3a-ae34fd13222mr1030763566b.12.1751239016899;
        Sun, 29 Jun 2025 16:16:56 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b0f9sm560998366b.5.2025.06.29.16.16.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Jun 2025 16:16:56 -0700 (PDT)
Date: Sun, 29 Jun 2025 23:16:55 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Dev Jain <dev.jain@arm.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, akpm@linux-foundation.org,
	richard.weiyang@gmail.com, maple-tree@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] maple tree: Add and fix some comments
Message-ID: <20250629231655.4qyiututsi4vutsx@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250626171918.17261-1-dev.jain@arm.com>
 <20250626171918.17261-2-dev.jain@arm.com>
 <bxhfvhmk4iyyz7l3nitsgf4xgsydraskligg56n4ww3fe5zlvr@xqzh44dk3q5b>
 <2d55c06a-f4a5-4728-b692-60d88a5fe692@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d55c06a-f4a5-4728-b692-60d88a5fe692@arm.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Sat, Jun 28, 2025 at 05:26:18PM +0530, Dev Jain wrote:
>
>On 27/06/25 1:34 am, Liam R. Howlett wrote:
>> * Dev Jain <dev.jain@arm.com> [250626 13:19]:
>> > Add comments explaining the fields for maple_metadata, since "end" is
>> > ambiguous and "gap" can be confused as the largest gap, whereas it
>> > is actually the offset of the largest gap.
>> > 
>> > MAPLE_ROOT_NODE is used for mt_mk_root() and mt_safe_root(), indicating
>> > that it is used to mark the node as root. So fix the comment.
>> That's not quite the entire story here.
>> 
>> The first pointer in the tree may not be a node at all, and may be an
>> entry.  So having that bit set tells us the root of the tree is a node,
>> so the comment is correct but maybe you have a better way of expressing
>> this information?
>
>Hmm. Can you please correct me on my understanding - when we have an
>empty tree, then we insert a root and can store a value there. Now when
>we store the second entry, we allocate a node and make the root a node,
>the root points to that node, and we store the values at offsets 0 and 1.
>

Per my understanding, generally it is correct.

You may take a look at tools/testing/radix-tree/maple.c and use mt_dump() to
see how the tree changes.

>I am reading more to answer my own question.
>

-- 
Wei Yang
Help you, Help me
