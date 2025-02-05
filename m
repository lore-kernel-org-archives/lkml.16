Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13214C76
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 17:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738775257; cv=none; b=X0GIDcp6HDS3ZqfwqBVE5Y3jewH1STOXKpiOcMquOy6LFxc5AYk4W7nQDHqH8wPXqmC+uZCXZ2TIky3XbaRFiF+2pUArA0cJaGmVyaIhwm3BvtbQq9z4ok85fPtbBpBO/ZTUzRJUGFDa+l9rFkIanS2njMXlmqD86ZDCfe8A+KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738775257; c=relaxed/simple;
	bh=Axisx3pm6bDPHSIJCNK/7TzK1kfoFFEX/IWdwqu26wM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e7DNwPTN7j8mvgCVMuULmfcgMiKixY4uOqNAjroCvw1JvotjSNjXciBA2uC9b+JQSMgucpE4w/uz2kbX2YQXLMKBXbPhNvUQ0cYTwS9qSkOVhv34GtB8nqYNiFnacmpTjrOIP0fOCTW2tvGOFUiqPb7PS0aHKTnck0DexgDhpQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPp4yLuv; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPp4yLuv"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30615661f98so74575661fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 09:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738775253; x=1739380053; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9pzUnI3bZpyKxMnavBeRYl/Cm9qoQVfi6VhDVIZsWY=;
        b=bPp4yLuv++Vytm5NOl15Rdmlo+IJ849PRVUBhMYAZWFqF+F59wEw1xcAUpQ4I/FqFu
         USzQC+7gHkxT9n70YYHHjZLfSXcts0xy1JNJXMSWuZ14bTsCKBjkR+PG0QCVZml/Engb
         +NQPfuYFRVWyzt72Zq4ikM7Hw/4ea3PAVgeqqcgf4Dq4YGIs0E6pp5vLmeR3R0yBhelr
         yWDmyOvDH0Vmg4E00HRdLn5UveB6gHqh8T1A8KmvMjssDlg6YGq6IT8Jvv3UWgDr9BnM
         APUqfgpmWdcSOGwSg6XautObkBxnUMX7JgNxoPrHQ8ijxPvr1Enzxn0j29HyP4TJyT+1
         Z4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738775253; x=1739380053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9pzUnI3bZpyKxMnavBeRYl/Cm9qoQVfi6VhDVIZsWY=;
        b=u5tbtBnK/750/PndWPaFjxOw5CIbMCtlQycqRC5242up3N8Zp3nSGVDXajIr0zH4Vg
         cfOEXbk71iAO00kQDchghtG8qvXk6TBEieUFUi8uD+aNsJuf9vtWHYYzLTITsNDHM5qD
         r5cPmG1aAPii8M2clyTwyt5rSnhm3Q1qRd1+pWdQUJzg98GpgsXMmUsTl4DrcZ+k0ibz
         EcqT8NzQHDJ1TgN2Gdet7t8HZnJBW7HDRoHAPcpocA1dGe3KqeMLCiZF7kwFBUAtzDN8
         ewWyTPYZEB3MyzLHHOOjIf73PfCO9+teSlYd1qIuPfXabPs0bX5wdLbsV5yhH3YJv27H
         zNlw==
X-Gm-Message-State: AOJu0Ywr4bEg0ekZzm9DeSVeD/2AZO6Hbd42CEO7D+X8dCVy2gsx6s5O
	bSZAd9v8YpRVqXcomrJXi4b8OdG1lN6DxQxz1/pyKcuwtlos58wIMw7zQRAySDhPaMDsxWqF1By
	o43i72HZz5yiAw9gw0dXEcybxFK8=
X-Gm-Gg: ASbGncu5oRZiNj4uIuwtvJ/+l8WLOF7uZzAngabnq/h7PibFsPGseb44QGJxD0aORbo
	hH02CIAO6Vwl9IqgGxz86vITTszMyb8Qcg7MhHlRl+N307z8F1r2CH5CWqy4x5oS8h00vqWs2
X-Google-Smtp-Source: AGHT+IFGjnhHLKHodIf984gizCKLmKMe7YT6eOLnmzkUks/Hf+ZbBdeTnbF55hu3gaNh8CaCJPekENWFL+E8zYhy7Rk=
X-Received: by 2002:a2e:a903:0:b0:2ff:d2e4:8dd9 with SMTP id
 38308e7fff4ca-307cf39fa40mr12766311fa.32.1738775252384; Wed, 05 Feb 2025
 09:07:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205092721.9395-1-bhe@redhat.com> <20250205092721.9395-5-bhe@redhat.com>
In-Reply-To: <20250205092721.9395-5-bhe@redhat.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 6 Feb 2025 01:07:14 +0800
X-Gm-Features: AWEUYZnzzofmPTfLgwnGGoJnYW4s7f9RdzKu-o6rq2ipILrHLFros8h4VJ03nvI
Message-ID: <CAMgjq7CYC4xfAkp9Y7g=3rw=iqTj_pQAjrnwDC1orkdUhnOCSQ@mail.gmail.com>
Subject: Re: [PATCH 04/12] mm/swap: skip scanning cluster range if it's empty cluster
To: Baoquan He <bhe@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	akpm@linux-foundation.org, chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 5:27=E2=80=AFPM Baoquan He <bhe@redhat.com> wrote:
>
> Since ci->lock has been taken when isolating cluster from
> si->free_clusters or taking si->percpu_cluster->next[order],
> it's unnecessary to scan and check the cluster range availability
> if i'ts empty cluster, and this can accelerate the huge page
> swapping.
>
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  mm/swapfile.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 9c9a4ec6d4c6..61efde853eea 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -729,6 +729,9 @@ static bool cluster_scan_range(struct swap_info_struc=
t *si,
>         unsigned long offset, end =3D start + nr_pages;
>         unsigned char *map =3D si->swap_map;
>
> +       if (cluster_is_empty(ci))
> +               return true;
> +

Hi Baoquan,

Thanks for the series.

Most commits are looking great, but this one is a bit questionable.
cluster_scan_range is only called by alloc_swap_scan_cluster, and it
already checks if the cluster has enough empty slots to use, so this
might be redundant.

It is possible that cluster_scan_range sees an empty cluster if the
cluster lock was dropped for reclaiming HAS_CACHE, but the chance
should be extremely low, that this might be a negative optimization.
