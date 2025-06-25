Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727421E9B04
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 21:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750888326; cv=none; b=YGe3Kgd8L6i6XVIz5Xd3gssu2EaBu7+tZ7SKbk78TiJYL0fCQQsbHBXekKH3A1hX/Q8bQDXAaIRmh7Mv8sA4J53Uj0v99WGInBuP8iG3T+RUqkNRGjqbgGmhbCzCWW/XFlhoK+OfQu4d1SNEO+ebZwu0jbvqpKmPuLrYvfPXJvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750888326; c=relaxed/simple;
	bh=8gWLbwOk5igz/abwJ7DtKa+yMldSLIe+QHXq01J5WwQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=o5Tkc0c2tXC+Mz4zMZxJTEnf3VZJ3DITA5CpBRQHOtdc8mzvHUTP9OOSrevUgUurbz6Dm5D51Zi/+5b9otgrt0lTCogI6SFkkQGEzISk3HCvkt+feYcq8s+Y+G+ZD10DjbVzJMUmA6kp4aGgWclvqCuSinHRRKLeHvKlTQWQMUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s7ADR9Ql; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s7ADR9Ql"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e81f8679957so259699276.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750888324; x=1751493124; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zn3wkl/8rFNEaRV9dGBaoEQ5JkNSFdHxBuYwPyRc1yU=;
        b=s7ADR9Qlp4VeuBh/gR7Yw0SfVhLnu/LFuq7H6dKxqrHnR3ik+1e1E/6Bu264F45IGH
         PBBQbbVi0MFGLV38mU17dZqd2qhgWXp09VKpCAnQ4SyaqpUrji/RGmj0AWn8lrgbCFjf
         //FJbCRxc3yAaLOEXuh8nI/zk9DEgErlT+GeJrv76WyU2ZW13W9Uh2RlMqAoYlJ/AE6Y
         uwEtt1l1pvdCMAVly2TVisKyHWySGDjeTXmGynZvnpP265yqStfjOfu4cgkuDlj55PrQ
         +clZnA+9a5GfyWbWplnwCBJ8NSZSb3sSvxWJJfi4cY6zvAEucdjVbP31q+fhzwZhIlip
         WAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750888324; x=1751493124;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zn3wkl/8rFNEaRV9dGBaoEQ5JkNSFdHxBuYwPyRc1yU=;
        b=kODS4sPUmRxiWgQbW3MSv++746yEPPvoVySmNoD392PCBr2rXy5HS1qoHE73U5Uohl
         3UTHgZdcsGfrVzq6V4W94kw8v0qqMjMTtlrRPMG//KCWQ+fz5jGWf8TH1hp7EqTaPOyh
         zZMHpyhmi+iXc0znnqQel21Q26CuCY8KLwTqYk6RL3Mw3peW0uJXXp8xxbemUQzxIAFX
         v2EEeQ6wQ0XvYjhmJlzBxYWUmJk9Q8Fo5EpW5GDGmJMJq4NzgfxT1Vt8qJKxBDRdT5Qc
         TcjoGBhN3pDiNebZZ7TNVmZtxTBP23//XGl8tglFCvjdfJBYC6jqDMlJtAT8PzhupHid
         5Z0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXe6XM0xasWAH0PlbJ82xc/FNDQGFrlfi3erellX9wlj01I5MJXhdVVXwctQj0OLUWZKJZxxzm11uEn6WY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb4ZOpj5+iKV207Bzp+59PwOy3BWU2+Wa298IbSEJuzNWcjvNT
	5OKgAuWrVhuhi9Fa5Lcpkjj+FzopbW97DL7v8ifvLb3VnRT1TuQJp9GYTeeqcg4rdg==
X-Gm-Gg: ASbGnct1PBjZVmtLiRlKVqqA786QhGWYhcsirqn198wXIwOF6tL0/jAVxxqJyzxkxpq
	McJpFQvWg3Cy1kvB0GsPUwlen8YrlvWFwgE5nlqD53Ef+9RaHwP2PyNUPJcozU+zFW8bRG8hVmq
	bUtDYKj8PJyB1FNfAXTOCHnNj0VQLcO+A0q6lqNc8ZlkTWBwOdGgkY9sfiJF1kX2xQCUuIj5koR
	0db/SqcKgBS3QZIfEfi/h/I8qJqc60vsY5jVmkmkSlpqnM83HYm4rQE6k1fsy6qyFv0nelrxUAY
	73MwEHEgoDxJC6qhcyXOUU1jEg8VJm67DYE17BZhwWgO/833/+qIRequ/5+iHXwCCLD76LYcQmC
	c3EhjS411i/dKSMMPzBkykK8/yW1ijPKQ9/2fJuW2vX0j9XM=
X-Google-Smtp-Source: AGHT+IHca06mCSOznvqnZXmdMtIDiuoPO9Ny+dcngUNKJ1qC16ANTlTIwNA4GvPhmZA93uvUS/bCCQ==
X-Received: by 2002:a05:6902:1106:b0:e82:3d1f:29f4 with SMTP id 3f1490d57ef6-e86018ef30emr6124620276.39.1750888324147;
        Wed, 25 Jun 2025 14:52:04 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842aaed6e4sm3886264276.20.2025.06.25.14.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 14:52:03 -0700 (PDT)
Date: Wed, 25 Jun 2025 14:51:52 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: David Hildenbrand <david@redhat.com>
cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
    Hugh Dickins <hughd@google.com>, 
    Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org, 
    ziy@nvidia.com, Liam.Howlett@oracle.com, npache@redhat.com, 
    ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
    zokeefe@google.com, shy828301@gmail.com, usamaarif642@gmail.com, 
    linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
In-Reply-To: <8691d74b-67ee-4e26-81ac-f6bf1725361e@redhat.com>
Message-ID: <3ec483b4-9f13-daa4-68ac-2af3eabe8583@google.com>
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com> <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com> <9cb94544-f65a-4394-b1e2-bfb226ead31c@redhat.com> <db757c1f-8666-4a73-ab57-cce83059e95d@lucifer.local>
 <8691d74b-67ee-4e26-81ac-f6bf1725361e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Wed, 25 Jun 2025, David Hildenbrand wrote:
> 
> I know, See my other mail, the problem is rather if there is no somebody
> relying on never+MADV_COLLAPSE from doing the MADV_COLLAPSE-documented thing.
> 
> It's a mess.
> 
> (I have the suspicion that Hugh might know of such a user :) )

I've not yet read my way through this firestorm I've raised,
but on this point: no, I don't know of such a user.

You'll be suspecting that I know of some such use by Google: no, I haven't
even investigated to see if that's the case; I think not, I think we're
not neverers, but cannot check at the moment (and might have got in a 
muddle with the defrag options).

I never(!) bothered to investigate that, because if Google does rely on
this behaviour, it is very easy for Google to maintain its own variation
from whatever is decided here (though management won't like me saying so).

My concern is for everyone else who read the madvise MADV_COLLAPSE manpage.

Hugh
