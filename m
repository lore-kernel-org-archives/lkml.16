Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AFD28CF41;
	Mon,  7 Jul 2025 09:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751879530; cv=none; b=cq4fcuJGKSxEM1vNvn2BTj+mOvKEFNqFWaL4k8ii6WBeu3Ap5spsNa+f5HM+THM0SXFUSUfECTmFxe1nqRVHPI2pSGjy84qebddFSH+FULVcrvjR+E48zHwT5ajdRmkbRaoCQojYIYmJUic5bVKPPTfSWS/R+DqFTqfVg4lgKt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751879530; c=relaxed/simple;
	bh=1WuO0r48yC6eFJp931rqHxluruPe1akaYb4Ab854ceM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KUPGSb/4vFEssAccSmuPgQ6uHAqoaHDLNeABO6sqf4C03nGF04N0iKRZKE8EDQ4oGf4Ia4lzlPIqFLCrFjF7BfRpuj5+krDKejEyK8GsiwYDUuFoSJN/3kGR8FJzWxTeR3TgBBi06Tcbx1x+p9IaBCdnjIpKsl6lz3Jr9f8CdR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ChjIuhdY; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ChjIuhdY"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4537deebb01so15780845e9.0;
        Mon, 07 Jul 2025 02:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751879526; x=1752484326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ib11SVMqO+bCPjfEqENNLpCpx2gzzGABjISwhN1BERM=;
        b=ChjIuhdYPFmRTVSy8Q6wiZCIbpqawV3VK0qCtFFzBeL7e5TPgZiIFQBJR45sRFOK+Y
         6rTUfkxVRyqO3vIAvPB6oV8sDWi3+h+2bcIiM3tq98dIDmuL6SdzNfQH77YcDT/5NbRB
         Q0DtlIWSUerMXkeckrkezYKeb6w0ArVLiXzo2A71bMMqLghzHtgrKok58+I5ZJya4gB2
         s93VkpD04EcU1+VRZrqm9dlTfdBbtSeb2TInnljHrFW8CwDvxXBlihYR3TdcsziNSu9l
         SAn/94ZKs4Wvw31WHkU/SxfOoH1MkN9IvT7FtchsfDYmaYdYr1jKG6vH1S5T3Kns4wSD
         ApZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751879526; x=1752484326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ib11SVMqO+bCPjfEqENNLpCpx2gzzGABjISwhN1BERM=;
        b=JbIEpGjQkGRkpWsnjNkVxKlIj6alNc5I/AIP6Sg7uSm/Mp0hcaAhGSdAfHnqfIuzv9
         +Vn0LTeXrxsY0CcZWzrlAnS83x+v5HqjOkgTlxpX0Tm3CxF+bSeaQpB2GfB2w98WMj+Y
         YU0pnfXBJhCDAjeY2Ag96tq0Layv14X7eov0OWCnibo4DX2/9y2PqntCCvYMMdZI2EMD
         rLDPoj4hXbjIwWNJUXs3h6sK2o2x7A8eG9qArXKRwLjynhCGY/Q/0hDhCXVebzjtWbjK
         Hv787eMMMAmb4IlUO7nGtb1vhMDOZUqszFmTpN6DI1uHJgZXzkfi6I0wJE9Jf67U7k1U
         RWoA==
X-Forwarded-Encrypted: i=1; AJvYcCU9/THziILXOoC4z7rqYkKq69eusfJCYJryDNOhMnhJALmMqPH63BpKjCpzYjwCVXNLi7SNZmrpWXxeqINC@vger.kernel.org, AJvYcCV8evkXFNOV4qy1a36FvtIKaxu5RG5/238EexeFtlaFpEDRy7U+1FQuAhGnbEzt6ZKyrOw8Q6Qb6og=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRFayHe6fQO1uZCiBFCxVjt5RxiFgxzZGBEj1hPCNad6W7X5tJ
	Ladk19LlUb/WUfUrrR6I0UtCzcql4Qa8FdGW+YCG/qnJiLyLsVZu71Ov
X-Gm-Gg: ASbGncuZqLCXcuJlfVDXxAxlzhaw/RzI3pkGFR7EcjtWNCy4H8HgYMLKIIZ44g9U/+J
	VozYa5ESdn/+lU2W0BOIGBoPtCyhBmCCQPlCsDhDL7ueJGP4FFonSHIvzBiQLPgalOupWUW6IlI
	6CNtGYFek/s48eVua7/UvdxDc5JNyPTNFyGV9zP4ox7Y/XVh74KBwrtzcQU2SC9frLCaHlBRZKC
	bkYcIaHWCUHSKcvGNNkFQuN5EkiawHWkUZn4ONlk4cTZEDsdXX920B8oKHoDb5mo1hHcAL9h27m
	uT2YWyruGkANxPSwkygxHp6MsCv8q6S5H7dFBb429HhPjDRIbsXu91iEHbF/8pPbin6XDgOzKd3
	z1Sm2y0Bhp7BVLdfH/Q==
X-Google-Smtp-Source: AGHT+IGxcVZf1l+vxP5mro3W+LwQYpbSh3U11ht+jGbx/Qt2czfDLS6qitRuCRhypgqzb6GCrwXK8w==
X-Received: by 2002:a05:600c:19d3:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-454b4ea65c5mr85853575e9.21.1751879526222;
        Mon, 07 Jul 2025 02:12:06 -0700 (PDT)
Received: from pumpkin (host-92-21-58-28.as13285.net. [92.21.58.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b188d8e6sm105246025e9.36.2025.07.07.02.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:12:05 -0700 (PDT)
Date: Mon, 7 Jul 2025 10:11:56 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 kernel@collabora.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: document linked lists
Message-ID: <20250707101156.2cc84294@pumpkin>
In-Reply-To: <20250702-linked-list-docs-v2-1-e36532f4b638@collabora.com>
References: <20250702-linked-list-docs-v2-1-e36532f4b638@collabora.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 02 Jul 2025 22:24:47 +0200
Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:

> The kernel contains various generic data structures that should ideally
> not be reinvented. However, it often fails to document the usage of
> these in the in-tree kernel documentation beyond just a listing of
> header symbols in the very lengthy kernel-api docs page. This is fine
> for things that have simple invocations, but occasionally things devolve
> into several layers of concatenating macros, which are subpar for humans
> to parse.
> 
> Begin making a small impact by adding some rudimentary example-driven
> documentation for the linked list functions. Many aspects are covered,
> though it is not an exhaustive listing of the entire set of list
> operations. We also direct readers towards further documentation should
> they be interested in concurrency.
>

Jeepers; TLDR.
I don't think the kernel docs are a place to explain linked lists.
What may be relevant is a description of the types of linked list
the kernel uses.
For that you pretty much only need a picture of the head and two
items showing both the forward and backward pointers.
Then a list of the valid operations for that list type.
What you can (efficiently) do with a list depends very much on how
it is constructed.

Then repeat for hlist and hlist_nulls - I think they are the other
main list types.

IIRC 'LIST' is a double-linked list through a dummy item.
Not my favourite list type and can cause the sanitisers grief.

	David
