Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6133221CFE8
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 08:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738830176; cv=none; b=cUNZPvIBe45kZ2fhs5C7Ui/utAUQAafEjjFWcCk/Fs5qN0qTqwA/Whp/HaFVdG5U7CXv3OE+r5T6ftwB6dAmZiNdp1TMSNdrPIbRr7wzYqkuLqQjzM+mAUgVTbmNqOVk5aisgmpOQOWw6FieBAZekdAvNGW75vRnvVNPElZOX64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738830176; c=relaxed/simple;
	bh=bg9ujw7uFbNGZFUll1kPYLcYcu/ANgs+BUP6Ak4GHLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGm+b3uBzpHYhLCtL32ULJtOqcMCAHAiVUS4Vt7NXvlxTswn23hULjjui5QWXfNfzz+XyNz/wwEsr7rgSU5UHjahfbLS3NMUMnU/8DN9blsUjsl7PtX8/N8xoFoRL17jV0ephLnqYe7HyqoI3iebE75jVNXvOqlt5bN2QH6K8a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XsMl03qQ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XsMl03qQ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21f3328f72aso5290445ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 00:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738830174; x=1739434974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xBj4dEHovq6rmCikfKh4C+pq48sZ0tP9QKnuVG2mHfg=;
        b=XsMl03qQBXlFKtBLpgSzLmpVIDC/fRMA+agb4Cg0L8i9zzIRvJEl0lIhUzkaVv8AB5
         YHzX+3PBaSY5SnO9o07V14UL4MvGLKJD4qPZNl5b0Eiz4yv7oEgFtElYQi1BqRVSCHgF
         6ezqQpvuyUOVxD6SgrHAvywLusFDERowo0QeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738830174; x=1739434974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBj4dEHovq6rmCikfKh4C+pq48sZ0tP9QKnuVG2mHfg=;
        b=psxE+ZzTOxZpbEcK7KDIFbIuy+GM1W5euw+voBKvCS4y1o7+Zttc3V4h6BO4x2Nbxs
         fMOVnnWSOYjOhGnLawnx7ZQknlGxealRPrNRWRs6wJsOfWvBYn4w/T3bcYbOm+mw7ZHc
         Tam98dZbs0T1/05ALtSdHGVcBfSF8yALOQ9EzN/Nc4xxztEckqxSsTge7WTVnzITEWPq
         OhZ2AR2/gpCvZz9XlOhY7Mfexlyn0I6I7ge5B8rDheaXELnjnERDTKm2OfL9k9xpwZtT
         6iRNc0ftHlY35+RtqxHT53xza2MGKPx5nNxzRyO1O8YWF5lUjPK9T22bSGenBi2UJzDf
         zysA==
X-Forwarded-Encrypted: i=1; AJvYcCXXGIwZDa4dXnaCVeHKY2ANWbKDSma9uOkH1wFPPhtylwqp1ek9taDiNcsgrEAhUB1WDDgBFEpkRu+gquU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEMY80AGs3d+MnUrgWvgUopgkPDtujxz5V1BEyn8YRpW+mgoBt
	oE3sDp+xOMVOT3rBZHRdT9nB87hw3I67uj7GUzyad6m+VjlUDC7UE2nt0AVez2gSMm9P7g4TxzU
	=
X-Gm-Gg: ASbGncse/fhRQXy9PR409FrNZkS++NSxto1hRc0h5QDxqA1ny6o8z62B1IOLE6WGW97
	vfPP3UPzepJNA1rXZ+qLcwsFOqfBs495NWKTLfQzKdWQEcl7cREclQLNYhIYnrF+inG5HhTUZiq
	T8GyrlUSpbAmT5w61wkYKlWJlpKqlwQogoKcRuC5GoqooddSnGOuslV3mb0dx4cdhU2LLiYiMMl
	anrydLR919A+JY5MGkdMDHEKg++wlVkxVyppIsfD85MWyOqFrzEdNc+EHsFYDpOeHSr+tq78nL+
	YDyAIyj8Q+B+ruMD5vI=
X-Google-Smtp-Source: AGHT+IE4ctymN3GmJ2NIk9JDhOA2Q6JmpWiBbywcGEW09fGrHORU9ul0kl9mDT8VjfySxTOfHD/53Q==
X-Received: by 2002:a17:902:db07:b0:21f:1c9:ce48 with SMTP id d9443c01a7336-21f17e47109mr93841085ad.26.1738830174528;
        Thu, 06 Feb 2025 00:22:54 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:28ab:cea4:aa8a:127a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c4dcsm6875915ad.170.2025.02.06.00.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 00:22:54 -0800 (PST)
Date: Thu, 6 Feb 2025 17:22:48 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Kairui Song <ryncsn@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosryahmed@google.com>
Subject: Re: [PATCHv4 02/17] zram: do not use per-CPU compression streams
Message-ID: <u3yog2zhhmqkiwhugvhslsn2nzacleoiiw4mylhocsevxr2h6p@q5s4exyjkfiv>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-3-senozhatsky@chromium.org>
 <CAMgjq7BFUrUY5Xq5Eks4ibqbWgJcca1vqB4kq=otQVyG=23FRw@mail.gmail.com>
 <ryc3rgu567q44d3ck4un5itf77i2os4rqx3ruohivaqscn3rrt@ms5xoipyi72q>
 <CAMgjq7DKveiCJVb4ACSaLFV0Q1_Yd+sbL_X2dgXz6QGYwuNRTw@mail.gmail.com>
 <ysqyikz2jhnvjkhmkgwekbmz6dykvjssut6n3t746tpsscursu@zc6rg5xgk6sp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ysqyikz2jhnvjkhmkgwekbmz6dykvjssut6n3t746tpsscursu@zc6rg5xgk6sp>

On (25/02/06 16:22), Sergey Senozhatsky wrote:
> I didn't know it was possible to use per-CPU data and still have
> preemption enabled at the same time.  So I'm not opposed to the
> idea of still having per-CPU streams and do what zswap folks did.

Maybe that's actually a preferable option.   Allocation of streams
on-demand has a problem that streams' constructors need to use proper
GFP flags (they still use GFP_KERNEL, wrongly), and so on.  Keeping
things the way they are (per-CPU) but adding a preemption is likely
a safer and nicer option.
