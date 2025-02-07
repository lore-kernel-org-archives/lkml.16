Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117961DE2BF
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738920997; cv=none; b=td7XBA7mSBuTmobgb3MwiPkQYYua11aWlqughJll+yk/jGv54qqR+XvdvzqEPTMY3wU/5gQzgm52f4EqdYMl+85+95lO1L7MB7latC1YFtn1VV7j8xx09aYVfYOymIjQPb7bujdkVHdIV6oq7car8QSlkJIqvZnUxBB00+OPaSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738920997; c=relaxed/simple;
	bh=UxAd+wsP4rNmPqXX/KMWm806ndMuANqheCq3j79eOZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OBoOFgoOSZQqCinzvCNRxii9Aytan+ZbqGHHBPrX3/GbETKJn6DD8LOMZj9O+7FtTH0+/BD2prMuRKKBljXEMK6+s+ye67YWEtFRDMjWy/PPocqReBBuP8DSiu+TvpJ7iWtGPFsfOj0zahoCS4kfeyVFUVzn8CP5L0Gk4COz0BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4nPrz1n; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4nPrz1n"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-307e00d6b09so12283361fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 01:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738920994; x=1739525794; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxAd+wsP4rNmPqXX/KMWm806ndMuANqheCq3j79eOZM=;
        b=B4nPrz1njGXIr6NNKYnp0nKvnosDuoC2dVYeesemowDOjcKJ/TCsH3Dp5fNN6d7Bfs
         Z18lMaQQDzB4Mr+l74mN3AJobWJibMWbngKfzrxPwwA19uBVXyk2h/fjw4TdbSGr5tdk
         8f1R1J4mtr1BX590uumFLmjvvX7n/K/Dozlo74H6NKkugr7NsVaFVhEbP+bZuPFURvIf
         dKhs61vEvpRfCF/PgiGLiQ4DCcCgfZ3HYJcgljDPkOXOcYpYo2DBuI0hnmFAEdZGYxnE
         oCN/F7LDbe3rU45aLOmNw9J+PAvjkUXRD77fhMiymOenh10+fDpP/Vdv9cqJ4Fc6AP7S
         NqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738920994; x=1739525794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UxAd+wsP4rNmPqXX/KMWm806ndMuANqheCq3j79eOZM=;
        b=s+U3jQ7TISb77cycWq03UgX1n9d5gk7V9sAD72XYaQVdPNd5WGuARkzwAw6CU2YeB4
         yTcLEHd1RmAgHW3D/4QLzrNZ+7toHE81yuqXMvcEoF9BXMYrOjUDqvaiTQCNjCWtGvHQ
         G/g7WU4kDNejuKvatq+kYAHQqDeOsTMrldUHWXoK5u+KyMjnOjsC4zhD9xCqN/laYtCx
         sCncsp7rSO+douCVrjq/+HLls9IhN0rN1MIagxciZnJNPLnz2opk8bQBjZvxbQai6kkn
         KwbSpdxmEN7OsCoTR/H+G3K4imcNRxcxCvbQi0hvpfcIv1TyMhDN58rsBvXxV/5K4+Tq
         qFCQ==
X-Gm-Message-State: AOJu0YxBHXe41JQcT9B24ah26LUlLKbpR4laDKViw/hWg3P1tzjvkKMt
	RkZoeCscsrNGsOEI+XbWSs1ZJDvzwpLJ8gxF1PvltQNYQJMj6315j2WttGIlxUjt13GzI/VXv18
	5oX6RVtxv9IIasMo7chC7nMaaTec=
X-Gm-Gg: ASbGncs+CkyRN+wc66sQihWGR0vF7YpcB3t0z433jt6nwXr+NuyYBecreqp2TFlOrdU
	9lOX8fGlMWESSgxftnUkfn76J9tyGOzve4II2v326HrJgA0wL2GstFzizk5ComcOYF5ossegU
X-Google-Smtp-Source: AGHT+IGo/uJ1hF9uUEbIAH1y5DexuYdoUSh7yPXUBhYk0+92mVrHuJvz1uOfIidNZqWw+LMTSJQC55ZwNl2POIXDQz8=
X-Received: by 2002:a05:651c:b29:b0:2fb:5f9d:c284 with SMTP id
 38308e7fff4ca-307e57f1261mr5951821fa.16.1738920993771; Fri, 07 Feb 2025
 01:36:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205092721.9395-1-bhe@redhat.com>
In-Reply-To: <20250205092721.9395-1-bhe@redhat.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Fri, 7 Feb 2025 17:36:17 +0800
X-Gm-Features: AWEUYZn0JchtBZ8RpZTIzLjInmmvLD0sspPwMPXYQhMeK7CoUUz74RS9cnxhyDk
Message-ID: <CAMgjq7C_93Z8abbBb7Jfjd3iMAAs8EeLBmPOeXrR96NaVgz8cg@mail.gmail.com>
Subject: Re: [PATCH 00/12] Tiny cleanup and improvements about SWAP code
To: Baoquan He <bhe@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	akpm@linux-foundation.org, chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 5:27=E2=80=AFPM Baoquan He <bhe@redhat.com> wrote:
>
> These are all made during reviewing and learning below patchset from
> Kairui.

Thanks, I've noticed some obsolete comments and code, currently
refactoring many parts so some of the functions would be just gone
someday.
But this surely cleans things up and is good to have, refactoring will
take much longer time to happen.

With the V2 update of "mm/swapfile.c: update the code comment above
swap_count_continued()":

Reviewed-by: Kairui Song <kasong@tencent.com>

> [PATCH v3 00/13] mm, swap: rework of swap allocator locks

BTW, I noticed most patches here are patching legacy code, and not
directly related to that series.
Just to clarify, so people won't need to worry about missing "Fixes:"
or things like that :)
